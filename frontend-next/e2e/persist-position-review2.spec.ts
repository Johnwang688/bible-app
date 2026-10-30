// Regression test from the verifier re-check (persistence round 2). Owned by the orchestrator: do not edit.
import { expect, test } from './fixtures';

for (const position of [
  { book: 42, chapter: 3 },
  { book: 'John', chapter: 3, translation: 42 },
]) {
  test(`invalid saved position ${JSON.stringify(position)}`, async ({ page }) => {
    await page.addInitScript(value => {
      localStorage.setItem(
        'bible-app-last-position',
        JSON.stringify(value),
      );
    }, position);

    await page.goto('/app');
    await page.getByRole('button', { name: 'Bible reader' }).click();
    await expect(page.locator('.verse-line').first()).toBeVisible();
  });
}
