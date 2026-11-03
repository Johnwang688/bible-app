// Sol R-4 goal review round 3 (orchestrator-owned): releasing the Escape that closed one sheet leaves the next sheet open.
// Found against fix2 (reverted); passes on the shipped code and guards any later Escape redesign.
import { expect, test } from '@playwright/test';
import { mockApi } from './helpers';

test.use({ locale: 'en-US' });

test('an old Escape release preserves a newly opened sheet', async ({ page }) => {
  await mockApi(page);
  await page.clock.install({ time: new Date(2026, 10, 4, 9) });
  await page.goto('/');

  await page.getByTestId('home-goal').click();
  await expect(page.getByTestId('goal-sheet')).toBeVisible();

  await page.keyboard.down('Escape');
  await expect(page.getByTestId('goal-sheet')).toHaveCount(0);

  await page.getByTestId('home-goal').click();
  await expect(page.getByTestId('goal-sheet')).toBeVisible();

  await page.keyboard.up('Escape');
  await expect(page.getByTestId('goal-sheet')).toBeVisible();
});
