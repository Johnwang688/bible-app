// Step 2: pick your look (r7a-look.html, with GO-AHEAD Major 2). A title and a line, two style cards (pastel,
// then glass), and what light and dark do. The middle scrolls; the header above and the footer below stay
// put, so Continue never falls off at large text or in Chinese. Picking a look re-themes the screen live.
import { useEffect } from 'react';
import { ScrollView, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { ensureLookFonts } from '../../fonts/lookFonts';
import { useI18n } from '../../i18n/I18nProvider';
import { PRESETS, getTheme } from '../../theme/presets';
import { useAppearance, useTheme } from '../../theme/ThemeProvider';
import { DEFAULT_PRESET, type PresetId, type ThemeMode, type ThemeStyle } from '../../theme/types';
import { StepFrame } from '../components/StepFrame';
import { StepHeading } from '../components/StepHeading';
import { StyleCard } from '../components/StyleCard';
import { Swatch } from '../components/swatch';
import { TextCard } from '../components/TextCard';
import type { StepProps } from './types';

const STYLES: readonly ThemeStyle[] = ['pastel', 'glass'];

/** A style's default for a mode: pastel Strawberry milk / Bubblegum night, glass Silver / Graphite. */
const STYLE_DEFAULT: Record<ThemeStyle, Record<ThemeMode, PresetId>> = {
  pastel: { light: 'strawberry-milk', dark: 'bubblegum-night' },
  glass: DEFAULT_PRESET,
};

export function LookStep({ announce, onNext, onSkip, onBack, chooseLook }: StepProps & { chooseLook(id: PresetId): void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const { choice, presetId } = useAppearance();
  const current = PRESETS.find((p) => p.id === presetId)!;
  const pair = current.pair ? PRESETS.find((p) => p.id === current.pair)! : null;
  const followsPhone = choice.mode === 'system';
  // Each style card previews its look's heading font: load those looks' fonts as the picker appears.
  const cardIds = STYLES.map((style) => (current.style === style ? presetId : STYLE_DEFAULT[style][theme.mode]));
  const cardKey = cardIds.join('|');
  useEffect(() => {
    for (const id of cardKey.split('|') as PresetId[]) ensureLookFonts(getTheme(id)).catch(() => undefined);
  }, [cardKey]);
  const small = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 18 } as const;

  return (
    <StepFrame testID="first-run-look" step={2} ctaKey="onboarding.continue" onCta={onNext} onSkip={onSkip} onBack={onBack}>
      <ScrollView
        testID="first-run-look-scroll"
        style={{ flex: 1 }}
        contentContainerStyle={{ gap: 12, paddingHorizontal: 24, paddingTop: 8, paddingBottom: 16 }}
      >
        <View style={{ gap: 6 }}>
          <StepHeading focusOnMount={announce}>{t('onboarding.look.title')}</StepHeading>
          <TextCard testID="look-line-card" style={{ paddingHorizontal: 14, paddingVertical: 10 }}>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 15, lineHeight: 21 }}>
              {t('onboarding.look.line')}
            </Text>
          </TextCard>
        </View>
        {STYLES.map((style) => {
          const inStyle = current.style === style;
          const id = inStyle ? presetId : STYLE_DEFAULT[style][theme.mode];
          return (
            <StyleCard
              key={style}
              style={style}
              cardTheme={getTheme(id)}
              presets={PRESETS.filter((p) => p.style === style && p.mode === theme.mode)}
              selectedId={presetId}
              styleSelected={inStyle}
              onChoose={chooseLook}
            />
          );
        })}
        {followsPhone ? (
          <TextCard testID="look-follow-card" style={{ paddingHorizontal: 14, paddingVertical: 10 }}>
            <View testID="look-follow" style={{ alignItems: 'center', gap: 6 }}>
              <Text style={[small, { textAlign: 'center' }]}>{t('onboarding.look.follow')}</Text>
              {pair ? (
                <View testID="look-pair" style={{ flexDirection: 'row', alignItems: 'center', gap: 8 }}>
                  <Swatch theme={getTheme(pair.id)} size={16} radius={5} edge={theme.colors.muted} />
                  <Text style={small}>
                    {t(pair.mode === 'dark' ? 'onboarding.look.pairDark' : 'onboarding.look.pairLight', { name: t(pair.nameKey) })}
                  </Text>
                </View>
              ) : null}
            </View>
          </TextCard>
        ) : null}
      </ScrollView>
    </StepFrame>
  );
}
