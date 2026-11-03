// Regression tests from the engine review (round 1): each failed before its fix.
import { act, renderHook } from '@testing-library/react-native';
import { StrictMode, createElement, type ReactNode } from 'react';

import { createStorage, memoryBackend } from '../../storage/storage';
import { ReadAloudController, memoryPrefs, readAloudKey, type ReadAloudChapter } from '../controller';
import { pickVoice } from '../language';
import { chunkForSpeech, maxPieceLength, speakableText } from '../text';
import { RATES } from '../types';
import { readAloudChapter, useReadAloud, type UseReadAloudOptions } from '../useReadAloud';
import { FakeEngine, voice } from './fakeEngine';

beforeEach(() => jest.useFakeTimers());
afterEach(() => jest.useRealTimers());

const J3 = readAloudKey(43, 3, 'CUV-SIMP');
const J4 = readAloudKey(43, 4, 'CUV-SIMP');
const ch = (verses: [number, string][], key = J3, nextKey: string | null = J4): ReadAloudChapter => ({
  key,
  translation: 'CUV-SIMP',
  verses: verses.map(([verse, text]) => ({ verse, text })),
  nextKey,
});
const john3 = ch([
  [16, '神爱世人。'],
  [17, '因为神差他的儿子降世。'],
  [18, '信他的人，不被定罪。'],
]);

describe('review: following', () => {
  it('stays off after the user scrolls, when the next verse starts by itself', async () => {
    const engine = new FakeEngine();
    const c = new ReadAloudController({ engine });
    await c.start(john3, 16);
    c.userScrolled();
    engine.finish(); // verse 16 ends naturally; 17 starts
    expect(c.getState().verse).toBe(17);
    expect(c.getState().following).toBe(false);
  });
});

describe('review: controls during preparing', () => {
  it('a pause while the voices load is not lost', async () => {
    const engine = new FakeEngine();
    engine.holdVoices = true;
    const c = new ReadAloudController({ engine });
    const p = c.start(john3, 16);
    c.pause(); // user taps pause during the (up to 3 s) voice wait
    engine.releaseVoices();
    await p;
    expect(c.getState().status).not.toBe('playing');
  });
});

describe('review: error recovery', () => {
  it('Play after an engine error retries the verse', async () => {
    const engine = new FakeEngine();
    const c = new ReadAloudController({ engine });
    await c.start(john3, 16);
    engine.fail('synthesis-failed');
    c.toggle();
    expect(c.getState().status).toBe('playing');
  });
});

describe('review: paused + next on the last verse', () => {
  it('does not start reading the next chapter while the user has paused', async () => {
    const engine = new FakeEngine();
    const c = new ReadAloudController({ engine, prefs: memoryPrefs({ rate: 1, autoAdvance: true, voices: {} }) });
    await c.start(john3, 18);
    c.pause();
    c.next();
    expect(c.getState().status).not.toBe('advancing');
  });
});

describe('review: sample then Play on native (QUEUE_ADD)', () => {
  it('resume stops the still-playing sample before speaking the verse', async () => {
    const engine = new FakeEngine();
    const c = new ReadAloudController({ engine });
    await c.start(john3, 16);
    c.sample('meijia', '你好');
    const stops = engine.stops;
    c.resume(); // sample not finished yet
    expect(engine.stops).toBeGreaterThan(stops);
  });
});

describe('review: default voice ranking on real device lists', () => {
  it('Android (Google TTS names): the default English voice is en-US, not en-AU', () => {
    const android = ['en-au-x-aua-local', 'en-gb-x-gba-local', 'en-in-x-ahp-local', 'en-us-x-sfg-local'].map((n) =>
      voice(n, n.slice(0, 5).replace(/^(..)-(..)/, (_, l: string, r: string) => `${l}-${r.toUpperCase()}`), { enhanced: true }),
    );
    expect(pickVoice(android, 'BSB', undefined)?.lang).toBe('en-US');
  });

  it('iOS: a novelty voice is never the default', () => {
    const ios = [voice('com.apple.speech.synthesis.voice.Albert', 'en-US'), voice('com.apple.voice.compact.en-US.Samantha', 'en-US')];
    ios[0]!.name = 'Albert';
    ios[1]!.name = 'Samantha';
    expect(pickVoice(ios, 'BSB', undefined)?.name).toBe('Samantha');
  });
});

describe('review: chunker on real long verses', () => {
  const esther89en =
    'Then the king’s scribes were called at that time, in the third month Sivan, on the twenty-third day of the month; and it was written according to all that Mordecai commanded to the Jews, and to the local governors, and the governors and princes of the provinces which are from India to Ethiopia, one hundred twenty-seven provinces, to every province according to its writing, and to every people in their language, and to the Jews in their writing, and in their language.';
  const esther89zh =
    '三月，就是西弯月，二十三日，将王的书记叫来，按着末底改一切所吩咐的，用各省的文字、各族的方言，并犹大人的文字、方言写谕旨，传给那从印度直到古实一百二十七省的犹大人和总督、省长、首领。';
  const gen11 = '神说：“要有光，”就有了光。　神看光是好的，就把光暗分开了。';
  const strip = (s: string) => s.replace(/\s+/g, '');
  for (const rate of RATES) {
    it(`loses nothing and fits, rate ${rate}`, () => {
      for (const [text, group] of [
        [esther89en, 'en'],
        [esther89zh, 'zh-Hans'],
        [speakableText(gen11), 'zh-Hans'],
      ] as const) {
        const max = maxPieceLength(group, rate);
        const pieces = chunkForSpeech(text, max);
        expect(strip(pieces.join(''))).toBe(strip(text));
        expect(pieces.every((p) => p.length <= max)).toBe(true);
        if (group === 'en') expect(pieces.join(' ').split(/\s+/)).toEqual(text.split(/\s+/));
      }
    });
  }
});

describe('review: StrictMode', () => {
  it('the hook still updates after the double mount/dispose', async () => {
    const engine = new FakeEngine();
    const storage = createStorage(memoryBackend());
    const chapter = readAloudChapter(
      { bookNumber: 43, chapter: 3 },
      ['CUV-SIMP'],
      { 'CUV-SIMP': { verses: [{ verse: 16, text: '神爱世人。' }, { verse: 17, text: '因为神差他的儿子降世。' }] } },
      { bookNumber: 43, chapter: 4 },
    );
    const props: UseReadAloudOptions = { chapter, active: true, engine, storage };
    const wrapper = ({ children }: { children: ReactNode }) => createElement(StrictMode, null, children);
    const view = await renderHook((p: UseReadAloudOptions) => useReadAloud(p), { initialProps: props, wrapper });
    await act(async () => view.result.current.start(16));
    expect(view.result.current.status).toBe('playing');
    await act(async () => engine.finish());
    expect(view.result.current.verse).toBe(17);
  });
});
