import { router, usePathname } from 'expo-router';
import { useState } from 'react';
import { Platform, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../fonts/fonts';
import { useT } from '../i18n/I18nProvider';
import { Icon } from '../reader/components/icons';
import { buttonStyle } from '../reader/components/ui';
import { useTheme } from '../theme/ThemeProvider';
import { GlassSurface } from './GlassSurface';
import { RAIL } from './layout';
import { useRailWidth } from './RailContext';
import { TabIcon } from './TabIcon';
import { activeRailTab, TABS } from './tabs';
import { useSearchShortcut } from './useSearchShortcut';

const openSearch = () => router.navigate('/search');

/** Rendered before the navigator so this is the first stop in the web's tab order. */
export function RailSkipLink() {
  const rail = useRailWidth();
  const theme = useTheme();
  const t = useT();
  const [focused, setFocused] = useState(false);
  if (Platform.OS !== 'web' || !rail) return null;
  return <Pressable testID="rail-skip" accessibilityRole="link" {...({ href: '#main-content' } as object)} onFocus={() => setFocused(true)} onBlur={() => setFocused(false)}
    onPress={(event) => { event.preventDefault(); if (typeof document !== 'undefined') document.getElementById('main-content')?.focus(); }}
    style={[styles.skip, { top: focused ? 12 : -100, backgroundColor: theme.colors.base, borderColor: theme.colors.accent }]}>
    <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }}>{t('navigation.skipContent')}</Text>
  </Pressable>;
}

export function SideRail() {
  const rail = useRailWidth();
  const pathname = usePathname();
  const theme = useTheme();
  const t = useT();
  useSearchShortcut(rail > 0, openSearch);
  if (!rail) return null;
  const compact = rail === RAIL.compact;
  const floating = theme.floatingTabBar;
  const border = theme.borders.tabBar;
  const active = activeRailTab(pathname);
  const ink = { fontFamily: uiFace(theme.type.ui, '700'), color: theme.colors.tabOff, fontSize: compact ? 12 : 15 };
  return <View testID="side-rail" {...(Platform.OS === 'web' ? { role: 'navigation' as const, 'aria-label': t('navigation.main') } : {})}
    style={[styles.rail, { left: floating ? 12 : 0, top: floating ? 12 : 0, bottom: floating ? 12 : 0, width: rail - (floating ? 12 : 0),
      borderRadius: floating ? theme.radii.card : 0, borderWidth: floating ? border.width : 0, borderRightWidth: border.width,
      borderColor: border.color, boxShadow: theme.shadows.tabBar ?? undefined }]}>
    <GlassSurface background={theme.backgrounds.tabBar} style={[StyleSheet.absoluteFill, { borderRadius: floating ? theme.radii.card : 0 }]} />
    <ScrollView contentContainerStyle={{ paddingHorizontal: compact ? 4 : 10, paddingVertical: 20, gap: 4 }}>
      {!compact ? <Text style={[ink, { color: theme.colors.text, fontSize: 18, paddingHorizontal: 12, marginBottom: 16 }]}>{t('app.name')}</Text> : null}
      <Pressable testID="rail-search" accessibilityRole="button" accessibilityLabel={t('reader.search')} onPress={openSearch}
        style={[buttonStyle(theme), styles.search, { borderWidth: theme.borders.card.width, borderColor: theme.borders.card.color },
          compact && { justifyContent: 'center', paddingHorizontal: 0 }]}>
        <Icon name="search" size={22} color={theme.colors.tabOff} />
        {!compact ? <>
          <Text style={ink}>{t('reader.search')}</Text>
          <View style={[styles.key, { borderWidth: theme.borders.card.width, borderColor: theme.borders.card.color }]}>
            <Text style={[ink, { fontSize: 12 }]}>/</Text>
          </View>
        </> : null}
      </Pressable>
      {TABS.map((tab) => {
        const selected = active === tab.icon;
        const color = selected ? theme.colors.tabOn : theme.colors.tabOff;
        return <Pressable key={tab.name} testID={`tab-${tab.icon}`} accessibilityRole="link" accessibilityLabel={t(tab.a11yKey)}
          {...(Platform.OS === 'web' ? { href: tab.href } as object : {})}
          {...(Platform.OS === 'web' && selected ? { 'aria-current': 'page' as const } : {})}
          onPress={(event) => { if (Platform.OS === 'web') event.preventDefault(); router.navigate(tab.href); }} style={[styles.item, compact && styles.compact,
            { borderRadius: theme.radii.button, backgroundColor: selected ? theme.canvas.tabPill : undefined }]}>
          {selected && floating ? <View style={[styles.accent, { backgroundColor: theme.colors.accent }]} /> : null}
          <TabIcon name={tab.icon} color={color} /><Text style={[ink, { color }]}>{t(tab.labelKey)}</Text>
        </Pressable>;
      })}
    </ScrollView>
  </View>;
}

const styles = StyleSheet.create({
  rail: { position: 'absolute', zIndex: 5, overflow: 'hidden' },
  search: { height: 44, minWidth: 44, borderRadius: 12, flexDirection: 'row', alignItems: 'center', gap: 8, paddingHorizontal: 10 },
  key: { width: 22, height: 24, borderRadius: 4, marginLeft: 'auto', alignItems: 'center', justifyContent: 'center' },
  item: { height: 48, flexDirection: 'row', alignItems: 'center', gap: 12, paddingHorizontal: 12 },
  compact: { flexDirection: 'column', gap: 4, paddingHorizontal: 0, height: 52 },
  accent: { position: 'absolute', left: 0, top: '50%', marginTop: -12, width: 3, height: 24, borderRadius: 999 },
  skip: { position: 'absolute', left: 12, zIndex: 6, minHeight: 44, justifyContent: 'center', paddingHorizontal: 16, borderWidth: 2, borderRadius: 8 },
});
