// Regression test from the Sol review of the R-5 data layer, round 2 (C:/myday/hub/jobs/r5-data-review-r2/review.md).
import * as fs from 'fs';
import * as path from 'path';
import type { BookInfo } from '../../api/schemas';
import { buildBookIndex, suggestPassages } from '../reference';
const books: BookInfo[] = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8')).body;
const index = buildBookIndex(books);
test('ranks remaining Chinese prefixes by coverage after the exact alias', () => {
 expect(suggestPassages('约', index, 8).map(r => r.bookNumber)).toEqual([43, 18, 29, 32, 6, 62, 63, 64]);
});
