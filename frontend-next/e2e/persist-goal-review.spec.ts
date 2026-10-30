// Regression test from the verifier review (persistence fix). Owned by the orchestrator: do not edit.
import { expect, openReaderAt, test, verse } from './fixtures';

test('daily goal survives mount and reload', async ({ page }) => {
  await page.addInitScript(() => {
    if (!sessionStorage.getItem('goal-seeded')) {
      localStorage.setItem('bible-app-daily-goal-minutes', '30');
      sessionStorage.setItem('goal-seeded', '1');
    }
  });

  const goal = () => page.evaluate(() =>
    localStorage.getItem('bible-app-daily-goal-minutes'));

  await openReaderAt(page, 'John', 3);
  expect(await goal()).toBe('30');

  await page.reload();
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(verse(page, 16)).toBeVisible();
  expect(await goal()).toBe('30');
});
