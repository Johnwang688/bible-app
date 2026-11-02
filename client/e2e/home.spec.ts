// Web e2e for R-4: the Home tab. Orchestrator-owned.
import { expect, test } from '@playwright/test';

import { mockApi, seed, stored } from './helpers';

const COUNTS = [50, 40, 27, 36, 34, 24, 21, 4, 31, 24, 22, 25, 29, 36, 10, 13, 10, 42, 150, 31, 12, 8, 66, 52, 5, 48, 12, 14, 3, 9, 1, 4, 7, 3, 3, 3, 2, 14, 4, 28, 16, 24, 21, 28, 16, 16, 13, 6, 6, 4, 4, 5, 3, 6, 4, 3, 1, 13, 5, 5, 3, 5, 1, 1, 1, 22];
const progress = (over: Record<string, unknown> = {}) => ({
  goalMinutes: 10,
  activeMs: {},
  goalMetDays: [],
  chaptersRead: {},
  evidence: { day: '', chapters: {} },
  ...over,
});
const allBut = (keep: string) => {
  const out: Record<string, string> = {};
  COUNTS.forEach((n, i) => {
    for (let c = 1; c <= n; c++) if (`${i + 1}:${c}` !== keep) out[`${i + 1}:${c}`] = '2026-10-01T00:00:00.000Z';
  });
  return out;
};

test.beforeEach(async ({ page }) => {
  await mockApi(page);
  // 4 November 2026: the verse of the day is John 3:16, which the mock serves from the WEB fixture.
  await page.clock.install({ time: new Date(2026, 10, 4, 9, 0) });
});

test.describe('Home (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('greets, shows the verse of the day, and continues reading where the reader left off', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/');
    await expect(page.getByTestId('home-greeting')).toHaveText('Good morning');
    await expect(page.getByTestId('home-votd-text')).toContainText('For God so loved the world');
    await expect(page.getByTestId('home-votd-ref')).toHaveText('John 3:16');
    await expect(page.getByTestId('home-continue-ref')).toHaveText('John 3 · WEB');
    await page.getByTestId('home-continue').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
  });

  test('the verse of the day opens in context: the chapter, the verse selected and in view', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 1, chapter: 1, translation: 'WEB' });
    await page.goto('/');
    await expect(page.getByTestId('home-votd-text')).toContainText('For God so loved the world');
    await page.getByTestId('home-votd-open').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('verse-16')).toBeInViewport();
    await expect(page.getByTestId('verse-16-tools')).toHaveAttribute('aria-selected', 'true');
    expect(await stored(page, 'reader.position')).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
  });

  test('Surprise me opens an unread chapter in the reader’s translation', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 1, chapter: 1, translation: 'WEB' });
    await seed(page, 'reading.progress', progress({ chaptersRead: allBut('43:3') }));
    // Branch draw 0.5 < 0.9 → the unread branch; the only unread chapter is John 3.
    await page.addInitScript(() => {
      Math.random = () => 0.5;
    });
    await page.goto('/');
    await expect(page.getByTestId('home-explored')).toHaveText('1,188 of 1,189 explored');
    await page.getByTestId('home-surprise-go').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    expect(await stored(page, 'reader.position')).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
  });

  // Awaits John's approval of design/proposed/r4-goal-sheet.html and r4-home-empty.html (card R4-goal).
  test.fixme('the goal card opens the daily-goal sheet; a new goal is saved and shown', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/');
    await page.getByTestId('home-goal').click();
    await expect(page.getByTestId('goal-sheet')).toBeVisible();
    await page.getByTestId('goal-plus').click();
    await page.getByTestId('goal-done').click();
    await expect(page.getByTestId('goal-sheet')).toHaveCount(0);
    await expect(page.getByTestId('home-goal')).toHaveAttribute('aria-label', 'Today’s goal: 0 of 15 min');
    expect((await stored<{ goalMinutes: number }>(page, 'reading.progress'))?.goalMinutes).toBe(15);
    await page.reload();
    await expect(page.getByTestId('home-goal')).toHaveAttribute('aria-label', 'Today’s goal: 0 of 15 min');
  });
});

test.describe('Home in Chinese', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'light' });

  // Awaits John's approval of design/proposed/r4-goal-sheet.html and r4-home-empty.html (card R4-goal).
  test.fixme('a new Chinese reader: Chinese greeting, Start reading in CUV, the verse in Chinese', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('home-greeting')).toHaveText('早上好');
    await expect(page.getByTestId('home-continue-ref')).toHaveText('创世记 1 · 和合本');
    await expect(page.getByText('开始阅读')).toBeVisible();
    await expect(page.getByTestId('home-votd-text')).toContainText('神爱世人');
    await expect(page.getByTestId('home-votd-ref')).toHaveText('约翰福音 3:16');
  });
});

for (const [locale, label] of [
  ['en-US', 'English'],
  ['zh-CN', 'Chinese'],
] as const) {
  test.describe(`Home layout at 150% display scale (${label})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

    test('Home itself: nothing runs off the side; the controls are at least 44 pt', async ({ page }) => {
      await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: locale === 'en-US' ? 'WEB' : 'CUV-SIMP' });
      await page.goto('/');
      await expect(page.getByTestId('home-votd-text')).toBeVisible();
      expect(await page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth)).toBeLessThanOrEqual(0);
      for (const id of ['home-streak', 'home-goal', 'home-continue', 'home-votd-share', 'home-surprise-go']) {
        const box = (await page.getByTestId(id).boundingBox())!;
        expect(box.x + box.width).toBeLessThanOrEqual(375);
        if (id !== 'home-streak') expect(box.height).toBeGreaterThanOrEqual(44);
      }
    });

    // Awaits John's approval of design/proposed/r4-goal-sheet.html and r4-home-empty.html (card R4-goal).
    test.fixme('nothing runs off the side of a phone screen; the controls are at least 44 pt', async ({ page }) => {
      await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: locale === 'en-US' ? 'WEB' : 'CUV-SIMP' });
      await page.goto('/');
      await expect(page.getByTestId('home-votd-text')).toBeVisible();
      const overflow = () => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
      expect(await overflow()).toBeLessThanOrEqual(0);
      for (const id of ['home-streak', 'home-goal', 'home-continue', 'home-votd-share', 'home-surprise-go']) {
        const box = (await page.getByTestId(id).boundingBox())!;
        expect(box.x + box.width).toBeLessThanOrEqual(375);
        if (id !== 'home-streak') expect(box.height).toBeGreaterThanOrEqual(44);
      }
      await page.getByTestId('home-goal').click();
      await expect(page.getByTestId('goal-sheet')).toBeVisible();
      expect(await overflow()).toBeLessThanOrEqual(0);
      for (const id of ['goal-minus', 'goal-plus', 'goal-choice-60', 'goal-done']) {
        const box = (await page.getByTestId(id).boundingBox())!;
        expect(box.x + box.width).toBeLessThanOrEqual(375);
        expect(box.height).toBeGreaterThanOrEqual(44);
      }
    });
  });
}
