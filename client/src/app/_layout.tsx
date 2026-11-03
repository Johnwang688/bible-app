// Root layout: the providers every screen needs (API, account, language, theme), then the font gate (the active
// look's fonts: the web shows the app at once, a phone waits for them) around the screens.
// The account's sign-in gate is the first-run state's: closed until the intro is done, and for Under 13.
import { SplashScreen, Stack, usePathname } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';

import { ApiProvider } from '../api/ApiProvider';
import { AccountProvider } from '../auth';
import { FontGate } from '../fonts/FontGate';
import { I18nProvider } from '../i18n/I18nProvider';
import { importLegacyDataOnce, webLegacySource } from '../legacy';
import { FirstRunGate } from '../onboarding/FirstRunGate';
import { appSignInGateFor } from '../onboarding/signIn';
import { getStorage } from '../storage/storage';
import { ThemeProvider, useTheme } from '../theme/ThemeProvider';

void SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  // The old web app's data imports once, synchronously, before any provider reads storage.
  useState(() => importLegacyDataOnce({ storage: getStorage(), source: webLegacySource() }));
  // AccountProvider reads its gate once, when it mounts.
  const [signInGate] = useState(() => appSignInGateFor(getStorage()));

  return (
    <ApiProvider>
      <AccountProvider signInGate={signInGate}>
        <I18nProvider>
          <ThemeProvider>
            <FontGate onReady={() => void SplashScreen.hideAsync()}>
              <ThemedStack />
            </FontGate>
          </ThemeProvider>
        </I18nProvider>
      </AccountProvider>
    </ApiProvider>
  );
}

function ThemedStack() {
  const theme = useTheme();
  const pathname = usePathname();
  return (
    <>
      <StatusBar style={theme.mode === 'dark' ? 'light' : 'dark'} />
      <FirstRunGate pathname={pathname}>
        <Stack screenOptions={{ headerShown: false, contentStyle: { backgroundColor: theme.colors.base } }} />
      </FirstRunGate>
    </>
  );
}
