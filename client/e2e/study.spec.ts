// Web e2e for R-3: the Study tab (Saved and Progress), reading progress from the reader, and opening a
// saved item in context. Orchestrator-owned.
import { expect, test } from '@playwright/test';

import { mockApi, seed, stored } from './helpers';

const at = (day: number, hour = 10) => new Date(2026, 10, day, hour).toISOString();
const ITEMS = {
  highlights: {
    '43:3:16': { colour: 'yellow', updatedAt: at(1) },
    '43:3:17': { colour: 'yellow', updatedAt: at(1) },
    '19:23:1': { colour: 'green', updatedAt: at(3) },
  },
  notes: { '43:3:30': { text: 'He must increase.', updatedAt: at(2) } },
  bookmarks: {},
};

test.beforeEach(async ({ page }) => mockApi(page));

test.describe('Study: saved (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test.beforeEach(async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 1, chapter: 1, translation: 'WEB' });
    await seed(page, 'study.items', ITEMS, 2);
  });

  test('lists saved items newest first, with their text, and filters them', async ({ page }) => {
    await page.goto('/study');
    const entries = page.getByTestId(/^study-entry-[a-z]+:[\d:-]+$/);
    await expect(entries).toHaveCount(3);
    await expect(entries.nth(0)).toContainText('Psalms 23:1');
    await expect(entries.nth(1)).toContainText('He must increase.');
    await expect(entries.nth(2)).toContainText('John 3:16–17');
    await expect(entries.nth(2)).toContainText('For God so loved the world');
    await page.getByTestId('study-kind-note').click();
    await expect(entries).toHaveCount(1);
    await page.getByTestId('study-kind-all').click();
    await page.getByTestId('study-colour-yellow').click();
    await expect(entries).toHaveCount(1);
    await expect(entries.first()).toContainText('John 3:16–17');
  });

  test('tapping an item opens it in context: the Bible tab, that chapter, the verses selected and in view', async ({ page }) => {
    await page.goto('/study');
    await page.getByTestId('study-entry-note:43:3:30-30').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('verse-30')).toBeInViewport();
    await expect(page.getByTestId('verse-30-tools')).toHaveAttribute('aria-selected', 'true');
    await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
    // The reader kept its translation.
    expect(await stored(page, 'reader.position')).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
  });

  test('an item saved in the reader shows in Study straight away', async ({ page }) => {
    await page.goto('/bible');
    await page.getByTestId('tab-study').click();
    await expect(page.getByTestId(/^study-entry-[a-z]+:[\d:-]+$/)).toHaveCount(3);
    await page.getByTestId('tab-bible').click();
    await page.getByText('Genesis 1:2 WEB').click();
    await page.getByTestId('sheet-bookmark').click();
    await page.getByTestId('sheet-close').click();
    await page.getByTestId('tab-study').click();
    await expect(page.getByTestId('study-entry-bookmark:1:1:2-2')).toBeVisible();
  });
});

test.describe('Study: progress', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('reading a chapter to the end for a minute marks it explored, in Study and in the picker', async ({ page }) => {
    await page.clock.install({ time: new Date(2026, 10, 4, 9, 0) });
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    // Scroll to the end, then read for a minute (the reader's heartbeat keeps the clock going).
    for (let i = 0; i < 12; i++) {
      await page.mouse.wheel(0, 600);
      await page.clock.fastForward(5000);
    }
    await page.getByTestId('tab-study').click();
    await page.getByTestId('study-tab-progress').click();
    await expect(page.getByTestId('study-explored-count')).toHaveAttribute('aria-label', '1 of 1,189 chapters explored');
    await expect(page.getByTestId('study-map-43')).toHaveAttribute('aria-label', 'John: 1 of 21 chapters read');
    await expect(page.getByText('1 of 10 min')).toBeVisible();
    await page.getByTestId('tab-bible').click();
    await page.getByTestId('reader-book-button').click();
    await expect(page.getByTestId('picker-chapter-3-read')).toBeVisible();
  });

  test('time spent away from the reader is not counted', async ({ page }) => {
    await page.clock.install({ time: new Date(2026, 10, 4, 9, 0) });
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    await page.getByTestId('tab-study').click();
    await page.clock.fastForward(10 * 60_000);
    const progress = await stored<{ activeMs: Record<string, number> }>(page, 'reading.progress');
    expect(progress?.activeMs['2026-11-04'] ?? 0).toBeLessThan(20_000);
  });
});

test.describe('Study in Chinese', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'light' });

  test('Saved and Progress in Chinese, with the CUV book abbreviations', async ({ page }) => {
    await seed(page, 'study.items', ITEMS, 2);
    await page.goto('/study');
    await expect(page.getByText('收藏').first()).toBeVisible();
    await expect(page.getByTestId('study-entry-highlight:43:3:16-17')).toContainText('约翰福音 3:16–17');
    await page.getByTestId('study-tab-progress').click();
    await expect(page.getByTestId('study-map-43')).toHaveText('约');
    await expect(page.getByText('已探索章节')).toBeVisible();
  });
});

for (const [locale, label] of [
  ['en-US', 'English'],
  ['zh-CN', 'Chinese'],
] as const) {
  test.describe(`Study layout at 150% display scale (${label})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

    test('nothing runs off the side of a phone screen, on Saved or Progress', async ({ page }) => {
      await seed(page, 'study.items', ITEMS, 2);
      await page.goto('/study');
      await expect(page.getByTestId('study-kind-all')).toBeVisible();
      const overflow = () => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
      expect(await overflow()).toBeLessThanOrEqual(0);
      for (const id of ['study-kind-all', 'study-kind-bookmark', 'study-colour-green', 'study-book-filter']) {
        const box = (await page.getByTestId(id).boundingBox())!;
        expect(box.x + box.width).toBeLessThanOrEqual(375);
        expect(box.height).toBeGreaterThanOrEqual(44);
      }
      await page.getByTestId('study-tab-progress').click();
      await expect(page.getByTestId('study-map-66')).toBeVisible();
      expect(await overflow()).toBeLessThanOrEqual(0);
      const last = (await page.getByTestId('study-map-66').boundingBox())!;
      expect(last.x + last.width).toBeLessThanOrEqual(375);
    });
  });
}
