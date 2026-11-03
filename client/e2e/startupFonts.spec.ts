// Acceptance (orchestrator-owned, R-7a follow-up, John 11-02): the start-up request list holds only the active
// look's fonts (its UI and Scripture faces), with font-display: swap, so text shows at once in a fallback font;
// the Chinese Scripture font only when the interface or translation is Chinese; other looks' fonts on demand.
import { expect, test, type Page } from '@playwright/test';

const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;
const GLASS = /PlusJakartaSans|SourceSerif4/;
const PASTEL = /SpaceGrotesk|Literata/;

/** Records font requests: bundled font files (by file name) and the Google Fonts stylesheet (answered locally). */
async function watchFonts(page: Page) {
  const files: string[] = [];
  const sheets: string[] = [];
  page.on('request', (r) => {
    const url = r.url();
    if (/\.(ttf|otf|woff2?)(\?|$)/.test(url)) files.push(decodeURIComponent(new URL(url).pathname.split('/').pop()!));
  });
  await page.route('https://fonts.googleapis.com/**', (route) => {
    sheets.push(route.request().url());
    return route.fulfill({ contentType: 'text/css', body: '' });
  });
  return { files, sheets };
}

async function seed(page: Page, entries: Record<string, unknown>) {
  await page.addInitScript((pairs) => {
    for (const [k, v] of pairs) localStorage.setItem(k, v);
  }, Object.entries(entries).map(([k, v]) => [storageKey(k), JSON.stringify({ v: 1, data: v })] as [string, string]));
}

/** Home is up and the font requests have had time to go out. */
async function home(page: Page) {
  await page.goto('/');
  await expect(page.getByTestId('screen-home')).toBeVisible();
  await page.waitForTimeout(1500);
}

test.describe('English, light', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('a glass look (Silver, the default) loads only its own faces', async ({ page }) => {
    const fonts = await watchFonts(page);
    await home(page);
    expect(fonts.files.length).toBeGreaterThan(0);
    for (const f of fonts.files) expect(f).toMatch(GLASS);
    expect(fonts.files.some((f) => f.includes('PlusJakartaSans'))).toBe(true);
    expect(fonts.files.some((f) => f.includes('SourceSerif4'))).toBe(true);
    expect(fonts.sheets).toEqual([]);
  });

  test('a pastel look loads only its own faces', async ({ page }) => {
    await seed(page, { appearance: { preset: 'matcha-latte', mode: 'system' } });
    const fonts = await watchFonts(page);
    await home(page);
    expect(fonts.files.length).toBeGreaterThan(0);
    for (const f of fonts.files) expect(f).toMatch(PASTEL);
    expect(fonts.files.some((f) => f.includes('SpaceGrotesk'))).toBe(true);
    expect(fonts.files.some((f) => f.includes('Literata'))).toBe(true);
    expect(fonts.sheets).toEqual([]);
  });

  test('a Chinese translation adds the Chinese Scripture font', async ({ page }) => {
    await seed(page, { 'reader.position': { bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' } });
    const fonts = await watchFonts(page);
    await home(page);
    for (const f of fonts.files) expect(f).toMatch(GLASS);
    expect(fonts.sheets.some((u) => u.includes('Noto+Serif+SC'))).toBe(true);
  });

  test('text shows while the fonts are still downloading, and every face is font-display: swap', async ({ page }) => {
    await page.route(/\.(ttf|otf|woff2?)(\?|$)/, () => undefined); // never answered
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    await expect(page.getByTestId('screen-home').getByText(/./).first()).toBeVisible();
    const displays = await page.evaluate(() => {
      const out: string[] = [];
      for (const sheet of Array.from(document.styleSheets)) {
        let rules: CSSRuleList;
        try {
          rules = sheet.cssRules;
        } catch {
          continue;
        }
        for (const rule of Array.from(rules)) {
          if (rule instanceof CSSFontFaceRule && !/Noto Serif SC/.test(rule.style.getPropertyValue('font-family'))) {
            out.push(rule.style.getPropertyValue('font-display'));
          }
        }
      }
      return out;
    });
    expect(displays.length).toBeGreaterThan(0);
    for (const d of displays) expect(d).toBe('swap');
  });
});

test.describe('Chinese interface', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'light' });

  test('adds the Chinese Scripture font to the active look’s faces', async ({ page }) => {
    const fonts = await watchFonts(page);
    await home(page);
    for (const f of fonts.files) expect(f).toMatch(GLASS);
    expect(fonts.sheets.some((u) => u.includes('Noto+Serif+SC'))).toBe(true);
  });
});

test.describe('first run', () => {
  test.use({ locale: 'en-US', colorScheme: 'light', storageState: { cookies: [], origins: [] } });

  test('the welcome loads only the default look’s faces; the look picker loads the looks it shows', async ({ page }) => {
    const fonts = await watchFonts(page);
    await page.goto('/');
    await expect(page.getByTestId('first-run-welcome')).toBeVisible();
    await page.waitForTimeout(1500);
    for (const f of fonts.files) expect(f).toMatch(GLASS);
    await page.getByRole('button', { name: 'Get started' }).click();
    await expect(page.getByTestId('first-run-look')).toBeVisible();
    await expect.poll(() => fonts.files.some((f) => f.includes('SpaceGrotesk'))).toBe(true);
  });
});
