// The Study tab: Saved (highlights, notes and bookmarks, filtered) and Progress (streak, goal, chapters
// explored). Both read the device's storage through hooks, so a change made in the reader shows at once. This
// screen never writes them.
import { router } from 'expo-router';
import { useCallback, useMemo, useState } from 'react';
import { useWindowDimensions, Pressable, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { AuroraBackground, auroraTextShadow } from '../../aurora';
import { BREAKPOINT } from '../../components/layout';
import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import type { MessageKey } from '../../i18n/messages/en';
import { useReadingProgress } from '../../progress';
import { Icon } from '../../reader/components/icons';
import { buttonStyle } from '../../reader/components/ui';
import { useReaderPosition } from '../../reader/state';
import { useOpenInReader } from '../../reader/target';
import { getStorage, type Storage } from '../../storage/storage';
import { useTheme } from '../../theme/ThemeProvider';
import { ExploreView } from '../../entities/components/ExploreView';
import { buildStudyList, NO_FILTER, type StudyEntry, type StudyFilter } from '../list';
import { useStudyItems } from '../useStudyItems';
import { ProgressView } from './ProgressView';
import { SavedList } from './SavedList';

type StudyView = 'saved' | 'progress' | 'explore';

const TABS: { id: StudyView; testID: string; labelKey: MessageKey }[] = [
  { id: 'saved', testID: 'study-tab-saved', labelKey: 'study.saved' },
  { id: 'progress', testID: 'study-tab-progress', labelKey: 'study.progress' },
  { id: 'explore', testID: 'study-tab-explore', labelKey: 'study.explore' },
];

/** Room under the content for the tab bar, so the last item can scroll above it (as `Screen` does). */
const TAB_BAR_ROOM = 120;

export function StudyScreen({
  storage: storageProp,
  locales,
  now,
  navigate,
  openMemory,
}: {
  storage?: Storage;
  locales?: readonly DeviceLocale[];
  now?: () => Date;
  navigate?: () => void;
  /** Opens Memory (default: the router, to /study/memory). */
  openMemory?: () => void;
}) {
  const grid = useWindowDimensions().width >= BREAKPOINT.rail;
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const [view, setView] = useState<StudyView>('saved');
  const [filter, setFilter] = useState<StudyFilter>(NO_FILTER);

  const { items } = useStudyItems({ storage });
  const all = useMemo(() => buildStudyList(items), [items]);
  const progress = useReadingProgress({ storage, now });
  const { position } = useReaderPosition({ storage, locales });
  const openInReader = useOpenInReader({ storage, navigate });
  const open = useCallback(
    (e: StudyEntry) => openInReader({ bookNumber: e.bookNumber, chapter: e.chapter, start: e.start, end: e.end }),
    [openInReader],
  );

  const button = buttonStyle(theme);
  const header = (
    <View style={[styles.header, { paddingTop: insets.top + 16 }]}>
      <Text
        accessibilityRole="header"
        style={{
          color: theme.colors.text,
          fontFamily: uiFace(theme.type.head, theme.type.headWeight),
          fontSize: theme.type.headSize,
          letterSpacing: theme.type.headLetterSpacing,
          ...auroraTextShadow(theme),
        }}
      >
        {t('screen.study.title')}
      </Text>
      <Pressable
        testID="study-memory-entry"
        accessibilityRole="button"
        accessibilityLabel={`${t('memory.title')}. ${t('memory.entry.sub')}`}
        onPress={openMemory ?? (() => router.push('/study/memory'))}
        style={({ pressed }) => ({ opacity: pressed ? 0.85 : 1 })}
      >
        <GlassSurface
          background={theme.backgrounds.surface}
          style={[
            styles.memoryEntry,
            {
              borderRadius: theme.radii.card,
              borderWidth: theme.borders.card.width,
              borderColor: theme.borders.card.color,
              boxShadow: theme.shadows.card ?? undefined,
            },
          ]}
        >
          <View style={styles.memoryText}>
            <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17 }}>
              {t('memory.title')}
            </Text>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
              {t('memory.entry.sub')}
            </Text>
          </View>
          <Icon name="chevronRight" size={20} color={theme.colors.muted} />
        </GlassSurface>
      </Pressable>
      <View accessibilityRole="tablist" style={[styles.segments, grid && { width: '100%', maxWidth: 420 }, button, { borderRadius: theme.radii.button }]}>
        {TABS.map((tab) => {
          const selected = view === tab.id;
          return (
            <Pressable
              key={tab.id}
              testID={tab.testID}
              accessibilityRole="tab"
              accessibilityState={{ selected }}
              onPress={() => setView(tab.id)}
              style={[styles.segment, { borderRadius: theme.radii.button }, selected && { backgroundColor: theme.colors.cta }]}
            >
              <Text
                style={{
                  color: selected ? theme.colors.onCta : theme.colors.btnText,
                  fontFamily: uiFace(theme.type.ui, '700'),
                  fontSize: 14,
                }}
              >
                {t(tab.labelKey)}
              </Text>
            </Pressable>
          );
        })}
      </View>
    </View>
  );

  return (
    <View testID="screen-study" style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      {view === 'saved' ? (
        <SavedList
          header={header}
          all={all}
          filter={filter}
          onFilterChange={setFilter}
          translation={position.translation}
          onOpen={open}
          bottomInset={TAB_BAR_ROOM}
        />
      ) : view === 'progress' ? (
        <ProgressView header={header} progress={progress} bottomInset={TAB_BAR_ROOM} />
      ) : (
        <ExploreView header={header} bottomInset={TAB_BAR_ROOM} />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  header: { gap: 14 },
  segments: { flexDirection: 'row', gap: 4, padding: 4 },
  memoryEntry: { minHeight: 60, flexDirection: 'row', alignItems: 'center', gap: 12, paddingVertical: 12, paddingHorizontal: 16 },
  memoryText: { flex: 1, gap: 2 },
  segment: { flex: 1, minHeight: 44, alignItems: 'center', justifyContent: 'center' },
});
