// Root layout: the providers every screen needs (API, account, language, theme), then the font gate (the active
// look's fonts: the web shows the app at once, a phone waits for them) around the screens.
// The account's sign-in gate is the first-run state's: closed until the intro is done, and for Under 13.
import { SplashScreen, Stack, usePathname } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';
import { Platform, View, useWindowDimensions } from 'react-native';

import { ApiProvider } from '../api/ApiProvider';
import { AccountProvider } from '../auth';
import { FontGate } from '../fonts/FontGate';
import { I18nProvider } from '../i18n/I18nProvider';
import { importLegacyDataOnce, webLegacySource } from '../legacy';
import { FirstRunGate } from '../onboarding/FirstRunGate';
import { onboardingKey } from '../onboarding/keys';
import { RailContext } from '../components/RailContext';
import { RailSkipLink, SideRail } from '../components/SideRail';
import { railWidthFor } from '../components/layout';
import { appSignInGateFor } from '../onboarding/signIn';
import { getStorage, useStoredValue } from '../storage/storage';
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
  const { width } = useWindowDimensions();
  const [onboarding] = useStoredValue(getStorage(), onboardingKey);
  const rail = !onboarding.done || pathname.startsWith('/memory/') ? 0 : railWidthFor(width);
  return (
    <>
      <StatusBar style={theme.mode === 'dark' ? 'light' : 'dark'} />
      <FirstRunGate pathname={pathname}>
        <RailContext.Provider value={rail}>
          <RailSkipLink />
          <View nativeID="main-content" {...(Platform.OS === 'web' ? { role: 'main' as const } : {})} style={{ flex: 1 }}>
            <Stack screenOptions={{ headerShown: false, contentStyle: { backgroundColor: theme.colors.base } }} />
          </View>
          <SideRail />
        </RailContext.Provider>
      </FirstRunGate>
    </>
  );
}
