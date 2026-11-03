// GAPS 5 polish (orchestrator 11-03): another tab's writes reach a tab left open (INT F2), and Memory Week's done
// label carries the text halo on the aurora.
import { expect, test } from '@playwright/test';

import { mockApi, seed } from './helpers';

const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;

test.describe('two tabs (INT F2)', () => {
  // Both tabs start from an empty device: the intro shows in each.
  test.use({ storageState: { cookies: [], origins: [] }, locale: 'en-US' });

  test('finishing the intro in one tab closes the stale intro in the other', async ({ context }) => {
    const a = await context.newPage();
    const b = await context.newPage();
    for (const page of [a, b]) {
      await mockApi(page);
      await page.goto('/');
      await expect(page.getByTestId('first-run-welcome')).toBeVisible();
    }
    // Tab A finishes the intro (as its last step stores it); the browser tells tab B.
    await a.evaluate((k) => localStorage.setItem(k, JSON.stringify({ v: 1, data: { done: true, ageRange: '25-34' } })), storageKey('onboarding'));
    await expect(b.getByTestId('screen-home')).toBeVisible();
    await expect(b.getByTestId('first-run-welcome')).toHaveCount(0);
  });

  test('a goal changed in one tab shows on the other tab’s Home without a reload', async ({ context }) => {
    const done = { v: 1, data: { done: true, ageRange: null } };
    const a = await context.newPage();
    const b = await context.newPage();
    for (const page of [a, b]) {
      await mockApi(page);
      await page.addInitScript(([k, v]) => localStorage.setItem(k, v), [storageKey('onboarding'), JSON.stringify(done)] as const);
      await page.goto('/');
      await expect(page.getByTestId('home-goal')).toBeVisible();
    }
    await expect(b.getByTestId('home-goal')).toHaveAttribute('aria-label', /of 10 minutes/);
    await a.getByTestId('home-goal').click();
    await a.getByRole('button', { name: '30 minutes a day' }).click();
    await expect(b.getByTestId('home-goal')).toHaveAttribute('aria-label', /of 30 minutes/);
  });
});

test.describe('Memory Week on the aurora', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('the done label has the text halo on a glass look, and none on a pastel one', async ({ page }) => {
    await mockApi(page);
    await page.clock.install({ time: new Date(2026, 10, 4, 9, 0) });
    const at = '2026-11-04T08:00:00.000Z';
    await seed(page, 'memory.lesson', {
      date: '2026-11-04',
      steps: [{ verseId: '2-corinthians-5-17', stage: 'chunk-order', completedAt: at }],
      completedAt: at,
    });
    await page.goto('/study/memory/week');
    const label = page.getByTestId('memory-week-done').getByText('Done today');
    await expect(label).toBeVisible();
    // Silver (the default) is a glass look: the halo is the base colour, blurred, with no offset.
    expect(await label.evaluate((el) => getComputedStyle(el).textShadow)).toMatch(/^rgb.*\b0px 0px \d+px$/);

    await seed(page, 'appearance', { preset: 'strawberry-milk', mode: 'light' });
    await page.evaluate(() => sessionStorage.clear());
    await page.reload();
    await expect(label).toBeVisible();
    expect(await label.evaluate((el) => getComputedStyle(el).textShadow)).toBe('none');
  });
});
