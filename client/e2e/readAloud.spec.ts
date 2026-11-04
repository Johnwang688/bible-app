import { expect, test, type Page } from '@playwright/test';
import { mockApi, seed } from './helpers';

type Utterance = { text: string; rate: number; lang: string; voice: { voiceURI: string } | null; onend?: (() => void) | null; onerror?: ((e: { error: string }) => void) | null };
type Voice = { voiceURI: string; name: string; lang: string; default: boolean; localService: boolean };
declare global {
  interface Window {
    __spoken: { text: string; rate: number; lang: string; voice: string | null }[];
    __voices: Voice[];
    __speechDone(): void;
    __speechFail(): void;
    __speechCurrent: Utterance | null;
  }
}

async function setup(page: Page, translation = 'BSB', chapter = 3, bookNumber = 43) {
  await mockApi(page);
  await seed(page, 'reader.position', { bookNumber, chapter, translation });
  await seed(page, 'language', 'en');
  await seed(page, 'onboarding', { done: true, ageRange: null });
  await page.addInitScript(() => {
    window.__spoken = [];
    window.__voices = [
      { voiceURI: 'en-us', name: 'US voice', lang: 'en-US', default: true, localService: true },
      { voiceURI: 'en-gb', name: 'UK voice', lang: 'en-GB', default: false, localService: false },
      { voiceURI: 'zh-cn', name: 'Chinese voice', lang: 'zh-CN', default: false, localService: true },
    ];
    class FakeUtterance {
      text: string; rate = 1; lang = ''; voice = null; onend = null; onerror = null;
      constructor(text: string) { this.text = text; }
    }
    Object.defineProperty(window, 'SpeechSynthesisUtterance', { configurable: true, value: FakeUtterance });
    Object.defineProperty(window, 'speechSynthesis', { configurable: true, value: {
      paused: false,
      getVoices: () => window.__voices,
      cancel: () => { window.__speechCurrent = null; },
      resume: () => {}, addEventListener: () => {}, removeEventListener: () => {},
      speak: (u: Utterance) => {
        if (!u.text) return;
        window.__speechCurrent = u;
        window.__spoken.push({ text: u.text, rate: u.rate, lang: u.lang, voice: u.voice?.voiceURI ?? null });
      },
    } });
    window.__speechDone = () => { const u = window.__speechCurrent; window.__speechCurrent = null; u?.onend?.(); };
    window.__speechFail = () => { const u = window.__speechCurrent; window.__speechCurrent = null; u?.onerror?.({ error: 'failed' }); };
  });
}

async function open(page: Page) {
  await page.goto('/bible');
  await expect(page.getByTestId('verse-1')).toBeVisible();
}
async function start(page: Page) {
  await page.getByTestId('reader-tools-button').click();
  await expect(page.getByTestId('read-aloud-start')).toContainText('From verse 1');
  await page.getByTestId('read-aloud-start').click();
  await expect(page.getByTestId('read-aloud-toggle')).toHaveAccessibleName('Pause');
  await expect(page.getByTestId('read-aloud-toggle')).toBeFocused();
}
const current = (page: Page) => page.evaluate(() => window.__speechCurrent?.text);
async function finishChapter(page: Page) {
  await page.evaluate(() => { for (let i = 0; i < 200 && window.__speechCurrent; i++) window.__speechDone(); });
}

test.use({ locale: 'en-US', colorScheme: 'light' });

test('Silver CTA fills stay solid and the Back pill has a glass surface', async ({ page }) => {
  await setup(page, 'WEB');
  await seed(page, 'appearance', { preset: 'silver', mode: 'light' });
  await open(page);
  await page.getByTestId('reader-tools-button').click();
  await expect(page.getByTestId('read-aloud-start').locator(':scope > div').first()).toHaveCSS('background-image', 'none');
  await page.getByTestId('read-aloud-start').click();
  await expect(page.getByTestId('read-aloud-toggle')).toBeFocused();
  await expect(page.getByTestId('read-aloud-toggle')).toHaveCSS('background-image', 'none');
  await page.getByTestId('read-aloud-speed').click();
  await expect(page.getByTestId('read-aloud-rate-1')).toHaveCSS('background-image', 'none');
  await page.keyboard.press('Escape');
  await page.getByTestId('reader-scroll').hover();
  await page.mouse.wheel(0, 700);
  const back = page.getByTestId('read-aloud-back');
  await expect(back).toBeVisible();
  await expect(back.locator(':scope > div').first()).not.toHaveCSS('backdrop-filter', 'none');
  await expect.poll(async () => (await back.boundingBox())?.height).toBe(44);
  await finishChapter(page);
  await expect(page.getByTestId('read-aloud-play-next')).toHaveCSS('background-image', 'none');
});

test('start, underline, pause/restart, verse controls, retry, Stop and focus return', async ({ page }) => {
  await setup(page);
  await open(page);
  await start(page);
  await expect(page.getByTestId('verse-1')).toHaveAttribute('aria-current', 'true');
  await expect(page.getByTestId('verse-1')).toHaveCSS('text-decoration-thickness', '3px');
  await expect(page.getByTestId('verse-1')).toHaveCSS('text-underline-offset', '5px');
  expect(await current(page)).toBe('John 3:1 BSB');
  await page.getByTestId('read-aloud-toggle').click();
  await expect(page.getByTestId('read-aloud-live')).toHaveText('Paused');
  await page.getByTestId('read-aloud-toggle').click();
  expect(await page.evaluate(() => window.__spoken.map((x) => x.text))).toEqual(['John 3:1 BSB', 'John 3:1 BSB']);
  await page.getByTestId('read-aloud-next').click();
  expect(await current(page)).toBe('John 3:2 BSB');
  await page.getByTestId('read-aloud-prev').click();
  expect(await current(page)).toBe('John 3:1 BSB');
  await page.evaluate(() => window.__speechFail());
  await expect(page.getByTestId('read-aloud-status')).toHaveText('Couldn’t read verse 1');
  await page.getByTestId('read-aloud-toggle').click();
  expect(await current(page)).toBe('John 3:1 BSB');
  await page.getByTestId('read-aloud-stop').click();
  await expect(page.getByTestId('read-aloud-bar')).toHaveCount(0);
  await expect(page.getByTestId('reader-tools-button')).toBeFocused();
  await expect(page.getByTestId('read-aloud-live')).toHaveCount(1);
});

test('speed/voice radios wrap with arrows, sample state does not announce a pause, Escape restores speed focus', async ({ page }) => {
  await setup(page); await open(page); await start(page);
  await page.getByTestId('read-aloud-speed').click();
  await expect(page.getByRole('heading', { name: 'Voice and speed' })).toBeFocused();
  await page.getByTestId('read-aloud-rate-1.25').click();
  await page.getByTestId('read-aloud-rate-1.25').press('ArrowRight');
  await expect(page.getByTestId('read-aloud-rate-1.5')).toBeFocused();
  await expect(page.getByTestId('read-aloud-rate-1.5')).toHaveAttribute('aria-checked', 'true');
  await page.getByTestId('read-aloud-voice-0').focus();
  await page.getByTestId('read-aloud-voice-0').press('ArrowUp');
  await expect(page.getByTestId('read-aloud-voice-1')).toBeFocused();
  await expect(page.getByTestId('read-aloud-voice-1')).toHaveAttribute('aria-checked', 'true');
  await page.getByTestId('read-aloud-sample-1').click();
  await expect(page.getByTestId('read-aloud-sample-1')).toHaveAttribute('aria-pressed', 'true');
  await expect(page.getByTestId('read-aloud-live')).toHaveText('');
  expect(await page.evaluate(() => window.__spoken.at(-1))).toMatchObject({ text: 'John 3:1 BSB', rate: 1.5, voice: 'en-gb' });
  await page.getByTestId('read-aloud-sample-1').click();
  await expect(page.getByTestId('read-aloud-sample-1')).toHaveAttribute('aria-pressed', 'false');
  expect(await current(page)).toBeUndefined();
  await page.getByTestId('read-aloud-sample-0').click();
  await page.evaluate(() => window.__speechDone());
  await expect(page.getByTestId('read-aloud-sample-0')).toHaveAttribute('aria-pressed', 'false');
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('read-aloud-speed')).toBeFocused();
  await expect(page.getByTestId('read-aloud-toggle')).toHaveAccessibleName('Play');
  await expect(page.getByTestId('read-aloud-speed')).toHaveText('1.5×');
  await expect(page.getByTestId('read-aloud-speed')).toHaveAccessibleName('Voice and speed, speed 1.5 times');
  await page.getByTestId('read-aloud-toggle').click();
  expect(await page.evaluate(() => window.__spoken.at(-1)?.rate)).toBe(1.5);
});

test('end offer, Play next, Done and automatic next chapter', async ({ page }) => {
  await setup(page); await open(page); await start(page);
  await finishChapter(page);
  await expect(page.getByTestId('read-aloud-status')).toHaveText('End of John 3');
  await expect(page.getByTestId('read-aloud-play-next')).toBeFocused();
  await page.getByTestId('read-aloud-play-next').click();
  await expect(page.getByTestId('reader-book-button')).toContainText('John 4');
  await expect.poll(() => current(page)).toBe('John 4:1 BSB');
  await expect(page.getByTestId('read-aloud-toggle')).toBeFocused();
  await page.getByTestId('read-aloud-speed').click();
  await page.getByTestId('read-aloud-auto-next').click();
  await expect(page.getByTestId('read-aloud-auto-next')).toHaveAttribute('aria-checked', 'true');
  await page.keyboard.press('Escape');
  await finishChapter(page);
  await expect.poll(() => current(page)).toBe('John 5:1 BSB');
  await page.getByTestId('read-aloud-speed').click();
  await page.getByTestId('read-aloud-auto-next').click();
  await page.keyboard.press('Escape');
  await finishChapter(page);
  await page.getByTestId('read-aloud-done').click();
  await expect(page.getByTestId('reader-tools-button')).toBeFocused();
});

test('parallel only reads/marks the first translation; verse sheet hides bar while speech keeps running', async ({ page }, testInfo) => {
  await setup(page); await open(page); await start(page);
  await page.getByTestId('reader-settings-button').click();
  await page.getByTestId('settings-parallel').click();
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('verse-1-second')).toBeVisible();
  await expect(page.getByTestId('verse-1')).toHaveAttribute('aria-current', 'true');
  await expect(page.getByTestId('verse-1-second')).not.toHaveAttribute('aria-current');
  expect(await current(page)).toBe('John 3:1 BSB');
  await page.getByTestId('verse-1-tools').click();
  if (testInfo.project.name === 'desktop') {
    await expect(page.getByTestId('read-aloud-bar')).toHaveCount(1);
    await expect(page.getByTestId('read-aloud-bar')).toBeVisible();
  } else {
    await expect(page.getByTestId('read-aloud-bar')).toHaveCount(0);
  }
  await expect(page.getByTestId('read-aloud-live')).toHaveCount(1);
  await page.evaluate(() => window.__speechDone());
  expect(await current(page)).toBe('John 3:2 BSB');
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('read-aloud-bar')).toBeVisible();
  await expect(page.getByTestId('verse-2')).toHaveAttribute('aria-current', 'true');
  await expect(page.getByTestId('verse-1-tools')).toBeFocused();
});

test('no Chinese voice explains, retry stays inline, installed voice reads text without numbers or alternate readings', async ({ page }) => {
  await setup(page, 'CUV-SIMP'); await open(page);
  await page.evaluate(() => { window.__voices = window.__voices.filter((v) => v.lang.startsWith('en')); });
  await page.getByTestId('reader-tools-button').click(); await page.getByTestId('read-aloud-start').click();
  await expect(page.getByTestId('no-voice-sheet')).toContainText('No Chinese voice on this device');
  expect(await page.evaluate(() => window.__spoken)).toEqual([]);
  await page.getByTestId('read-aloud-check').click();
  await expect(page.getByTestId('read-aloud-no-voice-still')).toHaveText('Still no Chinese voice');
  await page.evaluate(() => { window.__voices.push({ voiceURI: 'new-zh', name: 'Mandarin', lang: 'zh-CN', default: false, localService: true }); });
  await page.getByTestId('read-aloud-check').click();
  await expect(page.getByTestId('no-voice-sheet')).toHaveCount(0);
  await expect(page.getByTestId('read-aloud-toggle')).toHaveAccessibleName('Pause');
  await finishChapter(page);
  const spoken = await page.evaluate(() => window.__spoken);
  expect(spoken.length).toBeGreaterThan(30);
  expect(spoken.every((u) => u.voice === 'new-zh' && !/[〔〕0-9]/.test(u.text))).toBe(true);
});

test('manual wheel suspends follow, Back restores it, programmatic follow preserves header', async ({ page }) => {
  await setup(page, 'WEB'); await open(page); await start(page);
  for (let verse = 2; verse <= 16; verse++) {
    await page.getByTestId('read-aloud-next').click();
    await expect(page.getByTestId(`verse-${verse}`)).toHaveAttribute('aria-current', 'true');
  }
  await expect(page.getByTestId('verse-16')).toHaveAttribute('aria-current', 'true');
  await expect(page.getByTestId('reader-header')).not.toHaveAttribute('aria-hidden', 'true');
  await page.getByTestId('reader-scroll').hover();
  await page.mouse.wheel(0, 700);
  await expect(page.getByTestId('read-aloud-back')).toBeVisible();
  await page.getByTestId('read-aloud-back').click();
  await expect(page.getByTestId('read-aloud-back')).toHaveCount(0);
  await expect(page.getByTestId('read-aloud-toggle')).toBeFocused();
  const top = await page.getByTestId('verse-16-tools').evaluate((el) => el.getBoundingClientRect().top);
  expect(top).toBeGreaterThan(0);
  expect(top).toBeLessThan(450);
});

test('starts at the first number below the visible top line', async ({ page }) => {
  await setup(page, 'WEB'); await open(page);
  await page.getByTestId('verse-13-tools').evaluate((el) => {
    const scroll = document.querySelector('[data-testid="reader-scroll"]')!;
    scroll.scrollTop += el.getBoundingClientRect().top - scroll.getBoundingClientRect().top - 90;
  });
  // The header hides a moment after the scroll: wait for that, or the check races it and the button slides away.
  await page.getByTestId('reader-show-controls').click();
  await expect(page.getByTestId('reader-tools-button')).toBeInViewport({ ratio: 1 });
  const expected = await page.getByTestId('reader-scroll').evaluate((scroll) => {
    const top = document.querySelector('[data-testid="reader-header"]')!.getBoundingClientRect().bottom;
    return [...scroll.querySelectorAll('[data-testid$="-tools"]')].find((el) => el.getBoundingClientRect().top >= top)?.getAttribute('data-testid')?.match(/verse-(\d+)/)?.[1];
  });
  await page.getByTestId('reader-tools-button').click();
  await expect(page.getByTestId('read-aloud-start')).toContainText(`From verse ${expected}`);
  await page.getByTestId('read-aloud-start').click();
  await expect(page.getByTestId(`verse-${expected}`)).toHaveAttribute('aria-current', 'true');
});

test('a chapter turn and leaving Bible stop playback, including a hand turn after ended', async ({ page }, testInfo) => {
  await setup(page); await open(page); await start(page);
  await page.getByTestId('reader-next').click();
  await expect(page.getByTestId('read-aloud-bar')).toHaveCount(0);
  expect(await current(page)).toBeUndefined();
  await start(page); await finishChapter(page);
  await page.getByTestId('reader-next').click();
  await expect(page.getByTestId('read-aloud-bar')).toHaveCount(0);
  await start(page);
  await page.getByRole(testInfo.project.name === 'desktop' ? 'link' : 'tab', { name: 'Study tab' }).click();
  await expect(page.getByTestId('screen-study')).toBeVisible();
  await expect.poll(() => current(page)).toBeUndefined();
});

test('desktop centred column and 320px phone fit with 44px controls', async ({ page }, info) => {
  await setup(page);
  if (info.project.name === 'phone') await page.setViewportSize({ width: 320, height: 780 });
  await open(page); await start(page);
  const bar = (await page.getByTestId('read-aloud-bar').boundingBox())!;
  const viewport = page.viewportSize()!;
  expect(bar.width).toBeLessThanOrEqual(720);
  if (info.project.name === 'desktop') {
    const column = (await page.getByTestId('reader-text').boundingBox())!;
    expect(Math.abs(bar.x + bar.width / 2 - (column.x + column.width / 2))).toBeLessThanOrEqual(2);
  } else {
    expect(Math.abs(bar.x + bar.width / 2 - viewport.width / 2)).toBeLessThan(2);
  }
  expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(viewport.width);
  for (const id of ['prev', 'toggle', 'next', 'speed', 'stop']) {
    const b = (await page.getByTestId(`read-aloud-${id}`).boundingBox())!;
    expect(b.width).toBeGreaterThanOrEqual(44); expect(b.height).toBeGreaterThanOrEqual(44);
    expect(b.x).toBeGreaterThanOrEqual(bar.x); expect(b.x + b.width).toBeLessThanOrEqual(bar.x + bar.width);
  }
  await page.screenshot({ path: info.outputPath('read-aloud.png') });
});

test('English BSB keeps a single-row player at 412px and 390px window widths', async ({ page }) => {
  await setup(page);
  await page.setViewportSize({ width: 412, height: 844 });
  await open(page); await start(page);
  for (const width of [412, 390]) {
    await page.setViewportSize({ width, height: 844 });
    await expect(page.getByTestId('read-aloud-status')).toHaveText('Reading BSB');
    await expect(page.getByTestId('read-aloud-verse')).toHaveText('Verse 1');
    await expect.poll(async () => {
      const label = (await page.getByTestId('read-aloud-status').boundingBox())!;
      const toggle = (await page.getByTestId('read-aloud-toggle').boundingBox())!;
      return label.x + label.width <= toggle.x;
    }).toBe(true);
  }
});
