// The privacy policy page (B-1), at /privacy and outside the tabs. Everything on it is in the bundle:
// nothing is fetched, so it works offline. The language button changes this page only.
import * as Clipboard from 'expo-clipboard';
import { useEffect, useMemo, useRef, useState, type ReactNode } from 'react';
import {
  Linking,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  View,
  type NativeScrollEvent,
  type NativeSyntheticEvent,
} from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { isBetaBuild } from '../api/config';
import { GlassSurface } from '../components/GlassSurface';
import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import { createT, type TFunction } from '../i18n/translate';
import type { AppLocale } from '../i18n/types';
import { Icon } from '../reader/components/icons';
import { useTheme } from '../theme/ThemeProvider';
import type { Theme } from '../theme/types';
import { HouseIcon } from './HouseIcon';
import { PRIVACY_CONTACT, PRIVACY_SECTIONS, PRIVACY_SHORT_KEYS, privacyBulletKeys, privacyLocale, type PrivacySection } from './index';

const COLUMN_WIDTH = 720;
const COPIED_MS = 3000;

export interface PrivacyScreenProps {
  /** The URL's `lang` parameter: `en`, `zh-Hans` or `zh`. Anything else follows the interface language. */
  lang?: string | string[];
  /** There is a page to go back to (the app opened this page); otherwise "Open the app" is shown. */
  canGoBack: boolean;
  onBack: () => void;
  onOpenApp: () => void;
}

export function PrivacyScreen({ lang, canGoBack, onBack, onOpenApp }: PrivacyScreenProps) {
  const theme = useTheme();
  const insets = useSafeAreaInsets();
  const { locale: interfaceLocale } = useI18n();
  // The language button sets only this; the app's own language setting is never written.
  const [chosen, setChosen] = useState<AppLocale | null>(null);
  const locale = chosen ?? privacyLocale(lang, interfaceLocale);
  const t = useMemo(() => createT(locale), [locale]);
  const zh = locale === 'zh-Hans';
  // The UI fonts have no Chinese glyphs, so Chinese falls back to the system font: ask it for bold too.
  const cjkBold = zh ? ({ fontWeight: '700' } as const) : null;
  const [scrolled, setScrolled] = useState(false);
  const beta = isBetaBuild();

  const onScroll = (e: NativeSyntheticEvent<NativeScrollEvent>) => {
    const past = e.nativeEvent.contentOffset.y > 4;
    setScrolled((was) => (was === past ? was : past));
  };

  const body = {
    fontFamily: uiFace(theme.type.ui, '400'),
    fontSize: zh ? 16 : 15,
    lineHeight: zh ? 26 : 22,
    color: theme.colors.text,
  } as const;

  return (
    <View testID="screen-privacy" style={[styles.fill, theme.backgrounds.app]}>
      <View style={{ paddingTop: insets.top }}>
        {scrolled ? <GlassSurface background={theme.backgrounds.tabBar} style={StyleSheet.absoluteFill} /> : null}
        {scrolled ? (
          <View
            pointerEvents="none"
            style={[
              StyleSheet.absoluteFill,
              { borderBottomWidth: theme.borders.tabBar.width, borderBottomColor: theme.borders.tabBar.color },
            ]}
          />
        ) : null}
        <View style={[styles.column, styles.bar]}>
          {canGoBack ? (
            <Pressable
              testID="privacy-back"
              accessibilityRole="button"
              accessibilityLabel={t('privacy.back')}
              onPress={onBack}
              style={({ pressed }) => [styles.control, styles.iconControl, pressed && styles.pressed]}
            >
              <Icon name="chevronLeft" color={theme.colors.text} size={24} />
            </Pressable>
          ) : (
            <Pressable
              testID="privacy-open-app"
              accessibilityRole="button"
              onPress={onOpenApp}
              style={({ pressed }) => [styles.control, styles.rowControl, pressed && styles.pressed]}
            >
              <HouseIcon color={theme.colors.text} />
              <Text style={[styles.controlText, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }]}>
                {t('privacy.openApp')}
              </Text>
            </Pressable>
          )}
          <Pressable
            testID="privacy-language"
            accessibilityRole="button"
            onPress={() => setChosen(zh ? 'en' : 'zh-Hans')}
            style={({ pressed }) => [styles.control, styles.rowControl, styles.end, pressed && styles.pressed]}
          >
            <Text
              style={[
                styles.controlText,
                { color: theme.colors.accent, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 },
              ]}
            >
              {t('privacy.switchLanguage')}
            </Text>
          </Pressable>
        </View>
      </View>

      <ScrollView
        onScroll={onScroll}
        scrollEventThrottle={16}
        contentContainerStyle={[styles.content, { paddingBottom: insets.bottom + 48 }]}
      >
        <View style={[styles.column, styles.stack]}>
          <View style={styles.titleBlock}>
            <Text
              accessibilityRole="header"
              style={{
                color: theme.colors.text,
                fontFamily: uiFace(theme.type.head, theme.type.headWeight),
                fontSize: theme.type.headSize,
                letterSpacing: 0,
              }}
            >
              {t('privacy.title')}
            </Text>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: zh ? 14 : 13, lineHeight: 20 }}>
              {t('privacy.updated')}
            </Text>
          </View>

          <Card testID="privacy-short" theme={theme}>
            <CardHeader theme={theme} bold={zh} text={t('privacy.short.title')} />
            {PRIVACY_SHORT_KEYS.map((key) => (
              <Bullet key={key} theme={theme} text={t(key)} body={body} />
            ))}
          </Card>

          <Text
            style={{
              color: theme.colors.text,
              fontFamily: uiFace(theme.type.ui, '400'),
              fontSize: zh ? 18 : 17,
              lineHeight: zh ? 28 : 26,
              paddingVertical: 2,
            }}
          >
            {t('privacy.intro')}
          </Text>

          {PRIVACY_SECTIONS.map((id) => (
            <Card key={id} testID={`privacy-${id}`} theme={theme}>
              <CardHeader theme={theme} bold={zh} text={t(`privacy.${id}.title`)} />
              <Text
                testID={`privacy-${id}-summary`}
                style={[body, { fontFamily: uiFace(theme.type.ui, '700') }, cjkBold]}
              >
                {t(`privacy.${id}.summary`)}
              </Text>
              {id === 'contact' ? <EmailRow theme={theme} t={t} body={body} /> : null}
              {privacyBulletKeys(id as PrivacySection, beta).map((key) => (
                <Bullet key={key} theme={theme} text={t(key)} body={body} />
              ))}
            </Card>
          ))}
        </View>
      </ScrollView>
    </View>
  );
}

type Body = {
  readonly fontFamily: string;
  readonly fontSize: number;
  readonly lineHeight: number;
  readonly color: string;
};

/** A card in the current style: the surface fill, the card border, radius and shadow. */
function Card({ theme, testID, children }: { theme: Theme; testID: string; children: ReactNode }) {
  return (
    <GlassSurface
      testID={testID}
      background={theme.backgrounds.surface}
      style={{
        padding: 16,
        gap: 10,
        borderRadius: theme.radii.card,
        borderWidth: theme.borders.card.width,
        borderColor: theme.borders.card.color,
        boxShadow: theme.shadows.card ?? undefined,
      }}
    >
      {children}
    </GlassSurface>
  );
}

function CardHeader({ theme, text, bold }: { theme: Theme; text: string; bold?: boolean }) {
  return (
    <Text
      accessibilityRole="header"
      style={[{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 18, letterSpacing: 0 }, bold ? { fontWeight: '700' } : null]}
    >
      {text}
    </Text>
  );
}

/** A short bullet: a small dot in the muted colour, then the text. */
function Bullet({ theme, text, body }: { theme: Theme; text: string; body: Body }) {
  return (
    <View style={styles.bullet}>
      <View
        style={[styles.dot, { backgroundColor: theme.colors.muted, marginTop: (body.lineHeight - DOT) / 2 }]}
        accessible={false}
      />
      <Text style={[body, styles.bulletText]}>{text}</Text>
    </View>
  );
}

/** "Email us": a mailto row and a copy button beside it. */
function EmailRow({ theme, t, body }: { theme: Theme; t: TFunction; body: Body }) {
  const [copied, setCopied] = useState(false);
  const timer = useRef<ReturnType<typeof setTimeout> | null>(null);
  useEffect(
    () => () => {
      if (timer.current) clearTimeout(timer.current);
    },
    [],
  );

  const copy = async () => {
    try {
      await Clipboard.setStringAsync(PRIVACY_CONTACT);
    } catch {
      // The clipboard is unavailable; the address is on screen to copy by hand.
      return;
    }
    setCopied(true);
    if (timer.current) clearTimeout(timer.current);
    timer.current = setTimeout(() => setCopied(false), COPIED_MS);
  };

  return (
    <View>
      <View style={styles.emailLine}>
        <Pressable
          testID="privacy-email"
          accessibilityRole="link"
          onPress={() => void Linking.openURL('mailto:' + PRIVACY_CONTACT)}
          style={({ pressed }) => [styles.emailRow, pressed && styles.pressed]}
        >
          <Text style={[body, { fontFamily: uiFace(theme.type.ui, '700'), color: theme.colors.accent, textDecorationLine: 'underline' }]}>
            {t('privacy.contact.email')}
          </Text>
          <Text style={[body, { color: theme.colors.muted }]}>{PRIVACY_CONTACT}</Text>
        </Pressable>
        <Pressable
          testID="privacy-email-copy"
          accessibilityRole="button"
          accessibilityLabel={t('privacy.contact.copy')}
          onPress={() => void copy()}
          style={({ pressed }) => [styles.control, styles.iconControl, pressed && styles.pressed]}
        >
          <Icon name="copy" color={theme.colors.text} size={20} />
        </Pressable>
      </View>
      <Text accessibilityLiveRegion="polite" style={[body, { color: theme.colors.muted }]}>
        {copied ? t('privacy.contact.copied') : ''}
      </Text>
    </View>
  );
}

const DOT = 5;

const styles = StyleSheet.create({
  fill: { flex: 1 },
  column: { width: '100%', maxWidth: COLUMN_WIDTH, alignSelf: 'center' },
  bar: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', minHeight: 44, paddingHorizontal: 20 },
  content: { paddingHorizontal: 20, paddingTop: 6 },
  stack: { gap: 14 },
  titleBlock: { gap: 10 },
  control: { minHeight: 44, minWidth: 44, alignItems: 'center', justifyContent: 'center' },
  iconControl: { alignSelf: 'center' },
  rowControl: { flexDirection: 'row', gap: 6 },
  end: { justifyContent: 'flex-end' },
  controlText: { fontSize: 15 },
  pressed: { opacity: 0.6 },
  bullet: { flexDirection: 'row', gap: 10 },
  dot: { width: DOT, height: DOT, borderRadius: DOT / 2 },
  bulletText: { flex: 1 },
  emailLine: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  emailRow: { flex: 1, minHeight: 44, justifyContent: 'center' },
});
