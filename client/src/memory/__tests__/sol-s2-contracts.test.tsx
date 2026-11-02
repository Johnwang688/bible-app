import { act, fireEvent, screen } from '@testing-library/react-native';

import { memoryHistoryKey, memoryLessonKey, memoryProgressKey, memorySettingsKey, type MemorySettings } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getAllMemoryVerses, TOTAL_VERSES } from '../library';
import { MemoryHome } from '../ui/home/MemoryHome';
import { WeekScreen } from '../ui/home/WeekScreen';
import { useMemorySettings } from '../useMemorySettings';
import { bestStreak, daysUntilDue, pastWeeks } from '../view';
import { NOW, renderMemory } from './memoryHarness';

it('counts calendar days across the 25-hour fall-back day and the repeated hour', () => {
  const midnight = new Date(2026, 10, 1);
  const tomorrow = new Date(2026, 10, 2);
  expect(midnight.getTimezoneOffset()).toBe(300);
  expect(tomorrow.getTimezoneOffset()).toBe(360);
  expect(daysUntilDue(tomorrow.toISOString(), midnight)).toBe(1);
  expect(daysUntilDue('2026-11-01T01:30:00-06:00', new Date('2026-11-01T01:30:00-05:00'))).toBe(0);
  expect(daysUntilDue('2026-11-02T05:59:59Z', midnight)).toBe(0);
  expect(daysUntilDue(null, midnight)).toBeNull();
});

it('deduplicates unsorted streak days across fall-back and year boundaries', () => {
  expect(bestStreak(['2026-11-02', '2026-10-31', '2026-11-01', '2026-11-01', '2026-10-29'])).toBe(3);
  expect(bestStreak(['2027-01-01', '2026-12-31', '2026-12-30', '2027-01-01'])).toBe(3);
});

it('past weeks have seven local dates and only past-day states over fall-back', () => {
  const weeks = pastWeeks({ startedOn: '2026-11-03', completedDates: ['2026-11-04'] }, new Date(2026, 10, 8), 4);
  expect(weeks.map((week) => week.start)).toEqual(['2026-11-01', '2026-10-25', '2026-10-18', '2026-10-11']);
  expect(weeks[0]!.days.map((day) => day.date)).toEqual(['2026-11-01', '2026-11-02', '2026-11-03', '2026-11-04', '2026-11-05', '2026-11-06', '2026-11-07']);
  expect(weeks[0]!.days.map((day) => day.state)).toEqual(['before-start', 'before-start', 'missed', 'done', 'missed', 'missed', 'missed']);
  expect(pastWeeks({ startedOn: null, completedDates: [] }, NOW, 4).flatMap((week) => week.days).every((day) => day.state === 'before-start')).toBe(true);
});

it('migrates v1 extra fields safely and rejects partial v2 and future settings', () => {
  const backend = memoryBackend();
  const storage = createStorage(backend);
  backend.set('memory.settings', JSON.stringify({ v: 1, data: { speech: 'cantonese', script: 'traditional', voice: false, voiceConsent: true, extra: 'ignored' } }));
  expect(storage.get(memorySettingsKey)).toEqual({ speech: 'cantonese', script: 'traditional', voice: true, voiceConsent: false });
  backend.set('memory.settings', JSON.stringify({ v: 2, data: { speech: 'cantonese', script: 'traditional', voice: false } }));
  expect(storage.get(memorySettingsKey)).toEqual(memorySettingsKey.fallback);
  backend.set('memory.settings', JSON.stringify({ v: 3, data: { ...memorySettingsKey.fallback, voiceConsent: true } }));
  expect(storage.get(memorySettingsKey)).toEqual(memorySettingsKey.fallback);
});

it('two retained settings patch callbacks preserve concurrent changes', async () => {
  const storage = createStorage(memoryBackend());
  const patches: ((patch: Partial<MemorySettings>) => void)[] = [];
  function Probe({ index }: { index: number }) {
    const [, patch] = useMemorySettings(storage);
    patches[index] = patch;
    return null;
  }
  await renderMemory(() => <><Probe index={0} /><Probe index={1} /></>, { storage });
  const [first, second] = patches;
  await act(async () => {
    first!({ script: 'traditional' });
    second!({ speech: 'cantonese', voice: false });
    first!({ voiceConsent: true });
  });
  expect(storage.get(memorySettingsKey)).toEqual({ speech: 'cantonese', script: 'traditional', voice: false, voiceConsent: true });
});

it('rerenders do not write a plan or replace it after progress changes mid-day', async () => {
  const storage = createStorage(memoryBackend());
  const write = jest.spyOn(storage, 'set');
  await renderMemory(({ now, onNavigate }) => <MemoryHome storage={storage} now={now} onNavigate={onNavigate} />, { storage });
  const plan = storage.get(memoryLessonKey);
  write.mockClear();
  await fireEvent.press(screen.getByTestId('memory-settings-button'));
  await fireEvent.press(screen.getByTestId('memory-script-traditional'));
  await fireEvent.press(screen.getByTestId('memory-settings-done'));
  await act(async () => {
    storage.set(memoryProgressKey, { 'john-3-16': { stage: 'review', successes: 10, failures: 0, masteryScore: 100, nextDueAt: NOW.toISOString(), lastReviewedAt: NOW.toISOString(), lapsedAt: null } });
  });
  expect(write.mock.calls.filter(([key]) => key.key === memoryLessonKey.key)).toHaveLength(0);
  expect(storage.get(memoryLessonKey)).toEqual(plan);
});

it('a returning reader sees today rather than first lesson and every verse appears once', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(memoryHistoryKey, { startedOn: '2026-10-30', completedDates: [] });
  await renderMemory(({ now, onNavigate }) => <MemoryHome storage={storage} now={now} onNavigate={onNavigate} />, { storage });
  expect(screen.getByTestId('memory-lesson-card')).toHaveTextContent(/Today.s lesson/);
  expect(screen.queryByTestId('memory-how-it-works')).toBeNull();
  expect(screen.getAllByTestId(/^memory-row-/)).toHaveLength(TOTAL_VERSES);
  for (const verse of getAllMemoryVerses()) expect(screen.getAllByTestId(`memory-row-${verse.id}`)).toHaveLength(1);
});

it('Traditional applies to the full verse sheet and new verse practice has no query', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(memorySettingsKey, { ...memorySettingsKey.fallback, script: 'traditional' });
  const { onNavigate } = await renderMemory(({ now, onNavigate }) => <MemoryHome storage={storage} now={now} onNavigate={onNavigate} />, { storage });
  await fireEvent.press(screen.getByTestId('memory-row-2-corinthians-5-17'));
  expect(screen.getByText(getAllMemoryVerses()[0]!.textZhHant)).toBeTruthy();
  await fireEvent.press(screen.getByTestId('memory-practise'));
  expect(onNavigate).toHaveBeenCalledWith('/memory/lesson/2-corinthians-5-17/chunk-order');
});

it('speech is disabled semantically and cannot change when voice is off', async () => {
  const storage = createStorage(memoryBackend());
  await renderMemory(({ now, onNavigate }) => <MemoryHome storage={storage} now={now} onNavigate={onNavigate} />, { storage });
  await fireEvent.press(screen.getByTestId('memory-settings-button'));
  await fireEvent.press(screen.getByTestId('memory-voice-switch'));
  expect(screen.getByTestId('memory-voice-switch').props.accessibilityState.checked).toBe(false);
  for (const language of ['mandarin', 'cantonese']) {
    const choice = screen.getByTestId(`memory-speech-${language}`);
    expect(choice).toBeDisabled();
    expect(choice.props.accessibilityState.disabled).toBe(true);
    expect(choice.props.accessibilityLabel).toBeTruthy();
    await fireEvent.press(choice);
  }
  expect(storage.get(memorySettingsKey).speech).toBe('mandarin');
  for (const button of screen.getAllByRole('button')) expect(button.props.accessibilityLabel).toBeTruthy();
});

it('week shows the required best-streak value for a new reader', async () => {
  await renderMemory(({ storage, now, onNavigate }) => <WeekScreen storage={storage} now={now} onNavigate={onNavigate} />);
  // P3: the best-streak status is omitted entirely when the reader has zero completed days.
  expect(screen.queryByTestId('memory-week-best')).not.toBeNull();
  expect(screen.getByTestId('memory-week-best')).toHaveTextContent(/Best: 0 days/);
});
