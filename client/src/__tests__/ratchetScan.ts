// Source scanners for the token and string ratchets. Uses the TypeScript parser, so comments
// and type positions never count, and only real literals in code do.
import * as fs from 'fs';
import * as path from 'path';
import * as ts from 'typescript';

export interface Finding {
  file: string;
  line: number;
  text: string;
}

const SRC = path.resolve(__dirname, '..');

/** Every non-test .ts/.tsx file under src/, as paths relative to src/ with forward slashes. */
export function sourceFiles(): string[] {
  const out: string[] = [];
  const walk = (dir: string) => {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        if (entry.name === '__tests__' || entry.name === 'node_modules') continue;
        walk(full);
      } else if (/\.(ts|tsx)$/.test(entry.name) && !/\.(test|spec)\.tsx?$/.test(entry.name) && !entry.name.endsWith('.d.ts')) {
        out.push(path.relative(SRC, full).split(path.sep).join('/'));
      }
    }
  };
  walk(SRC);
  return out.sort();
}

export function readSource(rel: string): string {
  return fs.readFileSync(path.join(SRC, rel), 'utf8');
}

function parse(file: string, text: string): ts.SourceFile {
  return ts.createSourceFile(file, text, ts.ScriptTarget.Latest, true, file.endsWith('.tsx') ? ts.ScriptKind.TSX : ts.ScriptKind.TS);
}

function lineOf(sf: ts.SourceFile, node: ts.Node): number {
  return sf.getLineAndCharacterOfPosition(node.getStart(sf)).line + 1;
}

function isTypePosition(node: ts.Node): boolean {
  for (let n: ts.Node | undefined = node.parent; n; n = n.parent) {
    if (ts.isTypeNode(n) || ts.isImportDeclaration(n) || ts.isExportDeclaration(n)) return true;
    if (ts.isStatement(n) || ts.isExpressionStatement(n)) return false;
  }
  return false;
}

/**
 * Visits the value children of a node, never descending into type nodes: in `x as 'a' | 'b'`,
 * `x satisfies T`, `<T>x` and `f<'a'>` the literals in the type are never rendered, but the
 * expression part still is. `class A extends B<'x'>` keeps `B` and drops the type arguments.
 */
function forEachValueChild(node: ts.Node, cb: (child: ts.Node) => void): void {
  ts.forEachChild(node, (child) => {
    if (ts.isExpressionWithTypeArguments(child)) cb(child.expression);
    else if (!ts.isTypeNode(child)) cb(child);
  });
}

function stringLiterals(sf: ts.SourceFile): (ts.StringLiteral | ts.NoSubstitutionTemplateLiteral | ts.TemplateLiteralLikeNode)[] {
  const out: (ts.StringLiteral | ts.NoSubstitutionTemplateLiteral | ts.TemplateLiteralLikeNode)[] = [];
  const visit = (node: ts.Node) => {
    if (
      (ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node) || ts.isTemplateHead(node) || ts.isTemplateMiddle(node) || ts.isTemplateTail(node)) &&
      !isTypePosition(node)
    ) {
      out.push(node);
    }
    ts.forEachChild(node, visit);
  };
  visit(sf);
  return out;
}

// ---- Token ratchet: no raw colour literals outside src/theme ----

const HEX = /#[0-9a-f]{3,8}\b/i;
const COLOR_FN = /\b(rgba?|hsla?|hwb|lab|lch|oklab|oklch)\s*\(/i;
/** Every CSS named colour (CSS Color 4), so a named colour in a colour prop never slips through. */
const NAMED = new RegExp(
  `^(${[
    'aliceblue', 'antiquewhite', 'aqua', 'aquamarine', 'azure', 'beige', 'bisque', 'black', 'blanchedalmond', 'blue', 'blueviolet', 'brown', 'burlywood', 'cadetblue', 'chartreuse', 'chocolate', 'coral', 'cornflowerblue', 'cornsilk', 'crimson', 'cyan', 'darkblue', 'darkcyan', 'darkgoldenrod', 'darkgray', 'darkgreen', 'darkgrey', 'darkkhaki', 'darkmagenta', 'darkolivegreen', 'darkorange', 'darkorchid', 'darkred', 'darksalmon', 'darkseagreen', 'darkslateblue', 'darkslategray', 'darkslategrey', 'darkturquoise', 'darkviolet', 'deeppink', 'deepskyblue', 'dimgray', 'dimgrey', 'dodgerblue', 'firebrick', 'floralwhite', 'forestgreen', 'fuchsia', 'gainsboro', 'ghostwhite', 'gold', 'goldenrod', 'gray', 'green', 'greenyellow', 'grey', 'honeydew', 'hotpink', 'indianred', 'indigo', 'ivory', 'khaki', 'lavender', 'lavenderblush', 'lawngreen', 'lemonchiffon', 'lightblue', 'lightcoral', 'lightcyan', 'lightgoldenrodyellow', 'lightgray', 'lightgreen', 'lightgrey', 'lightpink', 'lightsalmon', 'lightseagreen', 'lightskyblue', 'lightslategray', 'lightslategrey', 'lightsteelblue', 'lightyellow', 'lime', 'limegreen', 'linen', 'magenta', 'maroon', 'mediumaquamarine', 'mediumblue', 'mediumorchid', 'mediumpurple', 'mediumseagreen', 'mediumslateblue', 'mediumspringgreen', 'mediumturquoise', 'mediumvioletred', 'midnightblue', 'mintcream', 'mistyrose', 'moccasin', 'navajowhite', 'navy', 'oldlace', 'olive', 'olivedrab', 'orange', 'orangered', 'orchid', 'palegoldenrod', 'palegreen', 'paleturquoise', 'palevioletred', 'papayawhip', 'peachpuff', 'peru', 'pink', 'plum', 'powderblue', 'purple', 'rebeccapurple', 'red', 'rosybrown', 'royalblue', 'saddlebrown', 'salmon', 'sandybrown', 'seagreen', 'seashell', 'sienna', 'silver', 'skyblue', 'slateblue', 'slategray', 'slategrey', 'snow', 'springgreen', 'steelblue', 'tan', 'teal', 'thistle', 'tomato', 'turquoise', 'violet', 'wheat', 'white', 'whitesmoke', 'yellow', 'yellowgreen',
  ].join('|')})$`,
  'i',
);
const COLOR_PROP = /colou?r$|^(background|tint|fill|stroke)$/i;

export function colourLiterals(file: string, text: string): Finding[] {
  const sf = parse(file, text);
  const found: Finding[] = [];
  for (const lit of stringLiterals(sf)) {
    // A template piece ending in '#' builds a hex colour from a substitution: `#${part}`.
    const buildsHex = !ts.isStringLiteral(lit) && !ts.isNoSubstitutionTemplateLiteral(lit) && /#$/.test(lit.text);
    if (HEX.test(lit.text) || COLOR_FN.test(lit.text) || buildsHex) found.push({ file, line: lineOf(sf, lit), text: lit.text });
  }
  const visit = (node: ts.Node) => {
    if ((ts.isPropertyAssignment(node) || ts.isJsxAttribute(node)) && node.initializer) {
      const name = propName(sf, node.name);
      if (name !== undefined && COLOR_PROP.test(name)) {
        for (const hit of colourValueHits(node.initializer)) {
          found.push({ file, line: lineOf(sf, hit.node), text: `${name}: ${hit.text}` });
        }
      }
    }
    forEachValueChild(node, visit);
  };
  visit(sf);
  return found;
}

/** The name of a property or attribute without quotes: `color`, `'color'`, `["color"]` all give `color`. */
function propName(sf: ts.SourceFile, name: ts.PropertyName | ts.JsxAttributeName): string | undefined {
  if (ts.isIdentifier(name) || ts.isStringLiteral(name) || ts.isNoSubstitutionTemplateLiteral(name) || ts.isNumericLiteral(name)) return name.text;
  if (ts.isComputedPropertyName(name)) {
    const e = name.expression;
    return ts.isStringLiteral(e) || ts.isNoSubstitutionTemplateLiteral(e) ? e.text : undefined;
  }
  if (ts.isJsxNamespacedName(name)) return `${name.namespace.text}:${name.name.text}`;
  return name.getText(sf).replace(/^['"`]|['"`]$/g, '');
}

/** Strips wrappers that leave the value unchanged: parentheses, `as`, `satisfies`, `!`, `<T>x`, `{...}` in JSX. */
function unwrap(n: ts.Node): ts.Node {
  for (;;) {
    if (ts.isJsxExpression(n) && n.expression) n = n.expression;
    else if (ts.isParenthesizedExpression(n) || ts.isAsExpression(n) || ts.isSatisfiesExpression(n) || ts.isNonNullExpression(n) || ts.isTypeAssertionExpression(n)) n = n.expression;
    else return n;
  }
}

const LOGICAL = new Set<ts.SyntaxKind>([ts.SyntaxKind.AmpersandAmpersandToken, ts.SyntaxKind.BarBarToken, ts.SyntaxKind.QuestionQuestionToken]);

/** The leftmost operand of a `+` chain: `'#' + a + b` is `('#' + a) + b`. */
function leftmostOfPlus(n: ts.Node): ts.Node {
  n = unwrap(n);
  while (ts.isBinaryExpression(n) && n.operatorToken.kind === ts.SyntaxKind.PlusToken) n = unwrap(n.left);
  return n;
}

/**
 * Raw colours among the values a colour property can take: through conditionals (both branches),
 * `&&` / `||` / `??` (both sides), wrappers, and `'#' + part` (a hex colour built by concatenation).
 */
function colourValueHits(value: ts.Node): { node: ts.Node; text: string }[] {
  const out: { node: ts.Node; text: string }[] = [];
  const walk = (raw: ts.Node) => {
    const n = unwrap(raw);
    if (ts.isStringLiteral(n) || ts.isNoSubstitutionTemplateLiteral(n)) {
      if (NAMED.test(n.text.trim())) out.push({ node: n, text: n.text });
      return;
    }
    if (ts.isConditionalExpression(n)) {
      walk(n.whenTrue);
      walk(n.whenFalse);
      return;
    }
    if (ts.isBinaryExpression(n) && LOGICAL.has(n.operatorToken.kind)) {
      walk(n.left);
      walk(n.right);
      return;
    }
    if (ts.isBinaryExpression(n) && n.operatorToken.kind === ts.SyntaxKind.PlusToken) {
      const first = leftmostOfPlus(n);
      if ((ts.isStringLiteral(first) || ts.isNoSubstitutionTemplateLiteral(first)) && /#$/.test(first.text)) {
        out.push({ node: first, text: n.getText() });
      }
    }
  };
  walk(value);
  return out;
}

// ---- String ratchet: no literal UI strings outside the message catalogue ----

/**
 * Props and option keys whose string values are shown to (or read out to) the reader.
 * (`message` is left out: Error messages are developer diagnostics; the UI shows catalogue text.)
 */
const UI_PROPS = new Set([
  'title',
  'label',
  'placeholder',
  'accessibilityLabel',
  'accessibilityHint',
  'aria-label',
  'alt',
  'tabBarLabel',
  'tabBarAccessibilityLabel',
  'headerTitle',
  'headerBackTitle',
]);

/** Calls whose string arguments are shown to the reader directly. */
const UI_CALLS = new Set(['Alert.alert', 'Alert.prompt', 'ToastAndroid.show', 'alert', 'confirm', 'window.alert', 'window.confirm']);

const HAS_LETTERS = /\p{L}/u;

export function uiStringLiterals(file: string, text: string): Finding[] {
  const sf = parse(file, text);
  const found: Finding[] = [];
  const report = (expr: ts.Node, label?: string) => {
    for (const lit of textLiteralsIn(expr)) {
      found.push({ file, line: lineOf(sf, lit), text: label ? `${label}: ${literalText(lit)}` : literalText(lit) });
    }
  };
  const visit = (node: ts.Node) => {
    if (ts.isJsxText(node) && HAS_LETTERS.test(node.text)) {
      found.push({ file, line: lineOf(sf, node), text: node.text.trim() });
    }
    // Rendered children: {'x'}, {'Hello ' + name}, {ok ? 'Yes' : 'No'}, {`Hi ${name}`}.
    if (ts.isJsxExpression(node) && node.expression && (ts.isJsxElement(node.parent) || ts.isJsxFragment(node.parent))) {
      report(node.expression);
    }
    if ((ts.isJsxAttribute(node) || ts.isPropertyAssignment(node)) && node.initializer) {
      const name = propName(sf, node.name);
      if (name !== undefined && UI_PROPS.has(name)) {
        let init: ts.Node = node.initializer;
        if (ts.isJsxExpression(init) && init.expression) init = init.expression;
        report(init, name);
      }
    }
    if (ts.isCallExpression(node) && UI_CALLS.has(node.expression.getText(sf))) {
      for (const arg of node.arguments) report(arg, node.expression.getText(sf));
    }
    forEachValueChild(node, visit);
  };
  visit(sf);
  return found;
}

/**
 * String literals with letters inside an expression, through concatenation, conditionals,
 * templates, parentheses and calls (callee and arguments: `'Open'.trim()`, `format('Ch {n}', n)`).
 * Only catalogue lookups are skipped: `t('tabs.home')` and `i18n.t('tabs.home')` pass a key.
 */
const COMPARISON = new Set<ts.SyntaxKind>([
  ts.SyntaxKind.EqualsEqualsEqualsToken,
  ts.SyntaxKind.ExclamationEqualsEqualsToken,
  ts.SyntaxKind.EqualsEqualsToken,
  ts.SyntaxKind.ExclamationEqualsToken,
  ts.SyntaxKind.InKeyword,
  ts.SyntaxKind.InstanceOfKeyword,
]);

function textLiteralsIn(expr: ts.Node): ts.Node[] {
  const out: ts.Node[] = [];
  const walk = (n: ts.Node) => {
    if (isTextLiteral(n)) {
      out.push(n);
      return;
    }
    if (ts.isArrowFunction(n) || ts.isFunctionExpression(n)) return; // bodies are not the rendered value
    if ((ts.isCallExpression(n) || ts.isTaggedTemplateExpression(n)) && isCatalogueLookup(ts.isCallExpression(n) ? n.expression : n.tag)) return;
    if (ts.isPropertyAssignment(n)) {
      walk(n.initializer); // the key is not text, the value may be
      return;
    }
    if (ts.isJsxElement(n) || ts.isJsxSelfClosingElement(n) || ts.isJsxFragment(n)) return; // visited on their own
    if (ts.isElementAccessExpression(n)) return; // obj['key'] is a lookup, not text
    if (ts.isBinaryExpression(n) && COMPARISON.has(n.operatorToken.kind)) return; // Platform.OS === 'ios'
    forEachValueChild(n, walk);
  };
  walk(expr);
  return out;
}

/** `t(...)`, `i18n.t(...)`, `t?.(...)`: the callee is the identifier `t` or a property access ending in `.t`. */
function isCatalogueLookup(callee: ts.Expression): boolean {
  let c: ts.Node = callee;
  while (ts.isParenthesizedExpression(c) || ts.isNonNullExpression(c) || ts.isAsExpression(c)) c = c.expression;
  if (ts.isIdentifier(c)) return c.text === 't';
  if (ts.isPropertyAccessExpression(c)) return c.name.text === 't';
  return false;
}

function isTextLiteral(node: ts.Node): boolean {
  if (ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node)) return HAS_LETTERS.test(node.text);
  if (ts.isTemplateExpression(node)) return HAS_LETTERS.test(node.head.text) || node.templateSpans.some((s) => HAS_LETTERS.test(s.literal.text));
  return false;
}

function literalText(node: ts.Node): string {
  return ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node) ? node.text : node.getText();
}
