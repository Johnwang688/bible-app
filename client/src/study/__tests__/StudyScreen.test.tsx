// Acceptance (orchestrator-owned): the Study tab, Saved and Progress (R-3). Plan: "Study: what you've kept,
// and where you've been"; designs: the canvas frames "Study: saved" and "Study: progress".
import { act, fireEvent, screen, within } from '@testing-library/react-native';

import { ZH } from '../../reader/__tests__/readerHarness';
import { readerTargets } from '../../reader/target';
import { readerPositionKey, studyItemsKey, type StudyItems } from '../../storage/keys';
import { renderStudy } from './studyHarness';

const at = (day: number, hour = 10) => new Date(2026, 10, day, hour).toISOString();
const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' as const };

const ITEMS: StudyItems = {
  highlights: {
    '43:3:16': { colour: 'yellow', updatedAt: at(1) },
    '43:3:17': { colour: 'yellow', updatedAt: at(1) },
    '50:4:3': { colour: 'green', updatedAt: at(3) },
  },
  notes: { '19:23:1': { text: 'Read this before the exam.', updatedAt: at(2) } },
  bookmarks: { '45:8:1': { createdAt: at(2, 9) } },
};

const press = (id: string) => fireEvent.press(screen.getByTestId(id));
const entryIds = () => screen.queryAllByTestId(/^study-entry-[a-z]+:[\d:-]+$/).map((n) => n.props.testID as string);

beforeEach(() => readerTargets.clear());

describe('Study: saved', () => {
  it('opens on Saved, with Saved and Progress as tabs', async () => {
    await renderStudy();
    expect(screen.getByTestId('screen-study')).toBeTruthy();
    const saved = screen.getByTestId('study-tab-saved');
    const progress = screen.getByTestId('study-tab-progress');
    expect(saved.props.accessibilityRole).toBe('tab');
    expect(saved.props.accessibilityState).toMatchObject({ selected: true });
    expect(progress.props.accessibilityState).toMatchObject({ selected: false });
    expect(screen.getByText('Saved')).toBeTruthy();
    expect(screen.getByText('Progress')).toBeTruthy();
  });

  it('says what to do when nothing is saved', async () => {
    await renderStudy();
    expect(await screen.findByTestId('study-empty')).toBeTruthy();
    expect(screen.getByText('Nothing saved yet')).toBeTruthy();
  });

  it('lists every saved item newest first: reference, date, the verse text and the note', async () => {
    await renderStudy({ items: ITEMS, position: JOHN3_WEB });
    expect(entryIds()).toEqual([
      'study-entry-highlight:50:4:3-3',
      'study-entry-note:19:23:1-1',
      'study-entry-bookmark:45:8:1-1',
      'study-entry-highlight:43:3:16-17',
    ]);
    const john = screen.getByTestId('study-entry-highlight:43:3:16-17');
    expect(within(john).getByText('John 3:16–17')).toBeTruthy();
    expect(within(john).getByText('Nov 1')).toBeTruthy();
    // The text in the reader's translation (WEB): both verses.
    const text = await within(john).findByTestId('study-entry-highlight:43:3:16-17-text');
    expect(text.props.children).toEqual(expect.stringContaining('For God so loved the world'));
    const note = screen.getByTestId('study-entry-note:19:23:1-1');
    expect(within(note).getByText('Psalms 23:1')).toBeTruthy();
    expect(within(note).getByTestId('study-entry-note:19:23:1-1-note').props.children).toBe('Read this before the exam.');
    expect(await within(note).findByText('Psalms 23:1 WEB')).toBeTruthy();
  });

  it('loads each chapter once, however many entries it holds', async () => {
    const { calls } = await renderStudy({
      items: { ...ITEMS, bookmarks: { '43:3:1': { createdAt: at(1) }, '43:3:5': { createdAt: at(1, 11) } } },
      position: JOHN3_WEB,
    });
    await screen.findAllByText(/For God so loved/);
    expect(calls.filter((c) => c === 'John 3 WEB')).toHaveLength(1);
  });

  it('a chapter that fails to load says so on its entries; the rest still show', async () => {
    await renderStudy({ items: ITEMS, position: JOHN3_WEB, fail: new Set(['Psalms 23 WEB']) });
    const note = screen.getByTestId('study-entry-note:19:23:1-1');
    expect(await within(note).findByText('Couldn’t load the verse text.')).toBeTruthy();
    expect(await screen.findByText('Philippians 4:3 WEB')).toBeTruthy();
  });

  it('each entry is a button that says what it is, and opens it in context', async () => {
    const { storage, navigate } = await renderStudy({ items: ITEMS, position: JOHN3_WEB });
    const entry = screen.getByTestId('study-entry-highlight:43:3:16-17');
    expect(entry.props.accessibilityRole).toBe('button');
    expect(entry.props.accessibilityLabel).toBe('Yellow highlight: John 3:16–17, Nov 1');
    expect(entry.props.accessibilityHint).toBe('Opens it in the Bible');
    expect(screen.getByTestId('study-entry-note:19:23:1-1').props.accessibilityLabel).toBe('Note: Psalms 23:1, Nov 2');
    await fireEvent.press(entry);
    expect(readerTargets.get()).toEqual({ bookNumber: 43, chapter: 3, start: 16, end: 17 });
    // The reader moves there in the translation it was in.
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
    expect(navigate).toHaveBeenCalledTimes(1);
  });

  it('filters by kind with the chips', async () => {
    await renderStudy({ items: ITEMS, position: JOHN3_WEB });
    expect(screen.getByTestId('study-kind-all').props.accessibilityState).toMatchObject({ selected: true });
    await press('study-kind-note');
    expect(screen.getByTestId('study-kind-note').props.accessibilityState).toMatchObject({ selected: true });
    expect(screen.getByTestId('study-kind-all').props.accessibilityState).toMatchObject({ selected: false });
    expect(entryIds()).toEqual(['study-entry-note:19:23:1-1']);
    await press('study-kind-bookmark');
    expect(entryIds()).toEqual(['study-entry-bookmark:45:8:1-1']);
    await press('study-kind-highlight');
    expect(entryIds()).toEqual(['study-entry-highlight:50:4:3-3', 'study-entry-highlight:43:3:16-17']);
    await press('study-kind-all');
    expect(entryIds()).toHaveLength(4);
  });

  it('filters by colour with the dots; pressing the chosen dot again clears it', async () => {
    await renderStudy({ items: ITEMS, position: JOHN3_WEB });
    const green = screen.getByTestId('study-colour-green');
    expect(green.props.accessibilityRole).toBe('button');
    expect(green.props.accessibilityLabel).toBe('Only Green highlights');
    await press('study-colour-green');
    expect(screen.getByTestId('study-colour-green').props.accessibilityState).toMatchObject({ selected: true });
    expect(entryIds()).toEqual(['study-entry-highlight:50:4:3-3']);
    await press('study-colour-yellow');
    expect(entryIds()).toEqual(['study-entry-highlight:43:3:16-17']);
    await press('study-colour-yellow');
    expect(screen.getByTestId('study-colour-yellow').props.accessibilityState).toMatchObject({ selected: false });
    expect(entryIds()).toHaveLength(4);
  });

  it('filters by book from a sheet that offers only the books with items', async () => {
    await renderStudy({ items: ITEMS, position: JOHN3_WEB });
    expect(within(screen.getByTestId('study-book-filter')).getByText('All books')).toBeTruthy();
    await press('study-book-filter');
    const sheet = await screen.findByTestId('study-book-sheet');
    expect(
      within(sheet)
        .queryAllByTestId(/^study-book-option-/)
        .map((n) => n.props.testID),
    ).toEqual(['study-book-option-all', 'study-book-option-19', 'study-book-option-43', 'study-book-option-45', 'study-book-option-50']);
    await fireEvent.press(within(sheet).getByTestId('study-book-option-43'));
    expect(screen.queryByTestId('study-book-sheet')).toBeNull();
    expect(within(screen.getByTestId('study-book-filter')).getByText('John')).toBeTruthy();
    expect(entryIds()).toEqual(['study-entry-highlight:43:3:16-17']);
  });

  it('when the filters match nothing, says so and offers to clear them', async () => {
    await renderStudy({ items: ITEMS, position: JOHN3_WEB });
    await press('study-kind-bookmark');
    await press('study-colour-green');
    expect(entryIds()).toEqual([]);
    expect(screen.getByTestId('study-no-matches')).toBeTruthy();
    expect(screen.queryByTestId('study-empty')).toBeNull();
    await press('study-clear-filters');
    expect(entryIds()).toHaveLength(4);
    expect(screen.getByTestId('study-kind-all').props.accessibilityState).toMatchObject({ selected: true });
  });

  it('is local-first and live: an item saved in the reader shows at once', async () => {
    const { storage } = await renderStudy({ position: JOHN3_WEB });
    await act(async () => {
      storage.set(studyItemsKey, { highlights: {}, notes: {}, bookmarks: { '43:3:16': { createdAt: at(4) } } });
    });
    expect(entryIds()).toEqual(['study-entry-bookmark:43:3:16-16']);
    expect(screen.queryByTestId('study-empty')).toBeNull();
  });

  it('in Chinese: book names follow the interface, dates are Chinese, text is in the reader’s translation', async () => {
    await renderStudy({ items: ITEMS, locales: [ZH], position: { bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' } });
    expect(screen.getByText('收藏')).toBeTruthy();
    const john = screen.getByTestId('study-entry-highlight:43:3:16-17');
    expect(within(john).getByText('约翰福音 3:16–17')).toBeTruthy();
    expect(within(john).getByText('11月1日')).toBeTruthy();
    const text = await within(john).findByTestId('study-entry-highlight:43:3:16-17-text');
    expect(text.props.children).toEqual(expect.stringContaining('神爱世人'));
    expect(john.props.accessibilityLabel).toBe('黄色高亮：约翰福音 3:16–17，11月1日');
  });
});

describe('Study: progress', () => {
  const PROGRESS = {
    goalMinutes: 15,
    // Wednesday 4 November 2026; Monday and Tuesday met, today 9 minutes in.
    activeMs: { '2026-11-04': 9 * 60_000 + 30_000 },
    goalMetDays: ['2026-10-20', '2026-10-21', '2026-10-22', '2026-10-23', '2026-11-02', '2026-11-03'],
    chaptersRead: { '1:1': 'x', '1:2': 'x', '65:1': 'x' },
  };

  async function openProgress(opts: Parameters<typeof renderStudy>[0] = {}) {
    const r = await renderStudy({ progress: PROGRESS, ...opts });
    await press('study-tab-progress');
    expect(screen.getByTestId('study-tab-progress').props.accessibilityState).toMatchObject({ selected: true });
    return r;
  }

  it('shows the streak, the best streak and this week, Monday first', async () => {
    await openProgress();
    expect(screen.getByTestId('study-streak-count').props.children).toBe('2');
    expect(screen.getByText('day streak')).toBeTruthy();
    expect(screen.getByTestId('study-streak').props.accessibilityLabel).toBe('2-day streak');
    expect(screen.getByText('Best: 4 days')).toBeTruthy();
    const days = [0, 1, 2, 3, 4, 5, 6].map((i) => screen.getByTestId(`study-day-${i}`).props.accessibilityLabel);
    expect(days).toEqual([
      'Monday: goal met',
      'Tuesday: goal met',
      'Wednesday: goal not met',
      'Thursday: still to come',
      'Friday: still to come',
      'Saturday: still to come',
      'Sunday: still to come',
    ]);
  });

  it('shows today’s goal as a progress bar', async () => {
    await openProgress();
    expect(screen.getByText('9 of 15 min')).toBeTruthy();
    const bar = screen.getByTestId('study-goal-bar');
    expect(bar.props.accessibilityRole).toBe('progressbar');
    expect(bar.props.accessibilityValue).toEqual({ min: 0, max: 15, now: 9 });
  });

  it('counts the chapters explored and maps every book, one square each, labelled in full', async () => {
    await openProgress();
    expect(screen.getByTestId('study-explored-count').props.accessibilityLabel).toBe('3 of 1,189 chapters explored');
    expect(await screen.findByTestId('study-map-1')).toBeTruthy();
    expect(screen.queryAllByTestId(/^study-map-\d+$/)).toHaveLength(66);
    expect(screen.getByTestId('study-map-1').props.accessibilityLabel).toBe('Genesis: 2 of 50 chapters read');
    expect(screen.getByTestId('study-map-65').props.accessibilityLabel).toBe('Jude: 1 of 1 chapters read');
    expect(within(screen.getByTestId('study-map-43')).getByText('Jhn')).toBeTruthy();
    expect(screen.getByText('Old Testament')).toBeTruthy();
    expect(screen.getByText('New Testament')).toBeTruthy();
  });

  it('a new reader sees zeros, not errors', async () => {
    await renderStudy();
    await press('study-tab-progress');
    expect(screen.getByTestId('study-streak-count').props.children).toBe('0');
    expect(screen.getByText('0 of 10 min')).toBeTruthy();
    expect(screen.getByTestId('study-explored-count').props.accessibilityLabel).toBe('0 of 1,189 chapters explored');
  });

  it('in Chinese: Chinese labels and the CUV book abbreviations', async () => {
    await openProgress({ locales: [ZH] });
    expect(screen.getByText('天连续阅读')).toBeTruthy();
    expect(screen.getByText('9 / 15 分钟')).toBeTruthy();
    expect(screen.getByTestId('study-day-0').props.accessibilityLabel).toBe('星期一：已达成目标');
    expect(within(await screen.findByTestId('study-map-43')).getByText('约')).toBeTruthy();
    expect(screen.getByTestId('study-map-1').props.accessibilityLabel).toBe('创世纪：已读 2 章，共 50 章');
    expect(screen.getByText('旧约')).toBeTruthy();
  });
});
