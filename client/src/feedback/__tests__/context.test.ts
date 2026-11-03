// What goes with a message, the Under 13 gate, and the in-memory draft.
import { act, renderHook } from '@testing-library/react-native';

import { AGE_RANGES, onboardingKey } from '../../onboarding/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { feedbackAllowedNow, feedbackContext, feedbackDraft, feedbackPlatform, useFeedbackAllowed } from '../context';

describe('feedbackContext', () => {
  it('maps the platform and keeps the given values', () => {
    expect(feedbackContext({ language: 'zh-Hans', preset: 'graphite', os: 'ios', version: '0.2.0' })).toEqual({
      appVersion: '0.2.0',
      platform: 'ios',
      language: 'zh-Hans',
      preset: 'graphite',
    });
  });

  it('adds a screen only when given', () => {
    expect(feedbackContext({ language: 'en', preset: 'silver', os: 'web', version: '1', screen: 'me' }).screen).toBe('me');
  });

  it('reads the app version from the Expo config by default', () => {
    expect(typeof feedbackContext({ language: 'en', preset: 'silver' }).appVersion).toBe('string');
  });

  it.each([
    ['web', 'web'],
    ['ios', 'ios'],
    ['android', 'android'],
    ['windows', 'other'],
    ['macos', 'other'],
  ])('platform %s is %s', (os, expected) => {
    expect(feedbackPlatform(os)).toBe(expected);
  });
});

describe('the Under 13 gate', () => {
  it('is off only for Under 13, read now', () => {
    const storage = createStorage(memoryBackend());
    expect(feedbackAllowedNow(storage)).toBe(true);
    for (const ageRange of AGE_RANGES) {
      storage.set(onboardingKey, { done: true, ageRange });
      expect([ageRange, feedbackAllowedNow(storage)]).toEqual([ageRange, ageRange !== 'under-13']);
    }
    // Before the intro is done (unknown age) the row shows: Me is not reachable then anyway.
    storage.set(onboardingKey, { done: false, ageRange: null });
    expect(feedbackAllowedNow(storage)).toBe(true);
  });

  it('follows the stored choice live', async () => {
    const storage = createStorage(memoryBackend());
    const view = await renderHook(() => useFeedbackAllowed(storage));
    expect(view.result.current).toBe(true);
    await act(async () => storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    expect(view.result.current).toBe(false);
    await act(async () => storage.set(onboardingKey, { done: true, ageRange: null }));
    expect(view.result.current).toBe(true);
  });
});

describe('feedbackDraft', () => {
  afterEach(() => feedbackDraft.clear());

  it('keeps the unsent text and topic until cleared', () => {
    expect(feedbackDraft.get()).toEqual({ text: '', category: null });
    feedbackDraft.set({ text: 'half a thought', category: 'idea' });
    expect(feedbackDraft.get()).toEqual({ text: 'half a thought', category: 'idea' });
    feedbackDraft.clear();
    expect(feedbackDraft.get()).toEqual({ text: '', category: null });
  });

  it('copies what it is given', () => {
    const value = { text: 'a', category: null };
    feedbackDraft.set(value);
    value.text = 'changed';
    expect(feedbackDraft.get().text).toBe('a');
  });
});
