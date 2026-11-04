import { parseLangTag, pickVoice, speechLanguageFor, voicesFor } from '../language';
import { VOICES, voice } from './fakeEngine';

describe('parseLangTag', () => {
  it.each([
    ['zh-CN', { family: 'zh', cantonese: false, script: 'Hans' }],
    ['zh_TW', { family: 'zh', cantonese: false, script: 'Hant' }],
    ['cmn-Hans-CN', { family: 'zh', cantonese: false, script: 'Hans' }],
    ['cmn-Hant-TW', { family: 'zh', cantonese: false, script: 'Hant' }],
    ['zh-HK', { family: 'zh', cantonese: true, script: 'Hant' }],
    ['yue-HK', { family: 'zh', cantonese: true, script: 'Hant' }],
    ['zh', { family: 'zh', cantonese: false, script: null }],
    ['en-us-x-sfg#male_1-local', { family: 'en', cantonese: false, script: null }],
    ['EN_gb', { family: 'en', cantonese: false, script: null }],
  ])('%s', (tag, want) => {
    expect(parseLangTag(tag)).toEqual(want);
  });
});

describe('speechLanguageFor', () => {
  it('maps each translation to its voice group', () => {
    expect(speechLanguageFor('BSB')).toEqual({ group: 'en', tag: 'en-US' });
    expect(speechLanguageFor('CUV-SIMP')).toEqual({ group: 'zh-Hans', tag: 'zh-CN' });
    expect(speechLanguageFor('CUV')).toEqual({ group: 'zh-Hant', tag: 'zh-TW' });
  });
});

describe('voicesFor', () => {
  const all = [...Object.values(VOICES), voice('plain-zh', 'zh')];

  it('ranks simplified Chinese: zh-CN, then untagged Mandarin, then zh-TW, then Cantonese; no English', () => {
    expect(voicesFor(all, 'CUV-SIMP').map((v) => v.id)).toEqual(['tingting', 'plain-zh', 'meijia', 'sinji']);
  });

  it('ranks traditional Chinese with zh-TW first', () => {
    expect(voicesFor(all, 'CUV').map((v) => v.id)).toEqual(['meijia', 'plain-zh', 'tingting', 'sinji']);
  });

  it('gives English text English voices only, the default first', () => {
    expect(voicesFor(all, 'BSB').map((v) => v.id)).toEqual(['samantha', 'daniel']);
  });

  it('prefers offline, then enhanced voices within a step', () => {
    const list = [
      voice('online', 'zh-CN', { localService: false, name: 'A' }),
      voice('plain', 'zh-CN', { name: 'B' }),
      voice('enhanced', 'zh-CN', { enhanced: true, name: 'C' }),
    ];
    expect(voicesFor(list, 'CUV-SIMP').map((v) => v.id)).toEqual(['enhanced', 'plain', 'online']);
  });
});

describe('voicesFor on real device lists', () => {
  it('iOS: novelty and Eloquence voices go last', () => {
    const list = [
      voice('com.apple.speech.synthesis.voice.Albert', 'en-US', { name: 'Albert' }),
      voice('com.apple.eloquence.en-US.Eddy', 'en-US', { name: 'Eddy' }),
      voice('com.apple.voice.compact.en-US.Samantha', 'en-US', { name: 'Samantha' }),
    ];
    expect(voicesFor(list, 'BSB').map((v) => v.name)).toEqual(['Samantha', 'Albert', 'Eddy']);
  });

  it('Android: en-US first, then en-GB, and offline before network within a region', () => {
    const list = [
      voice('en-au-x-aua-local', 'en-AU', { name: 'en-au-x-aua-local' }),
      voice('en-gb-x-gba-local', 'en-GB', { name: 'en-gb-x-gba-local' }),
      voice('en-us-x-sfg-network', 'en-US', { name: 'en-us-x-sfg-network', localService: false }),
      voice('en-us-x-iob-local', 'en-US', { name: 'en-us-x-iob-local' }),
    ];
    expect(voicesFor(list, 'BSB').map((v) => v.id)).toEqual([
      'en-us-x-iob-local',
      'en-us-x-sfg-network',
      'en-gb-x-gba-local',
      'en-au-x-aua-local',
    ]);
  });
});

describe('natural voices', () => {
  const offline = voice('david', 'en-US', { name: 'Microsoft David - English (United States)', isDefault: true });
  const edge = voice('ava', 'en-US', { name: 'Microsoft Ava Online (Natural) - English (United States)', localService: false });
  const chrome = voice('g', 'en-US', { name: 'Google US English', localService: false });

  it('puts a natural voice ahead of the old offline default', () => {
    expect(voicesFor([offline, edge], 'BSB')[0]).toBe(edge);
    expect(voicesFor([offline, chrome], 'BSB')[0]).toBe(chrome);
  });

  it('keeps the language order: a natural English voice never reads Chinese', () => {
    const zh = voice('huihui', 'zh-CN', { name: 'Microsoft Huihui - Chinese (Simplified, PRC)' });
    expect(voicesFor([edge, zh], 'CUV-SIMP').map((v) => v.id)).toEqual(['huihui']);
  });

  it('still honours a voice the person chose', () => {
    expect(pickVoice([offline, edge], 'BSB', 'david')).toBe(offline);
  });
});

describe('pickVoice', () => {
  const all = Object.values(VOICES);

  it('keeps the remembered voice while it is on the device', () => {
    expect(pickVoice(all, 'CUV-SIMP', 'meijia')?.id).toBe('meijia');
  });

  it('ignores a remembered voice that is gone or of another language', () => {
    expect(pickVoice(all, 'CUV-SIMP', 'removed')?.id).toBe('tingting');
    expect(pickVoice(all, 'CUV-SIMP', 'samantha')?.id).toBe('tingting');
  });

  it('never falls back to another language: Chinese text with only English voices has no voice', () => {
    expect(pickVoice([VOICES.samantha, VOICES.daniel], 'CUV-SIMP', undefined)).toBeNull();
    expect(pickVoice([VOICES.tingting], 'BSB', undefined)).toBeNull();
    expect(pickVoice([], 'BSB', undefined)).toBeNull();
  });
});
