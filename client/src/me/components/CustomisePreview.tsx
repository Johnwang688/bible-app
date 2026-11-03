// The live preview: a small Home built from the live theme, so every change shows at once.
// It is Home at phone size (390 x 844) scaled down inside a fixed frame, as in the design.
import { useEffect, useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { ensureFont, LAZY_FONT_FAMILY } from '../../fonts/lazy';
import { scriptureFace, uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { TEXT_SIZES } from '../../storage/keys';
import { useTheme } from '../../theme/ThemeProvider';

export const PREVIEW_WIDTH = 164;
const SCALE = 0.42;
const HOME_WIDTH = 390;
const HOME_HEIGHT = 844;

let chineseLoaded = false;

/** Noto Serif SC for Chinese Scripture, once loaded (the system font until then). */
function useChineseFont(needed: boolean): string | undefined {
  const [, setTick] = useState(0);
  useEffect(() => {
    if (!needed || chineseLoaded) return;
    let live = true;
    ensureFont('chineseScripture')
      .then(() => {
        chineseLoaded = true;
        if (live) setTick((n) => n + 1);
      })
      .catch(() => undefined);
    return () => {
      live = false;
    };
  }, [needed]);
  return needed && chineseLoaded ? LAZY_FONT_FAMILY.chineseScripture : undefined;
}

export function CustomisePreview({ textSize }: { textSize: number }) {
  const theme = useTheme();
  const { t, locale, formatNumber } = useI18n();
  const zh = locale === 'zh-Hans';
  const chineseFont = useChineseFont(zh);
  const size = TEXT_SIZES[textSize] ?? TEXT_SIZES[0];
  const ui = (weight: '400' | '700' | '800') => uiFace(theme.type.ui, weight);
  return (
    <View
      testID="customise-preview"
      accessible
      accessibilityRole="image"
      accessibilityLabel={t('customise.preview')}
      style={[styles.frame, { borderColor: theme.colors.muted }]}
    >
      <View pointerEvents="none" style={[styles.home, theme.backgrounds.app]}>
        <Text style={{ color: theme.colors.muted, fontFamily: ui('700'), fontSize: 14, letterSpacing: 0.6, textTransform: 'uppercase' }}>
          {t('customise.preview.verseOfDay')}
        </Text>
        <GlassSurface
          background={theme.backgrounds.surface}
          style={{
            borderRadius: theme.radii.card,
            borderWidth: theme.borders.card.width,
            borderColor: theme.borders.card.color,
            padding: 20,
            gap: 12,
          }}
        >
          <Text
            testID="customise-preview-verse"
            style={{
              color: theme.colors.text,
              fontFamily: zh ? chineseFont : scriptureFace(theme.type.scripture),
              fontSize: size,
              lineHeight: Math.round(size * (zh ? 1.8 : 1.5)),
            }}
          >
            {t('customise.preview.verse')}
          </Text>
          <Text style={{ color: theme.colors.muted, fontFamily: ui('700'), fontSize: 15 }}>{t('customise.preview.ref')}</Text>
        </GlassSurface>
        <View style={styles.row}>
          <View
            testID="customise-preview-cta"
            style={{
              backgroundColor: theme.colors.cta,
              borderRadius: theme.radii.button,
              minHeight: 56,
              paddingHorizontal: 24,
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: theme.shadows.cta,
            }}
          >
            <Text style={{ color: theme.colors.onCta, fontFamily: ui('700'), fontSize: 17 }}>{t('customise.preview.continue')}</Text>
          </View>
          <View
            testID="customise-preview-accent"
            style={{ backgroundColor: theme.colors.accent, width: 56, height: 56, borderRadius: 28 }}
          />
        </View>
        <Text style={{ color: theme.colors.text, fontFamily: ui('700'), fontSize: 16 }}>
          {t('customise.preview.streak', { n: formatNumber(4) })}
        </Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  frame: {
    width: PREVIEW_WIDTH,
    height: Math.round(HOME_HEIGHT * SCALE),
    flexShrink: 0,
    borderRadius: 22,
    borderWidth: 2,
    overflow: 'hidden',
  },
  home: {
    position: 'absolute',
    left: 0,
    top: 0,
    width: HOME_WIDTH,
    height: HOME_HEIGHT,
    padding: 24,
    paddingTop: 80,
    gap: 18,
    transformOrigin: '0 0',
    transform: [{ scale: SCALE }],
  },
  row: { flexDirection: 'row', alignItems: 'center', gap: 16 },
});
