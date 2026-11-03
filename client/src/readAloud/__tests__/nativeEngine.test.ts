// The native adapter against a fake `expo-speech` module.
import type * as Speech from 'expo-speech';

import { createNativeSpeechEngine as create, type NativeSpeechOptions, type SpeechModule } from '../engine';

const createNativeSpeechEngine = (mod: SpeechModule, options: NativeSpeechOptions = {}) =>
  create(mod, { platform: 'ios', prepareAudio: async () => {}, ...options });

type Options = NonNullable<Parameters<typeof Speech.speak>[1]>;

function fakeModule(voiceLists: Speech.Voice[][]) {
  const calls: { text: string; options: Options }[] = [];
  let list = 0;
  const mod = {
    getAvailableVoicesAsync: jest.fn(async () => voiceLists[Math.min(list++, voiceLists.length - 1)] ?? []),
    speak: jest.fn((text: string, options: Options = {}) => {
      calls.push({ text, options });
    }),
    stop: jest.fn(async () => {}),
  };
  return { mod: mod as unknown as SpeechModule & typeof mod, calls };
}

const tingting = { identifier: 'com.apple.voice.compact.zh-CN.Tingting', name: 'Tingting', language: 'zh-CN', quality: 'Default' } as Speech.Voice;
const meijiaPremium = { identifier: 'meijia-premium', name: 'Meijia', language: 'zh-TW', quality: 'Enhanced' } as Speech.Voice;

describe('getVoices', () => {
  it('maps the voices, enhanced ones marked', async () => {
    const { mod } = fakeModule([[tingting, meijiaPremium]]);
    const voices = await createNativeSpeechEngine(mod).getVoices();
    expect(voices).toEqual([
      { id: tingting.identifier, name: 'Tingting', lang: 'zh-CN', isDefault: false, localService: true, enhanced: false },
      { id: 'meijia-premium', name: 'Meijia', lang: 'zh-TW', isDefault: false, localService: true, enhanced: true },
    ]);
  });

  it('marks Google voices that need the network', async () => {
    const local = { identifier: 'en-us-x-sfg-local', name: 'en-us-x-sfg-local', language: 'en-US', quality: 'Default' } as Speech.Voice;
    const network = { identifier: 'en-us-x-sfg-network', name: 'en-us-x-sfg-network', language: 'en-US', quality: 'Default' } as Speech.Voice;
    const { mod } = fakeModule([[local, network]]);
    const voices = await createNativeSpeechEngine(mod).getVoices();
    expect(voices.map((v) => v.localService)).toEqual([true, false]);
  });

  it('asks again while Android’s speech engine is still starting', async () => {
    const { mod } = fakeModule([[], [], [tingting]]);
    const sleep = jest.fn(async () => {});
    const voices = await createNativeSpeechEngine(mod, { sleep }).getVoices();
    expect(voices.map((v) => v.lang)).toEqual(['zh-CN']);
    expect(mod.getAvailableVoicesAsync).toHaveBeenCalledTimes(3);
  });

  it('answers empty after its retries, and treats a failure as no voices', async () => {
    const { mod } = fakeModule([[]]);
    mod.getAvailableVoicesAsync.mockRejectedValueOnce(new Error('no tts'));
    const voices = await createNativeSpeechEngine(mod, { retries: 2, sleep: async () => {} }).getVoices();
    expect(voices).toEqual([]);
    expect(mod.getAvailableVoicesAsync).toHaveBeenCalledTimes(3);
  });
});

describe('speak', () => {
  const opts = () => ({ lang: 'zh-CN', voiceId: 'v1', rate: 1.5, onDone: jest.fn(), onError: jest.fn() });

  it('passes language, voice and speed', () => {
    const { mod, calls } = fakeModule([[]]);
    createNativeSpeechEngine(mod).speak('神爱世人', opts());
    expect(calls[0]).toMatchObject({ text: '神爱世人', options: { language: 'zh-CN', voice: 'v1', rate: 1.5 } });
  });

  it('reports the end once', () => {
    const { mod, calls } = fakeModule([[]]);
    const o = opts();
    createNativeSpeechEngine(mod).speak('text', o);
    calls[0]!.options.onDone?.();
    calls[0]!.options.onDone?.();
    expect(o.onDone).toHaveBeenCalledTimes(1);
  });

  it('sends nothing after stop, whatever the module calls back late', () => {
    const { mod, calls } = fakeModule([[]]);
    const engine = createNativeSpeechEngine(mod);
    const o = opts();
    engine.speak('text', o);
    engine.stop();
    calls[0]!.options.onStopped?.();
    calls[0]!.options.onDone?.();
    calls[0]!.options.onError?.(new Error('late'));
    expect(o.onDone).not.toHaveBeenCalled();
    expect(o.onError).not.toHaveBeenCalled();
    expect(mod.stop).toHaveBeenCalledTimes(1);
  });

  it('a newer utterance makes the older one’s callbacks stale', () => {
    const { mod, calls } = fakeModule([[]]);
    const engine = createNativeSpeechEngine(mod);
    const first = opts();
    const second = opts();
    engine.speak('one', first);
    engine.speak('two', second);
    calls[0]!.options.onDone?.();
    calls[1]!.options.onDone?.();
    expect(first.onDone).not.toHaveBeenCalled();
    expect(second.onDone).toHaveBeenCalledTimes(1);
  });

  it('reports a stop it did not ask for (another app, a call) as interrupted', () => {
    const { mod, calls } = fakeModule([[]]);
    const o = opts();
    createNativeSpeechEngine(mod).speak('text', o);
    calls[0]!.options.onStopped?.();
    expect(o.onError).toHaveBeenCalledWith(expect.objectContaining({ name: 'interrupted' }));
  });

  it('passes errors on', () => {
    const { mod, calls } = fakeModule([[]]);
    const o = opts();
    createNativeSpeechEngine(mod).speak('text', o);
    calls[0]!.options.onError?.(new Error('engine busy'));
    expect(o.onError).toHaveBeenCalledWith(expect.objectContaining({ message: 'engine busy' }));
  });

  it('stops a live utterance before the next, since expo-speech would queue it behind', () => {
    const { mod, calls } = fakeModule([[]]);
    const engine = createNativeSpeechEngine(mod);
    engine.speak('sample', opts());
    engine.speak('verse', opts());
    expect(mod.stop).toHaveBeenCalledTimes(1);
    calls[1]!.options.onDone?.();
    engine.speak('next verse', opts());
    expect(mod.stop).toHaveBeenCalledTimes(1);
  });

  it('sends Android the bare language, which its Locale.Builder accepts; iOS the full tag', () => {
    const android = fakeModule([[]]);
    createNativeSpeechEngine(android.mod, { platform: 'android' }).speak('神爱世人', opts());
    expect(android.calls[0]?.options.language).toBe('zh');
    const ios = fakeModule([[]]);
    createNativeSpeechEngine(ios.mod).speak('神爱世人', opts());
    expect(ios.calls[0]?.options.language).toBe('zh-CN');
  });

  it('sets the audio session once, before the first utterance, and survives it failing', () => {
    const { mod } = fakeModule([[]]);
    const prepareAudio = jest.fn(async () => {
      throw new Error('no session');
    });
    const engine = createNativeSpeechEngine(mod, { prepareAudio });
    engine.speak('one', opts());
    engine.speak('two', opts());
    expect(prepareAudio).toHaveBeenCalledTimes(1);
    expect(mod.speak).toHaveBeenCalledTimes(2);
  });

  it('swallows a rejected stop', async () => {
    const { mod } = fakeModule([[]]);
    mod.stop.mockRejectedValueOnce(new Error('not speaking'));
    expect(() => createNativeSpeechEngine(mod).stop()).not.toThrow();
    await Promise.resolve();
  });
});
