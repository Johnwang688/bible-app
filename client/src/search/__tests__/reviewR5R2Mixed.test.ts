// Regression test from the Sol review of the R-5 data layer, round 2 (C:/myday/hub/jobs/r5-data-review-r2/review.md).
import * as fs from 'fs';
import * as path from 'path';
import type { BookInfo } from '../../api/schemas';
import { buildBookIndex, suggestPassages } from '../reference';
const books: BookInfo[] = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8')).body;
const index = buildBookIndex(books);
test('a book part containing Chinese only matches a Chinese name', () => {
 expect(suggestPassages('John 爱 3', index)).toEqual([]);
});
