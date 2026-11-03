// The Send feedback sheet and its row on Me (design/proposed/feedback.html, approved 11-03): every state, the Under 13
// gate, the draft kept in memory, and what goes to the API. The API is a fake; nothing reaches a server.
import { act, fireEvent, screen, within } from '@testing-library/react-native';
import { useState } from 'react';
import { Pressable } from 'react-native';

import { renderMe, ZH } from '../../me/__tests__/meHarness';
import { MeScreen } from '../../me/MeScreen';
import { onboardingKey } from '../../onboarding/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { FEEDBACK_MAX_LENGTH, type FeedbackApi, type FeedbackInput, type FeedbackResult } from '../api';
import { feedbackDraft } from '../context';
import { FeedbackSheet } from '../FeedbackSheet';

function fakeApi(results: FeedbackResult[] = [{ ok: true }]) {
  const sent: FeedbackInput[] = [];
  let resolveNext: ((r: FeedbackResult) => void) | null = null;
  const api: FeedbackApi & { sent: FeedbackInput[]; hold: boolean; release(r: FeedbackResult): void } = {
    sent,
    hold: false,
    release(r) {
      resolveNext?.(r);
    },
    send(input) {
      sent.push(input);
      if (api.hold) return new Promise((resolve) => (resolveNext = resolve));
      return Promise.resolve(results[Math.min(sent.length - 1, results.length - 1)]!);
    },
  };
  return api;
}

async function renderSheet(api: FeedbackApi, opts: Parameters<typeof renderMe>[1] = {}) {
  const onClose = jest.fn();
  const out = await renderMe(<FeedbackSheet api={api} onClose={onClose} />, opts);
  return { ...out, onClose };
}

const send = () => screen.getByTestId('feedback-send');
const type = async (text: string) => act(async () => fireEvent.changeText(screen.getByTestId('feedback-input'), text));
const press = async (id: string) => act(async () => fireEvent.press(screen.getByTestId(id)));

/** The sheet with a way to open it again after Close (as the Me row does). */
function Host({ api }: { api: FeedbackApi }) {
  const [open, setOpen] = useState(true);
  return (
    <>
      <Pressable testID="host-reopen" onPress={() => setOpen(true)} />
      {open ? <FeedbackSheet api={api} onClose={() => setOpen(false)} /> : null}
    </>
  );
}

/** Send's state as assistive tech gets it (aria-disabled / aria-busy; it stays a focusable button). */
const sendState = () => {
  const p = send().props as { 'aria-disabled'?: boolean; 'aria-busy'?: boolean; accessibilityState?: { disabled?: boolean; busy?: boolean } };
  return {
    disabled: (p['aria-disabled'] ?? p.accessibilityState?.disabled) === true,
    busy: (p['aria-busy'] ?? p.accessibilityState?.busy) === true,
  };
};

afterEach(() => feedbackDraft.clear());

describe('the row on Me', () => {
  it('is the last row of More and opens the sheet', async () => {
    await renderMe(<MeScreen onNavigate={() => undefined} />);
    const row = screen.getByTestId('me-row-feedback');
    expect(row).toHaveTextContent('Send feedback');
    await act(async () => fireEvent.press(row));
    const sheet = screen.getByTestId('feedback-sheet');
    expect(within(sheet).getByRole('header')).toHaveTextContent('Send feedback');
  });

  it('is hidden for Under 13, live, and an open sheet goes with it', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(onboardingKey, { done: true, ageRange: 'under-13' });
    await renderMe(<MeScreen onNavigate={() => undefined} />, { storage });
    expect(screen.queryByTestId('me-row-feedback')).toBeNull();

    await act(async () => storage.set(onboardingKey, { done: true, ageRange: '18-24' as never }));
    await press('me-row-feedback');
    expect(screen.getByTestId('feedback-sheet')).toBeTruthy();
    await act(async () => storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    expect(screen.queryByTestId('feedback-sheet')).toBeNull();
    expect(screen.queryByTestId('me-row-feedback')).toBeNull();
  });

  it('reads 发送反馈 in Chinese', async () => {
    await renderMe(<MeScreen onNavigate={() => undefined} />, { locales: [ZH] });
    expect(screen.getByTestId('me-row-feedback')).toHaveTextContent('发送反馈');
  });
});

describe('the sheet', () => {
  it('opens empty with Send off (still a focusable button), and an empty send does nothing', async () => {
    const api = fakeApi();
    await renderSheet(api);
    expect(screen.getByTestId('feedback-input').props.value).toBe('');
    expect(sendState()).toEqual({ disabled: true, busy: false });
    expect(send().props.accessibilityRole).toBe('button');
    await press('feedback-send');
    await type('   \n ');
    await press('feedback-send');
    expect(api.sent).toEqual([]);
    expect(screen.queryByTestId('feedback-counter')).toBeNull();
  });

  it('says what is sent: signed out, not linked to an account', async () => {
    await renderSheet(fakeApi());
    const line = screen.getByTestId('feedback-attached');
    expect(line).toHaveTextContent(/app version .* app language English, Silver look, and your browser or device details\. You’re not signed in/);
  });

  it('the topic is one choice, and pressing it again clears it', async () => {
    await renderSheet(fakeApi());
    const state = (v: string) => screen.getByTestId(`feedback-topic-${v}`).props.accessibilityState.selected;
    expect([state('bug'), state('idea'), state('other')]).toEqual([false, false, false]);
    await press('feedback-topic-bug');
    expect([state('bug'), state('idea'), state('other')]).toEqual([true, false, false]);
    expect(screen.getByTestId('feedback-topic-bug').props.accessibilityHint).toBe('Press again to clear');
    await press('feedback-topic-idea');
    expect([state('bug'), state('idea'), state('other')]).toEqual([false, true, false]);
    await press('feedback-topic-idea');
    expect([state('bug'), state('idea'), state('other')]).toEqual([false, false, false]);
  });

  it('sends the text, the topic and the context, then thanks', async () => {
    const api = fakeApi();
    const { onClose } = await renderSheet(api);
    await press('feedback-topic-bug');
    await type('  Highlights vanish in Graphite.  ');
    expect(sendState().disabled).toBe(false);
    await press('feedback-send');
    expect(api.sent).toHaveLength(1);
    expect(api.sent[0]).toEqual({
      message: '  Highlights vanish in Graphite.  ',
      category: 'bug',
      context: { appVersion: expect.any(String), platform: 'ios', language: 'en', preset: 'silver' },
    });
    expect(screen.getByTestId('feedback-thanks')).toHaveTextContent(/Thanks for your feedback/);
    expect(screen.queryByTestId('feedback-input')).toBeNull();
    expect(feedbackDraft.get()).toEqual({ text: '', category: null });
    await press('feedback-done');
    expect(onClose).toHaveBeenCalled();
  });

  it('shows Sending… while the request runs, read-only, and ignores a second press', async () => {
    const api = fakeApi();
    api.hold = true;
    await renderSheet(api);
    await type('A message');
    await press('feedback-send');
    expect(send()).toHaveTextContent('Sending…');
    expect(sendState()).toEqual({ disabled: true, busy: true });
    expect(screen.getByTestId('feedback-input').props.editable).toBe(false);
    await press('feedback-send');
    expect(api.sent).toHaveLength(1);
    await act(async () => api.release({ ok: true }));
    expect(screen.getByTestId('feedback-thanks')).toBeTruthy();
  });

  it('counts down from 200 left, and over the limit says how many to remove and turns Send off', async () => {
    const api = fakeApi();
    await renderSheet(api);
    await type('a'.repeat(FEEDBACK_MAX_LENGTH - 201));
    expect(screen.queryByTestId('feedback-counter')).toBeNull();
    await type('a'.repeat(FEEDBACK_MAX_LENGTH - 38));
    expect(screen.getByTestId('feedback-counter')).toHaveTextContent('38 characters left');
    expect(sendState().disabled).toBe(false);
    await type('a'.repeat(FEEDBACK_MAX_LENGTH + 112));
    expect(screen.getByTestId('feedback-counter')).toHaveTextContent('Remove 112 characters to send. The limit is 2,000.');
    expect(sendState().disabled).toBe(true);
    await press('feedback-send');
    expect(api.sent).toEqual([]);
    // Nothing is cut.
    expect(screen.getByTestId('feedback-input').props.value).toHaveLength(FEEDBACK_MAX_LENGTH + 112);
  });

  it.each([
    [{ ok: false, reason: 'offline' } as const, 'You’re offline. Your message is still here'],
    [{ ok: false, reason: 'failed' } as const, 'Couldn’t send your feedback. Your message is still here.'],
    [{ ok: false, reason: 'rate-limited', retryAfterMinutes: 7 } as const, 'Try again in 7 min. Your message is still here.'],
    [{ ok: false, reason: 'invalid' } as const, 'Couldn’t send this message.'],
  ])('keeps the text and topic on %j, and Send retries', async (failure, message) => {
    const api = fakeApi([failure, { ok: true }]);
    await renderSheet(api);
    await press('feedback-topic-idea');
    await type('Keep me');
    await press('feedback-send');
    const error = screen.getByTestId('feedback-error');
    expect(error.props.accessibilityRole).toBe('alert');
    expect(error).toHaveTextContent(new RegExp(message.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')));
    expect(screen.getByTestId('feedback-input').props.value).toBe('Keep me');
    expect(screen.getByTestId('feedback-topic-idea').props.accessibilityState.selected).toBe(true);
    await press('feedback-send');
    expect(api.sent).toHaveLength(2);
    expect(screen.getByTestId('feedback-thanks')).toBeTruthy();
  });

  it('keeps an unsent draft in memory when closed, and brings it back', async () => {
    await renderMe(<Host api={fakeApi()} />);
    await press('feedback-topic-other');
    await type('Half a thought');
    await press('feedback-close');
    expect(screen.queryByTestId('feedback-sheet')).toBeNull();
    await press('host-reopen');
    expect(screen.getByTestId('feedback-input').props.value).toBe('Half a thought');
    expect(screen.getByTestId('feedback-topic-other').props.accessibilityState.selected).toBe(true);
  });

  it('a send that fails after the sheet closed keeps the draft; one that succeeds clears it', async () => {
    const api = fakeApi();
    api.hold = true;
    await renderMe(<Host api={api} />);
    await type('In flight');
    await press('feedback-send');
    await press('feedback-close');
    await act(async () => api.release({ ok: false, reason: 'offline' }));
    expect(feedbackDraft.get().text).toBe('In flight');

    await press('host-reopen');
    expect(screen.getByTestId('feedback-input').props.value).toBe('In flight');
    await press('feedback-send');
    await press('feedback-close');
    await act(async () => api.release({ ok: true }));
    expect(feedbackDraft.get()).toEqual({ text: '', category: null });
  });

  it('Close closes', async () => {
    const { onClose } = await renderSheet(fakeApi());
    await press('feedback-close');
    expect(onClose).toHaveBeenCalled();
  });

  it('speaks Chinese', async () => {
    await renderSheet(fakeApi(), { locales: [ZH] });
    const sheet = screen.getByTestId('feedback-sheet');
    expect(within(sheet).getByText('发送反馈')).toBeTruthy();
    expect(within(sheet).getByText('故障')).toBeTruthy();
    expect(screen.getByTestId('feedback-attached')).toHaveTextContent(/应用语言简体中文、银色风格.*你没有登录/);
    expect(send()).toHaveTextContent('发送');
  });
});
