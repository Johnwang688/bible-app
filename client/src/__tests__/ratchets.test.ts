// Acceptance (orchestrator-owned): the token ratchet and the string ratchet.
// Baselines are counts per file. They may only go down: a new literal fails the test, and so
// does removing one without lowering the baseline (so the baseline stays honest).
import { colourLiterals, readSource, sourceFiles, uiStringLiterals, type Finding } from './ratchetScan';

/** Raw colour literals allowed outside src/theme. R-0 starts at zero. */
const COLOUR_BASELINE: Record<string, number> = {};

/** Literal UI strings allowed outside the catalogue. R-0 starts at zero. */
const STRING_BASELINE: Record<string, number> = {};

const isThemeFile = (f: string) => f.startsWith('theme/');
const isCatalogue = (f: string) => f.startsWith('i18n/messages/');

function counts(findings: Finding[]): Record<string, number> {
  const out: Record<string, number> = {};
  for (const f of findings) out[f.file] = (out[f.file] ?? 0) + 1;
  return out;
}

describe('token ratchet', () => {
  it('finds no raw colour literals outside src/theme beyond the baseline', () => {
    const findings = sourceFiles()
      .filter((f) => !isThemeFile(f))
      .flatMap((f) => colourLiterals(f, readSource(f)));
    expect({ counts: counts(findings), findings }).toEqual({
      counts: COLOUR_BASELINE,
      findings: findings.filter((f) => (COLOUR_BASELINE[f.file] ?? 0) > 0),
    });
  });

  it('bites: detects the colour forms it is meant to catch', () => {
    const src = `
      const a = '#fff';
      const b = { backgroundColor: 'rgba(0, 0, 0, 0.5)' };
      const c = <View style={{ color: 'white' }} />;
      const d = \`hsl(10, 20%, 30%)\`;
      const e = <Text color="black" />;
      // '#123456' in a comment does not count
      type T = '#abcdef';
    `;
    expect(colourLiterals('x.tsx', src).map((f) => f.text)).toEqual([
      '#fff',
      'rgba(0, 0, 0, 0.5)',
      'hsl(10, 20%, 30%)',
      'color: white',
      'color: black',
    ]);
  });
});

describe('string ratchet', () => {
  it('finds no literal UI strings outside the catalogue beyond the baseline', () => {
    const findings = sourceFiles()
      .filter((f) => !isCatalogue(f))
      .flatMap((f) => uiStringLiterals(f, readSource(f)));
    expect({ counts: counts(findings), findings }).toEqual({
      counts: STRING_BASELINE,
      findings: findings.filter((f) => (STRING_BASELINE[f.file] ?? 0) > 0),
    });
  });

  it('bites: detects JSX text, literal children and user-facing props', () => {
    const src = `
      const a = <Text>Hello</Text>;
      const b = <Text>{'Literal child'}</Text>;
      const c = <Pressable accessibilityLabel="Open menu" />;
      const d = { title: 'Home', tabBarLabel: \`Bible\` };
      const e = <Text>{t('tabs.home')}</Text>;
      const f = <Text> 12 · </Text>;
      const g = <View testID="home-screen" />;
      const h = <Text>你好</Text>;
    `;
    expect(uiStringLiterals('x.tsx', src).map((f) => f.text)).toEqual([
      'Hello',
      'Literal child',
      'accessibilityLabel: Open menu',
      'title: Home',
      'tabBarLabel: Bible',
      '你好',
    ]);
  });
});

// Verifier round 1 on the orchestrator's code (GPT-6.1 Sol): forms the first scanners missed.
describe('ratchet scanners (verifier counterexamples)', () => {
  it.each([
    "const x = <Text>{'Hello ' + name}</Text>;",
    "const x = <Pressable accessibilityLabel={'Open ' + name} />;",
    "Alert.alert('Delete note', 'Are you sure?');",
    "const x = <Text>{ok ? 'Yes' : t('no')}</Text>;",
    'const x = <>{`Hi ${name}`}</>;',
  ])('string ratchet rejects literal UI text: %s', (source) => {
    expect(uiStringLiterals('app/(tabs)/x.tsx', source).length).toBeGreaterThan(0);
  });

  it.each([
    "const x = <Text>{t('tabs.home')}</Text>;",
    "const x = <Text>{t('a') + ' · ' + t('b')}</Text>;",
    "const x = <Pressable accessibilityLabel={t('tabs.home.a11y')} />;",
    "const x = <View>{items['key']}</View>;",
    "const x = <View>{Platform.OS === 'ios' ? <A /> : <B />}</View>;",
  ])('string ratchet allows catalogue lookups: %s', (source) => {
    expect(uiStringLiterals('app/(tabs)/x.tsx', source)).toEqual([]);
  });

  it.each([
    "const part='fff'; const x=<Text style={{color:`#${part}`}}/>;",
    "const x=<Text style={{color:'rebeccapurple'}}/>;",
    "const x={color:'#11223344'};",
    "const x={backgroundColor:'Tomato'};",
  ])('token ratchet rejects raw colours: %s', (source) => {
    expect(colourLiterals('app/(tabs)/x.tsx', source).length).toBeGreaterThan(0);
  });

  it.each(["const x={color: theme.colors.text};", "const id = `item-${n}`;", "const x={color:'transparent'};"])(
    'token ratchet allows theme tokens and ordinary strings: %s',
    (source) => {
      expect(colourLiterals('x.tsx', source)).toEqual([]);
    },
  );
});

// Verifier round 2 on the orchestrator's code (GPT-6.1 Sol): a repeat of the same class.
describe('ratchet scanners (verifier round 2)', () => {
  it.each([
    "const x = <Text>{['Home', 'Bible'].join(' / ')}</Text>;",
    "const x = <Pressable accessibilityLabel={'Open menu'.trim()} />;",
    "Alert.alert('Delete note'.trim(), 'Are you sure?'.trim());",
    "const x = <Text>{format('Chapter {n}', n)}</Text>;",
  ])('string ratchet rejects call-wrapped literal UI text: %s', (source) => {
    expect(uiStringLiterals('app/(tabs)/x.tsx', source).length).toBeGreaterThan(0);
  });

  it.each([
    "const x = <Text>{t('tabs.home', { n: 3 })}</Text>;",
    "const x = <Text>{i18n.t('tabs.home')}</Text>;",
    "const x = <Text>{formatNumber(1189)}</Text>;",
    "const x = <Text style={{ fontFamily: uiFace(theme.type.ui, '700') }}>{t('a')}</Text>;",
  ])('string ratchet still allows catalogue calls and non-text calls: %s', (source) => {
    expect(uiStringLiterals('app/(tabs)/x.tsx', source)).toEqual([]);
  });

  it.each([
    "const x = <Text style={{color: active ? 'rebeccapurple' : theme.colors.text}} />;",
    "const x = { 'color': 'red' };",
    "const part = 'fff'; const x = {color: '#' + part};",
    "const x = { borderColor: (dim && 'gray') || theme.colors.muted };",
  ])('token ratchet rejects raw colours: %s', (source) => {
    expect(colourLiterals('app/(tabs)/x.tsx', source).length).toBeGreaterThan(0);
  });

  it.each([
    "const x = { color: active ? theme.colors.tabOn : theme.colors.tabOff };",
    "const label = '#' + n;",
    "const x = { 'fontFamily': 'Literata' };",
  ])('token ratchet still allows non-colour strings: %s', (source) => {
    expect(colourLiterals('x.tsx', source)).toEqual([]);
  });
});

// Verifier round 3 on the scanners (GPT-6.1 Sol): a false positive and a mutant-killing check.
describe('ratchet scanners (verifier round 3)', () => {
  it.each([
    "const x = <Text>{value as 'short' | 'long'}</Text>;",
    "const x = <Text>{value satisfies 'short' | 'long'}</Text>;",
    "const x = <Text>{(value as Record<'a' | 'b', string>).a}</Text>;",
  ])('string ratchet ignores type-only literals: %s', (source) => {
    expect(uiStringLiterals('app/(tabs)/x.tsx', source)).toEqual([]);
  });

  it('string ratchet still sees the text beside a type assertion', () => {
    expect(uiStringLiterals('x.tsx', "const x = <Text>{('Hello' as string)}</Text>;").length).toBeGreaterThan(0);
  });

  it('token ratchet rejects a literal fallback colour after ??', () => {
    expect(colourLiterals('app/(tabs)/x.tsx', "const x = { color: customColor ?? 'red' };").length).toBeGreaterThan(0);
  });
});

// Follow-up to R-0's 5a stop (Sol round 3, F2): colours chosen through calls and element access.
describe('ratchet scanners (R-0 follow-up: colour selections)', () => {
  it.each([
    "const x = <Text style={{ color: Platform.select({ ios: 'red', android: 'blue', default: 'black' }) }} />;",
    "const x = { color: ['red', 'blue'][index] };",
    "const x = { backgroundColor: Platform.select({ web: '#fff', default: theme.colors.base }) };",
    "const x = { color: pick(active, 'tomato', theme.colors.text) };",
    "const x = { tintColor: ({ on: 'red', off: 'gray' } as const)[state] };",
  ])('token ratchet rejects colour literals picked by a call or an index: %s', (source) => {
    expect(colourLiterals('app/(tabs)/x.tsx', source).length).toBeGreaterThan(0);
  });

  it.each([
    "const x = { color: Platform.select({ ios: theme.colors.text, default: theme.colors.muted }) };",
    "const x = { color: palette[state] };",
    "const x = { color: theme.colors[key] };",
    "const x = { color: withAlpha(theme.colors.text, 0.5) };",
    "const x = { fontFamily: Platform.select({ ios: 'Literata', default: 'serif' }) };",
  ])('token ratchet allows theme-driven selections and non-colour props: %s', (source) => {
    expect(colourLiterals('x.tsx', source)).toEqual([]);
  });
});
