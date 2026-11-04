import { expect, test, type Locator, type Page } from '@playwright/test';

import { mockEntities } from './entityMocks';
import { mockApi, seed } from './helpers';
import { readerColumn } from '../src/reader/readerColumn';

test.use({ locale: 'en-US', colorScheme: 'light' });
test.beforeEach(async ({ page }, testInfo) => {
  test.skip(testInfo.project.name !== 'desktop' && !testInfo.title.includes('pointer capability'), 'Desktop containment only');
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
      await expect(page.getByTestId('side-rail')).toBeVisible();
      await expect(page.getByTestId('bottom-bar-background')).toBeHidden();
      for (const name of ['home', 'bible', 'study', 'me']) await expect(page.getByTestId(`tab-${name}`)).toHaveCount(1);
      const rail = width < 1280 ? 88 : 208;
      const box = 'reader' in screen ? await boxOf(page.getByTestId('reader-text')) : await boxOf(scroll.locator(':scope > div').first());
      expect(box.x).toBeGreaterThanOrEqual(rail);
      expect(Math.abs(box.x + box.width / 2 - (width + rail) / 2)).toBeLessThanOrEqual(1);
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

for (const width of [820]) {
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

for (const width of [1024, 1440, 1920]) {
  test(`privacy keeps the overlay rail and clears it at ${width}`, async ({ page }) => {
    await page.setViewportSize({ width, height: 900 });
    await page.goto('/privacy');
    await expect(page.getByTestId('side-rail')).toBeVisible();
    const card = await boxOf(page.getByTestId('privacy-short'));
    const rail = width < 1280 ? 88 : 208;
    expect(card.x).toBeGreaterThanOrEqual(rail);
    expect(Math.abs(card.x + card.width / 2 - (width + rail) / 2)).toBeLessThan(1);
    await noSidewaysScroll(page);
  });

  test(`rail navigation, search shortcuts and lesson hiding at ${width}`, async ({ page }) => {
    await page.setViewportSize({ width, height: 900 });
    await page.goto('/');
    await expect(page.getByTestId('tab-home')).toHaveAttribute('aria-current', 'page');
    await page.keyboard.press('/');
    await expect(page).toHaveURL(/\/search$/);
    await expect(page.getByTestId('side-rail')).toBeVisible();
    await expect(page.locator('[data-testid^="tab-"][aria-current]')).toHaveCount(0);
    await page.getByTestId('search-input').fill('typing');
    await page.keyboard.press('/');
    await expect(page.getByTestId('search-input')).toHaveValue('typing/');
    await page.keyboard.press('Control+k');
    await expect(page.getByTestId('search-input')).toHaveValue('typing/');
    await page.getByTestId('tab-bible').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('reader-search-button')).toHaveCount(0);
    await page.keyboard.press('Control+k');
    await expect(page).toHaveURL(/\/search$/);
    await page.getByTestId('tab-study').click();
    await expect(page).toHaveURL(/\/study$/);
    await page.goto('/entities/person/god');
    await expect(page.getByTestId('tab-study')).toHaveAttribute('aria-current', 'page');
    await page.getByTestId('tab-home').click();
    await expect(page).toHaveURL(/\/$/);
    await page.goBack();
    await expect(page.getByTestId('side-rail')).toBeVisible();
    await page.goto('/memory/lesson/2-corinthians-5-17/fill-blank');
    await expect(page.getByTestId('memory-step')).toBeVisible();
    await expect(page.getByTestId('side-rail')).toHaveCount(0);
    await expect(page.getByTestId('bottom-bar-background')).toBeHidden();
    await noSidewaysScroll(page);
  });
}

for (const [width, columns] of [[1024, 3], [820, 2], [1120, 3], [1440, 3]]) {
  test(`People reads across ${columns} columns at ${width}, with sticky unclipped jumps`, async ({ page }) => {
    await page.setViewportSize({ width: width!, height: 900 });
    await page.goto('/entities/person');
    const rows = page.getByTestId(/^entity-row-/);
    await expect(rows.first()).toBeVisible();
    const boxes = await rows.evaluateAll((nodes) => nodes.slice(0, 4).map((node) => {
      const { x, y, width } = node.getBoundingClientRect(); return { x, y, width };
    }));
    expect(boxes[1]!.x).toBeGreaterThan(boxes[0]!.x);
    expect(boxes[columns! - 1]!.y).toBeCloseTo(boxes[0]!.y, 0);
    expect(boxes[columns!]!.y).toBeGreaterThan(boxes[0]!.y);
    const jump = page.getByTestId('entity-jump');
    const bounds = await boxOf(jump);
    const letterTops: number[] = [];
    for (const letter of await page.getByTestId(/^entity-jump-[A-Z]$/).all()) {
      const box = await boxOf(letter);
      letterTops.push(box.y);
      expect(box.width).toBeGreaterThanOrEqual(44);
      expect(box.height).toBeGreaterThanOrEqual(44);
      expect(box.x).toBeGreaterThanOrEqual(bounds.x);
      expect(box.x + box.width).toBeLessThanOrEqual(bounds.x + bounds.width + 1);
    }
    if (width! >= 1120) expect(Math.max(...letterTops) - Math.min(...letterTops)).toBeLessThanOrEqual(1);
    if (width === 1024) {
      const search = page.getByTestId('rail-search');
      await expect(search).toHaveAccessibleName('Search');
      await expect(search).toHaveText('');
    }
    if (width! >= 1024) {
      await expect(page.getByRole('navigation', { name: 'Main', exact: true })).toBeVisible();
      const search = await boxOf(page.getByTestId('rail-search'));
      expect(search.height).toBe(44);
      const home = await boxOf(page.getByTestId('tab-home'));
      const bible = await boxOf(page.getByTestId('tab-bible'));
      expect(home.height).toBe(width! < 1280 ? 52 : 48);
      expect(bible.y - (home.y + home.height)).toBe(4);
    }
    await page.getByTestId('entity-jump-M').click();
    const section = page.getByTestId('entity-section-M');
    await expect(section).toBeInViewport();
    await expect.poll(async () => {
      const sectionBox = await boxOf(section);
      const jumpBox = await boxOf(jump);
      return sectionBox.y - jumpBox.y - jumpBox.height;
    }).toBeGreaterThanOrEqual(-1);
    await noSidewaysScroll(page, page.getByTestId('entity-list-scroll'));
  });
}

for (const [width, height] of [[1440, 900], [1366, 650]]) {
  test(`sign-in is a labelled centred dialog at ${width}x${height}`, async ({ page }) => {
    await page.setViewportSize({ width: width!, height: height! });
    await page.goto('/me');
    await page.getByTestId('account-sign-in').click();
    const dialog = page.getByTestId('account-sheet');
    await expect(dialog).toHaveAttribute('role', 'dialog');
    await expect(dialog).toHaveAttribute('aria-modal', 'true');
    const labelledBy = await dialog.getAttribute('aria-labelledby');
    expect(labelledBy).toBeTruthy();
    expect(await page.evaluate((id) => document.getElementById(id!)?.textContent, labelledBy)).toBe('Sign in');
    const box = await boxOf(dialog);
    expect(box.width).toBeLessThanOrEqual(440);
    expect(box.height).toBeLessThanOrEqual(height! - 48);
    expect(Math.abs(box.x + box.width / 2 - width! / 2)).toBeLessThan(1);
    expect(Math.abs(box.y + box.height / 2 - height! / 2)).toBeLessThan(1);
    await reachableInWindow(page, page.getByTestId('auth-close'));
    await reachableInWindow(page, page.getByTestId('auth-submit'));
    await expect(page.getByTestId('account-sheet-scrim')).toHaveAttribute('tabindex', '-1');
    await page.getByTestId('auth-email').fill('test');
    await page.keyboard.press('/');
    await expect(page).toHaveURL(/\/me$/);
    // A view switch replaces the title; the central frame must name the new heading too.
    await page.getByTestId('auth-to-signup').click();
    const newId = await dialog.getAttribute('aria-labelledby');
    expect(await page.evaluate((id) => document.getElementById(id!)?.textContent, newId)).toBe('Create an account');
    await page.keyboard.press('Escape');
    await expect(dialog).toHaveCount(0);
  });
}

for (const width of [767, 1023]) {
  test(`keeps the bottom navigation and search header below the rail at ${width}`, async ({ page }) => {
    await page.setViewportSize({ width, height: 900 });
    await page.goto('/bible');
    await expect(page.getByTestId('side-rail')).toHaveCount(0);
    await expect(page.getByTestId('reader-search-button')).toBeVisible();
    await expect(page.getByTestId('bottom-bar-background')).toBeVisible();
    await page.keyboard.press('/');
    await expect(page).toHaveURL(/\/bible$/);
    await page.getByTestId('reader-settings-button').click();
    await expect(page.getByTestId('sheet-grabber')).toBeVisible();
  });
}

test('skip link is the first tab stop and focuses the full-window content', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/');
  await expect(page.getByTestId('screen-home')).toBeVisible();
  await page.keyboard.press('Tab');
  await expect(page.getByTestId('rail-skip')).toBeFocused();
  await page.keyboard.press('Enter');
  await expect(page.locator('#main-content')).toBeFocused();
  await page.getByTestId('tab-bible').focus();
  await page.keyboard.press('Enter');
  await expect(page).toHaveURL(/\/bible$/);
});

test('parallel header and text share edges and header arrows stay reachable while scrolling', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await seed(page, 'reader.settings', { textSize: 2, parallel: 'CUV-SIMP' });
  await page.goto('/bible');
  const column = await boxOf(page.getByTestId('parallel-columns'));
  expect(column.width).toBe(1120);
  expect(column.x).toBe(264);
  const book = await boxOf(page.getByTestId('reader-book-button'));
  expect(book.x).toBe(column.x);
  for (const direction of ['prev', 'next']) {
    await expect(page.getByTestId('reader-header').getByTestId(`reader-${direction}`)).toHaveCount(1);
    await expect(page.getByTestId(`reader-${direction}`)).toHaveCount(1);
  }
  await page.getByTestId('reader-scroll').hover();
  await page.mouse.wheel(0, 700);
  await expect(page.getByTestId('reader-next')).toBeInViewport();
  await expect(page.getByTestId('reader-show-controls')).toHaveCount(0);
});

test('desktop read-aloud bar centres on the Scripture column, 16px above the bottom', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.addInitScript(() => {
    class Utterance { constructor(public text: string) {} }
    Object.defineProperty(window, 'SpeechSynthesisUtterance', { configurable: true, value: Utterance });
    Object.defineProperty(window, 'speechSynthesis', { configurable: true, value: {
      paused: false, getVoices: () => [{ voiceURI: 'en-us', name: 'US voice', lang: 'en-US', default: true, localService: true }],
      cancel() {}, resume() {}, speak() {}, addEventListener() {}, removeEventListener() {},
    } });
  });
  await page.goto('/bible');
  const column = await boxOf(page.getByTestId('reader-text'));
  await page.getByTestId('reader-tools-button').click();
  await page.getByTestId('read-aloud-start').click();
  const bar = await boxOf(page.getByTestId('read-aloud-bar'));
  expect(bar.width).toBe(560);
  expect(bar.x + bar.width / 2).toBe(column.x + column.width / 2);
  expect(bar.y + bar.height).toBe(884);
});

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

  test('an exempt privacy visit keeps the rail hidden until first run is done', async ({ page }) => {
    await page.setViewportSize({ width: 1440, height: 900 });
    await page.goto('/privacy');
    await expect(page.getByTestId('screen-privacy')).toBeVisible();
    await expect(page.getByTestId('side-rail')).toHaveCount(0);
    const box = await boxOf(page.getByTestId('privacy-short'));
    expect(Math.abs(box.x + box.width / 2 - 720)).toBeLessThan(1);
  });
});

for (const width of [1024, 1440, 1920]) {
  test(`verse dock selection, geometry, anchoring and drafts at ${width}`, async ({ page }) => {
    await page.setViewportSize({ width, height: 900 });
    await page.goto('/bible');
    const verse = page.getByTestId('verse-16');
    await expect(verse).toBeVisible();
    // Put a verse below the top of a long chapter at a measurable, repeatable viewport position.
    await page.getByTestId('reader-scroll').evaluate((node) => {
      node.scrollTop += document.querySelector('[data-testid="verse-16"]')!.getBoundingClientRect().top - 220;
    });
    const before = await boxOf(verse);
    await page.getByTestId('verse-16-tools').click();
    const dock = page.getByTestId('verse-sheet');
    const panel = await boxOf(dock);
    const inset = width < 1280 ? 12 : 16;
    expect(panel.width).toBe(width < 1280 ? 304 : 328);
    expect(panel.x + panel.width).toBe(width - inset);
    expect(panel.y).toBe(inset);
    expect(panel.height).toBe(900 - inset * 2);
    await expect(page.getByTestId('verse-sheet-scrim')).toHaveCount(0);
    await expect(page.getByTestId('sheet-grabber')).toHaveCount(0);
    const expected = readerColumn({ width, rail: width < 1280 ? 88 : 208, dock: panel.width + inset, parallel: false });
    await expect.poll(async () => (await boxOf(page.getByTestId('reader-text'))).x).toBeCloseTo(expected.left, 0);
    expect((await boxOf(page.getByTestId('reader-text'))).width).toBe(expected.columnWidth);
    expect(Math.abs((await boxOf(verse)).y - before.y)).toBeLessThanOrEqual(2);
    // A second click on the sole selected verse closes, with the same anchoring on expansion.
    const openTop = (await boxOf(verse)).y;
    await page.getByTestId('verse-16-tools').click();
    await expect(dock).toHaveCount(0);
    await expect.poll(async () => Math.abs((await boxOf(verse)).y - openTop)).toBeLessThanOrEqual(2);
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('verse-17-tools').click();
    await expect(page.getByTestId('verse-16-tools')).toHaveAttribute('aria-selected', 'false');
    await expect(page.getByTestId('verse-17-tools')).toHaveAttribute('aria-selected', 'true');
    await page.getByTestId('verse-19-tools').click({ modifiers: ['Shift'] });
    for (const n of [17, 18, 19]) await expect(page.getByTestId(`verse-${n}-tools`)).toHaveAttribute('aria-selected', 'true');
    // A range click starts a new single selection, and notes remain bound to that verse.
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-note').click();
    await page.getByTestId('note-input').fill('Draft survives the chapter arrow');
    await page.keyboard.press('ArrowRight');
    await expect(page.getByTestId('reader-book-button')).toHaveText('John 3');
    await page.getByTestId('note-input').blur();
    await page.keyboard.press('ArrowRight');
    await expect(page.getByTestId('reader-book-button')).toHaveText('John 4');
    await expect(dock).toHaveCount(0);
    await page.keyboard.press('ArrowLeft');
    await expect(page.getByTestId('reader-book-button')).toHaveText('John 3');
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-note').click();
    await expect(page.getByTestId('note-input')).toHaveValue('Draft survives the chapter arrow');
    await expect(page.getByTestId('note-draft')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('sheet-actions')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(dock).toHaveCount(0);
  });
}

test('1023 keeps the bottom verse sheet and extend-on-tap', async ({ page }) => {
  await page.setViewportSize({ width: 1023, height: 900 });
  await page.goto('/bible');
  await page.getByTestId('verse-1-tools').click();
  await expect(page.getByTestId('sheet-grabber')).toBeVisible();
  const sheet = await boxOf(page.getByTestId('verse-sheet'));
  expect(sheet.width).toBe(560);
  expect(sheet.y + sheet.height).toBe(900);
  await page.getByTestId('verse-3-tools').click();
  for (const n of [1, 2, 3]) await expect(page.getByTestId(`verse-${n}-tools`)).toHaveAttribute('aria-selected', 'true');
});

test('hover respects pointer capability on buttons and layered verse feedback', async ({ page }, testInfo) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/bible');
  const button = page.getByTestId('reader-settings-button');
  const rest = await button.evaluate((node) => getComputedStyle(node).filter);
  await button.hover();
  const pointer = testInfo.project.name === 'desktop';
  await expect.poll(() => button.evaluate((node) => getComputedStyle(node).filter)).toBe(pointer ? 'brightness(1.18)' : rest);
  if (pointer) {
    const verse = page.getByTestId('verse-1');
    await verse.hover();
    await expect.poll(() => verse.evaluate((node) => getComputedStyle(node).boxShadow)).not.toBe('none');
    await page.mouse.wheel(0, 1);
    await expect(page.locator('html')).not.toHaveAttribute('data-pointer-moved');
    await expect.poll(() => verse.evaluate((node) => getComputedStyle(node).boxShadow)).toBe('none');
  }
});

test('Enter checks an available Memory ordering answer and leaves focused controls alone', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/memory/lesson/2-corinthians-5-17/chunk-order');
  await expect(page.getByTestId('chunk-check')).toHaveAttribute('aria-disabled', 'true');
  await page.keyboard.press('Enter');
  await expect(page.getByTestId('memory-result')).toHaveCount(0);
  const n = await page.getByTestId(/^chunk-chip-\d+$/).count();
  expect(n).toBeGreaterThan(1);
  for (let i = 0; i < n; i++) await page.getByTestId(`chunk-chip-${i}`).click();
  await page.getByTestId('memory-back').focus();
  // A focused control owns its Enter; dispatch just the keydown to observe the guard without activating Back.
  await page.getByTestId('memory-back').evaluate((node) => node.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', bubbles: true, cancelable: true })));
  await expect(page.getByTestId('memory-result')).toHaveCount(0);
  await page.evaluate(() => (document.activeElement as HTMLElement | null)?.blur());
  await page.keyboard.press('Enter');
  await expect(page.getByTestId('memory-result')).toContainText('Correct');
});

test('a drag-selected Scripture range never opens verse tools', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/bible');
  const verse = page.getByTestId('verse-1');
  await expect(verse).toBeVisible();
  const bounds = await boxOf(verse);
  await page.mouse.move(bounds.x + 50, bounds.y + 15);
  await page.mouse.down();
  await page.mouse.move(bounds.x + 220, bounds.y + 15, { steps: 12 });
  await page.mouse.up();
  expect(await page.evaluate(() => window.getSelection()?.toString().length ?? 0)).toBeGreaterThan(0);
  await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
});

for (const width of [1024, 1440, 1920]) {
  test(`read-aloud stays visible and follows while verse tools are docked at ${width}`, async ({ page }) => {
    await page.setViewportSize({ width, height: 900 });
    await page.addInitScript(() => {
      class Utterance { constructor(public text: string) {} }
      Object.defineProperty(window, 'SpeechSynthesisUtterance', { configurable: true, value: Utterance });
      Object.defineProperty(window, 'speechSynthesis', { configurable: true, value: {
        paused: false,
        getVoices: () => [{ voiceURI: 'en-us', name: 'US voice', lang: 'en-US', default: true, localService: true }],
        cancel() { window.__speechCurrent = null; }, resume() {},
        speak(u: Window['__speechCurrent']) { window.__speechCurrent = u; },
        addEventListener() {}, removeEventListener() {},
      } });
      window.__speechDone = () => { const u = window.__speechCurrent; window.__speechCurrent = null; u?.onend?.(); };
    });
    await page.goto('/bible');
    await page.getByTestId('reader-tools-button').click();
    await page.getByTestId('read-aloud-start').click();
    await expect(page.getByTestId('verse-1')).toHaveAttribute('aria-current', 'true');
    await page.getByTestId('verse-1-tools').click();
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    await expect(page.getByTestId('read-aloud-bar')).toBeVisible();
    const before = await page.getByTestId('reader-scroll').evaluate((node) => node.scrollTop);
    // Advance through real engine callbacks, leaving follow-scroll active throughout the open dock.
    for (let i = 0; i < 100 && await page.getByTestId('verse-16').getAttribute('aria-current') !== 'true'; i++) {
      await page.evaluate(() => window.__speechDone());
    }
    await expect(page.getByTestId('verse-16')).toHaveAttribute('aria-current', 'true');
    await expect.poll(() => page.getByTestId('reader-scroll').evaluate((node) => node.scrollTop)).toBeGreaterThan(before + 100);
    await expect(page.getByTestId('verse-16-tools')).toBeInViewport();
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    await expect(page.getByTestId('read-aloud-bar')).toBeVisible();
    const column = await boxOf(page.getByTestId('reader-text'));
    const bar = await boxOf(page.getByTestId('read-aloud-bar'));
    expect(bar.x + bar.width / 2).toBeCloseTo(column.x + column.width / 2, 0);
  });
}

test('parallel dock re-wraps both columns and anchors on open and close at 1024', async ({ page }) => {
  await page.setViewportSize({ width: 1024, height: 900 });
  await seed(page, 'reader.settings', { textSize: 2, parallel: 'CUV-SIMP' });
  await page.goto('/bible');
  await page.getByTestId('verse-16-tools').scrollIntoViewIfNeeded();
  const verse = page.getByTestId('verse-16');
  const before = (await boxOf(verse)).y;
  await page.getByTestId('verse-16-tools').click();
  const expected = readerColumn({ width: 1024, rail: 88, dock: 316, parallel: true });
  const columns = page.getByTestId('parallel-columns');
  await expect.poll(async () => (await boxOf(columns)).x).toBeCloseTo(expected.left, 0);
  expect((await boxOf(columns)).width).toBe(expected.columnWidth);
  expect(Math.abs((await boxOf(verse)).y - before)).toBeLessThanOrEqual(2);
  const open = (await boxOf(verse)).y;
  await page.getByTestId('sheet-close').click();
  await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
  await expect.poll(async () => Math.abs((await boxOf(verse)).y - open)).toBeLessThanOrEqual(2);
});

test('Chinese bold uses real local bold glyphs for every bold UI family in Chromium', async ({ page }) => {
  await page.goto('/me');
  await expect(page.getByTestId('screen-me-scroll')).toBeVisible();
  const metrics = await page.evaluate(async () => {
    const text = '\u5723\u7ecf\u5b66\u4e60\u8bb0\u5fc6\u4e2d\u6587\u7c97\u4f53';
    const output = [];
    for (const family of ['SpaceGrotesk_700Bold', 'PlusJakartaSans_700Bold', 'PlusJakartaSans_800ExtraBold']) {
      const regular = family.startsWith('Space') ? 'SpaceGrotesk_400Regular' : 'PlusJakartaSans_400Regular';
      await document.fonts.load(`40px ${family}`, text);
      await document.fonts.load(`40px ${regular}`, text);
      const measure = (font: string) => {
        const canvas = document.createElement('canvas'); canvas.width = 800; canvas.height = 80;
        const ctx = canvas.getContext('2d')!; ctx.font = `40px ${font}`; ctx.fillText(text, 0, 50);
        const data = ctx.getImageData(0, 0, 800, 80).data;
        let ink = 0; for (let i = 3; i < data.length; i += 4) ink += data[i]! / 255;
        return { width: ctx.measureText(text).width, ink };
      };
      const probe = document.createElement('span'); probe.id = `cjk-probe-${output.length}`;
      probe.style.cssText = `font-family:${family};font-size:40px;font-synthesis:none`;
      probe.textContent = text; document.body.appendChild(probe);
      output.push({ family, bold: measure(family), regular: measure(regular) });
    }
    return output;
  });
  const cdp = await page.context().newCDPSession(page);
  await cdp.send('DOM.enable'); await cdp.send('CSS.enable');
  const { root } = await cdp.send('DOM.getDocument');
  for (let i = 0; i < metrics.length; i++) {
    const row = metrics[i]!;
    expect(row.bold.ink).toBeGreaterThan(row.regular.ink * 1.2);
    const { nodeId } = await cdp.send('DOM.querySelector', { nodeId: root.nodeId, selector: `#cjk-probe-${i}` });
    const { fonts } = await cdp.send('CSS.getPlatformFontsForNode', { nodeId });
    expect(fonts.some((font) => /bold|semibold/i.test(font.postScriptName) && font.glyphCount === 10)).toBe(true);
    console.log('CJK bold measurement:', JSON.stringify({ ...row, fonts }));
  }
});

for (const preset of ['silver', 'graphite', 'strawberry-milk']) {
  test(`shared hover preserves layout, rail pill and keyboard focus in ${preset}`, async ({ page }) => {
    await page.setViewportSize({ width: 1440, height: 900 });
    await seed(page, 'appearance', { preset, mode: preset === 'graphite' ? 'dark' : 'light' });
    await page.goto('/me');
    const current = page.getByTestId('tab-me');
    const pill = await current.evaluate((node) => getComputedStyle(node).backgroundColor);
    await current.hover();
    await expect(current).toHaveCSS('background-color', pill);
    const row = page.getByTestId('me-row-language');
    const before = await boxOf(row);
    const label = row.locator(':scope > div').first();
    const labelBefore = await boxOf(label);
    await row.hover();
    await expect(row).toHaveCSS('transform', 'none');
    const after = await boxOf(row);
    expect(after).toEqual(before);
    expect(await boxOf(label)).toEqual(labelBefore);
    if (preset !== 'strawberry-milk') {
      const overlay = await row.evaluate((node) => {
        const style = getComputedStyle(node, '::after');
        return { content: style.content, pointer: style.pointerEvents, radius: style.borderRadius, color: style.backgroundColor };
      });
      expect(overlay.content).toBe('""');
      expect(overlay.pointer).toBe('none');
      expect(overlay.color).not.toBe('rgba(0, 0, 0, 0)');
    }
    await row.focus();
    // A keyboard action makes :focus-visible active, unlike a pointer focus.
    await page.keyboard.press('Tab');
    await page.keyboard.press('Shift+Tab');
    await expect(row).toHaveCSS('outline-width', '3px');
    await expect(row).toHaveCSS('outline-offset', '2px');
    await page.emulateMedia({ reducedMotion: 'reduce' });
    await expect(row).toHaveCSS('transition-duration', '0s');
    await page.goto('/bible');
    const column = page.getByTestId('reader-text');
    await expect(column).toHaveCSS('transition-duration', '0s');
    const button = page.getByTestId('reader-book-button');
    await button.hover();
    if (preset === 'strawberry-milk') {
      await expect(button).toHaveCSS('transform', 'matrix(1, 0, 0, 1, -1, -1)');
      await page.mouse.down();
      await expect(button).toHaveCSS('transform', 'matrix(1, 0, 0, 1, 2, 2)');
      // Release outside the control so the press feedback check does not open a picker.
      await page.mouse.move(1400, 880); await page.mouse.up();
    }
    await page.getByTestId('reader-tools-button').click();
    const primary = page.getByTestId('read-aloud-start');
    await primary.hover();
    await expect(primary).toHaveCSS('filter', 'brightness(1.18)');
    await page.keyboard.press('Escape');
    await page.goto('/memory/lesson/2-corinthians-5-17/chunk-order');
    const disabled = page.getByTestId('chunk-check');
    await disabled.hover({ force: true });
    await expect(disabled).toHaveCSS('filter', 'none');
    await expect(disabled).toHaveCSS('transform', 'none');
  });
}

// PR B2 fix 1: keyboard scroll and transient skip-link focus regressions.
test('gutter clicks leave main unfocusable and PageDown scrolls the reader', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/bible');
  const main = page.locator('#main-content');
  await expect(main).not.toHaveAttribute('tabindex');
  const scroll = page.getByTestId('reader-scroll');
  await scroll.click({ position: { x: 230, y: 300 } });
  await expect(main).not.toBeFocused();
  await page.keyboard.press('PageDown');
  await expect.poll(() => scroll.evaluate((node) => node.scrollTop)).toBeGreaterThan(500);
  await page.getByTestId('rail-skip').focus();
  await page.keyboard.press('Enter');
  await expect(main).toBeFocused();
  await expect(main).toHaveAttribute('tabindex', '-1');
  await page.keyboard.press('Tab');
  await expect(main).not.toBeFocused();
  await expect(main).not.toHaveAttribute('tabindex');
  const focusedInRail = await page.evaluate(() => !!document.activeElement?.closest('[data-testid="side-rail"]'));
  expect(focusedInRail).toBe(false);
});

test('fresh reader scroll keys work and Space still activates a focused button', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/bible');
  const scroll = page.getByTestId('reader-scroll');
  await expect(page.getByTestId('verse-1')).toBeVisible();
  expect(await page.evaluate(() => document.activeElement === document.body)).toBe(true);
  await page.keyboard.press('PageDown');
  await expect.poll(() => scroll.evaluate((node) => node.scrollTop)).toBeGreaterThan(500);
  await page.keyboard.press('End');
  await expect.poll(() => scroll.evaluate((node) => Math.abs(node.scrollTop - (node.scrollHeight - node.clientHeight)))).toBeLessThanOrEqual(1);
  await page.keyboard.press('Home');
  await expect.poll(() => scroll.evaluate((node) => node.scrollTop)).toBe(0);
  await page.keyboard.press('Space');
  await expect.poll(() => scroll.evaluate((node) => node.scrollTop)).toBeGreaterThan(500);
  await page.keyboard.press('Shift+Space');
  await expect.poll(() => scroll.evaluate((node) => node.scrollTop)).toBe(0);
  await page.getByTestId('reader-settings-button').focus();
  await page.keyboard.press('Space');
  await expect(page.getByTestId('reading-settings')).toBeVisible();
  expect(await scroll.evaluate((node) => node.scrollTop)).toBe(0);
});

test('at 767 reader scroll keys are never intercepted', async ({ page }) => {
  await page.setViewportSize({ width: 767, height: 900 });
  await page.goto('/bible');
  await expect(page.getByTestId('verse-1')).toBeVisible();
  const prevented = await page.evaluate(() => ['PageDown', 'PageUp', ' ', 'Home', 'End', 'ArrowDown', 'ArrowUp'].map((key) => {
    const event = new KeyboardEvent('keydown', { key, bubbles: true, cancelable: true });
    document.body.dispatchEvent(event);
    return event.defaultPrevented;
  }));
  expect(prevented).toEqual([false, false, false, false, false, false, false]);
});

// PR B2 fix 2: clicking text must use the same close/focus path as the dock's close control.
test('clicking the selected verse text closes the dock and restores tools focus without scrolling', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/bible');
  const verse = page.getByTestId('verse-16');
  await expect(verse).toBeVisible();
  await page.getByTestId('reader-scroll').evaluate((node) => {
    node.scrollTop += document.querySelector('[data-testid="verse-16"]')!.getBoundingClientRect().top - 220;
  });
  const text = verse.getByText(/^For God so loved the world/).first();
  await text.click();
  await expect(page.getByTestId('verse-sheet')).toBeVisible();
  await expect(page.getByTestId('sheet-actions').getByRole('heading')).toBeFocused();
  const top = (await boxOf(verse)).y;
  await text.click();
  await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
  await expect(page.getByTestId('verse-16-tools')).toBeFocused();
  expect(Math.abs((await boxOf(verse)).y - top)).toBeLessThanOrEqual(2);
});

/** Decode actual screenshot pixels in the browser; no CSS fill values are used as samples. */
async function sampleControlFill(page: Page, control: Locator): Promise<number[]> {
  const png = (await control.screenshot({ scale: 'css' })).toString('base64');
  return page.evaluate(async (base64) => {
    const img = new Image(); img.src = `data:image/png;base64,${base64}`; await img.decode();
    const canvas = document.createElement('canvas'); canvas.width = img.width; canvas.height = img.height;
    const ctx = canvas.getContext('2d')!; ctx.drawImage(img, 0, 0);
    // Mid-height near the left edge is inside the rounded fill, away from text and the edge ring.
    const data = ctx.getImageData(12, Math.floor(img.height / 2), 3, 3).data;
    const rgb = [0, 0, 0];
    for (let i = 0; i < data.length; i += 4) for (let c = 0; c < 3; c++) rgb[c]! += data[i + c]! / 9;
    return rgb;
  }, png);
}

function pixelContrast(a: number[], b: number[]): number {
  const luminance = (rgb: number[]) => rgb.map((channel) => channel / 255).map((c) => c <= 0.04045 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4)
    .reduce((sum, c, i) => sum + c * [0.2126, 0.7152, 0.0722][i]!, 0);
  const first = luminance(a); const second = luminance(b);
  return (Math.max(first, second) + 0.05) / (Math.min(first, second) + 0.05);
}

test('Silver hover screenshot pixels retain dark-fill text contrast and visibly lift light controls', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await seed(page, 'appearance', { preset: 'silver', mode: 'light' });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  const measurements: { control: string; fill: number[]; text: number[]; contrast: number }[] = [];
  const checkContrast = async (control: Locator, label: string) => {
    await control.hover();
    const fill = await sampleControlFill(page, control);
    const text = await control.getByText(label, { exact: true }).evaluate((node) => getComputedStyle(node).color.match(/[\d.]+/g)!.slice(0, 3).map(Number));
    const contrast = pixelContrast(fill, text);
    measurements.push({ control: label, fill, text, contrast });
  };
  await page.goto('/memory/lesson/2-corinthians-5-17/chunk-order');
  await expect(page.getByTestId('chunk-check')).toBeVisible();
  const count = await page.getByTestId(/^chunk-chip-\d+$/).count();
  expect(count).toBeGreaterThan(1);
  for (let i = 0; i < count; i++) await page.getByTestId(`chunk-chip-${i}`).click();
  await checkContrast(page.getByTestId('chunk-check'), 'Check');
  await page.goto('/study');
  await checkContrast(page.getByTestId('study-tab-saved'), 'Saved');
  const light = page.getByTestId('study-tab-progress');
  await page.mouse.move(1400, 880);
  const rest = await sampleControlFill(page, light);
  await light.hover();
  const hover = await sampleControlFill(page, light);
  console.log('Silver screenshot hover measurements:', JSON.stringify({ measurements, light: { rest, hover } }));
  for (const result of measurements) expect(result.contrast, `${result.control}: screenshot fill ${result.fill}`).toBeGreaterThanOrEqual(4.5);
  expect(Math.max(...rest.map((channel, i) => Math.abs(channel - hover[i]!)))).toBeGreaterThan(2);
});
