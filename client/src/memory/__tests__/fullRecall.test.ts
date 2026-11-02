/**
 * Acceptance tests for full recall: the printed reference (book, chapter,
 * verse) spoken before or after the body, graded by `compareFullRecall`, and
 * the server's `gradeStep` path, which must agree with it.
 * Ported from Little Lamb's tests/full-recall.ts, groups FR1 to FR7 (FR6 with
 * simplified aliases only) and FR8 to FR14.
 *
 * Traditional text and references come from the library (`textZhHant`,
 * `referenceZhHant`, the OpenCC cn->tw output). The source's cn->hk variant
 * has no library counterpart, so only tw is ported.
 *
 * Not ported: the traditional half of FR6 (the source ran each alias through
 * the same OpenCC converter; the library carries no traditional alias forms).
 */
import { compareFullRecall } from '../speech/fullRecall';
import { gradeStep } from '../grading';
import { compareRecital } from '../speech/pinyinDiff';
import { MANDARIN_SYNC_KEYER, loadSpeechKeyer, type SpeechKeyer } from '../speech/keyer';
import { getAllMemoryVerses } from '../library';

const verses = getAllMemoryVerses();

/** Fails with `label` in the diff, the way the source's `assert(x, label)` did. */
function expectEq<T>(actual: T, expected: T, label: string): void {
  expect({ label, actual }).toEqual({ label, actual: expected });
}

const find = (reference: string) => {
  const verse = verses.find((v) => v.referenceZh === reference);
  if (!verse) throw new Error(`Missing fixture ${reference}`);
  return verse;
};

const firstVerse = () => {
  const verse = verses[0];
  if (!verse) throw new Error('seed has no verses');
  return verse;
};

let keyers: SpeechKeyer[];

beforeAll(async () => {
  keyers = [
    MANDARIN_SYNC_KEYER,
    await loadSpeechKeyer('mandarin'),
    await loadSpeechKeyer('cantonese'),
  ];
});

describe('FR. full recall', () => {
  it('FR1 every seeded printed reference passes equally before or after its verse', () => {
    for (const verse of verses) {
      for (const keyer of keyers) {
        for (const transcript of [
          `${verse.referenceZh}。${verse.textZh}`,
          `${verse.textZh}${verse.referenceZh}`,
        ]) {
          const local = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
          const server = gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript }, keyer);
          expectEq(local.passed, true, `${keyer.language}: ${verse.referenceZh}: ${transcript}`);
          expectEq(local.body.matchPct, 100, verse.referenceZh);
          expectEq(local.bodyTranscript, verse.textZh, verse.referenceZh);
          expectEq(server.passed, local.passed, verse.referenceZh);
          expectEq(server.matchPct, local.body.matchPct, verse.referenceZh);
        }
      }
    }
  });

  // Traditional reference from the library (`referenceZhHant`, OpenCC cn->tw).
  it('FR2 a traditional printed reference after the body passes under every keyer', () => {
    for (const verse of verses) {
      for (const keyer of keyers) {
        const transcript = `${verse.textZh}${verse.referenceZhHant}`;
        const result = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
        expectEq(result.passed, true, `${keyer.language}: ${transcript}`);
      }
    }
  });

  it('FR3 every spoken reference accepts direct body adjacency at either edge', () => {
    for (const verse of verses) {
      const spokenReference =
        verse.referenceZh
          .replace(/ /g, '')
          .replace(':', '章')
          .replace(/-/g, '至')
          .replace(/,/g, '节和') + '节';
      const unpunctuatedBody = verse.textZh.replace(/[\s\p{P}]/gu, '');
      for (const keyer of keyers) {
        for (const transcript of [
          `${spokenReference}${unpunctuatedBody}`,
          `${unpunctuatedBody}${spokenReference}`,
        ]) {
          const result = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
          expectEq(result.passed, true, transcript);
          expectEq(result.body.matchPct, 100, transcript);
        }
      }
    }
    for (const body of ['三个人', '到他那里', '至于淫乱']) {
      const result = compareFullRecall(`约翰福音三章十六节${body}`, body, '约翰福音 3:16');
      expectEq(result.passed, true, body);
    }
  });

  // Traditional text and reference from the library. The source's hk variant
  // has no library counterpart, so only tw is ported.
  it('FR4 a fully traditional transcript passes under every loaded keyer', () => {
    for (const verse of verses) {
      for (const keyer of keyers.slice(1)) {
        for (const transcript of [
          `${verse.referenceZhHant}。${verse.textZhHant}`,
          `${verse.textZhHant}${verse.referenceZhHant}`,
        ]) {
          const result = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
          expectEq(result.passed, true, `${keyer.language}: ${transcript}`);
        }
      }
    }
  });

  it('FR5 spoken chapter/verse numbers, ordinals, ranges, lists, aliases and fullwidth print', () => {
    const examples: [string, string[]][] = [
      ['约翰福音 14:21', ['约翰福音十四章二十一节', '约翰福音第十四章第二十一节', '約十四章廿一節', '约 １４：２１']],
      ['约翰壹书 5:13', ['约翰一书五章十三节', '約翰壹書第五章第十三節', '约一5:13', '约壹五章十三节']],
      ['哥林多后书 5:17', ['林后五章十七节', '哥林多後書五章十七節', '哥林多后书5章17节']],
      ['腓立比书 4:6-7', ['腓立比书四章六至七节', '腓立比書第四章第六節到第七節', '腓4:6–7', '腓立比书四章六节和七节']],
      ['诗篇 119:9,11', ['诗篇一百一十九篇九节和十一节', '诗篇第一百一十九章第九节、第十一节', '詩篇119:9，11']],
      ['以弗所书 2:8-9', ['以弗所书两章八至九节', '以弗所書第二章第八至第九節']],
    ];
    for (const [reference, alternatives] of examples) {
      const verse = find(reference);
      for (const keyer of keyers) {
        for (const alternative of alternatives) {
          for (const transcript of [
            `${alternative}。${verse.textZh}`,
            `${verse.textZh}${alternative}`,
          ]) {
            expectEq(
              compareFullRecall(transcript, verse.textZh, reference, keyer).passed,
              true,
              transcript,
            );
          }
        }
      }
    }
  });

  // Simplified aliases only. The source also ran each alias through OpenCC
  // (traditional(variant)); that half is not ported.
  it('FR6 every supported multi-character spoken alias accepts unpunctuated adjacency in either order', () => {
    const aliases: [string, string[]][] = [
      ['哥林多后书', ['哥林多后', '林后']],
      ['哥林多前书', ['哥林多前', '林前']],
      ['加拉太书', ['加拉太']],
      ['罗马书', ['罗马']],
      ['约翰福音', ['约翰']],
      ['约翰壹书', ['约翰一书', '约壹', '约一']],
      ['提摩太后书', ['提摩太后', '提后']],
      ['约书亚记', ['约书亚']],
      ['腓立比书', ['腓立比']],
      ['马太福音', ['马太']],
      ['马可福音', ['马可']],
      ['路加福音', ['路加']],
      ['希伯来书', ['希伯来']],
      ['以赛亚书', ['以赛亚']],
      ['彼得前书', ['彼得前', '彼前']],
      ['以弗所书', ['以弗所']],
      ['提多书', ['提多']],
      ['耶利米哀歌', ['哀歌']],
      ['民数记', ['民数']],
      ['使徒行传', ['使徒行']],
      ['利未记', ['利未']],
    ];
    for (const [book, variants] of aliases) {
      const verse = verses.find((v) => v.referenceZh.startsWith(`${book} `));
      if (!verse) throw new Error(`no verse for ${book}`);
      const spokenNumbers =
        verse.referenceZh
          .slice(book.length)
          .trim()
          .replace(':', '章')
          .replace(/-/g, '至')
          .replace(/,/g, '节和') + '节';
      const body = verse.textZh.replace(/[\s\p{P}]/gu, '');
      for (const keyer of keyers) {
        for (const alias of variants) {
          for (const transcript of [
            `${alias}${spokenNumbers}${body}`,
            `${body}${alias}${spokenNumbers}`,
          ]) {
            const result = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
            expectEq(result.passed, true, transcript);
            expectEq(result.body.matchPct, 100, transcript);
            const server = gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript }, keyer);
            expectEq(server.passed, result.passed, transcript);
          }
        }
      }
    }
  });

  it('FR7 a perfect body cannot compensate for a missing or wrong reference', () => {
    for (const verse of verses) {
      for (const keyer of keyers) {
        const missing = compareFullRecall(verse.textZh, verse.textZh, verse.referenceZh, keyer);
        expectEq(missing.passed, false, `missing ${verse.referenceZh}`);
        expectEq(missing.referenceStatus, 'missing', `missing ${verse.referenceZh}`);
        expectEq(missing.body.matchPct, 100, `missing ${verse.referenceZh}`);
        const wrongReference = verse.referenceZh.replace(/:\d+.*$/, ':999');
        for (const transcript of [
          `${wrongReference}。${verse.textZh}`,
          `${verse.textZh}${wrongReference}`,
        ]) {
          const wrong = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
          expectEq(wrong.passed, false, transcript);
          expectEq(wrong.referenceStatus, 'incorrect', transcript);
          expectEq(wrong.body.matchPct, 100, transcript);
          expectEq(
            gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript }, keyer).passed,
            false,
            transcript,
          );
        }
      }
    }
  });

  it('FR8 wrong book, chapter, verse and incomplete or overbroad spans all fail', () => {
    const fixtures: [string, string[]][] = [
      ['约翰壹书 5:13', ['约翰福音五章十三节', '约翰一书四章十三节', '约翰一书五章十二节']],
      ['哥林多后书 5:17', ['哥林多前书五章十七节', '林后五章一百七十节']],
      ['腓立比书 4:6-7', ['腓立比书四章六节', '腓立比书四章六至八节', '腓立比书四章七至六节']],
      ['诗篇 119:9,11', ['诗篇一百一十九篇九至十一节', '诗篇一百一十九篇九节', '诗篇十九篇九节和十一节']],
    ];
    for (const [reference, wrongReferences] of fixtures) {
      const verse = find(reference);
      for (const wrong of wrongReferences) {
        for (const transcript of [`${wrong}。${verse.textZh}`, `${verse.textZh}${wrong}`]) {
          expectEq(
            compareFullRecall(transcript, verse.textZh, reference).passed,
            false,
            transcript,
          );
        }
      }
    }
  });

  it('FR9 an alias inside a wrong or unknown full title cannot pass as the reference', () => {
    const verse = find('约书亚记 1:8');
    for (const wrongTitle of ['约翰贰书', '约翰二书', '不认识的书', '創世記', '約翰貳書']) {
      for (const body of [verse.textZh, verse.textZh.replace(/[\s\p{P}]/gu, '')]) {
        const transcript = `${body}${wrongTitle}1:8`;
        expectEq(
          compareFullRecall(transcript, verse.textZh, verse.referenceZh).passed,
          false,
          transcript,
        );
      }
    }
    const unpunctuatedBody = verse.textZh.replace(/[\s\p{P}]/gu, '');
    for (const separator of ['。', ' ', '，']) {
      expectEq(
        compareFullRecall(`${unpunctuatedBody}${separator}书1:8`, verse.textZh, verse.referenceZh)
          .passed,
        true,
        `separator ${JSON.stringify(separator)}`,
      );
    }
    expectEq(
      compareFullRecall(`${unpunctuatedBody}书1:8`, verse.textZh, verse.referenceZh).passed,
      false,
      'no separator',
    );
  });

  it('FR10 reference-only, empty and embedded-reference inputs do not pass', () => {
    const verse = firstVerse();
    for (const transcript of [
      '',
      '   ',
      verse.referenceZh,
      `嗯${verse.referenceZh}。${verse.textZh}`,
      `${verse.textZh}${verse.referenceZh}阿们`,
    ]) {
      expectEq(
        compareFullRecall(transcript, verse.textZh, verse.referenceZh).passed,
        false,
        transcript,
      );
    }
  });

  it('FR11 malformed number continuations cannot shorten into a correct reference', () => {
    const verse = firstVerse();
    for (const reference of [
      '哥林多后书5:17-18-19',
      '哥林多后书5:17节至18节至19节',
      '哥林多后书5:17节、18节、',
      '哥林多后书5:170',
      '哥林多后书5:17:8',
    ]) {
      expectEq(
        compareFullRecall(`${reference}${verse.textZh}`, verse.textZh, verse.referenceZh).passed,
        false,
        reference,
      );
    }
  });

  it('FR12 body grading is unchanged, including extra words and the original pass threshold', () => {
    for (const keyer of keyers) {
      const verse = firstVerse();
      const bodies = [
        verse.textZh,
        verse.textZh.slice(4),
        verse.textZh.slice(20),
        '今天天气很好',
        `${verse.textZh}我又说了很多其他的话很多其他的话`,
        '',
      ];
      for (const body of bodies) {
        const original = compareRecital(body, verse.textZh, keyer);
        for (const transcript of [
          `${verse.referenceZh}。${body}`,
          `${body}${verse.referenceZh}`,
        ]) {
          const result = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
          expectEq(result.body.matchPct, original.matchPct, transcript);
          expectEq(result.passed, original.passed, transcript);
        }
      }
    }
  });

  it('FR13 matching references at both edges work; a wrong second reference still fails', () => {
    const verse = firstVerse();
    expectEq(
      compareFullRecall(
        `${verse.referenceZh}。${verse.textZh}${verse.referenceZh}`,
        verse.textZh,
        verse.referenceZh,
      ).passed,
      true,
      'matching edges',
    );
    expectEq(
      compareFullRecall(
        `${verse.referenceZh}。${verse.textZh}罗马书五章十七节`,
        verse.textZh,
        verse.referenceZh,
      ).passed,
      false,
      'wrong second reference',
    );
  });

  it('FR14 server rejects malformed and overlong answers before comparison', () => {
    const verse = firstVerse();
    for (const value of [null, 42, {}, 'a'.repeat(2001)]) {
      // The wire can carry anything; the cast is the point of the test.
      const transcript = value as string;
      const result = gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript });
      expectEq(result.passed, false, JSON.stringify(value).slice(0, 20));
      expect(result.error).toBeTruthy();
    }
  });
});
