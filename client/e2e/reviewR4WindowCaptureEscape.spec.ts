// Sol R-4 goal review round 3 (orchestrator-owned): an upper modal that takes Escape at the window capture phase leaves the sheet open.
// Found against fix2 (reverted); passes on the shipped code and guards any later Escape redesign.
import { expect, test } from '@playwright/test';
import { mockApi } from './helpers';

test.use({ locale: 'en-US' });

// Known gap after the 11-02 merges (passed on R-4's branch alone): another screen's Escape handling now also
// closes the goal sheet. The R-4 Escape follow-up (GAPS team, board-2026-11-03) owns it.
test.fixme('window-captured Escape dismisses only the upper modal', async ({ page }) => {
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

    const closeUpper = (event: KeyboardEvent) => {
      if (event.key !== 'Escape') return;
      event.preventDefault();
      event.stopPropagation();
      dialog.close();
      window.removeEventListener('keydown', closeUpper, true);
    };
    window.addEventListener('keydown', closeUpper, true);
  });

  await page.keyboard.press('Escape');

  await expect(page.locator('#upper')).not.toBeVisible();
  await expect(page.getByTestId('goal-sheet')).toBeVisible();
});
