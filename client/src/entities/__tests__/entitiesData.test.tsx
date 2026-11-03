// Acceptance (orchestrator-owned, R-5b): people, places and themes data. The lists and pages come from
// `/summary-entities` as they are today (the curated rebuild is commentary CM-3, backend work).
import { QueryClient } from '@tanstack/react-query';
import { renderHook, waitFor } from '@testing-library/react-native';
import * as fs from 'fs';
import * as path from 'path';
import type { ReactNode } from 'react';

import { ApiProvider } from '../../api/ApiProvider';
import type { ApiClient } from '../../api/client';
import type { EntityKind, SummaryEntityListItemOut, SummaryEntityPageOut } from '../../api/schemas';
import { ENTITY_KINDS, groupReferencesByBook, matchEntities, useEntityList, useEntityPage } from '../data';

const fixture = (name: string) =>
  JSON.parse(fs.readFileSync(path.resolve(__dirname, `../../../../tests/golden/fixtures/${name}.json`), 'utf8')).body;

const item = (label: string): SummaryEntityListItemOut => ({ label, slug: label.toLowerCase().replace(/\s+/g, '-') });

describe('ENTITY_KINDS', () => {
  it('lists people, places, then themes', () => {
    expect(ENTITY_KINDS).toEqual(['person', 'place', 'theme']);
  });
});

describe('groupReferencesByBook', () => {
  it('groups chapters by book in canon order, each sorted and unique', () => {
    const refs = [
      { commentary_id: 5, book_number: 43, book_name: 'John', chapter: 3 },
      { commentary_id: 1, book_number: 1, book_name: 'Genesis', chapter: 12 },
      { commentary_id: 2, book_number: 1, book_name: 'Genesis', chapter: 3 },
      { commentary_id: 3, book_number: 1, book_name: 'Genesis', chapter: 12 },
      { commentary_id: 4, book_number: 43, book_name: 'John', chapter: 1 },
    ];
    expect(groupReferencesByBook(refs)).toEqual([
      { bookNumber: 1, chapters: [3, 12] },
      { bookNumber: 43, chapters: [1, 3] },
    ]);
    expect(groupReferencesByBook([])).toEqual([]);
  });

  it('handles a real page', () => {
    const page = fixture('entity_theme_covenant') as SummaryEntityPageOut;
    const groups = groupReferencesByBook(page.references);
    expect(groups[0]!.bookNumber).toBe(1);
    expect(groups[0]!.chapters.slice(0, 3)).toEqual([1, 3, 4]);
    const total = groups.reduce((n, g) => n + g.chapters.length, 0);
    expect(total).toBe(new Set(page.references.map((r) => `${r.book_number}:${r.chapter}`)).size);
  });
});

describe('matchEntities', () => {
  const lists = {
    person: ['Abraham', 'Abram', 'Isaac', 'Jacob', 'John the Baptist', 'Joseph', 'Mary Magdalene'].map(item),
    place: ['Bethel', 'Bethlehem', 'Jerusalem', 'Jordan River'].map(item),
    theme: ['Faith', 'Faithfulness of God', 'Love', 'Steadfast love', 'Loving kindness'].map(item),
  };

  it('needs at least two characters', () => {
    expect(matchEntities(lists, '')).toEqual([]);
    expect(matchEntities(lists, ' a ')).toEqual([]);
  });

  it('matches the start of the label or of any word, case-insensitively', () => {
    expect(matchEntities(lists, 'magd').map((m) => m.label)).toEqual(['Mary Magdalene']);
    expect(matchEntities(lists, 'BAPTIST').map((m) => m.label)).toEqual(['John the Baptist']);
    expect(matchEntities(lists, 'ham')).toEqual([]); // inside a word does not count
  });

  it('ranks an exact label, then a label prefix, then a word prefix; shorter first', () => {
    expect(matchEntities(lists, 'love', 5).map((m) => m.label)).toEqual(['Love', 'Steadfast love']);
    expect(matchEntities(lists, 'lov', 5).map((m) => m.label)).toEqual(['Love', 'Loving kindness', 'Steadfast love']);
    expect(matchEntities(lists, 'faith', 5).map((m) => m.label)).toEqual(['Faith', 'Faithfulness of God']);
  });

  it('keeps kinds in order, people then places then themes, a few of each', () => {
    const out = matchEntities(lists, 'j', 3);
    expect(out).toEqual([]);
    const jo = matchEntities(lists, 'jo');
    expect(jo.map((m) => [m.kind, m.label])).toEqual([
      ['person', 'Joseph'],
      ['person', 'John the Baptist'],
      ['place', 'Jordan River'],
    ]);
    const be = matchEntities(lists, 'beth', 1);
    expect(be).toEqual([{ kind: 'place', slug: 'bethel', label: 'Bethel' }]);
  });

  it('defaults to three per kind', () => {
    const many = { person: ['Ab1', 'Ab2', 'Ab3', 'Ab4'].map(item) };
    expect(matchEntities(many, 'ab')).toHaveLength(3);
  });

  it('works with lists still loading', () => {
    expect(matchEntities({ theme: lists.theme }, 'faith').map((m) => m.kind)).toEqual(['theme', 'theme']);
  });
});

describe('useEntityList / useEntityPage', () => {
  function harness() {
    const calls: string[] = [];
    const api = {
      entities: async (kind: EntityKind) => {
        calls.push(`list ${kind}`);
        return fixture(`entities_${kind}`);
      },
      entity: async (kind: EntityKind, slug: string) => {
        calls.push(`page ${kind} ${slug}`);
        return fixture('entity_person_god');
      },
    } as unknown as ApiClient;
    const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
    const wrapper = ({ children }: { children: ReactNode }) => (
      <ApiProvider client={api} queryClient={queryClient}>
        {children}
      </ApiProvider>
    );
    return { calls, wrapper };
  }

  it('loads a list once and keeps it', async () => {
    const { calls, wrapper } = harness();
    const a = await renderHook(() => useEntityList('person'), { wrapper });
    await waitFor(() => expect(a.result.current.isSuccess).toBe(true));
    expect(a.result.current.data?.[0]).toEqual({ label: 'Aaron', slug: 'aaron' });
    const b = await renderHook(() => useEntityList('person'), { wrapper });
    await waitFor(() => expect(b.result.current.isSuccess).toBe(true));
    expect(calls).toEqual(['list person']);
  });

  it('does not load a list while disabled', async () => {
    const { calls, wrapper } = harness();
    const view = await renderHook(() => useEntityList('theme', { enabled: false }), { wrapper });
    expect(view.result.current.fetchStatus).toBe('idle');
    expect(calls).toEqual([]);
  });

  it('loads a page by kind and slug', async () => {
    const { calls, wrapper } = harness();
    const view = await renderHook(() => useEntityPage('person', 'god'), { wrapper });
    await waitFor(() => expect(view.result.current.isSuccess).toBe(true));
    expect(view.result.current.data?.label).toBe('God');
    expect(calls).toEqual(['page person god']);
  });
});
