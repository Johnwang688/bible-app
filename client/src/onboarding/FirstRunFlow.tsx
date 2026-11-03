// The first-run intro (R-7a): welcome, pick your look, your age. The step and the age choice live here, in
// component state, so a theme change from the live preview never resets them.
import { useCallback, useEffect, useRef, useState } from 'react';
import { BackHandler, Platform } from 'react-native';

import type { FirstRun } from './firstRun';
import { AgeStep } from './steps/AgeStep';
import { LookStep } from './steps/LookStep';
import type { AgeChoice } from './steps/types';
import { WelcomeStep } from './steps/WelcomeStep';

/** A press this soon after a step appeared is the second tap of a double tap (phones). */
const PHONE_SETTLE_MS = 350;

/** The click count of a web press event (1 for a single click, 2 for the second click of a double click). */
function clickCount(event: unknown): number {
  const e = event as { detail?: unknown; nativeEvent?: { detail?: unknown } } | null | undefined;
  const n = e?.detail ?? e?.nativeEvent?.detail;
  return typeof n === 'number' ? n : 0;
}

export function FirstRunFlow({ firstRun }: { firstRun: FirstRun }) {
  const { chooseLook, finish, skip } = firstRun;
  const [step, setStep] = useState<1 | 2 | 3>(1);
  const [age, setAge] = useState<AgeChoice>(null);
  // The web moves focus to a step's heading, but not for the first step on first mount.
  const [navigated, setNavigated] = useState(false);

  // One step per tap. A fast double tap (or double click) on a step-changing control must not act on the step it
  // just revealed: that would skip the age step, or finish with no age.
  //  - Web: the second click of a double click has `detail` 2 or more. There is no dead time, so a single click on
  //    a new step's button right after it appears works.
  //  - Phones: a native double tap has no tap count, so a press less than PHONE_SETTLE_MS after the step appeared
  //    is ignored.
  //    The Android hardware Back button is not a tap, so only the one-press guard applies to it.
  //  - Everywhere: one press per step (`spent`), which opens again when the step changes.
  const spent = useRef(false);
  const shownAt = useRef(0); // set by the effect below on mount and on every step change
  useEffect(() => {
    spent.current = false;
    shownAt.current = Date.now();
  }, [step]);
  const once = useCallback((fn: () => void, event?: unknown, hardware = false) => {
    if (Platform.OS === 'web') {
      if (clickCount(event) >= 2) return;
    } else if (!hardware && Date.now() - shownAt.current < PHONE_SETTLE_MS) {
      return;
    }
    if (spent.current) return;
    spent.current = true;
    fn();
  }, []);

  const go = useCallback((to: 1 | 2 | 3) => {
    setNavigated(true);
    setStep(to);
  }, []);
  const back = useCallback(
    (event?: unknown, hardware = false) => {
      if (step > 1) once(() => go((step - 1) as 1 | 2), event, hardware);
    },
    [step, once, go],
  );

  // The Android hardware back button goes back a step on steps 2 and 3 and does nothing special on step 1.
  useEffect(() => {
    if (Platform.OS !== 'android') return undefined;
    const sub = BackHandler.addEventListener('hardwareBackPress', () => {
      if (step === 1) return false;
      back(undefined, true);
      return true;
    });
    return () => sub.remove();
  }, [step, back]);

  // "Skip for now" ends the intro with the look as picked and no age, even if a chip was chosen.
  const skipForNow = (event?: unknown) => once(() => finish(null), event);

  if (step === 1) {
    return <WelcomeStep announce={navigated} onNext={(e) => once(() => go(2), e)} onSkip={(e) => once(skip, e)} />;
  }
  if (step === 2) {
    return (
      <LookStep
        announce={navigated}
        chooseLook={chooseLook}
        onNext={(e) => once(() => go(3), e)}
        onSkip={skipForNow}
        onBack={back}
      />
    );
  }
  return (
    <AgeStep
      announce={navigated}
      age={age}
      onAge={setAge}
      onNext={(e) => once(() => finish(age === 'none' ? null : age), e)}
      onSkip={skipForNow}
      onBack={back}
    />
  );
}
