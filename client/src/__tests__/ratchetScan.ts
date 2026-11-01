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
const NAMED = /^(white|black|red|green|blue|yellow|orange|purple|pink|gray|grey|brown|cyan|magenta|navy|teal|silver|gold|maroon|olive|lime|aqua|fuchsia)$/i;
const COLOR_PROP = /colou?r$|^(background|tint|fill|stroke)$/i;

export function colourLiterals(file: string, text: string): Finding[] {
  const sf = parse(file, text);
  const found: Finding[] = [];
  for (const lit of stringLiterals(sf)) {
    if (HEX.test(lit.text) || COLOR_FN.test(lit.text)) found.push({ file, line: lineOf(sf, lit), text: lit.text });
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

const HAS_LETTERS = /\p{L}/u;

export function uiStringLiterals(file: string, text: string): Finding[] {
  const sf = parse(file, text);
  const found: Finding[] = [];
  const visit = (node: ts.Node) => {
    if (ts.isJsxText(node) && HAS_LETTERS.test(node.text)) {
      found.push({ file, line: lineOf(sf, node), text: node.text.trim() });
    }
    if (ts.isJsxExpression(node) && node.expression && ts.isJsxElement(node.parent) && isTextLiteral(node.expression)) {
      found.push({ file, line: lineOf(sf, node), text: literalText(node.expression) });
    }
    if ((ts.isJsxAttribute(node) || ts.isPropertyAssignment(node)) && node.initializer) {
      const name = node.name.getText(sf).replace(/^['"]|['"]$/g, '');
      if (UI_PROPS.has(name)) {
        let init: ts.Node = node.initializer;
        if (ts.isJsxExpression(init) && init.expression) init = init.expression;
        if (isTextLiteral(init)) found.push({ file, line: lineOf(sf, init), text: `${name}: ${literalText(init)}` });
      }
    }
    ts.forEachChild(node, visit);
  };
  visit(sf);
  return found;
}

function isTextLiteral(node: ts.Node): boolean {
  if (ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node)) return HAS_LETTERS.test(node.text);
  if (ts.isTemplateExpression(node)) return HAS_LETTERS.test(node.head.text) || node.templateSpans.some((s) => HAS_LETTERS.test(s.literal.text));
  return false;
}

function literalText(node: ts.Node): string {
  return ts.isStringLiteral(node) || ts.isNoSubstitutionTemplateLiteral(node) ? node.text : node.getText();
}
