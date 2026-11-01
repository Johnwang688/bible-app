// Web smoke tests for R-0: the four empty tabs, both languages, the default looks and a stored look.
import { expect, test, type Page } from '@playwright/test';

const rgb = (hex: string) => {
  const n = parseInt(hex.slice(1), 16);
  return `rgb(${(n >> 16) & 255}, ${(n >> 8) & 255}, ${n & 255})`;
};

/** MMKV's web build keeps each value in localStorage under `<store id>` + one backslash + `<key>`. */
const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;

/** Seeds a value the way the storage module writes it, before the app starts. */
async function seed(page: Page, key: string, v: number, data: unknown) {
  await page.addInitScript(([k, value]) => localStorage.setItem(k, value), [
    storageKey(key),
    JSON.stringify({ v, data }),
  ] as const);
}

async function screenBackground(page: Page, testId: string) {
  return page.getByTestId(testId).evaluate((el) => getComputedStyle(el).backgroundColor);
}

test.describe('English, light phone', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('shows the four tabs and switches between them', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Home' })).toBeVisible();
    const tabs: [string, string, string][] = [
      ['tab-bible', 'screen-bible', 'Bible'],
      ['tab-study', 'screen-study', 'Study'],
      ['tab-me', 'screen-me', 'Me'],
      ['tab-home', 'screen-home', 'Home'],
    ];
    for (const [tab, screen, title] of tabs) {
      await page.getByTestId(tab).click();
      await expect(page.getByTestId(screen)).toBeVisible();
      await expect(page.getByRole('heading', { name: title })).toBeVisible();
    }
  });

  test('labels every tab for screen readers', async ({ page }) => {
    await page.goto('/');
    for (const name of ['Home tab', 'Bible tab', 'Study tab', 'Me tab']) {
      await expect(page.getByLabel(name, { exact: true })).toBeVisible();
    }
  });

  test('opens a tab from its URL', async ({ page }) => {
    await page.goto('/study');
    await expect(page.getByTestId('screen-study')).toBeVisible();
  });

  test('skipping the look picker gives Silver', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await screenBackground(page, 'screen-home')).toBe(rgb('#F2F3F5'));
    expect(await page.getByTestId('screen-home').evaluate((el) => getComputedStyle(el).backgroundImage)).toContain(
      'radial-gradient',
    );
  });

  test('sets the page language', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    await expect(page.locator('html')).toHaveAttribute('lang', 'en');
  });

  test('uses a look saved on the device', async ({ page }) => {
    await seed(page, 'appearance', 1, { preset: 'matcha-latte', mode: 'system' });
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await screenBackground(page, 'screen-home')).toBe(rgb('#F1F6EA'));
  });

  test('ignores a corrupt saved look and falls back to Silver', async ({ page }) => {
    await seed(page, 'appearance', 1, { preset: 'not-a-preset', mode: 'system' });
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await screenBackground(page, 'screen-home')).toBe(rgb('#F2F3F5'));
  });
});

test.describe('English, dark phone', () => {
  test.use({ locale: 'en-US', colorScheme: 'dark' });

  test('skipping the look picker gives Graphite', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await screenBackground(page, 'screen-home')).toBe(rgb('#0E0F12'));
  });

  test('swaps a saved light look for its dark pair', async ({ page }) => {
    await seed(page, 'appearance', 1, { preset: 'strawberry-milk', mode: 'system' });
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await screenBackground(page, 'screen-home')).toBe(rgb('#1C1619'));
  });
});

test.describe('Chinese phone', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'light' });

  test('shows the Simplified Chinese interface', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByRole('heading', { name: '首页' })).toBeVisible();
    await expect(page.getByLabel('圣经标签', { exact: true })).toBeVisible();
    await expect(page.locator('html')).toHaveAttribute('lang', 'zh-Hans');
  });

  test('a saved English choice wins over the phone', async ({ page }) => {
    await seed(page, 'language', 1, 'en');
    await page.goto('/');
    await expect(page.getByRole('heading', { name: 'Home' })).toBeVisible();
  });
});
