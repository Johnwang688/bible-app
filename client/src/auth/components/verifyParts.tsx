// The pieces "Confirm your email" shares between the sign-up sheet and the account card (email verification, 11-03,
// prototype design/proposed/r6b-verify.html): the Send again countdown, the one live status slot per surface, the
// send and check actions with their messages, and text with the account's address in bold that wraps anywhere.
import { useCallback, useEffect, useRef, useState, type ReactNode } from 'react';
import { Platform, StyleSheet, Text, View, type TextStyle } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/translate';
import { useTheme } from '../../theme/ThemeProvider';
import { emailLanguage } from '../AccountProvider';
import { AuthError, type AccountState } from '../types';
import { ErrorLine, Glyph } from './parts';

/** The status slot's message: quiet ones are polite status lines, the others alerts (red boxes). */
export type VerifyStatus = 'sent' | 'notYet' | 'tooMany' | 'offline' | 'error' | null;

const QUIET: Record<'sent' | 'notYet', MessageKey> = { sent: 'account.verify.resent', notYet: 'account.verify.notYet' };
const ALERT: Record<'tooMany' | 'offline' | 'error', MessageKey> = {
  tooMany: 'account.verify.tooMany',
  offline: 'account.verify.offline',
  error: 'auth.error.unknown',
};

function kindOf(e: unknown): AuthError['kind'] {
  if (e instanceof AuthError) return e.kind;
  const kind = typeof e === 'object' && e !== null ? (e as { kind?: unknown }).kind : undefined;
  return typeof kind === 'string' ? (kind as AuthError['kind']) : 'unknown';
}

/** The status a failed send or check shows. */
export function failureStatus(e: unknown): VerifyStatus {
  switch (kindOf(e)) {
    case 'too-many-requests':
      return 'tooMany';
    case 'network':
      return 'offline';
    default:
      return 'error';
  }
}

/** "0:48": minutes and seconds. */
export function formatWait(ms: number): string {
  const total = Math.max(0, Math.ceil(ms / 1000));
  const m = Math.floor(total / 60);
  const s = total % 60;
  return `${m}:${s < 10 ? '0' : ''}${s}`;
}

/** The time left before `until` (client ms), ticking every second, or null once it has passed. */
export function useCountdown(until: number | null, now: () => number = Date.now): string | null {
  const left = until === null ? 0 : until - now();
  const [, setTick] = useState(0);
  useEffect(() => {
    if (until === null || until - now() <= 0) return;
    const timer = setInterval(() => {
      setTick((n) => n + 1);
      if (until - now() <= 0) clearInterval(timer);
    }, 1000);
    return () => clearInterval(timer);
  }, [until, now]);
  return left > 0 ? formatWait(left) : null;
}

/**
 * Send again and I've confirmed for one surface (the sheet, or the card), with that surface's status. `send` returns
 * 'reauth' when a pending change of address needs the password again (the caller opens Change email).
 */
export function useVerifyActions(account: AccountState) {
  const { locale } = useI18n();
  const [status, setStatus] = useState<VerifyStatus>(null);
  const [checking, setChecking] = useState(false);
  const [sending, setSending] = useState(false);
  const alive = useRef(true);
  useEffect(() => {
    alive.current = true;
    return () => {
      alive.current = false;
    };
  }, []);

  const send = useCallback(async (): Promise<'ok' | 'failed' | 'reauth'> => {
    setSending(true);
    setStatus(null);
    try {
      await account.sendVerification(emailLanguage(locale));
      if (alive.current) setStatus('sent');
      return 'ok';
    } catch (e) {
      if (kindOf(e) === 'requires-recent-login') return 'reauth';
      if (alive.current) setStatus(failureStatus(e));
      return 'failed';
    } finally {
      if (alive.current) setSending(false);
    }
  }, [account, locale]);

  /** I've confirmed (`quiet`: an automatic check, which says nothing when it finds nothing). */
  const check = useCallback(
    async (quiet = false): Promise<boolean> => {
      if (!quiet) {
        setChecking(true);
        setStatus(null);
      }
      try {
        const ok = await account.checkVerified();
        if (!ok && !quiet && alive.current) setStatus('notYet');
        return ok;
      } catch (e) {
        if (!quiet && alive.current) setStatus(failureStatus(e));
        return false;
      } finally {
        if (!quiet && alive.current) setChecking(false);
      }
    },
    [account],
  );

  return { status, setStatus, checking, sending, send, check };
}

/** The surface's one live status slot: empty until a message arrives. */
export function StatusSlot({ status, testID, ink }: { status: VerifyStatus; testID: string; ink?: string }) {
  const theme = useTheme();
  const { t } = useI18n();
  if (status === 'tooMany' || status === 'offline' || status === 'error') return <ErrorLine testID={testID} text={t(ALERT[status])} boxed />;
  return (
    <View testID={`${testID}-slot`} accessibilityLiveRegion="polite">
      {status === 'sent' || status === 'notYet' ? <QuietLine testID={testID} text={t(QUIET[status])} ink={ink ?? theme.colors.muted} /> : null}
    </View>
  );
}

/** An info line with its glyph. Not announced by itself: inside StatusSlot it is (the slot is the live region). */
export function QuietLine({ text, ink, testID }: { text: string; ink: string; testID?: string }) {
  const theme = useTheme();
  return (
    <View testID={testID} style={styles.quiet}>
      <View style={styles.quietGlyph}>
        <Glyph name="info" size={15} color={ink} />
      </View>
      <Text style={{ flex: 1, minWidth: 0, color: ink, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 19 }}>{text}</Text>
    </View>
  );
}

/** Long addresses wrap anywhere instead of overflowing (web; native Text wraps long words by itself). */
const WRAP_ANYWHERE = (Platform.OS === 'web' ? { wordBreak: 'break-word', overflowWrap: 'anywhere' } : {}) as TextStyle;

/** `template` with `{email}` and `{old}` drawn bold (the account's own address), wrapping anywhere. */
export function WithAddresses({
  template,
  email,
  old,
  style,
  testID,
}: {
  template: string;
  email?: string;
  old?: string;
  style: TextStyle;
  testID?: string;
}): ReactNode {
  const theme = useTheme();
  const parts = template.split(/(\{email\}|\{old\})/);
  const bold = { fontFamily: uiFace(theme.type.ui, '700') };
  return (
    <Text testID={testID} style={[style, WRAP_ANYWHERE]}>
      {parts.map((part, i) =>
        part === '{email}' ? (
          <Text key={i} style={[bold, WRAP_ANYWHERE]}>
            {email ?? ''}
          </Text>
        ) : part === '{old}' ? (
          <Text key={i} style={[bold, WRAP_ANYWHERE]}>
            {old ?? ''}
          </Text>
        ) : (
          part
        ),
      )}
    </Text>
  );
}

const styles = StyleSheet.create({
  quiet: { flexDirection: 'row', alignItems: 'flex-start', gap: 6 },
  quietGlyph: { marginTop: 2 },
});
