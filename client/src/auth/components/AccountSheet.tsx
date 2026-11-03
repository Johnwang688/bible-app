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
// Google (GOOGLE, board 11-03 row 7; prototype design/proposed/r6b-google.html): with EXPO_PUBLIC_GOOGLE_SIGN_IN on
// the web, "Continue with Google" sits above the email form on the sign-in and sign-up views. While Google's window is
// open the button stays pressable (a second press replaces the first request and window) and the email form waits.
// An email that already has a password account moves to the sign-in view with the email filled in. An account with
// Google and no password confirms a delete through Google's window instead of a password (whatever the flag: a
// password field would be a dead end for it); while that window is open, Cancel and Close give the delete up (the
// abort is read before anything is stopped or sent), and once Google has proven the account the delete locks the
// sheet like a password delete.
import { router } from 'expo-router';
import { useCallback, useEffect, useRef, useState, type ComponentRef } from 'react';
import { Keyboard, Platform, ScrollView, StyleSheet, Text, TextInput, useWindowDimensions, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { programmaticFocus, useFocusOnMount } from '../../reader/components/a11y';
import { SheetModal } from '../../reader/components/SheetModal';
import { useTheme } from '../../theme/ThemeProvider';
import { useAccount } from '../AccountProvider';
import { googleSignInEnabled } from '../googleFlag';
import { reauthKindFor } from '../types';
import { authError, deleteError, existingEmail, googleDeleteError, isEmailShaped, MIN_PASSWORD_LENGTH, type ShownError } from './authErrors';
import { GoogleButton, GoogleG, OrDivider, QuietLine } from './GoogleButton';
import { ActionButton, AuthField, ErrorLine, Glyph, Para, RoundButton, TextButton } from './parts';
import type { MessageKey } from '../../i18n/translate';

export type AccountSheetStart = 'signIn' | 'delete' | 'offerDelete';
type SheetView = 'signIn' | 'signUp' | 'reset' | 'delete' | 'offerDelete';

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
  const insets = useSafeAreaInsets();
  const { height: windowHeight } = useWindowDimensions();
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
  /** A quiet, non-error line (Google's window closed: nothing failed). */
  const [notice, setNotice] = useState<MessageKey | null>(null);
  /** Google's window is open for this view's request (sign-in, or a delete's re-auth). */
  const [googleWaiting, setGoogleWaiting] = useState(false);
  const googleWaitingNow = useRef(false);
  /**
   * A Google delete waiting on Google's window, or null: Cancel and Close may give it up until Google has proven the
   * account (`onProven` clears it). Read synchronously, like `owner`.
   */
  const googleAbort = useRef<{ aborted: boolean } | null>(null);
  const [focusPassword, setFocusPassword] = useState(0);
  /** Where "back" goes from the reset view. */
  const [resetFrom, setResetFrom] = useState<'signIn' | 'delete'>('signIn');
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
  const showGoogle = googleSignInEnabled();
  /** The delete views confirm with Google's window (an account with Google and no password). */
  const googleDelete = view === 'delete' ? reauthKindFor(account.user) === 'google' : view === 'offerDelete' && account.under13Offer?.method === 'google';
  /** A delete is running: closing cannot stop it, so nothing may close the sheet until its result is shown. */
  const deleting = busy && (view === 'delete' || view === 'offerDelete') && !googleWaiting;

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
    () =>
      owner.current !== 0 &&
      owner.current === seq.current &&
      (viewNow.current === 'delete' || viewNow.current === 'offerDelete') &&
      googleAbort.current === null, // still waiting on Google's window: it can be given up
    [],
  );

  /** Gives up a Google delete still waiting on Google's window (nothing was stopped or sent yet). */
  const abandonGoogleDelete = useCallback((): boolean => {
    const waiting = googleAbort.current;
    if (!waiting) return false;
    waiting.aborted = true;
    googleAbort.current = null;
    return true;
  }, []);

  /**
   * Every close path of the sheet (Close, Cancel, the scrim, Escape and Android Back through `onRequestClose`). Reads
   * the same synchronous lock the submits take, not only `deleting`: Back arriving in the turn of a Return that
   * submitted a delete comes before React commits `busy`, and must not close the sheet while the delete runs
   * (U13-R2-2).
   */
  const closeUnlessDeleting = useCallback(() => {
    if (abandonGoogleDelete()) return onClose();
    if (deleting || deleteRunning()) return;
    onClose();
  }, [abandonGoogleDelete, deleting, deleteRunning, onClose]);

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
    setNotice(null);
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
    abandonGoogleDelete();
    seq.current++;
    viewNow.current = next;
    setView(next);
    setError(null);
    setDeleteMessage(null);
    setNotice(null);
    googleWaitingNow.current = false;
    setGoogleWaiting(false);
    setBusy(false);
    setPassword('');
    setDeletePassword('');
    setShowPassword(false);
    setSent(false);
  }, [deleteRunning, abandonGoogleDelete]);

  // An email that already has a password account: the password field takes the focus.
  useEffect(() => {
    if (focusPassword > 0) passwordInput.current?.focus();
  }, [focusPassword]);

  // Signed in (by a sign-in whose view was left meanwhile), or signed out while deleting: nothing left to do here.
  // (Decided by how the sheet was opened, not by the view: the delete sheet can pass through the reset view.)
  // The offer's delete runs signed out; it has nothing left to do once the offer is gone (not while it runs: the
  // offer goes just before a successful delete resolves, and that result closes the sheet itself).
  const offerGone = account.under13Offer === null;
  useEffect(() => {
    if (account.status === 'signedIn' && start === 'signIn') onClose();
    else if (account.status === 'signedOut' && start === 'delete') onClose();
    else if (offerGone && start === 'offerDelete' && !busy) onClose();
  }, [account.status, start, onClose, offerGone, busy]);

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
      await account.signUp(trimmed, password);
      if (current()) onClose();
    } catch (e) {
      if (current()) setError(authError(e));
    } finally {
      request.finish();
    }
  };

  /**
   * Continue with Google (sign-in and sign-up views). A press while Google's window is open replaces the earlier
   * request (Firebase cancels its window; that request's result is ignored here).
   */
  const submitGoogle = async () => {
    if (busy && !googleWaitingNow.current) return;
    if (googleWaitingNow.current) seq.current++; // abandon the earlier request
    const request = begin();
    if (!request) return;
    const { current } = request;
    googleWaitingNow.current = true;
    setGoogleWaiting(true);
    try {
      await account.signIn({ kind: 'google' });
      if (current()) onClose();
    } catch (e) {
      if (current()) {
        const shown = authError(e);
        if (shown.place === 'notice') setNotice(shown.key);
        else if (shown.key === 'account.google.exists') {
          // Sign in with the email and password instead (never linked): from sign-up, move to sign-in first.
          const address = existingEmail(e);
          if (viewNow.current !== 'signIn') go('signIn');
          if (address) setEmail(address);
          setError(shown);
          setFocusPassword((n) => n + 1);
        } else setError(shown);
      }
    } finally {
      if (current()) {
        googleWaitingNow.current = false;
        setGoogleWaiting(false);
      }
      request.finish();
    }
  };

  /** A delete confirmed with Google's window (`offer`: the Under 13 offer's delete). */
  const submitGoogleDelete = async (offer: boolean) => {
    if (busy) return;
    const request = begin();
    if (!request) return;
    const { current } = request;
    const signal = { aborted: false };
    googleAbort.current = signal;
    setGoogleWaiting(true);
    // Google has proven the account and the delete proper starts: from here the sheet locks (deleteRunning).
    const onProven = () => {
      if (googleAbort.current === signal) googleAbort.current = null;
      if (current()) setGoogleWaiting(false);
    };
    try {
      if (offer) await account.deleteOfferedAccount({ kind: 'google' }, { signal, onProven });
      else await account.deleteAccount({ kind: 'google' }, { signal, onProven });
      onDeleted();
      if (current()) onClose();
    } catch (e) {
      if (current()) {
        const shown = googleDeleteError(e);
        const key = offer && shown.key === 'delete.error.network' ? 'account.under13Offer.network' : shown.key;
        if (shown.quiet) setNotice(key);
        else setDeleteMessage(key);
      }
    } finally {
      if (googleAbort.current === signal) googleAbort.current = null;
      if (current()) setGoogleWaiting(false);
      request.finish();
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
  const deleteEmail = view === 'offerDelete' ? (account.under13Offer?.email ?? '') : accountEmail;

  const googleBlock = showGoogle ? (
    <>
      <GoogleButton testID="auth-google" waiting={googleWaiting} disabled={busy && !googleWaiting} onPress={() => void submitGoogle()} />
      {googleWaiting ? <QuietLine testID="auth-google-wait" text={t('account.google.waitHint')} /> : null}
      {notice ? <QuietLine testID="auth-notice" text={t(notice)} /> : null}
      <OrDivider text={t('account.google.or')} />
    </>
  ) : null;

  // The delete views for an account with Google and no password: no password field; Google's window confirms.
  const googleDeleteBody = (offer: boolean) => (
    <>
      <Para text={t('delete.body')} tone="text" />
      <Para text={t('delete.keeps')} />
      <View style={styles.googleAccount}>
        <GoogleG />
        <Text testID={offer ? 'offer-email' : 'delete-google-email'} numberOfLines={1} ellipsizeMode="middle" style={{ flex: 1, color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 15 }}>
          {deleteEmail}
        </Text>
      </View>
      <Para text={t('account.google.deleteHint', { email: deleteEmail })} />
      {deleteMessage ? <ErrorLine testID="delete-error" text={t(deleteMessage, { email: deleteEmail })} boxed /> : null}
      {notice ? <QuietLine testID="delete-notice" text={t(notice)} /> : null}
      <ActionButton
        testID="delete-confirm"
        variant="danger"
        label={googleWaiting ? t('account.google.waiting') : busy ? t('delete.busy') : t('delete.confirm')}
        busy={busy}
        onPress={() => void submitGoogleDelete(offer)}
      />
      {googleWaiting ? <QuietLine testID="delete-google-wait" text={t('account.google.deleteWaitHint')} /> : null}
      <ActionButton testID="delete-cancel" variant="secondary" label={t('delete.cancel')} disabled={deleting} onPress={closeUnlessDeleting} />
    </>
  );
  // In the sent state no field is shown, so a failed resend shows its error here whatever its place.
  const sentMessage = error ? <ErrorLine testID="auth-error" text={t(error.key)} boxed /> : undefined;

  const title =
    view === 'signIn' ? t('auth.signIn.title') : view === 'signUp' ? t('auth.signUp.title') : view === 'reset' ? t('auth.reset.title') : t('delete.title');

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
      <View style={styles.frame}>
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
              {/* Continue with Google (flag on, web), else the room kept for it and for Apple later. */}
              {googleBlock ?? <View accessible={false} style={styles.socialSlot} />}
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
              {googleBlock}
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

          {view === 'offerDelete' && googleDelete ? googleDeleteBody(true) : null}

          {view === 'offerDelete' && !googleDelete ? (
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

          {view === 'delete' && googleDelete ? googleDeleteBody(false) : null}

          {view === 'delete' && !googleDelete ? (
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
  googleAccount: { flexDirection: 'row', alignItems: 'center', gap: 10, minHeight: 44 },
  mailCircle: { minWidth: 64, minHeight: 64, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
});
