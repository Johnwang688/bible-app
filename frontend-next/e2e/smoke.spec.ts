import type { Page } from '@playwright/test';
import {
  expect,
  openReaderAt,
  pickChapter,
  revealTaskbar,
  revealTopBar,
  test,
  verse,
  waitForHydration,
} from './fixtures';
import { MOCK_USER } from './mocks';

const JOHN_3_16 = 'For God so loved the world';
const READER_SETTINGS_KEY = 'bible-app-reader-settings';
const HIGHLIGHTS_KEY = 'bible-app-highlights';
const NOTES_KEY = 'bible-app-notes';

const readStorage = (page: Page, key: string) =>
  page.evaluate((k) => window.localStorage.getItem(k), key);

async function setTextSize(page: Page, px: string) {
  await revealTaskbar(page);
  await page.getByRole('button', { name: 'Settings', exact: true }).click();
  await page.getByLabel('Text size').selectOption(px);
  await page.getByRole('button', { name: 'Close settings' }).click();
}

test.describe('reader', () => {
  test('1. reads a chapter and moves to the next one', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await expect(verse(page, 16)).toContainText(JOHN_3_16);
    await expect(page.locator('.verse-line')).toHaveCount(36);

    await page.getByRole('button', { name: 'Next page or chapter' }).first().click();

    await expect(page.locator('.nav-btn-book')).toHaveText('John 4');
    await expect(verse(page, 1)).toContainText('Therefore when the Lord knew');
    await expect(page.locator('.verse-line')).toHaveCount(54);
    await expect(page.getByText(JOHN_3_16)).toHaveCount(0);
  });

  test('2. switches translation to CUV', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await expect(verse(page, 16)).toContainText(JOHN_3_16);

    await revealTopBar(page);
    await page.locator('.nav-btn-version').click();
    await page.getByRole('button', { name: /CUV Traditional/ }).click();

    await expect(verse(page, 16)).toContainText('神愛世人');
    await expect(verse(page, 16)).not.toContainText(JOHN_3_16);
    await expect(page.locator('.nav-btn-version')).toHaveText('CUV');
  });

  test('3. changes theme and keeps it after a reload', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    const html = page.locator('html');
    await expect(html).toHaveAttribute('data-theme', 'default');

    await revealTaskbar(page);
    await page.getByRole('button', { name: 'Settings', exact: true }).click();
    await page.getByRole('button', { name: 'Dark', exact: true }).click();

    await expect(html).toHaveAttribute('data-theme', 'dark');
    expect(await readStorage(page, 'theme')).toBe('dark');

    await page.reload();
    await expect(html).toHaveAttribute('data-theme', 'dark');
  });

  test('4. changes the reader font size', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await expect(verse(page, 16)).toHaveCSS('font-size', '20px');

    await setTextSize(page, '28');

    await expect(verse(page, 16)).toHaveCSS('font-size', '28px');
    // The choice is written to storage straight away; 4b covers reading it back after a reload.
    await expect
      .poll(async () => JSON.parse((await readStorage(page, READER_SETTINGS_KEY)) ?? '{}').fontScale)
      .toBe('28');
  });

  test('4b. font size survives a reload', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await setTextSize(page, '28');
    await expect(verse(page, 16)).toHaveCSS('font-size', '28px');

    await page.reload();
    await openReaderAt(page, 'John', 3);
    await expect(verse(page, 16)).toHaveCSS('font-size', '28px', { timeout: 2_000 });
  });

  test('5. highlights a verse and adds a note (signed out, local storage)', async ({ page }) => {
    await openReaderAt(page, 'John', 3);

    await verse(page, 16).click();
    await expect(page.locator('.verse-study-title')).toHaveText('John 3:16');
    await page.getByRole('button', { name: 'blue' }).click();
    await page.getByRole('button', { name: 'Highlight', exact: true }).click();
    await expect(verse(page, 16)).toHaveClass(/verse-line--highlighted/);

    await page.getByRole('button', { name: 'Notes' }).click();
    await page.getByPlaceholder('Add a note (optional)...').fill('God loves the world');
    await page.getByRole('button', { name: 'Save' }).click();
    await expect(verse(page, 16)).toHaveClass(/verse-line--noted/);

    // Only verse 16 is marked, and both marks are written to local storage.
    await expect(page.locator('.verse-line--highlighted')).toHaveCount(1);
    expect(JSON.parse((await readStorage(page, HIGHLIGHTS_KEY)) ?? '[]')).toEqual(['john::3::16']);
    const notes = JSON.parse((await readStorage(page, NOTES_KEY)) ?? '{}');
    expect(notes['john::3::16']).toMatchObject({
      book: 'John',
      chapter: 3,
      verse: 16,
      text: 'God loves the world',
    });
    expect(JSON.parse((await readStorage(page, READER_SETTINGS_KEY)) ?? '{}').highlightColor).toBe('blue');

    // The same data shows up under "My stuff".
    await revealTopBar(page);
    await page.getByRole('button', { name: 'My stuff' }).click();
    await expect(page.locator('.mystuff-item').filter({ hasText: 'John 3:16' }).first()).toBeVisible();
    await expect(
      page.locator('.mystuff-item-note').filter({ hasText: 'God loves the world' }),
    ).toBeVisible();
  });

  test('5b. highlight and note survive a reload', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await verse(page, 16).click();
    await page.getByRole('button', { name: 'Highlight', exact: true }).click();
    await page.getByRole('button', { name: 'Notes' }).click();
    await page.getByPlaceholder('Add a note (optional)...').fill('God loves the world');
    await page.getByRole('button', { name: 'Save' }).click();
    await expect(verse(page, 16)).toHaveClass(/verse-line--noted/);

    await page.reload();
    await openReaderAt(page, 'John', 3);
    await expect(verse(page, 16)).toHaveClass(/verse-line--highlighted/, { timeout: 2_000 });
    await expect(verse(page, 16)).toHaveClass(/verse-line--noted/, { timeout: 2_000 });
    await verse(page, 16).click();
    await expect(page.getByPlaceholder('Add a note (optional)...')).toHaveValue('God loves the world', {
      timeout: 2_000,
    });
  });
});

test.describe('search', () => {
  test('6. finds verses for "love" and opens the clicked result', async ({ page }) => {
    await openReaderAt(page, 'John', 3);

    await revealTopBar(page);
    await page.getByRole('button', { name: 'Open search' }).click();
    await page.getByPlaceholder(/John 3, Romans 8:28/).fill('love');
    await page.getByRole('button', { name: 'Search', exact: true }).click();

    const results = page.locator('.search-result');
    await expect(results.first()).toBeVisible();
    expect(await results.count()).toBeGreaterThanOrEqual(1);
    const ref = (await results.first().locator('.search-result-ref').innerText()).trim();
    const match = /^(.+) (\d+):(\d+) \(WEB\)$/.exec(ref);
    expect(match, `result reference "${ref}" looks like "Book C:V (WEB)"`).not.toBeNull();
    const [, book, chapter, verseNo] = match!;
    const resultText = (await results.first().locator('.search-result-text').innerText()).trim();
    expect(resultText.toLowerCase()).toContain('love');

    await results.first().click();

    await expect(page.locator('.nav-btn-book')).toHaveText(`${book} ${chapter}`);
    await expect(verse(page, Number(verseNo))).toHaveClass(/verse-line--ai-nav/);
    await expect(verse(page, Number(verseNo))).toContainText(resultText.slice(0, 30));
  });
});

test.describe('side panels', () => {
  test('7. shows the chapter summary and Matthew Henry commentary', async ({ page }) => {
    await openReaderAt(page, 'John', 3);

    await revealTaskbar(page);
    await page.getByRole('button', { name: 'Resources' }).click();

    // Default source is the chapter summary.
    await expect(page.getByText('Born anew, God’s Son, and John’s joy')).toBeVisible();
    await expect(page.getByText('Nicodemus comes by night; Jesus teaches')).toBeVisible();
    await expect(page.getByRole('link', { name: 'Nicodemus', exact: true })).toHaveAttribute(
      'href',
      /\/people\/nicodemus/,
    );

    await page.locator('.commentary-source-select').click();
    await page.getByRole('option', { name: /Matthew Henry/ }).click();

    await expect(
      page.getByText('Nicodemus was afraid, or ashamed to be seen with Christ'),
    ).toBeVisible();
    await expect(page.getByText('Nicodemus comes by night; Jesus teaches')).toHaveCount(0);
  });

  test('8. answers a question in the AI sidebar (mocked)', async ({ page, calls }) => {
    await openReaderAt(page, 'John', 3);

    await revealTaskbar(page);
    await page.getByRole('button', { name: 'AI assistant' }).click();
    const composer = page.getByPlaceholder('Ask Ruth about John 3...');
    await composer.fill('What is this chapter about?');
    // Enter, not the send button: the revealed taskbar covers the button when the pointer travels to it.
    await expect(page.getByRole('button', { name: 'Send message' })).toBeEnabled();
    await composer.press('Enter');

    const reply = page.locator('.ai-message-assistant').filter({ hasText: 'follows Nicodemus' });
    await expect(reply).toBeVisible();
    // In-chapter references are rewritten to short chips (v1-8, v16).
    await expect(reply.locator('.ai-chip-nav')).toHaveText(['v1-8', 'v16']);
    await expect(page.locator('.ai-message-user')).toContainText('What is this chapter about?');
    await expect(page.getByRole('button', { name: 'Who was Nicodemus?' })).toBeVisible();

    expect(calls.aiChat).toHaveLength(1);
    expect(calls.aiChat[0]).toMatchObject({
      message: 'What is this chapter about?',
      context: { book: 'John', chapter: 3, translation: 'WEB' },
      personality: 'jessica',
    });
  });
});

test.describe('quiz', () => {
  test('9. signs in, reaches the chapter quiz after the dwell time, and shows the result (mocked)', async ({
    page,
    calls,
  }) => {
    // Sign in through the real form; the auth endpoints are mocked.
    await page.goto('/signin');
    await waitForHydration(page, 'form');
    await page.getByLabel('Email').fill(MOCK_USER.email);
    await page.getByLabel('Password').fill(MOCK_USER.password);
    await page.locator('form').getByRole('button', { name: 'Sign in' }).click();
    await expect(page).toHaveURL(/\/app$/, { timeout: 30_000 });
    expect(calls.signIn).toEqual([MOCK_USER]);

    await page.getByRole('button', { name: 'Bible reader' }).click();
    await expect(page.locator('.verse-line').first()).toBeVisible();
    await pickChapter(page, 'John', 3);
    await expect(verse(page, 16)).toContainText(JOHN_3_16);

    // Gate: needs at least half the chapter scrolled and the dwell time (22s for a 36-verse chapter).
    await page.mouse.move(700, 450);
    await page.mouse.wheel(0, 6000);
    const takeQuiz = page.getByRole('button', { name: 'Take Quiz' });
    await expect(takeQuiz).toBeDisabled();
    await expect(page.getByText(/Read \d+ more seconds?\./)).toBeVisible();

    await page.clock.fastForward(30_000);
    await expect(takeQuiz).toBeEnabled();
    await takeQuiz.click();

    const dialog = page.getByRole('dialog');
    await expect(dialog.getByText('Who came to Jesus by night?')).toBeVisible();
    await expect(dialog.getByText('0/5 answered')).toBeVisible();
    const submit = dialog.getByRole('button', { name: 'Submit' });
    await expect(submit).toBeDisabled();
    // First choice for every question: only the last one (Q5) is wrong in the mocked answer key.
    for (const choice of ['Nicodemus', 'Born anew', 'The wind', 'The serpent', 'Jericho']) {
      await dialog.getByLabel(choice, { exact: true }).check();
    }
    await expect(dialog.getByText('5/5 answered')).toBeVisible();
    await submit.click();

    await expect(dialog.getByText('Passed!')).toBeVisible();
    await expect(dialog.getByText('4/5')).toBeVisible();
    await expect(dialog.getByText('Correct: Aenon near Salim')).toBeVisible();
    await expect(
      dialog.getByText('John was baptizing at Aenon near Salim (John 3:23).'),
    ).toBeVisible();
    await expect(dialog.getByText('+8 coins')).toBeVisible();
    await expect(dialog.getByText('+5 milestone bonus!')).toBeVisible();

    expect(calls.quizSubmit).toEqual([
      {
        book_number: 43,
        chapter: 3,
        answers: [
          { question_id: 9001, answer: 'Nicodemus' },
          { question_id: 9002, answer: 'Born anew' },
          { question_id: 9003, answer: 'The wind' },
          { question_id: 9004, answer: 'The serpent' },
          { question_id: 9005, answer: 'Jericho' },
        ],
      },
    ]);
  });
});

test.describe('entity pages', () => {
  test('10. shows the person page for God', async ({ page }) => {
    await page.goto('/people/god');

    await expect(page.getByRole('heading', { level: 1, name: 'God' })).toBeVisible();
    await expect(page.getByText('Appears in 177 chapters')).toBeVisible();
    await expect(page.getByText('God is the central and supreme Being')).toBeVisible();
    await expect(page.getByText('Genesis 1-2')).toBeVisible();
    await expect(page.getByRole('link', { name: /Reader/ })).toHaveAttribute('href', /\/app/);
  });
});
