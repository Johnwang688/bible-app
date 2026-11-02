// The first-run intro (R-7a): welcome, pick your look, your age. The step and the age choice live here, in
// component state, so a theme change from the live preview never resets them.
import { useCallback, useEffect, useRef, useState } from 'react';
import { BackHandler, Platform } from 'react-native';

import type { FirstRun } from './firstRun';
import { AgeStep } from './steps/AgeStep';
import { LookStep } from './steps/LookStep';
import type { AgeChoice } from './steps/types';
import { WelcomeStep } from './steps/WelcomeStep';

export function FirstRunFlow({ firstRun }: { firstRun: FirstRun }) {
  const { chooseLook, finish, skip } = firstRun;
  const [step, setStep] = useState<1 | 2 | 3>(1);
  const [age, setAge] = useState<AgeChoice>(null);
  // The web moves focus to a step's heading, but not for the first step on first mount.
  const [navigated, setNavigated] = useState(false);

  // One press per step: a fast double tap on a primary button or a skip must not finish twice or skip a step.
  // It opens again when the step changes.
  const spent = useRef(false);
  useEffect(() => {
    spent.current = false;
  }, [step]);
  const once = useCallback((fn: () => void) => {
    if (spent.current) return;
    spent.current = true;
    fn();
  }, []);

  const go = useCallback((to: 1 | 2 | 3) => {
    setNavigated(true);
    setStep(to);
  }, []);
  const back = useCallback(() => {
    if (step > 1) once(() => go((step - 1) as 1 | 2));
  }, [step, once, go]);

  // The Android hardware back button goes back a step on steps 2 and 3 and does nothing special on step 1.
  useEffect(() => {
    if (Platform.OS !== 'android') return undefined;
    const sub = BackHandler.addEventListener('hardwareBackPress', () => {
      if (step === 1) return false;
      back();
      return true;
    });
    return () => sub.remove();
  }, [step, back]);

  // "Skip for now" ends the intro with the look as picked and no age, even if a chip was chosen.
  const skipForNow = () => once(() => finish(null));

  if (step === 1) {
    return <WelcomeStep announce={navigated} onNext={() => once(() => go(2))} onSkip={() => once(skip)} />;
  }
  if (step === 2) {
    return (
      <LookStep
        announce={navigated}
        chooseLook={chooseLook}
        onNext={() => once(() => go(3))}
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
      onNext={() => once(() => finish(age === 'none' ? null : age))}
      onSkip={skipForNow}
      onBack={back}
    />
  );
}
