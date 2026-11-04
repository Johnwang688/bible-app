// The "Send feedback" sheet on Me (design/proposed/feedback.html, approved by John 11-03 with every default).
// One text box, an optional topic, a line saying what goes with the message, and Send pinned in a footer so it stays
// above the keyboard. After sending: a thank-you. Offline, server and rate-limit errors keep the text. Built on the
// shared SheetModal, so Escape (web), the scrim and Android Back close it through the shared Escape stack.
import { useEffect, useLayoutEffect, useRef, useState, type ComponentRef } from 'react';
import {
  ActivityIndicator,
  Platform,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  View,
  type PressableStateCallbackType,
  type ViewStyle,
} from 'react-native';
import Svg, { Path } from 'react-native-svg';

import { getApiBaseUrl } from '../api/config';
import { useAccount } from '../auth';
import { fieldBorderColour, fieldBorderWidth } from '../auth/components/fieldStyle';
import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import type { MessageKey } from '../i18n/messages/en';
import { announce, programmaticFocus, useFocusOnMount } from '../reader/components/a11y';
import { Icon } from '../reader/components/icons';
import { SheetModal } from '../reader/components/SheetModal';
import { buttonStyle } from '../reader/components/ui';
import { dangerColours } from '../theme/danger';
import { useAppearance, useTheme } from '../theme/ThemeProvider';
import type { Theme } from '../theme/types';
import {
  canSendFeedback,
  createFeedbackApi,
  FEEDBACK_CATEGORIES,
  FEEDBACK_MAX_LENGTH,
  feedbackRemaining,
  showFeedbackCounter,
  type FeedbackApi,
  type FeedbackCategory,
  type FeedbackResult,
} from './api';
import { feedbackContext, feedbackDraft, feedbackPlatform } from './context';
import { accountIdToken } from './token';

type Failure = Exclude<FeedbackResult, { ok: true }>;

const WEB = Platform.OS === 'web';
const INPUT_MIN = 140;
const INPUT_MAX = 260;
const COUNTER_ID = 'feedback-counter-text';
const TOPIC_HINT_ID = 'feedback-topic-hint';
const THANKS_BODY_ID = 'feedback-thanks-body';

const GLYPHS = {
  info: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM12 11v5M12 7.5h.01',
  alert: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM12 8v5M12 16.5h.01',
  offline: 'M2 8.5a15 15 0 0 1 5-3M22 8.5a15 15 0 0 0-11-4M5 12a10 10 0 0 1 4-2.4M19 12a10 10 0 0 0-3.5-2.2M8.5 15.5a5 5 0 0 1 6.3-.5M12 19.5h.01M3 3l18 18',
  clock: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM12 7.5V12l3 2',
  check: 'M5 12.5l4.5 4.5L19 7.5',
} as const;

function Glyph({ name, color, size = 16, strokeWidth = 2.2 }: { name: keyof typeof GLYPHS; color: string; size?: number; strokeWidth?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={GLYPHS[name]} fill="none" stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}

/** Web-only attributes react-native-web passes through (native reads the accessibility props instead). */
const webProps = (props: Record<string, unknown>) => (WEB ? (props as object) : {});

/**
 * The preset's own focus ring (web): the browser default is amber, under 3:1 on the light sheets. `colour` defaults
 * to the theme's text colour (16:1 on Silver's sheet).
 */
function focusRing(theme: Theme, focused: boolean, colour: string = theme.colors.text): ViewStyle {
  if (!WEB) return {};
  return focused ? { outlineStyle: 'solid', outlineWidth: 2, outlineColor: colour, outlineOffset: 2 } : ({ outlineWidth: 0, outlineStyle: 'none' } as unknown as ViewStyle);
}

const isFocused = (state: PressableStateCallbackType) => (state as PressableStateCallbackType & { focused?: boolean }).focused === true;

/**
 * Announcements. On iOS and Android, AccessibilityInfo. On the web (where react-native-web's announce does nothing) a
 * polite live region that stays mounted in the sheet; a repeat of the same message alternates a trailing space so it
 * is read again.
 */
function useAnnouncer(): [(message: string) => void, string] {
  const [live, setLive] = useState('');
  const say = (message: string) => {
    if (!WEB) {
      announce(message);
      return;
    }
    setLive((prev) => (prev === message ? `${message} ` : message));
  };
  return [say, live];
}

export interface FeedbackSheetProps {
  onClose(): void;
  /** The request; the real backend by default. */
  api?: FeedbackApi;
}

export function FeedbackSheet({ onClose, api: apiProp }: FeedbackSheetProps) {
  const theme = useTheme();
  const { t, locale, formatNumber } = useI18n();
  const { presetId } = useAppearance();
  const account = useAccount();
  const signedIn = account.status === 'signedIn';
  const [say, live] = useAnnouncer();

  // The latest account, for a token asked for after a render (a send started while signed in, finishing later).
  const latestAccount = useRef(account);
  useLayoutEffect(() => {
    latestAccount.current = account;
  });

  const [text, setText] = useState(() => feedbackDraft.get().text);
  const [category, setCategory] = useState<FeedbackCategory | null>(() => feedbackDraft.get().category);
  const [phase, setPhase] = useState<'edit' | 'sending' | 'sent'>('edit');
  const [error, setError] = useState<{ failure: Failure; attempt: number } | null>(null);
  const [inputFocused, setInputFocused] = useState(false);
  const [inputHeight, setInputHeight] = useState(INPUT_MIN);
  const attempts = useRef(0);
  const mounted = useRef(true);
  useEffect(
    () => () => {
      mounted.current = false;
    },
    [],
  );

  const sending = phase === 'sending';
  const remaining = feedbackRemaining(text);
  const over = remaining < 0;
  const counterShown = showFeedbackCounter(text);
  const sendable = canSendFeedback(text) && !sending;
  const counterText = over
    ? t('feedback.counter.over', { n: formatNumber(-remaining), max: formatNumber(FEEDBACK_MAX_LENGTH) })
    : t('feedback.counter.left', { n: formatNumber(remaining) });

  // Announce the counter when it first appears and when it goes over the limit, not on every key.
  const counterState = over ? 'over' : counterShown ? 'near' : 'none';
  const lastCounterState = useRef(counterState);
  useEffect(() => {
    const was = lastCounterState.current;
    lastCounterState.current = counterState;
    if (counterState !== was && counterState !== 'none' && !(was === 'over' && counterState === 'near')) say(counterText);
    // `say` is stable in effect (it only sets state or calls announce).
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [counterState, counterText]);

  const change = (value: string) => {
    setText(value);
    feedbackDraft.set({ text: value, category });
  };
  const toggle = (value: FeedbackCategory) => {
    if (sending) return;
    const next = category === value ? null : value;
    setCategory(next);
    feedbackDraft.set({ text, category: next });
  };

  const send = async () => {
    if (!sendable) return;
    setPhase('sending');
    setError(null);
    say(t('feedback.sending'));
    const context = feedbackContext({ language: locale, preset: presetId });
    const message = text;
    const api = apiProp ?? defaultApi(() => accountIdToken(latestAccount.current));
    const result = await api.send({ message, category, context });
    if (result.ok) {
      feedbackDraft.clear();
      if (mounted.current) setPhase('sent');
      return;
    }
    if (!mounted.current) return; // the draft stays; reopening the sheet brings it back
    attempts.current += 1;
    setPhase('edit');
    // The error box is an alert (read on its own); native also hears it through the announcer.
    setError({ failure: result, attempt: attempts.current });
    if (!WEB) announce(errorText(t, result));
  };

  const attached = t(signedIn ? 'feedback.attached.signedIn' : 'feedback.attached.signedOut', {
    version: feedbackContext({ language: locale, preset: presetId }).appVersion,
    platform: t(`feedback.platform.${feedbackPlatform()}` as MessageKey),
    language: t(locale === 'zh-Hans' ? 'language.zh-Hans' : 'language.en'),
    look: t(`preset.${presetId}` as MessageKey),
  });

  const danger = dangerColours(theme);
  const ui = (w: '400' | '700') => uiFace(theme.type.ui, w);

  return (
    <SheetModal testID="feedback-sheet" onClose={onClose} avoidKeyboard>
      <Header theme={theme} title={t('feedback.title')} heading={phase !== 'sent'} closeLabel={t('common.close')} onClose={onClose} />
      {WEB ? (
        <Text testID="feedback-live" role="status" aria-live="polite" style={styles.visuallyHidden}>
          {live}
        </Text>
      ) : null}
      {phase === 'sent' ? (
        <>
          <Thanks theme={theme} title={t('feedback.thanks.title')} body={t('feedback.thanks.body')} />
          <View style={styles.footer}>
            <PrimaryButton testID="feedback-done" theme={theme} label={t('feedback.done')} onPress={onClose} />
          </View>
        </>
      ) : (
        <>
          <ScrollView style={styles.body} contentContainerStyle={styles.bodyContent} keyboardShouldPersistTaps="handled">
            <Text style={[styles.para, { color: theme.colors.muted, fontFamily: ui('400') }]}>{t('feedback.intro')}</Text>

            <View style={styles.group}>
              <Text style={[styles.label, { color: theme.colors.text, fontFamily: ui('700') }]}>{t('feedback.topic.label')}</Text>
              <View role="group" accessibilityLabel={t('feedback.topic.label')} style={styles.chips}>
                {FEEDBACK_CATEGORIES.map((value) => {
                  const on = category === value;
                  return (
                    <Pressable
                      key={value}
                      testID={`feedback-topic-${value}`}
                      accessibilityRole="button"
                      accessibilityState={{ selected: on, disabled: sending }}
                      accessibilityHint={on ? t('feedback.topic.hint') : undefined}
                      {...webProps({ 'aria-pressed': on, 'aria-describedby': on ? TOPIC_HINT_ID : undefined })}
                      onPress={() => toggle(value)}
                      style={(state) => [styles.chip, chipStyle(theme, on), focusRing(theme, isFocused(state))]}
                    >
                      {on ? <Glyph name="check" size={15} strokeWidth={2.6} color={chipInk(theme, true)} /> : null}
                      <Text style={{ color: chipInk(theme, on), fontFamily: ui('700'), fontSize: 15 }}>{t(`feedback.topic.${value}`)}</Text>
                    </Pressable>
                  );
                })}
              </View>
              {WEB ? (
                <Text nativeID={TOPIC_HINT_ID} style={styles.visuallyHidden}>
                  {t('feedback.topic.hint')}
                </Text>
              ) : null}
            </View>

            <View style={styles.group}>
              <Text style={[styles.label, { color: theme.colors.text, fontFamily: ui('700') }]}>{t('feedback.field.label')}</Text>
              <TextInput
                testID="feedback-input"
                value={text}
                onChangeText={change}
                multiline
                editable={!sending}
                placeholder={t('feedback.field.placeholder')}
                placeholderTextColor={theme.colors.muted}
                accessibilityLabel={t('feedback.field.label')}
                accessibilityHint={counterShown ? counterText : undefined}
                {...webProps({ 'aria-describedby': counterShown ? COUNTER_ID : undefined, 'aria-invalid': over })}
                onFocus={() => setInputFocused(true)}
                onBlur={() => setInputFocused(false)}
                onContentSizeChange={(e) => {
                  // Grows with the text (the web does not size a multiline field by itself), up to INPUT_MAX, then scrolls.
                  const next = Math.min(INPUT_MAX, Math.max(INPUT_MIN, Math.ceil(e.nativeEvent.contentSize.height) + 2));
                  setInputHeight((h) => (Math.abs(h - next) > 1 ? next : h));
                }}
                textAlignVertical="top"
                style={[
                  styles.input,
                  theme.backgrounds.surface,
                  {
                    height: inputHeight,
                    borderRadius: theme.style === 'pastel' ? 12 : 20,
                    borderWidth: fieldBorderWidth(theme),
                    borderColor: over ? danger.border : fieldBorderColour(theme),
                    color: theme.colors.text,
                    fontFamily: ui('400'),
                    opacity: sending ? 0.75 : 1,
                  },
                  // The ring takes the danger colour when over the limit, so the red edge is never hidden by focus.
                  focusRing(theme, inputFocused, over ? danger.border : theme.colors.text),
                ]}
              />
              {counterShown ? (
                <Text
                  testID="feedback-counter"
                  nativeID={COUNTER_ID}
                  style={[styles.counter, { color: over ? danger.text : theme.colors.muted, fontFamily: ui(over ? '700' : '400') }]}
                >
                  {counterText}
                </Text>
              ) : null}
            </View>

            <View testID="feedback-attached" style={styles.attached}>
              <View style={styles.attachedGlyph}>
                <Glyph name="info" size={15} color={theme.colors.muted} />
              </View>
              <Text style={[styles.small, { color: theme.colors.muted, fontFamily: ui('400') }]}>{attached}</Text>
            </View>
          </ScrollView>

          <View style={styles.footer}>
            {error ? <ErrorBox key={error.attempt} theme={theme} failure={error.failure} text={errorText(t, error.failure)} /> : null}
            <PrimaryButton
              testID="feedback-send"
              theme={theme}
              label={t(sending ? 'feedback.sending' : 'feedback.send')}
              busy={sending}
              off={!sendable}
              onPress={() => void send()}
            />
          </View>
        </>
      )}
    </SheetModal>
  );
}

/** The real backend; a build without a usable API origin answers "failed" (Try again) instead of throwing. */
function defaultApi(getIdToken: () => Promise<string | null>): FeedbackApi {
  let baseUrl: string;
  try {
    baseUrl = getApiBaseUrl();
  } catch {
    return { send: async () => ({ ok: false, reason: 'failed' }) };
  }
  return createFeedbackApi({ baseUrl, getIdToken });
}

function errorText(t: ReturnType<typeof useI18n>['t'], failure: Failure): string {
  switch (failure.reason) {
    case 'offline':
      return t('feedback.error.offline');
    case 'rate-limited':
      return t('feedback.error.rateLimited', { n: failure.retryAfterMinutes });
    case 'invalid':
      return t('feedback.error.invalid');
    default:
      return t('feedback.error.failed');
  }
}

function Header({
  theme,
  title,
  heading,
  closeLabel,
  onClose,
}: {
  theme: Theme;
  title: string;
  /** False on the thank-you, whose own heading takes over (one heading per view). */
  heading: boolean;
  closeLabel: string;
  onClose(): void;
}) {
  const titleRef = useFocusOnMount();
  return (
    <View style={styles.titleRow}>
      <Text
        ref={titleRef}
        accessibilityRole={heading ? 'header' : undefined}
        {...programmaticFocus}
        style={[styles.title, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}
      >
        {title}
      </Text>
      <Pressable
        testID="feedback-close"
        accessibilityRole="button"
        accessibilityLabel={closeLabel}
        onPress={onClose}
        style={(state) => [styles.round, buttonStyle(theme), { borderRadius: 999 }, focusRing(theme, isFocused(state))]}
      >
        <Icon name="close" size={18} color={theme.colors.btnText} />
      </Pressable>
    </View>
  );
}

function Thanks({ theme, title, body }: { theme: Theme; title: string; body: string }) {
  const headingRef = useFocusOnMount();
  return (
    <View testID="feedback-thanks" style={styles.thanks}>
      <View style={[styles.thanksMark, buttonStyle(theme), { borderRadius: 999 }]}>
        <Glyph name="check" size={30} strokeWidth={2.4} color={theme.colors.btnText} />
      </View>
      {/* Focus lands here. The web reads the body as the heading's description; native folds it into the label. */}
      <Text
        ref={headingRef}
        accessibilityRole="header"
        accessibilityLabel={WEB ? undefined : `${title}. ${body}`}
        {...webProps({ 'aria-describedby': THANKS_BODY_ID })}
        {...programmaticFocus}
        style={[styles.thanksTitle, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}
      >
        {title}
      </Text>
      <Text
        nativeID={THANKS_BODY_ID}
        accessibilityElementsHidden={!WEB}
        importantForAccessibility={WEB ? 'auto' : 'no-hide-descendants'}
        style={[styles.thanksBody, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }]}
      >
        {body}
      </Text>
    </View>
  );
}

function ErrorBox({ theme, failure, text }: { theme: Theme; failure: Failure; text: string }) {
  const danger = dangerColours(theme);
  const glyph = failure.reason === 'offline' ? 'offline' : failure.reason === 'rate-limited' ? 'clock' : 'alert';
  return (
    <View
      testID="feedback-error"
      accessibilityRole="alert"
      accessibilityLiveRegion="assertive"
      style={[
        styles.errorBox,
        theme.backgrounds.surface,
        { borderColor: danger.border, borderWidth: theme.style === 'pastel' ? 2.5 : 1.5, borderRadius: theme.style === 'pastel' ? 12 : 18 },
      ]}
    >
      <View style={styles.errorGlyph}>
        <Glyph name={glyph} size={18} color={danger.text} />
      </View>
      <Text style={{ flex: 1, color: danger.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14, lineHeight: 20 }}>{text}</Text>
    </View>
  );
}

/**
 * The sheet's main button. Off and busy are announced but the button stays in the focus order and keeps focus while
 * it sends, so a keyboard or screen-reader user does not lose their place: on the web it is never `disabled` (that
 * would blur it and drop it from Tab); `aria-disabled` is set on the element and presses are ignored. On iOS and
 * Android a disabled button is still read, so there it is plainly disabled.
 */
function PrimaryButton({
  testID,
  theme,
  label,
  onPress,
  busy = false,
  off = false,
}: {
  testID: string;
  theme: Theme;
  label: string;
  onPress(): void;
  busy?: boolean;
  off?: boolean;
}) {
  const border = theme.borders.button;
  const inactive = off || busy;
  const ref = useRef<ComponentRef<typeof View>>(null);
  // react-native-web writes aria-disabled from `disabled`, so the web's value is set on the element after each render.
  useLayoutEffect(() => {
    if (!WEB) return;
    const node = ref.current as unknown as { setAttribute?(name: string, value: string): void; removeAttribute?(name: string): void } | null;
    if (inactive) node?.setAttribute?.('aria-disabled', 'true');
    else node?.removeAttribute?.('aria-disabled');
  });
  return (
    <Pressable
      ref={ref}
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={label}
      aria-busy={busy}
      disabled={WEB ? false : inactive}
      accessibilityState={WEB ? undefined : { disabled: inactive, busy }}
      onPress={() => {
        if (!inactive) onPress();
      }}
      style={(state) => [
        styles.primary,
        {
          backgroundColor: theme.colors.cta,
          borderRadius: theme.radii.button,
          borderWidth: border?.width ?? 0,
          borderColor: border?.color,
          boxShadow: theme.shadows.cta,
          opacity: busy ? 0.8 : off ? 0.45 : 1,
        },
        WEB && inactive ? styles.inactiveCursor : null,
        focusRing(theme, isFocused(state)),
      ]}
    >
      {busy ? <ActivityIndicator size="small" color={theme.colors.onCta} /> : null}
      <Text style={{ color: theme.colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{label}</Text>
    </Pressable>
  );
}

function chipInk(theme: Theme, on: boolean): string {
  if (!on) return theme.colors.btnText;
  return theme.style === 'pastel' ? theme.colors.onCta : theme.colors.onAccent;
}

function chipStyle(theme: Theme, on: boolean): ViewStyle {
  const pastel = theme.style === 'pastel';
  if (on) {
    return {
      backgroundColor: pastel ? theme.colors.cta : theme.colors.accent,
      borderWidth: pastel ? (theme.borders.button?.width ?? 0) : 1,
      borderColor: pastel ? theme.borders.button?.color : theme.colors.accent,
    };
  }
  return {
    ...buttonStyle(theme),
    borderWidth: fieldBorderWidth(theme),
    borderColor: fieldBorderColour(theme),
  };
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 10, minHeight: 44 },
  title: { flex: 1, fontSize: 21, lineHeight: 26 },
  round: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  body: { flexGrow: 0, flexShrink: 1, minHeight: 0 },
  bodyContent: { gap: 14, paddingBottom: 4, paddingHorizontal: 3, paddingTop: 3 },
  para: { fontSize: 14, lineHeight: 21 },
  group: { gap: 8 },
  label: { fontSize: 13 },
  chips: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  chip: { minHeight: 44, minWidth: 64, paddingHorizontal: 16, borderRadius: 999, flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 6 },
  input: { paddingHorizontal: 14, paddingVertical: 12, fontSize: 16, lineHeight: 23 },
  counter: { alignSelf: 'stretch', textAlign: 'left', fontSize: 13, lineHeight: 18, fontVariant: ['tabular-nums'] },
  attached: { flexDirection: 'row', alignItems: 'flex-start', gap: 6 },
  attachedGlyph: { marginTop: 2 },
  small: { flex: 1, fontSize: 13, lineHeight: 19 },
  footer: { gap: 10, paddingTop: 2 },
  errorBox: { flexDirection: 'row', alignItems: 'flex-start', gap: 10, paddingHorizontal: 14, paddingVertical: 12 },
  errorGlyph: { marginTop: 1 },
  primary: { minHeight: 48, paddingHorizontal: 14, paddingVertical: 6, flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 8, width: '100%' },
  inactiveCursor: { cursor: 'auto' },
  thanks: { alignItems: 'center', gap: 12, paddingTop: 18, paddingBottom: 6, paddingHorizontal: 4 },
  thanksMark: { width: 64, height: 64, alignItems: 'center', justifyContent: 'center' },
  thanksTitle: { fontSize: 19, lineHeight: 25, textAlign: 'center' },
  thanksBody: { fontSize: 15, lineHeight: 22, textAlign: 'center', maxWidth: 420 },
  visuallyHidden: { position: 'absolute', width: 1, height: 1, overflow: 'hidden', opacity: 0 },
});
