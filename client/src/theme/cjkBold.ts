/** Extend each separately registered bold UI face with a real local bold face for CJK only. */
export function cjkBoldStyles(): string {
  return ['SpaceGrotesk_700Bold', 'PlusJakartaSans_700Bold', 'PlusJakartaSans_800ExtraBold'].map((family) => `
@font-face {
  font-family: '${family}';
  src: local('Microsoft YaHei Bold'), local('PingFang SC Semibold'), local('Noto Sans CJK SC Bold'), local('Noto Sans SC Bold');
  font-weight: normal;
  font-style: normal;
  unicode-range: U+2E80-9FFF, U+F900-FAFF, U+FE30-FE4F, U+20000-2FA1F;
}`).join('\n');
}
