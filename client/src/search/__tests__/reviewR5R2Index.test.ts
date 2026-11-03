// Regression test from the Sol review of the R-5 data layer, round 2 (C:/myday/hub/jobs/r5-data-review-r2/review.md).
import * as fs from 'fs';
import * as path from 'path';
import type { BookInfo } from '../../api/schemas';
import { buildBookIndex, parseReference } from '../reference';
const books: BookInfo[] = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8')).body;
test('does not resolve aliases for books absent from the supplied index', () => {
 const genesisOnly = buildBookIndex(books.filter(b => b.book_number === 1));
 expect(parseReference('canticles', genesisOnly)).toBeNull();
 expect(parseReference('canticles 1', genesisOnly)).toBeNull();
});
