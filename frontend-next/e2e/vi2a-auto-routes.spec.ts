// Regression test from Sol review round 1 of VI-2a (F1): Auto follows the device on every route. Owned by the orchestrator: do not edit.
import { test, expect } from './fixtures';

for (const route of ['/signin', '/app/mastery']) {
  test(`Auto follows the device on ${route}`, async ({ page }) => {
    await page.addInitScript(() => localStorage.setItem('theme', 'system'));
    await page.emulateMedia({ colorScheme: 'dark' });
    await page.goto(route);
    await expect(page.locator('html')).toHaveAttribute('data-theme', 'dark');

    await page.emulateMedia({ colorScheme: 'light' });
    await expect(page.locator('html')).toHaveAttribute('data-theme', 'default');
  });
}
