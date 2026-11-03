// Web smoke tests for R-0: the four empty tabs, both languages, the default looks and a stored look.
import { expect, test, type Page } from '@playwright/test';

import { mockApi } from './helpers';

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

// The API is mocked here as in every other spec (GAPS, board 11-03). Unmocked, this suite depended on whatever
// answered at the build's API origin (localhost:8000, then the production backend until #40, now a dead port),
// and the reader waited out its retries or a real backend's replies; under a full parallel run that was the smoke
// timeouts. Any endpoint the mock does not know answers 404 at once (no retries).
test.beforeEach(async ({ page }) => {
  await page.route('**/api/**', (route) => route.fulfill({ status: 404, json: { detail: 'not mocked' } }));
  await mockApi(page);
});

async function screenBackground(page: Page, testId: string) {
  return page.getByTestId(testId).evaluate((el) => getComputedStyle(el).backgroundColor);
}

test.describe('English, light phone', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('shows the four tabs and switches between them', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    // Since R-4 Home's heading is the greeting (Home.dc.html), not a "Home" title.
    await expect(page.getByText('Verse of the day')).toBeVisible();
    const tabs: [string, string, string][] = [
      ['tab-bible', 'screen-bible', 'Bible'],
      ['tab-study', 'screen-study', 'Study'],
      ['tab-me', 'screen-me', 'Me'],
      ['tab-home', 'screen-home', 'Home'],
    ];
    for (const [tab, screen, title] of tabs) {
      await page.getByTestId(tab).click();
      await expect(page.getByTestId(screen)).toBeVisible();
      // Since R-1 the Bible tab is the reader; with the API mocked its header loads at once.
      if (screen === 'screen-bible') await expect(page.getByTestId('reader-book-button')).toBeVisible();
      else if (screen === 'screen-home') await expect(page.getByTestId('home-greeting')).toBeVisible();
      else await expect(page.getByRole('heading', { name: title })).toBeVisible();
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

  for (const preset of ['grape-soda', 'graphite']) {
    test(`shows every tab label in full (${preset})`, async ({ page }) => {
      await seed(page, 'appearance', 1, { preset, mode: 'system' });
      await page.goto('/');
      await expect(page.getByTestId('screen-home')).toBeVisible();
      const viewport = page.viewportSize()!;
      for (const name of ['Home tab', 'Bible tab', 'Study tab', 'Me tab']) {
        const tab = page.getByLabel(name, { exact: true });
        const label = tab.getByText(name.replace(' tab', ''), { exact: true });
        const [t, l] = [await tab.boundingBox(), await label.boundingBox()];
        expect(t && l).toBeTruthy();
        expect(l!.y + l!.height).toBeLessThanOrEqual(Math.min(t!.y + t!.height, viewport.height) + 0.5);
        expect(t!.height).toBeGreaterThanOrEqual(44);
        // A bar that is too short squashes the label rather than pushing it out.
        expect(l!.height).toBeGreaterThanOrEqual(12);
      }
    });
  }

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
    await expect(page.getByText('每日经文')).toBeVisible();
    await expect(page.getByLabel('圣经标签', { exact: true })).toBeVisible();
    await expect(page.locator('html')).toHaveAttribute('lang', 'zh-Hans');
  });

  test('a saved English choice wins over the phone', async ({ page }) => {
    await seed(page, 'language', 1, 'en');
    await page.goto('/');
    await expect(page.getByText('Verse of the day')).toBeVisible();
  });
});
