# Web beta runbook (Firebase Hosting)

Commands were checked against Firebase CLI 15.16 (`firebase --version`). Run every `firebase` command
from the repo root, with `--project bible-app-492520`.

## What it is

- Firebase Hosting site `bible-app-492520`: https://bible-app-492520.web.app (also
  https://bible-app-492520.firebaseapp.com).
- It serves `client/dist`, the static export of the Expo web app (`client/`). Config: `hosting` in the
  repo-root `firebase.json`.
- The build reads `client/.env.production`. The file is committed, holds **public values only**, and
  must never hold a secret. Expo inlines every `EXPO_PUBLIC_*` value into the shipped JavaScript.

| Var | What it does |
| --- | --- |
| `EXPO_PUBLIC_API_BASE_URL` | Backend origin. W5's Cloud Run service `bible-api`. A production build throws if it is unset or not `https`. |
| `EXPO_PUBLIC_RELEASE_CHANNEL` | `beta` marks the build as the web beta (`isBetaBuild()`). |
| `EXPO_PUBLIC_FIREBASE_API_KEY` | Firebase web API key. A public identifier, not a secret. |
| `EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN` | Firebase Auth domain (`bible-app-492520.firebaseapp.com`). |
| `EXPO_PUBLIC_FIREBASE_PROJECT_ID` | Firebase project id (`bible-app-492520`). |
| `EXPO_PUBLIC_FIREBASE_APP_ID` | Firebase web app id. |
| `EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET` | Optional. Storage bucket. |
| `EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID` | Optional. Sender id. |

The app reads them in `client/src/api/config.ts`. Add a new var there and to `.env.production` together.

## Build

From `client/`:

```
npx expo export -p web --output-dir dist
```

Production mode loads `client/.env.production`. A local `client/.env.production.local` overrides it and
is git-ignored. Check that the backend URL got inlined and the localhost fallback did not:

```
grep -l "bible-api-593497511935" dist/_expo/static/js/web/*.js
grep -L "localhost:8000" dist/_expo/static/js/web/*.js
```

The first command must list the entry bundle. The second must list it too (no `localhost:8000` in it).

## Preview

From the repo root, after building:

```
firebase hosting:channel:deploy beta-preview --project bible-app-492520 --expires 7d
```

The command prints the channel URL, `https://bible-app-492520--beta-preview-<hash>.web.app`. Verify the
headers on the real host:

```
curl -sI <url>/
curl -sI <url>/_expo/static/js/web/<entry file>
```

- `/` must show `cache-control: no-cache`, the CSP, `x-content-type-options`, `referrer-policy`,
  `permissions-policy` and `cross-origin-opener-policy`.
- The entry file must show `cache-control: public, max-age=31536000, immutable` and the same security
  headers. If it shows `no-cache`, the later header rules are not overriding the `**` rule: fix
  `firebase.json` before promoting.

The command syncs the channel's domain into Firebase Auth's authorized domains (pass
`--no-authorized-domains` to skip that).

### CORS for previews

The backend allows exact origins only. `deploy.py` sets `CORS_ORIGINS` (owned by W5; see
`deploy/README.md`). A preview channel's origin must be added there, or the preview cannot reach the
API. The backend's owner runs:

```
python deploy.py --cors-origins "<existing list>,https://bible-app-492520--beta-preview-<hash>.web.app"
```

The channel's URL stays the same for the life of the channel, so this is needed once per channel.
Include `https://bible-app-492520.web.app` and `https://bible-app-492520.firebaseapp.com` in the list for
the live site.

## Promote to live

John only, after the phase PRs merge. Either:

```
firebase hosting:clone bible-app-492520:beta-preview bible-app-492520:live --project bible-app-492520
```

This ships exactly what was previewed. Or build from a clean `main` and deploy fresh:

```
firebase deploy --only hosting --project bible-app-492520
```

(`hosting:channel:clone` does not exist in CLI 15.x; the command is `hosting:clone`.)

## Roll back

This CLI version has no command to list releases or versions, so find the previous release in the
console: Firebase console → Hosting → release history → "Roll back" on an earlier release. Roll back
from the console unless you already have the earlier content on a channel, in which case
`firebase hosting:clone bible-app-492520:<channel> bible-app-492520:live --project bible-app-492520`
restores it.

## Channels

```
firebase hosting:channel:list --project bible-app-492520
firebase hosting:channel:delete beta-preview --project bible-app-492520
```

Channels expire on their own (`--expires`, max 30d). Delete a preview you no longer need.

## Headers and CSP

`firebase.json` sets, on every path (`**`):

- `Cache-Control: no-cache`, so the HTML is always revalidated and a new deploy shows up at once.
- `X-Content-Type-Options: nosniff`, `Referrer-Policy: strict-origin-when-cross-origin`,
  `Permissions-Policy` (camera, microphone, geolocation and payment off), and
  `Cross-Origin-Opener-Policy: same-origin-allow-popups` (keeps the Firebase sign-in popup working).
- `Content-Security-Policy`: scripts, objects, framing and the base URL are locked down. `connect-src`
  lists the backend and the Firebase APIs. `style-src` has `'unsafe-inline'` because react-native-web
  and the export's `expo-reset` style tag write inline styles; scripts stay `'self'` only.
  `frame-src` allows the Firebase auth domain.

`/_expo/**` and `/assets/**` get `Cache-Control: public, max-age=31536000, immutable`. They hold only
content-hashed file names. These rules come later in the file so they override `no-cache` for the same
header.

`"ignore": []` is deliberate: the export's font paths contain `node_modules` (and, in worktrees,
`.claude`), which the CLI's default ignores would drop.

Change the CSP when:

- the backend URL changes (new Cloud Run origin: update `connect-src` and `.env.production` together);
- Google sign-in is added: `https://apis.google.com` in `script-src` and `https://accounts.google.com`
  in `frame-src`;
- the app uses any new third-party host (API, font, image, frame). Add the narrowest origin to the
  narrowest directive. Never add `*`, `http:` or `'unsafe-eval'`.

`client/src/__tests__/webHosting.test.ts` checks these rules. Run `npx jest` after editing `firebase.json`.

## Privacy policy

The privacy policy lives at `/privacy` in the app (team B-1; lands separately). Update it whenever the
app starts sending data somewhere new, and update the CSP at the same time.
