// Step 3: your age (r7a-age.html, with GO-AHEAD's decisions). Optional, one band at most (press the chosen one
// again to clear it), and saved only on this device. "Prefer not to say" saves no age.
import { ScrollView, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { AGE_RANGES } from '../keys';
import { AgeChip } from '../components/AgeChip';
import { RadioGroup } from '../components/RadioGroup';
import { StepFrame } from '../components/StepFrame';
import { StepHeading } from '../components/StepHeading';
import { TextCard } from '../components/TextCard';
import { useRadioKeys } from '../components/useRadioKeys';
import type { AgeChoice, StepProps } from './types';

/** The chips in order: the stored bands, then "Prefer not to say" (which stores no age). */
const CHOICES: readonly Exclude<AgeChoice, null>[] = [...AGE_RANGES, 'none'];

export function AgeStep({
  announce,
  onNext,
  onSkip,
  onBack,
  age,
  onAge,
}: StepProps & { age: AgeChoice; onAge(age: AgeChoice): void }) {
  const theme = useTheme();
  const t = useT();
  const title = t('onboarding.age.title');
  const keys = useRadioKeys(CHOICES.length, age === null ? -1 : CHOICES.indexOf(age), (i) => onAge(CHOICES[i]!));
  const note = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') } as const;

  return (
    <StepFrame testID="first-run-age" step={3} ctaKey="onboarding.startReading" onCta={onNext} onSkip={onSkip} onBack={onBack}>
      <ScrollView style={{ flex: 1 }} contentContainerStyle={{ gap: 16, paddingHorizontal: 24, paddingTop: 8, paddingBottom: 16 }}>
        <View style={{ gap: 6 }}>
          <StepHeading focusOnMount={announce}>{title}</StepHeading>
          <TextCard testID="age-note-card" style={{ paddingHorizontal: 14, paddingVertical: 10, gap: 6 }}>
            <Text style={[note, { fontSize: 15, lineHeight: 21 }]}>{t('onboarding.age.optional')}</Text>
            <Text style={[note, { fontSize: 13, lineHeight: 18 }]}>{t('onboarding.age.why')}</Text>
          </TextCard>
        </View>
        <RadioGroup label={title} style={{ flexDirection: 'row', flexWrap: 'wrap', gap: 10 }}>
          {CHOICES.map((choice, i) => (
            <AgeChip
              key={choice}
              label={t(`onboarding.age.${choice}`)}
              checked={age === choice}
              onPress={() => onAge(age === choice ? null : choice)}
              keyProps={keys(i)}
            />
          ))}
        </RadioGroup>
      </ScrollView>
    </StepFrame>
  );
}
