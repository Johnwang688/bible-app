import { feedbackStyles, watchVersePointer } from '../feedback';
import { getTheme } from '../presets';

it('builds glass overlays without changing layout, clipping, or stealing pointer events', () => {
  const css = feedbackStyles(getTheme('silver'));
  expect(css).toContain('@media (min-width: 768px) and (hover: hover)');
  for (const role of ['button', 'link', 'tab', 'radio']) expect(css).toContain(`[role="${role}"]`);
  expect(css).toContain(':not([aria-disabled="true"]):not([data-hover="none"])');
  expect(css).toContain('pointer-events: none; border-radius: inherit');
  expect(css).not.toContain('overflow: hidden');
  expect(css).toContain('background: rgba(255,255,255,.38)');
  expect(feedbackStyles(getTheme('graphite'))).toContain('background: rgba(255,255,255,.10)');
});

it('separates raised and flat outlined controls and preserves the current rail pill', () => {
  const css = feedbackStyles(getTheme('strawberry-milk'));
  expect(css).toContain(':not([data-hover="flat"]):not([aria-current="page"]):hover');
  expect(css).toContain('[data-hover="flat"]:not([aria-current="page"]):hover');
  expect(css).toContain('transform: translate(-1px,-1px); box-shadow: 5px 5px 0');
  expect(css).toContain('transform: translate(2px,2px); box-shadow: 1px 1px 0');
  expect(css).not.toContain('::after');
});

it('has visible primary feedback, a single keyboard ring, reduced motion and a layered verse wash', () => {
  const theme = getTheme('silver');
  const css = feedbackStyles(theme);
  expect(css).toContain('brightness(1.18)');
  expect(css).toContain(`outline: 3px solid ${theme.colors.text} !important; outline-offset: 2px`);
  expect(css).toContain('prefers-reduced-motion: reduce');
  expect(css).toContain('transition: none !important');
  expect(css).toContain('transition: margin-left 200ms');
  expect(css).toContain('[data-pointer-moved] [data-verse="1"]:hover');
  expect(css).toContain('box-shadow: inset 0 0 0 999px color-mix');
  expect(css).not.toContain('input');
});

it('enables verse feedback only after movement and invalidates it on both wheel and scroll', () => {
  const handlers = new Map<string, () => void>();
  const root = { setAttribute: jest.fn(), removeAttribute: jest.fn() };
  const doc = { documentElement: root, addEventListener: jest.fn((name, fn) => handlers.set(name, fn)), removeEventListener: jest.fn() };
  const stop = watchVersePointer(doc as unknown as Document);
  expect(root.setAttribute).not.toHaveBeenCalled();
  handlers.get('mousemove')!();
  expect(root.setAttribute).toHaveBeenCalledWith('data-pointer-moved', '');
  handlers.get('scroll')!();
  handlers.get('wheel')!();
  expect(root.removeAttribute).toHaveBeenCalledTimes(2);
  stop();
  expect(doc.removeEventListener).toHaveBeenCalledWith('scroll', handlers.get('scroll'), true);
});

it('blends the light-glass hover wash while keeping dark glass plain and retaining the edge ring', () => {
  const light = feedbackStyles(getTheme('silver'));
  const dark = feedbackStyles(getTheme('graphite'));
  expect(light).toContain('mix-blend-mode: overlay');
  expect(dark).not.toContain('mix-blend-mode');
  expect(light).toContain('box-shadow: inset 0 0 0 1px rgba(255,255,255,.95)');
});
