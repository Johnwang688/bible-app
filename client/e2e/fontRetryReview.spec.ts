// Sol review of the R-7a follow-up, F1 (orchestrator-owned; do not edit): a web font that failed to download is
// downloaded again when its look is chosen again.
import { expect, test } from '@playwright/test';

test.use({
  locale: 'en-US',
  colorScheme: 'light',
  storageState: { cookies: [], origins: [] },
});

test('reselecting a look retries its failed font', async ({ page }) => {
  let attempts = 0;
  await page.route(/PlusJakartaSans_700Bold.*\.ttf/, route =>
    ++attempts === 1 ? route.abort('failed') : route.continue(),
  );
  const status = () => page.evaluate(() =>
    Array.from(document.fonts)
      .find(f => f.family === 'PlusJakartaSans_700Bold')?.status,
  );

  await page.goto('/');
  await expect(page.getByTestId('first-run-welcome')).toBeVisible();
  await expect.poll(status).toBe('error');
  await page.getByRole('button', { name: 'Get started' }).click();
  await page.getByRole('radio', {
    name: 'Strawberry milk', exact: true,
  }).click();
  await page.getByRole('radio', { name: 'Silver', exact: true }).click();

  await expect.poll(status, { timeout: 5000 }).toBe('loaded');
});
