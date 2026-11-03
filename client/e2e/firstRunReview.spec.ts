// Acceptance (orchestrator-owned, R-7a UI, Sol review r1 F1): a double click on Continue must not skip the age step.
import { expect, test } from '@playwright/test';

test.use({
  storageState: { cookies: [], origins: [] },
  locale: 'en-US',
  colorScheme: 'light',
});

test('double Continue stops at the age step', async ({ page }) => {
  await page.goto('/study');
  await page.getByRole('button', { name: 'Get started', exact: true }).click();
  await page.getByRole('button', { name: 'Continue', exact: true }).dblclick({ delay: 80 });

  await expect(page.getByTestId('first-run-age')).toBeVisible();
  await expect(page.getByTestId('screen-study')).toHaveCount(0);
});
