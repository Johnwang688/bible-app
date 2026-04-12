/**
 * Reads every file in ./batch-chunks (default) or BATCHES_DIR, sends (master prompt + file) to Gemini,
 * writes raw responses to ./outputs. Stateless: one generateContent per file (no chat history).
 *
 * Model is always Gemini 2.5 Flash (API id: gemini-2.5-flash). No env override.
 *
 * Env (from process env or repo-root .env):
 *   GEMINI_API_KEY or GOOGLE_API_KEY — required
 *   MASTER_PROMPT_PATH — optional path to prompt file (default: ./prompt.md next to this script)
 *   BATCHES_DIR — optional; default quiz-questions/batch-chunks (use quiz-questions/batches for legacy one-file-per-book)
 *   OUTPUTS_DIR — optional; default quiz-questions/outputs
 *   DELAY_MS — optional delay between successful requests (default 10000). Lower e.g. 3000 if quotas allow.
 *   GEMINI_MAX_OUTPUT_TOKENS — optional; default 131072 (raise if your API tier allows; does not auto-size batches)
 *   BATCH_LIMIT — optional; if set (e.g. 5), only process the first N batch files after sort (for testing)
 *   RETRY_MAX — optional; retries per request on 429/503/502 (default 10)
 *   RETRY_BASE_MS — optional; first backoff delay (default 15000), then doubles (+ jitter)
 *   SKIP_EXISTING — optional; if "1", skip batch when matching .json already exists in OUTPUTS_DIR (resume)
 *   MERGE_BY_BOOK — optional; default "1". Chunk outputs *-chNNN-NNN.json merge into outputs/by-book/<slug>.json
 *   QUIZ_STRICT_VALIDATION — optional; default on. Set "0" to only check JSON array parse (not recommended).
 *   QUIZ_MAX_EXPLANATION_CHARS — optional; max explanation length (default 1200) for strict validation.
 */

import { existsSync, readFileSync } from "node:fs";
import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import dotenv from "dotenv";
import { GoogleGenerativeAI } from "@google/generative-ai";
import {
  bookSlugFromChunkBaseName,
  mergeAndSort,
  parseQuizJsonArray,
  stripMarkdownFence,
} from "./merge-quiz-json.mjs";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.join(__dirname, "..");

/** Merge KEY=value pairs from a file into process.env (UTF-8 BOM stripped). */
function mergeEnvFile(filePath) {
  if (!existsSync(filePath)) return;
  const raw = readFileSync(filePath, "utf8").replace(/^\uFEFF/, "");
  const parsed = dotenv.parse(raw);
  for (const [key, value] of Object.entries(parsed)) {
    if (value !== undefined) process.env[key] = value;
  }
}

function loadEnv() {
  const rootEnv = path.join(repoRoot, ".env");
  dotenv.config({ path: rootEnv, override: true });
  mergeEnvFile(rootEnv);

  const cwdEnv = path.join(process.cwd(), ".env");
  if (cwdEnv !== rootEnv) {
    dotenv.config({ path: cwdEnv, override: true });
    mergeEnvFile(cwdEnv);
  }
}

loadEnv();

/** Gemini 2.5 Flash — fixed for all requests (Google AI model id). */
const GEMINI_25_FLASH_MODEL = "gemini-2.5-flash";
const DEFAULT_DELAY_MS = 10_000;
/** Gemini allows large outputs; raise default so JSON is less likely to truncate mid-array. */
/** 2.5 Flash supports large outputs; raise if chunks still hit MAX_TOKENS */
const DEFAULT_MAX_OUTPUT_TOKENS = Number(
  process.env.GEMINI_MAX_OUTPUT_TOKENS || 131072
);

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function getHttpStatus(err) {
  return err?.status ?? err?.statusCode ?? err?.cause?.status;
}

function isRetriableApiError(err) {
  const s = getHttpStatus(err);
  return s === 429 || s === 500 || s === 502 || s === 503;
}

async function withRetries(fn, label) {
  const max = Math.max(1, parseInt(process.env.RETRY_MAX || "10", 10));
  const baseMs = Math.max(1000, parseInt(process.env.RETRY_BASE_MS || "15000", 10));
  let lastErr;
  for (let attempt = 1; attempt <= max; attempt++) {
    try {
      return await fn();
    } catch (err) {
      lastErr = err;
      if (!isRetriableApiError(err) || attempt === max) throw err;
      const wait = baseMs * 2 ** (attempt - 1) + Math.floor(Math.random() * 3000);
      console.error(
        `\n  ${label}: ${getHttpStatus(err) ?? "error"} — retry ${attempt}/${max} in ${(wait / 1000).toFixed(0)}s…`
      );
      await sleep(wait);
    }
  }
  throw lastErr;
}

async function mergeChunkIntoByBook(outputsDir, chunkBaseName, cleanedText) {
  const mergeOn =
    process.env.MERGE_BY_BOOK !== "0" && process.env.MERGE_BY_BOOK !== "false";
  if (!mergeOn) return;
  const slug = bookSlugFromChunkBaseName(chunkBaseName);
  if (!slug) return;

  let incoming;
  try {
    incoming = parseQuizJsonArray(cleanedText);
  } catch {
    console.error(`\n  (merge skipped: invalid JSON for ${chunkBaseName})`);
    return;
  }

  const byBookDir = path.join(outputsDir, "by-book");
  await fs.mkdir(byBookDir, { recursive: true });
  const mergedPath = path.join(byBookDir, `${slug}.json`);

  let existing = [];
  try {
    const prev = await fs.readFile(mergedPath, "utf8");
    existing = JSON.parse(prev);
    if (!Array.isArray(existing)) existing = [];
  } catch {
    existing = [];
  }

  const merged = mergeAndSort(existing, incoming);
  await fs.writeFile(mergedPath, JSON.stringify(merged, null, 2), "utf8");
  console.error(`     merged → by-book/${slug}.json (${merged.length} questions)`);
}

/** Take content after the first markdown `---` block (matches prompt.md layout). */
function extractMasterPromptFromMarkdown(raw) {
  const sep = "\n---\n";
  const i = raw.indexOf(sep);
  if (i === -1) return raw.trim();
  return raw.slice(i + sep.length).trim();
}

async function readMasterPrompt() {
  const masterPath =
    process.env.MASTER_PROMPT_PATH ||
    path.join(__dirname, "prompt.md");
  const raw = await fs.readFile(masterPath, "utf8");
  return extractMasterPromptFromMarkdown(raw);
}

async function main() {
  const apiKey =
    (process.env.GEMINI_API_KEY || "").trim() ||
    (process.env.GOOGLE_API_KEY || "").trim();
  if (!apiKey) {
    const expected = path.join(repoRoot, ".env");
    const lines = [
      "Missing GEMINI_API_KEY (or GOOGLE_API_KEY).",
      `Put it in: ${expected}`,
      "Format: GEMINI_API_KEY=your_key (no quotes). Save the file.",
      "If it still fails: your shell may export an empty GEMINI_API_KEY — run: export -n GEMINI_API_KEY",
    ];
    try {
      const st = await fs.stat(expected);
      lines.push(`(Debug: .env exists, ${st.size} bytes — if the key is there, try export -n GEMINI_API_KEY)`);
    } catch {
      lines.push(`(Debug: no file at ${expected} — wrong folder or .env not saved to disk)`);
    }
    console.error(lines.join("\n"));
    process.exit(1);
  }

  const modelId = GEMINI_25_FLASH_MODEL;
  const delayMs = Number(process.env.DELAY_MS ?? DEFAULT_DELAY_MS);
  const batchesDir = process.env.BATCHES_DIR
    ? path.resolve(process.cwd(), process.env.BATCHES_DIR)
    : path.join(__dirname, "batch-chunks");
  const outputsDir = process.env.OUTPUTS_DIR
    ? path.resolve(process.cwd(), process.env.OUTPUTS_DIR)
    : path.join(__dirname, "outputs");

  await fs.mkdir(outputsDir, { recursive: true });

  const masterPrompt = await readMasterPrompt();
  if (!masterPrompt) {
    console.error("Master prompt is empty. Check MASTER_PROMPT_PATH / prompt.md.");
    process.exit(1);
  }

  const entries = await fs.readdir(batchesDir, { withFileTypes: true });
  let files = entries
    .filter(
      (e) =>
        e.isFile() &&
        !e.name.startsWith(".") &&
        e.name.toLowerCase().endsWith(".txt")
    )
    .map((e) => e.name)
    .sort();

  const limitRaw = process.env.BATCH_LIMIT;
  if (limitRaw) {
    const n = Math.max(0, parseInt(limitRaw, 10));
    if (!Number.isNaN(n) && n > 0) files = files.slice(0, n);
  }

  if (files.length === 0) {
    console.error(`No files in ${batchesDir}`);
    process.exit(1);
  }

  console.error(`Model: ${modelId}`);
  console.error(`Batches: ${batchesDir} (${files.length} file(s)${limitRaw ? `, BATCH_LIMIT=${limitRaw}` : ""})`);
  console.error(`Outputs: ${outputsDir}`);
  console.error(`Delay between requests: ${delayMs} ms`);
  const skipExisting = process.env.SKIP_EXISTING === "1" || process.env.SKIP_EXISTING === "true";
  if (skipExisting) {
    console.error(
      `SKIP_EXISTING: skip when a chunk .json exists and passes strict quiz validation (empty/invalid/malformed are regenerated)`
    );
  }
  const mergeByBook =
    process.env.MERGE_BY_BOOK !== "0" && process.env.MERGE_BY_BOOK !== "false";
  if (mergeByBook) console.error(`MERGE_BY_BOOK: chunk files also update outputs/by-book/<slug>.json`);
  console.error("");

  for (let i = 0; i < files.length; i++) {
    const name = files[i];
    const outName = `${path.parse(name).name}.json`;
    const outPath = path.join(outputsDir, outName);
    if (skipExisting) {
      let skipThisFile = false;
      let existingForMerge = "";
      try {
        await fs.access(outPath);
        existingForMerge = await fs.readFile(outPath, "utf8");
        if (!existingForMerge.trim()) {
          console.error(
            `[${i + 1}/${files.length}] ${name} … empty file, regenerating`
          );
        } else {
          try {
            parseQuizJsonArray(existingForMerge);
            skipThisFile = true;
          } catch {
            console.error(
              `[${i + 1}/${files.length}] ${name} … invalid/truncated JSON, regenerating`
            );
          }
        }
      } catch {
        /* missing file — generate */
      }
      if (skipThisFile) {
        console.error(
          `[${i + 1}/${files.length}] ${name} … skip (valid: ${outName})`
        );
        await mergeChunkIntoByBook(
          outputsDir,
          path.parse(name).name,
          stripMarkdownFence(existingForMerge)
        );
        if (i < files.length - 1) await sleep(delayMs);
        continue;
      }
    }

    const batchPath = path.join(batchesDir, name);
    const batchBody = await fs.readFile(batchPath, "utf8");

    const userPayload = [
      masterPrompt.trim(),
      "",
      "---",
      "",
      "Batch / supplementary instructions or source text:",
      "",
      batchBody,
    ].join("\n");

    // Fresh call each time: new client + model so no session state is reused.
    const genAI = new GoogleGenerativeAI(apiKey);
    const model = genAI.getGenerativeModel({
      model: modelId,
      generationConfig: {
        maxOutputTokens: DEFAULT_MAX_OUTPUT_TOKENS,
        responseMimeType: "application/json",
        temperature: 0.35,
      },
    });

    const t0 = Date.now();
    process.stderr.write(`[${i + 1}/${files.length}] ${name} … `);

    let text;
    try {
      const result = await withRetries(
        () => model.generateContent(userPayload),
        name
      );
      const fr = result.response?.candidates?.[0]?.finishReason;
      if (fr === "MAX_TOKENS") {
        console.error(
          "\n  warning: MAX_TOKENS — output was cut off mid-JSON. This batch will fail validation.\n" +
            "  Fix: regenerate batch files with fewer chapters per request (default is now 3):\n" +
            "       npm run quiz:write-chapter-batches\n" +
            "  If it still truncates, try CHAPTER_CHUNK=2 … write-chapter-batches, or set GEMINI_MAX_OUTPUT_TOKENS higher if your API tier allows.\n"
        );
      }
      text = result.response.text();
    } catch (err) {
      console.error("failed");
      console.error(err);
      process.exitCode = 1;
      continue;
    }

    const cleaned = stripMarkdownFence(text);
    let jsonOk = true;
    try {
      parseQuizJsonArray(cleaned);
    } catch (e) {
      jsonOk = false;
      let truncHint = "";
      if (/unexpected end|unterminated string|end of json input/i.test(String(e.message))) {
        truncHint =
          "\n  (This is almost always **truncated output** — the model ran out of output space. " +
          "Regenerate `batch-chunks/` with smaller slices: `npm run quiz:write-chapter-batches` [default 3 ch/file], " +
          "or `CHAPTER_CHUNK=2 npm run quiz:write-chapter-batches`. Then remove bad `.invalid.json` files and re-run.)\n";
      }
      console.error(
        `\n  INVALID (${outName}): ${e.message}. ` +
          `Not writing ${outName} (so SKIP_EXISTING will retry). Raw response saved as .invalid.json. ` +
          `Not merging into by-book.\n`
      );
      if (truncHint) console.error(truncHint);
      process.exitCode = 1;
    }

    const elapsed = ((Date.now() - t0) / 1000).toFixed(1);
    if (!jsonOk) {
      const invalidPath = outPath.replace(/\.json$/i, "") + ".invalid.json";
      await fs.writeFile(invalidPath, cleaned, "utf8");
      console.error(
        `→ ${path.basename(invalidPath)} (${cleaned.length} chars, ${elapsed}s) — invalid, no ${outName}`
      );
    } else {
      await fs.writeFile(outPath, cleaned, "utf8");
      console.error(`→ ${outName} (${cleaned.length} chars, ${elapsed}s)`);
      await mergeChunkIntoByBook(outputsDir, path.parse(name).name, cleaned);
    }

    if (i < files.length - 1) await sleep(delayMs);
  }
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
