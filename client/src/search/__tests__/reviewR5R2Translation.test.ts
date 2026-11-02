// Regression test from the Sol review of the R-5 data layer, round 2 (C:/myday/hub/jobs/r5-data-review-r2/review.md).
import { searchTranslation } from '../searchTranslation';
test('keeps the first matching translation when both have the query language', () => {
 expect(searchTranslation('love', 'BSB', 'WEB')).toBe('BSB');
 expect(searchTranslation('爱', 'CUV', 'CUV-SIMP')).toBe('CUV');
});
