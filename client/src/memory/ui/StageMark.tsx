// The 4-step mark beside a verse's stage: one pill per step of the ladder, `steps` of them filled. The stage name is
// always written beside it, so the mark is decoration and hidden from assistive technology.
import { StyleSheet, View } from 'react-native';

import { useTheme } from '../../theme/ThemeProvider';

export function StageMark({ steps }: { steps: number }) {
  const theme = useTheme();
  const fill = theme.canvas.bar ?? theme.colors.cta;
  return (
    <View aria-hidden accessibilityElementsHidden importantForAccessibility="no-hide-descendants" style={styles.row}>
      {[0, 1, 2, 3].map((i) => (
        <View
          key={i}
          style={[
            styles.pill,
            i < steps ? { backgroundColor: fill } : { borderWidth: 1.5, borderColor: theme.colors.muted },
          ]}
        />
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  row: { flexDirection: 'row', gap: 3 },
  pill: { width: 15, height: 6, borderRadius: 999 },
});
