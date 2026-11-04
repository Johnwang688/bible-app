import { act, render } from '@testing-library/react-native';
import * as RN from 'react-native';

import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { I18nProvider, useT } from '../I18nProvider';
import { desktopEn, desktopZhHans } from '../messages/desktop';
import { en, type MessageKey } from '../messages/en';
import { zhHans } from '../messages/zh-Hans';
import { createT, type TFunction } from '../translate';

const placeholders = (s: string) => [...s.matchAll(/\{(\w+)\}/g)].map((m) => m[1]).sort();

it('has matching override keys and preserves the base placeholders in both languages', () => {
  expect(Object.keys(desktopEn).sort()).toEqual(Object.keys(desktopZhHans).sort());
  for (const key of Object.keys(desktopEn) as MessageKey[]) {
    expect(placeholders(desktopEn[key]!)).toEqual(placeholders(en[key]));
    expect(placeholders(desktopZhHans[key]!)).toEqual(placeholders(zhHans[key]));
    expect(key.startsWith('privacy.')).toBe(false);
  }
});

it('overrides every phone/tap instruction from the joined catalogues without changing base values', () => {
  for (const [locale, catalogue, overrides] of [['en', en, desktopEn], ['zh-Hans', zhHans, desktopZhHans]] as const) {
    for (const key of Object.keys(catalogue) as MessageKey[]) {
      const text = catalogue[key];
      if (!key.startsWith('privacy.') && /\bphone\b|\btap\b|手机|点按/i.test(text)) {
        expect(overrides[key]).toBeDefined();
        expect(createT(locale, true)(key)).not.toMatch(/\bphone\b|\btap\b|手机|点按/i);
      }
      expect(createT(locale)(key)).toBe(text);
    }
  }
});

it('uses overrides first, falls back, interpolates and keeps privacy frozen', () => {
  expect(createT('en')('mode.system')).toBe('Follow the phone');
  expect(createT('en', true)('mode.system')).toBe('Follow this device');
  expect(createT('zh-Hans', true)('mode.system')).toBe('跟随设备');
  expect(createT('en', true)('tabs.home')).toBe('Home');
  expect(createT('en', true)('reader.chapterTitle', { book: 'John', chapter: 3 })).toBe('John 3');
  expect(createT('en', true)('privacy.children.age')).toBe(en['privacy.children.age']);
});

it('fixes Help sync wording at every width in both languages', () => {
  expect(createT('en')('help.sync.a')).toBe('Yes. Sign in on the new phone and your highlights, notes, progress and settings sync across.');
  expect(createT('zh-Hans')('help.sync.a')).toBe('可以。在新手机上登录后，你的高亮、笔记、进度和设置都会同步过去。');
  expect(createT('en', true)('help.sync.a')).toContain('new device');
  expect(createT('zh-Hans', true)('help.sync.a')).toContain('新设备');
});

it('only replaces t when the breakpoint or locale changes', async () => {
  const setWidth = async (width: number) => act(() => RN.Dimensions.set({
    window: { width, height: 900, scale: 1, fontScale: 1 },
    screen: { width, height: 900, scale: 1, fontScale: 1 },
  }));
  await setWidth(767);
  const storage = createStorage(memoryBackend());
  const seen: TFunction[] = [];
  function Probe() { seen.push(useT()); return null; }
  const tree = () => <I18nProvider storage={storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}><Probe /></I18nProvider>;
  const { rerender } = await render(tree());
  const phone = seen.at(-1)!;
  await setWidth(768);
  await rerender(tree());
  const desktop = seen.at(-1)!;
  expect(desktop).not.toBe(phone);
  expect(desktop('mode.system')).toBe('Follow this device');
  await setWidth(1440);
  await rerender(tree());
  expect(seen.at(-1)).toBe(desktop);
  await act(() => storage.set(languageKey, 'zh-Hans'));
  expect(seen.at(-1)).not.toBe(desktop);
  expect(seen.at(-1)!('mode.system')).toBe('跟随设备');
});
