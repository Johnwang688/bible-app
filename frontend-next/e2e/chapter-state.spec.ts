// Bug: restoring a passage (deep link or saved position) renders the chapter but leaves the app's chapter state at 1.
// Owned by the orchestrator: do not edit.
import { expect, openReaderAt, revealTopBar, test, verse } from './fixtures';

test('chapter state: deep link /app?book=John&chapter=3 opens John 3 consistently', async ({ page }) => {
  await page.goto('/app?book=John&chapter=3');
  await expect(verse(page, 16)).toBeVisible();
  await revealTopBar(page);
  await expect(page.locator('.nav-btn-book')).toHaveText('John 3');
  await verse(page, 16).click();
  await expect(page.locator('.verse-study-title')).toHaveText('John 3:16');
});

test('chapter state: saved position restores John 3 consistently after a reload', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await page.reload();
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(verse(page, 16)).toBeVisible();
  await revealTopBar(page);
  await expect(page.locator('.nav-btn-book')).toHaveText('John 3');
  await verse(page, 16).click();
  await expect(page.locator('.verse-study-title')).toHaveText('John 3:16');
  await page.getByRole('button', { name: 'Highlight', exact: true }).click();
  const stored = await page.evaluate(() => localStorage.getItem('bible-app-highlights'));
  expect(JSON.parse(stored ?? '[]')).toEqual(['john::3::16']);
});
