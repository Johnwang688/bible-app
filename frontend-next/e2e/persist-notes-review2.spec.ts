// Regression test from the verifier re-check (persistence round 2). Owned by the orchestrator: do not edit.
import { expect, test, verse } from './fixtures';

for (const bad of [null, 42, false, 'saved', [], {}]) {
  test(`invalid note ${JSON.stringify(bad)} cannot crash reader`, async ({ page }) => {
    await page.addInitScript(value => {
      localStorage.setItem('bible-app-notes', JSON.stringify({
        'john::3::16': value,
        'john::3::17': {
          key: 'john::3::17',
          book: 'John',
          chapter: 3,
          verse: 17,
          text: 'Preserved note',
          updatedAt: 1,
        },
      }));
    }, bad);

    await page.goto('/app?book=John&chapter=3&panel=study');
    await expect(verse(page, 16)).toBeVisible();

    expect(await page.evaluate(() =>
      JSON.parse(localStorage.getItem('bible-app-notes') ?? '{}')
        ['john::3::17']?.text
    )).toBe('Preserved note');
  });
}
