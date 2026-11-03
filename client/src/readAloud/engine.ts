// The native speech adapter (iOS, Android): `expo-speech`. The web build resolves engine.web.ts instead.
//  - Android's text-to-speech engine starts up asynchronously, so the voice list can be empty for a
//    moment after launch; `getVoices` asks again a few times before answering empty.
//  - expo-speech QUEUES a new utterance behind one still speaking (Android QUEUE_ADD, and iOS's
//    synthesizer), so `speak` stops a live utterance first, as the web adapter does.
//  - `Speech.stop()` calls `onStopped`, never `onDone`; a token per utterance still guards against a
//    late callback reaching a newer utterance.
//  - Android builds the language with `Locale.Builder().setLanguage(tag)`, which rejects a full tag
//    (`zh-CN`) and falls back to the device language; it gets the bare language (`zh`), and the
//    voice id picks the voice. Google voices that need the network end in `-network`.
//  - iOS: speech follows the app's audio session, which the ring/silent switch mutes by default, so the
//    first `speak` sets `playsInSilentMode` (a partial mode; the Memory recorder sets its own fields).
//  - Android has no pause or resume, so the controller never uses them (decision 6).
import * as Speech from 'expo-speech';
import { Platform } from 'react-native';

import { interruptedError, type SpeakOptions, type SpeechEngine, type SpeechVoice } from './types';

export type SpeechModule = Pick<typeof Speech, 'speak' | 'stop' | 'getAvailableVoicesAsync'>;

export interface NativeSpeechOptions {
  platform?: 'ios' | 'android';
  /** How many more times to ask for voices when the list comes back empty. */
  retries?: number;
  retryMs?: number;
  sleep?: (ms: number) => Promise<void>;
  /** Run once, before the first utterance. */
  prepareAudio?: () => Promise<void>;
}

const wait = (ms: number) => new Promise<void>((resolve) => setTimeout(resolve, ms));

/** Lets speech play with the silent switch on (iOS). expo-audio is required lazily, as the Memory recorder does. */
async function playInSilentMode(): Promise<void> {
  // A lazy, guarded require: a static import would crash at load on a build without the native module.
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const audio = require('expo-audio') as { setAudioModeAsync?: (mode: { playsInSilentMode: boolean }) => Promise<void> };
  await audio.setAudioModeAsync?.({ playsInSilentMode: true });
}

function toVoice(v: Speech.Voice): SpeechVoice {
  return {
    id: v.identifier,
    name: v.name,
    lang: v.language,
    isDefault: false,
    localService: !/-network$/i.test(v.identifier),
    enhanced: v.quality === Speech.VoiceQuality.Enhanced,
  };
}

export function createNativeSpeechEngine(mod: SpeechModule, options: NativeSpeechOptions = {}): SpeechEngine {
  const {
    platform = Platform.OS === 'android' ? 'android' : 'ios',
    retries = 3,
    retryMs = 600,
    sleep = wait,
    prepareAudio = playInSilentMode,
  } = options;
  let token = 0;
  /** An utterance has been handed to the module and has not ended, failed or been stopped. */
  let live = false;
  let audioReady = false;

  const halt = () => {
    token++;
    live = false;
    mod.stop().catch(() => {});
  };

  return {
    async getVoices() {
      for (let attempt = 0; ; attempt++) {
        let list: Speech.Voice[] = [];
        try {
          list = await mod.getAvailableVoicesAsync();
        } catch {
          list = [];
        }
        if (list.length > 0 || attempt >= retries) return list.map(toVoice);
        await sleep(retryMs);
      }
    },

    speak(text: string, opts: SpeakOptions) {
      if (!audioReady) {
        audioReady = true;
        try {
          prepareAudio().catch(() => {});
        } catch {
          // A session that cannot be set leaves speech as the system plays it.
        }
      }
      if (live) halt();
      const mine = ++token;
      const current = () => mine === token;
      const settle = () => {
        token++;
        live = false;
      };
      live = true;
      mod.speak(text, {
        language: platform === 'android' ? (opts.lang.split(/[-_]/)[0] ?? opts.lang) : opts.lang,
        voice: opts.voiceId ?? undefined,
        rate: opts.rate,
        onDone: () => {
          if (!current()) return;
          settle();
          opts.onDone();
        },
        onStopped: () => {
          // Stopped by something other than us (we bump the token before stopping).
          if (!current()) return;
          settle();
          opts.onError(interruptedError());
        },
        onError: (err: Error) => {
          if (!current()) return;
          settle();
          opts.onError(err);
        },
      });
    },

    stop() {
      halt();
    },
  };
}

export function createSpeechEngine(): SpeechEngine {
  return createNativeSpeechEngine(Speech);
}
