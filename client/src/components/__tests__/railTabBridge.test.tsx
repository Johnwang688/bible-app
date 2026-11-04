import { render } from '@testing-library/react-native';

import { pressRailTab, publishRailTabState, RailTabBridge, type RailTabState } from '../railTabBridge';

function navigator(index = 0, prevented = false) {
  const emit = jest.fn(() => ({ defaultPrevented: prevented }));
  const value = {
    state: { index, routes: [{ name: 'bible', key: 'bible-key' }, { name: 'study', key: 'study-key' }] },
    emitter: { emit },
  } as unknown as RailTabState;
  return { value, emit };
}

it('emits synchronously for a different tab, targeted at its real route key', () => {
  const nav = navigator(); const clear = publishRailTabState(nav.value);
  try {
    expect(pressRailTab('study')).toBe(true);
    expect(nav.emit).toHaveBeenCalledTimes(1);
    expect(nav.emit).toHaveBeenCalledWith({ type: 'tabPress', target: 'study-key', canPreventDefault: true });
  } finally { clear(); }
});

it('does not emit for the navigator current tab, including when a pushed route covers it', () => {
  const nav = navigator(); const clear = publishRailTabState(nav.value);
  try { expect(pressRailTab('bible')).toBe(true); expect(nav.emit).not.toHaveBeenCalled(); } finally { clear(); }
});

it('allows ordinary navigation without a bridge or a matching tab', () => {
  expect(pressRailTab('study')).toBe(true);
  const nav = navigator(); const clear = publishRailTabState(nav.value);
  try { expect(pressRailTab('unknown')).toBe(true); expect(nav.emit).not.toHaveBeenCalled(); } finally { clear(); }
});

it('respects a tabPress listener preventing navigation', () => {
  const nav = navigator(0, true); const clear = publishRailTabState(nav.value);
  try { expect(pressRailTab('study')).toBe(false); expect(nav.emit).toHaveBeenCalledTimes(1); } finally { clear(); }
});

it('publishes the latest committed state and clears the bridge on unmount', async () => {
  const first = navigator(); const next = navigator(1);
  const tree = await render(<RailTabBridge {...first.value} />);
  expect(pressRailTab('study')).toBe(true); expect(first.emit).toHaveBeenCalledTimes(1);
  await tree.rerender(<RailTabBridge {...next.value} />);
  expect(pressRailTab('study')).toBe(true); expect(next.emit).not.toHaveBeenCalled();
  expect(pressRailTab('bible')).toBe(true); expect(next.emit).toHaveBeenCalledTimes(1);
  await tree.unmount();
  expect(pressRailTab('bible')).toBe(true); expect(next.emit).toHaveBeenCalledTimes(1);
});

it('does not let cleanup from an older bridge clear the current one', () => {
  const first = navigator(); const next = navigator();
  const clearFirst = publishRailTabState(first.value); const clearNext = publishRailTabState(next.value);
  clearFirst();
  try { pressRailTab('study'); expect(next.emit).toHaveBeenCalledTimes(1); expect(first.emit).not.toHaveBeenCalled(); } finally { clearNext(); }
});
