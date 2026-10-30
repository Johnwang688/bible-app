import type { Page } from '@playwright/test';
import {
  expect,
  openReaderAt,
  revealTaskbar,
  revealTopBar,
  test,
  verse,
} from './fixtures';
import { MOCK_USER } from './mocks';
import me from './mocks/me.json';
import wallet from './mocks/wallet.json';

const AUTH_SESSION_KEY = 'bible-app-auth-session';

const readStorage = (page: Page, key: string) =>
  page.evaluate((k) => window.localStorage.getItem(k), key);

/** Reloads and re-enters the reader without a second navigation (which would abort the in-flight session refresh). */
async function reloadIntoReader(page: Page) {
  await page.reload();
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(page.locator('.verse-line').first()).toBeVisible();
}

async function openMyStuff(page: Page) {
  await revealTopBar(page);
  await page.getByRole('button', { name: 'My stuff' }).click();
  await expect(page.locator('.mystuff-account-section')).toBeVisible();
}

test.describe('read aloud', () => {
  interface TtsLog {
    speak: Array<{ text: string; lang: string; rate: number; voiceURI: string | null }>;
    cancel: number;
    pause: number;
    resume: number;
    /** Finishes the most recent utterance the way the browser does (fires its onend). */
    finish: () => void;
  }
  const readTts = (page: Page) =>
    page.evaluate(() => {
      const tts = (window as unknown as { __tts: TtsLog }).__tts;
      return { speak: tts.speak, cancel: tts.cancel, pause: tts.pause, resume: tts.resume };
    });

  test.beforeEach(async ({ page }) => {
    // CI browsers have no voices, so replace the speech API with a recorder.
    await page.addInitScript(() => {
      const voices = [
        { voiceURI: 'en-a', name: 'Test Voice A', lang: 'en-US', default: true, localService: true },
        { voiceURI: 'en-b', name: 'Test Voice B', lang: 'en-GB', default: false, localService: true },
        { voiceURI: 'zh-c', name: 'Test Voice C', lang: 'zh-TW', default: false, localService: true },
      ];
      const utterances: Array<{ onend: null | (() => void) }> = [];
      const tts = {
        speak: [] as unknown[],
        cancel: 0,
        pause: 0,
        resume: 0,
        finish: () => utterances[utterances.length - 1]?.onend?.(),
      };
      class FakeUtterance {
        text: string;
        lang = '';
        rate = 1;
        voice: { voiceURI: string } | null = null;
        onend: null | (() => void) = null;
        onerror: null | (() => void) = null;
        constructor(text: string) {
          this.text = text;
        }
      }
      const synth = {
        speaking: false,
        paused: false,
        getVoices: () => voices,
        addEventListener: () => {},
        removeEventListener: () => {},
        speak(utt: FakeUtterance) {
          utterances.push(utt);
          tts.speak.push({
            text: utt.text,
            lang: utt.lang,
            rate: utt.rate,
            voiceURI: utt.voice?.voiceURI ?? null,
          });
        },
        cancel() {
          tts.cancel += 1;
        },
        pause() {
          tts.pause += 1;
        },
        resume() {
          tts.resume += 1;
        },
      };
      Object.defineProperty(window, 'speechSynthesis', { value: synth, configurable: true });
      Object.defineProperty(window, 'SpeechSynthesisUtterance', { value: FakeUtterance, configurable: true });
      (window as unknown as { __tts: typeof tts }).__tts = tts;
    });
  });

  test('11. reads the chapter aloud, stops, and honours the chosen voice and speed', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await revealTaskbar(page);
    const play = page.locator('.tts-play-btn');
    await expect(play).toHaveAccessibleName('Read aloud');
    const cancelsBefore = (await readTts(page)).cancel;

    // Start: the whole chapter is spoken as one utterance, with defaults (English, normal speed, first English voice).
    await play.click();
    await expect(play).toHaveAccessibleName('Stop reading');
    await expect(play).toHaveClass(/tts-playing/);
    let log = await readTts(page);
    expect(log.speak).toHaveLength(1);
    expect(log.speak[0].text).toMatch(/^1\. /);
    expect(log.speak[0].text).toContain('16. For God so loved the world');
    expect(log.speak[0].text).toContain('36. ');
    expect(log.speak[0]).toMatchObject({ lang: 'en', rate: 1, voiceURI: 'en-a' });
    // Starting always clears the queue first.
    expect(log.cancel).toBe(cancelsBefore + 1);

    // Stop: cancels the speech and the control goes back to "Read aloud".
    await play.click();
    await expect(play).toHaveAccessibleName('Read aloud');
    await expect(play).not.toHaveClass(/tts-playing/);
    log = await readTts(page);
    expect(log.speak).toHaveLength(1);
    expect(log.cancel).toBe(cancelsBefore + 2);

    // The browser finishing the utterance on its own also resets the control.
    await play.click();
    await expect(play).toHaveAccessibleName('Stop reading');
    await page.evaluate(() => (window as unknown as { __tts: TtsLog }).__tts.finish());
    await expect(play).toHaveAccessibleName('Read aloud');

    // Voice panel: English voices only (plus Auto); speed shows its value.
    await page.getByRole('button', { name: 'Voice settings' }).click();
    const voiceSelect = page.locator('#tts-voice-select');
    await expect(voiceSelect.locator('option')).toHaveText(['Auto (en)', 'Test Voice A', 'Test Voice B']);
    await expect(page.locator('.tts-rate-val')).toHaveText('1.0×');
    await voiceSelect.selectOption('en-b');
    await page.locator('#tts-rate-range').fill('1.5');
    await expect(page.locator('.tts-rate-val')).toHaveText('1.5×');

    const before = (await readTts(page)).speak.length;
    await play.click();
    await expect(play).toHaveAccessibleName('Stop reading');
    log = await readTts(page);
    expect(log.speak).toHaveLength(before + 1);
    expect(log.speak[before]).toMatchObject({ lang: 'en', rate: 1.5, voiceURI: 'en-b' });
    expect(log.speak[before].text).toContain('16. For God so loved the world');

    // Pause/resume are not part of the control today.
    expect(log.pause).toBe(0);
    expect(log.resume).toBe(0);

    // Moving to another chapter stops the reading.
    const cancelsMid = log.cancel;
    await page.getByRole('button', { name: 'Next page or chapter' }).first().click();
    await expect(page.locator('.nav-btn-book')).toHaveText('John 4');
    await expect(play).toHaveAccessibleName('Read aloud');
    log = await readTts(page);
    expect(log.cancel).toBeGreaterThan(cancelsMid);
    expect(log.speak).toHaveLength(before + 1);
  });

  test('11b. reads in the translation language when the translation changes', async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await revealTopBar(page);
    await page.locator('.nav-btn-version').click();
    await page.getByRole('button', { name: /CUV Traditional/ }).click();
    await expect(verse(page, 16)).toContainText('神愛世人');

    await revealTaskbar(page);
    await page.locator('.tts-play-btn').click();
    await expect(page.locator('.tts-play-btn')).toHaveAccessibleName('Stop reading');
    const log = await readTts(page);
    expect(log.speak).toHaveLength(1);
    expect(log.speak[0].text).toContain('16. ');
    expect(log.speak[0].text).toContain('神愛世人');
    expect(log.speak[0]).toMatchObject({ lang: 'zh-TW', voiceURI: 'zh-c' });
  });
});

test.describe('tutorial', () => {
  const STEPS = ['Home', 'Translation', 'Search', 'Verse Tools', 'Resources', 'Ask AI', 'My Stuff', 'Settings'];

  test('12. walks every step, finishes, then reopens and closes with the close button', async ({ page }) => {
    await page.goto('/app');
    const title = page.locator('#tutorial-title');
    const overlay = page.locator('.tutorial-overlay');
    await expect(overlay).toHaveCount(0);

    await page.getByRole('button', { name: 'Start tutorial' }).click();
    await expect(overlay).toBeVisible();
    await expect(overlay).toHaveAttribute('aria-modal', 'true');
    await expect(title).toHaveText(STEPS[0]);
    // While open the page cannot scroll, and Back is unavailable on the first step.
    expect(await page.evaluate(() => document.body.style.overflow)).toBe('hidden');
    const back = page.getByRole('button', { name: 'Back', exact: true });
    const next = page.getByRole('button', { name: 'Next', exact: true });
    await expect(back).toBeDisabled();

    // Each step moves the app to the thing it is describing.
    const stepEffects: Array<(() => Promise<void>) | null> = [
      async () => expect(page.getByRole('button', { name: 'Bible reader' })).toBeVisible(),
      async () => {
        await expect(page.locator('.nav-btn-book')).toHaveText('John 3');
        await expect(page.locator('.tutorial-description')).toContainText('(WEB)');
      },
      async () =>
        expect(page.getByPlaceholder(/John 3, Romans 8:28/)).toHaveValue('Romans 8:28'),
      async () => {
        await expect(page.locator('.tutorial-verse-tools-preview')).toBeVisible();
        await expect(verse(page, 16)).toBeVisible();
      },
      async () => expect(page.locator('.commentary-source-select')).toBeVisible(),
      async () =>
        expect(page.getByPlaceholder('Ask Ruth about John 3...')).toHaveValue(
          'What does John 3 teach about being born again? Give me a simple explanation.',
        ),
      async () => expect(page.locator('.mystuff-account-section')).toBeVisible(),
      async () => expect(page.getByLabel('Text size')).toBeVisible(),
    ];
    await stepEffects[0]!();

    for (let i = 1; i < STEPS.length - 1; i++) {
      await next.click();
      await expect(title).toHaveText(STEPS[i]);
      await expect(back).toBeEnabled();
      await stepEffects[i]!();
    }

    // Keyboard arrows move between steps too.
    await page.keyboard.press('ArrowRight');
    await expect(title).toHaveText(STEPS[STEPS.length - 1]);
    await page.keyboard.press('ArrowLeft');
    await expect(title).toHaveText(STEPS[STEPS.length - 2]);

    // Last step: Next turns into Finish, and Back still works.
    await next.click();
    await expect(title).toHaveText(STEPS[STEPS.length - 1]);
    await stepEffects[STEPS.length - 1]!();
    await expect(next).toHaveCount(0);
    await back.click();
    await expect(title).toHaveText(STEPS[STEPS.length - 2]);
    await next.click();
    await expect(title).toHaveText(STEPS[STEPS.length - 1]);

    await page.getByRole('button', { name: 'Finish tutorial' }).click();
    await expect(overlay).toHaveCount(0);
    expect(await page.evaluate(() => document.body.style.overflow)).toBe('');
    // Finishing returns to the home screen.
    await expect(page.getByRole('button', { name: 'Start tutorial' })).toBeVisible();

    // Reopen: starts again from step one; the close button dismisses it.
    await page.getByRole('button', { name: 'Start tutorial' }).click();
    await expect(overlay).toBeVisible();
    await expect(title).toHaveText(STEPS[0]);
    await next.click();
    await expect(title).toHaveText(STEPS[1]);
    await page.getByRole('button', { name: 'Close tutorial' }).click();
    await expect(overlay).toHaveCount(0);
    expect(await page.evaluate(() => document.body.style.overflow)).toBe('');

    // "Jump to features" opens at the Search step.
    await page.goto('/app');
    await page.getByRole('button', { name: 'Jump to features' }).click();
    await expect(title).toHaveText('Search');
    await page.getByRole('button', { name: 'Close tutorial' }).click();
    await expect(overlay).toHaveCount(0);
  });
});

test.describe('account', () => {
  test('13. signs in from My stuff, then signs out (mocked)', async ({ page, calls }) => {
    await openReaderAt(page, 'John', 3);
    await openMyStuff(page);

    // Signed out: guest copy and the form.
    await expect(page.getByText('Guest study mode')).toBeVisible();
    await expect(page.getByRole('button', { name: 'Sign out' })).toHaveCount(0);
    expect(await readStorage(page, AUTH_SESSION_KEY)).toBeNull();

    await page.getByPlaceholder('Email').fill(MOCK_USER.email);
    await page.getByPlaceholder('Password').fill(MOCK_USER.password);
    await page.locator('.auth-actions').getByRole('button', { name: 'Sign in' }).click();

    // Signed in: profile from /me, wallet balance, session stored.
    const panel = page.locator('.auth-panel');
    await expect(panel.locator('.auth-title')).toHaveText(me.display_name);
    await expect(panel.locator('.auth-copy')).toHaveText(me.email);
    await expect(panel.locator('.auth-coins-amount')).toContainText(`${wallet.balance} coins`);
    await expect(page.getByText('Guest study mode')).toHaveCount(0);
    await expect(page.getByPlaceholder('Email')).toHaveCount(0);
    expect(calls.signIn).toEqual([MOCK_USER]);
    const stored = JSON.parse((await readStorage(page, AUTH_SESSION_KEY)) ?? 'null');
    expect(stored).toMatchObject({ accessToken: 'e2e-access-token', userId: me.id });

    // The session survives a reload.
    await reloadIntoReader(page);
    await openMyStuff(page);
    await expect(page.locator('.auth-panel .auth-title')).toHaveText(me.display_name);

    // Sign out: tells the server, clears the stored session, shows the guest UI again.
    const signOutRequest = page.waitForRequest(
      (req) => req.url().endsWith('/api/v1/auth/signout') && req.method() === 'POST',
    );
    await page.getByRole('button', { name: 'Sign out' }).click();
    const request = await signOutRequest;
    expect(request.headers()['authorization']).toBe('Bearer e2e-access-token');
    await expect(page.getByText('Guest study mode')).toBeVisible();
    await expect(page.getByRole('button', { name: 'Sign out' })).toHaveCount(0);
    await expect(page.getByPlaceholder('Email')).toBeVisible();
    await expect(page.locator('.auth-panel .auth-title')).toHaveCount(0);
    expect(await readStorage(page, AUTH_SESSION_KEY)).toBeNull();

    await reloadIntoReader(page);
    await openMyStuff(page);
    await expect(page.getByText('Guest study mode')).toBeVisible();
  });
});

test.describe('guided chapter study', () => {
  test('14. walks the sections of John 3 with Dive deeper and Move on (mocked)', async ({ page }) => {
    const sectionRequests: string[] = [];
    const guidedBodies: Array<Record<string, unknown>> = [];
    page.on('request', (req) => {
      if (req.url().includes('/api/v1/ai/guided-chapter/sections')) sectionRequests.push(req.url());
    });
    // Registered after the shared mocks, so it answers first; the text depends on the action and section.
    await page.route('**/api/v1/ai/guided-chapter', async (route) => {
      const body = route.request().postDataJSON() as Record<string, unknown>;
      guidedBodies.push(body);
      const message =
        body.action === 'dive_deeper'
          ? `Deeper look at verses ${body.verse_start}-${body.verse_end}.`
          : `Summary of verses ${body.verse_start}-${body.verse_end}.`;
      await route.fulfill({ json: { message, references: [] } });
    });

    await openReaderAt(page, 'John', 3);
    await revealTaskbar(page);
    await page.getByRole('button', { name: 'AI assistant' }).click();
    await page.getByRole('button', { name: 'Guide me through this chapter' }).click();

    // Section 1: the request for sections, then the first summary with both pills.
    const first = page.locator('.ai-message-assistant').filter({ hasText: 'Summary of verses 1-21.' });
    await expect(first).toBeVisible();
    await expect(page.locator('.ai-message-user')).toContainText('Guide me through this chapter.');
    const pills = page.getByRole('group', { name: 'Guided chapter options' });
    await expect(pills.getByRole('button')).toHaveText(['Dive deeper', 'Move on']);
    expect(sectionRequests).toHaveLength(1);
    const sectionsUrl = new URL(sectionRequests[0]);
    expect(Object.fromEntries(sectionsUrl.searchParams)).toEqual({
      book: 'John',
      chapter: '3',
      translation: 'WEB',
    });
    expect(guidedBodies).toEqual([
      {
        context: { book: 'John', chapter: 3, translation: 'WEB' },
        personality: 'jessica',
        action: 'section_summary',
        verse_start: 1,
        verse_end: 21,
      },
    ]);

    // Dive deeper: sends the summary text back, adds the deeper reply, and leaves only a wide Move on.
    await pills.getByRole('button', { name: 'Dive deeper' }).click();
    await expect(
      page.locator('.ai-message-assistant').filter({ hasText: 'Deeper look at verses 1-21.' }),
    ).toBeVisible();
    expect(guidedBodies).toHaveLength(2);
    expect(guidedBodies[1]).toMatchObject({
      action: 'dive_deeper',
      verse_start: 1,
      verse_end: 21,
      section_summary_text: 'Summary of verses 1-21.',
    });
    await expect(page.getByRole('button', { name: 'Dive deeper' })).toHaveCount(0);
    await expect(pills.getByRole('button')).toHaveText(['Move on']);
    await expect(pills.getByRole('button', { name: 'Move on' })).toHaveClass(/ai-guided-pill-moveon-wide/);

    // Move on: the next section's summary arrives with fresh pills, and the old pills are gone.
    await pills.getByRole('button', { name: 'Move on' }).click();
    const second = page.locator('.ai-message-assistant').filter({ hasText: 'Summary of verses 22-36.' });
    await expect(second).toBeVisible();
    await expect(page.getByRole('group', { name: 'Guided chapter options' })).toHaveCount(1);
    await expect(first.getByRole('button')).toHaveCount(0);
    await expect(pills.getByRole('button')).toHaveText(['Dive deeper', 'Move on']);
    expect(guidedBodies[2]).toMatchObject({ action: 'section_summary', verse_start: 22, verse_end: 36 });
    expect(guidedBodies).toHaveLength(3);

    // Move on from the last section ends the walkthrough without another request.
    await pills.getByRole('button', { name: 'Move on' }).click();
    await expect(page.getByText("You've reached the end of this chapter.")).toBeVisible();
    await expect(page.getByRole('group', { name: 'Guided chapter options' })).toHaveCount(0);
    expect(guidedBodies).toHaveLength(3);
    expect(sectionRequests).toHaveLength(1);
  });
});
