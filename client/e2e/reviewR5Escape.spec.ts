// R-5 part 2 review (orchestrator + Sol r1 entities F1): Escape goes back exactly one screen, from the field too,
// and never reaches the screens kept mounted underneath.
import { expect, test } from '@playwright/test';

import { mockEntities } from './entityMocks';
import { mockApi, seed } from './helpers';

test.use({ locale: 'en-US' });

test.beforeEach(async ({ page }) => {
  await mockApi(page);
  await mockEntities(page);
  await page.route('**/api/v1/search', (route) => route.fulfill({ json: [] }));
  await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
});

test('Sol F1: Escape returns from a person to the list without skipping it', async ({ page }) => {
  await page.goto('/study');
  await page.getByTestId('study-tab-explore').click();
  await page.getByTestId('explore-card-person').click();
  await expect(page).toHaveURL(/\/entities\/person$/);
  await page.getByTestId('entity-row-aaron').click();
  await expect(page.getByTestId('entity-title')).toHaveText('Aaron');
  await page.keyboard.press('Escape');
  await expect(page).toHaveURL(/\/entities\/person$/);
  await expect(page.getByTestId('entity-list-title')).toHaveText('People');
});

test('Escape from inside the list’s filter field goes back', async ({ page }) => {
  await page.goto('/study');
  await page.getByTestId('study-tab-explore').click();
  await page.getByTestId('explore-card-place').click();
  await page.getByTestId('entity-filter').fill('beth');
  await expect(page.getByTestId('entity-filter')).toBeFocused();
  await page.keyboard.press('Escape');
  await expect(page).toHaveURL(/\/study$/);
});

test('an entity opened from search: Escape returns to search, then to the reader', async ({ page }) => {
  await page.goto('/bible');
  await page.getByTestId(/^(reader-search-button|rail-search)$/).click();
  await page.getByTestId('search-input').fill('joab');
  await page.getByTestId('search-entity-person-joab').click();
  await expect(page.getByTestId('entity-title')).toHaveText('Joab');
  await page.keyboard.press('Escape');
  await expect(page).toHaveURL(/\/search$/);
  await expect(page.getByTestId('search-input')).toHaveValue('joab');
  await page.getByTestId('search-input').focus();
  await page.keyboard.press('Escape');
  await expect(page).toHaveURL(/\/bible$/);
});

test('Escape on search leaves the reader’s open verse sheet alone', async ({ page }) => {
  await page.goto('/bible');
  await page.getByText(/For God so loved the world/).click();
  await expect(page.getByTestId('verse-sheet')).toBeVisible();
  // The header collapses under the sheet; bring it back, then open search.
  const show = page.getByRole('button', { name: 'Show reading controls' });
  if (await show.isVisible()) await show.click();
  await page.getByTestId(/^(reader-search-button|rail-search)$/).click();
  await expect(page.getByTestId('search-input')).toBeFocused();
  await page.keyboard.press('Escape');
  await expect(page).toHaveURL(/\/bible$/);
  await expect(page.getByTestId('verse-sheet')).toBeVisible();
});
