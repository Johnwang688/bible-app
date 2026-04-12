/**
 * Rebuild outputs/by-book/<slug>.json from all chunk files *-chNNN-NNN.json in outputs/.
 * Run after deleting by-book files or to fix merge state.
 * Each chunk must pass parseQuizJsonArray() (strict validation unless QUIZ_STRICT_VALIDATION=0).
 *
 *   node quiz-questions/rebuild-by-book.mjs
 */

import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import {
  bookSlugFromChunkBaseName,
  mergeAndSort,
  parseQuizJsonArray,
} from "./merge-quiz-json.mjs";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const outputsDir = process.env.OUTPUTS_DIR
  ? path.resolve(process.cwd(), process.env.OUTPUTS_DIR)
  : path.join(__dirname, "outputs");
const byBookDir = process.env.BY_BOOK_DIR
  ? path.resolve(process.cwd(), process.env.BY_BOOK_DIR)
  : path.join(outputsDir, "by-book");

const CHUNK_JSON = /^.+-ch\d+-\d+\.json$/i;

async function main() {
  const names = await fs.readdir(outputsDir);
  const bySlug = new Map();

  for (const name of names) {
    if (!CHUNK_JSON.test(name)) continue;
    const slug = bookSlugFromChunkBaseName(path.parse(name).name);
    if (!slug) continue;
    const text = await fs.readFile(path.join(outputsDir, name), "utf8");
    let arr;
    try {
      arr = parseQuizJsonArray(text);
    } catch (e) {
      console.error(`skip (bad JSON): ${name}`, e.message);
      continue;
    }
    const cur = bySlug.get(slug) || [];
    bySlug.set(slug, mergeAndSort(cur, arr));
  }

  await fs.mkdir(byBookDir, { recursive: true });
  for (const [slug, items] of [...bySlug.entries()].sort((a, b) =>
    a[0].localeCompare(b[0])
  )) {
    const p = path.join(byBookDir, `${slug}.json`);
    await fs.writeFile(p, JSON.stringify(items, null, 2), "utf8");
    console.error(`${slug}.json → ${items.length} questions`);
  }
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
