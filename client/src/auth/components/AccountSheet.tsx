// The account sheet (R-6b): sign in, create an account, reset the password, and delete the account with its
// synced data, in one bottom sheet. The sheet keeps only form state; who is signed in, and the actions, come
// from `useAccount()`.
//
// Concurrency: a request can finish after the sheet was closed, or after the person went to another view.
// Each request takes a number from `seq`; going to another view takes the next number, and unmounting makes
// the sheet not alive. A result that is stale or arrives after unmount changes nothing here (no state update,
// no `onClose`, so a newer sheet is never closed by an older request). A sign-in that completes after Close
// still signs in: the card shows it. A delete that completes after Close still reports through `onDeleted`
// (the card's banner), since the account is gone either way.
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
import { authError, deleteError, isEmailShaped, MIN_PASSWORD_LENGTH, type ShownError } from './authErrors';
import { ActionButton, AuthField, ErrorLine, Glyph, Para, RoundButton, TextButton } from './parts';
import type { MessageKey } from '../../i18n/translate';

export type AccountSheetStart = 'signIn' | 'delete';
type SheetView = 'signIn' | 'signUp' | 'reset' | 'delete';

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
  /** A delete is running: closing cannot stop it, so nothing may close the sheet until its result is shown. */
  const deleting = busy && view === 'delete';
  const closeUnlessDeleting = useCallback(() => {
    if (!deleting) onClose();
  }, [deleting, onClose]);

  /** Starts a request; the returned check says whether its result still matters. */
  const begin = useCallback(() => {
    const mine = ++seq.current;
    setBusy(true);
    setError(null);
    setDeleteMessage(null);
    return () => alive.current && seq.current === mine;
  }, []);

  const go = useCallback((next: SheetView) => {
    seq.current++;
    setView(next);
    setError(null);
    setDeleteMessage(null);
    setBusy(false);
    setPassword('');
    setDeletePassword('');
    setShowPassword(false);
    setSent(false);
  }, []);

  // Signed in (by a sign-in whose view was left meanwhile), or signed out while deleting: nothing left to do here.
  // (Decided by how the sheet was opened, not by the view: the delete sheet can pass through the reset view.)
  useEffect(() => {
    if (account.status === 'signedIn' && start === 'signIn') onClose();
    else if (account.status === 'signedOut' && start === 'delete') onClose();
  }, [account.status, start, onClose]);

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
    const current = begin();
    try {
      await account.signIn({ kind: 'password', email: trimmed, password });
      if (current()) onClose();
    } catch (e) {
      if (current()) setError(authError(e));
    } finally {
      if (current()) setBusy(false);
    }
  };

  const submitSignUp = async () => {
    if (busy) return;
    const trimmed = email.trim();
    if (!checkEmail(trimmed)) return;
    if (password.length < MIN_PASSWORD_LENGTH) return setError({ key: 'auth.signUp.tooShort', place: 'password' });
    const current = begin();
    try {
      await account.signUp(trimmed, password);
      if (current()) onClose();
    } catch (e) {
      if (current()) setError(authError(e));
    } finally {
      if (current()) setBusy(false);
    }
  };

  const submitReset = async () => {
    if (busy) return;
    const trimmed = email.trim();
    if (!checkEmail(trimmed)) return;
    const current = begin();
    try {
      await account.sendPasswordReset(trimmed);
      if (current()) setSent(true);
    } catch (e) {
      if (current()) setError(authError(e));
    } finally {
      if (current()) setBusy(false);
    }
  };

  const submitDelete = async () => {
    if (busy || deletePassword.length === 0) return;
    const current = begin();
    try {
      await account.deleteAccount(deletePassword);
      onDeleted();
      if (current()) onClose();
    } catch (e) {
      if (current()) setDeleteMessage(deleteError(e));
    } finally {
      if (current()) setBusy(false);
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
              <TextButton testID="auth-privacy" label={t('auth.privacy')} onPress={openPrivacy} />
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
  mailCircle: { minWidth: 64, minHeight: 64, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
});
