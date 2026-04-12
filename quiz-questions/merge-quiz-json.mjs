/**
 * Pure helpers + merge logic for quiz JSON arrays (used by run-gemini-batches.mjs).
 */

/** e.g. "1chronicles-ch001-005" -> "1chronicles"; "genesis-ch031-035" -> "genesis" */
export function bookSlugFromChunkBaseName(base) {
  const m = base.match(/^(.+)-ch\d+-\d+$/i);
  return m ? m[1] : null;
}

/** Remove leading/trailing ```json fences; works even if the response was cut off before a closing ``` */
export function stripMarkdownFence(text) {
  let t = text.trim();
  if (t.startsWith("```")) {
    t = t.replace(/^```(?:json)?\s*\r?\n?/i, "");
    t = t.replace(/\r?\n?```\s*$/m, "");
  }
  return t.trim();
}

/** Keys that must appear exactly once per question object (prompt.md). */
export const QUIZ_REQUIRED_KEYS = [
  "book_number",
  "chapter",
  "difficulty_stage",
  "prompt",
  "choices_json",
  "correct_answer",
  "explanation",
];

/**
 * JSON.parse accepts duplicate keys (last wins), so invalid model output can "parse."
 * Count top-level key patterns in the raw text; if they disagree, an object likely
 * repeated a key (e.g. two `"prompt":` in one object).
 */
export function assertKeyParityInRawJson(raw) {
  const trimmed = raw.trim();
  if (trimmed === "[]") return;
  const bn = (trimmed.match(/"book_number":/g) || []).length;
  const pr = (trimmed.match(/"prompt":/g) || []).length;
  const ch = (trimmed.match(/"chapter":/g) || []).length;
  const cj = (trimmed.match(/"choices_json":/g) || []).length;
  if (bn !== pr || bn !== ch || bn !== cj) {
    throw new Error(
      `Key pattern mismatch in raw JSON (book_number=${bn}, chapter=${ch}, prompt=${pr}, choices_json=${cj}). Same counts expected — often duplicate keys in one object.`
    );
  }
}

const EXPLANATION_META_START =
  /^(Sorry|Let's|I need to|Wait,|I misread|I incorrectly|I apologize|Note: I|Correction:|As an AI)/i;

export function validateQuizQuestion(obj, index) {
  if (typeof obj !== "object" || obj === null) {
    throw new Error(`Item ${index}: not an object`);
  }
  const keys = Object.keys(obj);
  if (keys.length !== QUIZ_REQUIRED_KEYS.length) {
    throw new Error(
      `Item ${index}: expected ${QUIZ_REQUIRED_KEYS.length} keys, got ${keys.length}`
    );
  }
  for (const k of QUIZ_REQUIRED_KEYS) {
    if (!(k in obj)) throw new Error(`Item ${index}: missing ${k}`);
  }
  for (const k of keys) {
    if (!QUIZ_REQUIRED_KEYS.includes(k)) {
      throw new Error(`Item ${index}: unexpected key ${k}`);
    }
  }
  if (!Number.isInteger(obj.book_number)) {
    throw new Error(`Item ${index}: book_number must be an integer`);
  }
  if (!Number.isInteger(obj.chapter) || obj.chapter < 1) {
    throw new Error(`Item ${index}: chapter must be an integer >= 1`);
  }
  if (
    !Number.isInteger(obj.difficulty_stage) ||
    obj.difficulty_stage < 1 ||
    obj.difficulty_stage > 5
  ) {
    throw new Error(`Item ${index}: difficulty_stage must be an integer from 1 to 5`);
  }
  if (typeof obj.prompt !== "string" || !obj.prompt.trim()) {
    throw new Error(`Item ${index}: prompt must be a non-empty string`);
  }
  if (!Array.isArray(obj.choices_json) || obj.choices_json.length !== 4) {
    throw new Error(`Item ${index}: choices_json must be an array of exactly 4 strings`);
  }
  for (let j = 0; j < 4; j++) {
    if (typeof obj.choices_json[j] !== "string" || !obj.choices_json[j].trim()) {
      throw new Error(`Item ${index}: choices_json[${j}] must be a non-empty string`);
    }
  }
  if (typeof obj.correct_answer !== "string" || !obj.correct_answer.trim()) {
    throw new Error(`Item ${index}: correct_answer must be a non-empty string`);
  }
  if (!obj.choices_json.includes(obj.correct_answer)) {
    throw new Error(
      `Item ${index}: correct_answer must be identical to one of the four choices_json strings`
    );
  }
  if (typeof obj.explanation !== "string" || !obj.explanation.trim()) {
    throw new Error(`Item ${index}: explanation must be a non-empty string`);
  }
  const maxExpl = parseInt(process.env.QUIZ_MAX_EXPLANATION_CHARS || "1200", 10);
  if (obj.explanation.length > maxExpl) {
    throw new Error(
      `Item ${index}: explanation too long (${obj.explanation.length} chars, max ${maxExpl})`
    );
  }
  if (EXPLANATION_META_START.test(obj.explanation.trim())) {
    throw new Error(
      `Item ${index}: explanation looks like meta/apology (disallowed opening) — see prompt.md`
    );
  }
}

export function validateQuizBank(data) {
  if (!Array.isArray(data)) throw new Error("Quiz output must be a JSON array");
  if (data.length === 0) {
    throw new Error("Quiz array must not be empty");
  }
  for (let i = 0; i < data.length; i++) {
    validateQuizQuestion(data[i], i);
  }
}

/**
 * Parse fence-stripped quiz JSON. With strict mode (default unless QUIZ_STRICT_VALIDATION=0):
 * rejects duplicate-key patterns in the raw text, empty arrays, and non-conforming items.
 */
export function parseQuizJsonArray(text, options = {}) {
  const strict =
    process.env.QUIZ_STRICT_VALIDATION !== "0" &&
    process.env.QUIZ_STRICT_VALIDATION !== "false" &&
    options.strict !== false;
  const raw = stripMarkdownFence(text);
  if (strict) {
    assertKeyParityInRawJson(raw);
  }
  const data = JSON.parse(raw);
  if (!Array.isArray(data)) throw new Error("Quiz output must be a JSON array");
  if (strict) {
    validateQuizBank(data);
  }
  return data;
}

function sortKey(q) {
  const ch = Number(q.chapter) || 0;
  const st = Number(q.difficulty_stage) || 0;
  const pr = String(q.prompt || "");
  return [ch, st, pr];
}

export function compareQuestions(a, b) {
  const ka = sortKey(a);
  const kb = sortKey(b);
  if (ka[0] !== kb[0]) return ka[0] - kb[0];
  if (ka[1] !== kb[1]) return ka[1] - kb[1];
  return ka[2].localeCompare(kb[2]);
}

/** Dedupe by chapter + difficulty_stage + prompt */
export function dedupeQuestions(items) {
  const seen = new Set();
  const out = [];
  for (const q of items) {
    const k = `${q.chapter}\0${q.difficulty_stage}\0${q.prompt}`;
    if (seen.has(k)) continue;
    seen.add(k);
    out.push(q);
  }
  return out;
}

export function mergeAndSort(existing, incoming) {
  return dedupeQuestions([...(existing || []), ...(incoming || [])]).sort(
    compareQuestions
  );
}
