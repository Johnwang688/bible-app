// Regression test from the Sol review of the R-5 data layer, round 2 (C:/myday/hub/jobs/r5-data-review-r2/review.md).
import * as fs from 'fs';
import * as path from 'path';
import type { BookInfo } from '../../api/schemas';
import { buildBookIndex, parseReference } from '../reference';
const books: BookInfo[] = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8')).body;
const index = buildBookIndex(books);
test('the two-letter ti alias resolves Titus with a chapter', () => {
 expect(parseReference('ti 3', index)).toEqual({bookNumber:56,chapter:3});
});
