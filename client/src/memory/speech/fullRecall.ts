import { compareRecital, type PinyinComparison } from './pinyinDiff';
import { MANDARIN_SYNC_KEYER, type SpeechKeyer } from './keyer';

// Full titles and common Chinese abbreviations for the active library. Other
// standard book titles are recognized too, so a wrong full title can never be
// shortened to an alias (e.g. 约翰贰书 -> 书, the Joshua abbreviation).
const BOOKS: readonly (readonly string[])[] = [
  ['哥林多后书', '哥林多后', '林后'],
  ['哥林多前书', '哥林多前', '林前'],
  ['加拉太书', '加拉太', '加'],
  ['罗马书', '罗马', '罗'],
  ['约翰福音', '约翰', '约'],
  ['约翰壹书', '约翰一书', '约壹', '约一'],
  ['提摩太后书', '提摩太后', '提后'],
  ['约书亚记', '约书亚', '书'],
  ['腓立比书', '腓立比', '腓'],
  ['马太福音', '马太', '太'],
  ['马可福音', '马可', '可'],
  ['路加福音', '路加', '路'],
  ['希伯来书', '希伯来', '来'],
  ['以赛亚书', '以赛亚', '赛'],
  ['彼得前书', '彼得前', '彼前'],
  ['以弗所书', '以弗所', '弗'],
  ['提多书', '提多', '多'],
  ['启示录', '启'],
  ['耶利米哀歌', '哀歌', '哀'],
  ['民数记', '民数', '民'],
  ['诗篇', '诗'],
  ['箴言', '箴'],
  ['使徒行传', '使徒行', '徒'],
  ['利未记', '利未', '利'],
  ...[
    '创世记', '出埃及记', '申命记', '士师记', '路得记', '撒母耳记上', '撒母耳记下',
    '列王纪上', '列王纪下', '历代志上', '历代志下', '以斯拉记', '尼希米记', '以斯帖记',
    '约伯记', '传道书', '雅歌', '耶利米书', '以西结书', '但以理书', '何西阿书',
    '约珥书', '阿摩司书', '俄巴底亚书', '约拿书', '弥迦书', '那鸿书', '哈巴谷书',
    '西番雅书', '哈该书', '撒迦利亚书', '玛拉基书', '歌罗西书', '帖撒罗尼迦前书',
    '帖撒罗尼迦后书', '提摩太前书', '腓利门书', '雅各书', '彼得后书', '犹大书',
  ].map((title) => [title]),
  ['约翰贰书', '约翰二书'],
  ['约翰叁书', '约翰三书'],
];

// Explicit title spellings also work when the Mandarin normalizer is offline.
// This map is only applied to BOOK ALIASES, never to the verse body.
const TITLE_TRADITIONAL: Readonly<Record<string, string>> = {
  后: '後', 书: '書', 罗: '羅', 马: '馬', 约: '約', 亚: '亞', 来: '來',
  赛: '賽', 启: '啟', 录: '錄', 数: '數', 记: '記', 诗: '詩', 传: '傳',
  创: '創', 师: '師', 纪: '紀', 历: '歷', 结: '結', 弥: '彌', 鸿: '鴻',
  该: '該', 玛: '瑪', 门: '門', 犹: '猶', 贰: '貳', 叁: '參',
};
const bookIds = new Map<string, string>();
const fullBookTitles = new Set<string>();
for (const [canonical, ...aliases] of BOOKS) {
  if (canonical === undefined) continue;
  for (const alias of [canonical, ...aliases]) {
    const traditional = Array.from(alias, (ch) => TITLE_TRADITIONAL[ch] ?? ch).join('');
    bookIds.set(alias, canonical);
    bookIds.set(traditional, canonical);
    if (alias === canonical || /^约翰[一二三]书$/.test(alias)) {
      fullBookTitles.add(alias);
      fullBookTitles.add(traditional);
    }
  }
}

const NUMBER_CHARS = '0-9０-９零〇一二三四五六七八九十百千两兩廿卅壹贰貳叁參肆伍陆陸柒捌玖拾佰仟';
const NUMBER = `[${NUMBER_CHARS}]+`;
const VERSE_NUMBER = `第?\\s*${NUMBER}\\s*[节節]?`;
const RANGE = '[-－–—~～至到]';
const LIST = '[,，、和及与與]';
const SPAN = `${VERSE_NUMBER}(?:\\s*${RANGE}\\s*${VERSE_NUMBER})?`;
const bookPattern = [...bookIds.keys()].sort((a, b) => b.length - a.length).join('|');
const referencePattern = `(${bookPattern})\\s*第?\\s*(${NUMBER})\\s*(?:章|篇|[:：])\\s*(${SPAN}(?:\\s*${LIST}\\s*${SPAN})*)`;
const EDGE = '[\\s\\p{P}]*';
const prefixReference = new RegExp(`^${EDGE}${referencePattern}`, 'u');
const suffixReference = new RegExp(`${referencePattern}${EDGE}$`, 'u');
const exactReference = new RegExp(`^${EDGE}${referencePattern}${EDGE}$`, 'u');
const leadingPunctuation = new RegExp(`^${EDGE}`, 'u');
const continuedSpan = new RegExp(`^\\s*(?:${LIST}|${RANGE})\\s*第?\\s*[${NUMBER_CHARS}]`, 'u');
const continuedNumber = new RegExp(`^\\s*[${NUMBER_CHARS}第章节節篇:：]`, 'u');

function hasPrefixBoundary(match: RegExpMatchArray, remaining: string): boolean {
  // Check AFTER the greedy match so failure cannot backtrack into a shorter
  // chapter/verse. 至于 is the start of Ephesians 5:3, not a verse range. And
  // an explicit 节 separates the body even when its first word is a numeral.
  if (continuedSpan.test(remaining)) return false;
  return /[节節]\s*$/.test(match[3]!) || !continuedNumber.test(remaining);
}

function hasSuffixBoundary(match: RegExpMatchArray, transcript: string): boolean {
  // Full titles and spoken aliases (林后, 罗马, 约翰...) work directly against
  // an unpunctuated verse in either order. Only one-character printed shorthand
  // needs a separator at the end: otherwise an unknown title such as 不认识的书
  // would be accepted as 书 (Joshua) and its remainder scored as body extras.
  const title = match[1]!;
  if (fullBookTitles.has(title) || title.length > 1 || match.index === 0) return true;
  return /[\s\p{P}]/u.test(transcript[(match.index ?? 0) - 1] ?? '');
}

const DIGITS: Readonly<Record<string, string>> = {
  零: '0', 〇: '0', 一: '1', 壹: '1', 二: '2', 两: '2', 兩: '2', 贰: '2', 貳: '2',
  三: '3', 叁: '3', 參: '3', 四: '4', 肆: '4', 五: '5', 伍: '5', 六: '6', 陆: '6', 陸: '6',
  七: '7', 柒: '7', 八: '8', 捌: '8', 九: '9', 玖: '9',
};

function referenceNumber(source: string): number {
  const text = source.normalize('NFKC')
    .replace(/廿/g, '二十').replace(/卅/g, '三十')
    .replace(/拾/g, '十').replace(/佰/g, '百').replace(/仟/g, '千');
  if (/^[0-9]+$/.test(text)) return Number(text);
  if (!/[十百千]/.test(text)) return Number(Array.from(text, (ch) => DIGITS[ch] ?? '?').join(''));
  let total = 0;
  let digit = 0;
  let lastUnit = Infinity;
  const units: Readonly<Record<string, number>> = { 十: 10, 百: 100, 千: 1000 };
  for (const ch of text) {
    const unit = units[ch];
    if (unit) {
      if (unit >= lastUnit) return NaN;
      total += (digit || 1) * unit;
      digit = 0;
      lastUnit = unit;
    } else {
      if (!(ch in DIGITS)) return NaN;
      digit = Number(DIGITS[ch]);
    }
  }
  return total + digit;
}

interface Reference {
  book: string;
  chapter: number;
  verses: string;
}

function parseMatch(match: RegExpMatchArray): Reference | null {
  const chapter = referenceNumber(match[2]!);
  if (!Number.isInteger(chapter) || chapter < 1 || chapter > 999) return null;
  const verseNumbers = new Set<number>();
  for (const span of match[3]!.split(new RegExp(LIST, 'u'))) {
    const numbers = (span.match(new RegExp(NUMBER, 'gu')) ?? []).map(referenceNumber);
    const start = numbers[0];
    const end = numbers[1] ?? start;
    if (start === undefined || end === undefined) return null;
    if (!Number.isInteger(start) || !Number.isInteger(end) || start < 1 || end < start || end > 999) return null;
    for (let n = start; n <= end; n++) verseNumbers.add(n);
  }
  return {
    book: bookIds.get(match[1]!)!,
    chapter,
    verses: [...verseNumbers].sort((a, b) => a - b).join(','),
  };
}

export interface FullRecallComparison {
  passed: boolean;
  /** Body accuracy only; a long verse can never hide a missing/wrong reference. */
  body: PinyinComparison;
  bodyTranscript: string;
  referenceStatus: 'correct' | 'missing' | 'incorrect';
}

/**
 * Require the reference at either edge, then grade the remaining body using
 * the existing comparator unchanged. Numbers are semantic (三:十六 = 3:16),
 * independent of Mandarin/Cantonese pronunciation. Interior references are
 * never removed, and a reference alone never satisfies the body.
 */
export function compareFullRecall(
  transcript: string,
  expectedHanzi: string,
  expectedReference: string,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
): FullRecallComparison {
  const expectedMatch = expectedReference.match(exactReference);
  const expected = expectedMatch ? parseMatch(expectedMatch) : null;
  let bodyTranscript = transcript.trim();
  const references: (Reference | null)[] = [];
  const prefix = bodyTranscript.match(prefixReference);
  if (prefix && hasPrefixBoundary(prefix, bodyTranscript.slice(prefix[0].length))) {
    references.push(parseMatch(prefix));
    bodyTranscript = bodyTranscript.slice(prefix[0].length).replace(leadingPunctuation, '').trim();
  }
  const suffix = bodyTranscript.match(suffixReference);
  if (suffix && hasSuffixBoundary(suffix, bodyTranscript)) {
    references.push(parseMatch(suffix));
    bodyTranscript = bodyTranscript.slice(0, suffix.index).trim();
  }
  const referenceStatus = references.length === 0 ? 'missing'
    : expected && references.every((ref) => ref && ref.book === expected.book
      && ref.chapter === expected.chapter && ref.verses === expected.verses) ? 'correct' : 'incorrect';
  const body = compareRecital(bodyTranscript, expectedHanzi, keyer);
  return { passed: referenceStatus === 'correct' && body.passed, body, bodyTranscript, referenceStatus };
}

// ---------------------------------------------------------------------------------------------------------
// For the full-recall screen: the ways a reference may be spoken, and how a heard one was read.
// ---------------------------------------------------------------------------------------------------------

/** A reference as the grader reads it: the book's full title, the chapter and the verses (`16`, `6,7`, `9,11`). */
export interface ParsedReference {
  book: string;
  chapter: number;
  verses: string;
}

/** Reads one whole reference (`提后三章十六节`, `提摩太前书3:16`); null when `text` is anything else. */
export function parseSpokenReference(text: string): ParsedReference | null {
  const match = text.match(exactReference);
  return match ? parseMatch(match) : null;
}

/** A title in Traditional characters (the grader's own map). */
export function toTraditionalTitle(text: string): string {
  return Array.from(text, (ch) => TITLE_TRADITIONAL[ch] ?? ch).join('');
}

const CN_DIGITS = ['零', '一', '二', '三', '四', '五', '六', '七', '八', '九'];

/** 1..999 as spoken: 3 -> 三, 16 -> 十六, 20 -> 二十, 119 -> 一百一十九. */
function spokenNumber(n: number): string {
  if (n < 10) return CN_DIGITS[n]!;
  if (n < 20) return `十${n % 10 === 0 ? '' : CN_DIGITS[n % 10]}`;
  if (n < 100) return `${CN_DIGITS[Math.floor(n / 10)]}十${n % 10 === 0 ? '' : CN_DIGITS[n % 10]}`;
  const hundreds = `${CN_DIGITS[Math.floor(n / 100)]}百`;
  const rest = n % 100;
  if (rest === 0) return hundreds;
  if (rest < 10) return `${hundreds}零${CN_DIGITS[rest]}`;
  return `${hundreds}${rest < 20 ? '一' : ''}${spokenNumber(rest)}`;
}

/** `9,11` -> 九、十一; `6,7` -> 六、七; a stored span `6-7` -> 六至七. */
function spokenVerses(verses: string): string {
  return verses
    .split(',')
    .map((span) => span.split(/[-–]/).map((n) => spokenNumber(Number(n))).join('至'))
    .join('、');
}

/**
 * Three ways to say a reference, all of which the grader takes (`提摩太后书 3:16`, `提后三章十六节`,
 * `提摩太后书第三章第十六节`). `referenceZh` is the library's form (`book chapter:verses`); `shown` is that same
 * reference as the reader's script spells it. Null when `referenceZh` is not that shape.
 */
export function referenceForms(referenceZh: string, shown: string, traditional: boolean): string[] | null {
  const match = referenceZh.match(/^(\S+)\s+(\d+):([\d,\-–]+)$/);
  if (!match) return null;
  const [, book, chapterRaw, versesRaw] = match;
  const chapter = Number(chapterRaw);
  const names = BOOKS.find((aliases) => aliases[0] === book);
  const shortName = names ? [...names].filter((a) => a.length >= 2).sort((a, b) => a.length - b.length)[0] ?? book! : book!;
  const unit = book === '诗篇' ? '篇' : '章';
  const verses = spokenVerses(versesRaw!);
  const forms = [
    shown,
    `${shortName}${spokenNumber(chapter)}${unit}${verses}节`,
    `${book}第${spokenNumber(chapter)}${unit}第${verses}节`,
  ];
  return traditional ? [shown, ...forms.slice(1).map((f) => toTraditionalTitle(f).replace(/节/g, '節'))] : forms;
}
