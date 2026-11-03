// Acceptance (orchestrator-owned): the missing-key test. Chinese never falls behind English.
import { en } from '../messages/en';
import { zhHans } from '../messages/zh-Hans';

const placeholders = (s: string) => [...s.matchAll(/\{(\w+)\}/g)].map((m) => m[1]).sort();

/** Strings that are the same in both languages on purpose. */
const SAME_IN_BOTH = new Set([
  'language.en',
  'language.zh-Hans',
  'beta.language.zh-Hans',
  // Font names and a web address (R-6a).
  'font.Literata',
  'font.SourceSerif4',
  'credits.stepLink',
  // English translation names stay English in both interfaces.
  'translation.BSB.short',
  'translation.BSB.name',
  'translation.WEB.short',
  'translation.WEB.name',
  'translation.ASV.short',
  'translation.ASV.name',
  // "John 3" / "约翰福音 3": the book name is translated, the pattern is the same.
  'reader.chapterTitle',
  // Glyphs and joiners, not words.
  'reader.settingsGlyph',
  'settings.sizeGlyph',
  'reader.translationPair',
]);

/** Common Traditional-only characters: the interface is Simplified Chinese only. */
const TRADITIONAL = /[體經說書讀設語簡聖筆記這們個來時會學習開關選擇顏標籤頁載錯誤連線網絡請試極淺隨機銀藍]/;

describe('message catalogue', () => {
  const enKeys = Object.keys(en).sort();
  const zhKeys = Object.keys(zhHans).sort();

  it('has no key missing from Chinese', () => {
    expect(enKeys.filter((k) => !(k in zhHans))).toEqual([]);
  });

  it('has no Chinese key missing from English', () => {
    expect(zhKeys.filter((k) => !(k in en))).toEqual([]);
  });

  it('has no empty strings', () => {
    for (const [k, v] of [...Object.entries(en), ...Object.entries(zhHans)]) {
      expect([k, v.trim().length > 0]).toEqual([k, true]);
    }
  });

  it('keeps the same placeholders in both languages', () => {
    for (const k of enKeys) {
      const key = k as keyof typeof en;
      expect([k, placeholders(zhHans[key])]).toEqual([k, placeholders(en[key])]);
    }
  });

  it('translates every string, apart from the deliberate exceptions', () => {
    const untranslated = enKeys.filter(
      (k) => !SAME_IN_BOTH.has(k) && zhHans[k as keyof typeof en] === en[k as keyof typeof en],
    );
    expect(untranslated).toEqual([]);
  });

  it('writes Chinese in Simplified characters', () => {
    for (const [k, v] of Object.entries(zhHans)) {
      expect([k, TRADITIONAL.test(v)]).toEqual([k, false]);
    }
  });

  it('labels English-only content 英文', () => {
    expect(zhHans['content.englishOnly']).toBe('英文');
  });
});
