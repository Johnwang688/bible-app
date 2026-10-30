// Acceptance test for W4-6a (reader settings context). Owned by the orchestrator: do not edit.
import { expect, openReaderAt, revealTaskbar, test, verse } from './fixtures';

const KEY = 'bible-app-reader-settings';

test('reader settings: stored before mount are kept, and a change survives reload', async ({ page }) => {
  await page.addInitScript((key) => {
    if (!sessionStorage.getItem('settings-seeded')) {
      localStorage.setItem(key, JSON.stringify({ readerFont: 'charter', lineHeight: '2' }));
      sessionStorage.setItem('settings-seeded', '1');
    }
  }, KEY);

  const stored = () => page.evaluate((key) => JSON.parse(localStorage.getItem(key) ?? 'null'), KEY);
  const domFont = () => page.evaluate(() => document.documentElement.dataset.readerFont);

  await openReaderAt(page, 'John', 3);
  await expect.poll(domFont).toBe('charter');
  expect((await stored())?.readerFont).toBe('charter');

  await revealTaskbar(page);
  await page.getByRole('button', { name: 'Settings', exact: true }).click();
  const fontSelect = page.locator('label.settings-field', { hasText: 'Reading font' }).locator('select');
  await expect(fontSelect).toHaveValue('charter');
  await fontSelect.selectOption('palatino');
  await expect.poll(async () => (await stored())?.readerFont).toBe('palatino');
  await page.getByRole('button', { name: 'Close settings' }).click();

  await page.reload();
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(verse(page, 16)).toBeVisible();
  await expect.poll(domFont).toBe('palatino');
  expect((await stored())?.readerFont).toBe('palatino');
  await revealTaskbar(page);
  await page.getByRole('button', { name: 'Settings', exact: true }).click();
  await expect(fontSelect).toHaveValue('palatino');
});
