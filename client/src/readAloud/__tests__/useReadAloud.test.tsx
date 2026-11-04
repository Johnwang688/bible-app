import { act, renderHook } from '@testing-library/react-native';

import { createStorage, memoryBackend } from '../../storage/storage';
import type { ReadAloudChapter } from '../controller';
import { readAloudPrefsKey } from '../keys';
import { readAloudChapter, useReadAloud, type UseReadAloudOptions } from '../useReadAloud';
import { FakeEngine } from './fakeEngine';

// The controller's watchdog uses timers; fake ones keep tests from leaving real timers behind.
beforeEach(() => jest.useFakeTimers());
afterEach(() => jest.useRealTimers());

const bsb = { verses: [{ verse: 16, text: 'For God so loved the world.' }, { verse: 17, text: 'For God did not send His Son.' }] };
const cuv = { verses: [{ verse: 16, text: '神爱世人。' }, { verse: 17, text: '因为神差他的儿子降世。' }] };

describe('readAloudChapter', () => {
  const here = { bookNumber: 43, chapter: 3 };
  const next = { bookNumber: 43, chapter: 4 };

  it('takes the first translation only, in parallel reading too', () => {
    const ch = readAloudChapter(here, ['BSB', 'CUV-SIMP'], { BSB: bsb, 'CUV-SIMP': cuv }, next);
    expect(ch).toEqual({
      key: '43:3:BSB',
      translation: 'BSB',
      verses: bsb.verses,
      nextKey: '43:4:BSB',
    });
    expect(readAloudChapter(here, ['CUV-SIMP', 'BSB'], { BSB: bsb, 'CUV-SIMP': cuv }, null)).toMatchObject({
      key: '43:3:CUV-SIMP',
      verses: cuv.verses,
      nextKey: null,
    });
  });

  it('is null until the first translation has loaded, even if the second has', () => {
    expect(readAloudChapter(here, ['CUV-SIMP', 'BSB'], { BSB: bsb }, next)).toBeNull();
    expect(readAloudChapter(here, [], { BSB: bsb }, next)).toBeNull();
  });
});

function chapter(n: number): ReadAloudChapter {
  return readAloudChapter({ bookNumber: 43, chapter: n }, ['CUV-SIMP'], { 'CUV-SIMP': cuv }, { bookNumber: 43, chapter: n + 1 })!;
}

async function setup(initial: Partial<UseReadAloudOptions> = {}) {
  const engine = new FakeEngine();
  const storage = createStorage(memoryBackend());
  const props: UseReadAloudOptions = { chapter: chapter(3), active: true, engine, storage, ...initial };
  const view = await renderHook((p: UseReadAloudOptions) => useReadAloud(p), { initialProps: props });
  return { engine, storage, view, props };
}

describe('useReadAloud', () => {
  it('exposes the sample state and stopSample without resuming reading', async () => {
    const { view, engine } = await setup();
    await act(async () => view.result.current.start());
    await act(async () => view.result.current.sample('tingting', '神爱世人。'));
    expect(view.result.current).toMatchObject({ status: 'paused', sampleVoiceId: 'tingting' });
    await act(async () => view.result.current.stopSample());
    expect(view.result.current).toMatchObject({ status: 'paused', sampleVoiceId: null });
    expect(engine.current).toBeNull();
  });

  it('starts, plays and moves through the chapter', async () => {
    const { engine, view } = await setup();
    await act(async () => view.result.current.start(17));
    expect(view.result.current).toMatchObject({ status: 'playing', verse: 17 });
    await act(async () => engine.finish());
    expect(view.result.current.status).toBe('ended');
  });

  it('stops when the reader shows another chapter', async () => {
    const { view, props } = await setup();
    await act(async () => view.result.current.start());
    await act(async () => view.rerender({ ...props, chapter: chapter(5) }));
    expect(view.result.current.status).toBe('idle');
  });

  it('stops when the Bible tab is left', async () => {
    const { view, props, engine } = await setup();
    await act(async () => view.result.current.start());
    await act(async () => view.rerender({ ...props, active: false }));
    expect(view.result.current.status).toBe('idle');
    expect(engine.current).toBeNull();
  });

  it('reads on into the next chapter once the reader has turned to it', async () => {
    const { engine, view, props } = await setup();
    await act(async () => view.result.current.setAutoAdvance(true));
    await act(async () => view.result.current.start(17));
    await act(async () => engine.finish());
    expect(view.result.current.status).toBe('advancing');
    await act(async () => view.rerender({ ...props, chapter: null }));
    expect(view.result.current.status).toBe('advancing');
    await act(async () => view.rerender({ ...props, chapter: chapter(4) }));
    expect(view.result.current).toMatchObject({ status: 'playing', chapterKey: '43:4:CUV-SIMP', verse: 16 });
  });

  it('remembers speed, auto-advance and voice in storage', async () => {
    const { view, storage } = await setup();
    await act(async () => view.result.current.start());
    await act(async () => {
      view.result.current.setRate(1.25);
      view.result.current.setVoice('meijia');
    });
    expect(storage.get(readAloudPrefsKey)).toEqual({ rate: 1.25, autoAdvance: false, voices: { 'zh-Hans': 'meijia' } });
  });

  it('lists the voices for the chapter’s language', async () => {
    const { view } = await setup();
    let ids: string[] = [];
    await act(async () => {
      ids = (await view.result.current.listVoices()).map((v) => v.id);
    });
    expect(ids).toEqual(['tingting', 'meijia', 'sinji']);
  });

  it('stops speaking on unmount', async () => {
    const { view, engine } = await setup();
    await act(async () => view.result.current.start());
    await act(async () => view.unmount());
    expect(engine.current).toBeNull();
  });
});
