// Root-cause test for the reload-persistence bug: storage written before the app mounts must survive mount.
// Owned by the orchestrator: do not edit.
import { expect, openReaderAt, test, verse } from './fixtures';

const HIGHLIGHTS_KEY = 'bible-app-highlights';
const NOTES_KEY = 'bible-app-notes';
const BOOKMARKS_KEY = 'bible-app-bookmarks';

test('persist: storage present before first mount is kept and shown', async ({ page }) => {
  await page.addInitScript(([h, n, b]) => {
    if (!sessionStorage.getItem('seeded')) {
      localStorage.setItem(h, JSON.stringify(['john::3::16']));
      localStorage.setItem(n, JSON.stringify({
        'john::3::16': { key: 'john::3::16', book: 'John', chapter: 3, verse: 16, text: 'Seeded note', updatedAt: 1 },
      }));
      localStorage.setItem(b, JSON.stringify(['john::3::17']));
      sessionStorage.setItem('seeded', '1');
    }
  }, [HIGHLIGHTS_KEY, NOTES_KEY, BOOKMARKS_KEY]);

  await openReaderAt(page, 'John', 3);
  await expect(verse(page, 16)).toHaveClass(/verse-line--highlighted/);
  await expect(verse(page, 16)).toHaveClass(/verse-line--noted/);
  const stored = await page.evaluate(([h, n, b]) => [localStorage.getItem(h), localStorage.getItem(n), localStorage.getItem(b)],
    [HIGHLIGHTS_KEY, NOTES_KEY, BOOKMARKS_KEY]);
  expect(JSON.parse(stored[0] ?? '[]')).toEqual(['john::3::16']);
  expect(JSON.parse(stored[1] ?? '{}')['john::3::16']?.text).toBe('Seeded note');
  expect(JSON.parse(stored[2] ?? '[]')).toEqual(['john::3::17']);
});
