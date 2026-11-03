// Web tests for the privacy policy page (B-1): /privacy opens on its own, in either language, on a phone-width screen.
import { expect, test } from '@playwright/test';

test.describe('privacy page, English phone', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('opens directly, and "Open the app" goes to Home', async ({ page }) => {
    await page.goto('/privacy');
    await expect(page.getByRole('heading', { name: 'Privacy policy' })).toBeVisible();
    await expect(page).toHaveTitle('Privacy policy');
    const open = page.getByRole('button', { name: 'Open the app' });
    await expect(open).toBeVisible();
    await open.click();
    await expect(page.getByTestId('screen-home')).toBeVisible();
  });

  test('opens in Chinese when the URL says so', async ({ page }) => {
    await page.goto('/privacy?lang=zh-Hans');
    await expect(page.getByRole('heading', { name: '隐私政策' })).toBeVisible();
    await expect(page.getByTestId('privacy-language')).toHaveText('English');
  });

  test('the language button switches this page only', async ({ page }) => {
    await page.goto('/privacy');
    await expect(page.getByRole('heading', { name: 'Privacy policy' })).toBeVisible();
    await page.getByTestId('privacy-language').click();
    await expect(page.getByRole('heading', { name: '隐私政策' })).toBeVisible();
    await expect(page.getByTestId('privacy-language')).toHaveText('English');
    await page.getByTestId('privacy-language').click();
    await expect(page.getByRole('heading', { name: 'Privacy policy' })).toBeVisible();
    // The app's own language was not changed.
    await page.getByRole('button', { name: 'Open the app' }).click();
    await expect(page.getByRole('heading', { name: 'Home' })).toBeVisible();
  });

  test('has the "Email us" link', async ({ page }) => {
    await page.goto('/privacy');
    await expect(page.getByRole('link', { name: /Email us/ })).toBeVisible();
    await expect(page.getByTestId('privacy-email-copy')).toBeVisible();
  });

  test('does not scroll sideways at 390 px', async ({ page }) => {
    await page.setViewportSize({ width: 390, height: 844 });
    await page.goto('/privacy');
    await expect(page.getByRole('heading', { name: 'Privacy policy' })).toBeVisible();
    const width = await page.evaluate(() => document.documentElement.scrollWidth);
    expect(width).toBeLessThanOrEqual(390);
    await page.goto('/privacy?lang=zh-Hans');
    await expect(page.getByRole('heading', { name: '隐私政策' })).toBeVisible();
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(390);
  });
});
