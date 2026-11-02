// Verse keyboard access (orchestrator-owned). R-1 activated the verse *text* with Enter/Space on the web;
// R-2 makes the verse number a real button (verse-{n}-tools), so keyboard users reach every verse's tools
// through it and the text stays plain readable text. The e2e suite presses Enter on the button in a browser.
import { screen } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { renderReader } from './readerHarness';

it.each(['ios', 'web'] as const)('gives every verse a keyboard-reachable tools button (%s)', async (os) => {
  const restore = jest.replaceProperty(Platform, 'OS', os);
  try {
    await renderReader({ position: { bookNumber: 43, chapter: 4, translation: 'BSB' } });
    await screen.findByTestId('verse-1-tools');
    const tools = screen.getAllByTestId(/^verse-\d+-tools$/);
    expect(tools.length).toBe(3);
    for (const t of tools) {
      expect(t.props.accessibilityRole).toBe('button');
      expect(t.props.onPress).toEqual(expect.any(Function));
    }
  } finally {
    restore.restore();
  }
});
