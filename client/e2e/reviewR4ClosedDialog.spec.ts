// Sol R-4 goal review round 2, F1 (orchestrator-owned): a closed dialog left in the page is not a modal above the
// goal sheet, so the next Escape closes the sheet.
import { expect, test } from '@playwright/test';
import { mockApi } from './helpers';

test.use({ locale: 'en-US' });

test('Escape closes the sheet after the upper dialog closes', async ({ page }) => {
  await mockApi(page);
  await page.clock.install({ time: new Date(2026, 10, 4, 9) });
  await page.goto('/');
  await page.getByTestId('home-goal').click();
  await expect(page.getByTestId('goal-sheet')).toBeVisible();
  await page.clock.runFor(1000);

  await page.evaluate(() => {
    const dialog = document.createElement('dialog');
    dialog.id = 'upper';
    dialog.setAttribute('aria-modal', 'true');
    dialog.innerHTML = '<button autofocus>Upper</button>';
    document.body.append(dialog);
    dialog.showModal();
  });

  await page.keyboard.press('Escape');
  await expect(page.locator('#upper')).not.toBeVisible();
  await expect(page.getByTestId('goal-sheet')).toBeVisible();

  await page.keyboard.press('Escape');
  await expect(page.getByTestId('goal-sheet')).not.toBeVisible();
});
