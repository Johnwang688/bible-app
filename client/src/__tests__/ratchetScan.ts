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
      const name = node.name.getText(sf);
      let init: ts.Node = node.initializer;
      if (ts.isJsxExpression(init) && init.expression) init = init.expression;
      if (COLOR_PROP.test(name) && (ts.isStringLiteral(init) || ts.isNoSubstitutionTemplateLiteral(init)) && NAMED.test(init.text)) {
        found.push({ file, line: lineOf(sf, init), text: `${name}: ${init.text}` });
      }
    }
    ts.forEachChild(node, visit);
  };
  visit(sf);
  return found;
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
      const name = node.name.getText(sf).replace(/^['"]|['"]$/g, '');
      if (UI_PROPS.has(name)) {
        let init: ts.Node = node.initializer;
        if (ts.isJsxExpression(init) && init.expression) init = init.expression;
        report(init, name);
      }
    }
    if (ts.isCallExpression(node) && UI_CALLS.has(node.expression.getText(sf))) {
      for (const arg of node.arguments) report(arg, node.expression.getText(sf));
    }
    ts.forEachChild(node, visit);
  };
  visit(sf);
  return found;
}

/**
 * String literals with letters inside an expression, through concatenation, conditionals,
 * templates and parentheses. Arguments of calls are skipped: `t('tabs.home')` passes a key.
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
    if (ts.isCallExpression(n) || ts.isNewExpression(n) || ts.isArrowFunction(n) || ts.isFunctionExpression(n)) return;
    if (ts.isJsxElement(n) || ts.isJsxSelfClosingElement(n) || ts.isJsxFragment(n)) return; // visited on their own
    if (ts.isElementAccessExpression(n)) return; // obj['key'] is a lookup, not text
    if (ts.isBinaryExpression(n) && COMPARISON.has(n.operatorToken.kind)) return; // Platform.OS === 'ios'
    ts.forEachChild(n, walk);
  };
  walk(expr);
  return out;
}

function isTextLiteral(node: ts.Node): boolean {
  if (ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node)) return HAS_LETTERS.test(node.text);
  if (ts.isTemplateExpression(node)) return HAS_LETTERS.test(node.head.text) || node.templateSpans.some((s) => HAS_LETTERS.test(s.literal.text));
  return false;
}

function literalText(node: ts.Node): string {
  return ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node) ? node.text : node.getText();
}
