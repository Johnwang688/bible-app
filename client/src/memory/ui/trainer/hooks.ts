// Small layout hooks the trainers share.
import { useEffect, useState } from 'react';
import { Keyboard, useWindowDimensions } from 'react-native';

/** The phone's text size is well above normal: the compact mic row and the in-flow action panel. */
const LARGE_TEXT_SCALE = 1.15;

export function useLargeText(): boolean {
  return useWindowDimensions().fontScale > LARGE_TEXT_SCALE;
}

/** Whether the on-screen keyboard is open (native only; the web never fires these events). */
export function useKeyboardOpen(): boolean {
  const [open, setOpen] = useState(false);
  useEffect(() => {
    const show = Keyboard.addListener('keyboardDidShow', () => setOpen(true));
    const hide = Keyboard.addListener('keyboardDidHide', () => setOpen(false));
    return () => {
      show.remove();
      hide.remove();
    };
  }, []);
  return open;
}
