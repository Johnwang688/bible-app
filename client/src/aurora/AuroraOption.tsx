// The "Moving background" section of Customise (R-7a): which of the two animations the aurora runs.
// Built for R-6a's Customise screen to mount. Both rows are disabled on a pastel look (it has no aurora)
// and under Reduce Motion (the aurora stays still), each with its own note.
//
// The label sits directly on the aurora, so it carries the aurora text shadow; everything else (names,
// descriptions, the note) sits on a text card, so muted text never rests on the moving colours.
import { useEffect, useRef, type ComponentRef } from 'react';
import { Platform, Pressable, StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../components/GlassSurface';
import { uiFace } from '../fonts/fonts';
import { useT } from '../i18n';
import type { MessageKey } from '../i18n/messages/en';
import { textCardBackground, textCardBorder } from '../onboarding/paint';
import { Icon } from '../reader/components/icons';
import { useReduceMotion } from '../reader/components/useReduceMotion';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { useTheme } from '../theme/ThemeProvider';
import { AURORA_STYLES, auroraStyleKey, type AuroraStyle } from './keys';
import { auroraTextShadow } from './textShadow';

const ROWS: Record<AuroraStyle, { name: MessageKey; desc: MessageKey }> = {
  fluid: { name: 'aurora.fluid.name', desc: 'aurora.fluid.desc' },
  flow: { name: 'aurora.flow.name', desc: 'aurora.flow.desc' },
};

export function AuroraOption({ storage = getStorage() }: { storage?: Storage }) {
  const t = useT();
  const theme = useTheme();
  const reduceMotion = useReduceMotion();
  const [style, setStyle] = useStoredValue(storage, auroraStyleKey);

  const glass = theme.style === 'glass';
  const disabled = !glass || reduceMotion;
  const noteKey: MessageKey = !glass ? 'aurora.note.glassOnly' : reduceMotion ? 'aurora.note.reduced' : 'aurora.note.motion';

  const ui = theme.type.ui;
  const label = t('aurora.label');
  const card = {
    ...textCardBackground(theme),
    borderWidth: textCardBorder(theme).width,
    borderColor: textCardBorder(theme).color,
    borderRadius: theme.radii.card,
  };

  // Web: arrow keys move and select within the group (roving tab index). The row elements are DOM nodes.
  const rowRefs = useRef<Partial<Record<AuroraStyle, ComponentRef<typeof View> | null>>>({});
  const groupRef = useRef<ComponentRef<typeof View> | null>(null);
  const latest = useRef({ disabled, setStyle });
  useEffect(() => {
    latest.current = { disabled, setStyle };
  });
  useEffect(() => {
    if (Platform.OS !== 'web') return;
    const group = groupRef.current as unknown as HTMLElement | null;
    if (!group) return;
    const onKeyDown = (ev: KeyboardEvent) => {
      const step = ev.key === 'ArrowRight' || ev.key === 'ArrowDown' ? 1 : ev.key === 'ArrowLeft' || ev.key === 'ArrowUp' ? -1 : 0;
      if (step === 0 || latest.current.disabled) return;
      const at = AURORA_STYLES.findIndex((id) => (rowRefs.current[id] as unknown as HTMLElement | null) === document.activeElement);
      if (at < 0) return;
      ev.preventDefault();
      const next = AURORA_STYLES[(at + step + AURORA_STYLES.length) % AURORA_STYLES.length]!;
      (rowRefs.current[next] as unknown as HTMLElement | null)?.focus();
      latest.current.setStyle(next);
    };
    group.addEventListener('keydown', onKeyDown);
    return () => group.removeEventListener('keydown', onKeyDown);
  }, []);

  return (
    <View testID="aurora-option" style={styles.section}>
      <Text
        style={[
          styles.heading,
          { color: theme.colors.text, fontFamily: uiFace(ui, '700') },
          auroraTextShadow(theme),
        ]}
      >
        {label}
      </Text>
      <View ref={groupRef} accessible role="radiogroup" aria-label={label} style={styles.rows}>
        {AURORA_STYLES.map((id) => {
          const checked = style === id;
          return (
            <Pressable
              key={id}
              ref={(node) => {
                rowRefs.current[id] = node;
              }}
              testID={`aurora-option-${id}`}
              role="radio"
              aria-checked={checked}
              aria-disabled={disabled}
              disabled={disabled}
              onPress={() => {
                if (!disabled) setStyle(id);
              }}
              {...(Platform.OS === 'web' ? { tabIndex: checked ? 0 : -1 } : null)}
              style={[
                styles.pressable,
                { borderRadius: theme.radii.card },
                disabled && styles.disabled,
                checked && { outlineWidth: 2, outlineStyle: 'solid', outlineColor: theme.colors.accent, outlineOffset: 2 },
              ]}
            >
              <GlassSurface testID={`aurora-option-${id}-card`} background={textCardBackground(theme)} style={[styles.card, card]}>
                <View
                  style={[
                    styles.radio,
                    checked
                      ? { backgroundColor: theme.colors.cta, borderColor: theme.colors.cta }
                      : { borderColor: theme.colors.muted },
                  ]}
                >
                  {checked ? <Icon name="check" size={14} color={theme.colors.onCta} strokeWidth={3} /> : null}
                </View>
                <View style={styles.texts}>
                  <Text style={{ color: theme.colors.text, fontFamily: uiFace(ui, '700'), fontSize: 16 }}>{t(ROWS[id].name)}</Text>
                  <Text style={{ color: theme.colors.muted, fontFamily: uiFace(ui, '400'), fontSize: 13, lineHeight: 18 }}>
                    {t(ROWS[id].desc)}
                  </Text>
                </View>
              </GlassSurface>
            </Pressable>
          );
        })}
      </View>
      <GlassSurface testID="aurora-option-note-card" background={textCardBackground(theme)} style={[styles.noteCard, card]}>
        <Text
          testID="aurora-option-note"
          style={{ color: theme.colors.muted, fontFamily: uiFace(ui, '400'), fontSize: 13, lineHeight: 18 }}
        >
          {t(noteKey)}
        </Text>
      </GlassSurface>
    </View>
  );
}

const styles = StyleSheet.create({
  section: { gap: 8 },
  heading: { fontSize: 12, letterSpacing: 0.6, textTransform: 'uppercase' },
  rows: { gap: 10 },
  pressable: { width: '100%' },
  disabled: { opacity: 0.55 },
  card: { flexDirection: 'row', alignItems: 'center', gap: 14, minHeight: 64, paddingVertical: 12, paddingHorizontal: 16 },
  radio: { width: 24, height: 24, borderRadius: 12, borderWidth: 2, alignItems: 'center', justifyContent: 'center' },
  texts: { flex: 1, gap: 2 },
  noteCard: { paddingVertical: 10, paddingHorizontal: 16 },
});
