// Verifier round 1 (GPT-6.1 Sol): regression tests. Orchestrator-owned; do not edit.
import { getLocales } from 'expo-localization';

import { defaultTranslation, getDeviceLocales } from '../locale';

jest.mock('expo-localization', () => ({ getLocales: jest.fn() }));

describe('BCP-47 tags are case-insensitive', () => {
  test.each([
    ['zh-hant', 'CUV'],
    ['ZH-HANT', 'CUV'],
    ['zh-hant-tw', 'CUV'],
    ['zh-tw', 'CUV'],
    ['zh-hans-hk', 'CUV-SIMP'],
    ['ZH-HANS-HK', 'CUV-SIMP'],
  ])('%s selects %s', (languageTag, expected) => {
    expect(defaultTranslation([{ languageTag, languageCode: null, regionCode: null }])).toBe(expected);
  });
});

describe('getDeviceLocales', () => {
  test('keeps the script Expo supplies as languageScriptCode', () => {
    jest.mocked(getLocales).mockReturnValue([
      { languageTag: 'zh', languageCode: 'zh', languageScriptCode: 'Hans', regionCode: 'HK' } as ReturnType<
        typeof getLocales
      >[number],
    ]);
    const locales = getDeviceLocales();
    expect(locales).toEqual([{ languageTag: 'zh', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'HK' }]);
    expect(defaultTranslation(locales)).toBe('CUV-SIMP');
  });

  test('maps a Traditional script from Expo to CUV', () => {
    jest.mocked(getLocales).mockReturnValue([
      { languageTag: 'zh', languageCode: 'zh', languageScriptCode: 'Hant', regionCode: null } as ReturnType<
        typeof getLocales
      >[number],
    ]);
    expect(defaultTranslation(getDeviceLocales())).toBe('CUV');
  });

  test('returns the phone locales, not an empty list', () => {
    jest.mocked(getLocales).mockReturnValue([
      { languageTag: 'en-US', languageCode: 'en', languageScriptCode: null, regionCode: 'US' } as ReturnType<
        typeof getLocales
      >[number],
    ]);
    expect(getDeviceLocales()).toHaveLength(1);
  });

  test('returns [] when expo-localization throws', () => {
    jest.mocked(getLocales).mockImplementation(() => {
      throw new Error('boom');
    });
    expect(getDeviceLocales()).toEqual([]);
  });
});
