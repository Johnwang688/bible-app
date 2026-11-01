// Acceptance (orchestrator-owned): locale detection and the first translation for a new reader.
import { defaultTranslation, detectLocale, resolveLocale, type DeviceLocale } from '../locale';

const loc = (languageTag: string, scriptCode: string | null = null): DeviceLocale => {
  const [languageCode = null, ...rest] = languageTag.split('-');
  const regionCode = rest.find((p) => /^[A-Z]{2}$/.test(p)) ?? null;
  return { languageTag, languageCode, scriptCode, regionCode };
};

describe('detectLocale', () => {
  it('gives the Simplified interface for any Chinese phone language', () => {
    for (const tag of ['zh', 'zh-CN', 'zh-Hans-CN', 'zh-SG', 'zh-TW', 'zh-Hant-TW', 'zh-HK', 'zh-MO']) {
      expect([tag, detectLocale([loc(tag)])]).toEqual([tag, 'zh-Hans']);
    }
  });

  it('gives English for English and for languages the app does not have', () => {
    expect(detectLocale([loc('en-US')])).toBe('en');
    expect(detectLocale([loc('en-GB')])).toBe('en');
    expect(detectLocale([loc('fr-FR')])).toBe('en');
    expect(detectLocale([])).toBe('en');
  });

  it('uses the first preferred language the app supports', () => {
    expect(detectLocale([loc('fr-FR'), loc('zh-CN'), loc('en-US')])).toBe('zh-Hans');
    expect(detectLocale([loc('ja-JP'), loc('en-US'), loc('zh-CN')])).toBe('en');
  });
});

describe('resolveLocale', () => {
  it('follows the phone for "system" and obeys a fixed choice', () => {
    expect(resolveLocale('system', [loc('zh-CN')])).toBe('zh-Hans');
    expect(resolveLocale('system', [loc('en-US')])).toBe('en');
    expect(resolveLocale('en', [loc('zh-CN')])).toBe('en');
    expect(resolveLocale('zh-Hans', [loc('en-US')])).toBe('zh-Hans');
  });
});

describe('defaultTranslation', () => {
  it('starts Simplified Chinese phones in CUV-SIMP', () => {
    for (const tag of ['zh', 'zh-CN', 'zh-Hans-CN', 'zh-SG']) {
      expect([tag, defaultTranslation([loc(tag)])]).toEqual([tag, 'CUV-SIMP']);
    }
  });

  it('starts Traditional Chinese phones in CUV', () => {
    for (const tag of ['zh-TW', 'zh-Hant', 'zh-Hant-TW', 'zh-HK', 'zh-MO', 'zh-Hant-HK']) {
      expect([tag, defaultTranslation([loc(tag)])]).toEqual([tag, 'CUV']);
    }
    expect(defaultTranslation([loc('zh', 'Hant')])).toBe('CUV');
  });

  it('starts everyone else in BSB', () => {
    expect(defaultTranslation([loc('en-US')])).toBe('BSB');
    expect(defaultTranslation([loc('de-DE')])).toBe('BSB');
    expect(defaultTranslation([])).toBe('BSB');
  });

  it('decides from the same locale as the interface', () => {
    expect(defaultTranslation([loc('fr-FR'), loc('zh-TW')])).toBe('CUV');
    expect(defaultTranslation([loc('en-US'), loc('zh-TW')])).toBe('BSB');
  });
});
