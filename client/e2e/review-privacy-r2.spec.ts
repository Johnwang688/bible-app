// Round-2 browser review: exercise the actual exported bundle and browser API failures.
import { expect, test } from '@playwright/test';

test.use({ locale: 'en-US', colorScheme: 'light' });

test('mouse and keyboard mail activation use the native anchor without a second scripted open', async ({ page }) => {
  await page.goto('/privacy');
  const email = page.getByTestId('privacy-email');
  await expect(email).toHaveAttribute('href', 'mailto:JohnWang.0918.code@gmail.com');
  await page.evaluate(() => {
    const audit = { clicks: 0, opens: 0 };
    Object.assign(window, { privacyMailAudit: audit });
    window.open = () => { audit.opens++; return null; };
    // Suppress the OS mail client, while allowing every React event handler to run.
    document.addEventListener('click', (event) => {
      if ((event.target as Element).closest('[data-testid="privacy-email"]')) {
        audit.clicks++;
        event.preventDefault();
      }
    }, true);
  });
  await email.click();
  await email.focus();
  await page.keyboard.press('Enter');
  expect(await page.evaluate(() => Reflect.get(window, 'privacyMailAudit')))
    .toEqual({ clicks: 2, opens: 0 });
});

test('clipboard failure never announces that the address was copied', async ({ page }) => {
  await page.addInitScript(() => {
    Object.defineProperty(navigator, 'clipboard', {
      configurable: true,
      value: { writeText: async () => { throw new Error('clipboard unavailable'); } },
    });
    document.execCommand = () => { throw new Error('legacy clipboard unavailable'); };
  });
  await page.goto('/privacy');
  await page.getByTestId('privacy-email-copy').click();
  // Wait for both asynchronous clipboard attempts without waiting out the 3s message timer.
  // A following task is queued after the clipboard promise continuations finish.
  await page.evaluate(() => new Promise<void>((resolve) => setTimeout(resolve, 0)));
  expect(await page.getByTestId('privacy-contact').getByText('Email address copied').count()).toBe(0);
});

test('title and accessible page language follow two switches without changing the saved language', async ({ page }) => {
  const key = 'bible-app' + String.fromCharCode(92) + 'language';
  const saved = JSON.stringify({ v: 1, data: 'en' });
  await page.addInitScript(([k, value]) => localStorage.setItem(k, value), [key, saved] as const);
  await page.goto('/privacy?lang=zh');
  for (const [locale, title] of [['zh-Hans', '隐私政策'], ['en', 'Privacy policy'], ['zh-Hans', '隐私政策']] as const) {
    await expect(page).toHaveTitle(title);
    await expect(page.getByTestId('screen-privacy')).toHaveAttribute('lang', locale);
    await expect(page.getByRole('heading', { name: title, exact: true })).toBeVisible();
    expect(await page.evaluate((k) => localStorage.getItem(k), key)).toBe(saved);
    await page.getByTestId('privacy-language').click();
  }
});
