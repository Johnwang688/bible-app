// Acceptance (orchestrator-owned, B-1 #29's requirement): /privacy opens directly on a device that has never
// done the intro (the App Store review URL, links from outside the app). The intro still shows everywhere else.
import { existsSync } from 'node:fs';
import { join } from 'node:path';

import { expect, test } from '@playwright/test';

test.use({ storageState: { cookies: [], origins: [] }, locale: 'en-US', colorScheme: 'light' });

test('a direct /privacy load with no first-run state is not covered by the intro', async ({ page }) => {
  await page.goto('/privacy');
  await page.waitForLoadState('networkidle');
  await expect(page.getByTestId('first-run-welcome')).toHaveCount(0);

  // The exemption does not finish the intro: the next page still gets it.
  await page.goto('/study');
  await expect(page.getByTestId('first-run-welcome')).toBeVisible();
});

test('a direct /privacy load with no first-run state shows the policy', async ({ page }) => {
  // The /privacy route is B-1's (#29); this check runs once both PRs are on main.
  test.skip(!existsSync(join(__dirname, '..', 'src', 'app', 'privacy.tsx')), 'the /privacy route lands with B-1 (#29)');
  await page.goto('/privacy');
  await expect(page.getByTestId('screen-privacy')).toBeVisible();
  await expect(page.getByTestId('first-run-welcome')).toHaveCount(0);
});
