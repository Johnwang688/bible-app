import { act, screen } from '@testing-library/react-native';
import { Dimensions, Platform, Text } from 'react-native';

import { renderMe } from '../../me/__tests__/meHarness';
import { SheetModal } from '../components/SheetModal';

async function size(width: number) {
  await act(() => Dimensions.set({ window: { width, height: 650, scale: 1, fontScale: 1 }, screen: { width, height: 650, scale: 1, fontScale: 1 } }));
}

it.each([767, 1023])('keeps the bottom sheet layout and slide below 1024 (%i)', async (width) => {
  await size(width);
  await renderMe(<SheetModal testID="sheet" onClose={() => {}}><Text>Body</Text></SheetModal>);
  expect(screen.getByTestId('sheet')).toHaveStyle({ width: '100%', maxWidth: 560, borderBottomWidth: 0, paddingTop: 8 });
  expect(screen.getByTestId('sheet-grabber')).toBeTruthy();
  expect(screen.getByTestId('sheet-modal').props.animationType).toBe('slide');
});

it('centres a bounded desktop dialog with no grabber and a fade', async () => {
  await size(1440);
  await renderMe(<SheetModal testID="sheet" onClose={() => {}}><Text>Body</Text></SheetModal>);
  expect(screen.getByTestId('sheet')).toHaveStyle({ maxWidth: 440, maxHeight: 602, paddingTop: 16 });
  expect(screen.queryByTestId('sheet-grabber')).toBeNull();
  expect(screen.getByTestId('sheet-modal').props.animationType).toBe('fade');
});

it('gives a tall desktop picker a fixed bounded height', async () => {
  await size(1440);
  await renderMe(<SheetModal testID="sheet" tall onClose={() => {}}><Text>Body</Text></SheetModal>);
  expect(screen.getByTestId('sheet')).toHaveStyle({ height: 602, maxHeight: 602 });
});

it.each([767, 1440])('exposes web dialog roles and removes the scrim from the tab order at %i', async (width) => {
  const os = jest.replaceProperty(Platform, 'OS', 'web');
  try {
    await size(width);
    await renderMe(<SheetModal testID="sheet" onClose={() => {}}><Text accessibilityRole="header">Title</Text></SheetModal>);
    expect(screen.getByTestId('sheet').props.role).toBe('dialog');
    expect(screen.getByTestId('sheet').props['aria-modal']).toBe(true);
    expect(screen.getByTestId('sheet-scrim', { includeHiddenElements: true }).props.tabIndex).toBe(-1);
  } finally { os.restore(); }
});

it('leaves the non-modal verse sheet unchanged at desktop width', async () => {
  await size(1440);
  await renderMe(<SheetModal testID="sheet" modal={false} onClose={() => {}}><Text>Body</Text></SheetModal>);
  expect(screen.getByTestId('sheet')).toHaveStyle({ maxWidth: 560, maxHeight: 423, borderBottomWidth: 0 });
  expect(screen.getByTestId('sheet-grabber')).toBeTruthy();
  expect(screen.getByTestId('sheet').props.role).toBeUndefined();
  expect(screen.queryByTestId('sheet-scrim')).toBeNull();
});
