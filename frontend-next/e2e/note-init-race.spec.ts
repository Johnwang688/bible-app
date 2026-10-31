// Regression test for the startup race found in the W4-6c verifier review (Sol). Owned by the orchestrator: do not edit.
// In dev, Strict Mode runs the init effect twice. On main the first run was not cancelled, so a late /books
// response re-ran setCurrentBook/loadChapter and closed the note editor, losing the draft (the smoke 5 flake).
// This holds any second /books request until the draft is typed, then checks the draft survives.
import { expect, test, verse } from './fixtures';

test('a late duplicate startup does not wipe a note draft', async ({ page }) => {
  let release!: () => void;
  const gate = new Promise<void>(resolve => { release = resolve; });
  let booksCalls = 0;

  await page.route('**/api/v1/books', async route => {
    if (++booksCalls >= 2) await gate;
    await route.fallback();
  });

  try {
    await page.goto('/app?book=John&chapter=3');
    await expect(verse(page, 16)).toBeVisible();

    await verse(page, 16).click();
    await page.getByRole('button', { name: 'Notes', exact: true }).click();
    const input = page.getByPlaceholder('Add a note (optional)...');
    const draft = 'Draft must survive a late duplicate startup';
    await input.fill(draft);

    release();
    // Give a held /books response, and any chapter load it starts, time to land and render.
    await page.waitForTimeout(1500);
    await expect(input).toHaveValue(draft);
    await expect(page.locator('.nav-btn-book')).toHaveText('John 3');
  } finally {
    release();
  }
});
