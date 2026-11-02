// Regression test from the Sol review of the R-3 teams (round 4, F1). KNOWN GAP, shipped with R-3 by John's
// decision (see the R-3 notes in docs/plans/app-rebuild.md): on the web the chapter's zero-height end marker moves
// without resizing when the text gets smaller, so it reports no new place, and a content-size report may only raise
// the measured height. The chapter is then under-credited (never over-credited). Remove `fixme` once fixed.
import { expect, test } from '@playwright/test';

import { mockApi, seed, stored } from './helpers';

test.use({ locale: 'en-US', colorScheme: 'light', viewport: { width: 1000, height: 1400 } });

test.fixme('shrinking text credits the newly visible half of John 3', async ({ page }) => {
  await page.clock.install({ time: new Date(2026, 10, 2, 9) });
  await mockApi(page); // John 3 WEB golden fixture: 36 verses.
  await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
  await seed(page, 'reader.settings', { textSize: 5, parallel: null });
  await page.goto('/bible');
  await expect(page.getByTestId('verse-36')).toBeAttached();
  await page.evaluate(() => document.fonts.ready);
  await page.clock.runFor(1000);

  const geometry = () =>
    page.getByTestId('reader-scroll').evaluate((el) => ({ viewport: el.clientHeight, content: el.scrollHeight }));

  const before = await geometry();
  await page.getByTestId('reader-settings-button').click();
  for (let i = 0; i < 5; i++) await page.getByTestId('settings-smaller').click();
  await page.getByTestId('settings-done').click();
  await page.clock.runFor(1000);

  const after = await geometry();
  expect(Math.ceil((36 * before.viewport) / before.content)).toBeLessThan(18);
  expect(Math.ceil((36 * after.viewport) / after.content)).toBeGreaterThanOrEqual(18);

  await page.clock.runFor(55_000);
  const progress = await stored<{ chaptersRead: Record<string, string> }>(page, 'reading.progress');
  expect(progress?.chaptersRead).toHaveProperty('43:3');
});
