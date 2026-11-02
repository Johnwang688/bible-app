// Web e2e for R-6a: the Me tab, Customise and Advanced. Orchestrator-owned.
import { expect, test, type Page } from '@playwright/test';

const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;

async function stored<T>(page: Page, key: string): Promise<T | null> {
  const raw = await page.evaluate((k) => localStorage.getItem(k), storageKey(key));
  return raw ? (JSON.parse(raw) as { data: T }).data : null;
}

async function openMe(page: Page) {
  await page.goto('/');
  await page.getByRole('tab', { name: /Me tab|我的/ }).click();
  await expect(page.getByTestId('screen-me')).toBeVisible();
}

const bodyBackground = (page: Page) =>
  page.getByTestId('screen-me').evaluate((el) => getComputedStyle(el).backgroundColor);

test.describe('Me (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('Customise: a new look and accent apply at once and survive a reload', async ({ page }) => {
    await openMe(page);
    const before = await bodyBackground(page);
    await page.getByTestId('me-row-look').click();
    await expect(page.getByTestId('screen-customise')).toBeVisible();
    await page.getByTestId('customise-preset-matcha-latte').click();
    await page.getByTestId('customise-accent-blue').click();
    await expect(page.getByTestId('customise-preset-matcha-latte')).toHaveAttribute('aria-checked', 'true');
    expect(await stored(page, 'appearance')).toEqual({ preset: 'matcha-latte', mode: 'system' });
    expect(await stored<{ edits: Record<string, { accent?: string }> }>(page, 'appearance.custom')).toMatchObject({
      edits: { 'matcha-latte': { accent: '#1F5FAE' } },
    });
    await page.getByTestId('customise-back').click();
    await expect(page.getByTestId('me-row-look-value')).toHaveText('Matcha latte');
    expect(await bodyBackground(page)).not.toBe(before);

    await page.reload();
    await page.getByRole('tab', { name: 'Me tab' }).click();
    await expect(page.getByTestId('me-row-look-value')).toHaveText('Matcha latte');
  });

  test('Advanced refuses unreadable text and applies readable text', async ({ page }) => {
    await openMe(page);
    await page.getByTestId('me-row-look').click();
    await page.getByTestId('customise-preset-strawberry-milk').click();
    await page.getByTestId('customise-advanced').click();
    await expect(page.getByTestId('screen-advanced')).toBeVisible();
    await page.getByTestId('advanced-input-text').fill('#FFF0F3');
    await page.getByTestId('advanced-apply-text').click();
    await expect(page.getByTestId('advanced-error-text')).toContainText('Too hard to read');
    await page.getByTestId('advanced-input-text').fill('#2A2A2A');
    await page.getByTestId('advanced-apply-text').click();
    await expect(page.getByTestId('advanced-edited-text')).toBeVisible();
    expect(await stored<{ edits: Record<string, Record<string, string>> }>(page, 'appearance.custom')).toMatchObject({
      edits: { 'strawberry-milk': { text: '#2A2A2A' } },
    });
  });

  test('the language row switches the whole app to Chinese', async ({ page }) => {
    await openMe(page);
    await page.getByTestId('me-row-language').click();
    await page.getByTestId('me-language-zh-Hans').click();
    await expect(page.getByText('外观')).toBeVisible();
    await expect(page.getByRole('tab', { name: /我的/ })).toBeVisible();
  });

  test('Sources, About and Help open and come back', async ({ page }) => {
    await openMe(page);
    for (const [row, screen] of [
      ['me-row-sources', 'sources'],
      ['me-row-about', 'about'],
      ['me-row-help', 'help'],
    ] as const) {
      await page.getByTestId(row).click();
      await expect(page.getByTestId(`screen-${screen}`)).toBeVisible();
      await page.getByTestId(`${screen}-back`).click();
      await expect(page.getByTestId('screen-me')).toBeVisible();
    }
  });
});

for (const [label, locale] of [
  ['English', 'en-US'],
  ['Chinese', 'zh-CN'],
] as const) {
  test.describe(`Me layout at 150% display scale (${label})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

    test('nothing runs off the side of a phone screen, on Me, Customise or Advanced', async ({ page }) => {
      const overflow = () => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
      await openMe(page);
      expect(await overflow()).toBeLessThanOrEqual(0);
      await page.getByTestId('me-row-look').click();
      await expect(page.getByTestId('screen-customise')).toBeVisible();
      expect(await overflow()).toBeLessThanOrEqual(0);
      await page.getByTestId('customise-advanced').click();
      await expect(page.getByTestId('screen-advanced')).toBeVisible();
      expect(await overflow()).toBeLessThanOrEqual(0);
    });
  });
}
