// Email verification: Memory voice needs a confirmed email. The server answers 403 `email_not_verified` for a
// signed-in account whose email isn't confirmed (app/memory/transcribe.py); the client maps that to its own outcome
// and the voice panel shows its own notice in the mic's place, the way it shows the signed-out one (no sign-out, no
// retry). Any other 403 stays a plain error.
import { act, fireEvent, screen, waitFor } from '@testing-library/react-native';
import { useState } from 'react';

import { memoryEn, memoryZhHans } from '../../i18n/messages/memory';
import { memoryLessonKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import type { DailyLessonRecord } from '../dailyLesson';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import { MemoryAuthProvider, type MemoryAuth } from '../voice/auth';
import { EMAIL_NOT_VERIFIED_DETAIL, type Recorder, type VoiceOutcome } from '../voice/types';
import { checkVoice } from '../voice/voiceClient';
import { NOW, renderMemory, SIGNED_IN, ZH } from './memoryHarness';

// ---------------------------------------------------------------------------------------------------------
// The transcription client.
// ---------------------------------------------------------------------------------------------------------
type FakeRes = { status: number; json?: () => Promise<unknown> };
function fakeFetch(res: FakeRes) {
  const fn = jest.fn(
    async () =>
      ({
        ok: res.status >= 200 && res.status < 300,
        status: res.status,
        headers: { get: () => null },
        json: res.json ?? (async () => null),
        text: async () => '',
      }) as unknown as Response,
  );
  return fn as unknown as typeof fetch & jest.Mock;
}
const audio = () => new Blob(['x'], { type: 'audio/webm;codecs=opus' });
const deps = (f: typeof fetch) => ({ baseUrl: 'https://api.example', getIdToken: async () => 'tok', fetch: f, isOnline: () => true });

describe('checkVoice: the 403s', () => {
  it('the detail string matches the server’s', () => {
    expect(EMAIL_NOT_VERIFIED_DETAIL).toBe('email_not_verified');
  });

  it('403 email_not_verified is its own outcome (not signed-out)', async () => {
    const fn = fakeFetch({ status: 403, json: async () => ({ detail: 'email_not_verified' }) });
    expect(await checkVoice(audio(), 'mandarin', deps(fn))).toEqual({ kind: 'email-unverified' });
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it.each([
    ['another detail', async () => ({ detail: 'recent-login-required' })],
    ['no detail', async () => ({})],
    ['a null body', async () => null],
    ['a detail that only looks alike', async () => ({ detail: 'EMAIL_NOT_VERIFIED' })],
    ['a body that is not JSON', async () => Promise.reject(new SyntaxError('Unexpected token'))],
  ])('any other 403 (%s) is still an error', async (_label, json) => {
    const fn = fakeFetch({ status: 403, json });
    expect(await checkVoice(audio(), 'mandarin', deps(fn))).toEqual({ kind: 'error' });
  });

  it('a 401 is still signed-out', async () => {
    const fn = fakeFetch({ status: 401, json: async () => ({ detail: 'email_not_verified' }) });
    expect(await checkVoice(audio(), 'mandarin', deps(fn))).toEqual({ kind: 'signed-out' });
  });

  it('cancel wins while the 403’s body is read', async () => {
    const controller = new AbortController();
    let releaseBody!: (v: unknown) => void;
    const fn = fakeFetch({ status: 403, json: () => new Promise((resolve) => (releaseBody = resolve)) });
    const pending = checkVoice(audio(), 'mandarin', deps(fn), controller.signal);
    await waitFor(() => expect(releaseBody).toBeDefined());
    controller.abort();
    releaseBody({ detail: 'email_not_verified' });
    expect(await pending).toEqual({ kind: 'cancelled' });
  });
});

// ---------------------------------------------------------------------------------------------------------
// The catalogue.
// ---------------------------------------------------------------------------------------------------------
describe('catalogue', () => {
  it('has the confirm-email voice notice in both languages', () => {
    expect(memoryEn['memory.notice.confirmEmail']).toBe('Confirm your email to use voice.');
    expect(memoryZhHans['memory.notice.confirmEmail']).toBe('确认电子邮箱后即可使用语音。');
  });
});

// ---------------------------------------------------------------------------------------------------------
// The voice panel.
// ---------------------------------------------------------------------------------------------------------
const josh = getMemoryVerse('joshua-1-8')!;
const cor = getMemoryVerse('2-corinthians-5-17')!;
const tim = getMemoryVerse('2-timothy-3-16')!;

function seeded() {
  const storage = createStorage(memoryBackend());
  const lesson: DailyLessonRecord = {
    date: toLocalDateString(NOW),
    steps: [
      { verseId: cor.id, stage: 'chunk-order' as const },
      { verseId: josh.id, stage: 'fill-blank' as const },
      { verseId: tim.id, stage: 'full-recall' as const },
      { verseId: 'galatians-2-20', stage: 'chunk-order' as const },
    ].map((s) => ({ ...s, completedAt: null })),
    completedAt: null,
  };
  storage.set(memoryLessonKey, lesson);
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
  return storage;
}

function fakeRecorder(): Recorder {
  return {
    supported: true,
    permission: jest.fn(async () => 'prompt' as const),
    start: jest.fn(async () => 'recording' as const),
    stop: jest.fn(async () => ({ blob: new Blob(['a'], { type: 'audio/webm' }), durationMs: 3000 })),
    cancel: jest.fn(),
  };
}

async function lesson(checkVoiceFn: jest.Mock, opts: { auth?: MemoryAuth; locales?: (typeof ZH)[] } = {}) {
  return renderMemory(
    ({ storage, now, onNavigate }) => (
      <LessonScreen
        verseId={josh.id}
        stage="fill-blank"
        index={1}
        storage={storage}
        now={now}
        onNavigate={onNavigate}
        onBack={jest.fn()}
        recorder={fakeRecorder()}
        checkVoice={checkVoiceFn}
        voiceBaseUrl="https://api.example"
        isOnline={() => true}
        random={() => 0.7}
      />
    ),
    { storage: seeded(), auth: opts.auth ?? SIGNED_IN, locales: opts.locales },
  );
}

const speak = async () => {
  await fireEvent.press(screen.getByTestId('memory-mic'));
  await fireEvent.press(screen.getByTestId('memory-mic-stop'));
};

beforeEach(() => resetVoiceSessionForTesting());

describe('voice panel: email not confirmed', () => {
  it('shows the confirm-email notice in the mic’s place, with typing, and sends nothing more', async () => {
    const checkVoiceFn = jest.fn(async (): Promise<VoiceOutcome> => ({ kind: 'email-unverified' }));
    await lesson(checkVoiceFn);
    await speak();
    await waitFor(() => expect(screen.getByTestId('memory-notice-email-unverified')).toHaveTextContent('Confirm your email to use voice.'));
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    expect(screen.getByTestId('memory-type-input')).toBeTruthy();
    // No Try again (no repeats that would upload again), no Sign in, and not the signed-out notice.
    expect(screen.queryByTestId('memory-notice-try-again')).toBeNull();
    expect(screen.queryByTestId('memory-notice-sign-in')).toBeNull();
    expect(screen.queryByTestId('memory-notice-signed-out')).toBeNull();
    await act(async () => {
      await new Promise((r) => setTimeout(r, 20));
    });
    expect(checkVoiceFn).toHaveBeenCalledTimes(1);
  });

  it('is the same notice component as the signed-out one (same card, same text style)', async () => {
    const checkVoiceFn = jest.fn(async (): Promise<VoiceOutcome> => ({ kind: 'email-unverified' }));
    await lesson(checkVoiceFn);
    await speak();
    const card = await screen.findByTestId('memory-notice-email-unverified');
    await screen.unmount();
    await lesson(jest.fn(async (): Promise<VoiceOutcome> => ({ kind: 'signed-out' })));
    await speak();
    const signedOut = await screen.findByTestId('memory-notice-signed-out');
    expect(card.props.accessibilityRole).toBe(signedOut.props.accessibilityRole);
    expect(card.type).toBe(signedOut.type);
  });

  it('shows the Chinese copy in the Chinese interface', async () => {
    await lesson(jest.fn(async (): Promise<VoiceOutcome> => ({ kind: 'email-unverified' })), { locales: [ZH] });
    await speak();
    await waitFor(() => expect(screen.getByTestId('memory-notice-email-unverified')).toHaveTextContent('确认电子邮箱后即可使用语音。'));
  });

  it('a real 403 email_not_verified, end to end through the client, shows the notice', async () => {
    const fetchFn = fakeFetch({ status: 403, json: async () => ({ detail: 'email_not_verified' }) });
    const viaClient = jest.fn((blob: Blob, language: Parameters<typeof checkVoice>[1], d: Parameters<typeof checkVoice>[2], signal?: AbortSignal) =>
      checkVoice(blob, language, { ...d, fetch: fetchFn, isOnline: () => true }, signal),
    );
    await lesson(viaClient);
    await speak();
    await waitFor(() => expect(screen.getByTestId('memory-notice-email-unverified')).toBeTruthy());
    expect(fetchFn).toHaveBeenCalledTimes(1);
  });

  it('a new session (another user signs in) lifts it and the mic comes back; the same session keeps it', async () => {
    const checkVoiceFn = jest.fn(async (): Promise<VoiceOutcome> => ({ kind: 'email-unverified' }));
    const alice: MemoryAuth = { signedIn: true, user: 'alice', getIdToken: async () => 'alice-token' };
    const bob: MemoryAuth = { signedIn: true, user: 'bob', getIdToken: async () => 'bob-token' };
    const storage = seeded();
    let setAuth!: (auth: MemoryAuth) => void;
    function Session({ onNavigate }: { onNavigate: jest.Mock }) {
      const [auth, update] = useState<MemoryAuth>(alice);
      setAuth = update;
      return (
        <MemoryAuthProvider value={auth}>
          <LessonScreen
            verseId={josh.id}
            stage="fill-blank"
            index={1}
            storage={storage}
            now={() => NOW}
            onNavigate={onNavigate}
            onBack={jest.fn()}
            recorder={fakeRecorder()}
            checkVoice={checkVoiceFn}
            voiceBaseUrl="https://api.example"
            isOnline={() => true}
            random={() => 0.7}
          />
        </MemoryAuthProvider>
      );
    }
    await renderMemory(({ onNavigate }) => <Session onNavigate={onNavigate} />, { storage });
    await speak();
    await screen.findByTestId('memory-notice-email-unverified');
    // The same user's auth again (a re-render, a token refresh): the notice stays.
    await act(async () => setAuth({ ...alice, getIdToken: async () => 'alice-token-2' }));
    expect(screen.getByTestId('memory-notice-email-unverified')).toBeTruthy();
    await act(async () => setAuth(bob));
    await waitFor(() => expect(screen.queryByTestId('memory-notice-email-unverified')).toBeNull());
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });
});
