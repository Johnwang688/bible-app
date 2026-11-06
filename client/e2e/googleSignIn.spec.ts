// GOOGLE (board 11-03 row 7): with EXPO_PUBLIC_GOOGLE_SIGN_IN off (the default, and the gate's build), nothing
// changes: the sign-in and sign-up sheets show no Google button, and no page, open sheet or signed-out visit loads
// Google's sign-in script (apis.google.com) or its auth frame (PR #40's constraint: Auth has no popup resolver).
import { expect, test, type Page } from '@playwright/test';

import { mockApi } from './helpers';

/** Refuses every Google/Firebase host and records what was asked for. */
async function watchGoogle(page: Page): Promise<string[]> {
  const asked: string[] = [];
  await page.route(/googleapis\.com|google\.com|gstatic\.com|firebaseapp\.com|firebaseio\.com/, (route) => {
    asked.push(route.request().url());
    return route.abort();
  });
  return asked;
}

test.use({ locale: 'en-US' });

test('flag off: no Google button, and Google sign-in script never loads while signed out', async ({ page }) => {
  await mockApi(page);
  const asked = await watchGoogle(page);
  await page.goto('/');
  await page.getByTestId('tab-me').click();
  await expect(page.getByTestId('screen-me')).toBeVisible();
  await page.getByTestId('account-sign-in').click();
  await expect(page.getByTestId('account-sheet')).toBeVisible();
  await expect(page.getByTestId('auth-email')).toBeVisible();
  await expect(page.getByTestId('auth-google')).toHaveCount(0);
  await expect(page.getByText('Continue with Google')).toHaveCount(0);
  await page.getByTestId('auth-to-signup').click();
  await expect(page.getByTestId('auth-google')).toHaveCount(0);
  // Give any lazy loader a moment, then check nothing reached for Google's sign-in script or auth frame.
  await page.waitForTimeout(500);
  expect(asked.filter((u) => /apis\.google\.com|firebaseapp\.com\/__\/auth/.test(u))).toEqual([]);
  const scripts = await page.evaluate(() => [...document.scripts].map((s) => s.src).filter(Boolean));
  expect(scripts.filter((s) => /apis\.google\.com/.test(s))).toEqual([]);
  expect(await page.evaluate(() => typeof (window as { gapi?: unknown }).gapi)).toBe('undefined');
});
