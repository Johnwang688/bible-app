// Web e2e for R-5 part 2: Study → Explore, the people, places and themes lists and pages. Orchestrator-owned.
import { expect, test } from '@playwright/test';

import { mockEntities } from './entityMocks';
import { mockApi, seed } from './helpers';

test.beforeEach(async ({ page }) => {
  await mockApi(page);
  await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
});

test.describe('Explore and entities (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('Explore → See all → a person → a chapter opens in the Bible', async ({ page }) => {
    await mockEntities(page);
    await page.goto('/study');
    await page.getByTestId('study-tab-explore').click();
    await expect(page.getByTestId('explore-card-person')).toContainText('467');
    await page.getByTestId('explore-find').fill('jo');
    await page.getByTestId('explore-see-all-person').click();
    await expect(page).toHaveURL(/\/entities\/person\?q=jo$/);
    await expect(page.getByTestId('entity-filter')).toHaveValue('jo');
    await expect(page.getByTestId('entity-list-count')).toHaveText('17 matches');
    await page.getByTestId('entity-row-joab').click();
    await expect(page).toHaveURL(/\/entities\/person\/joab$/);
    await expect(page.getByTestId('entity-title')).toHaveText('Joab');
    await page.getByTestId('entity-chapter-1-1').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('verse-1')).toBeVisible();
    await expect(page.getByTestId('reader-header')).toContainText('Genesis');
  });

  test('Back from a page returns to the list, then to Explore', async ({ page }) => {
    await mockEntities(page);
    await page.goto('/study');
    await page.getByTestId('study-tab-explore').click();
    await page.getByTestId('explore-card-place').click();
    await expect(page).toHaveURL(/\/entities\/place$/);
    await page.getByTestId('entity-row-achaia').click();
    await expect(page.getByTestId('entity-title')).toHaveText('Achaia');
    // The web stack keeps the list mounted under the page: press the page's own Back.
    await page.getByTestId('screen-entity').getByTestId('entity-back').click();
    await expect(page).toHaveURL(/\/entities\/place$/);
    await page.getByTestId('screen-entity-list').getByTestId('entity-back').click();
    await expect(page).toHaveURL(/\/study$/);
  });

  test('the people jump bar scrolls to a letter', async ({ page }) => {
    await mockEntities(page);
    await page.goto('/entities/person');
    await expect(page.getByTestId('entity-row-aaron')).toBeVisible();
    await page.getByTestId('entity-jump-M').click();
    await expect(page.getByTestId('entity-section-M')).toBeInViewport();
  });

  test('a timeline reference opens the verse in context', async ({ page }) => {
    await mockEntities(page);
    await page.goto('/entities/person/god');
    await expect(page.getByTestId('entity-event-0')).toHaveAttribute('aria-expanded', 'true');
    await page.getByTestId('entity-dev-0-0').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('verse-1-tools')).toHaveAttribute('aria-selected', 'true');
  });

  test('an unknown page says so, and Back with no history goes to Study', async ({ page }) => {
    await mockEntities(page);
    await page.goto('/entities/person/nobody');
    await expect(page.getByTestId('entity-not-found')).toBeVisible();
    await expect(page.getByTestId('entity-retry')).toHaveCount(0);
    await page.getByTestId('entity-back').click();
    await expect(page).toHaveURL(/\/study$/);
  });

  test('the lists failing shows Try again and a disabled field', async ({ page }) => {
    await mockEntities(page, { listsDown: true });
    await page.goto('/study');
    await page.getByTestId('study-tab-explore').click();
    await expect(page.getByTestId('explore-error')).toBeVisible();
    await expect(page.getByTestId('explore-find')).toBeDisabled();
  });
});

test.describe('Entities in Chinese', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'dark' });

  test('Chinese labels, English names with 英文', async ({ page }) => {
    await mockEntities(page);
    await page.goto('/entities/person/god');
    await expect(page.getByTestId('entity-kind')).toHaveText('人物');
    await expect(page.getByTestId('entity-book-1')).toContainText('创世记');
    await expect(page.getByText('英文').first()).toBeVisible();
    await page.goto('/study');
    await page.getByTestId('study-tab-explore').click();
    await page.getByTestId('explore-find').fill('亚伯拉罕');
    await expect(page.getByTestId('explore-no-match')).toContainText('人物、地点和主题目前只有英文名称，请用英文查找');
  });
});

for (const [locale, name] of [['en-US', 'English'], ['zh-CN', 'Chinese']] as const) {
  test.describe(`Entities layout at 150% display scale (${name})`, () => {
    test.use({ locale, viewport: { width: 260, height: 560 }, deviceScaleFactor: 1.5 });
    test('nothing runs off the screen', async ({ page }) => {
      await mockEntities(page);
      for (const url of ['/entities/person/god', '/entities/person', '/entities/theme']) {
        await page.goto(url);
        await expect(page.getByTestId(/^screen-entity/).first()).toBeVisible();
        await expect(page.getByTestId('entity-back')).toBeVisible();
        expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(260);
      }
      await page.goto('/study');
      await page.getByTestId('study-tab-explore').click();
      await expect(page.getByTestId('explore-card-theme')).toBeVisible();
      expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(260);
    });
  });
}
