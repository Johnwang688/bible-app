import { render } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../ThemeProvider';

it('updates the document colour scheme with the theme on web', async () => {
  const originalOS = Platform.OS;
  const originalDocument = Object.getOwnPropertyDescriptor(globalThis, 'document');
  const element = { style: { colorScheme: '' }, setAttribute: jest.fn(), removeAttribute: jest.fn() };
  const styles = new Map<string, { id: string; textContent: string; parentNode: unknown }>();
  const appendChild = jest.fn((node) => { styles.set(node.id, node); node.parentNode = {}; });
  Object.defineProperty(Platform, 'OS', { configurable: true, value: 'web' });
  Object.defineProperty(globalThis, 'document', { configurable: true, value: {
    documentElement: element,
    getElementById: (id: string) => styles.get(id),
    createElement: () => ({ id: '', textContent: '', parentNode: null }),
    head: { appendChild }, addEventListener: jest.fn(), removeEventListener: jest.fn(),
  } });
  const storage = createStorage(memoryBackend());
  const tree = (systemScheme: 'light' | 'dark') => <ThemeProvider storage={storage} systemScheme={systemScheme}>{null}</ThemeProvider>;
  try {
    const { rerender } = await render(tree('light'));
    expect(element.style.colorScheme).toBe('light');
    const lightFeedback = styles.get('hover-feedback')!.textContent;
    expect(lightFeedback).toContain('rgba(255,255,255,.38)');
    expect(styles.get('cjk-bold')!.textContent).toContain("local('Microsoft YaHei Bold')");
    await rerender(tree('dark'));
    expect(element.style.colorScheme).toBe('dark');
    expect(styles.get('hover-feedback')!.textContent).toContain('rgba(255,255,255,.10)');
    expect(appendChild).toHaveBeenCalledTimes(2); // Update the existing two styles, never duplicate them.
    Object.defineProperty(Platform, 'OS', { configurable: true, value: 'ios' });
    await rerender(tree('light'));
    expect(element.style.colorScheme).toBe('dark');
  } finally {
    Object.defineProperty(Platform, 'OS', { configurable: true, value: originalOS });
    if (originalDocument) Object.defineProperty(globalThis, 'document', originalDocument);
    else Reflect.deleteProperty(globalThis, 'document');
  }
});
