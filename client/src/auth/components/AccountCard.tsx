// The account card (R-6b): "Sign in to sync" when signed out, the account and its sync state when signed in.
// Signed out with an Under 13 offer (FOLLOW-UP item 2: the account was signed out because Under 13 was picked),
// it also offers to delete that account and its synced data, or "Not now".
// R-6a mounts it on the Me tab. Everything it shows comes from `useAccount()`; it keeps only which sheet is
// open and the "account deleted" banner.
//
// The banner sits at the top of the card's own column, which the screen already places below the top safe
// area, so it can never run under the notch or the status bar. It goes away after BANNER_MS or when dismissed.
import { useCallback, useEffect, useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { SheetModal } from '../../reader/components/SheetModal';
import { useTheme } from '../../theme/ThemeProvider';
import { dangerColours } from '../../theme/danger';
import { useAccount } from '../AccountProvider';
import type { SyncStatus } from '../../sync/types';
import { AccountSheet, type AccountSheetStart } from './AccountSheet';
import { ActionButton, Glyph, RoundButton, Spinner, TextButton } from './parts';
import { clockNow, nextSyncLineChange, syncLine } from './syncLine';

/** How long the "account deleted" banner stays up by itself. */
export const BANNER_MS = 8000;

/**
 * Re-renders the card when the sync line's wording is due to change ("just now" → "1 min ago"). The line itself
 * reads the clock at render time, so a status that arrives on a rerender is never aged from an older clock value.
 */
function useClockTick(sync: SyncStatus | null): void {
  const [, setTick] = useState(0);
  useEffect(() => {
    let timer: ReturnType<typeof setTimeout> | undefined;
    const schedule = () => {
      const wait = nextSyncLineChange(sync, Date.now());
      if (wait === null) return;
      timer = setTimeout(() => {
        setTick((n) => n + 1);
        schedule();
      }, wait);
    };
    schedule();
    return () => clearTimeout(timer);
  }, [sync]);
}

export function AccountCard() {
  const theme = useTheme();
  const { t, formatDate } = useI18n();
  const account = useAccount();
  const danger = dangerColours(theme);
  useClockTick(account.sync);

  const [sheet, setSheet] = useState<AccountSheetStart | null>(null);
  const [confirmSignOut, setConfirmSignOut] = useState(false);
  const [banner, setBanner] = useState(false);

  const closeSheet = useCallback(() => setSheet(null), []);
  const showBanner = useCallback(() => setBanner(true), []);

  useEffect(() => {
    if (!banner) return;
    const timer = setTimeout(() => setBanner(false), BANNER_MS);
    return () => clearTimeout(timer);
  }, [banner]);
  // Signing in again ends the "deleted" news (adjusted while rendering, when the status changes).
  const [seenStatus, setSeenStatus] = useState(account.status);
  if (seenStatus !== account.status) {
    setSeenStatus(account.status);
    if (account.status === 'signedIn' && banner) setBanner(false);
  }

  const signedIn = account.status === 'signedIn' && account.user !== null;
  // The sign-out confirmation only makes sense while signed in; any other cause of signing out closes it
  // (adjusted while rendering, so it is gone in the same pass and does not return on the next sign-in).
  if (confirmSignOut && !signedIn) setConfirmSignOut(false);
  const signedOut = account.status === 'signedOut';
  // Sign-in is off only when the provider says so (the Under 13 age choice).
  const allowed = account.signInAllowed !== false;
  const pastel = theme.canvas.c3 !== undefined;
  const ink = theme.canvas.c3t ?? theme.colors.text;
  const soft = theme.canvas.c3m ?? theme.colors.muted;
  const head = uiFace(theme.type.head, '700');
  const bold = uiFace(theme.type.ui, '700');

  const syncState = account.sync?.state;
  const retry = syncState === 'offline' || syncState === 'error';
  const line = signedIn ? syncLine(account.sync, clockNow()) : null;

  const signOut = () => {
    // Offline or failing: what changed on this phone may not have reached the account. Say so first.
    if (retry) setConfirmSignOut(true);
    else void account.signOut().catch(() => undefined);
  };
  const confirmedSignOut = () => {
    setConfirmSignOut(false);
    void account.signOut().catch(() => undefined);
  };

  const email = account.user?.email ?? '';
  const initial = Array.from(email)[0]?.toUpperCase();
  const avatar = (
    <View
      accessible={false}
      style={[styles.avatar, theme.backgrounds.button, { borderColor: theme.borders.button?.color, borderWidth: theme.borders.button?.width ?? 0 }]}
    >
      {signedIn && initial ? (
        <Text style={{ color: theme.colors.btnText, fontFamily: head, fontSize: 19 }}>{initial}</Text>
      ) : (
        <Glyph name="person" size={22} strokeWidth={1.9} color={theme.colors.btnText} />
      )}
    </View>
  );

  const when = (l: NonNullable<typeof line>) =>
    t(l.key, { n: l.n ?? 0, date: l.date ? formatDate(l.date, { dateStyle: 'medium' }) : '' });

  return (
    <View style={styles.column}>
      {banner ? (
        <View
          testID="account-toast"
          accessibilityRole="alert"
          accessibilityLiveRegion="polite"
          style={[
            styles.banner,
            theme.backgrounds.sheet,
            {
              borderColor: theme.borders.sheet.color,
              borderWidth: theme.borders.sheet.width,
              borderRadius: theme.style === 'glass' ? 26 : 14,
              boxShadow: theme.shadows.sheet ?? theme.shadows.card ?? undefined,
            },
          ]}
        >
          <Glyph name="check" size={18} strokeWidth={2.4} color={theme.colors.text} />
          <Text style={{ flex: 1, color: theme.colors.text, fontFamily: bold, fontSize: 14, lineHeight: 19 }}>{t('account.deleted')}</Text>
          <RoundButton testID="account-toast-dismiss" label={t('account.dismiss')} glyph="close" surface={false} colour={theme.colors.text} onPress={() => setBanner(false)} />
        </View>
      ) : null}

      <GlassSurface
        testID="account-card"
        background={pastel ? { backgroundColor: theme.canvas.c3! } : theme.backgrounds.surface}
        style={[
          styles.card,
          { borderRadius: theme.radii.card, borderWidth: theme.borders.card.width, borderColor: theme.borders.card.color, boxShadow: theme.shadows.card ?? undefined },
        ]}
      >
        {signedIn && line ? (
          <>
            <View style={styles.head}>
              {avatar}
              <View style={styles.headText}>
                <Text numberOfLines={1} ellipsizeMode="tail" style={{ color: ink, fontFamily: head, fontSize: 17 }}>
                  {email}
                </Text>
                <View testID="account-sync-status" accessibilityLiveRegion="polite" style={styles.syncLine}>
                  <View style={styles.syncGlyph}>
                    {line.glyph === 'sync' ? (
                      <Spinner size={14} color={soft} />
                    ) : (
                      <Glyph name={line.glyph} size={14} strokeWidth={line.glyph === 'check' ? 2.4 : 2} color={line.warn ? danger.text : soft} />
                    )}
                  </View>
                  <Text style={{ flex: 1, color: soft, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 18 }}>{when(line)}</Text>
                </View>
              </View>
            </View>
            <View style={styles.buttons}>
              <ActionButton
                testID="account-sync-now"
                variant="secondary"
                grow
                label={retry ? t('account.tryAgain') : t('account.syncNow')}
                disabled={syncState === 'syncing'}
                onPress={() => void account.syncNow().catch(() => undefined)}
              />
              <ActionButton testID="account-sign-out" variant="secondary" grow label={t('account.signOut')} onPress={signOut} />
            </View>
            <View accessible={false} style={[styles.rule, { borderTopColor: pastel ? ink : theme.colors.muted, opacity: pastel ? 1 : 0.35 }]} />
            <TextButton testID="account-delete" tone="danger" label={t('account.delete')} onPress={() => setSheet('delete')} />
          </>
        ) : signedOut ? (
          <>
            <View style={styles.head}>
              {avatar}
              <View style={styles.headText}>
                <Text style={{ color: ink, fontFamily: head, fontSize: 17 }}>{t('account.signInTitle')}</Text>
                <Text style={{ color: soft, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 18 }}>
                  {t(allowed ? 'account.signInBody' : 'account.under13')}
                </Text>
              </View>
            </View>
            {allowed ? <ActionButton testID="account-sign-in" label={t('account.signIn')} onPress={() => setSheet('signIn')} /> : null}
            {account.under13Offer ? (
              <View testID="account-u13-offer" style={styles.offer}>
                <View accessible={false} style={[styles.rule, { borderTopColor: pastel ? ink : theme.colors.muted, opacity: pastel ? 1 : 0.35 }]} />
                <Text accessibilityRole="header" style={{ color: ink, fontFamily: bold, fontSize: 15, lineHeight: 21 }}>
                  {t('account.under13Offer.title')}
                </Text>
                <Text style={{ color: soft, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 18 }}>{t('account.under13Offer.body')}</Text>
                <ActionButton testID="account-u13-delete" label={t('account.delete')} onPress={() => setSheet('offerDelete')} />
                <ActionButton testID="account-u13-not-now" variant="secondary" label={t('account.under13Offer.notNow')} onPress={account.dismissUnder13Offer} />
              </View>
            ) : null}
          </>
        ) : (
          // Auth has not reported yet: the card's shape without words, so nothing jumps when it does.
          <View style={styles.head}>{avatar}</View>
        )}
      </GlassSurface>

      {sheet !== null ? <AccountSheet key={sheet} start={sheet} onClose={closeSheet} onDeleted={showBanner} /> : null}

      {confirmSignOut && signedIn ? (
        <SheetModal testID="account-signout-sheet" onClose={() => setConfirmSignOut(false)}>
          <Text accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: head, fontSize: 21 }}>
            {t('signOut.title')}
          </Text>
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 20 }}>{t('signOut.body')}</Text>
          <ActionButton testID="account-signout-confirm" label={t('signOut.confirm')} onPress={confirmedSignOut} />
          <ActionButton testID="account-signout-cancel" variant="secondary" label={t('delete.cancel')} onPress={() => setConfirmSignOut(false)} />
        </SheetModal>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  column: { gap: 10 },
  card: { padding: 16, gap: 10 },
  head: { flexDirection: 'row', alignItems: 'center', gap: 12 },
  headText: { flex: 1, minWidth: 0, gap: 3 },
  avatar: { minWidth: 44, minHeight: 44, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  syncLine: { flexDirection: 'row', alignItems: 'flex-start', gap: 6 },
  syncGlyph: { marginTop: 2 },
  buttons: { flexDirection: 'row', gap: 10 },
  rule: { borderTopWidth: 1, marginTop: 4 },
  offer: { gap: 10 },
  banner: { flexDirection: 'row', alignItems: 'center', gap: 10, paddingVertical: 8, paddingLeft: 14, paddingRight: 4, minHeight: 56 },
});
