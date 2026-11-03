// Acceptance (orchestrator-owned, B-1): the privacy policy page at /privacy.
// Design: design/proposed/b1-privacy.html (approved 11-02) plus the UI/UX review fixes; copy v2: b1/privacy-copy.md.
import * as Clipboard from 'expo-clipboard';
import { act, fireEvent, render, screen, within } from '@testing-library/react-native';
import type { ReactElement } from 'react';
import { Linking, StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { PRIVACY_CONTACT, PRIVACY_SECTIONS, privacyLocale } from '../index';
import { PrivacyScreen } from '../PrivacyScreen';

jest.mock('expo-clipboard', () => ({ setStringAsync: jest.fn(async () => true) }));

const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };

const savedChannel = process.env.EXPO_PUBLIC_RELEASE_CHANNEL;
afterEach(() => {
  if (savedChannel === undefined) delete process.env.EXPO_PUBLIC_RELEASE_CHANNEL;
  else process.env.EXPO_PUBLIC_RELEASE_CHANNEL = savedChannel;
  jest.restoreAllMocks();
});

async function renderPage(ui: ReactElement, locales: readonly DeviceLocale[] = [EN]) {
  const storage = createStorage(memoryBackend());
  const result = await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={locales}>
        <ThemeProvider storage={storage} systemScheme="light">
          {ui}
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
  return { ...result, storage };
}

const noop = () => {};
const page = (props: Partial<Parameters<typeof PrivacyScreen>[0]> = {}) => (
  <PrivacyScreen canGoBack={false} onBack={noop} onOpenApp={noop} {...props} />
);

const EN_HEADINGS = [
  'Privacy policy',
  'The short version',
  'What we don’t do',
  'On your device',
  'What the app downloads',
  'The website and fonts',
  'If you sign in (optional)',
  'Delete your data',
  'Children and teens',
  'Questions',
  'Changes to this policy',
];
const ZH_HEADINGS = [
  '隐私政策',
  '简要说明',
  '我们不做的事',
  '保存在你设备上的内容',
  '应用会下载什么',
  '网站和字体',
  '如果你登录（可选）',
  '删除你的数据',
  '儿童和青少年',
  '联系我们',
  '本政策的变更',
];

/** Text of every node with the header role, in render order. */
const headings = () =>
  screen.queryAllByRole('header').map((n) => {
    const c = n.props.children;
    return Array.isArray(c) ? c.join('') : String(c);
  });

const style = (testID: string) => StyleSheet.flatten(screen.getByTestId(testID).props.style) ?? {};

describe('privacyLocale', () => {
  it('uses the interface language unless the URL names one', () => {
    expect(privacyLocale(undefined, 'en')).toBe('en');
    expect(privacyLocale(undefined, 'zh-Hans')).toBe('zh-Hans');
    expect(privacyLocale('zh-Hans', 'en')).toBe('zh-Hans');
    expect(privacyLocale('zh', 'en')).toBe('zh-Hans');
    expect(privacyLocale('en', 'zh-Hans')).toBe('en');
    expect(privacyLocale(['zh-Hans', 'en'], 'en')).toBe('zh-Hans');
    expect(privacyLocale('fr', 'zh-Hans')).toBe('zh-Hans');
    expect(privacyLocale('', 'en')).toBe('en');
  });

  it('lists the cards in the reviewed order', () => {
    expect(PRIVACY_SECTIONS).toEqual(['never', 'device', 'server', 'hosting', 'account', 'delete', 'children', 'contact', 'changes']);
  });

  it('keeps the contact address in one constant (placeholder until John gives one)', () => {
    expect(typeof PRIVACY_CONTACT).toBe('string');
    expect(PRIVACY_CONTACT.trim()).not.toBe('');
  });
});

describe('PrivacyScreen', () => {
  it('shows the short version, then every card in order, in English', async () => {
    await renderPage(page());
    expect(screen.getByTestId('screen-privacy')).toBeTruthy();
    expect(headings()).toEqual(EN_HEADINGS);
    expect(screen.getByText('Last updated 2 November 2026')).toBeTruthy();
    const short = within(screen.getByTestId('privacy-short'));
    for (const line of [
      'No account needed. What you save stays on your device.',
      'No ads, no analytics, no tracking.',
      'Signing in is optional. It copies your study data to your account so it syncs.',
      'You can delete your data at any time.',
    ])
      expect(short.getByText(line)).toBeTruthy();
  });

  it('leads every card with a bold one-line summary', async () => {
    await renderPage(page());
    for (const id of PRIVACY_SECTIONS) {
      const s = style(`privacy-${id}-summary`);
      // Bold through the font weight or a bold face of the UI font.
      const bold = s.fontWeight === '700' || s.fontWeight === 'bold' || /700|Bold/.test(String(s.fontFamily ?? ''));
      expect({ id, bold }).toEqual({ id, bold: true });
    }
  });

  it('says the data is shared only with the services that run the app', async () => {
    await renderPage(page());
    expect(screen.getByText(/except the services that run the app, listed below/)).toBeTruthy();
  });

  it('explains deletion: the signed-in button, clearing site data, and the 30-day logs', async () => {
    await renderPage(page());
    const card = within(screen.getByTestId('privacy-delete'));
    expect(card.getByText(/“Delete account and synced data”/)).toBeTruthy();
    expect(card.getByText(/clear this site’s data in your browser, or uninstall the app/)).toBeTruthy();
    expect(card.getByText(/deleted on their own after 30 days/)).toBeTruthy();
  });

  it('states the under-13 rule and how to see, correct or delete data', async () => {
    const first = await renderPage(page());
    const card = within(screen.getByTestId('privacy-children'));
    expect(card.getByText(/If you choose “Under 13” when you first open the app, sign-in and sync are turned off\./)).toBeTruthy();
    expect(card.getByText(/see, correct or delete your data/)).toBeTruthy();
    await first.unmount();
    await renderPage(page(), [ZH]);
    expect(within(screen.getByTestId('privacy-children')).getByText(/“13 岁以下”/)).toBeTruthy();
  });

  it('has no beta badge; the beta line sits in "Changes to this policy", in beta builds only', async () => {
    process.env.EXPO_PUBLIC_RELEASE_CHANNEL = 'beta';
    const beta = await renderPage(page());
    expect(screen.queryByTestId('privacy-beta-badge')).toBeNull();
    expect(within(screen.getByTestId('privacy-changes')).getByText('The app is in beta, so features may still change.')).toBeTruthy();
    await beta.unmount();
    delete process.env.EXPO_PUBLIC_RELEASE_CHANNEL;
    await renderPage(page());
    expect(screen.queryByText('The app is in beta, so features may still change.')).toBeNull();
    expect(headings()).toEqual(EN_HEADINGS);
  });

  it('follows a Chinese interface', async () => {
    await renderPage(page(), [ZH]);
    expect(headings()).toEqual(ZH_HEADINGS);
    expect(screen.getByText('最后更新：2026 年 11 月 2 日')).toBeTruthy();
    expect(screen.getByTestId('privacy-language')).toHaveTextContent('English');
    // Chinese headings use no letter spacing.
    for (const n of screen.getAllByRole('header')) {
      expect(StyleSheet.flatten(n.props.style)?.letterSpacing ?? 0).toBe(0);
    }
  });

  it('opens in the language the URL names', async () => {
    await renderPage(page({ lang: 'zh-Hans' }), [EN]);
    expect(headings()[0]).toBe('隐私政策');
  });

  it('switches only this page between the languages', async () => {
    const { storage } = await renderPage(page());
    const button = screen.getByTestId('privacy-language');
    expect(button.props.accessibilityRole).toBe('button');
    expect(button).toHaveTextContent('简体中文');
    await act(async () => fireEvent.press(button));
    expect(headings()[0]).toBe('隐私政策');
    expect(screen.getByTestId('privacy-language')).toHaveTextContent('English');
    await act(async () => fireEvent.press(screen.getByTestId('privacy-language')));
    expect(headings()[0]).toBe('Privacy policy');
    // The interface language is not changed.
    expect(storage.get(languageKey)).toBe('system');
  });

  it('goes back when there is somewhere to go back to', async () => {
    const onBack = jest.fn();
    const onOpenApp = jest.fn();
    await renderPage(page({ canGoBack: true, onBack, onOpenApp }));
    expect(screen.queryByTestId('privacy-open-app')).toBeNull();
    const back = screen.getByTestId('privacy-back');
    expect(back.props.accessibilityRole).toBe('button');
    expect(back.props.accessibilityLabel).toBe('Back');
    await act(async () => fireEvent.press(back));
    expect(onBack).toHaveBeenCalledTimes(1);
    expect(onOpenApp).not.toHaveBeenCalled();
  });

  it('offers "Open the app" when opened directly', async () => {
    const onBack = jest.fn();
    const onOpenApp = jest.fn();
    await renderPage(page({ canGoBack: false, onBack, onOpenApp }));
    expect(screen.queryByTestId('privacy-back')).toBeNull();
    const open = screen.getByTestId('privacy-open-app');
    expect(open.props.accessibilityRole).toBe('button');
    expect(open).toHaveTextContent('Open the app');
    await act(async () => fireEvent.press(open));
    expect(onOpenApp).toHaveBeenCalledTimes(1);
    expect(onBack).not.toHaveBeenCalled();
  });

  it('keeps every top-bar control and the contact row at least 44 pt tall', async () => {
    await renderPage(page());
    for (const id of ['privacy-open-app', 'privacy-language', 'privacy-email', 'privacy-email-copy']) {
      const s = style(id);
      const h = Math.max(Number(s.minHeight ?? 0), Number(s.height ?? 0));
      expect({ id, h: h >= 44 }).toEqual({ id, h: true });
    }
  });

  it('"Email us" opens a mailto link to the contact address', async () => {
    const open = jest.spyOn(Linking, 'openURL').mockResolvedValue(undefined);
    await renderPage(page());
    const row = screen.getByTestId('privacy-email');
    expect(row).toHaveTextContent(/Email us/);
    expect(row).toHaveTextContent(new RegExp(PRIVACY_CONTACT.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')));
    expect(['link', 'button']).toContain(row.props.accessibilityRole);
    await act(async () => fireEvent.press(row));
    expect(open).toHaveBeenCalledWith(`mailto:${PRIVACY_CONTACT}`);
  });

  it('copies the contact address and says so', async () => {
    await renderPage(page());
    const copy = screen.getByTestId('privacy-email-copy');
    expect(copy.props.accessibilityRole).toBe('button');
    expect(copy.props.accessibilityLabel).toBe('Copy email address');
    await act(async () => fireEvent.press(copy));
    expect(jest.mocked(Clipboard.setStringAsync)).toHaveBeenCalledWith(PRIVACY_CONTACT);
    expect(screen.getByText('Email address copied')).toBeTruthy();
  });

  it('leaves no placeholder braces in any text', async () => {
    await renderPage(page());
    // JSON keys are quoted ({"type"), so only an unfilled {placeholder} can match.
    expect(JSON.stringify(screen.toJSON())).not.toMatch(/\{\w+\}/);
  });
});
