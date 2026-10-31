// Colour-literal counter shared by the ratchet test and the baseline generator.
//
//   node scripts/color-literals-baseline.mjs   -> rewrites review-tests/color-literals-baseline.json
//
// A "colour literal" is a hex colour (#rgb, #rgba, #rrggbb, #rrggbbaa) or an
// rgb()/rgba()/hsl()/hsla() call (any case) whose first argument is a literal (optionally
// signed) number. Every hex in code or a CSS declaration value counts, even one inside an
// href/id attribute: a rare false positive is better than a hidden colour.
// var(...) references and color-mix() over vars are not literals.
// Components must use the --color-* tokens from src/styles/tokens.css instead.
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const SRC = path.join(ROOT, 'src');
export const BASELINE_PATH = path.join(ROOT, 'review-tests', 'color-literals-baseline.json');

// Functional notation with a literal first number: rgb(0 0 0), rgba(12,…), hsl(.5…).
// `rgb(var(--x) / 50%)` does not match because the first argument is not a number.
// Case-insensitive (RGB(, Hsl() and the number may be signed (hsl(-30 …), hsl(+30 …)).
const FUNC_RE = /\b(?:rgba?|hsla?)\(\s*[+-]?[\d.][^)\n]*\)?/gi;
// Hex colour: 3, 4, 6 or 8 digits, not followed by more word characters.
// The preceding character must not be a word char, '/', '&', '.', '-' or '%' (rules out
// URL fragments like "page.html#abc", "/#abc" and HTML entities like "&#123;").
const HEX_RE = /(?<![\w/&.%-])#(?:[0-9a-fA-F]{8}|[0-9a-fA-F]{6}|[0-9a-fA-F]{3,4})(?![\w-])/g;

/** Replace [start, end) with spaces, keeping newlines so line numbers stay valid. */
function blank(text, start, end) {
  return text.slice(0, start) + text.slice(start, end).replace(/[^\n]/g, ' ') + text.slice(end);
}

/**
 * Blank out comments (and, if `maskStrings`, string contents) while respecting strings,
 * so "https://x" is not mistaken for a // comment and "/* in a string" is not a comment.
 * `lineComments` enables // comments (TS/TSX only; CSS has none).
 */
function strip(source, { lineComments, maskStrings }) {
  let out = source;
  let i = 0;
  while (i < source.length) {
    const c = source[i];
    const n = source[i + 1];
    if (c === '/' && n === '*') {
      const end = source.indexOf('*/', i + 2);
      const stop = end === -1 ? source.length : end + 2;
      out = blank(out, i, stop);
      i = stop;
    } else if (lineComments && c === '/' && n === '/') {
      let stop = source.indexOf('\n', i);
      if (stop === -1) stop = source.length;
      out = blank(out, i, stop);
      i = stop;
    } else if (c === '"' || c === "'" || c === '`') {
      let j = i + 1;
      while (j < source.length && source[j] !== c) {
        if (source.charCodeAt(j) === 92) j++; // backslash: skip the escaped character
        else if (source[j] === '\n' && c !== '`') break; // unterminated: stop at end of line
        j++;
      }
      if (maskStrings) out = blank(out, i + 1, j);
      i = j + 1;
    } else {
      i++;
    }
  }
  return out;
}

function lineOf(text, index) {
  let line = 1;
  for (let i = 0; i < index; i++) if (text.charCodeAt(i) === 10) line++;
  return line;
}

function scan(text, regions) {
  const found = [];
  for (const [start, end] of regions) {
    const slice = text.slice(start, end);
    for (const re of [HEX_RE, FUNC_RE]) {
      re.lastIndex = 0;
      for (let m; (m = re.exec(slice)); ) {
        const literal = re === FUNC_RE ? m[0].replace(/\s+/g, ' ') : m[0];
        found.push({ index: start + m.index, literal });
      }
    }
  }
  found.sort((a, b) => a.index - b.index);
  return found.map((f) => ({ line: lineOf(text, f.index), literal: f.literal }));
}

/**
 * CSS: only declaration values count. The source is split into statements ending at
 * `;`, `{` or `}`. A statement ending in `{` is a selector or at-rule prelude, so `#id`
 * selectors are skipped; the others are declarations and we scan the part after the first `:`.
 * Strings and url(...) bodies are masked first (data URIs contain `;` and `#`).
 */
export function findInCss(source) {
  let text = strip(source, { lineComments: false, maskStrings: true });
  text = text.replace(/url\(([^)]*)\)/gi, (m, body) => 'url(' + ' '.repeat(body.length) + ')');
  const regions = [];
  let start = 0;
  for (let i = 0; i < text.length; i++) {
    const c = text[i];
    if (c !== ';' && c !== '{' && c !== '}') continue;
    if (c !== '{') {
      const colon = text.indexOf(':', start);
      if (colon !== -1 && colon < i) regions.push([colon + 1, i]);
    }
    start = i + 1;
  }
  return scan(text, regions);
}

/** TS/TSX: colours live in string literals and template strings, so scan everything but comments. */
export function findInScript(source) {
  const text = strip(source, { lineComments: true, maskStrings: false });
  return scan(text, [[0, text.length]]);
}

/** Returns [{ line, literal }] for one file's source, chosen by extension. */
export function findColorLiterals(source, ext) {
  return ext === '.css' ? findInCss(source) : findInScript(source);
}

function walk(dir, out = []) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) walk(full, out);
    else if (/\.(css|tsx?)$/.test(entry.name)) out.push(full);
  }
  return out;
}

/** Map of "src/…" path (forward slashes) -> [{ line, literal }] for every css/ts/tsx file under src/. */
export function scanTree() {
  const result = {};
  for (const file of walk(SRC).sort()) {
    const rel = path.relative(ROOT, file).split(path.sep).join('/');
    result[rel] = findColorLiterals(fs.readFileSync(file, 'utf8'), path.extname(file));
  }
  return result;
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const baseline = {};
  for (const [file, hits] of Object.entries(scanTree())) if (hits.length > 0) baseline[file] = hits.length;
  fs.writeFileSync(BASELINE_PATH, JSON.stringify(baseline, null, 2) + '\n');
  const total = Object.values(baseline).reduce((a, b) => a + b, 0);
  console.log(`Wrote ${BASELINE_PATH}: ${Object.keys(baseline).length} files, ${total} literals`);
}
