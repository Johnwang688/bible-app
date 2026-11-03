# Firebase App Check: monitor now, enforce later

App Check lets Firebase and our backend tell requests from **our** apps apart from scripts that reuse the public
Firebase config. Project: `bible-app-492520`.

## What is on now (monitor mode)

| Piece | State |
| --- | --- |
| Web client (`client/src/auth/appCheck.ts`) | reCAPTCHA Enterprise, score-based, site key `6Lf1Yg0uAAAAAOFcnwDwi4LNyGO0_MgrmjAa4duG` (public). Started from `getFirebaseDb()` and from the first account API call (`getAppCheckTokenForRequest`; the Under 13 delete runs signed out and never creates Firestore), never from Auth alone, so a signed-out app that makes no account call never loads reCAPTCHA. Firestore attaches the token itself; the account API waits up to 3 s for one and sends it in `X-Firebase-AppCheck` (without one, the request still goes). |
| iOS / Android (`client/src/auth/appCheck.native.ts`) | **No provider yet**: no token is sent. Needs `@react-native-firebase/app-check` (not approved), native Firebase apps for iOS and Android, App Attest / Play Integrity, and an EAS build. |
| Firestore | App Check enforcement `UNENFORCED`: requests are counted (verified / unverified), none are refused. |
| Backend (`app/core/app_check.py`) | `APP_CHECK_MODE=monitor` (the default): a missing or invalid token is a log warning (`App Check token missing` / `App Check token invalid: <exception type>`), the request goes on. Checked only after the Firebase ID token is accepted. The check never holds a request long: monitor mode waits at most 0.25 s (a slower verification logs its outcome when it ends), enforce mode at most 5 s (then 503); the key fetch has a 3 s timeout and is throttled (an unknown key id refetches at most once a minute; a failed fetch is not retried for 5 s). |

Client switches: `EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY` overrides the site key; `off` (or a blank value) turns
App Check off. It is always off when the Firebase emulators are on (`EXPO_PUBLIC_FIREBASE_EMULATORS=1`).

Backend values of `APP_CHECK_MODE`: `monitor` (default; a blank value is the default too), `enforce`, `off`.
Anything else is treated as `enforce` (fail closed) and logged once as `Unknown APP_CHECK_MODE`.

## Reading the metrics

- **Firestore:** Firebase console → App Check → **APIs** → **Cloud Firestore**. The chart splits requests into
  *Verified*, *Unverified: outdated client*, *Unverified: unknown origin* and *Unverified: invalid*.
- **Backend:** Cloud Logging for the backend's Cloud Run service, filter on `"App Check token"`. Count those warnings
  against the account requests in the same window.

## When to enforce

Only when **both** hold:

1. The web beta shows mostly *Verified* requests for a few weeks (unverified ones are then old clients or abuse,
   not our users), and
2. **native attestation exists** (App Attest on iOS, Play Integrity on Android) and the native apps' requests show as
   verified. Until then every iOS and Android request is unverified: enforcing Firestore would break native sync for
   every signed-in user, and enforcing the backend would break "delete my data" on native.

Before enforcing the **backend**, also check the account delete (`DELETE /api/v1/account`) on its own:

- Filter the backend logs on `App Check token` for the delete requests. Deletes from the web must show (almost) no
  `App Check token missing`. Both web deletes carry a token: the ordinary delete (Firestore has started App Check) and
  the **Under 13 delete** offered to a signed-out user after the age gate signed them out (it never creates
  Firestore; the account API starts App Check itself, from `client/src/auth/appCheck.ts`). If that one shows
  `missing`, enforcing would make every Under 13 delete on the web a 401, and the child's account could not be
  deleted from the offer: do not enforce.
- The account API waits at most 3 s for a token (reCAPTCHA's first token can be slow on a poor connection) and then
  sends the request without one. In enforce mode such a request is a 401 and the delete fails with an error; a high
  share of `missing` on deletes means that wait is too short for real users.
- Native deletes (iOS, Android) send no token until native attestation exists (above), and that includes the Under
  13 delete on native: enforcing the backend before then makes every native delete a 401.

## Switching to enforce

### Firestore

Either the console (App Check → APIs → Cloud Firestore → **Enforce**), or:

```sh
curl -X PATCH \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "x-goog-user-project: bible-app-492520" \
  -H "Content-Type: application/json" \
  "https://firebaseappcheck.googleapis.com/v1/projects/bible-app-492520/services/firestore.googleapis.com?updateMask=enforcementMode" \
  -d '{"enforcementMode":"ENFORCED"}'
```

Enforcement can take up to about 15 minutes to apply. Check the current value with a `GET` on the same URL (without
`?updateMask=...` and `-d`).

### Backend

Set `APP_CHECK_MODE=enforce` on its Cloud Run service (replace `<service>` and `<region>` with the deployed ones):

```sh
gcloud run services update <service> --region <region> --project bible-app-492520 \
  --update-env-vars APP_CHECK_MODE=enforce
```

In enforce mode a missing or invalid token is a 401 (`Invalid token`, `WWW-Authenticate: Bearer`, the same as a bad
ID token), and a check that cannot run (key fetch, network, credentials) or does not finish within 5 s is a 503.

## Rolling back

- Firestore: the same `curl` with `{"enforcementMode":"UNENFORCED"}` (or the console's **Unenforce**).
- Backend: `--update-env-vars APP_CHECK_MODE=monitor` (or `off` to stop verifying altogether).

## The reCAPTCHA key's domains

The reCAPTCHA Enterprise key only issues tokens on its allowed domains: `bible-app-492520.web.app`,
`bible-app-492520.firebaseapp.com` and `localhost`. **Add any new web domain** (a custom domain, a preview host) in
Google Cloud console → Security → reCAPTCHA → the key → Domains, before shipping the web app there; otherwise its
requests show as unverified, and in enforce mode they are refused.
