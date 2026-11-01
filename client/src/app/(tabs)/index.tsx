// The Home tab. Empty in R-0; its screens arrive in later phases.
import { Screen } from '../../components/Screen';

export default function HomeScreen() {
  return <Screen titleKey="screen.home.title" background="app" testID="screen-home" />;
}
