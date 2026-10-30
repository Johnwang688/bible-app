// Acceptance test for W4-6c (study items context). Owned by the orchestrator: do not edit.
// persist.spec.ts and persist-goal-review.spec.ts pin highlights, notes, bookmarks and the daily goal;
// this pins the other two study stores, recent passages and reading progress.
import { expect, pickChapter, test, verse } from './fixtures';

const RECENT_KEY = 'bible-app-recent-passages';
const PROGRESS_KEY = 'bible-app-reading-progress';

test('study items: recent passages and reading progress stored before mount are kept across reload', async ({ page }) => {
  await page.addInitScript(([recentKey, progressKey]) => {
    if (!sessionStorage.getItem('study-seeded')) {
      localStorage.setItem(recentKey, JSON.stringify([
        { book: 'Genesis', chapter: 5, translation: 'WEB', savedAt: 1 },
      ]));
      localStorage.setItem(progressKey, JSON.stringify({
        // The fixtures pin the clock to 2026-03-10.
        streak: 3,
        goalMetDays: ['2026-03-07', '2026-03-08', '2026-03-09'],
        todayIso: '2026-03-10',
        todayChapters: [],
        todayChapterEvidence: {},
        todayActiveLearningMs: 4 * 60_000,
        todaySpokeToAi: false,
      }));
      sessionStorage.setItem('study-seeded', '1');
    }
  }, [RECENT_KEY, PROGRESS_KEY]);

  const stored = () => page.evaluate(([recentKey, progressKey]) => ({
    recent: JSON.parse(localStorage.getItem(recentKey) ?? 'null'),
    progress: JSON.parse(localStorage.getItem(progressKey) ?? 'null'),
  }), [RECENT_KEY, PROGRESS_KEY]);
  const hasSeededRecent = (recent: unknown) => Array.isArray(recent)
    && recent.some(r => r?.book === 'Genesis' && r?.chapter === 5);

  // The home screen shows the seeded streak and today's minutes only if the stored progress was loaded.
  const expectSeededProgressShown = async () => {
    await expect(page.locator('.home-streak-number')).toHaveText('3');
    await expect(page.locator('.home-screen')).toContainText('4/10 min active today');
  };

  await page.goto('/app');
  await expectSeededProgressShown();
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(page.locator('.verse-line').first()).toBeVisible();
  await pickChapter(page, 'John', 3);
  await expect(verse(page, 16)).toBeVisible();
  // Opening John 3 adds it to the recent list; the seeded entry must still be there.
  await expect.poll(async () => hasSeededRecent((await stored()).recent)).toBe(true);
  await expect.poll(async () => (await stored()).progress?.goalMetDays).toEqual(['2026-03-07', '2026-03-08', '2026-03-09']);

  await page.reload();
  await expectSeededProgressShown();
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(verse(page, 16)).toBeVisible();
  await expect.poll(async () => hasSeededRecent((await stored()).recent)).toBe(true);
});
