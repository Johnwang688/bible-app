// The Me tab is a stack: Me, then Customise → Advanced, Sources and credits, About and privacy, Help.
import { Stack } from 'expo-router';

export default function MeLayout() {
  return <Stack screenOptions={{ headerShown: false }} />;
}
