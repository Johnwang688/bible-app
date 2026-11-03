// What goes with a feedback message (decision 4 in design/proposed/feedback.html), and the two small pieces of
// state the sheet needs outside React: whether this device may send at all (Under 13), and the unsent draft kept in
// memory between openings of the sheet (decision 10; never written to storage).
import Constants from 'expo-constants';
import { Platform } from 'react-native';

import { signInGateFor, useSignInAllowed } from '../onboarding/signIn';
import { getStorage, type Storage } from '../storage/storage';
import type { FeedbackCategory, FeedbackContext, FeedbackPlatform } from './api';

export function feedbackPlatform(os: string = Platform.OS): FeedbackPlatform {
  return os === 'web' || os === 'ios' || os === 'android' ? os : 'other';
}

export function appVersion(): string {
  return Constants.expoConfig?.version ?? '';
}

/** The context sent with a message. `language` is the app language in use, `preset` the look's preset id. */
export function feedbackContext(input: {
  language: string;
  preset: string;
  screen?: string;
  os?: string;
  version?: string;
}): FeedbackContext {
  const context: FeedbackContext = {
    appVersion: input.version ?? appVersion(),
    platform: feedbackPlatform(input.os),
    language: input.language,
    preset: input.preset,
  };
  if (input.screen) context.screen = input.screen;
  return context;
}

/**
 * No free text is collected from children (decision 2): the row shows only where sign-in is allowed, which is false
 * exactly when Under 13 was picked at first run. Only that boolean is read; the age itself never leaves onboarding.
 * Live: re-renders when the choice changes.
 */
export function useFeedbackAllowed(storage: Storage = getStorage()): boolean {
  return useSignInAllowed(storage);
}

/** `useFeedbackAllowed` outside React, read now. */
export function feedbackAllowedNow(storage: Storage = getStorage()): boolean {
  return signInGateFor(storage).allowed();
}

export interface FeedbackDraft {
  text: string;
  category: FeedbackCategory | null;
}

const EMPTY: FeedbackDraft = { text: '', category: null };
let draft: FeedbackDraft = EMPTY;

/** The unsent text and topic, kept in memory until the app is closed or the message is sent. */
export const feedbackDraft = {
  get(): FeedbackDraft {
    return draft;
  },
  set(next: FeedbackDraft): void {
    draft = { text: next.text, category: next.category };
  },
  clear(): void {
    draft = EMPTY;
  },
};
