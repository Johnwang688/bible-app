// Acceptance (INT, orchestrator-owned; the implementer may not edit it): the wiring after the 11-02 merges.
// The sign-in gate (closed until the intro is done, off for Under 13), the mounts on Me and Customise, and the
// aurora on every app-background screen (never behind Scripture). Firebase is never reached: the signed-out
// card needs no network, and every Google host is refused below.
import { expect, test, type Page } from '@playwright/test';

import { mockEntities } from './entityMocks';
import { mockApi, seed } from './helpers';

/** Refuses every Google/Firebase host and records what was asked for. */
async function offline(page: Page): Promise<string[]> {
  const asked: string[] = [];
  await page.route(/googleapis\.com|google\.com|gstatic\.com|firebaseapp\.com|firebaseio\.com/, (route) => {
    asked.push(route.request().url());
    return route.abort();
  });
  return asked;
}

async function openMe(page: Page) {
  await page.getByTestId('tab-me').click();
  await expect(page.getByTestId('screen-me')).toBeVisible();
}

test.describe('the sign-in gate (empty device)', () => {
  test.use({ storageState: { cookies: [], origins: [] }, locale: 'en-US' });

  async function finishIntro(page: Page, age: string | null) {
    await page.goto('/');
    await expect(page.getByTestId('first-run-welcome')).toBeVisible();
    await page.getByRole('button', { name: 'Get started' }).click();
    await page.getByRole('button', { name: 'Continue' }).click();
    await expect(page.getByTestId('first-run-age')).toBeVisible();
    if (age) await page.getByRole('radio', { name: age }).click();
    await page.getByRole('button', { name: 'Start reading' }).click();
    await expect(page.getByTestId('screen-home')).toBeVisible();
  }

  test('Under 13: Me shows the account card with no way to sign in', async ({ page }) => {
    await mockApi(page);
    await offline(page);
    await finishIntro(page, 'Under 13');
    await openMe(page);
    await expect(page.getByTestId('account-card')).toBeVisible();
    await expect(page.getByTestId('account-sign-in')).toHaveCount(0);
  });

  test('an adult who finished the intro can open sign-in', async ({ page }) => {
    await mockApi(page);
    await offline(page);
    await finishIntro(page, '25–34');
    await openMe(page);
    await expect(page.getByTestId('account-sign-in')).toBeVisible();
  });

  test('intro not done: Me is covered by the intro, and no account card or auth request is made', async ({ page }) => {
    await mockApi(page);
    const asked = await offline(page);
    await page.goto('/me');
    await expect(page.getByTestId('first-run-welcome')).toBeVisible();
    await expect(page.getByTestId('account-card')).toHaveCount(0);
    // The exempt privacy page opens with the intro not done; still no sign-in anywhere.
    await page.goto('/privacy');
    await expect(page.getByTestId('screen-privacy')).toBeVisible();
    await expect(page.getByTestId('account-sign-in')).toHaveCount(0);
    expect(asked.filter((u) => /identitytoolkit|securetoken/.test(u))).toEqual([]);
  });
});

test.describe('mounts on Me and Customise', () => {
  test.use({ locale: 'en-US' });

  test.beforeEach(async ({ page }) => {
    await mockApi(page);
    await offline(page);
  });

  test('the account card sits on Me above the settings groups', async ({ page }) => {
    await page.goto('/');
    await openMe(page);
    const card = await page.getByTestId('account-card').boundingBox();
    const look = await page.getByTestId('me-row-look').boundingBox();
    expect(card).not.toBeNull();
    expect(card!.y).toBeLessThan(look!.y);
    await expect(page.getByTestId('account-sign-in')).toBeVisible();
  });

  test('the daily-goal row shows the goal and opens the goal sheet; a change shows on the row', async ({ page }) => {
    await page.goto('/');
    await openMe(page);
    const row = page.getByTestId('me-row-goal');
    await expect(row).toContainText('Daily goal');
    const before = (await row.textContent()) ?? '';
    await row.click();
    await expect(page.getByTestId('goal-sheet')).toBeVisible();
    await page.getByTestId('goal-plus').click();
    await page.getByTestId('goal-sheet-close').click();
    await expect(page.getByTestId('goal-sheet')).toHaveCount(0);
    await expect(row).not.toHaveText(before);
    await expect(row).toContainText('min');
  });

  test('the language sheet labels Chinese as beta and describes it with the note (web beta build)', async ({ page }) => {
    await page.goto('/');
    await openMe(page);
    await page.getByTestId('me-row-language').click();
    const zh = page.getByTestId('me-language-zh-Hans');
    await expect(zh).toContainText('简体中文（测试版）');
    const note = page.getByTestId('me-language-beta-note');
    await expect(note).toHaveText('The Chinese interface is in beta. Some wording may still change.');
    const noteId = await note.getAttribute('id');
    expect(noteId).toBeTruthy();
    await expect(zh).toHaveAttribute('aria-describedby', noteId!);
    // Full text colour, not the muted one: the same colour as the sheet's title.
    const colour = (sel: ReturnType<Page['getByTestId']>) => sel.evaluate((el) => getComputedStyle(el).color);
    const title = page.getByTestId('me-language-sheet').getByRole('heading', { name: 'App language' });
    expect(await colour(note)).toBe(await colour(title));
  });

  test('About links to the privacy policy', async ({ page }) => {
    await page.goto('/');
    await openMe(page);
    await page.getByTestId('me-row-about').click();
    await expect(page.getByTestId('screen-about')).toBeVisible();
    await page.getByTestId('about-privacy-link').click();
    await expect(page).toHaveURL(/\/privacy$/);
    await expect(page.getByTestId('screen-privacy')).toBeVisible();
  });

  test('Customise shows the moving-background option', async ({ page }) => {
    await page.goto('/');
    await openMe(page);
    await page.getByTestId('me-row-look').click();
    await expect(page.getByTestId('screen-customise')).toBeVisible();
    await expect(page.getByTestId('aurora-option')).toBeVisible();
    await expect(page.getByTestId('aurora-option-fluid')).toBeVisible();
  });
});

test.describe('the aurora on app-background screens (Silver, a glass look)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test.beforeEach(async ({ page }) => {
    await mockApi(page);
    await offline(page);
  });

  const aurora = (page: Page, screen: string) => page.getByTestId(screen).getByTestId('aurora-background');

  test('Study, the Me sub-screens and the privacy page', async ({ page }) => {
    await page.goto('/');
    await page.getByTestId('tab-study').click();
    await expect(aurora(page, 'screen-study')).toHaveCount(1);

    await openMe(page);
    await expect(aurora(page, 'screen-me')).toHaveCount(1);
    for (const [row, screen, back] of [
      ['me-row-look', 'screen-customise', 'customise-back'],
      ['me-row-sources', 'screen-sources', 'sources-back'],
      ['me-row-about', 'screen-about', 'about-back'],
      ['me-row-help', 'screen-help', 'help-back'],
    ] as const) {
      await page.getByTestId(row).click();
      await expect(aurora(page, screen)).toHaveCount(1);
      await page.getByTestId(back).click();
      await expect(page.getByTestId('screen-me')).toBeVisible();
    }
    await page.getByTestId('me-row-look').click();
    await page.getByTestId('customise-advanced').click();
    await expect(aurora(page, 'screen-advanced')).toHaveCount(1);

    await page.goto('/privacy');
    await expect(aurora(page, 'screen-privacy')).toHaveCount(1);
  });

  test('Explore: the entity list and an entity page', async ({ page }) => {
    await mockEntities(page);
    await page.goto('/entities/person');
    await expect(aurora(page, 'screen-entity-list')).toHaveCount(1);
    await page.goto('/entities/person/god');
    await expect(aurora(page, 'screen-entity')).toHaveCount(1);
  });

  test('Memory home and week, but never the trainer (Scripture) or the reader', async ({ page }) => {
    await page.goto('/study/memory');
    await expect(aurora(page, 'memory-home')).toHaveCount(1);
    await page.goto('/study/memory/week');
    await expect(aurora(page, 'memory-week')).toHaveCount(1);
    await page.goto('/memory/lesson/2-corinthians-5-17/fill-blank');
    await expect(page.getByTestId('memory-trainer')).toBeVisible();
    await expect(aurora(page, 'memory-trainer')).toHaveCount(0);
    await page.goto('/');
    await page.getByTestId('tab-bible').click();
    await expect(page.getByTestId('screen-bible').getByTestId('aurora-background')).toHaveCount(0);
  });

  test('the aurora carries no aurora into a pastel look', async ({ page }) => {
    await seed(page, 'appearance', { preset: 'strawberry-milk', mode: 'light' });
    await page.goto('/');
    await page.getByTestId('tab-study').click();
    await expect(page.getByTestId('screen-study')).toBeVisible();
    await expect(aurora(page, 'screen-study')).toHaveCount(0);
  });
});
