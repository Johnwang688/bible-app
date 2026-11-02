// Sol R-4 goal review round 1, F3 (orchestrator-owned): Escape belongs to the top modal; GoalSheet under a second
// modal stays open.
import { expect, test } from '@playwright/test';

import { mockApi, seed } from './helpers';

test.use({ locale: 'en-US' });

test('Escape dismisses only the top modal', async ({ page }) => {
  await mockApi(page);
  await page.clock.install({
    time: new Date(2026, 10, 4, 9),
  });
  await seed(page, 'reader.position', {
    bookNumber: 43,
    chapter: 3,
    translation: 'WEB',
  });

  await page.goto('/');
  await page.getByTestId('home-goal').click();
  await expect(page.getByTestId('goal-sheet')).toBeVisible();

  await page.evaluate(() => {
    const dialog = document.createElement('dialog');
    dialog.id = 'review-second-dialog';
    dialog.setAttribute('aria-modal', 'true');
    dialog.innerHTML = '<button autofocus>Second modal</button>';
    document.body.append(dialog);
    dialog.showModal();
  });

  await page.keyboard.press('Escape');

  await expect(page.locator('#review-second-dialog')).not.toBeVisible();
  await expect(page.getByTestId('goal-sheet')).toBeVisible();
});
