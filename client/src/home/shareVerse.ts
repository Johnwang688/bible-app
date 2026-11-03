// Sharing the verse of the day: the system share sheet, or the clipboard on a browser without the Web Share API
// (as the reader's verse sheet does).
import * as Clipboard from 'expo-clipboard';
import { Platform, Share } from 'react-native';

import { announce } from '../reader/components/a11y';

/** `copiedMessage` is announced after a copy. Errors are ignored: a dismissed or failed share has nothing to fix. */
export async function shareVerse(message: string, copiedMessage: string): Promise<void> {
  // Browsers without the Web Share API (most desktops) cannot share, so copying is the way out.
  if (Platform.OS === 'web' && (typeof navigator === 'undefined' || !('share' in navigator))) {
    try {
      await Clipboard.setStringAsync(message);
      announce(copiedMessage);
    } catch {
      // The clipboard is unavailable; there is nothing more to do.
    }
    return;
  }
  try {
    await Share.share({ message });
  } catch {
    // Dismissed or failed: the share sheet reported it.
  }
}
