// The daily-goal sheet: minutes of reading a day, stepped by 5 between 5 and 120 or picked from a few usual
// values. Every change is saved at once, so the close button is the one dismiss control. It reads and writes the
// goal through storage only, so Home and the Me tab can both mount it.
import { useCallback, useEffect, useMemo, useRef, type ReactNode } from 'react';
import { Platform, Pressable, StyleSheet, Text, View, type ViewProps } from 'react-native';

import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import { dayKey, useReadingProgress } from '../progress';
import { Icon } from '../reader/components/icons';
import { SheetModal } from '../reader/components/SheetModal';
import { RoundIconButton } from '../reader/components/sheetParts';
import { buttonStyle } from '../reader/components/ui';
import { MAX_GOAL_MINUTES, MIN_GOAL_MINUTES } from '../storage/keys';
import { getStorage, type Storage } from '../storage/storage';
import { useTheme } from '../theme/ThemeProvider';
import { GOAL_CHOICES, setDailyGoal, stepGoal } from './goal';
import { MinusIcon, PlusIcon } from './icons';
import { useSwipeDown } from './swipeDown';
import { useToday } from './useToday';
import { escapeIsForModalAbove } from './webModals';

const defaultNow = () => new Date();
const ROWS = [GOAL_CHOICES.slice(0, 4), GOAL_CHOICES.slice(4)] as const;
const COLUMNS = 4;

/** What an Escape press has done to this sheet so far (web). */
type EscapeState = 'none' | 'foreign' | 'closed';

/** Props React Native Web forwards to the DOM but React Native's View types lack. */
interface WebKeyProps {
  tabIndex: number;
  onKeyDown(e: { key: string; preventDefault(): void }): void;
}

/** The round minus or plus button: 56 pt at least, drawn faded (and disabled) at the end of the range. */
function StepButton({
  testID,
  label,
  disabled,
  onPress,
  children,
}: {
  testID: string;
  label: string;
  disabled: boolean;
  onPress(): void;
  children: ReactNode;
}) {
  const theme = useTheme();
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={label}
      accessibilityState={{ disabled }}
      disabled={disabled}
      onPress={onPress}
      style={[styles.stepButton, buttonStyle(theme), disabled && styles.disabled]}
    >
      {children}
    </Pressable>
  );
}

export function GoalSheet({ onClose, storage: storageProp, now = defaultNow }: { onClose(): void; storage?: Storage; now?: () => Date }) {
  const theme = useTheme();
  const { t } = useI18n();
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const { progress, goalMinutes: goal } = useReadingProgress({ storage, now });
  const swipe = useSwipeDown(onClose);
  // The day is read here too, so a sheet mounted without Home moves to the new day at midnight.
  const today = useToday(now);

  // Web: what the current Escape press has done. A keydown for a modal above this sheet makes it 'foreign'; a
  // keydown that closed the sheet makes it 'closed'. A window capture-phase keyup listener moves it into `keyup`
  // for that keyup's dispatch only (the Modal's onRequestClose runs during it) and clears it after the dispatch.
  const press = useRef<EscapeState>('none');
  const keyup = useRef<EscapeState>('none');
  const onRequestClose = useCallback(() => {
    if (Platform.OS === 'web') {
      if (keyup.current !== 'none') return;
      keyup.current = 'closed';
    }
    onClose();
  }, [onClose]);

  // react-native-web's Modal listens for Escape only once its slide-in has ended (a quarter of a second), and the
  // scrim slides in with the sheet, so an Escape or a tap away from the sheet made as it opens would be lost. These
  // listen from the start. A press inside the Modal (the real scrim, the sheet) is left to the Modal's own handlers.
  // An Escape keyup no one handled (no keydown of ours before it, the Modal still sliding in) closes the sheet
  // from the window bubble phase; each Escape press closes it at most once.
  useEffect(() => {
    if (Platform.OS !== 'web' || typeof document === 'undefined') return;
    let clearTimer: ReturnType<typeof setTimeout> | undefined;
    const onKeyDown = (e: KeyboardEvent) => {
      if (e.key !== 'Escape') return;
      press.current = escapeIsForModalAbove('goal-sheet', e.target) ? 'foreign' : 'closed';
      if (press.current === 'closed') onClose();
    };
    const onKeyUpCapture = (e: KeyboardEvent) => {
      if (e.key !== 'Escape') return;
      keyup.current = press.current;
      press.current = 'none';
      // A timer, not a microtask: microtasks run between listener callbacks, before the Modal's listener.
      clearTimeout(clearTimer);
      clearTimer = setTimeout(() => {
        keyup.current = 'none';
      }, 0);
    };
    const onKeyUp = (e: KeyboardEvent) => {
      if (e.key !== 'Escape' || keyup.current !== 'none') return;
      keyup.current = 'closed';
      onClose();
    };
    const onBlur = () => {
      press.current = 'none';
      keyup.current = 'none';
    };
    const onPointerDown = (e: PointerEvent) => {
      const target = e.target as Element | null;
      if (target?.closest?.('[aria-modal="true"]')) return;
      onClose();
    };
    document.addEventListener('keydown', onKeyDown, true);
    window.addEventListener('keyup', onKeyUpCapture, true);
    window.addEventListener('keyup', onKeyUp);
    window.addEventListener('blur', onBlur);
    document.addEventListener('pointerdown', onPointerDown);
    return () => {
      clearTimeout(clearTimer);
      document.removeEventListener('keydown', onKeyDown, true);
      window.removeEventListener('keyup', onKeyUpCapture, true);
      window.removeEventListener('keyup', onKeyUp);
      window.removeEventListener('blur', onBlur);
      document.removeEventListener('pointerdown', onPointerDown);
    };
  }, [onClose]);

  const metToday = progress.goalMetDays.includes(dayKey(today));
  const save = (minutes: number) => setDailyGoal(storage, minutes, dayKey(now()));
  const step = (direction: 1 | -1) => save(stepGoal(goal, direction));

  const { colors } = theme;
  const atMin = goal <= MIN_GOAL_MINUTES;
  const atMax = goal >= MAX_GOAL_MINUTES;
  const unit = t('goal.minutes', { n: '' }).trim();

  const onKeyDown: WebKeyProps['onKeyDown'] = (e) => {
    const next =
      e.key === 'ArrowUp' || e.key === 'ArrowRight'
        ? stepGoal(goal, 1)
        : e.key === 'ArrowDown' || e.key === 'ArrowLeft'
          ? stepGoal(goal, -1)
          : e.key === 'Home'
            ? MIN_GOAL_MINUTES
            : e.key === 'End'
              ? MAX_GOAL_MINUTES
              : null;
    if (next === null) return;
    e.preventDefault();
    save(next);
  };
  const webKeys: Partial<ViewProps> = Platform.OS === 'web' ? ({ tabIndex: 0, onKeyDown } as unknown as Partial<ViewProps>) : {};

  const header = (
    <View testID="goal-sheet-drag" {...swipe}>
      <View style={styles.titleRow}>
        <Text
          accessibilityRole="header"
          style={{ color: colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 21, flexShrink: 1 }}
        >
          {t('goal.title')}
        </Text>
        <RoundIconButton testID="goal-sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
      </View>
    </View>
  );

  return (
    <SheetModal testID="goal-sheet" onClose={onClose} onRequestClose={onRequestClose} header={header}>
      <Text style={{ color: colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 20 }}>{t('goal.hint')}</Text>

      <View style={styles.stepper}>
        <StepButton testID="goal-minus" label={t('goal.less')} disabled={atMin} onPress={() => step(-1)}>
          <MinusIcon color={colors.btnText} />
        </StepButton>
        <View
          testID="goal-value-group"
          accessible
          role="spinbutton"
          aria-label={t('goal.title')}
          aria-valuemin={MIN_GOAL_MINUTES}
          aria-valuemax={MAX_GOAL_MINUTES}
          aria-valuenow={goal}
          aria-valuetext={t('goal.minutes', { n: goal })}
          aria-live="polite"
          accessibilityActions={[{ name: 'increment' }, { name: 'decrement' }]}
          onAccessibilityAction={(e) => {
            if (e.nativeEvent.actionName === 'increment') step(1);
            else if (e.nativeEvent.actionName === 'decrement') step(-1);
          }}
          style={styles.valueGroup}
          {...webKeys}
        >
          <Text
            testID="goal-value"
            style={{ color: colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 52, letterSpacing: -1 }}
          >
            {String(goal)}
          </Text>
          <Text style={{ color: colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 17 }}>{unit}</Text>
        </View>
        <StepButton testID="goal-plus" label={t('goal.more')} disabled={atMax} onPress={() => step(1)}>
          <PlusIcon color={colors.btnText} />
        </StepButton>
      </View>

      {metToday ? (
        <View style={styles.metRow}>
          <Icon name="check" size={16} color={colors.text} />
          <Text testID="goal-met-today" style={{ color: colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>
            {t('goal.metToday')}
          </Text>
        </View>
      ) : null}

      <View style={styles.choices}>
        {ROWS.map((row, i) => (
          <View key={i} testID={`goal-choices-row-${i}`} style={styles.choicesRow}>
            {row.map((n) => {
              const selected = n === goal;
              return (
                <Pressable
                  key={n}
                  testID={`goal-choice-${n}`}
                  accessibilityRole="button"
                  accessibilityLabel={t('goal.choice', { n })}
                  accessibilityState={{ selected }}
                  onPress={() => save(n)}
                  style={[
                    styles.chip,
                    selected
                      ? {
                          backgroundColor: colors.cta,
                          borderRadius: theme.radii.button,
                          borderWidth: theme.borders.button?.width ?? 0,
                          borderColor: theme.borders.button?.color,
                          boxShadow: theme.shadows.cta,
                        }
                      : buttonStyle(theme),
                  ]}
                >
                  {selected ? (
                    <View testID={`goal-choice-${n}-check`}>
                      <Icon name="check" size={16} color={colors.onCta} />
                    </View>
                  ) : null}
                  <Text
                    style={{ color: selected ? colors.onCta : colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}
                  >
                    {String(n)}
                  </Text>
                </Pressable>
              );
            })}
            {/* Pads a short row so its chips are as wide as the others'. */}
            {Array.from({ length: COLUMNS - row.length }, (_, k) => (
              <View key={`pad-${k}`} accessible={false} style={styles.spacer} />
            ))}
          </View>
        ))}
      </View>
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12 },
  stepper: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12, paddingVertical: 4 },
  stepButton: { minWidth: 56, minHeight: 56, alignItems: 'center', justifyContent: 'center' },
  disabled: { opacity: 0.4 },
  valueGroup: { flexDirection: 'row', alignItems: 'baseline', justifyContent: 'center', gap: 6, flexShrink: 1 },
  metRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 6 },
  choices: { gap: 8 },
  choicesRow: { flexDirection: 'row', gap: 8 },
  chip: { flex: 1, minHeight: 44, flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 6, paddingHorizontal: 8 },
  spacer: { flex: 1 },
});
