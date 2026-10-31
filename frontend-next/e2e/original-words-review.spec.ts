// Regression tests from the HG-3a verifier review (Sol), round 1. Owned by the orchestrator: do not edit.
import type { Page } from '@playwright/test';
import { expect, openReaderAt, test, verse } from './fixtures';

const panel = (page: Page) => page.locator('.side-scroll').first();
const verse17 = {
  book: 'John', book_number: 43, chapter: 3, verse: 17, translation: 'BSB',
  words: [{
    english_order: 1, english: 'For', english_kind: 'text', original: 'γὰρ', translit: 'gar', language: 'greek',
    strongs: 'G1063', lemma: 'γάρ', gloss: 'for', grammar: 'joining word', parsing: 'Conjunction',
    parsing_code: 'Conj', footnote: null,
  }],
};

async function openWordsFor(page: Page, n: number) {
  await verse(page, n).click();
  await page.getByRole('button', { name: 'Original words', exact: true }).click();
}

test('F4: opening a word card moves focus to its heading', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await openWordsFor(page, 16);
  await panel(page).getByRole('button', { name: /loved/ }).click();
  await expect(panel(page).getByRole('heading', { name: 'ἀγαπάω' })).toBeFocused();
});

test('F2: leaving a verse discards its open card; coming back shows the list', async ({ page }) => {
  await page.route('**/api/v1/words/43/3/17', (route) => route.fulfill({ json: verse17 }));
  await openReaderAt(page, 'John', 3);
  await openWordsFor(page, 16);
  await panel(page).getByRole('button', { name: /loved/ }).click();
  await expect(panel(page).getByRole('heading', { name: 'ἀγαπάω' })).toBeVisible();
  await openWordsFor(page, 17);
  await expect(panel(page)).toContainText('John 3:17');
  await openWordsFor(page, 16);
  await expect(panel(page)).toContainText('John 3:16');
  await expect(panel(page).getByRole('button', { name: /loved/ })).toBeVisible();
  await expect(panel(page).getByRole('heading', { name: 'ἀγαπάω' })).toHaveCount(0);
});

test('F3: revisiting a verse that failed shows Loading, not the old error, while it refetches', async ({ page }) => {
  let calls16 = 0;
  let release!: () => void;
  const held = new Promise<void>((r) => { release = r; });
  await page.route('**/api/v1/words/43/3/16', async (route) => {
    calls16 += 1;
    if (calls16 === 1) return route.fulfill({ status: 500, json: { detail: 'boom' } });
    await held;
    return route.fallback();
  });
  await page.route('**/api/v1/words/43/3/17', (route) => route.fulfill({ json: verse17 }));
  await openReaderAt(page, 'John', 3);
  await openWordsFor(page, 16);
  await expect(panel(page)).toContainText("Couldn't load");
  await openWordsFor(page, 17);
  await expect(panel(page)).toContainText('John 3:17');
  await openWordsFor(page, 16);
  await expect(panel(page)).toContainText('Loading');
  await expect(panel(page)).not.toContainText("Couldn't load");
  release();
  await expect(panel(page).getByRole('button', { name: /loved/ })).toBeVisible();
});

test('F5 (orchestrator): after Original words opens, tapping another verse brings up its popup', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await openWordsFor(page, 16);
  await expect(panel(page).getByRole('button', { name: /loved/ })).toBeVisible();
  await verse(page, 20).click();
  const popup = page.locator('.verse-study-popup');
  await expect(popup).toBeVisible();
  await expect(popup.locator('.verse-study-title')).toHaveText('John 3:20');
  // The popup must not cover the words panel.
  const pop = await popup.boundingBox();
  const pane = await panel(page).boundingBox();
  expect(pop && pane && pop.x + pop.width <= pane.x + 1).toBeTruthy();
});
