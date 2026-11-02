// One step of a lesson (or free practice): finds the verse and its trainer and hands it what it needs. Takes
// `onNavigate` and `onBack` instead of importing the router, so a test can watch where it goes.
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
  voiceBaseUrl?: string;
  isOnline?: () => boolean;
  random?: () => number;
}

const deviceIsOnline = (): boolean =>
  typeof navigator !== 'undefined' && typeof navigator.onLine === 'boolean' ? navigator.onLine : true;

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
  voiceBaseUrl,
  isOnline = deviceIsOnline,
  random = Math.random,
}: LessonScreenProps) {
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const [settings] = useMemorySettings(storage);
  const [lesson] = useStoredValue(storage, memoryLessonKey);
  const recorder = useMemo(() => recorderProp ?? createRecorder(), [recorderProp]);

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
    voice: { recorder, checkVoice, baseUrl: voiceBaseUrl ?? getApiBaseUrl(), isOnline },
    record: (passed) => {
      createMemoryStore(storage).submitStep({ index, verseId: verse.id, stage, passed, now: now() });
    },
    next: () => onNavigate(nextHrefAfter(storage.get(memoryLessonKey), index)),
    skip: () => onNavigate(nextHrefAfter(storage.get(memoryLessonKey), index)),
    back: () => {
      if (index !== null && inPlan && lesson.completedAt === null) noteProgressSaved(index + 1, lesson.steps.length);
      leave();
    },
  };

  const key = `${verse.id}/${stage}/${index ?? 'practice'}`;
  return stage === 'chunk-order' ? (
    <ChunkOrderTrainer key={key} ctx={ctx} />
  ) : stage === 'fill-blank' ? (
    <FillBlankTrainer key={key} ctx={ctx} />
  ) : (
    <FullRecallTrainer key={key} ctx={ctx} />
  );
}
