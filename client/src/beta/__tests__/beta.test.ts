// Acceptance (orchestrator-owned, B-1): the beta label on the Chinese interface choice.
import { createT } from '../../i18n/translate';
import { languageLabelKey, showChineseBetaNote } from '../index';

const saved = process.env.EXPO_PUBLIC_RELEASE_CHANNEL;
afterEach(() => {
  if (saved === undefined) delete process.env.EXPO_PUBLIC_RELEASE_CHANNEL;
  else process.env.EXPO_PUBLIC_RELEASE_CHANNEL = saved;
});

describe('languageLabelKey', () => {
  it('labels Simplified Chinese as beta in a beta build', () => {
    process.env.EXPO_PUBLIC_RELEASE_CHANNEL = 'beta';
    expect(languageLabelKey('zh-Hans')).toBe('beta.language.zh-Hans');
    expect(languageLabelKey('en')).toBe('language.en');
    expect(languageLabelKey('system')).toBe('language.system');
    expect(createT('en')(languageLabelKey('zh-Hans'))).toBe('简体中文（测试版）');
    expect(createT('zh-Hans')(languageLabelKey('zh-Hans'))).toBe('简体中文（测试版）');
    expect(showChineseBetaNote()).toBe(true);
  });

  it('uses the plain labels outside a beta build', () => {
    delete process.env.EXPO_PUBLIC_RELEASE_CHANNEL;
    expect(languageLabelKey('zh-Hans')).toBe('language.zh-Hans');
    expect(languageLabelKey('en')).toBe('language.en');
    expect(showChineseBetaNote()).toBe(false);
  });

  it('has the beta note in both languages', () => {
    expect(createT('en')('beta.language.note')).toBe('The Chinese interface is in beta. Some wording may still change.');
    expect(createT('zh-Hans')('beta.language.note')).toBe('中文界面仍在测试阶段，部分用语可能还会调整。');
    expect(createT('en')('beta.badge')).toBe('Beta');
    expect(createT('zh-Hans')('beta.badge')).toBe('测试版');
  });
});
