// What goes with a message, the Under 13 gate, and the in-memory draft.
import { feedbackContext, feedbackDraft, feedbackPlatform, isFeedbackAllowed } from '../context';

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

describe('isFeedbackAllowed', () => {
  it('is off only for Under 13', () => {
    expect(isFeedbackAllowed({ ageRange: 'under-13' })).toBe(false);
    expect(isFeedbackAllowed({ ageRange: undefined } as never)).toBe(true);
    expect(isFeedbackAllowed({ ageRange: '13-17' } as never)).toBe(true);
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
