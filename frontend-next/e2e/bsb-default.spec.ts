// Acceptance test for HG-3b (BSB becomes the default translation). Owned by the orchestrator: do not edit.
// These specs opt out of the suite's saved-WEB-position seed, so they see what a brand-new reader sees.
import { expect, revealTaskbar, revealTopBar, test, verse } from './fixtures';

test.use({ seedWebPosition: false });

const LAST_POSITION = 'bible-app-last-position';
const storedPosition = (page: import('@playwright/test').Page) =>
  page.evaluate((k) => JSON.parse(localStorage.getItem(k) ?? 'null'), LAST_POSITION);

test('a new reader starts in the BSB', async ({ page }) => {
  await page.goto('/app');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(page.locator('.nav-btn-book')).toHaveText('Genesis 1');
  await expect(page.getByRole('button', { name: 'BSB' })).toBeVisible();
  await expect(verse(page, 2)).toContainText('formless and void');
  await expect.poll(async () => (await storedPosition(page))?.translation).toBe('BSB');
});

test('a reader with a saved WEB position keeps WEB', async ({ page }) => {
  await page.addInitScript((k) => {
    if (!sessionStorage.getItem('pos-seeded')) {
      localStorage.setItem(k, JSON.stringify({ book: 'John', chapter: 3, translation: 'WEB' }));
      sessionStorage.setItem('pos-seeded', '1');
    }
  }, LAST_POSITION);
  await page.goto('/app');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(page.locator('.nav-btn-book')).toHaveText('John 3');
  await expect(page.getByRole('button', { name: 'WEB' })).toBeVisible();
  await expect(verse(page, 16)).toContainText('that he gave his one and only Son');
});

test('the version picker offers the BSB (and still hides the KJV, which has no text)', async ({ page }) => {
  await page.goto('/app');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(verse(page, 2)).toContainText('formless and void');
  await revealTopBar(page);
  await page.getByRole('button', { name: 'BSB' }).click();
  const panel = page.locator('.version-panel');
  await expect(panel).toContainText('Berean Standard Bible');
  await expect(panel).not.toContainText('King James');
  await panel.getByRole('button', { name: /World English Bible/ }).click();
  await expect(page.getByRole('button', { name: 'WEB' })).toBeVisible();
  await expect(verse(page, 2)).toContainText('formless and empty');
  await expect.poll(async () => (await storedPosition(page))?.translation).toBe('WEB');
});

test('settings credit the BSB and the STEP Bible lexicon', async ({ page }) => {
  await page.goto('/app');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(verse(page, 2)).toBeVisible();
  await revealTaskbar(page);
  await page.getByRole('button', { name: 'Settings', exact: true }).click();
  const settings = page.locator('.settings-overlay');
  await expect(settings).toContainText('Berean Standard Bible');
  await expect(settings).toContainText(/public domain/i);
  await expect(settings).toContainText('STEP Bible');
  await expect(settings).toContainText('CC BY 4.0');
  await expect(settings.locator('a[href*="stepbible.org"]')).toHaveCount(1);
});

test('the guided tour stays in the reader\'s translation', async ({ page }) => {
  await page.goto('/app');
  await page.getByRole('button', { name: 'Start tutorial' }).click();
  await page.getByRole('button', { name: 'Next', exact: true }).click();
  await expect(page.locator('.nav-btn-book')).toHaveText('John 3');
  await expect(page.locator('.tutorial-description')).toContainText('(BSB)');
  await expect(page.getByRole('button', { name: 'BSB' })).toBeVisible();
});
