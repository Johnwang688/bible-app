// The web adapter against a fake `speechSynthesis` that behaves like the browsers do.
import { createSpeechEngine as createWebEngine, createWebSpeechEngine, type WebUtteranceLike, type WebVoiceLike } from '../engine.web';

const v = (voiceURI: string, lang: string, isDefault = false): WebVoiceLike => ({
  voiceURI,
  name: voiceURI,
  lang,
  default: isDefault,
  localService: true,
});

class FakeUtterance implements WebUtteranceLike {
  lang = '';
  rate = 1;
  voice: WebVoiceLike | null = null;
  onend: ((ev: unknown) => void) | null = null;
  onerror: ((ev: { error?: string }) => void) | null = null;
  constructor(public text: string) {}
}

/** Like Chrome: `cancel()` fires `error` with 'interrupted' on the utterance it cuts off. */
class FakeSynth {
  voices: WebVoiceLike[] = [];
  paused = false;
  spoken: FakeUtterance[] = [];
  speaking: FakeUtterance | null = null;
  cancels = 0;
  resumes = 0;
  private listeners = new Set<() => void>();
  getVoices = () => [...this.voices];
  speak = (u: WebUtteranceLike) => {
    this.spoken.push(u as FakeUtterance);
    this.speaking = u as FakeUtterance;
  };
  cancel = () => {
    this.cancels++;
    const u = this.speaking;
    this.speaking = null;
    u?.onerror?.({ error: 'interrupted' });
  };
  resume = () => {
    this.resumes++;
    this.paused = false;
  };
  addEventListener = (_t: 'voiceschanged', l: () => void) => this.listeners.add(l);
  removeEventListener = (_t: 'voiceschanged', l: () => void) => this.listeners.delete(l);
  fireVoicesChanged = () => this.listeners.forEach((l) => l());
  get listenerCount() {
    return this.listeners.size;
  }
}

function setup(voices: WebVoiceLike[] = []) {
  const synth = new FakeSynth();
  synth.voices = voices;
  const engine = createWebSpeechEngine({ synth, makeUtterance: (t) => new FakeUtterance(t), voiceWaitMs: 3000, pollMs: 250 });
  const onDone = jest.fn();
  const onError = jest.fn();
  return { synth, engine, onDone, onError, opts: { lang: 'zh-CN', voiceId: 'tingting', rate: 1.25, onDone, onError } };
}

describe('getVoices', () => {
  afterEach(() => jest.useRealTimers());

  it('answers at once when the voices are there', async () => {
    const { engine } = setup([v('tingting', 'zh-CN'), v('samantha', 'en-US', true)]);
    await expect(engine.getVoices()).resolves.toEqual([
      { id: 'tingting', name: 'tingting', lang: 'zh-CN', isDefault: false, localService: true, enhanced: false },
      { id: 'samantha', name: 'samantha', lang: 'en-US', isDefault: true, localService: true, enhanced: false },
    ]);
  });

  it('waits for voices that arrive late with voiceschanged (Chrome)', async () => {
    jest.useFakeTimers();
    const { engine, synth } = setup();
    const result = engine.getVoices();
    jest.advanceTimersByTime(100);
    synth.voices = [v('tingting', 'zh-CN')];
    synth.fireVoicesChanged();
    await expect(result).resolves.toHaveLength(1);
    expect(synth.listenerCount).toBe(0);
  });

  it('ignores an early voiceschanged that still has no voices', async () => {
    jest.useFakeTimers();
    const { engine, synth } = setup();
    const result = engine.getVoices();
    synth.fireVoicesChanged();
    jest.advanceTimersByTime(500);
    synth.voices = [v('samantha', 'en-US')];
    synth.fireVoicesChanged();
    await expect(result).resolves.toHaveLength(1);
  });

  it('finds voices that fill in with no event (Safari), by asking again', async () => {
    jest.useFakeTimers();
    const { engine, synth } = setup();
    const result = engine.getVoices();
    synth.voices = [v('meijia', 'zh-TW')];
    jest.advanceTimersByTime(250);
    await expect(result).resolves.toEqual([expect.objectContaining({ id: 'meijia' })]);
  });

  it('answers empty after the wait when the device has no voices', async () => {
    jest.useFakeTimers();
    const { engine, synth } = setup();
    const result = engine.getVoices();
    jest.advanceTimersByTime(3000);
    await expect(result).resolves.toEqual([]);
    expect(synth.listenerCount).toBe(0);
  });
});

describe('speak', () => {
  it('speaks one utterance with the language, speed and chosen voice', () => {
    const { engine, synth, opts } = setup([v('samantha', 'en-US'), v('tingting', 'zh-CN')]);
    engine.speak('神爱世人', opts);
    expect(synth.spoken).toHaveLength(1);
    expect(synth.spoken[0]).toMatchObject({ text: '神爱世人', lang: 'zh-CN', rate: 1.25, voice: { voiceURI: 'tingting' } });
  });

  it('leaves the voice to the browser when the id is unknown', () => {
    const { engine, synth, opts } = setup([v('samantha', 'en-US')]);
    engine.speak('text', opts);
    expect(synth.spoken[0]?.voice).toBeNull();
  });

  it('reports the end once, even when the browser sends it twice', () => {
    const { engine, synth, opts, onDone, onError } = setup();
    engine.speak('text', opts);
    const u = synth.spoken[0]!;
    u.onend?.({});
    u.onend?.({});
    expect(onDone).toHaveBeenCalledTimes(1);
    expect(onError).not.toHaveBeenCalled();
  });

  it('sends nothing after stop, though cancelling fires "interrupted" on the utterance', () => {
    const { engine, synth, opts, onDone, onError } = setup();
    engine.speak('text', opts);
    const u = synth.spoken[0]!;
    engine.stop();
    expect(synth.cancels).toBe(1);
    u.onend?.({});
    u.onerror?.({ error: 'canceled' });
    expect(onDone).not.toHaveBeenCalled();
    expect(onError).not.toHaveBeenCalled();
  });

  it('a new utterance cuts off the old one silently', () => {
    const { engine, synth, opts, onDone, onError } = setup();
    engine.speak('one', opts);
    const second = { ...opts, onDone: jest.fn(), onError: jest.fn() };
    engine.speak('two', second);
    expect(onDone).not.toHaveBeenCalled();
    expect(onError).not.toHaveBeenCalled();
    synth.spoken[1]!.onend?.({});
    expect(second.onDone).toHaveBeenCalledTimes(1);
  });

  it('reports speech cut off from outside as interrupted', () => {
    const { engine, synth, opts, onError } = setup();
    engine.speak('text', opts);
    synth.spoken[0]!.onerror?.({ error: 'interrupted' });
    expect(onError).toHaveBeenCalledWith(expect.objectContaining({ name: 'interrupted' }));
  });

  it('reports other failures with their code', () => {
    const { engine, synth, opts, onError } = setup();
    engine.speak('text', opts);
    synth.spoken[0]!.onerror?.({ error: 'synthesis-failed' });
    expect(onError).toHaveBeenCalledWith(expect.objectContaining({ name: 'synthesis-failed' }));
  });

  it('resumes a speechSynthesis left paused, so the utterance is not stuck in the queue', () => {
    const { engine, synth, opts } = setup();
    synth.paused = true;
    engine.speak('text', opts);
    expect(synth.resumes).toBe(1);
  });
});

describe('unlock', () => {
  it('speaks one empty utterance, the first time only (mobile Safari needs speech started in a tap)', () => {
    const { engine, synth } = setup();
    engine.unlock?.();
    engine.unlock?.();
    expect(synth.spoken.map((u) => u.text)).toEqual(['']);
  });
});

describe('createSpeechEngine (web)', () => {
  it('has no voices where the browser has no speech', async () => {
    await expect(createWebEngine().getVoices()).resolves.toEqual([]);
  });
});
