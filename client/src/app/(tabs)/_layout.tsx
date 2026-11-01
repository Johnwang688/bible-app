// The four tabs: Home · Bible · Study · Me.
import { Tabs } from 'expo-router/tabs';
import { StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { GlassSurface } from '../../components/GlassSurface';
import { TabIcon, type TabIconName } from '../../components/TabIcon';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { useTheme } from '../../theme/ThemeProvider';

const TABS: { name: string; icon: TabIconName; label: MessageKey; a11y: MessageKey }[] = [
  { name: 'index', icon: 'home', label: 'tabs.home', a11y: 'tabs.home.a11y' },
  { name: 'bible', icon: 'bible', label: 'tabs.bible', a11y: 'tabs.bible.a11y' },
  { name: 'study', icon: 'study', label: 'tabs.study', a11y: 'tabs.study.a11y' },
  { name: 'me', icon: 'me', label: 'tabs.me', a11y: 'tabs.me.a11y' },
];

export default function TabsLayout() {
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  const floating = theme.floatingTabBar;
  const border = theme.borders.tabBar;
  const radius = floating ? theme.radii.card : 0;

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: theme.colors.tabOn,
        tabBarInactiveTintColor: theme.colors.tabOff,
        tabBarActiveBackgroundColor: theme.canvas.tabPill,
        tabBarLabelStyle: { fontFamily: uiFace(theme.type.ui, '700'), fontSize: 12 },
        tabBarItemStyle: { minHeight: 44, borderRadius: theme.radii.button, margin: 4 },
        tabBarStyle: [
          styles.bar,
          {
            borderTopWidth: border.width,
            borderColor: border.color,
            boxShadow: theme.shadows.tabBar ?? undefined,
          },
          floating && {
            position: 'absolute',
            left: 16,
            right: 16,
            bottom: Math.max(insets.bottom, 12),
            borderWidth: border.width,
            borderRadius: radius,
            height: 68,
            paddingBottom: 0,
          },
        ],
        tabBarBackground: () => (
          <GlassSurface
            background={theme.backgrounds.tabBar}
            style={[StyleSheet.absoluteFill, { borderRadius: radius }]}
          />
        ),
      }}
    >
      {TABS.map((tab) => (
        <Tabs.Screen
          key={tab.name}
          name={tab.name}
          options={{
            tabBarLabel: t(tab.label),
            tabBarAccessibilityLabel: t(tab.a11y),
            tabBarButtonTestID: `tab-${tab.icon}`,
            tabBarIcon: ({ color }) => <TabIcon name={tab.icon} color={color} />,
          }}
        />
      ))}
    </Tabs>
  );
}

const styles = StyleSheet.create({
  bar: { backgroundColor: 'transparent', elevation: 0 },
});
