import type { BottomTabBarProps } from 'expo-router/tabs';
import { useLayoutEffect } from 'react';

export type RailTabState = Pick<BottomTabBarProps, 'state' | 'emitter'>;
let bridge: RailTabState | null = null;

/** Publish only committed navigator state; an old cleanup must not clear a newer bridge. */
export function publishRailTabState(value: RailTabState): () => void {
  bridge = value;
  return () => { if (bridge === value) bridge = null; };
}

/** The desktop replacement for the tab bar has no UI, but keeps its tab-press semantics. */
export function RailTabBridge({ state, emitter }: RailTabState) {
  useLayoutEffect(() => publishRailTabState({ state, emitter }), [state, emitter]);
  return null;
}

/** False cancels navigation. A current-tab press must not leave `useTabFocused.chosen` latched. */
export function pressRailTab(name: string): boolean {
  if (!bridge) return true;
  const { state, emitter } = bridge;
  const route = state.routes.find((candidate) => candidate.name === name);
  if (!route || route.key === state.routes[state.index]?.key) return true;
  const event = emitter.emit({ type: 'tabPress', target: route.key, canPreventDefault: true });
  return !event.defaultPrevented;
}
