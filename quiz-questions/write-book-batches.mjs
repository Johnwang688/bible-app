/**
 * Writes quiz-questions/batches/<slug>.txt for Old Testament books only (WEB numbers 1–39).
 * New Testament batches are omitted (generate separately if needed).
 * Run: node quiz-questions/write-book-batches.mjs
 */

import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

/** Mirrors app/core/book_catalog.py BOOK_DATA (number + English name). */
const BOOKS = [
  [1, "Genesis"],
  [2, "Exodus"],
  [3, "Leviticus"],
  [4, "Numbers"],
  [5, "Deuteronomy"],
  [6, "Joshua"],
  [7, "Judges"],
  [8, "Ruth"],
  [9, "1 Samuel"],
  [10, "2 Samuel"],
  [11, "1 Kings"],
  [12, "2 Kings"],
  [13, "1 Chronicles"],
  [14, "2 Chronicles"],
  [15, "Ezra"],
  [16, "Nehemiah"],
  [17, "Esther"],
  [18, "Job"],
  [19, "Psalms"],
  [20, "Proverbs"],
  [21, "Ecclesiastes"],
  [22, "Song of Solomon"],
  [23, "Isaiah"],
  [24, "Jeremiah"],
  [25, "Lamentations"],
  [26, "Ezekiel"],
  [27, "Daniel"],
  [28, "Hosea"],
  [29, "Joel"],
  [30, "Amos"],
  [31, "Obadiah"],
  [32, "Jonah"],
  [33, "Micah"],
  [34, "Nahum"],
  [35, "Habakkuk"],
  [36, "Zephaniah"],
  [37, "Haggai"],
  [38, "Zechariah"],
  [39, "Malachi"],
];

function slug(name) {
  return name.toLowerCase().replace(/\s+/g, "");
}

function batchBody(bookNumber, bookName) {
  return [
    "## Parameters for this run (use with the master prompt)",
    "",
    `book_name: ${bookName}`,
    `book_number: ${bookNumber}`,
    "",
    "Instructions:",
    `- Wherever the master prompt says <book-name>, use: ${bookName}`,
    `- Set the JSON field book_number to ${bookNumber} on every question object.`,
    "- Follow the master prompt for scope (every chapter, difficulty stages, counts, JSON shape).",
    "- Output only the JSON array as required.",
    "",
  ].join("\n");
}

async function main() {
  const outDir = path.join(__dirname, "batches");
  await fs.mkdir(outDir, { recursive: true });

  for (const [num, name] of BOOKS) {
    const file = path.join(outDir, `${slug(name)}.txt`);
    await fs.writeFile(file, batchBody(num, name), "utf8");
  }

  console.error(`Wrote ${BOOKS.length} files to ${outDir}`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
