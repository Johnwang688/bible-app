// The email-verification states on /verify-preview (11-03): the card while unconfirmed (new, paused, a pending change
// of address), Home's one-line banner, and the Change email sheet, in English and Chinese, on a 375 px phone at 150 %
// display scale: nothing clipped, no sideways scroll, 44 px targets (48 for the banner), the long address wraps, and
// the offline red box over the inert backend. Firebase is never reached: every request there fails as offline.
import { expect, test, type Page } from '@playwright/test';

import { mockApi } from './helpers';

const WORDS = {
  'en-US': {
    line: 'Sync starts after you confirm your email.',
    paused: 'Sync is paused.',
    banner: 'Confirm your email to start syncing',
    bannerPaused: 'Sync is paused. Confirm your email.',
    offline: 'No connection. Try again when you’re online.',
    changeTitle: 'Change email',
    pending: 'Confirm your new email',
  },
  'zh-CN': {
    line: '确认电子邮箱后开始同步。',
    paused: '同步已暂停。',
    banner: '确认电子邮箱后即可开始同步',
    bannerPaused: '同步已暂停，请确认电子邮箱',
    offline: '没有网络连接。请联网后再试。',
    changeTitle: '更改电子邮箱',
    pending: '确认你的新电子邮箱',
  },
} as const;

const overflow = (page: Page) => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);

async function expectTargets(page: Page, ids: string[], min = 43.9, width = 375) {
  for (const id of ids) {
    const box = await page.getByTestId(id).boundingBox();
    expect(box, id).not.toBeNull();
    expect(box!.height, `${id} height`).toBeGreaterThanOrEqual(min);
    expect(box!.width, `${id} width`).toBeGreaterThanOrEqual(43.9);
    expect(box!.x, `${id} left`).toBeGreaterThanOrEqual(0);
    expect(box!.x + box!.width, `${id} right`).toBeLessThanOrEqual(width + 0.5);
  }
}

for (const [locale, label] of [
  ['en-US', 'English'],
  ['zh-CN', 'Chinese'],
] as const) {
  const w = WORDS[locale];

  test.describe(`email verification at 150% display scale (${label})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

    test('a new unconfirmed account: banner, card, targets; I’ve confirmed offline shows the red box', async ({ page }) => {
      await mockApi(page);
      await page.goto('/verify-preview');
      await expect(page.getByTestId('verify-card')).toBeVisible();
      await expect(page.getByText(w.line)).toBeVisible();
      await expect(page.getByTestId('home-verify-banner')).toContainText(w.banner);
      expect(await overflow(page)).toBeLessThanOrEqual(0);
      await expectTargets(page, ['verify-card-done', 'verify-card-resend', 'verify-card-change', 'account-sign-out', 'account-delete']);
      await expectTargets(page, ['home-verify-banner'], 47.9);
      // The card's body names the (long) address and stays inside the card.
      const card = (await page.getByTestId('account-card').boundingBox())!;
      const body = (await page.getByTestId('verify-card-body').boundingBox())!;
      expect(body.x + body.width).toBeLessThanOrEqual(card.x + card.width + 0.5);

      await page.getByTestId('verify-card-done').click();
      await expect(page.getByRole('alert').filter({ hasText: w.offline })).toBeVisible();
      expect(await overflow(page)).toBeLessThanOrEqual(0);
    });

    test('an account made before the change: Sync is paused, Send confirmation email, the paused banner', async ({ page }) => {
      await mockApi(page);
      await page.goto('/verify-preview?state=paused');
      await expect(page.getByText(w.paused, { exact: true })).toBeVisible();
      await expect(page.getByTestId('home-verify-banner')).toContainText(w.bannerPaused);
      await expectTargets(page, ['verify-card-first-send', 'verify-card-change']);
      await page.getByTestId('verify-card-first-send').click();
      await expect(page.getByRole('alert').filter({ hasText: w.offline })).toBeVisible();
      expect(await overflow(page)).toBeLessThanOrEqual(0);
    });

    test('a pending change of address, and the Change email sheet', async ({ page }) => {
      await mockApi(page);
      await page.goto('/verify-preview?state=pending');
      await expect(page.getByText(w.pending)).toBeVisible();
      await expectTargets(page, ['verify-card-resend', 'verify-card-keep']);
      await page.getByTestId('verify-card-keep').click();
      await expect(page.getByTestId('verify-card-done')).toBeVisible();

      await page.getByTestId('verify-card-change').click();
      await expect(page.getByTestId('account-sheet')).toBeVisible();
      await expect(page.getByRole('heading', { name: w.changeTitle })).toBeVisible();
      await expect(page.getByTestId('change-email')).toHaveAttribute('autocomplete', 'email');
      await expect(page.getByTestId('change-password')).toHaveAttribute('autocomplete', 'current-password');
      await expectTargets(page, ['auth-close', 'change-email', 'change-password', 'change-submit']);
      expect(await overflow(page)).toBeLessThanOrEqual(0);
      // A malformed address is refused before any request.
      await page.getByTestId('change-email').fill('not-an-email');
      await page.getByTestId('change-password').fill('whatever');
      await page.getByTestId('change-submit').click();
      await expect(page.getByTestId('auth-error')).toBeVisible();
      await page.getByTestId('auth-close').click();
      await expect(page.getByTestId('account-sheet')).toHaveCount(0);
    });
  });
}
