// What goes with a feedback message (decision 4 in design/proposed/feedback.html), and the two small pieces of
// state the sheet needs outside React: whether this device may send at all (Under 13), and the unsent draft kept in
// memory between openings of the sheet (decision 10; never written to storage).
import Constants from 'expo-constants';
import { Platform } from 'react-native';

import { isSignInAllowed, useSignInAllowed } from '../onboarding/signIn';
import type { Onboarding } from '../onboarding/keys';
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

/** No free text is collected from children: the row is hidden when the first-run age is Under 13 (decision 2). */
export function isFeedbackAllowed(onboarding: Pick<Onboarding, 'ageRange'>): boolean {
  return isSignInAllowed(onboarding);
}

/** Live form of `isFeedbackAllowed` for this device's stored first-run state. */
export function useFeedbackAllowed(): boolean {
  return useSignInAllowed();
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
