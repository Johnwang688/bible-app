// Acceptance (orchestrator-owned, R-7a): the web build imports the old app's localStorage on its first run.
import { expect, test, type Page } from '@playwright/test';

const rgb = (hex: string) => {
  const n = parseInt(hex.slice(1), 16);
  return `rgb(${(n >> 16) & 255}, ${(n >> 8) & 255}, ${n & 255})`;
};

/** MMKV's web build keeps each value in localStorage under `bible-app` + one backslash + `<key>`. */
const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;

/** Seeds raw old-app keys once per test (not again on a reload), before the app starts. */
async function seedOld(page: Page, items: Record<string, string>) {
  await page.addInitScript((entries) => {
    if (sessionStorage.getItem('seeded')) return;
    sessionStorage.setItem('seeded', '1');
    for (const [k, v] of entries) localStorage.setItem(k, v);
  }, Object.entries(items));
}

async function stored(page: Page, key: string): Promise<unknown> {
  const raw = await page.evaluate((k) => localStorage.getItem(k), storageKey(key));
  return raw === null ? null : (JSON.parse(raw) as { data: unknown }).data;
}

test.describe('old web data', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('a Dark reader of the old app gets Graphite on a light phone, once', async ({ page }) => {
    await seedOld(page, { theme: 'dark' });
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await page.getByTestId('screen-home').evaluate((el) => getComputedStyle(el).backgroundColor)).toBe(
      rgb('#0E0F12'),
    );

    // The import runs once: a later change to the old key is not imported again.
    await page.evaluate(() => localStorage.setItem('theme', 'light'));
    await page.reload();
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await page.getByTestId('screen-home').evaluate((el) => getComputedStyle(el).backgroundColor)).toBe(
      rgb('#0E0F12'),
    );
    // The old keys stay as they were (the old app keeps serving until the cut-over).
    expect(await page.evaluate(() => localStorage.getItem('theme'))).toBe('light');
  });

  test('keeps the reader’s place and study items', async ({ page }) => {
    await seedOld(page, {
      'bible-app-last-position': JSON.stringify({ book: 'John', chapter: 3, translation: 'WEB' }),
      'bible-app-highlights': JSON.stringify(['john::3::16']),
      'bible-app-bookmarks': JSON.stringify(['romans::8::28']),
      'bible-app-notes': JSON.stringify({
        'john::3::16': { key: 'john::3::16', book: 'John', chapter: 3, verse: 16, text: 'Love', updatedAt: 1_700_000_000_000 },
      }),
    });
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await stored(page, 'reader.position')).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
    const items = (await stored(page, 'study.items')) as {
      highlights: Record<string, unknown>;
      notes: Record<string, { text: string }>;
      bookmarks: Record<string, unknown>;
    };
    expect(Object.keys(items.highlights)).toEqual(['43:3:16']);
    expect(items.notes['43:3:16']!.text).toBe('Love');
    expect(Object.keys(items.bookmarks)).toEqual(['45:8:28']);
  });

  test('a brand-new web reader starts clean', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    expect(await stored(page, 'reader.position')).toBeNull();
    expect(await stored(page, 'legacy.import')).toEqual({ parts: expect.arrayContaining(['position', 'study', 'theme']) });
  });
});
