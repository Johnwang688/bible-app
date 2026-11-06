// Whether "Continue with Google" shows (GOOGLE, board 11-03 row 7). A build-time flag, off by default: the button
// shows only in a web build made with EXPO_PUBLIC_GOOGLE_SIGN_IN=1, after the Google provider is turned on in the
// Firebase console and the hosting CSP allows Google's script (the turn-on steps: "GOOGLE notes" in docs/plans/app-rebuild.md). Never on iOS or Android yet.
// Expo inlines only the static `process.env.EXPO_PUBLIC_*` read, so it is spelled out.
import { Platform } from 'react-native';

export function googleSignInEnabled(): boolean {
  return Platform.OS === 'web' && process.env.EXPO_PUBLIC_GOOGLE_SIGN_IN === '1';
}
