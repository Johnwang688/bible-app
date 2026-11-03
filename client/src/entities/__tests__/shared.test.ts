// The shared R-5 part 2 interfaces (orchestrator-owned): the timeline reader, the routes and the one matching rule.
import * as fs from 'fs';
import * as path from 'path';

import type { BookInfo } from '../../api/schemas';
import { buildBookIndex } from '../../search/reference';
import { entityMatches, filterEntityList, matchEntities, sectionLetter, sortEntities } from '../data';
import { entityListHref, entityPageHref, parseEntityKind, routeParam } from '../routes';
import { firstPassage, localiseEra, parseTimeline, splitDevelopment } from '../timeline';

const fixture = (name: string) =>
  JSON.parse(fs.readFileSync(path.resolve(__dirname, `../../../../tests/golden/fixtures/${name}.json`), 'utf8')).body;
const BOOK_LIST = fixture('books') as BookInfo[];
const INDEX = buildBookIndex(BOOK_LIST);

describe('the timeline', () => {
  it('reads the fixture: titles, eras, developments with their references', () => {
    const events = parseTimeline(fixture('entity_person_god').timeline, INDEX);
    expect(events).toHaveLength(7);
    expect(events[0]).toMatchObject({ era: 'Genesis 1-2', title: 'Creator of the Universe' });
    expect(events[0]!.developments[0]).toEqual({
      text: 'In the beginning, God creates the heavens and the earth',
      refText: 'Genesis 1:1',
      ref: { bookNumber: 1, chapter: 1, start: 1, end: 1 },
    });
    expect(events[0]!.developments[1]!.ref).toEqual({ bookNumber: 1, chapter: 1, start: 26, end: 27 });
    // "Exodus 3 / 34": the first part that parses.
    expect(events[1]!.eraRef).toEqual({ bookNumber: 2, chapter: 3 });
    // "Exodus 20 / Deuteronomy 6" in a development.
    expect(events[2]!.developments[2]!.ref).toEqual({ bookNumber: 2, chapter: 20 });
    expect(events[2]!.developments[2]!.refText).toBe('Exodus 20 / Deuteronomy 6');
    expect(events[0]!.significance).toMatch(/absolute ownership/);
  });

  it('is empty for a missing or malformed timeline, and drops bad events and developments', () => {
    expect(parseTimeline(null, INDEX)).toEqual([]);
    expect(parseTimeline({}, INDEX)).toEqual([]);
    expect(parseTimeline({ events: 'x' }, INDEX)).toEqual([]);
    const events = parseTimeline({ events: [null, { title: '' }, { title: 'T', developments: [3, 'Plain', ' '] }] }, INDEX);
    expect(events).toEqual([{ era: '', eraRef: null, title: 'T', summary: '', significance: null, developments: [{ text: 'Plain', refText: null, ref: null }] }]);
  });

  it('keeps a parenthesis that is not a reference in the sentence', () => {
    expect(splitDevelopment('He calls on the name (the Lord)', INDEX)).toEqual({ text: 'He calls on the name (the Lord)', refText: null, ref: null });
    expect(splitDevelopment('Paul preaches (Acts 18:4-6).', INDEX).ref).toEqual({ bookNumber: 44, chapter: 18, start: 4, end: 6 });
    expect(firstPassage('Genesis', INDEX)).toBeNull();
  });
});

describe('era labels', () => {
  it('puts book names in the interface language, longest first', () => {
    expect(localiseEra('Exodus 20 / Leviticus 19', BOOK_LIST, 'zh-Hans')).toBe('出埃及记 20 / 利未记 19');
    expect(localiseEra('1 John 4 / John 3', BOOK_LIST, 'zh-Hans')).toBe('约翰壹书 4 / 约翰福音 3');
    expect(localiseEra('Exodus 20 / Leviticus 19', BOOK_LIST, 'en')).toBe('Exodus 20 / Leviticus 19');
    expect(localiseEra('The Exile', BOOK_LIST, 'zh-Hans')).toBe('The Exile');
    expect(localiseEra('Johnny 3', BOOK_LIST, 'zh-Hans')).toBe('Johnny 3');
  });
});

describe('routes', () => {
  it('builds list and page links, and reads route params', () => {
    expect(entityListHref('person')).toBe('/entities/person');
    expect(entityListHref('theme', ' jo ')).toBe('/entities/theme?q=jo');
    expect(entityListHref('place', '  ')).toBe('/entities/place');
    expect(entityPageHref('place', 'jordan river')).toBe('/entities/place/jordan%20river');
    expect(parseEntityKind('person')).toBe('person');
    expect(parseEntityKind(['place'])).toBe('place');
    expect(parseEntityKind('people')).toBeNull();
    expect(parseEntityKind(undefined)).toBeNull();
    expect(routeParam(['a', 'b'])).toBe('a');
    expect(routeParam(undefined)).toBe('');
  });
});

describe('the one matching rule', () => {
  const places = fixture('entities_place') as { slug: string; label: string }[];
  it('matches the start of the name or of any word, case-insensitively, in A–Z order for lists', () => {
    expect(entityMatches('Jordan River', 'riv')).toBe(true);
    expect(entityMatches('Jordan River', 'ver')).toBe(false);
    expect(entityMatches('Anything', '')).toBe(true);
    const beth = filterEntityList(places, 'beth').map((p) => p.label);
    expect(beth.length).toBeGreaterThan(0);
    expect(beth).toEqual([...beth].sort());
    expect(beth.every((l) => entityMatches(l, 'beth'))).toBe(true);
  });

  it('agrees with matchEntities on which names match', () => {
    const people = fixture('entities_person') as { slug: string; label: string }[];
    const top = matchEntities({ person: people }, 'jo', 1000).map((m) => m.label).sort();
    expect(top).toEqual(filterEntityList(people, 'jo').map((p) => p.label).sort());
    expect(matchEntities({ person: people }, 'j')).toEqual([]);
  });

  it('sorts A–Z ignoring case', () => {
    const themes = sortEntities(fixture('entities_theme') as { slug: string; label: string }[]).map((t) => t.label.toLowerCase());
    expect(themes.length).toBe(2989);
    for (let i = 1; i < 50; i++) expect(themes[i - 1]!.localeCompare(themes[i]!, 'en', { sensitivity: 'base' })).toBeLessThanOrEqual(0);
  });

  it('files names under a letter, digits under #', () => {
    expect(sectionLetter('aaron')).toBe('A');
    expect(sectionLetter('144000 sealed')).toBe('#');
  });
});
