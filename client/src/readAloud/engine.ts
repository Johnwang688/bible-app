// The native speech adapter (iOS, Android): `expo-speech`. The web build resolves engine.web.ts instead.
//  - Android's text-to-speech engine starts up asynchronously, so the voice list can be empty for a
//    moment after launch; `getVoices` asks again a few times before answering empty.
//  - `Speech.stop()` calls `onStopped`, never `onDone`; a token per utterance still guards against a
//    late callback reaching a newer utterance.
//  - Android has no pause or resume, so the controller never uses them (decision 6).
import * as Speech from 'expo-speech';

import { interruptedError, type SpeakOptions, type SpeechEngine, type SpeechVoice } from './types';

export type SpeechModule = Pick<typeof Speech, 'speak' | 'stop' | 'getAvailableVoicesAsync'>;

export interface NativeSpeechOptions {
  /** How many more times to ask for voices when the list comes back empty. */
  retries?: number;
  retryMs?: number;
  sleep?: (ms: number) => Promise<void>;
}

const wait = (ms: number) => new Promise<void>((resolve) => setTimeout(resolve, ms));

function toVoice(v: Speech.Voice): SpeechVoice {
  return {
    id: v.identifier,
    name: v.name,
    lang: v.language,
    isDefault: false,
    localService: true,
    enhanced: v.quality === Speech.VoiceQuality.Enhanced,
  };
}

export function createNativeSpeechEngine(mod: SpeechModule, options: NativeSpeechOptions = {}): SpeechEngine {
  const { retries = 3, retryMs = 600, sleep = wait } = options;
  let token = 0;

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
      const mine = ++token;
      const live = () => mine === token;
      mod.speak(text, {
        language: opts.lang,
        voice: opts.voiceId ?? undefined,
        rate: opts.rate,
        onDone: () => {
          if (!live()) return;
          token++;
          opts.onDone();
        },
        onStopped: () => {
          // Stopped by something other than us (we bump the token before stopping).
          if (!live()) return;
          token++;
          opts.onError(interruptedError());
        },
        onError: (err: Error) => {
          if (!live()) return;
          token++;
          opts.onError(err);
        },
      });
    },

    stop() {
      token++;
      mod.stop().catch(() => {});
    },
  };
}

export function createSpeechEngine(): SpeechEngine {
  return createNativeSpeechEngine(Speech);
}
