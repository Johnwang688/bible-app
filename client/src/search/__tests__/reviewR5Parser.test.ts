// Regression tests from the Sol review of the R-5 data layer (round 1). F1–F3 were caught bugs; F4 was
// not taken (an exact short CUV name, 哈 for Habakkuk, rightly outranks a longer prefix match).
import * as fs from 'fs';
import * as path from 'path';

import type { BookInfo } from '../../api/schemas';
import { buildBookIndex, parseReference, suggestPassages } from '../reference';

const BOOKS: BookInfo[] = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8'),
).body;
const index = buildBookIndex(BOOKS);

describe('F1: common abbreviations', () => {
  test.each([
    ['1 kgs 3', { bookNumber: 11, chapter: 3 }],
    ['2 kgs 2', { bookNumber: 12, chapter: 2 }],
    ['dt 6:4', { bookNumber: 5, chapter: 6, start: 4, end: 4 }],
    ['sos 2', { bookNumber: 22, chapter: 2 }],
    ['jm 1:5', { bookNumber: 59, chapter: 1, start: 5, end: 5 }],
    ['jas 1:5', { bookNumber: 59, chapter: 1, start: 5, end: 5 }],
    ['rm 8', { bookNumber: 45, chapter: 8 }],
    ['gn 1', { bookNumber: 1, chapter: 1 }],
    ['约壹 4:8', { bookNumber: 62, chapter: 4, start: 8, end: 8 }],
    ['约贰 1:5', { bookNumber: 63, chapter: 1, start: 5, end: 5 }],
    ['约参 1:5', { bookNumber: 64, chapter: 1, start: 5, end: 5 }],
  ])('%s', (query, expected) => {
    expect(parseReference(query, index)).toEqual(expected);
  });

  it('leaves a bare "cor" or "tim" ambiguous, and suggests both letters', () => {
    expect(parseReference('cor 13', index)).toBeNull();
    expect(parseReference('tim 3', index)).toBeNull();
    expect(suggestPassages('cor 13', index).map((r) => r.bookNumber)).toEqual(expect.arrayContaining([46, 47]));
  });
});

describe('F2: the book part must be a book, nothing more', () => {
  test.each(['John 爱 3', 'John, 3', 'John -3', 'Jo-hn 3', 'J.o.h.n 3'])('%s', (query) => {
    expect(parseReference(query, index)).toBeNull();
  });
  it('still takes the dotted and spaced forms readers use', () => {
    expect(parseReference('Gen. 1', index)).toEqual({ bookNumber: 1, chapter: 1 });
    expect(parseReference('1 Cor. 13:4', index)).toEqual({ bookNumber: 46, chapter: 13, start: 4, end: 4 });
    expect(parseReference('Song of Songs 2', index)).toEqual({ bookNumber: 22, chapter: 2 });
  });
});

describe('F3: trailing punctuation in any order', () => {
  test.each(['John 3:16).', 'John 3:16))', 'John 3:16;.', '约翰福音3章16节.', '约翰福音3章16节。', '(John 3:16).'])('%s', (query) => {
    expect(parseReference(query, index)).toEqual({ bookNumber: 43, chapter: 3, start: 16, end: 16 });
  });
});
