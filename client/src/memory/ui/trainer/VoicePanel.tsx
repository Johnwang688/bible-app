// The answer panel of fill-in and full recall: the mic (idle, recording, checking), the notice that stands in its
// place when voice can't be used, the consent sheet on the first tap, and the typing field. A voice answer or a typed
// one comes out of `onAnswer`; grading and recording are the trainer's job.
//
// Concurrency: a request id (`gen`) is bumped by every new recording, send and cancel, so a tick, an auto-stop or a
// transcription that settles after Cancel, after Try again or after unmount is ignored. `busy` latches the stop /
// auto-stop / send chain so a double tap or a stop racing the 30 s cap sends once. Each answer goes out with its own
// AbortSignal, aborted by Cancel (while it is checked or graded) and by unmounting, so the trainer's grade, which
// awaits too, becomes a no-op. `onAnswer` is always the latest render's: the auto-stop callback and a pending send
// hold an older render's closure, and must not grade with the state that render saw.
import { useCallback, useEffect, useLayoutEffect, useRef, useState, type ReactNode } from 'react';
import { ActivityIndicator, Linking, Platform, Pressable, StyleSheet, Text, TextInput, View } from 'react-native';

import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useTheme } from '../../../theme/ThemeProvider';
import { useMemorySettings } from '../../useMemorySettings';
import { useMemoryAuth } from '../../voice/auth';
import { recordVoiceOutcome, useVoiceSession, voiceGate } from '../../voice/availability';
import { MAX_RECORDING_MS, MINUTE_LIMIT_MAX_RETRY_S, type MicPermission, type VoiceNotice, type VoiceOutcome } from '../../voice/types';
import { MemorySettingsSheet } from '../MemorySettingsSheet';
import { MemButton, MemCard } from '../parts';
import { ConsentSheet } from './ConsentSheet';
import { useKeyboardOpen, useLargeText } from './hooks';
import { TrainerIcon, type TrainerIconName } from './icons';
import type { TrainerCtx } from './types';

/** After an attempt: the notices that come with a Try again. */
type RetryNotice = 'too-long' | 'timeout' | 'error';
type NoticeKind = VoiceNotice | RetryNotice;
type LocalNotice = RetryNotice | 'signed-out' | 'offline' | 'unsupported';
type Mode = 'idle' | 'starting' | 'recording' | 'grading';

/** The announcement comes at 20 s of a 30 s recording. */
const TEN_LEFT_FROM_MS = 20_000;

// The 429 the app last saw: its window (the gate only knows the seconds left), kept so "24 hours" and "in a row" stay
// right as the countdown runs down. Matched by the instant it lifts.
let lastLimit: { until: number; window: 'minute' | 'day' } | null = null;

/** The clock, read when the gate is evaluated (it is re-evaluated when a limit lifts or the network changes). */
const currentTime = (): number => Date.now();

const formatTime = (ms: number): string => {
  const s = Math.min(30, Math.floor(ms / 1000));
  return `${Math.floor(s / 60)}:${String(s % 60).padStart(2, '0')}`;
};

export interface VoicePanelProps {
  ctx: TrainerCtx;
  multiline: boolean;
  placeholder: string;
  /** "Heard differently? Type it": opens the field already holding what was heard. */
  initialTyped?: string;
  /**
   * A transcript or typed answer. `signal` aborts when the answer stops belonging to this panel's attempt (Cancel
   * while it is graded, the panel unmounting); a grade still pending then must record and show nothing.
   */
  onAnswer(text: string, via: 'voice' | 'typed', signal: AbortSignal): void | Promise<void>;
}

export function VoicePanel({ ctx, multiline, placeholder, initialTyped, onAnswer }: VoicePanelProps) {
  const { t } = useI18n();
  const auth = useMemoryAuth();
  const session = useVoiceSession();
  const [, patchSettings] = useMemorySettings(ctx.storage);
  const largeText = useLargeText();
  const keyboardOpen = useKeyboardOpen();
  const { recorder, checkVoice, baseUrl, isOnline } = ctx.voice;

  const [mode, setMode] = useState<Mode>('idle');
  const [local, setLocal] = useState<LocalNotice | null>(null);
  const [permission, setPermission] = useState<MicPermission>('prompt');
  const [typeOpen, setTypeOpen] = useState(initialTyped !== undefined);
  const [focusField, setFocusField] = useState(false);
  const [typed, setTyped] = useState(initialTyped ?? '');
  const [consentOpen, setConsentOpen] = useState(false);
  const [settingsOpen, setSettingsOpen] = useState(false);
  const [elapsed, setElapsed] = useState(0);
  const [, setBeat] = useState(0);

  const mounted = useRef(true);
  const gen = useRef(0);
  const busy = useRef(false);
  const modeRef = useRef<Mode>('idle');
  const abort = useRef<AbortController | null>(null);
  const typedAbort = useRef<AbortController | null>(null);
  const checking = useRef(false);
  const answer = useRef(onAnswer);
  useLayoutEffect(() => {
    answer.current = onAnswer;
  });
  const go = (next: Mode) => {
    modeRef.current = next;
    setMode(next);
  };

  useEffect(() => {
    mounted.current = true;
    void recorder.permission().then((p) => {
      if (mounted.current) setPermission((cur) => (cur === 'denied' ? cur : p));
    });
    return () => {
      mounted.current = false;
      abort.current?.abort();
      typedAbort.current?.abort();
      if (modeRef.current === 'recording' || modeRef.current === 'starting') recorder.cancel();
    };
  }, [recorder]);

  // Re-evaluate the gate when it should change: a limit lifting (every second in its last minute), the network.
  const beat = useCallback(() => setBeat((n) => n + 1), []);
  const limitedUntil = session.limitedUntil;
  useEffect(() => {
    if (limitedUntil === null) return;
    const left = limitedUntil - Date.now();
    if (left <= 0) return;
    // One timer at the moment the limit passes, plus a per-second tick for the countdown in its last minute.
    let tick: ReturnType<typeof setInterval> | undefined;
    let start: ReturnType<typeof setTimeout> | undefined;
    const lift = setTimeout(() => {
      if (tick !== undefined) clearInterval(tick);
      if (start !== undefined) clearTimeout(start);
      beat();
    }, left + 50);
    const startTick = () => {
      tick = setInterval(beat, 1000);
    };
    if (left <= MINUTE_LIMIT_MAX_RETRY_S * 1000) startTick();
    else start = setTimeout(() => {
      beat();
      startTick();
    }, left - MINUTE_LIMIT_MAX_RETRY_S * 1000 + 50);
    return () => {
      clearTimeout(lift);
      if (start !== undefined) clearTimeout(start);
      if (tick !== undefined) clearInterval(tick);
    };
  }, [limitedUntil, beat]);
  useEffect(() => {
    if (typeof window === 'undefined' || typeof window.addEventListener !== 'function') return;
    window.addEventListener('online', beat);
    window.addEventListener('offline', beat);
    return () => {
      window.removeEventListener('online', beat);
      window.removeEventListener('offline', beat);
    };
  }, [beat]);

  const online = isOnline();
  const gate = voiceGate({
    voiceOn: ctx.settings.voice,
    supported: recorder.supported,
    signedIn: auth.signedIn,
    online,
    serviceDown: session.serviceDown,
    limitedUntil,
    now: currentTime(),
    permission,
  });
  const localNotice = local === 'offline' && online ? null : local;
  const notice: NoticeKind | null = mode !== 'idle' ? null : gate.kind === 'notice' ? gate.notice : localNotice;

  // ---- recording ----------------------------------------------------------------------------------------------
  const beginSend = async (blob: Blob) => {
    const id = ++gen.current;
    const controller = new AbortController();
    abort.current = controller;
    go('grading');
    let outcome: VoiceOutcome;
    try {
      outcome = await checkVoice(blob, ctx.settings.speech, { baseUrl, getIdToken: auth.getIdToken, isOnline }, controller.signal);
    } catch {
      outcome = { kind: 'error' };
    }
    if (id !== gen.current || !mounted.current) return; // cancelled, retried or gone: a late answer is ignored
    const now = Date.now();
    recordVoiceOutcome(outcome, now);
    if (outcome.kind === 'limit') lastLimit = { until: now + outcome.retryAfterS * 1000, window: outcome.window };
    if (outcome.kind === 'text') {
      // The controller stays live while the trainer grades: Cancel (still on screen) or unmounting aborts the grade.
      try {
        await answer.current(outcome.text, 'voice', controller.signal);
      } finally {
        if (abort.current === controller) abort.current = null;
        if (mounted.current && id === gen.current) {
          busy.current = false;
          go('idle');
        }
      }
      return;
    }
    abort.current = null;
    busy.current = false;
    if (outcome.kind === 'signed-out') setLocal('signed-out');
    else if (outcome.kind === 'offline') setLocal('offline');
    else if (outcome.kind === 'too-long' || outcome.kind === 'timeout' || outcome.kind === 'error') setLocal(outcome.kind);
    go('idle');
  };

  const startRecording = async () => {
    if (busy.current || modeRef.current !== 'idle') return;
    const id = ++gen.current;
    setElapsed(0);
    go('starting');
    const alive = () => mounted.current && id === gen.current;
    const result = await recorder.start({
      maxMs: MAX_RECORDING_MS,
      onTick: (ms) => {
        if (alive()) setElapsed(ms);
      },
      onAutoStop: (recording) => {
        if (!alive() || busy.current) return;
        busy.current = true;
        void beginSend(recording.blob);
      },
    });
    if (!alive()) {
      if (result === 'recording') recorder.cancel();
      return;
    }
    if (result === 'denied') {
      setPermission('denied');
      go('idle');
    } else if (result === 'unsupported') {
      setLocal('unsupported');
      go('idle');
    } else {
      go('recording');
    }
  };

  const stop = async () => {
    if (busy.current || modeRef.current !== 'recording') return;
    busy.current = true;
    const id = gen.current;
    const recording = await recorder.stop();
    if (!mounted.current || id !== gen.current) return;
    if (!recording) {
      busy.current = false;
      go('idle');
      return;
    }
    await beginSend(recording.blob);
  };

  const cancelRecording = () => {
    gen.current++;
    busy.current = false;
    recorder.cancel();
    go('idle');
  };

  const cancelChecking = () => {
    gen.current++;
    abort.current?.abort();
    abort.current = null;
    busy.current = false;
    go('idle');
  };

  const onMic = () => {
    if (!ctx.settings.voiceConsent) setConsentOpen(true);
    else void startRecording();
  };

  const submitTyped = () => {
    const text = typed.trim();
    if (text === '' || checking.current) return;
    checking.current = true;
    const controller = new AbortController();
    typedAbort.current = controller;
    void Promise.resolve(answer.current(text, 'typed', controller.signal)).finally(() => {
      checking.current = false;
      if (typedAbort.current === controller) typedAbort.current = null;
    });
  };

  const openType = () => {
    setFocusField(true);
    setTypeOpen(true);
  };

  // ---- pieces -------------------------------------------------------------------------------------------------
  const field = (main: boolean, dim = false): ReactNode => (
    <TypeField
      main={main}
      dim={dim}
      multiline={multiline}
      placeholder={placeholder}
      value={typed}
      onChange={setTyped}
      onCheck={submitTyped}
      autoFocus={focusField}
      lang={ctx.script === 'traditional' ? 'zh-Hant' : 'zh-Hans'}
    />
  );

  let body: ReactNode;
  if (mode === 'recording') {
    body = (
      <>
        <RecordingBlock elapsed={elapsed} compact={largeText} onStop={() => void stop()} onCancel={cancelRecording} />
        {field(false, true)}
      </>
    );
  } else if (mode === 'grading') {
    body = (
      <>
        <GradingBlock compact={largeText} onCancel={cancelChecking} />
        {field(false, true)}
      </>
    );
  } else if (notice !== null) {
    body = (
      <>
        <NoticeCard
          notice={notice}
          retryAfterS={gate.kind === 'notice' ? gate.retryAfterS : undefined}
          limitedUntil={limitedUntil}
          onSettings={() => setSettingsOpen(true)}
          onTryAgain={() => setLocal(null)}
          signIn={auth.signIn}
        />
        {field(true)}
      </>
    );
  } else {
    body = (
      <>
        {keyboardOpen ? null : <MicBlock compact={largeText} starting={mode === 'starting'} onPress={onMic} />}
        {typeOpen ? (
          field(false)
        ) : (
          <MemButton
            testID="memory-type-toggle"
            kind="secondary"
            block
            label={t('memory.type.instead')}
            accessibilityLabel={t('memory.type.aria')}
            onPress={openType}
          />
        )}
      </>
    );
  }

  return (
    <View style={styles.panel}>
      {body}
      {consentOpen ? (
        <ConsentSheet
          onClose={() => setConsentOpen(false)}
          onType={() => {
            setConsentOpen(false);
            openType();
          }}
          onAllow={() => {
            patchSettings({ voiceConsent: true });
            setConsentOpen(false);
            void startRecording();
          }}
        />
      ) : null}
      <MemorySettingsSheet visible={settingsOpen} onClose={() => setSettingsOpen(false)} storage={ctx.storage} />
    </View>
  );
}

// ---------------------------------------------------------------------------------------------------------------
// The mic
// ---------------------------------------------------------------------------------------------------------------

function RoundMic({
  size,
  testID,
  label,
  onPress,
  disabled = false,
  rings = false,
  children,
}: {
  size: number;
  testID: string;
  label: string;
  onPress?: () => void;
  disabled?: boolean;
  rings?: boolean;
  children: ReactNode;
}) {
  const theme = useTheme();
  const border = theme.borders.button;
  return (
    <View style={{ width: size, height: size }}>
      {rings ? (
        <>
          <View accessible={false} style={[styles.ring, { borderColor: theme.colors.accent, opacity: 0.5, top: -6, left: -6, right: -6, bottom: -6 }]} />
          <View accessible={false} style={[styles.ring, { borderColor: theme.colors.accent, opacity: 0.25, top: -12, left: -12, right: -12, bottom: -12 }]} />
        </>
      ) : null}
      <Pressable
        testID={testID}
        accessibilityRole="button"
        accessibilityLabel={label}
        accessibilityState={{ disabled, busy: disabled }}
        disabled={disabled || onPress === undefined}
        onPress={onPress}
        style={({ pressed }) => [
          styles.round,
          {
            width: size,
            height: size,
            backgroundColor: theme.colors.cta,
            borderWidth: border?.width ?? 0,
            borderColor: border?.color,
            boxShadow: theme.shadows.cta,
            opacity: pressed ? 0.85 : 1,
          },
        ]}
      >
        {children}
      </Pressable>
    </View>
  );
}

function MicBlock({ compact, starting, onPress }: { compact: boolean; starting: boolean; onPress(): void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const size = compact ? 64 : 96;
  return (
    <View style={compact ? styles.micRow : styles.micStack}>
      <RoundMic size={size} testID="memory-mic" label={t('memory.mic.idleAria')} onPress={onPress} disabled={starting}>
        <TrainerIcon name="mic" color={theme.colors.onCta} size={compact ? 28 : 38} />
      </RoundMic>
      <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{t('memory.mic.idle')}</Text>
    </View>
  );
}

function RecordingBlock({ elapsed, compact, onStop, onCancel }: { elapsed: number; compact: boolean; onStop(): void; onCancel(): void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const size = compact ? 64 : 96;
  return (
    <View style={compact ? styles.micRow : styles.micStack}>
      <View style={compact ? styles.ringRoomSmall : styles.ringRoom}>
        <RoundMic size={size} testID="memory-mic-stop" label={t('memory.mic.stopAria')} onPress={onStop} rings>
          <TrainerIcon name="stop" color={theme.colors.onCta} size={compact ? 28 : 38} fill />
        </RoundMic>
      </View>
      <View style={compact ? styles.micText : styles.micStack}>
        <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>
          {t('memory.mic.stop')}
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }}> · </Text>
          <Text testID="memory-rec-timer" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }}>
            {`${formatTime(elapsed)} / 0:30`}
          </Text>
        </Text>
        <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>{t('memory.mic.stopsAt')}</Text>
        <MemButton
          testID="memory-mic-cancel"
          kind="ghost"
          label={t('memory.mic.cancel')}
          accessibilityLabel={t('memory.mic.cancelRecAria')}
          onPress={onCancel}
        />
        <Text testID="memory-rec-announce" role="status" aria-live="polite" accessibilityLiveRegion="polite" style={styles.hidden}>
          {elapsed >= TEN_LEFT_FROM_MS ? t('memory.mic.tenLeft') : ''}
        </Text>
      </View>
    </View>
  );
}

function GradingBlock({ compact, onCancel }: { compact: boolean; onCancel(): void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const size = compact ? 64 : 96;
  return (
    <View testID="memory-grading" style={compact ? styles.micRow : styles.micStack}>
      <RoundMic size={size} testID="memory-grading-spinner" label={t('memory.mic.checkingAria')} disabled>
        <ActivityIndicator color={theme.colors.onCta} size="large" />
      </RoundMic>
      <View style={compact ? styles.micText : styles.micStack}>
        <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{t('memory.mic.checking')}</Text>
        <Text
          style={{
            color: theme.colors.muted,
            fontFamily: uiFace(theme.type.ui, '400'),
            fontSize: 13,
            lineHeight: 19,
            textAlign: compact ? 'left' : 'center',
          }}
        >
          {t('memory.mic.sentNote')}
        </Text>
        <MemButton
          testID="memory-grading-cancel"
          kind="ghost"
          label={t('memory.mic.cancel')}
          accessibilityLabel={t('memory.mic.cancelCheckAria')}
          onPress={onCancel}
        />
      </View>
    </View>
  );
}

// ---------------------------------------------------------------------------------------------------------------
// Notices
// ---------------------------------------------------------------------------------------------------------------

const NOTICE_ICON: Record<NoticeKind, TrainerIconName> = {
  'voice-off': 'micOff',
  unsupported: 'micOff',
  'signed-out': 'user',
  offline: 'wifiOff',
  'no-service': 'info',
  limit: 'clock',
  denied: 'micOff',
  'too-long': 'clock',
  timeout: 'clock',
  error: 'info',
};

function NoticeCard({
  notice,
  retryAfterS,
  limitedUntil,
  onSettings,
  onTryAgain,
  signIn,
}: {
  notice: NoticeKind;
  retryAfterS: number | undefined;
  limitedUntil: number | null;
  onSettings(): void;
  onTryAgain(): void;
  signIn: (() => void) | undefined;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const web = Platform.OS === 'web';
  let title: string | null = null;
  let body: string;
  let second: string | null = null;
  let button: ReactNode = null;
  const tryAgain = (
    <MemButton testID="memory-notice-try-again" kind="primary" block label={t('memory.notice.tryAgain')} onPress={onTryAgain} />
  );
  switch (notice) {
    case 'voice-off':
      body = t('memory.notice.voiceOff');
      button = <MemButton testID="memory-notice-settings" kind="secondary" block label={t('memory.notice.settings')} onPress={onSettings} />;
      break;
    case 'unsupported':
      body = t('memory.notice.unsupported');
      break;
    case 'signed-out':
      body = t('memory.notice.signedOut');
      if (signIn) button = <MemButton testID="memory-notice-sign-in" kind="secondary" block label={t('memory.notice.signIn')} onPress={signIn} />;
      break;
    case 'offline':
      body = t('memory.notice.offline');
      break;
    case 'no-service':
      body = t('memory.notice.noService');
      break;
    case 'limit': {
      const left = retryAfterS ?? MINUTE_LIMIT_MAX_RETRY_S;
      const window = lastLimit && lastLimit.until === limitedUntil ? lastLimit.window : left > MINUTE_LIMIT_MAX_RETRY_S ? 'day' : 'minute';
      if (window === 'minute') body = t('memory.notice.limitMinute', { n: left });
      else {
        const hours = Math.max(1, Math.ceil(left / 3600));
        body = hours === 1 ? t('memory.notice.limitDayOne') : t('memory.notice.limitDay', { n: hours });
      }
      break;
    }
    case 'denied':
      title = t('memory.notice.deniedTitle');
      body = t('memory.notice.denied');
      if (web) second = t('memory.notice.deniedWeb');
      else
        button = (
          <MemButton
            testID="memory-notice-open-settings"
            kind="secondary"
            block
            label={t('memory.notice.openSettings')}
            onPress={() => void Linking.openSettings()}
          />
        );
      break;
    case 'too-long':
      body = t('memory.notice.tooLong');
      button = tryAgain;
      break;
    case 'timeout':
      body = t('memory.notice.timeout');
      button = tryAgain;
      break;
    default:
      body = t('memory.notice.error');
      button = tryAgain;
  }
  return (
    <MemCard testID={`memory-notice-${notice}`} style={styles.notice}>
      <View style={styles.noticeRow}>
        <View style={[styles.noticeIcon, { borderColor: theme.colors.accent }]}>
          <TrainerIcon name={NOTICE_ICON[notice]} color={theme.colors.accent} size={20} />
        </View>
        <View style={styles.noticeText}>
          {title ? <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 16 }}>{title}</Text> : null}
          <Text
            style={{
              color: title ? theme.colors.muted : theme.colors.text,
              fontFamily: uiFace(theme.type.ui, title ? '400' : '700'),
              fontSize: 14,
              lineHeight: 20,
            }}
          >
            {body}
          </Text>
          {second ? (
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 19 }}>{second}</Text>
          ) : null}
        </View>
      </View>
      {button}
    </MemCard>
  );
}

// ---------------------------------------------------------------------------------------------------------------
// Typing
// ---------------------------------------------------------------------------------------------------------------

function TypeField({
  main,
  dim,
  multiline,
  placeholder,
  value,
  onChange,
  onCheck,
  autoFocus,
  lang,
}: {
  main: boolean;
  dim: boolean;
  multiline: boolean;
  placeholder: string;
  value: string;
  onChange(text: string): void;
  onCheck(): void;
  autoFocus: boolean;
  lang: string;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const border = theme.borders.button;
  const empty = value.trim() === '';
  const input = (
    <TextInput
      testID="memory-type-input"
      accessibilityLabel={t('memory.type.aria')}
      {...({ lang } as object)}
      value={value}
      onChangeText={onChange}
      placeholder={placeholder}
      placeholderTextColor={theme.colors.muted}
      multiline={multiline}
      numberOfLines={multiline ? 4 : 1}
      editable={!dim}
      autoFocus={autoFocus}
      autoCapitalize="none"
      autoCorrect={false}
      onSubmitEditing={multiline ? undefined : onCheck}
      returnKeyType={multiline ? 'default' : 'done'}
      style={[
        styles.input,
        multiline && styles.inputMulti,
        {
          color: theme.colors.btnText,
          fontFamily: uiFace(theme.type.ui, '400'),
          borderRadius: multiline ? Math.min(theme.radii.button, 24) : theme.radii.button,
          borderWidth: border?.width ?? 1,
          borderColor: border?.color ?? theme.colors.muted,
        },
        theme.backgrounds.button,
        main && styles.inputMain,
      ]}
    />
  );
  const check = (
    <MemButton
      testID="memory-type-check"
      kind="primary"
      block={main}
      label={t('memory.type.check')}
      accessibilityLabel={t('memory.type.checkAria')}
      disabled={empty || dim}
      onPress={onCheck}
    />
  );
  if (main) {
    return (
      <View style={[styles.mainField, dim && styles.dim]}>
        <Text
          style={{
            color: theme.colors.muted,
            fontFamily: uiFace(theme.type.ui, '700'),
            fontSize: 12,
            letterSpacing: 0.6,
            textTransform: 'uppercase',
          }}
        >
          {t('memory.type.instead')}
        </Text>
        {input}
        {check}
      </View>
    );
  }
  return (
    <View style={[styles.sideField, dim && styles.dim, multiline && styles.sideFieldMulti]}>
      <View style={styles.grow}>{input}</View>
      {check}
    </View>
  );
}

const styles = StyleSheet.create({
  panel: { gap: 10, alignItems: 'stretch' },
  round: { borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  ring: { position: 'absolute', borderRadius: 999, borderWidth: 3 },
  ringRoom: { padding: 12 },
  ringRoomSmall: { padding: 8 },
  micStack: { alignItems: 'center', gap: 8, paddingVertical: 6 },
  micRow: { flexDirection: 'row', alignItems: 'center', gap: 14, paddingVertical: 4 },
  micText: { flex: 1, minWidth: 0, alignItems: 'flex-start', gap: 2 },
  hidden: { position: 'absolute', width: 1, height: 1, overflow: 'hidden', opacity: 0.01 },
  notice: { gap: 10, padding: 14 },
  noticeRow: { flexDirection: 'row', alignItems: 'flex-start', gap: 12 },
  noticeIcon: { width: 36, height: 36, borderRadius: 999, borderWidth: 2, alignItems: 'center', justifyContent: 'center' },
  noticeText: { flex: 1, minWidth: 0, gap: 4 },
  input: { minHeight: 48, paddingHorizontal: 14, fontSize: 16 },
  inputMulti: { minHeight: 100, paddingTop: 12, paddingBottom: 12, textAlignVertical: 'top', lineHeight: 22 },
  inputMain: { minHeight: 52 },
  mainField: { gap: 8, alignItems: 'stretch' },
  sideField: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  sideFieldMulti: { alignItems: 'flex-end' },
  grow: { flex: 1, minWidth: 0 },
  dim: { opacity: 0.5 },
});
