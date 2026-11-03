// Acceptance (orchestrator-owned): the Study tab's Saved list (R-3).
import type { StudyItems } from '../../storage/keys';
import { booksWithEntries, buildStudyList, filterStudyList, NO_FILTER } from '../list';

const T1 = '2026-11-01T10:00:00.000Z';
const T2 = '2026-11-02T10:00:00.000Z';
const T3 = '2026-11-03T10:00:00.000Z';

const ITEMS: StudyItems = {
  highlights: {
    // One action: John 3:16–18 yellow.
    '43:3:16': { colour: 'yellow', updatedAt: T1 },
    '43:3:17': { colour: 'yellow', updatedAt: T1 },
    '43:3:18': { colour: 'yellow', updatedAt: T1 },
    // Same colour and time but not next to it: its own entry.
    '43:3:20': { colour: 'yellow', updatedAt: T1 },
    // Next to it, same time, another colour: its own entry.
    '43:3:19': { colour: 'green', updatedAt: T1 },
    // Philippians 4:13 green, later.
    '50:4:13': { colour: 'green', updatedAt: T3 },
  },
  notes: {
    '19:23:1': { text: 'calm', updatedAt: T2 },
    '19:23:2': { text: 'second', updatedAt: T2 },
  },
  bookmarks: {
    '45:8:1': { createdAt: T2 },
    '45:8:2': { createdAt: T2 },
    '43:3:16': { createdAt: T1 },
  },
};

const ids = (xs: { id: string }[]) => xs.map((x) => x.id);

describe('buildStudyList', () => {
  it('makes one entry per saved action, newest first', () => {
    expect(ids(buildStudyList(ITEMS))).toEqual([
      'highlight:50:4:13-13',
      'note:19:23:1-1',
      'note:19:23:2-2',
      'bookmark:45:8:1-2',
      'highlight:43:3:16-18',
      'bookmark:43:3:16-16',
      'highlight:43:3:19-19',
      'highlight:43:3:20-20',
    ]);
  });

  it('carries what each entry shows', () => {
    const list = buildStudyList(ITEMS);
    expect(list.find((e) => e.id === 'highlight:43:3:16-18')).toEqual({
      id: 'highlight:43:3:16-18',
      kind: 'highlight',
      bookNumber: 43,
      chapter: 3,
      start: 16,
      end: 18,
      time: T1,
      colour: 'yellow',
      note: null,
    });
    expect(list.find((e) => e.id === 'note:19:23:1-1')).toMatchObject({ note: 'calm', colour: null, time: T2 });
  });

  it('never joins across chapters or books', () => {
    const list = buildStudyList({
      highlights: { '43:3:36': { colour: 'blue', updatedAt: T1 }, '43:4:1': { colour: 'blue', updatedAt: T1 } },
      notes: {},
      bookmarks: { '42:24:53': { createdAt: T1 }, '43:1:1': { createdAt: T1 } },
    });
    expect(list).toHaveLength(4);
  });

  it('sorts canon order numerically, not as text', () => {
    const list = buildStudyList({
      highlights: {},
      notes: {},
      bookmarks: { '9:1:1': { createdAt: T1 }, '10:1:1': { createdAt: T1 }, '1:10:1': { createdAt: T1 }, '1:9:2': { createdAt: T1 } },
    });
    expect(ids(list)).toEqual(['bookmark:1:9:2-2', 'bookmark:1:10:1-1', 'bookmark:9:1:1-1', 'bookmark:10:1:1-1']);
  });

  it('is empty for no items', () => {
    expect(buildStudyList({ highlights: {}, notes: {}, bookmarks: {} })).toEqual([]);
  });
});

describe('filterStudyList', () => {
  const list = buildStudyList(ITEMS);

  it('passes everything with no filter', () => {
    expect(filterStudyList(list, NO_FILTER)).toEqual(list);
  });

  it('filters by kind', () => {
    expect(ids(filterStudyList(list, { ...NO_FILTER, kind: 'note' }))).toEqual(['note:19:23:1-1', 'note:19:23:2-2']);
    expect(ids(filterStudyList(list, { ...NO_FILTER, kind: 'bookmark' }))).toEqual(['bookmark:45:8:1-2', 'bookmark:43:3:16-16']);
  });

  it('a colour shows only highlights in that colour, whatever the kind chip says', () => {
    expect(ids(filterStudyList(list, { ...NO_FILTER, colour: 'green' }))).toEqual(['highlight:50:4:13-13', 'highlight:43:3:19-19']);
    expect(filterStudyList(list, { ...NO_FILTER, kind: 'note', colour: 'green' })).toEqual([]);
  });

  it('filters by book, combined with the others', () => {
    expect(ids(filterStudyList(list, { ...NO_FILTER, bookNumber: 43, colour: 'yellow' }))).toEqual([
      'highlight:43:3:16-18',
      'highlight:43:3:20-20',
    ]);
  });

  it('lists the books that have entries, in canon order', () => {
    expect(booksWithEntries(list)).toEqual([19, 43, 45, 50]);
  });
});
