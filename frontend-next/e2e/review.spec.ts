// Regression tests from the verifier review (W0.4). Owned by the orchestrator: do not edit.
import { expect, openReaderAt, test, verse } from './fixtures';

test('review: selected highlight color is visibly applied', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await verse(page, 16).click();
  await page.getByRole('button', { name: 'blue', exact: true }).click();
  await page.getByRole('button', { name: 'Highlight', exact: true }).click();
  await expect(verse(page, 16)).toHaveCSS('background-color', 'rgb(168, 200, 255)');
});
