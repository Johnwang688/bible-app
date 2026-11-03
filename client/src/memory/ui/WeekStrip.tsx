// The week as seven day dots, Sunday to Saturday. A state is told by shape as well as colour: done is a filled dot
// with a tick, missed a plain solid ring (never a cross), today an accent ring with a centre, a day to come a dotted
// ring, a day before the reader started a short dash.
import { StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { useTheme } from '../../theme/ThemeProvider';
import type { WeekDayState } from '../dailyLesson';
import { MemoryIcon } from './icons';

export const DOT = { small: 20, large: 36 } as const;
/** Room around a dot for the ring that marks today when it is done. */
const RING = 4;

function weekdayOf(date: string): number {
  const [y = 0, m = 1, d = 1] = date.split('-').map(Number);
  return new Date(y, m - 1, d).getDay();
}

/** One day's dot, in a fixed square so a row of them lines up whether or not one wears the "today, done" ring. */
export function DayDot({ state, today = false, size }: { state: WeekDayState; today?: boolean; size: number }) {
  const theme = useTheme();
  const circle = { width: size, height: size, borderRadius: size / 2, alignItems: 'center', justifyContent: 'center' } as const;
  const inner = Math.round(size * 0.26);
  const mark =
    state === 'done' ? (
      <View style={[circle, { backgroundColor: theme.colors.accent }]}>
        <MemoryIcon name="check" color={theme.colors.onAccent} size={Math.round(size * 0.55)} strokeWidth={2.8} />
      </View>
    ) : state === 'missed' ? (
      <View style={[circle, { borderWidth: 2.5, borderColor: theme.colors.muted }]} />
    ) : state === 'today' ? (
      <View style={[circle, { borderWidth: 3, borderColor: theme.colors.accent }]}>
        <View style={{ width: inner, height: inner, borderRadius: inner / 2, backgroundColor: theme.colors.accent }} />
      </View>
    ) : state === 'future' ? (
      <View style={[circle, { borderWidth: 2, borderStyle: 'dotted', borderColor: theme.colors.muted }]} />
    ) : (
      <View style={circle}>
        <MemoryIcon name="dash" color={theme.colors.muted} size={Math.round(size * 0.5)} strokeWidth={2.4} />
      </View>
    );
  const room = size + RING * 2;
  return (
    <View
      style={{
        width: room,
        height: room,
        borderRadius: room / 2,
        alignItems: 'center',
        justifyContent: 'center',
        borderWidth: 2,
        borderColor: state === 'done' && today ? theme.colors.accent : 'transparent',
      }}
    >
      {mark}
    </View>
  );
}

export function WeekStrip({
  days,
  size = 'small',
  labels = false,
  today,
}: {
  days: { date: string; state: WeekDayState }[];
  size?: 'small' | 'large';
  /** Weekday letters under the dots. */
  labels?: boolean;
  /** The local date of today (marks a done day as "today, done"). */
  today?: string;
}) {
  const theme = useTheme();
  const t = useT();
  return (
    <View style={styles.row}>
      {days.map(({ date, state }) => {
        const weekday = weekdayOf(date);
        const isToday = state === 'today' || date === today;
        const stateKey = state === 'done' && isToday ? 'todayDone' : state;
        const label = t('memory.day.aria', {
          day: t(`memory.day.${weekday}` as MessageKey),
          state: t(`memory.dayState.${stateKey}` as MessageKey),
        });
        return (
          <View key={date} testID={`memory-day-${date}`} accessible accessibilityLabel={label} style={styles.day}>
            <DayDot state={state} today={isToday} size={DOT[size]} />
            {labels ? (
              <Text
                accessible={false}
                style={{
                  color: isToday ? theme.colors.text : theme.colors.muted,
                  fontFamily: uiFace(theme.type.ui, '700'),
                  fontSize: 12,
                }}
              >
                {t(`memory.dayShort.${weekday}` as MessageKey)}
              </Text>
            ) : null}
          </View>
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  row: { flexDirection: 'row', justifyContent: 'space-between' },
  day: { alignItems: 'center', gap: 2 },
});
