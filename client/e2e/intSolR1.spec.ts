// INT Sol round 1 counterexamples. Unrun: this review sandbox cannot run Playwright.
import { expect, test } from '@playwright/test';

import { mockEntities } from './entityMocks';
import { mockApi, seed } from './helpers';

test.use({ locale: 'en-US', colorScheme: 'light' });

test.beforeEach(async ({ page }) => {
  await mockApi(page);
  await page.route(/googleapis\.com|google\.com|gstatic\.com|firebaseapp\.com|firebaseio\.com/, (route) => route.abort());
  await seed(page, 'appearance', { preset: 'silver', mode: 'light' });
});

// F1: Reset and the size value sit directly on the newly mounted aurora without its text shadow.
test('Customise: the Reset label and size value retain the aurora halo', async ({ page }) => {
  await page.goto('/me/customise');
  const frame = page.getByTestId('screen-customise');
  await expect(frame.getByTestId('aurora-background')).toHaveCount(1);
  const resetShadow = await frame.getByTestId('customise-reset').getByText('Reset', { exact: true }).evaluate((el) => getComputedStyle(el).textShadow);
  const sizeShadow = await frame.getByTestId('customise-size-value').evaluate((el) => getComputedStyle(el).textShadow);
  expect.soft(resetShadow).not.toBe('none');
  expect.soft(sizeShadow).not.toBe('none');
});

// F1: the small muted Chinese note is another direct child of the aurora content.
test('Customise: the Chinese Scripture font note retains the aurora halo', async ({ page }) => {
  await seed(page, 'language', 'zh-Hans');
  await page.goto('/me/customise');
  await expect(page.getByTestId('screen-customise').getByTestId('aurora-background')).toHaveCount(1);
  const note = page.getByTestId('customise-font-note');
  await expect(note).toBeVisible();
  expect(await note.evaluate((el) => getComputedStyle(el).textShadow)).not.toBe('none');
});

// F1: the contrast instructions themselves lose the halo on Advanced.
test('Advanced: the contrast instructions retain the aurora halo', async ({ page }) => {
  await page.goto('/me/advanced');
  const frame = page.getByTestId('screen-advanced');
  await expect(frame.getByTestId('aurora-background')).toHaveCount(1);
  const intro = frame.getByText(/^Changes apply to Silver only\./);
  await expect(intro).toBeVisible();
  expect(await intro.evaluate((el) => getComputedStyle(el).textShadow)).not.toBe('none');
});

test('Sources: the introduction retains the aurora halo', async ({ page }) => {
  await page.goto('/me/sources');
  const frame = page.getByTestId('screen-sources');
  await expect(frame.getByTestId('aurora-background')).toHaveCount(1);
  const intro = frame.getByText('Every text in this app is public domain or openly licensed.', { exact: true });
  await expect(intro).toBeVisible();
  expect(await intro.evaluate((el) => getComputedStyle(el).textShadow)).not.toBe('none');
});

// F2: common empty states and invalid links are also painted directly over the new aurora.
test('Study: the empty-state heading and hint retain the aurora halo', async ({ page }, testInfo) => {
  await page.goto('/study');
  await expect(page.getByTestId('screen-study').getByTestId('aurora-background')).toHaveCount(1);
  const state = page.getByTestId('study-empty');
  // From 768 px up the wording says Click (i18n/messages/desktop.ts); a phone keeps Tap.
  const verb = testInfo.project.name === 'desktop' ? 'Click' : 'Tap';
  for (const text of ['Nothing saved yet', `${verb} a verse in the Bible to highlight it, write a note or bookmark it.`]) {
    const label = state.getByText(text, { exact: true });
    await expect(label).toBeVisible();
    expect.soft(await label.evaluate((el) => getComputedStyle(el).textShadow)).not.toBe('none');
  }
});

test('Entities: an invalid kind retains the aurora halo on its state text', async ({ page }) => {
  await page.goto('/entities/invalid');
  await expect(page.getByTestId('screen-entity-list').getByTestId('aurora-background')).toHaveCount(1);
  const state = page.getByTestId('entity-not-found');
  for (const text of ['This page isn’t here', 'The link may be out of date.']) {
    const label = state.getByText(text, { exact: true });
    await expect(label).toBeVisible();
    expect.soft(await label.evaluate((el) => getComputedStyle(el).textShadow)).not.toBe('none');
  }
});

test('Explore: the no-match explanation retains the aurora halo', async ({ page }) => {
  await mockEntities(page);
  await page.goto('/study');
  await page.getByTestId('study-tab-explore').click();
  await page.getByTestId('explore-find').fill('zzzzzz');
  const note = page.getByTestId('explore-no-match');
  await expect(note).toBeVisible();
  await expect(page.getByTestId('screen-study').getByTestId('aurora-background')).toHaveCount(1);
  expect(await note.evaluate((el) => getComputedStyle(el).textShadow)).not.toBe('none');
});
