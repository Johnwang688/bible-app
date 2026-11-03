// Sol R-4 goal review round 2, F2 (orchestrator-owned): an upper modal's Escape that never reaches the goal sheet
// leaves nothing stale behind; the next Escape closes the sheet.
// Was a known gap (fixme). Rewritten for the shared Escape stack (GAPS, board 11-03), with the same intent: Escape
// acts on the keydown only, so the original last step (a lone keyup closing the sheet) became the opposite of
// `reviewR4ReopenedEscape` (an old release must not close a sheet). A lone release now does nothing, and the next
// press closes the sheet.
import { expect, test } from '@playwright/test';
import { mockApi } from './helpers';

test.use({ locale: 'en-US' });

test('a consumed foreign Escape leaves nothing stale for the next one', async ({ page }) => {
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

  // A release delivered after focus returns to the document is no press of its own.
  await page.keyboard.up('Escape');
  await expect(page.getByTestId('goal-sheet')).toBeVisible();

  await page.keyboard.press('Escape');
  await expect(page.getByTestId('goal-sheet')).not.toBeVisible();
});
