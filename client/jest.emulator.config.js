// Emulator suites (R-6b): Firestore rules and the Firestore adapter against the local emulators.
// Run with `npm run test:emulator` (needs Java 21+ and the firebase CLI). `npx jest` never runs them.
module.exports = {
  preset: 'jest-expo/node',
  testMatch: ['<rootDir>/src/**/*.emu.ts'],
  testPathIgnorePatterns: ['/node_modules/', '/dist/'],
  setupFilesAfterEnv: ['<rootDir>/jest.setup.ts'],
  testTimeout: 30000,
  maxWorkers: 1,
};
