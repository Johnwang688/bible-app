// The account card and the sign-in sheet on /account-preview (R-6b): English and Chinese, a 375 px phone at
// 150 % display scale, nothing clipped, 44 px targets, and the autofill attributes on the web inputs.
// Firebase is never reached: the signed-out card and opening the sheets need no network.
import { expect, test, type Page } from '@playwright/test';

import { mockApi } from './helpers';

const WORDS = {
  'en-US': { title: 'Sign in to sync', signIn: 'Sign in', email: 'Email', password: 'Password', create: 'Create an account', sheetTitle: 'Sign in' },
  'zh-CN': { title: '登录以同步', signIn: '登录', email: '电子邮箱', password: '密码', create: '创建账户', sheetTitle: '登录' },
} as const;

const overflow = (page: Page) => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);

/** Every visible button and input inside `root` is at least 44 px tall and wide, and inside the viewport width. */
async function expectTargets(page: Page, ids: string[], width = 375) {
  for (const id of ids) {
    const box = await page.getByTestId(id).boundingBox();
    expect(box, id).not.toBeNull();
    expect(box!.height, `${id} height`).toBeGreaterThanOrEqual(44);
    expect(box!.width, `${id} width`).toBeGreaterThanOrEqual(44);
    expect(box!.x, `${id} left`).toBeGreaterThanOrEqual(0);
    expect(box!.x + box!.width, `${id} right`).toBeLessThanOrEqual(width + 0.5);
  }
}

for (const [locale, label] of [
  ['en-US', 'English'],
  ['zh-CN', 'Chinese'],
] as const) {
  const w = WORDS[locale];

  test.describe(`account card and sign-in sheet at 150% display scale (${label})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

    test('the signed-out card fits the phone, with a 44 px sign-in button', async ({ page }) => {
      await mockApi(page);
      await page.goto('/account-preview');
      await expect(page.getByTestId('account-card')).toBeVisible();
      await expect(page.getByText(w.title)).toBeVisible();
      await expect(page.getByTestId('account-sign-in')).toHaveAttribute('aria-label', w.signIn);
      expect(await overflow(page)).toBeLessThanOrEqual(0);
      await expectTargets(page, ['account-sign-in']);
      const card = (await page.getByTestId('account-card').boundingBox())!;
      expect(card.x).toBeGreaterThanOrEqual(0);
      expect(card.x + card.width).toBeLessThanOrEqual(375.5);
    });

    test('the sign-in sheet: nothing clipped, 44 px targets, autofill attributes', async ({ page }) => {
      await mockApi(page);
      await page.goto('/account-preview');
      await page.getByTestId('account-sign-in').click();
      await expect(page.getByTestId('account-sheet')).toBeVisible();
      await expect(page.getByTestId('auth-email')).toBeVisible();
      expect(await overflow(page)).toBeLessThanOrEqual(0);

      const email = page.getByTestId('auth-email');
      await expect(email).toHaveAttribute('autocomplete', 'username');
      await expect(email).toHaveAttribute('type', 'email');
      await expect(email).toHaveAttribute('autocapitalize', 'none');
      await expect(email).toHaveAttribute('aria-label', w.email);
      const password = page.getByTestId('auth-password');
      await expect(password).toHaveAttribute('autocomplete', 'current-password');
      await expect(password).toHaveAttribute('type', 'password');
      await expect(password).toHaveAttribute('aria-label', w.password);

      await expectTargets(page, ['auth-close', 'auth-email', 'auth-password', 'auth-password-toggle', 'auth-submit', 'auth-forgot', 'auth-to-signup']);
      // The submit button is reachable: scroll it into view inside the sheet and it is on screen.
      await page.getByTestId('auth-submit').scrollIntoViewIfNeeded();
      await expect(page.getByTestId('auth-submit')).toBeInViewport();

      // The show/hide button flips the field's type.
      await page.getByTestId('auth-password-toggle').click();
      await expect(password).not.toHaveAttribute('type', 'password');
      await page.getByTestId('auth-password-toggle').click();
      await expect(password).toHaveAttribute('type', 'password');
    });

    test('the sign-up view has new-password autofill, and the sheet closes', async ({ page }) => {
      await mockApi(page);
      await page.goto('/account-preview');
      await page.getByTestId('account-sign-in').click();
      await page.getByTestId('auth-to-signup').click();
      await expect(page.getByTestId('auth-back')).toBeVisible();
      await expect(page.getByTestId('auth-email')).toHaveAttribute('autocomplete', 'email');
      await expect(page.getByTestId('auth-password')).toHaveAttribute('autocomplete', 'new-password');
      expect(await overflow(page)).toBeLessThanOrEqual(0);
      await expectTargets(page, ['auth-back', 'auth-close', 'auth-email', 'auth-password', 'auth-submit', 'auth-privacy']);

      // A short password is refused before any request (no network is available to answer one).
      await page.getByTestId('auth-email').fill('someone@example.com');
      await page.getByTestId('auth-password').fill('short');
      await page.getByTestId('auth-submit').click();
      await expect(page.getByTestId('auth-error')).toBeVisible();

      await page.getByTestId('auth-back').click();
      await expect(page.getByTestId('auth-to-signup')).toBeVisible();
      await page.getByTestId('auth-close').click();
      await expect(page.getByTestId('account-sheet')).toHaveCount(0);
      await expect(page.getByTestId('account-sign-in')).toBeVisible();
    });
  });
}
