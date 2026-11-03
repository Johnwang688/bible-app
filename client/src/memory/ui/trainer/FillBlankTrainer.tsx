// Trainer 2: say (or type) the missing phrase. One phrase of the verse is blanked; Try again blanks a different one.
// A graded answer without a hint records one attempt; one graded after a hint is shown but records nothing.
import { useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useTheme } from '../../../theme/ThemeProvider';
import { displayDiffFor, hintMask, type DisplayDiff } from '../../display/diff';
import { gradeStep } from '../../grading';
import { englishWords } from '../../speech/english';
import { loadSpeechKeyer, MANDARIN_SYNC_KEYER, ZH_PUNCTUATION_CHAR, type SpeechKeyer } from '../../speech/keyer';
import { verseView, type VerseLanguage } from '../../verseLanguage';
import { MemButton, MemCard } from '../parts';
import { ScriptureNotice } from '../ScriptureNotice';
import { useVerseFont } from '../useVerseFont';
import { AlikeNote, DiffText, Legend } from './DiffText';
import { HintPassNote, Note, ResultActions, ResultHeader, type Verdict } from './ResultPanel';
import { useAttempt } from './hooks';
import { RefBlock, StepTitle, TrainerShell, KeepInView } from './TrainerShell';
import type { TrainerCtx } from './types';
import { VoicePanel } from './VoicePanel';

/** A phrase this short (punctuation not counted; in English, words) must be said exactly: one slip is below 80%. */
const SHORT_PHRASE_CHARS = 4;
const SHORT_PHRASE_WORDS = 4;
/** The empty blank: ideographic spaces for Chinese, no-break spaces for English. */
const BLANK: Record<VerseLanguage, string> = { zh: '　'.repeat(8), en: ' '.repeat(16) };

interface Segment {
  text: string;
  /** The phrase's position, or null for the text between phrases. */
  chunk: number | null;
}

/** The verse as its phrases (found in order) and the text between them. */
function splitByChunks(text: string, chunks: readonly string[]): Segment[] {
  const out: Segment[] = [];
  let cursor = 0;
  chunks.forEach((chunk, i) => {
    const at = text.indexOf(chunk, cursor);
    if (at < 0) return;
    if (at > cursor) out.push({ text: text.slice(cursor, at), chunk: null });
    out.push({ text: chunk, chunk: i });
    cursor = at + chunk.length;
  });
  if (cursor < text.length) out.push({ text: text.slice(cursor), chunk: null });
  return out;
}

const countedChars = (phrase: string): number =>
  Array.from(phrase).filter((ch) => !ZH_PUNCTUATION_CHAR.test(ch) && !/[\s\p{P}]/u.test(ch)).length;

interface Result {
  verdict: Verdict;
  pct: number;
  said: string;
  diff: DisplayDiff;
  hinted: boolean;
  fromVoice: boolean;
}

export function FillBlankTrainer({ ctx }: { ctx: TrainerCtx }) {
  const theme = useTheme();
  const { t } = useI18n();
  const { verse, language } = ctx;
  const font = useVerseFont(language);
  const en = language === 'en';
  const traditional = ctx.script === 'traditional';
  // What is shown, in the verse language; English chunks are their own (their count may differ from the Chinese).
  const { chunks, text, lang } = verseView(verse, language, ctx.script);
  const n = chunks.length;

  const [position, setPosition] = useState(() => Math.floor(ctx.random() * n));
  const [hint, setHint] = useState<0 | 1 | 2>(0);
  const [result, setResult] = useState<Result | null>(null);
  const [round, setRound] = useState(0);
  const [prefill, setPrefill] = useState<string | undefined>(undefined);
  const attempt = useAttempt(ctx.left);

  // The phrase graded (simplified for Chinese), and as shown.
  const phrase = (en ? verse.chunksEn : verse.chunks)[position]!;
  const shown = chunks[position]!;
  const short = en ? englishWords(phrase).length <= SHORT_PHRASE_WORDS : countedChars(phrase) <= SHORT_PHRASE_CHARS;

  const grade = async (transcript: string, via: 'voice' | 'typed', signal?: AbortSignal, confirm?: () => Promise<boolean>) => {
    const ticket = attempt.begin(signal, confirm);
    if (!ticket) return;
    try {
      // English is graded word by word: no speech keyer to load.
      let keyer: SpeechKeyer = MANDARIN_SYNC_KEYER;
      if (via === 'voice' && !en) keyer = await loadSpeechKeyer(ctx.settings.speech).catch(() => MANDARIN_SYNC_KEYER);
      // Cancelled, a new round, an auth change, left, or the token replaced by another session while the keyer
      // loaded: the answer no longer belongs to the attempt on screen (a voice answer re-reads the token here).
      if (!(await ticket.confirm())) return;
      const answer = { kind: 'recall', transcript, chunkPosition: position } as const;
      const verdict = gradeStep(verse.id, 'fill-blank', answer, keyer, language);
      const diff = displayDiffFor(language, transcript, phrase, keyer, traditional && !en ? shown : undefined);
      // An answer given after a hint is shown, never recorded: the step only counts when it passes without one. Hint
      // use is read now, so a hint opened while recording or while this answer was graded counts.
      const hinted = attempt.hinted();
      // Nothing awaits between the check above and here, so the answer is still the attempt's when it records.
      if (!ticket.live()) return;
      if (!hinted) ctx.record(verdict.passed);
      setResult({
        verdict: !verdict.passed ? 'fail' : hinted ? 'hint-pass' : 'pass',
        pct: Math.round(verdict.matchPct),
        said: transcript,
        diff,
        hinted,
        fromVoice: via === 'voice',
      });
    } finally {
      ticket.done();
    }
  };

  /** A fresh attempt: hint use is cleared with it, and a grade still pending is void. */
  const tryAgain = () => {
    attempt.newRound(false);
    setPosition((p) => (p + 1 + Math.floor(ctx.random() * (n - 1))) % n);
    setHint(0);
    setResult(null);
    setPrefill(undefined);
    setRound((r) => r + 1);
  };
  const againWithoutHint = () => {
    attempt.newRound(false);
    setHint(0);
    setResult(null);
    setPrefill(undefined);
    setRound((r) => r + 1);
  };
  /** Correcting a misheard answer by typing is the same attempt, so hint use stays with it. */
  const typeWhatWasHeard = () => {
    if (!result) return;
    attempt.newRound(true);
    setPrefill(result.said);
    setResult(null);
    setRound((r) => r + 1);
  };

  const blankStyle = { backgroundColor: theme.colors.hl, color: theme.colors.hlText, textDecorationLine: 'underline' as const, textDecorationColor: theme.colors.accent };
  const blank = (
    <Text
      testID="memory-blank"
      accessibilityLabel={t('memory.fill.blank')}
      {...({ dataSet: { position } } as object)}
      style={blankStyle}
    >
      {hint === 0 ? BLANK[language] : null}
      {hint === 1 ? (
        <Text testID="memory-hint-text" style={{ fontWeight: '700' }}>
          {hintMask(shown, [shown], language)}
        </Text>
      ) : null}
      {hint === 2 ? (
        <Text testID="memory-hint-text" style={{ fontWeight: '700' }}>
          {shown}
        </Text>
      ) : null}
    </Text>
  );

  const segments = splitByChunks(text, chunks);
  const verseText = (
    <Text {...({ lang } as object)} style={{ color: theme.colors.text, fontFamily: font, fontSize: 22, lineHeight: 38 }}>
      {segments.map((seg, i) =>
        seg.chunk !== position ? (
          seg.text
        ) : result ? (
          <DiffText key={i} diff={result.diff} font={font} lang={lang} language={language} />
        ) : (
          <Text key={i}>{blank}</Text>
        ),
      )}
    </Text>
  );

  const header = result ? (
    <ResultHeader verdict={result.verdict} pct={`${result.pct}%`} />
  ) : (
    <StepTitle>{t('memory.trainer.fillIn')}</StepTitle>
  );

  const needs = (
    <View style={styles.needs}>
      <Text
        testID="memory-needs"
        style={{
          color: short ? theme.colors.text : theme.colors.muted,
          fontFamily: uiFace(theme.type.ui, short ? '700' : '400'),
          fontSize: 13,
        }}
      >
        {t(short ? (en ? 'memory.res.needsShortWords' : 'memory.res.needsShort') : 'memory.res.needs')}
      </Text>
      {short ? <Note>{t(en ? 'memory.res.needsShortWordsNote' : 'memory.res.needsShortNote')}</Note> : null}
    </View>
  );

  const hintButton =
    hint === 2 ? (
      <MemButton testID="memory-hint" kind="secondary" label={t('memory.hint.hidePhrase')} onPress={() => setHint(0)} />
    ) : hint === 1 ? (
      <MemButton testID="memory-hint" kind="secondary" label={t('memory.hint.showPhrase')} onPress={() => setHint(2)} />
    ) : (
      <MemButton
        testID="memory-hint"
        kind="secondary"
        label={t('memory.hint')}
        onPress={() => {
          attempt.markHinted();
          setHint(1);
        }}
      />
    );

  return (
    <TrainerShell
      ctx={ctx}
      chip={t('memory.kind.fillIn')}
      action={
        result ? (
          <ResultActions
            verdict={result.verdict}
            fromVoice={result.fromVoice}
            onNext={ctx.next}
            onTryAgain={tryAgain}
            onHintAgain={againWithoutHint}
            onSkip={ctx.skip}
            onHeardDifferently={typeWhatWasHeard}
          />
        ) : (
          <VoicePanel
            key={round}
            ctx={ctx}
            multiline={false}
            placeholder={t('memory.fill.typePlaceholder')}
            initialTyped={prefill}
            onAnswer={grade}
          />
        )
      }
    >
      {header}
      <RefBlock verse={verse} script={ctx.script} language={language} />
      <KeepInView>
        <MemCard>{verseText}</MemCard>
      </KeepInView>
      <ScriptureNotice language={language} />
      {result?.verdict === 'hint-pass' ? <HintPassNote /> : null}
      {needs}
      {result ? (
        <>
          <Legend language={language} />
          <AlikeNote ops={result.diff.ops} language={language} />
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
            {`${t('memory.res.youSaid')}: `}
            <Text {...({ lang: en ? 'en' : 'zh-Hans' } as object)} style={{ color: theme.colors.text, fontFamily: font, fontSize: 15 }}>
              {result.said}
            </Text>
          </Text>
        </>
      ) : (
        <>
          {hint > 0 ? <Note>{t('memory.hint.note')}</Note> : null}
          <View style={styles.hintRow}>
            {hintButton}
          </View>
        </>
      )}
    </TrainerShell>
  );
}

const styles = StyleSheet.create({
  needs: { gap: 4 },
  hintRow: { flexDirection: 'row' },
});
