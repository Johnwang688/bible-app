// Help: four questions and their answers.
import { StyleSheet, Text } from 'react-native';

import { uiFace } from '../fonts/fonts';
import { useT } from '../i18n/I18nProvider';
import type { MessageKey } from '../i18n/messages/en';
import { useTheme } from '../theme/ThemeProvider';
import { MeCard, MeInfoScreen } from './components/MeInfoScreen';

const QUESTIONS: readonly { q: MessageKey; a: MessageKey }[] = [
  { q: 'help.highlight.q', a: 'help.highlight.a' },
  { q: 'help.parallel.q', a: 'help.parallel.a' },
  { q: 'help.words.q', a: 'help.words.a' },
  { q: 'help.sync.q', a: 'help.sync.a' },
];

export function HelpScreen({ onBack }: { onBack(): void }) {
  const theme = useTheme();
  const t = useT();
  return (
    <MeInfoScreen testID="screen-help" backID="help-back" titleKey="help.title" onBack={onBack}>
      {QUESTIONS.map(({ q, a }) => (
        <MeCard key={q}>
          <Text accessibilityRole="header" style={[styles.question, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}>
            {t(q)}
          </Text>
          <Text style={[styles.answer, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') }]}>{t(a)}</Text>
        </MeCard>
      ))}
    </MeInfoScreen>
  );
}

const styles = StyleSheet.create({
  question: { fontSize: 17 },
  answer: { fontSize: 15, lineHeight: 22 },
});
