import { act, fireEvent, screen, waitFor } from '@testing-library/react-native';

import * as locale from '../../i18n/locale';
import { languageKey } from '../../storage/keys';
import { memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import * as speech from '../speech/keyer';
import { getMemoryVerse } from '../library';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, RecorderStartOptions, VoiceOutcome } from '../voice/types';
import { EN, renderMemory, ZH } from './memoryHarness';

const recorder = {
  supported: false,
  permission: async () => 'unsupported' as const,
  start: async () => 'unsupported' as const,
  stop: async () => null,
  cancel: () => undefined,
};

afterEach(() => jest.restoreAllMocks());

// Probe the round-one fix: switching there and back before React renders must still discard the placed answer.
it('switching English away and back before rendering renews the step', async () => {
  const verse = getMemoryVerse('galatians-2-20')!;
  const { storage } = await renderMemory(({ storage, now, onNavigate }) => (
    <LessonScreen verseId={verse.id} stage="chunk-order" index={null} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} random={() => 0.7} />
  ), { verses: 'locale' });
  for (let i = 0; i < verse.chunksEn.length; i++) await fireEvent.press(screen.getByTestId(`chunk-chip-${i}`));
  const check = screen.getByTestId('chunk-check');
  await act(async () => {
    storage.set(languageKey, 'zh-Hans');
    storage.set(languageKey, 'en');
    await fireEvent.press(check);
  });
  expect(screen.getByTestId('chunk-chip-0')).toHaveTextContent(verse.chunksEn[0]!);
  expect(storage.get(memoryProgressKey)).toEqual({});
});

// Finding: the invalidator re-reads device locales, while I18nProvider keeps the startup locales; system can miss a switch.
it('system preference voids a queued Chinese Check even when device locales changed since provider mount', async () => {
  const device = jest.spyOn(locale, 'getDeviceLocales').mockReturnValue([EN]);
  const verse = getMemoryVerse('galatians-2-20')!;
  const { storage } = await renderMemory(({ storage, now, onNavigate }) => (
    <LessonScreen verseId={verse.id} stage="chunk-order" index={null} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} random={() => 0.7} />
  ), { locales: [EN], verses: 'locale' });
  await act(async () => storage.set(languageKey, 'zh-Hans'));
  for (let i = 0; i < verse.chunks.length; i++) await fireEvent.press(screen.getByTestId(`chunk-chip-${i}`));
  const check = screen.getByTestId('chunk-check');
  device.mockReturnValue([ZH]);
  await act(async () => {
    storage.set(languageKey, 'system');
    await fireEvent.press(check);
  });
  expect(screen.getByTestId('chunk-chip-0')).toHaveTextContent(verse.chunksEn[0]!);
  expect(storage.get(memoryProgressKey)).toEqual({});
});


function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => { resolve = yes; });
  return { promise, resolve };
}

// Probe the fix during recording, HTTP checking and keyer-free English grade confirmation, including a switch back.
it.each((['fill-blank', 'full-recall'] as const).flatMap((stage) =>
  (['recording', 'checking', 'confirming'] as const).map((phase) => [stage, phase] as const),
))('%s: switching away and back during %s leaves no stale voice result', async (stage, phase) => {
  resetVoiceSessionForTesting();
  const verse = getMemoryVerse('2-corinthians-5-17')!;
  const storage = createStorage(memoryBackend());
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), speech: 'cantonese', voiceConsent: true });
  const response = deferred<VoiceOutcome>();
  const tokenRead = deferred<string | null>();
  const getIdToken = jest.fn(async () => 'token' as string | null);
  if (phase === 'confirming') {
    getIdToken.mockImplementationOnce(async () => 'token').mockImplementationOnce(async () => 'token')
      .mockImplementationOnce(() => tokenRead.promise);
  }
  const load = jest.spyOn(speech, 'loadSpeechKeyer');
  const starts: RecorderStartOptions[] = [];
  const mic: Recorder = {
    supported: true,
    permission: async () => 'granted',
    start: jest.fn(async (options) => { starts.push(options); return 'recording' as const; }),
    stop: async () => ({ blob: new Blob(['audio']), durationMs: 3000 }),
    cancel: jest.fn(),
  };
  const said = stage === 'fill-blank' ? verse.chunksEn[Math.floor(0.7 * verse.chunksEn.length)]! : `${verse.referenceEn} ${verse.textEn}`;
  const check = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(async (_audio, _lang, deps) => {
    await deps.getIdToken();
    return phase === 'checking' ? response.promise : { kind: 'text', text: said };
  });
  await renderMemory(({ now, onNavigate }) => (
    <LessonScreen verseId={verse.id} stage={stage} index={null} storage={storage} now={now} onNavigate={onNavigate}
      recorder={mic} checkVoice={check} getAppCheckToken={async () => null} random={() => 0.7} />
  ), { storage, verses: 'locale', auth: { signedIn: true, getIdToken } });
  await fireEvent.press(screen.getByTestId('memory-mic'));
  if (phase !== 'recording') await fireEvent.press(screen.getByTestId('memory-mic-stop'));
  if (phase === 'confirming') await waitFor(() => expect(getIdToken).toHaveBeenCalledTimes(3));
  await act(async () => {
    storage.set(languageKey, 'zh-Hans');
    storage.set(languageKey, 'en');
    starts[0]!.onAutoStop({ blob: new Blob(['late']), durationMs: 30000 });
    response.resolve({ kind: 'text', text: said });
    tokenRead.resolve('token');
  });
  expect(storage.get(memoryProgressKey)).toEqual({});
  expect(screen.queryByTestId('memory-result')).toBeNull();
  expect(screen.queryByTestId('memory-grading-spinner')).toBeNull();
  expect(screen.getByTestId('memory-mic')).toBeTruthy();
  expect(load).not.toHaveBeenCalled();
  expect(check).toHaveBeenCalledTimes(phase === 'recording' ? 0 : 1);
  if (phase !== 'recording') {
    expect(check.mock.calls[0]![1]).toBe('english');
    expect(check.mock.calls[0]![3]!.aborted).toBe(true);
  }
});
