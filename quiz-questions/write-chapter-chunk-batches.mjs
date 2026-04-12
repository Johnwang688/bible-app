/**
 * Writes one batch file per chapter chunk (OT only).
 *
 * Important: chunk size is NOT auto-calculated from the model’s output-token limit. It is a
 * fixed number of chapters per request (default 5). That usually keeps JSON under the limit
 * together with maxOutputTokens in run-gemini-batches.mjs — but it is not a guarantee.
 * If you see MAX_TOKENS in the runner logs, regenerate with a smaller CHAPTER_CHUNK (e.g. 3 or 2).
 *
 * Default: 3 chapters per file (smaller = less JSON truncation). Override: CHAPTER_CHUNK=5 npm run quiz:write-chapter-batches
 * Output: quiz-questions/batch-chunks/
 */

import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

/** [book_number, English name, chapter_count] — mirrors app/core/book_catalog.py (OT only). */
const OT_BOOKS = [
  [1, "Genesis", 50],
  [2, "Exodus", 40],
  [3, "Leviticus", 27],
  [4, "Numbers", 36],
  [5, "Deuteronomy", 34],
  [6, "Joshua", 24],
  [7, "Judges", 21],
  [8, "Ruth", 4],
  [9, "1 Samuel", 31],
  [10, "2 Samuel", 24],
  [11, "1 Kings", 22],
  [12, "2 Kings", 25],
  [13, "1 Chronicles", 29],
  [14, "2 Chronicles", 36],
  [15, "Ezra", 10],
  [16, "Nehemiah", 13],
  [17, "Esther", 10],
  [18, "Job", 42],
  [19, "Psalms", 150],
  [20, "Proverbs", 31],
  [21, "Ecclesiastes", 12],
  [22, "Song of Solomon", 8],
  [23, "Isaiah", 66],
  [24, "Jeremiah", 52],
  [25, "Lamentations", 5],
  [26, "Ezekiel", 48],
  [27, "Daniel", 12],
  [28, "Hosea", 14],
  [29, "Joel", 3],
  [30, "Amos", 9],
  [31, "Obadiah", 1],
  [32, "Jonah", 4],
  [33, "Micah", 7],
  [34, "Nahum", 3],
  [35, "Habakkuk", 3],
  [36, "Zephaniah", 3],
  [37, "Haggai", 2],
  [38, "Zechariah", 14],
  [39, "Malachi", 4],
];

function slug(name) {
  return name.toLowerCase().replace(/\s+/g, "");
}

function padCh(n, w) {
  return String(n).padStart(w, "0");
}

function batchBody(bookNumber, bookName, chapterStart, chapterEnd) {
  return [
    "## Parameters for this run (use with the master prompt)",
    "",
    `book_name: ${bookName}`,
    `book_number: ${bookNumber}`,
    `chapter_start: ${chapterStart}`,
    `chapter_end: ${chapterEnd}`,
    "",
    "Instructions:",
    `- Wherever the master prompt says <book-name>, use: ${bookName}`,
    `- Set the JSON field book_number to ${bookNumber} on every question object.`,
    `- **Scope:** Generate the quiz bank ONLY for chapters ${chapterStart} through ${chapterEnd} (inclusive). Do not include questions for any other chapter.`,
    `- Within this chapter range, follow the master prompt: all five difficulty stages per chapter, at least 7 questions per stage (prefer 10).`,
    "- Output only the JSON array as required.",
    "",
  ].join("\n");
}

async function main() {
  const chunk = Math.max(1, parseInt(process.env.CHAPTER_CHUNK || "3", 10));
  const outDir =
    process.env.BATCH_CHUNKS_DIR ||
    path.join(__dirname, "batch-chunks");
  await fs.mkdir(outDir, { recursive: true });

  let count = 0;
  const width = 3;

  for (const [num, name, totalCh] of OT_BOOKS) {
    const s = slug(name);
    for (let start = 1; start <= totalCh; start += chunk) {
      const end = Math.min(start + chunk - 1, totalCh);
      const fname = `${s}-ch${padCh(start, width)}-${padCh(end, width)}.txt`;
      const file = path.join(outDir, fname);
      await fs.writeFile(file, batchBody(num, name, start, end), "utf8");
      count++;
    }
  }

  console.error(`Wrote ${count} chunk files to ${outDir} (${chunk} chapter(s) per chunk)`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
