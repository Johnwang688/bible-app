import { useEffect, useRef, useState, type ComponentRef, type RefObject } from 'react';
import { Platform, Pressable, StyleSheet, Text, useWindowDimensions, View } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { announce, useFocusNodeSoon } from '../../reader/components/a11y';
import { Icon } from '../../reader/components/icons';
import { buttonStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';
import type { Theme } from '../../theme/types';
import type { ReadAloud } from '../useReadAloud';
import { Action } from './parts';

/** The desktop layout rework only needs to change this function to relocate the player. */
export function playerBarBottom(theme: Theme, insets: { bottom: number }): number {
  return theme.floatingTabBar ? Math.max(insets.bottom, 12) + 68 + 10 : 10;
}

export function barStacked(barWidth: number, label: string): boolean {
  const estimate = Array.from(label).reduce((sum, c) => sum + (/[\p{Script=Han}\p{Script=Hiragana}\p{Script=Katakana}\p{Script=Hangul}]/u.test(c) ? 12 : 7), 0);
  return barWidth - 258 < estimate;
}

export function ReadAloudBar({ read, translation, endTitle, nextTitle, hidden, insets, onStop, onOpenVoice, onBack, onPlayNext, onHeight,
  toggleRef, speedRef, focusToggleRequest = 0 }: {
  read: ReadAloud; translation: string; endTitle: string; nextTitle: string | null; hidden: boolean; insets: { bottom: number };
  onStop(): void; onOpenVoice(): void; onBack(): void; onPlayNext(): void; onHeight(height: number): void;
  toggleRef: RefObject<ComponentRef<typeof View> | null>; speedRef: RefObject<ComponentRef<typeof View> | null>; focusToggleRequest?: number;
}) {
  const theme = useTheme();
  const t = useT();
  const { width } = useWindowDimensions();
  const [barWidth, setBarWidth] = useState(Math.min(720, width - (theme.floatingTabBar ? 32 : 24)));
  const message = read.status === 'paused' && read.sampleVoiceId === null ? t('readAloud.paused') : read.status === 'ended' ? endTitle : null;
  const [announcement, setAnnouncement] = useState({ status: read.status, live: '' });
  if (announcement.status !== read.status) {
    setAnnouncement({ status: read.status, live: message ? (announcement.live === message ? `${message} ` : message) : announcement.live });
  }
  const previous = useRef(read.status);
  const handledToggleRequest = useRef(0);
  const endRef = useRef<ComponentRef<typeof View>>(null);
  const focusSoon = useFocusNodeSoon();
  const visible = !hidden && !['idle', 'no-voice'].includes(read.status);
  const ended = read.status === 'ended';
  useEffect(() => {
    if (previous.current !== read.status) {
      if (message) {
        if (Platform.OS !== 'web') announce(message);
      }
    }
    previous.current = read.status;
  }, [read.status, message]);
  useEffect(() => {
    if (ended && visible) focusSoon(endRef.current);
  }, [ended, visible, focusSoon]);
  useEffect(() => {
    if (focusToggleRequest && focusToggleRequest !== handledToggleRequest.current && visible && !ended) {
      handledToggleRequest.current = focusToggleRequest;
      focusSoon(toggleRef.current);
    }
  }, [focusToggleRequest, visible, ended, focusSoon, toggleRef]);

  const n = read.verse;
  const paused = read.status === 'paused';
  const starting = read.status === 'preparing' || read.status === 'advancing';
  const label = read.status === 'error' ? t('readAloud.error', { n: n ?? 1 }) : starting ? t('readAloud.starting') : t(paused ? 'readAloud.pausedNamed' : 'readAloud.reading', { translation });
  const combined = starting || read.status === 'error' || n === null ? label : t(paused ? 'readAloud.pausedVerse' : 'readAloud.readingVerse', { translation, n });
  const stacked = width < 375 || barStacked(barWidth, label);
  const ink = { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') };
  const surface = { borderRadius: theme.radii.card, borderWidth: theme.borders.sheet.width, borderColor: theme.borders.sheet.color,
    boxShadow: (theme.floatingTabBar ? theme.shadows.sheet : theme.shadows.card) ?? undefined };
  const controls = <View style={[styles.controls, stacked && { justifyContent: 'space-between', width: '100%' }]}>
    <Action testID="read-aloud-prev" label={t('readAloud.prev')} icon="prevVerse" onPress={read.prev} />
    <Action nodeRef={toggleRef} testID="read-aloud-toggle" label={t(paused || read.status === 'error' ? 'readAloud.play' : 'readAloud.pause')}
      icon={paused || read.status === 'error' ? 'play' : 'pause'} primary onPress={read.status === 'error' ? read.resume : read.toggle} />
    <Action testID="read-aloud-next" label={t('readAloud.next')} icon="nextVerse" onPress={read.next} />
    <Pressable ref={speedRef} testID="read-aloud-speed" accessibilityRole="button" accessibilityLabel={t('readAloud.speedButton', { speed: t('readAloud.times', { x: read.rate }) })}
      aria-haspopup="dialog" onPress={onOpenVoice} style={({ pressed }) => [buttonStyle(theme), styles.speed, { opacity: pressed ? 0.7 : 1 }]}>
      <Text style={[ink, { fontSize: 14, color: theme.colors.btnText }]}>{`${read.rate}×`}</Text>
    </Pressable>
    <Action testID="read-aloud-stop" label={t('readAloud.stop')} icon="close" onPress={onStop} />
  </View>;

  return <>
    {Platform.OS === 'web' ? <Text testID="read-aloud-live" role="status" aria-live="polite" style={styles.visuallyHidden}>{announcement.live}</Text> : null}
    {visible ? <View pointerEvents="box-none" style={[styles.wrapper, { bottom: playerBarBottom(theme, insets), paddingHorizontal: theme.floatingTabBar ? 16 : 12 }]}>
      <View testID="read-aloud-bar" pointerEvents="box-none" {...(Platform.OS === 'web' ? { role: 'region' as const, 'aria-label': t('readAloud.region') } : { accessibilityLabel: t('readAloud.region') })}
        style={styles.column} onLayout={(e) => { setBarWidth(e.nativeEvent.layout.width); onHeight(e.nativeEvent.layout.height); }}>
        {!read.following && (read.status === 'playing' || paused) && n !== null ?
          <Pressable testID="read-aloud-back" accessibilityRole="button" accessibilityLabel={t('readAloud.back', { n })} onPress={onBack}
            style={({ pressed }) => ({ height: 44, alignSelf: 'center', borderRadius: 999, opacity: pressed ? 0.7 : 1 })}>
            <GlassSurface background={theme.backgrounds.sheet} style={[surface, styles.back]}>
              <Icon name="up" size={18} color={theme.colors.text} /><Text style={[ink, { fontSize: 14 }]}>{t('readAloud.back', { n })}</Text>
            </GlassSurface>
          </Pressable> : null}
        <GlassSurface background={theme.backgrounds.sheet} style={[surface, { overflow: 'hidden' }]}>
          {ended ? <View style={styles.end}>
            <Text testID="read-aloud-status" style={[ink, { fontFamily: uiFace(theme.type.head, '700'), fontSize: 16 }]}>{endTitle}</Text>
            {nextTitle ? <Text style={[ink, { color: theme.colors.muted, fontSize: 13 }]}>{t('readAloud.end.sub')}</Text> : null}
            <View style={{ flexDirection: 'row', gap: 10, flexWrap: 'wrap' }}>
              {nextTitle ? <View style={{ flex: 1, minWidth: 120 }}><Action nodeRef={endRef} testID="read-aloud-play-next" primary wide icon="play" label={t('readAloud.playNext', { ref: nextTitle })} onPress={onPlayNext} /></View> : null}
              <Action nodeRef={nextTitle ? undefined : endRef} testID="read-aloud-done" wide label={t('readAloud.done')} onPress={onStop} />
            </View>
          </View> : <View style={[styles.player, stacked && { flexDirection: 'column', alignItems: 'stretch', paddingHorizontal: 10, gap: 6 }]}>
            <View style={stacked ? undefined : { flex: 1, minWidth: 0, gap: 1 }}>
              <Text testID="read-aloud-status" numberOfLines={1} style={[ink, { color: theme.colors.muted, fontSize: 12 }]}>
                {stacked && n !== null && read.status !== 'error' ? <Text testID="read-aloud-verse">{combined}</Text> : stacked ? combined : label}
              </Text>
              {!stacked && n !== null && read.status !== 'error' ? <Text testID="read-aloud-verse" style={[ink, { fontSize: 16, fontFamily: uiFace(theme.type.head, '700') }]}>{t('readAloud.verse', { n })}</Text> : null}
            </View>
            {controls}
            <View aria-hidden accessible={false} pointerEvents="none" style={[styles.progress, { left: theme.style === 'glass' ? 20 : 0, right: theme.style === 'glass' ? 20 : 0, backgroundColor: theme.colors.track }]}>
              <View style={{ width: `${read.total ? Math.min(100, read.position / read.total * 100) : 0}%`, height: 3, backgroundColor: theme.canvas.bar ?? theme.colors.accent }} />
            </View>
          </View>}
        </GlassSurface>
      </View>
    </View> : null}
  </>;
}

const styles = StyleSheet.create({
  wrapper: { position: 'absolute', left: 0, right: 0, alignItems: 'center', zIndex: 4 },
  column: { width: '100%', maxWidth: 720, gap: 8 },
  controls: { flexDirection: 'row', alignItems: 'center', gap: 2, flexShrink: 0 },
  player: { paddingTop: 8, paddingBottom: 10, paddingLeft: 14, paddingRight: 6, flexDirection: 'row', alignItems: 'center', gap: 2 },
  speed: { minWidth: 50, height: 44, paddingHorizontal: 6, alignItems: 'center', justifyContent: 'center' },
  progress: { position: 'absolute', bottom: 0, height: 3 },
  end: { paddingTop: 14, paddingHorizontal: 16, paddingBottom: 16, gap: 12 },
  back: { height: 44, paddingHorizontal: 16, alignSelf: 'center', flexDirection: 'row', alignItems: 'center', gap: 6, borderRadius: 999 },
  visuallyHidden: { position: 'absolute', width: 1, height: 1, overflow: 'hidden', opacity: 0 },
});
