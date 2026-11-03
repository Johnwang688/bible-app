// What is spoken for a verse (decision 12), and how it is cut into utterances.
//
// Chrome stops speaking long utterances part-way (about 15 seconds, with network voices) and then
// never sends the end event. Speaking one verse per utterance avoids most of it; a long verse is
// cut further, at sentence and then clause punctuation, so no piece runs much past ten seconds at
// the chosen speed. The highlight stays on the verse across its pieces.
import { splitAlternateReadings } from '../reader/alternateReadings';
import type { SpeechGroup } from './language';

/** The verse text without the CUV's bracketed alternate readings (〔或作…〕), whitespace tidied. */
export function speakableText(text: string): string {
  return splitAlternateReadings(text)
    .filter((run) => !run.note)
    .map((run) => run.text)
    .join('')
    .replace(/\s+/g, ' ')
    .trim();
}

/** Characters spoken per second at rate 1 (rough, on the slow side). */
const CHARS_PER_SECOND: Record<SpeechGroup, number> = { en: 14, 'zh-Hans': 4.5, 'zh-Hant': 4.5 };
const SECONDS_PER_PIECE = 10;
const MIN_PIECE = 24;

export function maxPieceLength(group: SpeechGroup, rate: number): number {
  return Math.max(MIN_PIECE, Math.floor(CHARS_PER_SECOND[group] * rate * SECONDS_PER_PIECE));
}

const SENTENCE_END = /(?<=[.!?。！？；;])\s*/u;
const CLAUSE_END = /(?<=[,，、:：—])\s*/u;

/** Cuts `text` into pieces of at most `max` characters, at the gentlest break that fits. */
export function chunkForSpeech(text: string, max: number): string[] {
  if (text.length <= max) return text ? [text] : [];
  const pieces: string[] = [];
  for (const sentence of text.split(SENTENCE_END)) {
    for (const clause of sentence.length > max ? sentence.split(CLAUSE_END) : [sentence]) {
      for (const part of clause.length > max ? splitAtSpaces(clause, max) : [clause]) {
        const last = pieces[pieces.length - 1];
        const joiner = last !== undefined && /[\x21-\x7e]$/.test(last) ? ' ' : '';
        if (last !== undefined && last.length + joiner.length + part.length <= max) {
          pieces[pieces.length - 1] = last + joiner + part;
        } else if (part) {
          pieces.push(part);
        }
      }
    }
  }
  return pieces.map((p) => p.trim()).filter(Boolean);
}

/** Last resort: break at spaces, or hard every `max` characters (Chinese has no spaces). */
function splitAtSpaces(text: string, max: number): string[] {
  const out: string[] = [];
  let rest = text.trim();
  while (rest.length > max) {
    const space = rest.lastIndexOf(' ', max);
    const cut = space > max / 2 ? space : max;
    out.push(rest.slice(0, cut).trim());
    rest = rest.slice(cut).trim();
  }
  if (rest) out.push(rest);
  return out;
}
