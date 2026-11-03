// B1-review-privacy: browser counterexamples and offline/deep-link coverage.
import { expect, test } from '@playwright/test';

test.use({ locale: 'en-US', colorScheme: 'light' });

test('Email us is a native mailto anchor, not just a div with a link role', async ({ page }) => {
  await page.goto('/privacy');
  const email = page.getByTestId('privacy-email');
  await expect(email).toBeVisible();
  expect(await email.evaluate((el) => el.tagName)).toBe('A');
  await expect(email).toHaveAttribute('href', 'mailto:JohnWang.0918.code@gmail.com');
});

test('document title follows the page language switch', async ({ page }) => {
  await page.goto('/privacy');
  await expect(page).toHaveTitle('Privacy policy');
  await page.getByTestId('privacy-language').click();
  await expect(page.getByRole('heading', { name: '隐私政策' })).toBeVisible();
  await expect(page).toHaveTitle('隐私政策');
});

test('a Chinese deep link exposes the policy language to assistive technology', async ({ page }) => {
  await page.goto('/privacy?lang=zh-Hans');
  await expect(page.getByRole('heading', { name: '隐私政策' })).toBeVisible();
  const language = await page.getByTestId('screen-privacy').evaluate(
    (el) => el.closest('[lang]')?.getAttribute('lang'),
  );
  expect(language).toBe('zh-Hans');
});

test('an unknown URL language follows saved Chinese without writing the app setting', async ({ page }) => {
  const storageKey = 'bible-app' + String.fromCharCode(92) + 'language';
  await page.addInitScript(([key, value]) => localStorage.setItem(key, value), [
    storageKey, JSON.stringify({ v: 1, data: 'zh-Hans' }),
  ] as const);
  await page.goto('/privacy?lang=unknown');
  await expect(page.getByRole('heading', { name: '隐私政策' })).toBeVisible();
  await expect(page.getByTestId('privacy-open-app')).toBeVisible();
  await expect(page.getByTestId('privacy-back')).toHaveCount(0);
  await page.getByTestId('privacy-language').click();
  await expect(page.getByRole('heading', { name: 'Privacy policy' })).toBeVisible();
  expect(await page.evaluate((key) => localStorage.getItem(key), storageKey))
    .toBe(JSON.stringify({ v: 1, data: 'zh-Hans' }));
});

test('privacy uses only bundled content and switches language offline', async ({ page, context }) => {
  const external: string[] = [];
  await page.route('**/*', async (route) => {
    const url = new URL(route.request().url());
    if (url.hostname !== '127.0.0.1') {
      external.push(url.origin);
      await route.abort();
    } else {
      await route.continue();
    }
  });
  await page.goto('/privacy');
  await expect(page.getByRole('heading', { name: 'Privacy policy' })).toBeVisible();
  await page.getByTestId('privacy-contact').scrollIntoViewIfNeeded();
  await expect(page.getByTestId('privacy-email')).toContainText('JohnWang.0918.code@gmail.com');
  await context.setOffline(true);
  await page.getByTestId('privacy-language').click();
  await expect(page.getByTestId('privacy-contact')).toContainText('联系我们');
  expect(external).toEqual([]);
});

test('all policy text fits inside the 390px viewport in both languages', async ({ page }) => {
  await page.setViewportSize({ width: 390, height: 844 });
  for (const lang of ['en', 'zh-Hans']) {
    await page.goto('/privacy?lang=' + lang);
    await expect(page.getByTestId('privacy-contact')).toBeAttached();
    expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(390);
    const overflow = await page.getByTestId('screen-privacy').evaluate((root) =>
      Array.from(root.querySelectorAll<HTMLElement>('*'))
        .filter((el) => el.childElementCount === 0 && el.textContent?.trim())
        .map((el) => ({ text: el.textContent, rect: el.getBoundingClientRect() }))
        .filter(({ rect }) => rect.left < 0 || rect.right > 390)
        .map(({ text }) => text),
    );
    expect(overflow).toEqual([]);
  }
});

test('top bar honours a 47px CSS safe-area inset', async ({ page, context }) => {
  // Use Chromium's actual CSS env override, and verify the override before testing the app.
  const cdp = await context.newCDPSession(page);
  await cdp.send('Emulation.setSafeAreaInsetsOverride', {
    insets: { top: 47, left: 0, right: 0, bottom: 34 },
  });
  await page.goto('/privacy');
  const actualInset = await page.evaluate(() => {
    const probe = document.createElement('div');
    probe.style.paddingTop = 'env(safe-area-inset-top)';
    document.body.appendChild(probe);
    const top = getComputedStyle(probe).paddingTop;
    probe.remove();
    return top;
  });
  expect(actualInset).toBe('47px');
  const open = page.getByTestId('privacy-open-app');
  await expect(open).toBeVisible();
  // The bar starts below the inset (a little padding is fine), never under it, and not a fixed 56 px plus the inset.
  await expect.poll(async () => (await open.boundingBox())?.y ?? -1).toBeGreaterThanOrEqual(47);
  expect((await open.boundingBox())!.y).toBeLessThanOrEqual(47 + 12);
});


test('top bar stays pinned while the cards scroll and preserves 44px controls', async ({ page }) => {
  await page.goto('/privacy');
  const open = page.getByTestId('privacy-open-app');
  await expect(open).toBeVisible();
  const before = await open.boundingBox();
  await page.getByTestId('privacy-changes').scrollIntoViewIfNeeded();
  await expect(page.getByTestId('privacy-changes')).toBeVisible();
  expect((await open.boundingBox())?.y).toBe(before?.y);
  for (const id of ['privacy-open-app', 'privacy-language', 'privacy-email-copy']) {
    const rect = await page.getByTestId(id).boundingBox();
    expect(rect?.width).toBeGreaterThanOrEqual(44);
    expect(rect?.height).toBeGreaterThanOrEqual(44);
  }
});
