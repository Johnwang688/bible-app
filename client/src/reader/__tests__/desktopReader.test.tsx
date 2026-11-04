import { act, renderHook } from '@testing-library/react-native';
import type { NativeScrollEvent, NativeSyntheticEvent } from 'react-native';

import { playerBarBottom } from '../../readAloud/components/ReadAloudBar';
import { getTheme } from '../../theme/presets';
import { useCollapsingHeader } from '../components/useCollapsingHeader';

jest.mock('../components/useReduceMotion', () => ({ useReduceMotion: () => true }));

const scroll = (y: number) => ({ nativeEvent: { contentOffset: { y }, contentSize: { height: 2000 }, layoutMeasurement: { height: 600 } } }) as NativeSyntheticEvent<NativeScrollEvent>;

it('keeps header arrows reachable, including when resizing from an already collapsed header', async () => {
  const hook = await renderHook<ReturnType<typeof useCollapsingHeader>, { pinned: boolean }>(
    ({ pinned }) => useCollapsingHeader(60, { pinned }), { initialProps: { pinned: false } },
  );
  await act(() => hook.result.current.onScroll(scroll(200)));
  expect(hook.result.current.hidden).toBe(true);
  await hook.rerender({ pinned: true });
  expect(hook.result.current.hidden).toBe(false);
  expect(hook.result.current.translateY).toEqual(expect.objectContaining({ _value: 0 }));
  await act(() => hook.result.current.onScroll(scroll(400)));
  expect(hook.result.current.hidden).toBe(false);
});

it.each(['silver', 'strawberry-milk', 'graphite'] as const)('puts the player 16px above the desktop bottom in %s', (preset) => {
  const theme = getTheme(preset);
  expect(playerBarBottom(theme, { bottom: 34 }, 1024)).toBe(16);
  expect(playerBarBottom(theme, { bottom: 0 }, 1440)).toBe(16);
  expect(playerBarBottom(theme, { bottom: 34 }, 1023)).toBe(112);
});
