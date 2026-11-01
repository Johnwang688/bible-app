// Acceptance (orchestrator-owned): the i18n provider picks the language, persists it and formats.
import { act, render, screen } from '@testing-library/react-native';
import { Text } from 'react-native';

import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { I18nProvider, useI18n } from '../I18nProvider';
import { interpolate } from '../translate';
import type { DeviceLocale, LanguagePreference } from '../types';

const zhCN: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', scriptCode: null, regionCode: 'CN' };
const enUS: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', scriptCode: null, regionCode: 'US' };

let setPrefRef: ((p: LanguagePreference) => void) | null = null;

function Probe() {
  const { t, locale, preference, setPreference, formatNumber } = useI18n();
  setPrefRef = setPreference;
  return (
    <>
      <Text testID="home">{t('tabs.home')}</Text>
      <Text testID="locale">{locale}</Text>
      <Text testID="pref">{preference}</Text>
      <Text testID="num">{formatNumber(1189)}</Text>
    </>
  );
}

describe('I18nProvider', () => {
  it('follows a Chinese phone with the Simplified interface', () => {
    render(
      <I18nProvider storage={createStorage(memoryBackend())} locales={[zhCN]}>
        <Probe />
      </I18nProvider>,
    );
    expect(screen.getByTestId('home')).toHaveTextContent('首页');
    expect(screen.getByTestId('locale')).toHaveTextContent('zh-Hans');
    expect(screen.getByTestId('pref')).toHaveTextContent('system');
  });

  it('obeys a stored language over the phone', () => {
    const storage = createStorage(memoryBackend());
    storage.set(languageKey, 'en');
    render(
      <I18nProvider storage={storage} locales={[zhCN]}>
        <Probe />
      </I18nProvider>,
    );
    expect(screen.getByTestId('home')).toHaveTextContent('Home');
  });

  it('setPreference switches the interface and saves the choice', () => {
    const storage = createStorage(memoryBackend());
    render(
      <I18nProvider storage={storage} locales={[enUS]}>
        <Probe />
      </I18nProvider>,
    );
    expect(screen.getByTestId('home')).toHaveTextContent('Home');
    act(() => setPrefRef!('zh-Hans'));
    expect(screen.getByTestId('home')).toHaveTextContent('首页');
    expect(storage.get(languageKey)).toBe('zh-Hans');
  });

  it('formats numbers for the locale', () => {
    render(
      <I18nProvider storage={createStorage(memoryBackend())} locales={[enUS]}>
        <Probe />
      </I18nProvider>,
    );
    expect(screen.getByTestId('num')).toHaveTextContent('1,189');
  });

  it('throws a clear error when used outside the provider', () => {
    const spy = jest.spyOn(console, 'error').mockImplementation(() => {});
    expect(() => render(<Probe />)).toThrow(/I18nProvider/);
    spy.mockRestore();
  });
});

describe('interpolate', () => {
  it('fills {placeholders} and leaves unknown ones visible', () => {
    expect(interpolate('{n} of {total} chapters', { n: 3, total: '1,189' })).toBe('3 of 1,189 chapters');
    expect(interpolate('Hi {name}', {})).toBe('Hi {name}');
    expect(interpolate('No params')).toBe('No params');
  });
});
