// KNOWN GAP (R-4, Sol goal review rounds 2-3): Escape with a second modal above the goal sheet. No screen opens one
// today; the 5a loop stopped after implementer-hard (see the R-4 notes in docs/plans/app-rebuild.md). fixme until
// John decides.
// Sol R-4 goal review round 2, F2 (orchestrator-owned): an upper modal's Escape that never reaches the goal sheet's
// Modal leaves no suppression behind; a later Escape keyup closes the sheet.
import { expect, test } from '@playwright/test';
import { mockApi } from './helpers';

test.use({ locale: 'en-US' });

test.fixme('a consumed foreign keyup does not poison a later keyup', async ({ page }) => {
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

    dialog.addEventListener('keydown', event => {
      if (event.key === 'Escape') event.preventDefault();
    });
    dialog.addEventListener('keyup', event => {
      if (event.key === 'Escape') {
        event.stopPropagation();
        dialog.close();
        dialog.remove();
      }
    });
  });

  await page.keyboard.press('Escape');
  await expect(page.locator('#upper')).toHaveCount(0);
  await expect(page.getByTestId('goal-sheet')).toBeVisible();

  // Models a release delivered after focus returns to the document.
  await page.keyboard.up('Escape');
  await expect(page.getByTestId('goal-sheet')).not.toBeVisible();
});
