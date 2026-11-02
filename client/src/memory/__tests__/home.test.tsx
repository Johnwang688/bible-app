// Acceptance (orchestrator-owned, MEM screens): Memory home, the library sheet, the settings sheet, the week
// screen, the settings key's v2 migration and the view helpers. Prototypes: `design/proposed/mem-home.html`,
// `mem-week.html`; REVIEW-3. Implementers may not edit this file.
import { act, fireEvent, screen, within } from '@testing-library/react-native';

import { memoryHistoryKey, memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryStore } from '../memoryStore';
import { getAllMemoryVerses, TOTAL_VERSES } from '../library';
import { stepHref } from '../session';
import { MemorySettingsSheet } from '../ui/MemorySettingsSheet';
import { MemoryHome } from '../ui/home/MemoryHome';
import { WeekScreen } from '../ui/home/WeekScreen';
import { noteProgressSaved } from '../ui/savedToast';
import { bestStreak, daysUntilDue, learnedCount, libraryGroups, pastWeeks, stageView } from '../view';
import type { DailyLessonRecord } from '../dailyLesson';
import { dayFromNow, NOW, renderMemory, ZH } from './memoryHarness';

const home = (opts: Parameters<typeof renderMemory>[1] = {}) =>
  renderMemory(({ storage, now, onNavigate }) => <MemoryHome storage={storage} now={now} onNavigate={onNavigate} />, opts);

/** Today's lesson as the store plans it, with the given steps ticked. */
function seedLesson(done: boolean[] | 'auto' = 'auto') {
  const storage = createStorage(memoryBackend());
  const lesson = createMemoryStore(storage).todayLesson(NOW);
  if (done !== 'auto') {
    const steps = lesson.steps.map((s, i) => ({ ...s, completedAt: done[i] ? NOW.toISOString() : null }));
    const next: DailyLessonRecord = {
      ...lesson,
      steps,
      completedAt: steps.every((s) => s.completedAt) ? NOW.toISOString() : null,
    };
    storage.set(memoryLessonKey, next);
    storage.set(memoryHistoryKey, {
      startedOn: dayFromNow(-20),
      completedDates: next.completedAt ? [dayFromNow(0)] : [],
    });
  }
  return { storage, lesson: storage.get(memoryLessonKey)! };
}

const items = (l: DailyLessonRecord) => l.steps.map((s) => ({ verseId: s.verseId, stage: s.stage }));

describe('Memory home: today’s lesson', () => {
  it('first use: "Your first lesson", how it works, Start opens step 1, no streak yet, nothing learned', async () => {
    const { onNavigate, storage } = await home();
    const lesson = storage.get(memoryLessonKey)!;
    expect(lesson.steps.length).toBeGreaterThan(0);
    const card = screen.getByTestId('memory-lesson-card');
    expect(within(card).getByText('Your first lesson')).toBeTruthy();
    expect(screen.getByTestId('memory-how-it-works')).toBeTruthy();
    expect(screen.getByTestId('memory-streak-chip')).toHaveTextContent(/Start a streak/);
    expect(screen.getByTestId('memory-learned')).toHaveTextContent(`0 of ${TOTAL_VERSES}`);
    const start = screen.getByTestId('memory-lesson-start');
    expect(start).toHaveTextContent('Start');
    fireEvent.press(start);
    expect(onNavigate).toHaveBeenCalledWith(stepHref(items(lesson), 0));
  });

  it('half done: Continue goes to the first unfinished step', async () => {
    const { storage, lesson } = seedLesson([true, false, false, false]);
    const { onNavigate } = await home({ storage });
    const start = screen.getByTestId('memory-lesson-start');
    expect(start).toHaveTextContent('Continue');
    fireEvent.press(start);
    expect(onNavigate).toHaveBeenCalledWith(stepHref(items(lesson), 1));
  });

  it('one step left (skipped earlier): the card says so and Continue goes back to it', async () => {
    const { storage, lesson } = seedLesson(lesson4([false, true, true, true]));
    const { onNavigate } = await home({ storage });
    expect(screen.getByTestId('memory-lesson-card')).toHaveTextContent(/1 step left/);
    fireEvent.press(screen.getByTestId('memory-lesson-start'));
    expect(onNavigate).toHaveBeenCalledWith(stepHref(items(lesson), 0));
  });

  it('done today is a status label, not a button', async () => {
    const { storage, lesson } = seedLesson(lesson4([true, true, true, true]));
    expect(lesson.completedAt).not.toBeNull();
    await home({ storage });
    const done = screen.getByTestId('memory-lesson-done');
    expect(done).toHaveTextContent(/Done today/);
    expect(done.props.accessibilityRole).not.toBe('button');
    expect(screen.queryByTestId('memory-lesson-start')).toBeNull();
  });

  it('the streak chip opens the week', async () => {
    const { onNavigate } = await home();
    fireEvent.press(screen.getByTestId('memory-streak-chip'));
    expect(onNavigate).toHaveBeenCalledWith('/study/memory/week');
  });

  it('back mid-lesson: a "Progress saved" status shows once', async () => {
    noteProgressSaved(3, 4);
    await home();
    expect(screen.getByTestId('memory-saved-toast')).toHaveTextContent('Progress saved · step 3 of 4');
    const toast = screen.getByTestId('memory-saved-toast');
    expect(toast.props['aria-live'] ?? toast.props.accessibilityLiveRegion).toBe('polite');
    screen.unmount();
    await home();
    expect(screen.queryByTestId('memory-saved-toast')).toBeNull();
  });

  it('shows in Chinese', async () => {
    await home({ locales: [ZH] });
    expect(screen.getByText('背诵')).toBeTruthy();
    expect(screen.getByText('第一课')).toBeTruthy();
  });
});

/** Pads a 4-step pattern to the planned length (extra steps done). */
function lesson4(pattern: boolean[]): boolean[] {
  return [...pattern, ...Array(20).fill(true)];
}

describe('Memory home: the library', () => {
  it('lists all 60 verses grouped by series, each row with its stage', async () => {
    await home();
    for (const v of getAllMemoryVerses()) expect(screen.getByTestId(`memory-row-${v.id}`)).toBeTruthy();
    expect(screen.getByTestId('memory-row-2-corinthians-5-17')).toHaveTextContent(/2 Corinthians 5:17/);
    expect(screen.getByTestId('memory-row-2-corinthians-5-17')).toHaveTextContent(/New/);
  });

  it('a row opens the verse sheet; Practise now opens free practice (no lesson step)', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(memoryProgressKey, {
      '2-corinthians-5-17': {
        stage: 'fill_blank',
        successes: 1,
        failures: 0,
        masteryScore: 20,
        nextDueAt: new Date(2026, 10, 9, 23, 59).toISOString(),
        lastReviewedAt: NOW.toISOString(),
        lapsedAt: null,
      },
    });
    const { onNavigate } = await home({ storage });
    expect(screen.getByTestId('memory-row-2-corinthians-5-17')).toHaveTextContent(/Fill-in/);
    fireEvent.press(screen.getByTestId('memory-row-2-corinthians-5-17'));
    const sheet = screen.getByTestId('memory-verse-sheet');
    expect(sheet).toHaveTextContent(/若有人在基督里/);
    expect(sheet).toHaveTextContent(/in 4 days/);
    expect(sheet).toHaveTextContent(/doesn’t count toward today’s lesson/);
    fireEvent.press(screen.getByTestId('memory-practise'));
    const href = onNavigate.mock.calls[0][0] as string;
    expect(href).toMatch(/^\/memory\/lesson\/2-corinthians-5-17\/fill-blank/);
    expect(href).not.toMatch(/[?&]i=/);
  });

  it('shows the verses in Traditional when the script is set so', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), script: 'traditional' });
    await home({ storage });
    expect(screen.getByTestId('memory-row-2-corinthians-5-17')).toHaveTextContent(/若有人在基督裡/);
  });
});

describe('Memory settings sheet', () => {
  const sheet = (storage = createStorage(memoryBackend())) =>
    renderMemory(({ storage: s }) => <MemorySettingsSheet visible onClose={jest.fn()} storage={s} />, { storage });

  it('the voice switch is a switch; turning it off stores it and disables the speech choice', async () => {
    const { storage } = await sheet();
    const sw = screen.getByTestId('memory-voice-switch');
    expect(sw.props.accessibilityRole).toBe('switch');
    expect(sw.props.accessibilityState).toMatchObject({ checked: true });
    expect(screen.getByTestId('memory-settings-sheet')).toHaveTextContent(/OpenRouter/);
    await act(async () => fireEvent.press(sw));
    expect(storage.get(memorySettingsKey).voice).toBe(false);
    expect(screen.getByTestId('memory-voice-switch').props.accessibilityState).toMatchObject({ checked: false });
    expect(screen.getByTestId('memory-settings-sheet')).toHaveTextContent(/Nothing is recorded or uploaded/);
    expect(screen.getByTestId('memory-speech-cantonese').props.accessibilityState).toMatchObject({ disabled: true });
  });

  it('script and speech are stored', async () => {
    const { storage } = await sheet();
    await act(async () => fireEvent.press(screen.getByTestId('memory-script-traditional')));
    await act(async () => fireEvent.press(screen.getByTestId('memory-speech-cantonese')));
    expect(storage.get(memorySettingsKey)).toMatchObject({ script: 'traditional', speech: 'cantonese' });
  });

  it('says English verses are typed only', async () => {
    await sheet();
    expect(screen.getByTestId('memory-settings-sheet')).toHaveTextContent(/English.*typ/i);
  });

  it('the settings button on home opens it', async () => {
    await home();
    fireEvent.press(screen.getByTestId('memory-settings-button'));
    expect(screen.getByTestId('memory-settings-sheet')).toBeTruthy();
  });
});

describe('memory.settings v2', () => {
  it('reads a v1 value with voice on and no consent yet', () => {
    const backend = memoryBackend();
    backend.set('memory.settings', JSON.stringify({ v: 1, data: { speech: 'cantonese', script: 'traditional' } }));
    expect(createStorage(backend).get(memorySettingsKey)).toEqual({
      speech: 'cantonese',
      script: 'traditional',
      voice: true,
      voiceConsent: false,
    });
  });

  it('defaults to voice on, no consent', () => {
    expect(createStorage(memoryBackend()).get(memorySettingsKey)).toEqual({
      speech: 'mandarin',
      script: 'simplified',
      voice: true,
      voiceConsent: false,
    });
  });
});

describe('Week screen', () => {
  const week = (storage = createStorage(memoryBackend())) =>
    renderMemory(({ storage: s, now, onNavigate }) => <WeekScreen storage={s} now={now} onNavigate={onNavigate} />, { storage });

  it('today not done: "Do today’s lesson" opens the first unfinished step', async () => {
    const { storage, lesson } = seedLesson(lesson4([true, false, false, false]));
    const { onNavigate } = await week(storage);
    fireEvent.press(screen.getByTestId('memory-week-today'));
    expect(onNavigate).toHaveBeenCalledWith(stepHref(items(lesson), 1));
  });

  it('today done: a status label', async () => {
    const { storage } = seedLesson(lesson4([true, true, true, true]));
    await week(storage);
    expect(screen.getByTestId('memory-week-done')).toHaveTextContent(/Done today/);
    expect(screen.queryByTestId('memory-week-today')).toBeNull();
  });

  it('after a miss, kind copy with the best streak', async () => {
    const storage = createStorage(memoryBackend());
    // A 12-day run that ended a week ago, then a miss.
    storage.set(memoryHistoryKey, {
      startedOn: dayFromNow(-30),
      completedDates: Array.from({ length: 12 }, (_, i) => dayFromNow(-19 + i)),
    });
    await week(storage);
    expect(screen.getByTestId('memory-week-restart')).toHaveTextContent(/Your best is still 12 days/);
    expect(screen.getByTestId('memory-week-best')).toHaveTextContent(/12/);
    // The last 4 weeks as rows.
    for (let i = 0; i < 4; i++) expect(screen.getByTestId(`memory-week-row-${i}`)).toBeTruthy();
  });
});

describe('view helpers', () => {
  it('bestStreak is the longest run of consecutive days', () => {
    expect(bestStreak([])).toBe(0);
    expect(bestStreak(['2026-11-01', '2026-11-02', '2026-11-04'])).toBe(2);
    expect(bestStreak(['2026-10-31', '2026-11-01', '2026-11-01', '2026-11-02'])).toBe(3);
  });

  it('pastWeeks gives the n weeks before this one, most recent first, Sunday to Saturday', () => {
    const weeks = pastWeeks({ startedOn: '2026-10-20', completedDates: ['2026-10-26'] }, NOW, 4);
    expect(weeks).toHaveLength(4);
    expect(weeks[0]!.days.map((d) => d.date)).toEqual([
      '2026-10-25', '2026-10-26', '2026-10-27', '2026-10-28', '2026-10-29', '2026-10-30', '2026-10-31',
    ]);
    expect(weeks[0]!.days[1]!.state).toBe('done');
    expect(weeks[0]!.days[0]!.state).toBe('missed');
    expect(weeks[1]!.days[0]!.state).toBe('before-start');
  });

  it('daysUntilDue counts local days (0 = due today or overdue), null when never scheduled', () => {
    expect(daysUntilDue(null, NOW)).toBeNull();
    expect(daysUntilDue(new Date(2026, 10, 5, 23, 59).toISOString(), NOW)).toBe(0);
    expect(daysUntilDue(new Date(2026, 10, 1).toISOString(), NOW)).toBe(0);
    expect(daysUntilDue(new Date(2026, 10, 6, 23, 59).toISOString(), NOW)).toBe(1);
    expect(daysUntilDue(new Date(2026, 10, 9, 23, 59).toISOString(), NOW)).toBe(4);
  });

  it('stageView and learnedCount', () => {
    expect(stageView(undefined)).toEqual({ stage: 'new', steps: 0 });
    const row = { successes: 0, failures: 0, masteryScore: 0, nextDueAt: null, lastReviewedAt: null, lapsedAt: null };
    expect(stageView({ ...row, stage: 'chunk_order' })).toEqual({ stage: 'ordering', steps: 1 });
    expect(stageView({ ...row, stage: 'fill_blank' })).toEqual({ stage: 'fill-in', steps: 2 });
    expect(stageView({ ...row, stage: 'full_recall' })).toEqual({ stage: 'recall', steps: 3 });
    expect(stageView({ ...row, stage: 'review' })).toEqual({ stage: 'reviewing', steps: 4 });
    expect(learnedCount({ a: { ...row, stage: 'review' }, b: { ...row, stage: 'full_recall' } })).toBe(1);
  });

  it('libraryGroups: series A to E, then topics, in library order', () => {
    const groups = libraryGroups(getAllMemoryVerses());
    expect(groups.map((g) => g.series)).toEqual(['A', 'B', 'C', 'D', 'E']);
    expect(groups.flatMap((g) => g.topics.flatMap((t) => t.verses)).length).toBe(TOTAL_VERSES);
    expect(groups[0]!.topics[0]!.verses[0]!.id).toBe('2-corinthians-5-17');
  });
});
