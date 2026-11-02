// A dev aid for the account card and its sheets (R-6b): the card on a bare screen, so the web e2e suite can
// open it without the Me tab. R-6a mounts the card on Me; this route may be deleted then.
import { AccountCard } from '../auth/components/AccountCard';
import { Screen } from '../components/Screen';

export default function AccountPreview() {
  return (
    <Screen titleKey="screen.me.title" testID="screen-account-preview">
      <AccountCard />
    </Screen>
  );
}
