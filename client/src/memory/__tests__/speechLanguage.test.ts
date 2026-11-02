/**
 * Acceptance tests for the speech-language feature (普通话 / 粤语).
 * Ported from Little Lamb's tests/speech-language.ts. Covered: the allow-list
 * (S1), wire constants (S2), code-point invariance (S3), traditional-to-simplified
 * normalisation (S4, S4c), the override map (S4b), keyer dispatch and memoisation
 * (S6), client/server agreement (S7), language-blind chunk order (S8), diffHanzi
 * (S9), homophone tolerance (S10), the default keyer (S11), exact self-comparison
 * (S12) and the collateral bound (S13).
 *
 * Traditional text comes from the library (`textZhHant`, `chunksHant`: the
 * OpenCC cn->tw output), not from a converter. The source's cn->hk variant has
 * no counterpart in the library, so only tw is ported.
 *
 * Not ported here: S5 reads the `expected_pinyin` column that the port removed.
 */
import {
  DEFAULT_SPEECH_LANGUAGE,
  SPEECH_ASR_CODE,
  SPEECH_LANGUAGES,
  SPEECH_QUERY_PARAM,
  isSpeechLanguage,
  resolveSpeechLanguage,
  type SpeechLanguage,
} from '../speech/types';
import {
  MANDARIN_SYNC_KEYER,
  PROBE_FIXTURES,
  ZH_PUNCTUATION_CHAR,
  loadSpeechKeyer,
  stripZhPunctuation,
  type SpeechKeyer,
} from '../speech/keyer';
import { SCRIPT_OVERRIDES } from '../speech/normalize';
import {
  comparePinyin,
  compareRecital,
  diffHanzi,
  hanziToTonelessPinyin,
} from '../speech/pinyinDiff';
import { compareFullRecall } from '../speech/fullRecall';
import { gradeStep } from '../grading';
import { getAllMemoryVerses } from '../library';

const verses = getAllMemoryVerses();

/** Every seed string the grading path can ever be handed: verses + chunks. */
const seedStrings: string[] = [];
for (const v of verses) {
  seedStrings.push(v.textZh);
  for (const c of v.chunks) seedStrings.push(c);
}

/**
 * [simplified, traditional] for every seed string, the traditional side being the
 * library's OpenCC cn->tw output. The source's cn->hk rendering has no counterpart
 * in the library, so it is not ported.
 */
const seedPairs: [string, string][] = [];
for (const v of verses) {
  if (v.chunksHant.length !== v.chunks.length) {
    throw new Error(`chunksHant is not aligned with chunks for ${v.id}`);
  }
  seedPairs.push([v.textZh, v.textZhHant]);
  v.chunks.forEach((c, i) => seedPairs.push([c, v.chunksHant[i]!]));
}

const findVerse = (needle: string) => {
  const v = verses.find((x) => x.textZh.includes(needle));
  if (!v) throw new Error(`seed has no verse containing ${needle}`);
  return v;
};
/** 哥林多后书 5:17 — the S6/S10 workhorse. */
const v2Cor517 = verses.find((v) => v.textZh.startsWith('若有人在基督里'));
/** 诗篇 119:9 — carries 什么, the reason `from: 'tw'` is forbidden. */
const vPs1199 = findVerse('什么洁净');
/** 加拉太书 2:20 — carries 因信神的儿子. */
const vGal220 = findVerse('因信神的儿子');

/** Replace the code point at `index` (or delete it when `to` is null). */
function mutateAt(text: string, index: number, to: string | null): string {
  const chars = Array.from(text);
  if (to === null) chars.splice(index, 1);
  else chars[index] = to;
  return chars.join('');
}

function tokenCount(keyer: SpeechKeyer, text: string): number {
  return keyer.key(text).split(/\s+/).filter(Boolean).length;
}

let mandarin: SpeechKeyer;
let cantonese: SpeechKeyer;
let loadedKeyers: SpeechKeyer[];

beforeAll(async () => {
  mandarin = await loadSpeechKeyer('mandarin');
  cantonese = await loadSpeechKeyer('cantonese');
  loadedKeyers = [mandarin, cantonese];
});

describe('S. speech language', () => {
  it('S1 the allow-list admits exactly two values and defaults to Mandarin', () => {
    expect(isSpeechLanguage('mandarin')).toBe(true);
    expect(isSpeechLanguage('cantonese')).toBe(true);
    const junk: unknown[] = [
      undefined,
      null,
      '',
      'zh',
      'yue',
      'Mandarin',
      'MANDARIN',
      'cantonese ',
      0,
      1,
      {},
      [],
      ['cantonese'],
      '__proto__',
      'constructor',
    ];
    for (const value of junk) {
      expect(isSpeechLanguage(value)).toBe(false);
      expect(resolveSpeechLanguage(value)).toBe('mandarin');
    }
    expect(resolveSpeechLanguage('mandarin')).toBe('mandarin');
    expect(resolveSpeechLanguage('cantonese')).toBe('cantonese');
    expect(DEFAULT_SPEECH_LANGUAGE).toBe('mandarin');
  });

  // S2 is reduced: the storage key, metadata key and display labels are
  // client-only constants the port excludes, so they are not pinned here.
  it('S2 the wire constants are the ones both sides agree on', () => {
    expect(SPEECH_ASR_CODE).toEqual({ mandarin: 'zh', cantonese: 'yue' });
    expect(SPEECH_QUERY_PARAM).toBe('lang');
    expect([...SPEECH_LANGUAGES]).toEqual(['mandarin', 'cantonese']);
    for (const lang of SPEECH_LANGUAGES) {
      expect(SPEECH_ASR_CODE[lang]).toBeTruthy();
    }
    // What the route actually does with the query string.
    const ok = new URL('http://x/api/transcribe?lang=cantonese').searchParams.get('lang');
    expect(resolveSpeechLanguage(ok)).toBe('cantonese');
    const asrCode = new URL('http://x/api/transcribe?lang=yue').searchParams.get('lang');
    expect(resolveSpeechLanguage(asrCode)).toBe('mandarin'); // an ASR code is not a preference
  });

  it('S3 every keyer is 1:1 on code points, for both normalize and tokens', () => {
    const corpus = [...seedStrings, ...PROBE_FIXTURES, ...seedPairs.map(([, t]) => t)];
    const keyers: SpeechKeyer[] = [MANDARIN_SYNC_KEYER, ...loadedKeyers];
    for (const keyer of keyers) {
      for (const s of corpus) {
        const normalized = keyer.normalize(s);
        expect(Array.from(normalized).length).toBe(Array.from(s).length);
        // Count is not the whole contract. `diffHanzi` classifies each expected
        // code point on the NORMALISED string (that is what indexes its status
        // array) and renders the glyph from the ORIGINAL, so a normalisation
        // that moved a code point between the punctuation / whitespace /
        // content classes would paint a status against the wrong glyph.
        const src = Array.from(s);
        const norm = Array.from(normalized);
        for (let i = 0; i < src.length; i++) {
          expect(ZH_PUNCTUATION_CHAR.test(norm[i]!)).toBe(ZH_PUNCTUATION_CHAR.test(src[i]!));
          expect(/\s/.test(norm[i]!)).toBe(/\s/.test(src[i]!));
        }
        const stripped = stripZhPunctuation(normalized);
        const tokens = keyer.tokens(stripped);
        expect(tokens.length).toBe(Array.from(stripped).length);
        expect(tokens.every((t) => t.length > 0)).toBe(true);
      }
    }
    // The suite must be measuring the LOADED Mandarin keyer, not the degraded
    // fallback — otherwise S4's Mandarin half proves nothing.
    expect(mandarin).not.toBe(MANDARIN_SYNC_KEYER);
  });

  it('S4 a traditional transcript keys identically to the simplified verse', () => {
    for (const keyer of loadedKeyers) {
      for (const [simplified, traditional] of seedPairs) {
        expect(keyer.key(traditional)).toBe(keyer.key(simplified));
      }
      // Idempotent on already-simplified text — the transcript's script is
      // unknown, so the normaliser is applied unconditionally.
      for (const s of seedStrings) {
        expect(keyer.normalize(s)).toBe(s);
      }
    }
  });

  it('S4b the override map can never touch the expected side', () => {
    const forbidden = [...Object.keys(SCRIPT_OVERRIDES), '瞭', '幺'];
    expect(Object.keys(SCRIPT_OVERRIDES).sort()).toEqual(['藉', '著'].sort());
    for (const s of seedStrings) {
      for (const ch of forbidden) {
        expect(s.includes(ch)).toBe(false);
      }
    }
  });

  it('S4c the defect this fixes is real on the DEFAULT (Mandarin) path', () => {
    let diverged = 0;
    for (const v of verses) {
      if (MANDARIN_SYNC_KEYER.key(v.textZhHant) !== MANDARIN_SYNC_KEYER.key(v.textZh)) diverged++;
    }
    expect(diverged).toBeGreaterThanOrEqual(10);
    // Spot checks: the exact characters behind it.
    expect(MANDARIN_SYNC_KEYER.key('著')).not.toBe(MANDARIN_SYNC_KEYER.key('着'));
    expect(MANDARIN_SYNC_KEYER.key('於')).not.toBe(MANDARIN_SYNC_KEYER.key('于'));
    expect(cantonese.tokens('聽')[0]).not.toBe(cantonese.tokens('听')[0]);
    expect(cantonese.tokens('裡')[0]).not.toBe(cantonese.tokens('里')[0]);
    // …and all four are reconciled by the loaded keyers.
    expect(mandarin.key('著')).toBe(mandarin.key('着'));
    expect(mandarin.key('於')).toBe(mandarin.key('于'));
    expect(cantonese.key('聽')).toBe(cantonese.key('听'));
    expect(cantonese.key('裡')).toBe(cantonese.key('里'));
    // 诗篇 119:9 is why `from: 'tw'` is forbidden in the t2cn direction.
    expect(mandarin.normalize(vPs1199.textZh)).toBe(vPs1199.textZh);
  });

  it('S6 the two keyers key differently, and loading is memoised', async () => {
    for (const v of verses) {
      expect(cantonese.key(v.textZh)).not.toBe(mandarin.key(v.textZh));
    }
    expect(mandarin.language).toBe('mandarin');
    expect(cantonese.language).toBe('cantonese');
    expect(await loadSpeechKeyer('mandarin')).toBe(mandarin);
    expect(await loadSpeechKeyer('cantonese')).toBe(cantonese);
    expect(v2Cor517).toBeDefined(); // seed carries 哥林多后书 5:17
    // The character the two languages are most often compared on.
    expect(cantonese.key('神')).toBe('san');
    expect(mandarin.key('神')).toBe('shen');
  });

  it('S7 client and server recital helpers return the same verdict', () => {
    const v = v2Cor517!;
    const chars = Array.from(v.textZh);
    const transcripts = [
      v.textZh,
      v.textZhHant,
      mutateAt(v.textZh, chars.findIndex((c) => c === '人'), '仁'),
      `${v.textZh}啊`,
      '',
      '   ',
    ];
    for (const keyer of loadedKeyers) {
      for (const t of transcripts) {
        const fullTranscript = t.trim() ? `${v.referenceZh}。${t}` : t;
        const local = compareFullRecall(fullTranscript, v.textZh, v.referenceZh, keyer);
        const server = gradeStep(v.id, 'full-recall', { kind: 'recall', transcript: fullTranscript }, keyer);
        expect(server.passed).toBe(local.passed);
        // Unconditional, blanks included: `gradeStep` short-circuits an empty or
        // whitespace-only transcript to 0, and `compareRecital` reaches the same
        // 0 through an empty token array. A guard here would hide a divergence
        // on exactly the input a silent recording produces.
        expect(server.matchPct).toBe(local.body.matchPct);

        const chunk = v.chunks[0]!;
        const chunkTranscript = t === v.textZh ? chunk : t;
        const localChunk = compareRecital(chunkTranscript, chunk, keyer);
        const serverChunk = gradeStep(
          v.id,
          'fill-blank',
          { kind: 'recall', transcript: chunkTranscript, chunkPosition: 0 },
          keyer,
        );
        expect(serverChunk.passed).toBe(localChunk.passed);
        expect(serverChunk.matchPct).toBe(localChunk.matchPct);
      }
    }
  });

  it('S8 chunk-order grades identically under every keyer', () => {
    const v = verses.find((x) => x.chunks.length > 1)!;
    const identity = v.chunks.map((_, i) => i);
    const swapped = [...identity];
    [swapped[0], swapped[1]] = [swapped[1]!, swapped[0]!];

    const variants: (SpeechKeyer | undefined)[] = [undefined, mandarin, cantonese];
    for (const keyer of variants) {
      const ok = gradeStep(v.id, 'chunk-order', { kind: 'chunk-order', order: identity }, keyer);
      expect(ok.passed).toBe(true); // identity permutation passes
      expect(ok.matchPct).toBe(100);
      const bad = gradeStep(v.id, 'chunk-order', { kind: 'chunk-order', order: swapped }, keyer);
      expect(bad.passed).toBe(false); // swapped permutation fails
      const short = gradeStep(v.id, 'chunk-order', { kind: 'chunk-order', order: [0] }, keyer);
      expect(short.error).toBe('order must list every chunk exactly once');
    }
  });

  it('S9 diffHanzi reproduces the expected verse and renders simplified extras', () => {
    const v = v2Cor517!;
    const chars = Array.from(v.textZh);
    const subIdx = chars.findIndex((c) => c === '人');
    const cases = [
      v.textZh,
      mutateAt(v.textZh, subIdx, '仁'),
      v.textZhHant,
      `${v.textZh}哈利路亚`,
    ];
    for (const keyer of loadedKeyers) {
      for (const t of cases) {
        const diff = diffHanzi(t, v.textZh, keyer);
        const rebuilt = diff
          .filter((d) => d.status !== 'extra')
          .map((d) => d.char)
          .join('');
        expect(rebuilt).toBe(v.textZh);
      }
      // A purely traditional rendering of the right answer is not a mistake.
      const tradDiff = diffHanzi(v.textZhHant, v.textZh, keyer);
      expect(tradDiff.every((d) => d.status !== 'wrong' && d.status !== 'extra')).toBe(true);
      // The rendered diff must agree with the percentage printed beside it.
      // `compareRecital` keys through join(' ') + split on /\s+/, so a
      // whitespace token never reaches its aligner; `diffHanzi` has to drop the
      // same ones or it aligns a different pair of sequences and repaints the
      // verse against a score nothing else agrees with. Whitespace in a
      // transcript is real — Whisper emits it around Latin and digits.
      //
      // (Spacing every character legitimately COSTS points: readings are word
      // -trie derived, so isolating a character re-keys it. What is asserted is
      // agreement between the two, not a particular score.)
      const spacedCases = [
        Array.from(v.textZh).join(' '),
        `${v.textZh.slice(0, 4)} ${v.textZh.slice(4)}`,
        ` ${v.textZh} `,
      ];
      for (const t of spacedCases) {
        const comparison = compareRecital(t, v.textZh, keyer);
        const diff = diffHanzi(t, v.textZh, keyer);
        const tally = (status: string, list: { status: string }[]) =>
          list.filter((d) => d.status === status).length;
        expect(tally('correct', diff)).toBe(tally('match', comparison.diffTokens));
        expect(tally('extra', diff)).toBe(tally('extra', comparison.diffTokens));
        expect(diff.every((d) => d.status !== 'extra' || d.char.trim())).toBe(true);
      }

      // …and an extra the user really did say renders simplified.
      const extras = diffHanzi(`${v.textZhHant}還有`, v.textZh, keyer)
        .filter((d) => d.status === 'extra')
        .map((d) => d.char)
        .join('');
      expect(extras).toBe('还有');
    }
  });

  it('S10a each keyer tolerates its own homophones: Cantonese 新/神 (second 新)', () => {
    const v = v2Cor517!;
    const chars = Array.from(v.textZh);
    const score = (transcript: string, keyer: SpeechKeyer) =>
      compareRecital(transcript, v.textZh, keyer).matchPct;
    // Built by INDEX, never by String.replace: the FIRST 新 sits inside 新造,
    // so substituting there moves the neighbour's token (see S10d).
    const secondXin = chars.lastIndexOf('新');
    expect(secondXin).not.toBe(-1);
    expect(secondXin).not.toBe(chars.indexOf('新'));
    expect(score(mutateAt(v.textZh, secondXin, '神'), cantonese)).toBe(100); // 新/神 are both san
    expect(score(mutateAt(v.textZh, secondXin, '神'), mandarin)).toBeLessThan(100); // xin/shen differ
  });

  it('S10b each keyer tolerates its own homophones: Cantonese 因/人 in 因信神的儿子', () => {
    const yinIdx = vGal220.textZh.indexOf('因信神的儿子');
    expect(yinIdx).not.toBe(-1);
    const gMutated = mutateAt(
      vGal220.textZh,
      Array.from(vGal220.textZh.slice(0, yinIdx)).length,
      '人',
    );
    expect(compareRecital(gMutated, vGal220.textZh, cantonese).matchPct).toBe(100); // jan
    expect(compareRecital(gMutated, vGal220.textZh, mandarin).matchPct).toBeLessThan(100);
  });

  it('S10c the converse: Mandarin 是/世 are homophones, Cantonese si/sai are not', () => {
    const v = v2Cor517!;
    const chars = Array.from(v.textZh);
    const shiIdx = chars.indexOf('是');
    expect(shiIdx).not.toBe(-1);
    const score = (transcript: string, keyer: SpeechKeyer) =>
      compareRecital(transcript, v.textZh, keyer).matchPct;
    expect(score(mutateAt(v.textZh, shiIdx, '世'), mandarin)).toBe(100); // shi
    expect(score(mutateAt(v.textZh, shiIdx, '世'), cantonese)).toBeLessThan(100);
  });

  // NEGATIVE CONTROL, pinned so nobody re-derives it as a bug. The FIRST 新 → 神
  // costs a point under Mandarin (xin/shen differ). Under the Cantonese table
  // keyer it costs nothing: the table gives one reading per character, so 新 and
  // 神 are both san and there is no word context to re-key the neighbour 新造.
  it('S10d NEGATIVE CONTROL: the first 新 → 神 costs points under Mandarin only', () => {
    const v = v2Cor517!;
    const chars = Array.from(v.textZh);
    const firstXin = chars.indexOf('新');
    const score = (transcript: string, keyer: SpeechKeyer) =>
      compareRecital(transcript, v.textZh, keyer).matchPct;
    // table keyer: no word context, so no collateral (to-jyutping read 新造 as a word)
    expect(score(mutateAt(v.textZh, firstXin, '神'), cantonese)).toBe(100);
    expect(score(mutateAt(v.textZh, firstXin, '神'), mandarin)).toBeLessThan(100);
  });

  it('S11 omitting the keyer is identical to the Mandarin sync keyer', () => {
    for (const v of verses) {
      const transcript = v.textZh;
      expect(compareRecital(transcript, v.textZh)).toEqual(
        comparePinyin(transcript, hanziToTonelessPinyin(v.textZh)),
      );
      expect(diffHanzi(transcript, v.textZh)).toEqual(
        diffHanzi(transcript, v.textZh, MANDARIN_SYNC_KEYER),
      );
      const answer = { kind: 'recall' as const, transcript };
      expect(gradeStep(v.id, 'full-recall', answer)).toEqual(
        gradeStep(v.id, 'full-recall', answer, MANDARIN_SYNC_KEYER),
      );
    }
  });

  it('S12 an exact Cantonese-keyed recital of every seed verse scores 100', () => {
    // Consistency only. This says nothing about whether the readings are RIGHT
    // for a Cantonese speaker; S13 is the fairness measurement.
    for (const v of verses) {
      const r = compareRecital(v.textZh, v.textZh, cantonese);
      expect(r.matchPct).toBe(100);
      expect(r.passed).toBe(true);
      for (const c of v.chunks) {
        expect(compareRecital(c, c, cantonese).matchPct).toBe(100);
      }
    }
  });

  /**
   * Both keyers resolve readings by longest word match in a trie, so a transcript
   * error can change a CORRECTLY-spoken neighbour's token. That is inherent, not
   * a bug, but it has to be bounded, or one slip could cascade. Any (chunk,
   * position, op, language) scoring below (n-2)/n must be listed here with its
   * measured value, and the list must be exact: an unlisted violation fails, and
   * so does a stale entry.
   *
   * KNOWN CONFLICT: the pins below were measured under trie keying. Under the
   * one-reading-per-character tables the collateral is expected to be smaller,
   * so these entries are likely stale and the test is expected to FAIL until
   * they are re-measured. Kept as written; reported, not weakened.
   */
  const KNOWN_COLLATERAL: {
    chunk: string;
    index: number;
    op: 'del' | 'sub';
    language: SpeechLanguage;
    pct: number;
  }[] = [
    // 借着重生的洗和圣灵的更新 — both 借着 and 重生 are trie words, so losing the
    // second character of either re-keys its partner as well.
    { chunk: '借着重生的洗和圣灵的更新', index: 1, op: 'del', language: 'cantonese', pct: 75 },
    { chunk: '借着重生的洗和圣灵的更新', index: 1, op: 'sub', language: 'cantonese', pct: 75 },
    { chunk: '借着重生的洗和圣灵的更新', index: 3, op: 'del', language: 'mandarin', pct: 75 },
    { chunk: '借着重生的洗和圣灵的更新', index: 3, op: 'sub', language: 'mandarin', pct: 75 },
  ];

  /**
   * (chunk, keyer) pairs too short for the bound to say anything: (n-2)/n is
   * meaningless below 3 tokens. Pinned as an exact number rather than silently
   * skipped, so a seed edit that shortened chunks cannot hollow this test out.
   */
  const EXPECTED_SHORT_CHUNK_SKIPS = 0;

  it('S13 one mistake costs at most one token of collateral', () => {
    const found: typeof KNOWN_COLLATERAL = [];
    let skipped = 0;
    for (const v of verses) {
      for (const chunk of v.chunks) {
        const chars = Array.from(chunk);
        for (const keyer of loadedKeyers) {
          const n = tokenCount(keyer, chunk);
          if (n < 3) {
            skipped++;
            continue;
          }
          const bound = ((n - 2) / n) * 100 - 1e-9;
          for (let i = 0; i < chars.length; i++) {
            for (const op of ['del', 'sub'] as const) {
              const mutated = mutateAt(chunk, i, op === 'del' ? null : '啊');
              if (!mutated.trim()) continue;
              const pct = compareRecital(mutated, chunk, keyer).matchPct;
              if (pct < bound) {
                found.push({
                  chunk,
                  index: i,
                  op,
                  language: keyer.language,
                  pct: Number(pct.toFixed(2)),
                });
              }
            }
          }
        }
      }
    }
    const norm = (list: typeof KNOWN_COLLATERAL) =>
      list
        .map((e) => `${e.language}|${e.chunk}|${e.index}|${e.op}|${e.pct}`)
        .sort()
        .join('\n');
    expect(norm(found)).toBe(norm(KNOWN_COLLATERAL));
    expect(skipped).toBe(EXPECTED_SHORT_CHUNK_SKIPS);
  });
});
