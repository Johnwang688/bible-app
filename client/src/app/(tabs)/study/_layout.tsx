// The Study tab's stack: Study itself, then Memory and its week on top (the tab bar stays visible).
import { Stack } from 'expo-router';

import { useTheme } from '../../../theme/ThemeProvider';

export default function StudyLayout() {
  const theme = useTheme();
  return <Stack screenOptions={{ headerShown: false, contentStyle: { backgroundColor: theme.colors.base } }} />;
}
