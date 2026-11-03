// One step of a lesson (or free practice): finds the verse and its trainer and hands it what it needs. Takes
// `onNavigate` and `onBack` instead of importing the router, so a test can watch where it goes.
//
// The step's scope (`ctx.left`): Back, Skip and Next abort it before they navigate, since the route's
// `router.replace` unmounts this screen only later. Once left, nothing records, a pending grade is void and the voice
// panel starts no attempt; the scope, not unmounting, is what voids them.
import { useMemo } from 'react';

import { getApiBaseUrl } from '../../../api/config';
import { memoryLessonKey } from '../../../storage/memoryKeys';
import { getStorage, useStoredValue, type Storage } from '../../../storage/storage';
import { getMemoryVerse } from '../../library';
import { toLocalDateString } from '../../localDate';
import { createMemoryStore } from '../../memoryStore';
import { nextHrefAfter } from '../../session';
import { isStageSlug } from '../../stages';
import type { StageSlug } from '../../types';
import { useMemorySettings } from '../../useMemorySettings';
import { createRecorder } from '../../voice/recorder';
import type { CheckVoice, Recorder } from '../../voice/types';
import { checkVoice as realCheckVoice } from '../../voice/voiceClient';
import { noteProgressSaved } from '../savedToast';
import { ChunkOrderTrainer } from './ChunkOrderTrainer';
import { FillBlankTrainer } from './FillBlankTrainer';
import { FullRecallTrainer } from './FullRecallTrainer';
import { NotFound } from './TrainerShell';
import type { TrainerCtx } from './types';

const HOME = '/study/memory';

export interface LessonScreenProps {
  verseId: string;
  stage: StageSlug;
  /** The step's place in today's lesson (`?i=`), or null for free practice. */
  index: number | null;
  storage?: Storage;
  now?: () => Date;
  /** Where Next, Skip and the end of the lesson go. The route passes `router.replace`. */
  onNavigate?: (href: string) => void;
  onBack?: () => void;
  recorder?: Recorder;
  checkVoice?: CheckVoice;
  /** The App Check token sent with a voice request. Default: R-6b's, loaded only when a request is sent. */
  getAppCheckToken?: () => Promise<string | null>;
  voiceBaseUrl?: string;
  isOnline?: () => boolean;
  random?: () => number;
}

const deviceIsOnline = (): boolean =>
  typeof navigator !== 'undefined' && typeof navigator.onLine === 'boolean' ? navigator.onLine : true;

/** Lazily, so nothing of Firebase loads until a voice request is actually sent (signed in). */
const defaultAppCheckToken = (): Promise<string | null> =>
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  (require('../../../auth/appCheck') as typeof import('../../../auth/appCheck')).getAppCheckTokenForRequest();

const defaultNavigate = (href: string): void => {
  void import('expo-router').then(({ router }) => router.replace(href as never));
};

export function LessonScreen({
  verseId,
  stage,
  index,
  storage: storageProp,
  now = () => new Date(),
  onNavigate = defaultNavigate,
  onBack,
  recorder: recorderProp,
  checkVoice = realCheckVoice,
  getAppCheckToken = defaultAppCheckToken,
  voiceBaseUrl,
  isOnline = deviceIsOnline,
  random = Math.random,
}: LessonScreenProps) {
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const [settings] = useMemorySettings(storage);
  const [lesson] = useStoredValue(storage, memoryLessonKey);
  const recorder = useMemo(() => recorderProp ?? createRecorder(), [recorderProp]);
  // One scope per step: a new step (the trainers are keyed on it too) starts a fresh one.
  const key = `${verseId}/${stage}/${index ?? 'practice'}`;
  // eslint-disable-next-line react-hooks/exhaustive-deps -- `key` is the step: the scope is renewed only for a new one
  const controller = useMemo(() => new AbortController(), [key]);

  const leave = () => (onBack ? onBack() : onNavigate(HOME));
  const verse = getMemoryVerse(verseId);
  if (!verse || !isStageSlug(stage)) return <NotFound onBack={leave} />;

  // The counter only speaks of today's plan; a link from another day's plan reads as practice.
  const inPlan =
    index !== null && lesson !== null && lesson.date === toLocalDateString(now()) && index >= 0 && index < lesson.steps.length;
  const steps = inPlan ? lesson.steps.length : null;

  const ctx: TrainerCtx = {
    verse,
    stage,
    index,
    steps,
    storage,
    now,
    settings,
    script: settings.script,
    random,
    voice: { recorder, checkVoice, baseUrl: voiceBaseUrl ?? getApiBaseUrl(), isOnline, getAppCheckToken },
    left: controller.signal,
    record: (passed) => {
      if (controller.signal.aborted) return;
      createMemoryStore(storage).submitStep({ index, verseId: verse.id, stage, passed, now: now() });
    },
    next: () => {
      controller.abort();
      onNavigate(nextHrefAfter(storage.get(memoryLessonKey), index));
    },
    skip: () => {
      controller.abort();
      onNavigate(nextHrefAfter(storage.get(memoryLessonKey), index));
    },
    back: () => {
      controller.abort();
      if (index !== null && inPlan && lesson.completedAt === null) noteProgressSaved(index + 1, lesson.steps.length);
      leave();
    },
  };

  return stage === 'chunk-order' ? (
    <ChunkOrderTrainer key={key} ctx={ctx} />
  ) : stage === 'fill-blank' ? (
    <FillBlankTrainer key={key} ctx={ctx} />
  ) : (
    <FullRecallTrainer key={key} ctx={ctx} />
  );
}
