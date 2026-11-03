// What every trainer is given by the lesson screen: the verse, where it sits in today's lesson, the stored settings
// and the few actions a trainer takes (record an attempt, go on, skip). Trainers never touch the router or the clock.
import type { MemorySettings } from '../../../storage/memoryKeys';
import type { Storage } from '../../../storage/storage';
import type { ChineseScript, MemoryVerse, StageSlug } from '../../types';
import type { CheckVoice, Recorder } from '../../voice/types';

export interface VoiceEnv {
  recorder: Recorder;
  checkVoice: CheckVoice;
  baseUrl: string;
  isOnline: () => boolean;
  /** The App Check token for a request, or null (optional; the voice client bounds the wait). */
  getAppCheckToken?: () => Promise<string | null>;
}

export interface TrainerCtx {
  verse: MemoryVerse;
  stage: StageSlug;
  /** The step's place in today's lesson, or null for free practice. */
  index: number | null;
  /** The length of today's lesson when this is one of its steps, else null. */
  steps: number | null;
  storage: Storage;
  now: () => Date;
  settings: MemorySettings;
  script: ChineseScript;
  random: () => number;
  voice: VoiceEnv;
  /**
   * The step's scope. Back, Skip and Next abort it synchronously, before they navigate (the route's `replace`
   * unmounts the screen only later): from then on `record` is a no-op, a grade pending at that moment is void, the
   * chunk-order Check does nothing and the voice panel ends its attempt and starts none.
   */
  left: AbortSignal;
  /** Records one graded attempt (the step is ticked only if it matches today's plan). A no-op once `left`. */
  record(passed: boolean): void;
  /** Where Next goes: the first later unfinished step, the end screen, or Memory home for free practice. */
  next(): void;
  /** Leaves the step for later: goes where Next would, recording nothing. */
  skip(): void;
  /** Saves progress and leaves (the shell's Back). */
  back(): void;
}
