// A lesson step or free practice, outside the tabs (so the tab bar is hidden). `?i=` is the step's place in today's
// lesson; without it this is practice and nothing counts for the day.
import { router, useLocalSearchParams } from 'expo-router';

import { isStageSlug } from '../../../../memory/stages';
import { parseStepIndex } from '../../../../memory/lessonPlan';
import { LessonScreen } from '../../../../memory/ui/trainer/LessonScreen';

export default function LessonRoute() {
  const params = useLocalSearchParams<{ verseId: string; stage: string; i?: string }>();
  const verseId = String(params.verseId ?? '');
  const stage = String(params.stage ?? '');
  const index = parseStepIndex(params.i);
  // A lesson step goes back by replacing the route, so Memory home mounts afresh and shows "Progress saved" (the step
  // noted it on the way out); practice returns to the home that is already there.
  const goBack = () => (index === null && router.canGoBack() ? router.back() : router.replace('/study/memory'));
  if (!isStageSlug(stage)) {
    // A stage that is not a trainer: the not-found state, with a way back.
    return <LessonScreen verseId="" stage="chunk-order" index={null} onNavigate={(href) => router.replace(href as never)} onBack={goBack} />;
  }
  return (
    <LessonScreen
      verseId={verseId}
      stage={stage}
      index={index}
      onNavigate={(href) => router.replace(href as never)}
      onBack={goBack}
    />
  );
}
