// Read aloud (R-7): the engine, with no UI yet. The reader's bar and sheets (prototype
// design/proposed/r7-read-aloud.html) build on `useReadAloud`.
export {
  ReadAloudController,
  memoryPrefs,
  readAloudKey,
  type PrefsStore,
  type ReadAloudChapter,
  type ReadAloudState,
  type ReadAloudStatus,
  type ReadAloudVerse,
} from './controller';
export { createSpeechEngine } from './engine';
export { DEFAULT_PREFS, readAloudPrefsKey, type ReadAloudPrefs } from './keys';
export { parseLangTag, pickVoice, speechLanguageFor, voicesFor, type SpeechGroup, type SpeechLanguage } from './language';
export { chunkForSpeech, maxPieceLength, speakableText } from './text';
export { DEFAULT_RATE, RATES, type SpeakOptions, type SpeechEngine, type SpeechVoice } from './types';
export { readAloudChapter, storagePrefs, useReadAloud, type ReadAloud, type UseReadAloudOptions } from './useReadAloud';
