// Acceptance test for SM-1 (Surprise me). Owned by the orchestrator: do not edit.
// The suite seeds a saved WEB position at Genesis 1 (fixtures.ts), so these run in WEB.
import { expect, test, verse } from './fixtures';

const CHAPTERS_READ = 'bible-app-chapters-read';
const PROGRESS = 'bible-app-reading-progress';
const COUNTS = [50, 40, 27, 36, 34, 24, 21, 4, 31, 24, 22, 25, 29, 36, 10, 13, 10, 42, 150, 31, 12, 8, 66, 52, 5, 48, 12, 14, 3, 9, 1, 4, 7, 3, 3, 3, 2, 14, 4, 28, 16, 24, 21, 28, 16, 16, 13, 6, 6, 4, 4, 5, 3, 6, 4, 3, 1, 13, 5, 5, 3, 5, 1, 1, 1, 22];

const storedRead = (page: import('@playwright/test').Page) =>
  page.evaluate((k) => JSON.parse(localStorage.getItem(k) ?? '[]'), CHAPTERS_READ);

test('a new reader sees the button and 0 of 1,189 chapters explored', async ({ page }) => {
  await page.goto('/app');
  const home = page.locator('.home-screen');
  await expect(home.getByRole('button', { name: 'Surprise me' })).toBeVisible();
  await expect(home).toContainText('0 of 1,189 chapters explored');
});

test('Surprise me opens an unread chapter, in the reader\'s translation', async ({ page }) => {
  await page.addInitScript(([key, counts]) => {
    const all: string[] = [];
    (counts as number[]).forEach((n, i) => { for (let c = 1; c <= n; c++) all.push(`${i + 1}:${c}`); });
    localStorage.setItem(key as string, JSON.stringify(all.filter(k => k !== '43:3')));
    // Branch draw 0.5 < 0.9 → unread branch; the only unread chapter is John 3.
    Math.random = () => 0.5;
  }, [CHAPTERS_READ, COUNTS] as const);
  await page.goto('/app');
  const home = page.locator('.home-screen');
  await expect(home).toContainText('1,188 of 1,189 chapters explored');
  await home.getByRole('button', { name: 'Surprise me' }).click();
  await expect(page.locator('.nav-btn-book')).toHaveText('John 3');
  await expect(page.getByRole('button', { name: 'WEB' })).toBeVisible();
  await expect(verse(page, 16)).toContainText('For God so loved the world');
});

test('a chapter credited today is recorded as read, by book number and chapter', async ({ page }) => {
  await page.addInitScript(([key]) => {
    if (sessionStorage.getItem('progress-seeded')) return;
    localStorage.setItem(key, JSON.stringify({
      // The fixtures pin the clock to 2026-03-10.
      streak: 1, goalMetDays: [], todayIso: '2026-03-10',
      todayChapters: ['john::3::web', 'genesis::2::bsb'],
      todayChapterEvidence: {}, todayActiveLearningMs: 0, todaySpokeToAi: false,
    }));
    sessionStorage.setItem('progress-seeded', '1');
  }, [PROGRESS]);
  await page.goto('/app');
  await expect.poll(async () => [...(await storedRead(page))].sort()).toEqual(['1:2', '43:3']);
  await expect(page.locator('.home-screen')).toContainText('2 of 1,189 chapters explored');
  // Kept across a reload, and not duplicated.
  await page.reload();
  await expect(page.locator('.home-screen')).toContainText('2 of 1,189 chapters explored');
  expect((await storedRead(page)).length).toBe(2);
});

test('a corrupt chapters-read value is treated as empty', async ({ page }) => {
  await page.addInitScript(([key]) => { localStorage.setItem(key, '{"not":"a list"'); }, [CHAPTERS_READ]);
  await page.goto('/app');
  await expect(page.locator('.home-screen')).toContainText('0 of 1,189 chapters explored');
});
