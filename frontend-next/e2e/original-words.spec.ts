// Acceptance test for HG-3a (Original words panel). Owned by the orchestrator: do not edit.
// Mocks: e2e/mocks/words-*.json and lexicon-*.json, recorded from the real API.
import type { Page } from '@playwright/test';
import { expect, openReaderAt, test, verse } from './fixtures';

const panel = (page: Page) => page.locator('.side-scroll').first();

async function openOriginalWords(page: Page, verseNumber: number) {
  await verse(page, verseNumber).click();
  await page.getByRole('button', { name: 'Original words', exact: true }).click();
  await expect(panel(page).getByRole('heading', { name: /Original words/ })).toBeVisible();
}

test('original words: John 3:16 lists English phrases beside the Greek', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await openOriginalWords(page, 16);
  const p = panel(page);
  await expect(p).toContainText('John 3:16');
  await expect(p).toContainText('Greek');
  await expect(p).toContainText('Berean Standard Bible');
  const loved = p.getByRole('button', { name: /loved/ });
  await expect(loved).toBeVisible();
  await expect(loved).toContainText('ἠγάπησεν');
  await expect(loved).toContainText('ēgapēsen');
  await expect(loved.locator('[lang="grc"]')).toHaveText('ἠγάπησεν');
  // Untranslated words (the Greek article) are shown, marked as not translated.
  await expect(p).toContainText('not translated');
});

test('original words: the word card shows meaning, grammar, usage and credit', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await openOriginalWords(page, 16);
  const p = panel(page);
  await p.getByRole('button', { name: /loved/ }).click();
  await expect(p.getByRole('heading', { name: 'ἀγαπάω' })).toBeVisible();
  await expect(p).toContainText('agapaō');
  await expect(p).toContainText('to love');
  await expect(p).toContainText('verb · simple past · he/she/it');
  await expect(p).toContainText('143');
  await expect(p).toContainText('110');
  await expect(p).toContainText('STEP Bible');
  await expect(p).not.toContainText('Verb - Aorist Indicative Active - 3rd Person Singular');
  await p.getByRole('button', { name: /more/i }).first().click();
  await expect(p).toContainText('Verb - Aorist Indicative Active - 3rd Person Singular');
  await expect(p.getByRole('button', { name: /Matthew 5:43/ })).toBeVisible();
  await p.getByRole('button', { name: /back/i }).click();
  await expect(p.getByRole('button', { name: /loved/ })).toBeVisible();
});

test('original words: Hebrew is right-to-left in the Hebrew font', async ({ page }) => {
  await page.goto('/app');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(page.locator('.nav-btn-book')).toHaveText('Genesis 1');
  await openOriginalWords(page, 1);
  const p = panel(page);
  await expect(p).toContainText('Hebrew');
  const created = p.getByRole('button', { name: /created/ });
  const hebrew = created.locator('[lang="he"]');
  await expect(hebrew).toHaveAttribute('dir', 'rtl');
  await expect(hebrew).toHaveText('בָּרָ֣א');
  const family = await hebrew.evaluate((el) => getComputedStyle(el).fontFamily);
  expect(family).toMatch(/Noto Serif Hebrew/);
  await created.click();
  await expect(p).toContainText('to create');
  await expect(p).toContainText('verb · completed action · he');
});

test('original words: a verse with no alignment explains itself', async ({ page }) => {
  await page.route('**/api/v1/words/43/3/16', (route) =>
    route.fulfill({ json: { book: 'John', book_number: 43, chapter: 3, verse: 16, translation: 'BSB', words: [] } }));
  await openReaderAt(page, 'John', 3);
  await openOriginalWords(page, 16);
  await expect(panel(page)).toContainText('No original-language words');
});

test('original words: a failed request offers a retry that works', async ({ page }) => {
  let fail = true;
  await page.route('**/api/v1/words/43/3/16', async (route) => {
    if (fail) { fail = false; return route.fulfill({ status: 500, json: { detail: 'boom' } }); }
    return route.fallback();
  });
  await openReaderAt(page, 'John', 3);
  await openOriginalWords(page, 16);
  const p = panel(page);
  await expect(p).toContainText("Couldn't load");
  await p.getByRole('button', { name: /try again/i }).click();
  await expect(p.getByRole('button', { name: /loved/ })).toBeVisible();
});

test('original words: words are requested by book number', async ({ page }) => {
  const seen: string[] = [];
  page.on('request', (r) => { if (r.url().includes('/api/v1/words/')) seen.push(new URL(r.url()).pathname); });
  await openReaderAt(page, 'John', 3);
  await openOriginalWords(page, 16);
  await expect(panel(page).getByRole('button', { name: /loved/ })).toBeVisible();
  expect(seen).toContain('/api/v1/words/43/3/16');
});
