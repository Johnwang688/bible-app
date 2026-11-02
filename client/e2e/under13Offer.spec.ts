// The Under 13 offer on /account-preview?u13offer=1 (FOLLOW-UP item 2): the panel and its delete sheet in English
// and Chinese, a 375 px phone at 150 % display scale, nothing clipped, 44 px targets, the autofill attribute. The
// preview's backend is inert: the delete fails (as with no connection) and "Not now" drops the offer.
import { expect, test, type Page } from '@playwright/test';

import { mockApi } from './helpers';

const WORDS = {
  'en-US': { title: 'Your account still has synced data', del: 'Delete account and synced data', notNow: 'Not now' },
  'zh-CN': { title: '你的账户里还有已同步的数据', del: '删除账户和已同步的数据', notNow: '暂不' },
} as const;

const overflow = (page: Page) => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);

async function expectTargets(page: Page, ids: string[], width = 375) {
  for (const id of ids) {
    const box = await page.getByTestId(id).boundingBox();
    expect(box, id).not.toBeNull();
    expect(box!.height, `${id} height`).toBeGreaterThanOrEqual(43.9); // 44 pt; sub-pixel rounding at deviceScaleFactor 1.5
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

  test.describe(`the Under 13 offer at 150% display scale (${label})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

    test('the panel fits the phone with both choices; "Not now" drops it', async ({ page }) => {
      await mockApi(page);
      await page.goto('/account-preview?u13offer=1');
      await expect(page.getByTestId('account-u13-offer')).toBeVisible();
      await expect(page.getByText(w.title)).toBeVisible();
      await expect(page.getByTestId('account-u13-delete')).toHaveAttribute('aria-label', w.del);
      await expect(page.getByTestId('account-u13-not-now')).toHaveAttribute('aria-label', w.notNow);
      await expect(page.getByTestId('account-sign-in')).toHaveCount(0);
      expect(await overflow(page)).toBeLessThanOrEqual(0);
      await expectTargets(page, ['account-u13-delete', 'account-u13-not-now']);

      await page.getByTestId('account-u13-not-now').click();
      await expect(page.getByTestId('account-u13-offer')).toHaveCount(0);
    });

    test('the delete sheet: the offered email, a current-password field, no reset link, the failure shown', async ({ page }) => {
      await mockApi(page);
      await page.goto('/account-preview?u13offer=1');
      await page.getByTestId('account-u13-delete').click();
      await expect(page.getByTestId('account-sheet')).toBeVisible();
      await expect(page.getByTestId('offer-email')).toHaveText('preview@example.com');
      const password = page.getByTestId('delete-password');
      await expect(password).toHaveAttribute('autocomplete', 'current-password');
      await expect(password).toHaveAttribute('type', 'password');
      await expect(page.getByTestId('delete-forgot')).toHaveCount(0);
      expect(await overflow(page)).toBeLessThanOrEqual(0);
      await expectTargets(page, ['auth-close', 'delete-password', 'delete-confirm', 'delete-cancel']);

      await password.fill('some password');
      await page.getByTestId('delete-confirm').scrollIntoViewIfNeeded();
      await page.getByTestId('delete-confirm').click();
      await expect(page.getByTestId('delete-error')).toBeVisible();
      await page.getByTestId('delete-cancel').click();
      await expect(page.getByTestId('account-sheet')).toHaveCount(0);
      await expect(page.getByTestId('account-u13-offer')).toBeVisible();
    });
  });
}
