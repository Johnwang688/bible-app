import { expect, test, type Locator, type Page } from '@playwright/test';

import { mockEntities } from './entityMocks';
import { mockApi, seed } from './helpers';

test.use({ locale: 'en-US', colorScheme: 'light' });
test.beforeEach(async ({ page }, testInfo) => {
  test.skip(testInfo.project.name !== 'desktop', 'Desktop containment only');
  await mockApi(page);
  await mockEntities(page);
  await seed(page, 'language', 'en');
  await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
});

async function noSidewaysScroll(page: Page, scroller?: Locator) {
  expect(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth)).toBe(true);
  if (scroller) expect(await scroller.evaluate((node) => node.scrollWidth <= node.clientWidth + 1)).toBe(true);
}

/** RN Web's scrolling viewport contains the padded content container as its first child. */
async function innerWidth(scroller: Locator) {
  return scroller.locator(':scope > div').first().evaluate((node) => {
    const style = getComputedStyle(node);
    return node.getBoundingClientRect().width - parseFloat(style.paddingLeft) - parseFloat(style.paddingRight);
  });
}

const screens = [
  { name: 'Home', route: '/', scroll: 'home-scroll' },
  { name: 'Me', route: '/me', scroll: 'screen-me-scroll' },
  { name: 'Help', route: '/me/help', scroll: 'screen-help-scroll' },
  { name: 'Search', route: '/search', scroll: 'search-results' },
  { name: 'Study Saved', route: '/study', scroll: 'study-saved' },
  { name: 'Study Explore', route: '/study', scroll: 'explore', explore: true },
  { name: 'Entity', route: '/entities/person/god', scroll: 'entity-content' },
  { name: 'Reader', route: '/bible', scroll: 'reader-scroll', reader: true },
] as const;

for (const width of [1024, 1440, 1920]) {
  for (const screen of screens) {
    test(`${screen.name} stays in its column at ${width}px`, async ({ page }) => {
      await page.setViewportSize({ width, height: 1080 });
      await page.goto(screen.route);
      if ('explore' in screen) await page.getByTestId('study-tab-explore').click();
      const scroll = page.getByTestId(screen.scroll);
      await expect(scroll).toBeVisible();
      if ('explore' in screen) await expect(page.getByTestId('explore-card-person')).toBeVisible();
      let measured: number;
      if ('reader' in screen) {
        const text = page.getByTestId('reader-text');
        await expect(text).toBeVisible();
        measured = (await text.boundingBox())!.width;
        await expect(page.getByTestId('reader-next')).toHaveCount(1);
        await expect(page.getByTestId('reader-prev')).toHaveCount(1);
        if (width === 1440) {
          const book = (await page.getByTestId('reader-book-button').boundingBox())!;
          const scripture = (await text.boundingBox())!;
          expect(Math.abs(book.x - scripture.x)).toBeLessThanOrEqual(1);
        }
      } else {
        measured = await innerWidth(scroll);
      }
      expect(measured).toBeGreaterThan(0);
      expect(measured).toBeLessThanOrEqual(('explore' in screen ? 1040 : 720) + 1);
      await noSidewaysScroll(page, scroll);
    });
  }
}

test('Explore uses equal-height columns at 1024px and stays stable while finding', async ({ page }) => {
  await page.setViewportSize({ width: 1024, height: 1080 });
  await page.goto('/study');
  await page.getByTestId('study-tab-explore').click();
  const cards = page.getByTestId(/^explore-card-/);
  await expect(cards).toHaveCount(3);
  const boxes = await cards.evaluateAll((nodes) => nodes.map((n) => {
    const { x, y, width, height } = n.getBoundingClientRect();
    return { x, y, width, height };
  }));
  expect(Math.max(...boxes.map((b) => b.y)) - Math.min(...boxes.map((b) => b.y))).toBeLessThan(1);
  expect(Math.max(...boxes.map((b) => b.width)) - Math.min(...boxes.map((b) => b.width))).toBeLessThan(1);
  expect(Math.max(...boxes.map((b) => b.height)) - Math.min(...boxes.map((b) => b.height))).toBeLessThan(1);
  expect(boxes[1]!.x).toBeGreaterThan(boxes[0]!.x + boxes[0]!.width);
  const columnWidth = await innerWidth(page.getByTestId('explore'));
  await noSidewaysScroll(page, page.getByTestId('explore'));
  await page.getByTestId('explore-find').fill('God');
  await expect(page.getByTestId('explore-group-person')).toBeVisible();
  expect(await innerWidth(page.getByTestId('explore'))).toBeCloseTo(columnWidth, 0);
  await noSidewaysScroll(page, page.getByTestId('explore'));
  await page.getByTestId('explore-find').fill('zzzzzz');
  await expect(page.getByTestId('explore-no-match')).toBeVisible();
  expect(await innerWidth(page.getByTestId('explore'))).toBeCloseTo(columnWidth, 0);
  await noSidewaysScroll(page, page.getByTestId('explore'));
});

for (const width of [820, 1440]) {
  for (const preset of ['silver', 'strawberry-milk', 'graphite']) {
    test(`bottom bar floats at ${width}px in ${preset}`, async ({ page }) => {
      await page.setViewportSize({ width, height: 1000 });
      await seed(page, 'appearance', { preset, mode: preset === 'graphite' ? 'dark' : 'light' });
      await page.goto('/');
      const bar = page.getByTestId('bottom-bar-background');
      await expect(bar).toBeVisible();
      const box = (await bar.boundingBox())!;
      expect(box.width).toBeGreaterThan(550);
      expect(box.width).toBeLessThanOrEqual(560);
      expect(Math.abs(box.x + box.width / 2 - width / 2)).toBeLessThan(1);
      expect(box.y + box.height).toBeGreaterThanOrEqual(976);
      expect(box.y + box.height).toBeLessThanOrEqual(988);
      await noSidewaysScroll(page);
    });
  }
}

test('767px keeps the full-width outlined bar, uncapped Home and phone wording', async ({ page }) => {
  await page.setViewportSize({ width: 767, height: 1000 });
  await seed(page, 'appearance', { preset: 'strawberry-milk', mode: 'system' });
  await page.goto('/');
  await expect(page.getByTestId('home-scroll')).toBeVisible();
  const bar = (await page.getByTestId('bottom-bar-background').boundingBox())!;
  expect(bar.width).toBeGreaterThanOrEqual(765);
  const home = await innerWidth(page.getByTestId('home-scroll'));
  expect(home).toBeGreaterThan(720);
  expect(home).toBeCloseTo(767 - 32, 0);
  await page.getByTestId('tab-me').click();
  await expect(page.getByTestId('me-row-mode-value')).toHaveText('Follow the phone');
  await noSidewaysScroll(page);
});

async function boxOf(locator: Locator) {
  await expect(locator).toBeVisible();
  const box = await locator.boundingBox();
  expect(box).not.toBeNull();
  return box!;
}

async function reachableInWindow(page: Page, locator: Locator) {
  await locator.scrollIntoViewIfNeeded();
  const box = await boxOf(locator);
  const viewport = page.viewportSize()!;
  expect(box.x).toBeGreaterThanOrEqual(0);
  expect(box.y).toBeGreaterThanOrEqual(0);
  expect(box.x + box.width).toBeLessThanOrEqual(viewport.width + 1);
  expect(box.y + box.height).toBeLessThanOrEqual(viewport.height + 1);
}

test.describe('desktop first run', () => {
  // As in firstRun.spec.ts, no stored onboarding envelope: the intro has not been completed.
  test.use({ storageState: { cookies: [], origins: [] } });
  test.beforeEach(async ({ page }) => {
    await seed(page, 'appearance', { preset: 'strawberry-milk', mode: 'system' });
  });

  for (const [width, height] of [[1280, 720], [1920, 1080]]) {
    test(`Welcome is one centred group and Look follows its content at ${width}x${height}`, async ({ page }) => {
      await page.setViewportSize({ width: width!, height: height! });
      await page.goto('/');
      const welcome = page.getByTestId('first-run-welcome');
      const skip = welcome.getByRole('button', { name: 'Skip', exact: true });
      const started = welcome.getByRole('button', { name: 'Get started', exact: true });
      const skipBox = await boxOf(skip);
      const headingBox = await boxOf(welcome.getByRole('heading'));
      const lineBox = await boxOf(page.getByTestId('welcome-line-card'));
      const verseBox = await boxOf(page.getByTestId('welcome-verse-card'));
      const buttonBox = await boxOf(started);
      await reachableInWindow(page, skip);
      expect(skipBox.y + skipBox.height).toBeLessThanOrEqual(headingBox.y);
      expect(lineBox.y + lineBox.height).toBeLessThanOrEqual(verseBox.y);
      expect(verseBox.y + verseBox.height).toBeLessThanOrEqual(buttonBox.y);
      expect(verseBox.width).toBeLessThanOrEqual(560);
      expect(buttonBox.width).toBeLessThanOrEqual(560);
      const centre = (skipBox.y + buttonBox.y + buttonBox.height) / 2;
      expect(Math.abs(centre - height! / 2)).toBeLessThanOrEqual(40);

      await started.click();
      const pastel = await boxOf(page.getByTestId('look-pastel-card'));
      const glass = await boxOf(page.getByTestId('look-glass-card'));
      const next = await boxOf(page.getByRole('button', { name: 'Continue', exact: true }));
      expect(Math.abs(pastel.y - glass.y)).toBeLessThanOrEqual(1);
      const cardsBottom = Math.max(pastel.y + pastel.height, glass.y + glass.height);
      expect(next.y).toBeGreaterThanOrEqual(cardsBottom);
      if (height === 1080) expect(next.y - cardsBottom).toBeLessThanOrEqual(120);
    });
  }

  test('Welcome and Look remain usable without overlap at 1280x500', async ({ page }) => {
    await page.setViewportSize({ width: 1280, height: 500 });
    await page.goto('/');
    const started = page.getByRole('button', { name: 'Get started', exact: true });
    await reachableInWindow(page, started);
    const verse = await boxOf(page.getByTestId('welcome-verse-card'));
    const button = await boxOf(started);
    expect(verse.y + verse.height).toBeLessThanOrEqual(button.y);

    await started.click();
    const next = page.getByRole('button', { name: 'Continue', exact: true });
    await reachableInWindow(page, next);
    for (const id of ['look-pastel-card', 'look-glass-card']) {
      const card = page.getByTestId(id);
      await card.scrollIntoViewIfNeeded();
      const cardBox = await boxOf(card);
      const nextBox = await boxOf(next);
      expect(cardBox.y + cardBox.height).toBeLessThanOrEqual(nextBox.y);
      await reachableInWindow(page, next);
    }
  });
});
