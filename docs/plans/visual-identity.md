# Visual identity and theme system (2026-10-31)

## The problem
- **20 themes, each tuned by hand.** `frontend-next/src/app/globals.css` is 7,944 lines, with 732 hard-coded hex colours and 259 rules that apply to a single `[data-theme=…]`. Galaxy and the neon Pink theme carry more than 70 overrides each.
- **Every new component has to be checked in every theme,** and nothing guarantees that text is readable in all of them.
- **No single identity:** the app reads as a theme picker more than a brand.

## Decisions (John, 2026-10-31)
1. **Theme model: one identity plus accent colours.**
   - One designed look in three modes: **light**, **dark**, and **paper** (a sepia tone for long reading).
   - Students personalise it by choosing one of **6-8 accent hues**, each checked for contrast in all three modes. The accent recolours highlights, buttons and verse numbers.
   - Dynamic stays as an optional special effect, not a theme.
2. **Identity: warm paper and ink.**
   - Builds on today's Default and Dark: cream paper, ink text, a warm copper/terracotta accent, and serif type for Scripture. The UI chrome stays sans-serif.
   - Today's Dark (`#16130f`, cream `#ede8df`, copper `#c9956a`) is the starting point for dark mode.
3. **Default mode: follow the device** (`prefers-color-scheme`), switchable in settings. Paper is opt-in.

## Plan
- **Token layer:** about 15 semantic CSS custom properties on `:root`, with a block for each of the three modes. Proposed set:
  - surfaces 0-2, popover
  - text primary / secondary / muted
  - accent, accent-soft, on-accent
  - line, line-soft
  - focus
  - highlight 1-4.
- **Components consume tokens only.** A stylelint rule (or a test) rejects hex colours outside the token file.
- **Accent hues** are a second, small set of tokens (`--accent`, `--accent-soft`, `--on-accent`) per hue and mode. The old themes worth keeping become accent hues or inform the dark palette, depending on John's keep/cut picks.
- **Hebrew and Greek type:** Noto Serif Hebrew or Ezra SIL for Hebrew, and Gentium (or Noto Serif) for Greek. All are OFL, self-hosted with `next/font`, with `dir="rtl"` on Hebrew spans.
- **Layout:**
  - The reader comes first, with an auto-hiding top bar and bottom taskbar.
  - One side pane (study, commentary, AI, original words) on desktop becomes a bottom sheet on phones.
  - The full responsive pass belongs to the UI-and-performance phase.
- **Migration:** saved theme ids map to the nearest mode and accent (for example pastel blue → light + blue accent, Midnight Blue → dark + blue). Existing users keep a close equivalent, never a broken theme.

## Open
- Which of the 20 current themes become accent hues (John's keep/cut picks).
- Naming and a logo or wordmark, and the app's voice for teens.
