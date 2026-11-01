// Verbatim copy of the design canvas theme code (Presets page of
// https://claude.ai/artifact/9qzaFmKVKTnGkgUWDxRqnN), copied 2026-11-01.
// Do not edit by hand: re-copy it when John changes a preset. canvas.test.ts runs it
// as the oracle for src/theme/palettes.ts and src/theme/build.ts.
var POP_UI = "'Space Grotesk', system-ui, sans-serif";
var GLOW_UI = "'Plus Jakarta Sans', system-ui, sans-serif";

function popLight(p) {
  var ink = "#1B1B1F", line = "2.5px solid " + ink;
  return {
    bg: p.bg, text: ink, muted: "#45434D", surface: "#FFFFFF", border: line, radius: "16px",
    shadow: "4px 4px 0 " + ink, blur: "none",
    accent: p.ink, onAccent: "#FFFFFF", cta: p.cta, onCta: ink, ctaShadow: "3px 3px 0 " + ink,
    hl: p.hl, vnum: p.ink,
    ui: POP_UI, head: POP_UI, scripture: "Literata, Georgia, serif", headW: "700", headSize: "34px", headLs: "-1px",
    chip: p.c1, chipText: ink, track: p.bg, bar: ink, btnRadius: "12px", btnBorder: line,
    c1: p.c1, c1t: ink, c1m: "#3A3640", c2: "#FFFFFF", c3: p.c3, c3t: ink, c3m: "#3A3640",
    tabBg: "#FFFFFF", tabBorder: line, tabOn: ink, tabOff: "#55525C", tabPill: p.cta,
    sheet: "#FFFFFF", sheetBorder: line, sheetRadius: "22px", sheetShadow: "none", btn: p.bg,
    swatchRadius: "12px", grabber: ink
  };
}
function popDark(p) {
  var ink = "#17161C", line = "2.5px solid " + p.line;
  return {
    bg: p.bg, text: "#FBF6EF", muted: "#CFC9D2", surface: p.surface, border: line, radius: "16px",
    shadow: "4px 4px 0 " + p.pop, blur: "none",
    accent: p.pop, onAccent: ink, cta: p.pop, onCta: ink, ctaShadow: "3px 3px 0 " + p.line,
    hl: p.hl, hlText: p.cardText, vnum: p.pop,
    ui: POP_UI, head: POP_UI, scripture: "Literata, Georgia, serif", headW: "700", headSize: "34px", headLs: "-1px",
    chip: p.c1, chipText: p.cardText, track: p.bg, bar: p.pop, btnRadius: "12px", btnBorder: line,
    c1: p.c1, c1t: p.cardText, c1m: p.cardMuted, c2: p.surface, c3: p.c3, c3t: p.cardText, c3m: p.cardMuted,
    tabBg: p.bg, tabBorder: line, tabOn: ink, tabOff: "#BDB6C2", tabPill: p.pop,
    sheet: p.surface, sheetBorder: line, sheetRadius: "22px", sheetShadow: "none", btn: p.bg, btnText: "#FBF6EF",
    swatchRadius: "12px", grabber: p.line
  };
}
function sky(p) {
  return "radial-gradient(90% 55% at 0% 0%, " + p.a + " 0%, transparent 70%), " +
    "radial-gradient(80% 50% at 100% 42%, " + p.b + " 0%, transparent 70%), " +
    "radial-gradient(90% 50% at 15% 100%, " + p.c + " 0%, transparent 70%), " + p.base;
}
// Colour behind the glass, so the panes have something to bend and blur. Home only;
// the reader keeps the plain wash so Scripture never sits on the orbs.
function orbs(x, y, z) {
  return "radial-gradient(circle 130px at 86% 19%, " + x + " 0%, " + x + " 55%, transparent 100%), " +
    "radial-gradient(circle 150px at 6% 50%, " + y + " 0%, " + y + " 55%, transparent 100%), " +
    "radial-gradient(circle 120px at 80% 76%, " + z + " 0%, " + z + " 55%, transparent 100%)";
}
function glowLight(p) {
  var sheen = "linear-gradient(135deg, rgba(255, 255, 255, 0.58) 0%, rgba(255, 255, 255, 0.20) 45%, rgba(255, 255, 255, 0.34) 100%)";
  var rim = "inset 1px 1px 0 rgba(255, 255, 255, 0.95), inset -1px -1px 0 rgba(255, 255, 255, 0.40), inset 0 0 22px rgba(255, 255, 255, 0.28), 0 14px 34px " + p.glow;
  var edge = "1px solid rgba(255, 255, 255, 0.7)";
  return {
    bg: orbs(p.b, p.a, p.c) + ", " + sky(p), readerBg: sky(p), text: p.text, muted: p.muted,
    surface: sheen, border: edge, radius: "28px", shadow: rim, blur: "blur(14px) saturate(200%) brightness(1.04)",
    accent: p.accent, onAccent: "#FFFFFF",
    ctaShadow: "inset 0 1px 0 rgba(255, 255, 255, 0.5), inset 0 -3px 8px rgba(0, 0, 0, 0.12), 0 8px 20px " + p.glow,
    hl: p.hl, vnum: p.accent,
    ui: GLOW_UI, head: GLOW_UI, scripture: "'Source Serif 4', Georgia, serif", headW: "700", headSize: "32px", headLs: "-0.8px",
    chip: sheen, chipText: p.text, track: "rgba(255, 255, 255, 0.6)", btnRadius: "999px",
    tabBg: "linear-gradient(135deg, rgba(255, 255, 255, 0.62) 0%, rgba(255, 255, 255, 0.30) 100%)", tabBorder: edge,
    tabOn: p.accent, tabOff: p.muted, tabShadow: rim, float: true,
    sheet: "linear-gradient(160deg, rgba(255, 255, 255, 0.78) 0%, rgba(255, 255, 255, 0.52) 100%)", sheetBorder: edge, sheetRadius: "34px",
    sheetShadow: "inset 1px 1px 0 rgba(255, 255, 255, 0.95), inset 0 0 26px rgba(255, 255, 255, 0.3), 0 -12px 40px " + p.glow,
    btn: "linear-gradient(135deg, rgba(255, 255, 255, 0.66) 0%, rgba(255, 255, 255, 0.28) 100%)"
  };
}
function glowDark(p) {
  var sheen = "linear-gradient(135deg, rgba(255, 255, 255, 0.17) 0%, rgba(255, 255, 255, 0.04) 45%, rgba(255, 255, 255, 0.09) 100%)";
  var rim = "inset 1px 1px 0 rgba(255, 255, 255, 0.38), inset -1px -1px 0 rgba(255, 255, 255, 0.09), inset 0 0 22px rgba(255, 255, 255, 0.06), 0 18px 40px rgba(0, 0, 0, 0.4)";
  var edge = "1px solid rgba(255, 255, 255, 0.22)";
  return {
    bg: orbs(p.b, p.a, p.glow) + ", " + sky(p), readerBg: sky(p), text: p.text, muted: p.muted,
    surface: sheen, border: edge, radius: "28px", shadow: rim, blur: "blur(14px) saturate(190%)",
    accent: p.accent, onAccent: p.onAccent,
    ctaShadow: "inset 0 1px 0 rgba(255, 255, 255, 0.55), inset 0 -3px 8px rgba(0, 0, 0, 0.18), 0 0 24px " + p.glow,
    hl: p.hl, vnum: p.accent,
    ui: GLOW_UI, head: GLOW_UI, scripture: "'Source Serif 4', Georgia, serif", headW: "800", headSize: "31px", headLs: "-0.8px",
    chip: sheen, chipText: p.text, track: "rgba(255, 255, 255, 0.14)", btnRadius: "999px",
    tabBg: "linear-gradient(135deg, rgba(255, 255, 255, 0.18) 0%, rgba(255, 255, 255, 0.05) 100%), " + p.tab, tabBorder: edge,
    tabOn: p.accent, tabOff: p.muted, tabShadow: rim, float: true,
    sheet: "linear-gradient(160deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.03) 45%), " + p.sheet, sheetBorder: edge, sheetRadius: "34px",
    sheetShadow: "inset 1px 1px 0 rgba(255, 255, 255, 0.32), inset 0 0 26px rgba(255, 255, 255, 0.05), 0 -12px 40px rgba(0, 0, 0, 0.45)",
    btn: "linear-gradient(135deg, rgba(255, 255, 255, 0.18) 0%, rgba(255, 255, 255, 0.05) 100%)"
  };
}

var POP_L = [
  { name: "Strawberry milk", bg: "#FFF0F3", c1: "#FFD6E0", c3: "#FFEAF0", cta: "#FFB3C7", hl: "#FFCCDA", ink: "#A62B55" },
  { name: "Matcha latte", bg: "#F1F6EA", c1: "#D4EDC9", c3: "#E8F5DC", cta: "#BFE3A8", hl: "#CDEBBE", ink: "#2F5E22" },
  { name: "Lavender haze", bg: "#F4F0FF", c1: "#DCD3FF", c3: "#ECE7FF", cta: "#C7B8FF", hl: "#DAD0FF", ink: "#4E35B8" }
];
var POP_D = [
  { name: "Bubblegum night", bg: "#1C1619", surface: "#2A2125", line: "#FBE9F0", pop: "#FFA9C4", c1: "#7A4D61", c3: "#5C3A4A", hl: "#6B4356", cardText: "#FFF1F5", cardMuted: "#F2DDE5" },
  { name: "Matcha night", bg: "#151913", surface: "#20271D", line: "#EEF7E8", pop: "#B5DDA2", c1: "#56694A", c3: "#3F4E37", hl: "#4A5C40", cardText: "#F3F8EE", cardMuted: "#DCE8D3" },
  { name: "Grape soda", bg: "#16141F", surface: "#221F30", line: "#EEE9FF", pop: "#C3B4FF", c1: "#625684", c3: "#4A4068", hl: "#554A75", cardText: "#F5F2FF", cardMuted: "#E0DAF5" }
];
var GLOW_L = [
  { name: "Liberty", a: "#F0606B", b: "#5B82E0", c: "#9DB7F5", base: "#F7F8FC", text: "#0B1633", muted: "#3E4A66", accent: "#1E3FA0", hl: "rgba(230, 57, 70, 0.18)", glow: "rgba(30, 63, 160, 0.16)" },
  { name: "Silver", a: "#C4C9D1", b: "#D8DCE2", c: "#B4BBC6", base: "#F2F3F5", text: "#111418", muted: "#4A505A", accent: "#2B323C", hl: "rgba(120, 130, 145, 0.28)", glow: "rgba(20, 24, 30, 0.12)" },
  { name: "Sky", a: "#B9DBF7", b: "#D4E8FA", c: "#C6D6EC", base: "#F1F7FC", text: "#0B1A2B", muted: "#3F5266", accent: "#1F5FAE", hl: "rgba(31, 95, 174, 0.16)", glow: "rgba(20, 60, 110, 0.12)" }
];
var GLOW_D = [
  { name: "Northern lights", a: "#4A2391", b: "#0E6B76", c: "#1B2A6B", base: "#0B0D20", text: "#F4F3FF", muted: "#C6C3E0", accent: "#5EEAD4", onAccent: "#04241F", hl: "rgba(94, 234, 212, 0.26)", glow: "rgba(94, 234, 212, 0.35)", tab: "rgba(18, 16, 44, 0.6)", sheet: "rgba(24, 20, 58, 0.78)" },
  { name: "Graphite", a: "#3A3F48", b: "#2A2E35", c: "#1E2126", base: "#0E0F12", text: "#F3F4F6", muted: "#B8BDC6", accent: "#E5E7EB", onAccent: "#111317", hl: "rgba(229, 231, 235, 0.18)", glow: "rgba(255, 255, 255, 0.16)", tab: "rgba(20, 22, 26, 0.6)", sheet: "rgba(24, 26, 31, 0.82)" },
  { name: "Deep blue", a: "#1E3A7A", b: "#143063", c: "#0F2147", base: "#070E1F", text: "#F1F5FF", muted: "#B7C3DE", accent: "#7FB2FF", onAccent: "#061733", hl: "rgba(127, 178, 255, 0.24)", glow: "rgba(127, 178, 255, 0.3)", tab: "rgba(8, 16, 36, 0.6)", sheet: "rgba(12, 24, 52, 0.82)" }
];

var ALL = []
  .concat(POP_L.map(function (p) { return { name: p.name, style: "Neubrutalist pastel", mode: "Light", sw: [p.bg, p.c1, p.c3, p.cta, p.ink], t: popLight(p) }; }))
  .concat(POP_D.map(function (p) { return { name: p.name, style: "Neubrutalist pastel", mode: "Dark", sw: [p.bg, p.surface, p.c1, p.c3, p.pop], t: popDark(p) }; }))
  .concat(GLOW_L.map(function (p) { return { name: p.name, style: "Aurora glass", mode: "Light", sw: [p.base, p.a, p.b, p.c, p.accent], t: glowLight(p) }; }))
  .concat(GLOW_D.map(function (p) { return { name: p.name, style: "Aurora glass", mode: "Dark", sw: [p.base, p.a, p.b, p.c, p.accent], t: glowDark(p) }; }));


module.exports = { POP_L: POP_L, POP_D: POP_D, GLOW_L: GLOW_L, GLOW_D: GLOW_D, ALL: ALL, popLight: popLight, popDark: popDark, glowLight: glowLight, glowDark: glowDark };
