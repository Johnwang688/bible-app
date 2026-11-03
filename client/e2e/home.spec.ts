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
    // In the reader: Home, still mounted behind it, shows John 3:16 too (the verse of the day on 4 November).
    await expect(page.getByTestId('screen-bible').getByText(/For God so loved the world/)).toBeVisible();
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
    // In the reader: Home, still mounted behind it, shows John 3:16 too (the verse of the day on 4 November).
    await expect(page.getByTestId('screen-bible').getByText(/For God so loved the world/)).toBeVisible();
    expect(await stored(page, 'reader.position')).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
  });

  test('the goal card opens the daily-goal sheet; a new goal is saved and shown', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/');
    await page.getByTestId('home-goal').click();
    await expect(page.getByTestId('goal-sheet')).toBeVisible();
    await page.getByTestId('goal-plus').click();
    await expect(page.getByTestId('goal-done')).toHaveCount(0);
    await page.getByTestId('goal-sheet-close').click();
    await expect(page.getByTestId('goal-sheet')).toHaveCount(0);
    await expect(page.getByTestId('home-goal')).toHaveAttribute('aria-label', 'Today’s goal, 0 of 15 minutes, edit');
    expect((await stored<{ goalMinutes: number }>(page, 'reading.progress'))?.goalMinutes).toBe(15);
    await page.reload();
    await expect(page.getByTestId('home-goal')).toHaveAttribute('aria-label', 'Today’s goal, 0 of 15 minutes, edit');
  });

  test('the goal value is a spin button the keyboard can change', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/');
    await page.getByTestId('home-goal').click();
    const spin = page.getByRole('spinbutton', { name: 'Daily goal' });
    await expect(spin).toHaveAttribute('aria-valuenow', '10');
    await expect(spin).toHaveAttribute('aria-valuemin', '5');
    await expect(spin).toHaveAttribute('aria-valuemax', '120');
    await expect(spin).toHaveAttribute('aria-valuetext', '10 min');
    await expect(spin).toHaveAttribute('aria-live', 'polite');
    await spin.focus();
    await page.keyboard.press('ArrowUp');
    await expect(spin).toHaveAttribute('aria-valuenow', '15');
    await page.keyboard.press('ArrowDown');
    await page.keyboard.press('ArrowDown');
    await expect(spin).toHaveAttribute('aria-valuenow', '5');
    await page.keyboard.press('End');
    await expect(spin).toHaveAttribute('aria-valuenow', '120');
    await expect(page.getByTestId('goal-plus')).toBeDisabled();
    await page.keyboard.press('Home');
    await expect(spin).toHaveAttribute('aria-valuenow', '5');
    expect((await stored<{ goalMinutes: number }>(page, 'reading.progress'))?.goalMinutes).toBe(5);
  });

  test('Escape and a tap on the scrim close the goal sheet', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/');
    await page.getByTestId('home-goal').click();
    await expect(page.getByTestId('goal-sheet')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('goal-sheet')).toHaveCount(0);
    await page.getByTestId('home-goal').click();
    await expect(page.getByTestId('goal-sheet')).toBeVisible();
    await page.mouse.click(195, 40);
    await expect(page.getByTestId('goal-sheet')).toHaveCount(0);
  });

  test('the cards are labelled sections; the continue button is named', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/');
    await expect(page.getByRole('region', { name: 'Verse of the day' })).toBeVisible();
    await expect(page.getByRole('region', { name: 'Surprise me' })).toBeVisible();
    await expect(page.getByRole('button', { name: 'Continue reading John 3' })).toBeVisible();
    await expect(page.getByRole('progressbar', { name: 'Today’s goal' })).toHaveAttribute('aria-valuenow', '0');
  });

  test('the verse of the day can’t load: the message, then Try again loads it', async ({ page }) => {
    let failing = true;
    await page.route('**/api/v1/chapters/John/3**', (route) => (failing ? route.fulfill({ status: 404, json: { detail: 'x' } }) : route.fallback()));
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/');
    await expect(page.getByTestId('home-votd-error')).toHaveText('Couldn’t load today’s verse.');
    await expect(page.getByTestId('home-votd-share')).toHaveCount(0);
    failing = false;
    await page.getByTestId('home-votd-retry').click();
    await expect(page.getByTestId('home-votd-text')).toContainText('For God so loved the world');
  });
});

test.describe('Home in Chinese', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'light' });

  test('a new Chinese reader: Chinese greeting, Start reading in CUV, the verse in Chinese', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('home-greeting')).toHaveText('早上好');
    await expect(page.getByTestId('home-continue-ref')).toHaveText('约翰福音 1 · 和合本');
    await expect(page.getByText('开始阅读')).toBeVisible();
    await expect(page.getByTestId('home-streak')).toContainText('开始连续阅读');
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

    test('nothing runs off the side of a phone screen; the controls are at least 44 pt', async ({ page }) => {
      await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: locale === 'en-US' ? 'WEB' : 'CUV-SIMP' });
      await page.goto('/');
      await expect(page.getByTestId('home-votd-text')).toBeVisible();
      const overflow = () => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
      expect(await overflow()).toBeLessThanOrEqual(0);
      // 44 pt, less a hundredth: at 1.5x a box measured while the sheet slides in can come out at 43.9999.
      for (const id of ['home-streak', 'home-goal', 'home-continue', 'home-votd-share', 'home-surprise-go']) {
        const box = (await page.getByTestId(id).boundingBox())!;
        expect(box.x + box.width).toBeLessThanOrEqual(375);
        if (id !== 'home-streak') expect(box.height).toBeGreaterThanOrEqual(43.99);
      }
      await page.getByTestId('home-goal').click();
      await expect(page.getByTestId('goal-sheet')).toBeVisible();
      expect(await overflow()).toBeLessThanOrEqual(0);
      for (const id of ['goal-minus', 'goal-plus', 'goal-choice-60', 'goal-sheet-close']) {
        const box = (await page.getByTestId(id).boundingBox())!;
        expect(box.x + box.width).toBeLessThanOrEqual(375);
        expect(box.height).toBeGreaterThanOrEqual(43.99);
      }
    });
  });
}
