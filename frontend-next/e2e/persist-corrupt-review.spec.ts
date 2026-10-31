// Regression test from the verifier review (persistence fix). Owned by the orchestrator: do not edit.
import { expect, test, verse } from './fixtures';

test('null highlights do not crash the reader', async ({ page }) => {
  await page.addInitScript(() => {
    localStorage.setItem('bible-app-highlights', 'null');
  });

  await page.goto('/app?book=John&chapter=3');
  await expect(verse(page, 16)).toBeVisible();
});
