// Regression tests from the verifier review (W0.4). Owned by the orchestrator: do not edit.
import { expect, openReaderAt, revealTopBar, test, verse } from './fixtures';

test('review: selected highlight color is visibly applied', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await verse(page, 16).click();
  await page.getByRole('button', { name: 'blue', exact: true }).click();
  await page.getByRole('button', { name: 'Highlight', exact: true }).click();
  await expect(verse(page, 16)).toHaveCSS('background-color', 'rgb(168, 200, 255)');
});

// W4-2 verifier: the search input ref must stay attached (autofocus on open).
test('review: opening search automatically focuses its input', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await revealTopBar(page);
  await page.getByRole('button', { name: 'Open search' }).click();
  await expect(page.locator('#nav-search-panel')).toBeVisible();
  await expect(page.locator('#nav-search-panel input[type="search"]')).toBeFocused({ timeout: 2_000 });
});
