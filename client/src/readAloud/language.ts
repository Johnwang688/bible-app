// Which voices may read which translation (decisions 8 and 11). A translation is only ever read by
// a voice of its own language: Chinese text never falls back to an English voice, or the reverse.
import { TRANSLATIONS, type TranslationId } from '../reader/translations';
import type { SpeechVoice } from './types';

/** The voice preference group: one remembered voice per group. */
export type SpeechGroup = 'en' | 'zh-Hans' | 'zh-Hant';

export interface SpeechLanguage {
  group: SpeechGroup;
  /** The tag sent with the text when the chosen voice gives none. */
  tag: string;
}

/** Translation ids whose text is traditional Chinese. */
const TRADITIONAL: ReadonlySet<TranslationId> = new Set<TranslationId>(['CUV']);

export function speechLanguageFor(translation: TranslationId): SpeechLanguage {
  if (TRANSLATIONS[translation].language === 'en') return { group: 'en', tag: 'en-US' };
  return TRADITIONAL.has(translation) ? { group: 'zh-Hant', tag: 'zh-TW' } : { group: 'zh-Hans', tag: 'zh-CN' };
}

export interface LangTag {
  /** `en`, `zh`, or anything else (lower case). Mandarin (`cmn`) and Cantonese (`yue`) count as `zh`. */
  family: string;
  /** Spoken Cantonese: `yue`, or a Chinese voice for Hong Kong or Macau. */
  cantonese: boolean;
  /** For Mandarin: the script its locale writes, when the tag says (`zh-CN` → Hans, `zh-TW` → Hant). */
  script: 'Hans' | 'Hant' | null;
}

const HANS_REGIONS = new Set(['cn', 'sg', 'my']);
const HANT_REGIONS = new Set(['tw', 'hk', 'mo']);

/** Reads `zh-CN`, `zh_TW`, `cmn-Hans-CN`, `yue-HK`, `en-us-x-sfg#male_1-local` and the like. */
export function parseLangTag(tag: string): LangTag {
  const parts = tag.replace(/_/g, '-').toLowerCase().split('-');
  const lang = parts[0] ?? '';
  const rest = parts.slice(1);
  const chinese = lang === 'zh' || lang === 'cmn' || lang === 'yue';
  if (!chinese) return { family: lang, cantonese: false, script: null };
  const region = rest.find((p) => p.length === 2) ?? '';
  let script: LangTag['script'] = null;
  if (rest.includes('hans') || HANS_REGIONS.has(region)) script = 'Hans';
  if (rest.includes('hant') || HANT_REGIONS.has(region)) script = 'Hant';
  const cantonese = lang === 'yue' || (lang !== 'cmn' && (region === 'hk' || region === 'mo'));
  return { family: 'zh', cantonese, script };
}

/** Lower is better. Null: the voice may not read this group at all. */
function rank(voice: SpeechVoice, group: SpeechGroup): number | null {
  const tag = parseLangTag(voice.lang);
  if (group === 'en') return tag.family === 'en' ? 0 : null;
  if (tag.family !== 'zh') return null;
  if (tag.cantonese) return 3;
  const want = group === 'zh-Hans' ? 'Hans' : 'Hant';
  if (tag.script === want) return 0;
  if (tag.script === null) return 1;
  return 2;
}

/** The region each group's text is usually heard in, first; any other region after. */
const HOME_REGIONS: Record<SpeechGroup, readonly string[]> = { en: ['us', 'gb'], 'zh-Hans': ['cn'], 'zh-Hant': ['tw'] };

function regionRank(voice: SpeechVoice, group: SpeechGroup): number {
  const region = voice.lang.replace(/_/g, '-').toLowerCase().split('-').slice(1).find((p) => p.length === 2) ?? '';
  const i = HOME_REGIONS[group].indexOf(region);
  return i < 0 ? HOME_REGIONS[group].length : i;
}

/** iOS's novelty voices (Albert, Bells, Bad News …) and the Eloquence set: never a sensible default. */
export function isNoveltyVoice(voice: SpeechVoice): boolean {
  return /^com\.apple\.(speech\.synthesis\.voice|eloquence)\./i.test(voice.id);
}

/**
 * Voices that sound like a person: Edge's "Online (Natural)", Chrome's "Google …", Apple's Siri and
 * premium voices, native enhanced ones. Long reading in an old offline voice sounds robotic.
 */
export function isNaturalVoice(voice: SpeechVoice): boolean {
  return voice.enhanced || /(natural|neural|online|premium|enhanced|siri)/i.test(voice.name) || /^google/i.test(voice.name);
}

/**
 * The voices that may read `translation`, best first: the matching locale (zh-CN for 和合本 in
 * simplified, zh-TW for traditional), then other Mandarin, then Cantonese last. Within a step:
 * natural-sounding voices, then the platform default, then ordinary voices before novelty ones, then the home region (en-US, then
 * en-GB), then offline voices, then enhanced ones, then by name.
 */
export function voicesFor(voices: readonly SpeechVoice[], translation: TranslationId): SpeechVoice[] {
  const { group } = speechLanguageFor(translation);
  return voices
    .map((v) => ({ v, r: rank(v, group) }))
    .filter((x): x is { v: SpeechVoice; r: number } => x.r !== null)
    .sort(
      (a, b) =>
        a.r - b.r ||
        Number(isNaturalVoice(b.v)) - Number(isNaturalVoice(a.v)) ||
        Number(b.v.isDefault) - Number(a.v.isDefault) ||
        Number(isNoveltyVoice(a.v)) - Number(isNoveltyVoice(b.v)) ||
        regionRank(a.v, group) - regionRank(b.v, group) ||
        Number(b.v.localService) - Number(a.v.localService) ||
        Number(b.v.enhanced) - Number(a.v.enhanced) ||
        a.v.name.localeCompare(b.v.name),
    )
    .map((x) => x.v);
}

/** The remembered voice if it is still on the device and may read this text; else the best one; else null. */
export function pickVoice(
  voices: readonly SpeechVoice[],
  translation: TranslationId,
  savedId: string | undefined,
): SpeechVoice | null {
  const usable = voicesFor(voices, translation);
  return usable.find((v) => v.id === savedId) ?? usable[0] ?? null;
}
