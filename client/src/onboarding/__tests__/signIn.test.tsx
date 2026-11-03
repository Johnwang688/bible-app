// Acceptance (orchestrator-owned, R-7a, John 2026-11-02): choosing "Under 13" turns off sign-in and sync.
// The selector R-6b reads. R-6b's own gate tests (r6b-auth: src/auth/__tests__/signInGate.test.tsx) drive
// AccountProvider with it.
import { act, renderHook } from '@testing-library/react-native';

import { createStorage, memoryBackend } from '../../storage/storage';
import { AGE_RANGES, onboardingKey } from '../keys';
import { isSignInAllowed, signInGateFor, useSignInAllowed } from '../signIn';

describe('isSignInAllowed', () => {
  it('is false only for Under 13', () => {
    for (const ageRange of AGE_RANGES) {
      expect([ageRange, isSignInAllowed({ ageRange })]).toEqual([ageRange, ageRange !== 'under-13']);
    }
  });

  it('is true with no answer (skipped, "Prefer not to say", or the intro not yet shown)', () => {
    expect(isSignInAllowed({ ageRange: null })).toBe(true);
    expect(isSignInAllowed(onboardingKey.fallback)).toBe(true);
  });
});

describe('useSignInAllowed', () => {
  it('follows the stored age live', async () => {
    const storage = createStorage(memoryBackend());
    const view = await renderHook(() => useSignInAllowed(storage));
    expect(view.result.current).toBe(true);
    await act(async () => storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    expect(view.result.current).toBe(false);
    await act(async () => storage.set(onboardingKey, { done: true, ageRange: '13-17' }));
    expect(view.result.current).toBe(true);
  });
});

describe('signInGateFor (the shape R-6b AccountProvider takes as signInGate)', () => {
  it('reads the stored age now and tells listeners when it changes', () => {
    const storage = createStorage(memoryBackend());
    const gate = signInGateFor(storage);
    expect(gate.allowed()).toBe(true);
    const seen: boolean[] = [];
    const off = gate.subscribe(() => seen.push(gate.allowed()));
    storage.set(onboardingKey, { done: true, ageRange: 'under-13' });
    expect(gate.allowed()).toBe(false);
    storage.set(onboardingKey, { done: true, ageRange: null });
    off();
    storage.set(onboardingKey, { done: true, ageRange: 'under-13' });
    expect(seen).toEqual([false, true]);
  });
});
