// Acceptance test for VI-2a (cut the themes to Auto / Light / Dark / Paper). Owned by the orchestrator: do not edit.
// Stored preference ('theme' in localStorage): 'system' | 'light' | 'dark' | 'paper'.
// 'light' is an explicit Light; the old app's stored 'default' meant "never chose" and becomes 'system'.
// Applied mode (<html data-theme>): 'default' | 'dark' | 'paper'. 'system' follows prefers-color-scheme.
import type { Page } from '@playwright/test';
import { expect, revealTaskbar, test } from './fixtures';

const stored = (page: Page) => page.evaluate(() => localStorage.getItem('theme'));
const html = (page: Page) => page.locator('html');

async function openWithStoredTheme(page: Page, raw: string | null, scheme: 'light' | 'dark' = 'light') {
  await page.emulateMedia({ colorScheme: scheme });
  await page.addInitScript((t) => {
    if (sessionStorage.getItem('theme-seeded')) return;
    if (t === null) localStorage.removeItem('theme'); else localStorage.setItem('theme', t);
    sessionStorage.setItem('theme-seeded', '1');
  }, raw);
  await page.goto('/app');
  await expect(page.getByRole('button', { name: 'Bible reader' })).toBeVisible();
}

const MIGRATION: [string | null, string, string][] = [
  // [stored before, stored after, applied on a light device]
  [null, 'system', 'default'],
  ['default', 'system', 'default'],
  ['dark', 'dark', 'dark'],
  ['light', 'light', 'default'],
  ['system', 'system', 'default'],
  ['paper', 'paper', 'paper'],
  ['parchment', 'paper', 'paper'],
  ['gold', 'paper', 'paper'],
  ['dynamic', 'light', 'default'],
  ['pink', 'light', 'default'],
  ['blue', 'light', 'default'],
  ['purple', 'light', 'default'],
  ['galaxy', 'dark', 'dark'],
  ['Galaxy Metallic', 'dark', 'dark'],
  ['midnight', 'dark', 'dark'],
  ['neonrose', 'dark', 'dark'],
  ['canyon', 'dark', 'dark'],
  ['not-a-theme', 'system', 'default'],
];

for (const [before, after, applied] of MIGRATION) {
  test(`stored theme ${JSON.stringify(before)} migrates to ${after} and shows ${applied}`, async ({ page }) => {
    await openWithStoredTheme(page, before);
    await expect(html(page)).toHaveAttribute('data-theme', applied);
    await expect.poll(() => stored(page)).toBe(after);
    await expect(html(page)).not.toHaveAttribute('data-dynamic-wave', /.*/);
  });
}

test('Auto follows the device, including a live change', async ({ page }) => {
  await openWithStoredTheme(page, 'system', 'dark');
  await expect(html(page)).toHaveAttribute('data-theme', 'dark');
  await expect(page.locator('.home-screen-logo')).toHaveAttribute('src', /openbible-logo-white\.png$/);
  await page.emulateMedia({ colorScheme: 'light' });
  await expect(html(page)).toHaveAttribute('data-theme', 'default');
  await expect(page.locator('.home-screen-logo')).toHaveAttribute('src', /openbible-logo-black\.png$/);
  expect(await stored(page)).toBe('system');
});

test('an explicit choice ignores the device, and survives reloads', async ({ page }) => {
  await openWithStoredTheme(page, 'dark', 'light');
  await expect(html(page)).toHaveAttribute('data-theme', 'dark');
  await page.evaluate(() => localStorage.setItem('theme', 'light'));
  await page.emulateMedia({ colorScheme: 'dark' });
  await page.reload();
  await expect(html(page)).toHaveAttribute('data-theme', 'default');
  await page.reload();
  await expect(html(page)).toHaveAttribute('data-theme', 'default');
  expect(await stored(page)).toBe('light');
});

test('the Light card stores an explicit light preference', async ({ page }) => {
  await openWithStoredTheme(page, null, 'dark');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await revealTaskbar(page);
  await page.getByRole('button', { name: 'Settings', exact: true }).click();
  await page.getByRole('button', { name: 'Light', exact: true }).click();
  await expect(html(page)).toHaveAttribute('data-theme', 'default');
  expect(await stored(page)).toBe('light');
  await page.reload();
  await expect(html(page)).toHaveAttribute('data-theme', 'default');
});

test('settings offer exactly Auto, Light, Dark and Paper; Paper applies the sepia mode and survives a reload', async ({ page }) => {
  await openWithStoredTheme(page, null);
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await revealTaskbar(page);
  await page.getByRole('button', { name: 'Settings', exact: true }).click();
  const names = page.locator('.settings-overlay .theme-card .theme-name');
  await expect(names).toHaveText(['Auto', 'Light', 'Dark', 'Paper']);
  await expect(page.locator('.settings-overlay .theme-card.selected .theme-name')).toHaveText('Auto');
  await page.getByRole('button', { name: 'Paper', exact: true }).click();
  await expect(html(page)).toHaveAttribute('data-theme', 'paper');
  expect(await stored(page)).toBe('paper');
  const bg = await page.evaluate(() => getComputedStyle(document.documentElement).getPropertyValue('--bg').trim());
  expect(bg.toLowerCase()).toBe('#f4ecd8');
  await page.reload();
  await expect(html(page)).toHaveAttribute('data-theme', 'paper');
});

for (const t of ['system', 'dark', 'paper']) {
  test(`no retired decorations are rendered: ${t}`, async ({ page }) => {
    await openWithStoredTheme(page, t);
    await page.getByRole('button', { name: 'Bible reader' }).click();
    await expect(page.locator('.verse-line').first()).toBeVisible();
    await expect(page.locator('#smoke-overlay, #wave-bg, .smoke-wisp, .wave-svg')).toHaveCount(0);
    await expect(page.locator('canvas')).toHaveCount(0);
  });
}
