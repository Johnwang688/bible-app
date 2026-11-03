// Trainer 3: say (or type) the whole verse with its reference. The verse is hidden; the reference may come first or
// last. The result draws the verse against the grader's alignment and says how the reference was read.
import { useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useTheme } from '../../../theme/ThemeProvider';
import { hintMask, recallDisplay, type RecallDisplay } from '../../display/diff';
import { gradeStep } from '../../grading';
import { loadSpeechKeyer, MANDARIN_SYNC_KEYER, type SpeechKeyer } from '../../speech/keyer';
import { parseSpokenReference, referenceForms, toTraditionalTitle } from '../../speech/fullRecall';
import { MemButton, MemCard, SectionLabel } from '../parts';
import { useChineseFont } from '../useChineseFont';
import { AlikeNote, DiffText, Legend } from './DiffText';
import { useAttempt } from './hooks';
import { TrainerIcon } from './icons';
import { HintPassNote, Note, ResultActions, ResultHeader, type Verdict } from './ResultPanel';
import { referenceOf, RefBlock, StepTitle, TrainerShell } from './TrainerShell';
import type { TrainerCtx } from './types';
import { VoicePanel } from './VoicePanel';

interface Result {
  verdict: Verdict;
  pct: number;
  said: string;
  display: RecallDisplay;
  fromVoice: boolean;
}

export function FullRecallTrainer({ ctx }: { ctx: TrainerCtx }) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const font = useChineseFont();
  const { verse } = ctx;
  const traditional = ctx.script === 'traditional';
  const lang = traditional ? 'zh-Hant' : 'zh-Hans';
  const chunks = traditional ? verse.chunksHant : verse.chunks;
  const text = traditional ? verse.textZhHant : verse.textZh;
  const reference = referenceOf(verse, ctx.script);

  const [hint, setHint] = useState<0 | 1 | 2>(0);
  const [result, setResult] = useState<Result | null>(null);
  const [round, setRound] = useState(0);
  const [prefill, setPrefill] = useState<string | undefined>(undefined);
  const attempt = useAttempt(ctx.left);

  const grade = async (transcript: string, via: 'voice' | 'typed', signal?: AbortSignal, confirm?: () => Promise<boolean>) => {
    const ticket = attempt.begin(signal, confirm);
    if (!ticket) return;
    try {
      let keyer: SpeechKeyer = MANDARIN_SYNC_KEYER;
      if (via === 'voice') keyer = await loadSpeechKeyer(ctx.settings.speech).catch(() => MANDARIN_SYNC_KEYER);
      // Cancelled, a new round, an auth change, left, or the token replaced by another session while the keyer
      // loaded: the answer no longer belongs to the attempt on screen (a voice answer re-reads the token here).
      if (!(await ticket.confirm())) return;
      const verdict = gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript }, keyer);
      const display = recallDisplay(transcript, verse, keyer, ctx.script);
      // A hint or a peek is shown, never recorded: the step only counts when it passes without one. Hint use is read
      // now, so a hint opened while recording or while this answer was graded counts.
      const hinted = attempt.hinted();
      // Nothing awaits between the check above and here, so the answer is still the attempt's when it records.
      if (!ticket.live()) return;
      if (!hinted) ctx.record(verdict.passed);
      setResult({
        verdict: !verdict.passed ? 'fail' : hinted ? 'hint-pass' : 'pass',
        pct: Math.round(verdict.matchPct),
        said: transcript,
        display,
        fromVoice: via === 'voice',
      });
    } finally {
      ticket.done();
    }
  };

  /** A fresh attempt: hint use is cleared with it, and a grade still pending is void. */
  const reset = () => {
    attempt.newRound(false);
    setHint(0);
    setResult(null);
    setPrefill(undefined);
    setRound((r) => r + 1);
  };
  /** Correcting a misheard answer by typing is the same attempt, so hint use stays with it. */
  const typeWhatWasHeard = (said: string) => {
    attempt.newRound(true);
    setResult(null);
    setPrefill(said);
    setRound((r) => r + 1);
  };

  const topic = locale === 'en' ? `${verse.topicZh} · ${verse.topicEn}` : verse.topicZh;
  const forms = referenceForms(verse.referenceZh, reference, traditional) ?? [reference];

  /** How the reference fared, in a few words (it is also read out with the verdict). */
  const referenceHead = (display: RecallDisplay): string =>
    t(display.referenceStatus === 'correct' ? 'memory.recall.refRight' : display.referenceStatus === 'missing' ? 'memory.recall.refNone' : 'memory.recall.refWrong');

  /** The reference card: what was heard, and how it was read. */
  const refCard = (display: RecallDisplay) => {
    const status = display.referenceStatus;
    let line: string;
    if (status === 'correct') {
      line = t('memory.recall.heardOk', { heard: display.heardReference ?? '', ref: reference });
    } else if (status === 'missing') {
      line = t('memory.recall.heardNone');
    } else {
      const expected = parseSpokenReference(verse.referenceZh);
      const heard = display.heardReference === null ? null : parseSpokenReference(display.heardReference);
      const heardText = display.heardReference ?? '';
      if (expected && heard && heard.book === expected.book) {
        line = t('memory.recall.heardChapter', { heard: heardText, ref: reference.replace(/^\S+\s+/, '') });
      } else {
        line = t('memory.recall.heardBook', { heard: heardText, book: traditional && expected ? toTraditionalTitle(expected.book) : (expected?.book ?? '') });
      }
    }
    const head = referenceHead(display);
    return (
      <MemCard testID="memory-ref-card" style={styles.refCard}>
        <View style={styles.refHead}>
          <SectionLabel>{t('memory.recall.reference')}</SectionLabel>
          <View style={styles.refStatus}>
            <TrainerIcon name={status === 'correct' ? 'check' : status === 'missing' ? 'dash' : 'x'} color={theme.colors.text} size={16} strokeWidth={2.6} />
            <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13, flexShrink: 1 }}>{head}</Text>
          </View>
        </View>
        <Text {...({ lang: 'zh-Hans' } as object)} style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 21 }}>
          {line}
        </Text>
      </MemCard>
    );
  };

  const topicRow = (
    <MemCard style={styles.topicRow}>
      <SectionLabel>{t('memory.recall.topic')}</SectionLabel>
      <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, flexShrink: 1, textAlign: 'right' }}>{topic}</Text>
    </MemCard>
  );

  let body;
  if (result) {
    body = (
      <>
        <ResultHeader verdict={result.verdict} pct={`${result.pct}%`} detail={referenceHead(result.display)} />
        <RefBlock verse={verse} script={ctx.script} />
        <MemCard>
          <SectionLabel>{t('memory.recall.verse')}</SectionLabel>
          <DiffText diff={result.display.body} font={font} size={21} lang={lang} />
        </MemCard>
        {refCard(result.display)}
        {result.verdict === 'hint-pass' ? <HintPassNote /> : null}
        <Legend />
        <AlikeNote ops={result.display.body.ops} />
        <Note>{t('memory.res.needsBoth')}</Note>
      </>
    );
  } else {
    body = (
      <>
        <StepTitle>{t('memory.trainer.recall')}</StepTitle>
        {hint === 0 ? (
          <MemCard>
            <SectionLabel>{t('memory.recall.topic')}</SectionLabel>
            <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>{topic}</Text>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 21 }}>
              {t('memory.trainer.recallSub')}
            </Text>
            <View testID="memory-ref-help" style={styles.refHelp}>
              <Note>{t('memory.recall.refHelp')}</Note>
              {forms.map((form) => (
                <View key={form} style={styles.formRow}>
                  <View accessible={false} style={[styles.dot, { backgroundColor: theme.colors.accent }]} />
                  <Text {...({ lang } as object)} style={{ flex: 1, color: theme.colors.text, fontFamily: font, fontSize: 15, lineHeight: 22 }}>
                    {form}
                  </Text>
                </View>
              ))}
            </View>
          </MemCard>
        ) : (
          topicRow
        )}
        {hint === 1 ? (
          <MemCard background={theme.canvas.c1 === undefined ? undefined : { backgroundColor: theme.canvas.c1 }}>
            <SectionLabel color={theme.canvas.c1m}>{t('memory.hint')}</SectionLabel>
            <Text
              testID="memory-hint-text"
              {...({ lang } as object)}
              style={{ color: theme.canvas.c1t ?? theme.colors.text, fontFamily: font, fontSize: 21, lineHeight: 36, letterSpacing: 1 }}
            >
              {hintMask(text, chunks)}
            </Text>
          </MemCard>
        ) : null}
        {hint === 2 ? (
          <MemCard background={theme.canvas.c1 === undefined ? undefined : { backgroundColor: theme.canvas.c1 }}>
            <Text
              testID="memory-hint-text"
              {...({ lang } as object)}
              style={{ color: theme.canvas.c1t ?? theme.colors.text, fontFamily: font, fontSize: 21, lineHeight: 36 }}
            >
              {text}
            </Text>
            <RefBlock verse={verse} script={ctx.script} />
          </MemCard>
        ) : null}
        {hint > 0 ? <Note>{t('memory.hint.note')}</Note> : null}
        <View style={styles.hintRow}>
          <MemButton
            testID="memory-hint"
            kind="secondary"
            label={t(hint === 0 ? 'memory.hint' : hint === 1 ? 'memory.hint.showVerse' : 'memory.hint.hideVerse')}
            onPress={() => {
              if (hint === 0) {
                attempt.markHinted();
                setHint(1);
              } else setHint(hint === 1 ? 2 : 0);
            }}
          />
        </View>
      </>
    );
  }

  return (
    <TrainerShell
      ctx={ctx}
      chip={t('memory.kind.recall')}
      action={
        result ? (
          <ResultActions
            verdict={result.verdict}
            fromVoice={result.fromVoice}
            onNext={ctx.next}
            onTryAgain={() => reset()}
            onHintAgain={() => reset()}
            onSkip={ctx.skip}
            onHeardDifferently={() => typeWhatWasHeard(result.said)}
          />
        ) : (
          <VoicePanel
            key={round}
            ctx={ctx}
            multiline
            placeholder={t('memory.recall.typePlaceholder')}
            initialTyped={prefill}
            onAnswer={grade}
          />
        )
      }
    >
      {body}
    </TrainerShell>
  );
}

const styles = StyleSheet.create({
  topicRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 10, paddingVertical: 12 },
  refHelp: { gap: 4 },
  formRow: { flexDirection: 'row', alignItems: 'flex-start', gap: 8 },
  dot: { width: 6, height: 6, borderRadius: 999, marginTop: 9 },
  hintRow: { flexDirection: 'row' },
  refCard: { gap: 6, paddingVertical: 14 },
  refHead: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 8 },
  refStatus: { flexDirection: 'row', alignItems: 'center', gap: 6, flexShrink: 1 },
});
