// Root layout: fonts, then the providers every screen needs (API, language, theme).
import { useFonts } from 'expo-font';
import { SplashScreen, Stack, usePathname } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { useEffect, useState } from 'react';

import { ApiProvider } from '../api/ApiProvider';
import { STARTUP_FONTS } from '../fonts/fonts';
import { I18nProvider } from '../i18n/I18nProvider';
import { importLegacyDataOnce, webLegacySource } from '../legacy';
import { FirstRunGate } from '../onboarding/FirstRunGate';
import { getStorage } from '../storage/storage';
import { ThemeProvider, useTheme } from '../theme/ThemeProvider';

void SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  // The old web app's data imports once, synchronously, before any provider reads storage.
  useState(() => importLegacyDataOnce({ storage: getStorage(), source: webLegacySource() }));
  const [loaded, error] = useFonts(STARTUP_FONTS);

  useEffect(() => {
    if (loaded || error) void SplashScreen.hideAsync();
  }, [loaded, error]);

  // A font that fails to load falls back to the system font rather than blocking the app.
  if (!loaded && !error) return null;

  return (
    <ApiProvider>
      <I18nProvider>
        <ThemeProvider>
          <ThemedStack />
        </ThemeProvider>
      </I18nProvider>
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
