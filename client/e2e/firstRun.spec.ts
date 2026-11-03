// Acceptance (orchestrator-owned, R-7a UI): the first-run intro on the web export. Every other spec starts
// with the intro already done (playwright.config.ts `storageState`); this one starts from an empty device.
import { expect, test, type Page } from '@playwright/test';

/** MMKV's web build keeps each value in localStorage under `bible-app` + one backslash + `<key>`. */
const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;
const stored = async (page: Page, key: string) => {
  const raw = await page.evaluate((k) => localStorage.getItem(k), storageKey(key));
  return raw === null ? null : (JSON.parse(raw) as { v: number; data: unknown }).data;
};

function watchErrors(page: Page): string[] {
  const errors: string[] = [];
  page.on('pageerror', (e) => errors.push(String(e)));
  page.on('console', (m) => {
    // Home now loads data, and the e2e build's API origin is a closed local port (scripts/gate.mjs).
    if (m.type() === 'error' && !m.text().includes('net::ERR_CONNECTION_REFUSED')) errors.push(m.text());
  });
  return errors;
}

/** The element's box is wholly inside the viewport. */
async function inViewport(page: Page, testIdOrRole: ReturnType<Page['getByRole']>) {
  const box = await testIdOrRole.boundingBox();
  const vp = page.viewportSize()!;
  return box !== null && box.y >= 0 && box.x >= 0 && box.y + box.height <= vp.height + 0.5 && box.x + box.width <= vp.width + 0.5;
}

test.use({ storageState: { cookies: [], origins: [] } });

test.describe('first run, English, light phone', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('walks through the three steps and opens the app; the intro never shows again', async ({ page }) => {
    const errors = watchErrors(page);
    await page.goto('/');
    await expect(page.getByTestId('first-run-welcome')).toBeVisible();
    await expect(page.getByTestId('screen-home')).toHaveCount(0);
    // The default look (Silver) is glass, so the welcome runs the aurora.
    await expect(page.getByTestId('first-run-welcome').getByTestId('aurora-canvas')).toHaveCount(1);

    await page.getByRole('button', { name: 'Get started' }).click();
    await expect(page.getByTestId('first-run-look')).toBeVisible();
    // Focus moves to the new step's heading, so a screen reader announces it.
    await expect(page.getByRole('heading', { name: 'Pick your look' })).toBeFocused();
    await page.getByRole('radio', { name: 'Sky' }).click();
    await expect(page.getByRole('radio', { name: 'Sky' })).toHaveAttribute('aria-checked', 'true');
    expect(await stored(page, 'appearance')).toEqual({ preset: 'sky', mode: 'system' });

    await page.getByRole('button', { name: 'Continue' }).click();
    await expect(page.getByTestId('first-run-age')).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Your age' })).toBeFocused();
    await expect(page.getByRole('radiogroup', { name: 'Your age' })).toBeVisible();
    await page.getByRole('radio', { name: '18–24' }).click();
    await expect(page.getByRole('radio', { name: '18–24' })).toHaveAttribute('aria-checked', 'true');
    await page.getByRole('button', { name: 'Start reading' }).click();

    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await stored(page, 'onboarding')).toEqual({ done: true, ageRange: '18-24' });
    await page.reload();
    await expect(page.getByTestId('screen-home')).toBeVisible();
    await expect(page.getByTestId('first-run-welcome')).toHaveCount(0);
    expect(errors).toEqual([]);
  });

  test('Skip on the welcome gives the default look and opens the page that was asked for', async ({ page }) => {
    await page.goto('/study');
    await expect(page.getByTestId('first-run-welcome')).toBeVisible();
    await page.getByRole('button', { name: 'Skip', exact: true }).click();
    await expect(page.getByTestId('screen-study')).toBeVisible();
    expect(new URL(page.url()).pathname).toBe('/study');
    expect(await stored(page, 'onboarding')).toEqual({ done: true, ageRange: null });
    expect(await stored(page, 'appearance')).toEqual({ preset: null, mode: 'system' });
  });

  test('the age chips move with the arrow keys, one at a time', async ({ page }) => {
    await page.goto('/');
    await page.getByRole('button', { name: 'Get started' }).click();
    await page.getByRole('button', { name: 'Continue' }).click();
    await page.getByRole('radio', { name: '25–34' }).click();
    await page.keyboard.press('ArrowRight');
    await expect(page.getByRole('radio', { name: '35–49' })).toBeFocused();
    await expect(page.getByRole('radio', { name: '35–49' })).toHaveAttribute('aria-checked', 'true');
    await expect(page.getByRole('radio', { name: '25–34' })).toHaveAttribute('aria-checked', 'false');
  });

  test('Back and "Skip for now" on steps 2 and 3', async ({ page }) => {
    await page.goto('/');
    await page.getByRole('button', { name: 'Get started' }).click();
    await page.getByRole('button', { name: 'Back' }).click();
    await expect(page.getByTestId('first-run-welcome')).toBeVisible();
    await page.getByRole('button', { name: 'Get started' }).click();
    await page.getByRole('radio', { name: 'Lavender haze' }).click();
    await page.getByRole('button', { name: 'Skip for now' }).click();
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await stored(page, 'onboarding')).toEqual({ done: true, ageRange: null });
    expect(await stored(page, 'appearance')).toEqual({ preset: 'lavender-haze', mode: 'system' });
  });
});

// GO-AHEAD "Major 2": at 200% text the look step's Continue never falls off. The web build sizes text in CSS
// px, so 200% is drawn as a 200% page zoom: the 390 x 844 phone at half the CSS size.
for (const [locale, go, cont, last] of [
  ['en-US', 'Get started', 'Continue', 'Sky'],
  ['zh-CN', '开始', '继续', '天空'],
] as const) {
  test.describe(`first run at 200% (${locale})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 195, height: 422 }, isMobile: true, hasTouch: true });

    test('the footer stays on screen and the middle scrolls to the last tile', async ({ page }) => {
      await page.goto('/');
      await page.getByRole('button', { name: go, exact: true }).click();
      await expect(page.getByTestId('first-run-look')).toBeVisible();
      const button = page.getByRole('button', { name: cont });
      expect(await inViewport(page, button)).toBe(true);
      const tile = page.getByRole('radio', { name: last });
      await tile.scrollIntoViewIfNeeded();
      expect(await inViewport(page, tile)).toBe(true);
      expect(await inViewport(page, button)).toBe(true);
      await tile.click();
      await button.click();
      await expect(page.getByTestId('first-run-age')).toBeVisible();
    });
  });
}

test.describe('first run, 简体中文, dark phone', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'dark' });

  test('speaks Chinese, defaults to Graphite and uses the consistent age bands', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByRole('heading', { name: '圣经' })).toBeVisible();
    await page.getByRole('button', { name: '开始' }).click();
    await expect(page.getByRole('radio', { name: '石墨' })).toHaveAttribute('aria-checked', 'true');
    await expect(page.getByText('深色模式', { exact: false })).toHaveCount(0);
    await expect(page.getByText('浅色模式：银色。')).toBeVisible();
    await page.getByRole('button', { name: '继续' }).click();
    for (const band of ['13岁以下', '13–17岁', '18–24岁', '25–34岁', '35–49岁', '50–64岁', '65岁及以上', '不便透露']) {
      await expect(page.getByRole('radio', { name: band })).toBeVisible();
    }
    await page.getByRole('radio', { name: '13岁以下' }).click();
    await page.getByRole('button', { name: '开始阅读' }).click();
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await stored(page, 'onboarding')).toEqual({ done: true, ageRange: 'under-13' });
  });
});
