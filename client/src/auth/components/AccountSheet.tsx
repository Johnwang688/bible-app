// The account sheet (R-6b): sign in, create an account, reset the password, and delete the account with its
// synced data, in one bottom sheet. `offerDelete` is the Under 13 offer's delete (FOLLOW-UP item 2): the same
// delete idiom for the account that was signed out when Under 13 was picked, run while signed out. The sheet keeps only form state; who is signed in, and the actions, come
// from `useAccount()`.
//
// Concurrency: a request can finish after the sheet was closed, or after the person went to another view.
// Each request takes a number from `seq`; going to another view takes the next number (refused while a delete
// runs: neither closing nor leaving the view can stop it, so the sheet stays on it until its result), and unmounting makes
// the sheet not alive. A result that is stale or arrives after unmount changes nothing here (no state update,
// no `onClose`, so a newer sheet is never closed by an older request). A sign-in that completes after Close
// still signs in: the card shows it. A delete that completes after Close still reports through `onDeleted`
// (the card's banner), since the account is gone either way.
//
// Email verification (11-03, prototype r6b-verify.html): a sign-up whose email must be confirmed does not close the
// sheet; it turns into "Confirm your email" (no Back: the account exists), with I've confirmed, Send again (its 60 s
// countdown) and "Wrong email? Change it". While that view is open the app checks by itself every 10 s for up to
// 10 minutes; once the email is confirmed the sheet closes (the card says so). `changeEmail` (from the card, or from
// the confirm view) asks for the new address and the password, then shows "Link sent".
import { router } from 'expo-router';
import { useCallback, useEffect, useRef, useState, type ComponentRef } from 'react';
import { Keyboard, Platform, ScrollView, StyleSheet, Text, TextInput, useWindowDimensions, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { uiFace } from '../../fonts/fonts';
import { useI18n, useT } from '../../i18n/I18nProvider';
import { programmaticFocus, useFocusOnMount } from '../../reader/components/a11y';
import { SheetModal } from '../../reader/components/SheetModal';
import { useTheme } from '../../theme/ThemeProvider';
import { emailLanguage, useAccount } from '../AccountProvider';
import { authError, deleteError, isEmailShaped, MIN_PASSWORD_LENGTH, type ShownError } from './authErrors';
import { ActionButton, AuthField, ErrorLine, Glyph, Para, RoundButton, TextButton } from './parts';
import { failureStatus, QuietLine, StatusSlot, useCountdown, useVerifyActions, WithAddresses } from './verifyParts';
import type { MessageKey } from '../../i18n/translate';

export type AccountSheetStart = 'signIn' | 'delete' | 'offerDelete' | 'changeEmail';
type SheetView = 'signIn' | 'signUp' | 'reset' | 'delete' | 'offerDelete' | 'confirm' | 'changeEmail' | 'changeSent';

/** "Confirm your email" checks by itself this often while it is open... */
export const AUTO_CHECK_MS = 10_000;
/** ...for at most this long (decision 4). */
export const AUTO_CHECK_FOR_MS = 10 * 60_000;

/** The room the sheet's own chrome takes (grabber, gaps, header row, bottom padding), for the keyboard cap. */
const CHROME = 8 + 5 + 12 * 3 + 44 + 24;
const SHEET_TOP_GAP = 10;

/** The on-screen keyboard's height on iOS (the sheet is lifted by KeyboardAvoidingView, so its body must shrink). */
function useKeyboardHeight(): number {
  const [height, setHeight] = useState(0);
  useEffect(() => {
    if (Platform.OS !== 'ios') return;
    const show = Keyboard.addListener('keyboardWillShow', (e) => setHeight(e.endCoordinates.height));
    const hide = Keyboard.addListener('keyboardWillHide', () => setHeight(0));
    return () => {
      show.remove();
      hide.remove();
    };
  }, []);
  return height;
}

function SheetTitle({ text }: { text: string }) {
  const theme = useTheme();
  const ref = useFocusOnMount();
  return (
    <Text
      ref={ref}
      accessibilityRole="header"
      {...programmaticFocus}
      style={[styles.title, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}
    >
      {text}
    </Text>
  );
}

export function AccountSheet({
  start,
  onClose,
  onDeleted,
}: {
  start: AccountSheetStart;
  /** Closes the sheet (Close, Escape, back, the scrim, and after a successful sign-in or delete). */
  onClose(): void;
  /** The account and its synced data were deleted. Called even if the sheet was closed while it ran. */
  onDeleted(): void;
}) {
  const t = useT();
  const theme = useTheme();
  const account = useAccount();
  const { locale } = useI18n();
  const insets = useSafeAreaInsets();
  const { width: windowWidth, height: windowHeight } = useWindowDimensions();
  const keyboard = useKeyboardHeight();

  const [view, setView] = useState<SheetView>(start);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [deletePassword, setDeletePassword] = useState('');
  const [error, setError] = useState<ShownError | null>(null);
  const [deleteMessage, setDeleteMessage] = useState<MessageKey | null>(null);
  const [sent, setSent] = useState(false);
  const [busy, setBusy] = useState(false);
  /** Where "back" goes from the reset view. */
  const [resetFrom, setResetFrom] = useState<'signIn' | 'delete'>('signIn');
  /** Change email: the new address typed, and where the link went. */
  const [newEmail, setNewEmail] = useState('');
  const [sentTo, setSentTo] = useState('');
  const verifyActions = useVerifyActions(account);
  const wait = useCountdown(account.verify?.resendAt ?? null);
  const setVerifyStatus = verifyActions.setStatus; // a state setter: stable
  const passwordInput = useRef<ComponentRef<typeof TextInput>>(null);

  const alive = useRef(false);
  const seq = useRef(0);
  useEffect(() => {
    alive.current = true;
    return () => {
      alive.current = false;
    };
  }, []);

  const accountEmail = account.user?.email ?? '';
  /** A delete is running: closing cannot stop it, so nothing may close the sheet until its result is shown. */
  const deleting = busy && (view === 'delete' || view === 'offerDelete');

  /**
   * The request that owns the current view's form (its seq), or 0. Set synchronously: a second submit in the same
   * turn (two Return presses before React commits `busy`) sees it, where the `busy` state it closed over is stale.
   * Without it the second submit took the seq over, so its own rejection ("already in progress") reset `busy` and
   * Close/Cancel unlocked while the first request (a delete) still ran.
   */
  const owner = useRef(0);
  /** The view as of the last `go` (synchronous, unlike `view`, which a same-turn handler may see stale). */
  const viewNow = useRef<SheetView>(start);

  /**
   * Whether a delete view's request is running, read synchronously: true from the submit's own turn, before React
   * commits `busy`. `owner` equals `seq` only while the current view's request runs (leaving the view takes a new
   * seq), and `go` refuses to leave a delete view while this is true, so nothing in the same turn can unlock it.
   */
  const deleteRunning = useCallback(
    () => owner.current !== 0 && owner.current === seq.current && (viewNow.current === 'delete' || viewNow.current === 'offerDelete'),
    [],
  );

  /**
   * Every close path of the sheet (Close, Cancel, the scrim, Escape and Android Back through `onRequestClose`). Reads
   * the same synchronous lock the submits take, not only `deleting`: Back arriving in the turn of a Return that
   * submitted a delete comes before React commits `busy`, and must not close the sheet while the delete runs
   * (U13-R2-2).
   */
  const closeUnlessDeleting = useCallback(() => {
    if (deleting || deleteRunning()) return;
    onClose();
  }, [deleting, deleteRunning, onClose]);

  /**
   * Starts a request, or returns null when one is already running for this view (leaving the view with `go`
   * abandons it, as before). `current()` says whether its result still matters; `finish()` ends it.
   */
  const begin = useCallback(() => {
    if (owner.current !== 0 && owner.current === seq.current) return null;
    const mine = ++seq.current;
    owner.current = mine;
    setBusy(true);
    setError(null);
    setDeleteMessage(null);
    const current = () => alive.current && seq.current === mine;
    const finish = () => {
      if (owner.current === mine) owner.current = 0;
      if (current()) setBusy(false);
    };
    return { current, finish };
  }, []);

  /**
   * Goes to another view (abandoning its request). Refused (does nothing) while a delete view's request runs:
   * "Forgot password?" pressed in the turn of a Return that submitted the delete (before `busy` disables it) would
   * otherwise take a new seq, so the close paths' lock would no longer hold and Close/Back would work while DELETE
   * runs. Callers that do more than `go` (toReset) check `deleteRunning()` first themselves.
   */
  const go = useCallback((next: SheetView): void => {
    if (deleteRunning()) return;
    seq.current++;
    viewNow.current = next;
    setView(next);
    setError(null);
    setDeleteMessage(null);
    setBusy(false);
    setPassword('');
    setDeletePassword('');
    setShowPassword(false);
    setSent(false);
    setVerifyStatus(null);
  }, [deleteRunning, setVerifyStatus]);

  // Signed in (by a sign-in whose view was left meanwhile), or signed out while deleting: nothing left to do here.
  // (Decided by how the sheet was opened, not by the view: the delete sheet can pass through the reset view.)
  // The offer's delete runs signed out; it has nothing left to do once the offer is gone (not while it runs: the
  // offer goes just before a successful delete resolves, and that result closes the sheet itself).
  const offerGone = account.under13Offer === null;
  // "Confirm your email" (and Change email reached from it) stays open while signed in; a sign-up still running
  // (its send is in flight after the account exists) decides for itself where it goes.
  const verifyView = view === 'confirm' || view === 'changeEmail' || view === 'changeSent';
  const signingUp = view === 'signUp' && busy;
  const confirmed = account.status === 'signedIn' && account.verify === null;
  useEffect(() => {
    if (account.status === 'signedIn' && start === 'signIn' && !verifyView && !signingUp) onClose();
    else if (account.status === 'signedOut' && (start === 'delete' || start === 'changeEmail' || verifyView)) onClose();
    else if (offerGone && start === 'offerDelete' && !busy) onClose();
    // Confirmed while "Confirm your email" is open: nothing left to do here (the card says so).
    else if (view === 'confirm' && confirmed) onClose();
  }, [account.status, start, onClose, offerGone, busy, verifyView, signingUp, view, confirmed]);

  // The automatic check while "Confirm your email" is open: every 10 s, for up to 10 minutes (decision 4).
  const { check } = verifyActions;
  useEffect(() => {
    if (view !== 'confirm') return;
    const started = Date.now();
    const timer = setInterval(() => {
      if (Date.now() - started > AUTO_CHECK_FOR_MS) {
        clearInterval(timer);
        return;
      }
      void check(true);
    }, AUTO_CHECK_MS);
    return () => clearInterval(timer);
  }, [view, check]);

  // ---- actions --------------------------------------------------------------------------------------

  const checkEmail = (trimmed: string): boolean => {
    if (isEmailShaped(trimmed)) return true;
    setError({ key: 'auth.error.invalidEmail', place: 'email' });
    return false;
  };

  const submitSignIn = async () => {
    if (busy) return;
    const trimmed = email.trim();
    if (!checkEmail(trimmed)) return;
    if (password.length === 0) return setError({ key: 'auth.error.wrongCredentials', place: 'form' });
    const request = begin();
    if (!request) return;
    const { current } = request;
    try {
      await account.signIn({ kind: 'password', email: trimmed, password });
      if (current()) onClose();
    } catch (e) {
      if (current()) setError(authError(e));
    } finally {
      request.finish();
    }
  };

  const submitSignUp = async () => {
    if (busy) return;
    const trimmed = email.trim();
    if (!checkEmail(trimmed)) return;
    if (password.length < MIN_PASSWORD_LENGTH) return setError({ key: 'auth.signUp.tooShort', place: 'password' });
    const request = begin();
    if (!request) return;
    const { current } = request;
    try {
      const result = await account.signUp(trimmed, password, emailLanguage(locale));
      if (!current()) return;
      if (!result.confirm) return onClose();
      // The account exists: the sheet becomes "Confirm your email" (decision 2); a failed send shows there.
      go('confirm');
      verifyActions.setStatus(result.sendError ? failureStatus(result.sendError) : null);
    } catch (e) {
      if (current()) setError(authError(e));
    } finally {
      request.finish();
    }
  };

  const submitChangeEmail = async () => {
    if (busy) return;
    const trimmed = newEmail.trim();
    if (!checkEmail(trimmed)) return;
    if (trimmed.toLowerCase() === accountEmail.trim().toLowerCase()) return setError({ key: 'account.changeEmail.same', place: 'email' });
    if (password.length === 0) return setError({ key: 'auth.error.wrongCredentials', place: 'password' });
    const request = begin();
    if (!request) return;
    const { current } = request;
    try {
      await account.changeEmail(trimmed, password, emailLanguage(locale));
      if (!current()) return;
      go('changeSent');
      setSentTo(trimmed);
    } catch (e) {
      if (!current()) return;
      const shown = authError(e);
      // A wrong password belongs under the password field here (the email is the new one, not the account's).
      setError(shown.key === 'auth.error.wrongCredentials' ? { key: 'delete.wrongPassword', place: 'password' } : shown);
    } finally {
      request.finish();
    }
  };

  const resend = async () => {
    const outcome = await verifyActions.send();
    // A pending change of address needs the password again: Change email asks for it.
    if (outcome === 'reauth') {
      go('changeEmail');
      setNewEmail(account.verify?.pendingEmail ?? '');
    }
  };

  const submitReset = async () => {
    if (busy) return;
    const trimmed = email.trim();
    if (!checkEmail(trimmed)) return;
    const request = begin();
    if (!request) return;
    const { current } = request;
    try {
      await account.sendPasswordReset(trimmed);
      if (current()) setSent(true);
    } catch (e) {
      if (current()) setError(authError(e));
    } finally {
      request.finish();
    }
  };

  const submitDelete = async () => {
    if (busy || deletePassword.length === 0) return;
    const request = begin();
    if (!request) return;
    const { current } = request;
    try {
      await account.deleteAccount(deletePassword);
      onDeleted();
      if (current()) onClose();
    } catch (e) {
      if (current()) setDeleteMessage(deleteError(e));
    } finally {
      request.finish();
    }
  };

  const submitOfferDelete = async () => {
    if (busy || deletePassword.length === 0) return;
    const request = begin();
    if (!request) return;
    const { current } = request;
    try {
      await account.deleteOfferedAccount(deletePassword);
      onDeleted();
      if (current()) onClose();
    } catch (e) {
      // Sync is already off here (signed out), so the network message does not mention it.
      const key = deleteError(e);
      if (current()) setDeleteMessage(key === 'delete.error.network' ? 'account.under13Offer.network' : key);
    } finally {
      request.finish();
    }
  };

  const openPrivacy = () => {
    onClose();
    try {
      router.push('/privacy');
    } catch {
      // The page may not exist yet; closing the sheet is all that can be done.
    }
  };

  const toReset = (from: 'signIn' | 'delete') => {
    const carried = from === 'delete' ? accountEmail : email;
    if (deleteRunning()) return; // a delete is running (see `go`)
    setResetFrom(from);
    go('reset');
    setEmail(carried);
  };

  const back = () => {
    if (view === 'reset') go(resetFrom);
    else go('signIn');
  };

  // ---- pieces ---------------------------------------------------------------------------------------

  const message = (place: ShownError['place']) =>
    error && error.place === place ? <ErrorLine testID="auth-error" text={t(error.key)} boxed={place === 'form'} /> : undefined;

  const emailField = (autoComplete: 'username' | 'email', contentType: 'username' | 'emailAddress', next: 'next' | 'send', onSubmit?: () => void) => (
    <AuthField
      testID="auth-email"
      label={t('auth.email')}
      value={email}
      onChangeText={setEmail}
      autoComplete={autoComplete}
      textContentType={contentType}
      keyboardType="email-address"
      disabled={busy}
      invalid={error?.place === 'email' || error?.key === 'auth.error.emailInUse'}
      returnKeyType={next}
      keepKeyboard={next === 'next'}
      onSubmitEditing={onSubmit}
      focusNext={next === 'next' ? passwordInput : undefined}
      below={message('email')}
    />
  );

  const passwordToggle = (
    <RoundButton
      testID="auth-password-toggle"
      label={showPassword ? t('auth.hidePassword') : t('auth.showPassword')}
      glyph={showPassword ? 'eyeOff' : 'eye'}
      surface={false}
      colour={theme.colors.muted}
      disabled={busy}
      onPress={() => setShowPassword((s) => !s)}
    />
  );

  const passwordField = (mode: 'current' | 'new', onSubmit: () => void) => (
    <AuthField
      testID="auth-password"
      label={t('auth.password')}
      value={password}
      onChangeText={setPassword}
      autoComplete={mode === 'current' ? 'current-password' : 'new-password'}
      textContentType={mode === 'current' ? 'password' : 'newPassword'}
      secureTextEntry={!showPassword}
      disabled={busy}
      invalid={error?.place === 'password'}
      returnKeyType="go"
      onSubmitEditing={onSubmit}
      inputRef={passwordInput}
      trailing={passwordToggle}
      below={message('password') ?? (mode === 'new' ? <Para text={t('auth.signUp.hint')} size={13} /> : undefined)}
    />
  );

  const signInEmail = emailField('username', 'username', 'next');
  const signUpEmail = emailField('email', 'emailAddress', 'next');
  const resetEmail = emailField('email', 'emailAddress', 'send', () => void submitReset());
  const signInPassword = passwordField('current', () => void submitSignIn());
  const signUpPassword = passwordField('new', () => void submitSignUp());
  const formMessage = message('form');
  // In the sent state no field is shown, so a failed resend shows its error here whatever its place.
  const sentMessage = error ? <ErrorLine testID="auth-error" text={t(error.key)} boxed /> : undefined;

  const title =
    view === 'signIn'
      ? t('auth.signIn.title')
      : view === 'signUp'
        ? t('auth.signUp.title')
        : view === 'reset'
          ? t('auth.reset.title')
          : view === 'confirm'
            ? t('account.verify.title')
            : view === 'changeEmail' || view === 'changeSent'
              ? t('account.changeEmail.title')
              : t('delete.title');

  const header = (
    <View style={styles.titleRow}>
      {view === 'signUp' || view === 'reset' ? (
        <RoundButton testID="auth-back" label={t('auth.back')} glyph="back" onPress={back} />
      ) : null}
      <SheetTitle key={view} text={title} />
      <RoundButton testID="auth-close" label={t('auth.close')} glyph="close" disabled={deleting} onPress={closeUnlessDeleting} />
    </View>
  );

  // On iOS the sheet is lifted above the keyboard, so the body must fit what is left above it.
  const maxBody = keyboard > 0 ? Math.max(120, windowHeight - keyboard - insets.top - SHEET_TOP_GAP - CHROME) : undefined;

  return (
    <SheetModal testID="account-sheet" avoidKeyboard onClose={closeUnlessDeleting}>
      <View style={[styles.frame, windowWidth >= 1024 && { maxHeight: windowHeight - 48 - 16 - (Math.max(insets.bottom, 12) + 12) }]}>
        {header}
        <ScrollView
          style={[styles.body, maxBody !== undefined && { maxHeight: maxBody }]}
          contentContainerStyle={styles.bodyContent}
          keyboardShouldPersistTaps="handled"
          automaticallyAdjustKeyboardInsets
        >
          {view === 'signIn' ? (
            <>
              <Para text={t('auth.signIn.intro')} />
              <Para text={t('auth.signIn.mergeNote')} size={13} />
              {/* Room for Continue with Apple / Google later: nothing is drawn. */}
              <View accessible={false} style={styles.socialSlot} />
              {signInEmail}
              {signInPassword}
              {formMessage}
              <ActionButton testID="auth-submit" label={busy ? t('auth.signIn.busy') : t('auth.signIn.submit')} busy={busy} onPress={() => void submitSignIn()} />
              <TextButton testID="auth-forgot" label={t('auth.forgot')} disabled={busy} onPress={() => toReset('signIn')} />
              <View style={styles.newHere}>
                <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>{t('auth.signIn.new')}</Text>
                <TextButton testID="auth-to-signup" label={t('auth.signIn.create')} disabled={busy} onPress={() => go('signUp')} />
              </View>
            </>
          ) : null}

          {view === 'signUp' ? (
            <>
              {signUpEmail}
              {signUpPassword}
              {formMessage}
              <ActionButton testID="auth-submit" label={busy ? t('auth.signUp.busy') : t('auth.signUp.submit')} busy={busy} onPress={() => void submitSignUp()} />
              <Para text={t('auth.signUp.note')} size={13} center />
              <TextButton testID="auth-privacy" role="link" label={t('auth.privacy')} onPress={openPrivacy} />
            </>
          ) : null}

          {view === 'reset' && !sent ? (
            <>
              <Para text={t('auth.reset.intro')} />
              {resetEmail}
              {formMessage}
              <ActionButton testID="auth-submit" label={busy ? t('auth.reset.busy') : t('auth.reset.submit')} busy={busy} onPress={() => void submitReset()} />
            </>
          ) : null}

          {view === 'reset' && sent ? (
            <>
              <View testID="auth-reset-sent" style={styles.sent}>
                <View style={[styles.mailCircle, theme.backgrounds.button, { borderColor: theme.borders.button?.color, borderWidth: theme.borders.button?.width ?? 0 }]}>
                  <Glyph name="mail" size={30} strokeWidth={1.8} color={theme.colors.btnText} />
                </View>
                <Text
                  accessibilityRole="alert"
                  accessibilityLiveRegion="polite"
                  style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 16, lineHeight: 23, textAlign: 'center' }}
                >
                  {t('auth.reset.sent')}
                </Text>
              </View>
              {sentMessage}
              <ActionButton testID="auth-reset-back" label={resetFrom === 'delete' ? t('auth.back') : t('auth.reset.back')} onPress={back} />
              <TextButton testID="auth-resend" label={t('auth.reset.resend')} disabled={busy} onPress={() => void submitReset()} />
            </>
          ) : null}

          {view === 'confirm' ? (
            <>
              <View testID="verify-sheet" style={styles.sent}>
                <View style={[styles.mailCircle, theme.backgrounds.button, { borderColor: theme.borders.button?.color, borderWidth: theme.borders.button?.width ?? 0 }]}>
                  <Glyph name="mail" size={30} strokeWidth={1.8} color={theme.colors.btnText} />
                </View>
                <WithAddresses
                  testID="verify-sent-to"
                  template={t('account.verify.sent')}
                  email={accountEmail}
                  style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 16, lineHeight: 23, textAlign: 'center' }}
                />
              </View>
              <Para text={t('account.verify.syncAfter')} center />
              <QuietLine text={t('account.verify.spam')} ink={theme.colors.muted} />
              <StatusSlot testID="verify-status" status={verifyActions.status} />
              <ActionButton
                testID="verify-done"
                label={verifyActions.checking ? t('account.verify.checking') : t('account.verify.done')}
                busy={verifyActions.checking}
                onPress={() => void verifyActions.check()}
              />
              <View style={styles.newHere}>
                <TextButton
                  testID="verify-resend"
                  label={wait ? t('account.verify.resendIn', { t: wait }) : t('account.verify.resend')}
                  waiting={wait !== null}
                  disabled={verifyActions.sending}
                  onPress={() => void resend()}
                />
                <TextButton
                  testID="verify-change"
                  label={t('account.verify.changeInSheet')}
                  onPress={() => {
                    go('changeEmail');
                    setNewEmail('');
                  }}
                />
              </View>
            </>
          ) : null}

          {view === 'changeEmail' ? (
            <>
              <Para text={t('account.changeEmail.intro')} />
              <AuthField
                testID="change-email"
                label={t('account.changeEmail.newEmail')}
                value={newEmail}
                onChangeText={setNewEmail}
                autoComplete="email"
                textContentType="emailAddress"
                keyboardType="email-address"
                disabled={busy}
                invalid={error?.place === 'email' || error?.key === 'auth.error.emailInUse'}
                returnKeyType="next"
                keepKeyboard
                focusNext={passwordInput}
                below={message('email')}
              />
              <AuthField
                testID="change-password"
                label={t('account.changeEmail.password')}
                value={password}
                onChangeText={setPassword}
                autoComplete="current-password"
                textContentType="password"
                secureTextEntry={!showPassword}
                disabled={busy}
                invalid={error?.place === 'password'}
                returnKeyType="go"
                onSubmitEditing={() => void submitChangeEmail()}
                inputRef={passwordInput}
                trailing={passwordToggle}
                below={message('password')}
              />
              {formMessage}
              <ActionButton
                testID="change-submit"
                label={busy ? t('account.changeEmail.busy') : t('account.changeEmail.send')}
                busy={busy}
                onPress={() => void submitChangeEmail()}
              />
            </>
          ) : null}

          {view === 'changeSent' ? (
            <>
              <View testID="change-sent" style={styles.sent}>
                <View style={[styles.mailCircle, theme.backgrounds.button, { borderColor: theme.borders.button?.color, borderWidth: theme.borders.button?.width ?? 0 }]}>
                  <Glyph name="mail" size={30} strokeWidth={1.8} color={theme.colors.btnText} />
                </View>
                <View accessibilityLiveRegion="polite">
                  <WithAddresses
                    template={t('account.changeEmail.sent')}
                    email={sentTo}
                    style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 16, lineHeight: 23, textAlign: 'center' }}
                  />
                </View>
              </View>
              <WithAddresses
                template={t('account.changeEmail.keeps')}
                old={accountEmail}
                style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 20, textAlign: 'center' }}
              />
              <ActionButton testID="change-done" label={t('account.changeEmail.done')} onPress={onClose} />
            </>
          ) : null}

          {view === 'offerDelete' ? (
            <>
              <Para text={t('delete.body')} tone="text" />
              <Para text={t('delete.keeps')} />
              <View style={styles.offerEmail}>
                <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13 }}>{t('auth.email')}</Text>
                <Text testID="offer-email" numberOfLines={1} ellipsizeMode="middle" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 16 }}>
                  {account.under13Offer?.email ?? ''}
                </Text>
              </View>
              <AuthField
                testID="delete-password"
                label={t('delete.passwordLabel')}
                value={deletePassword}
                onChangeText={setDeletePassword}
                autoComplete="current-password"
                textContentType="password"
                secureTextEntry
                disabled={busy}
                invalid={deleteMessage !== null}
                returnKeyType="go"
                onSubmitEditing={() => void submitOfferDelete()}
                below={deleteMessage ? <ErrorLine testID="delete-error" text={t(deleteMessage)} /> : undefined}
              />
              {/* No "Forgot password?" here: password reset is off behind the sign-in gate (sendPasswordReset
                  rejects 'not-allowed' while Under 13 is picked), so the link could only fail. */}
              <ActionButton
                testID="delete-confirm"
                variant="danger"
                label={busy ? t('delete.busy') : t('delete.confirm')}
                busy={busy}
                disabled={deletePassword.length === 0}
                onPress={() => void submitOfferDelete()}
              />
              <ActionButton testID="delete-cancel" variant="secondary" label={t('delete.cancel')} disabled={deleting} onPress={closeUnlessDeleting} />
            </>
          ) : null}

          {view === 'delete' ? (
            <>
              <Para text={t('delete.body')} tone="text" />
              <Para text={t('delete.keeps')} />
              <AuthField
                testID="delete-password"
                label={t('delete.passwordLabel')}
                value={deletePassword}
                onChangeText={setDeletePassword}
                autoComplete="current-password"
                textContentType="password"
                secureTextEntry
                disabled={busy}
                invalid={deleteMessage !== null}
                returnKeyType="go"
                onSubmitEditing={() => void submitDelete()}
                below={deleteMessage ? <ErrorLine testID="delete-error" text={t(deleteMessage)} /> : undefined}
              />
              <TextButton testID="delete-forgot" label={t('auth.forgot')} disabled={busy} align="flex-start" onPress={() => toReset('delete')} />
              <ActionButton
                testID="delete-confirm"
                variant="danger"
                label={busy ? t('delete.busy') : t('delete.confirm')}
                busy={busy}
                disabled={deletePassword.length === 0}
                onPress={() => void submitDelete()}
              />
              <ActionButton testID="delete-cancel" variant="secondary" label={t('delete.cancel')} disabled={deleting} onPress={closeUnlessDeleting} />
            </>
          ) : null}
        </ScrollView>
      </View>
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  frame: { flexShrink: 1, minHeight: 0, gap: 12 },
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 10, minHeight: 44 },
  title: { flex: 1, minWidth: 0, fontSize: 21 },
  body: { flexGrow: 0, flexShrink: 1, minHeight: 0 },
  bodyContent: { gap: 12 },
  socialSlot: { minHeight: 12 },
  newHere: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'center', justifyContent: 'center' },
  sent: { alignItems: 'center', gap: 14, paddingTop: 8, paddingBottom: 4 },
  offerEmail: { gap: 4 },
  mailCircle: { minWidth: 64, minHeight: 64, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
});
