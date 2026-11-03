// Regression test from the Sol review of the R-5 data layer, round 3: kills a surviving mutant.
import * as fs from 'fs';
import * as path from 'path';

import type { BookInfo } from '../../api/schemas';
import { buildBookIndex, suggestPassages } from '../reference';

const BOOKS: BookInfo[] = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8'),
).body;

test('rejects hyphens inside suggested book names', () => {
  expect(suggestPassages('Jo-hn 3', buildBookIndex(BOOKS))).toEqual([]);
});
