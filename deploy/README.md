# Backend deploy runbook (Cloud Run)

The FastAPI backend runs as the Cloud Run service **`bible-api`** in project **`bible-app-492520`**,
region **`us-central1`** (next to Firestore).

- **URL:** https://bible-api-593497511935.us-central1.run.app (the client's `EXPO_PUBLIC_API_BASE_URL`)
- **Image:** `us-central1-docker.pkg.dev/bible-app-492520/bible-app/bible-api:<git sha>`, built by Cloud
  Build from the two-stage `Dockerfile`. Stage 1 builds `content.sqlite` from `content/source/` and checks
  every file against the manifest; stage 2 holds only the database, `app/` and the Python deps, and runs
  as a non-root user.
- **Budget:** $20/month on this project, with email alerts to the billing admins at 50%, 90% and 100%.

Every command below passes `--project` explicitly. Never change the global gcloud config (its
defaults point at another project and at `us-south1`).

## Deploy

From a clean checkout of the commit you want live (normally `main`):

```bash
python deploy.py --dry-run        # print the gcloud commands
python deploy.py                  # Cloud Build -> Artifact Registry -> Cloud Run (about 4 minutes)
python deploy/smoke.py --url https://bible-api-593497511935.us-central1.run.app
```

The image is tagged with the commit SHA. Uncommitted changes to the build inputs give a
`<sha>-dirty-<time>` tag, so a dirty deploy is visible in the revision list.

The smoke script replays all 48 golden requests (`tests/golden/`) against the URL and compares them with
the fixtures, then checks `/health` reports `production`, and that CORS allows `http://localhost:8081`
and refuses other origins.

Redeploy an existing image without building: `python deploy.py --image <full image ref>`.

## Secrets

The backend reads these from Secret Manager, mounted as env vars of the same name (`:latest`):
`SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`.
The values come from the repo-root `.env`, which never leaves the machine and is never in the image (the
`.gcloudignore` is an allowlist of the Dockerfile's inputs).

To add or rotate a value, edit `.env`, then:

```bash
python deploy.py --sync-secrets   # creates/updates changed secrets only; values go over stdin, never argv
python deploy.py                  # new revision picks up :latest
```

`--sync-secrets` adds a version only when the value changed (compared byte for byte), destroys every
older version, and grants the runtime service account `secretAccessor` on that one secret. It is safe to
re-run after a failure. `python deploy.py` refuses to deploy while any of the five secrets is missing.
To add a new secret name, add it to `SECRET_ENV_VARS` in `deploy.py`.

Not deployed on purpose: `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `APP_SECRET_KEY` (Settings reads
them, but no code uses them), and `DEFAULT_TRANSLATION` / `OPENAI_MODEL` (the code defaults apply, so
production defaults to BSB).

## Plain settings

`deploy.py` sets exactly two plain env vars (replacing any others):

| Var | Value |
|---|---|
| `APP_ENV` | `production` |
| `CORS_ORIGINS` | `http://localhost:8081,http://127.0.0.1:8081,https://bible-app-492520.web.app,https://bible-app-492520.firebaseapp.com,https://bible-app-492520--beta-preview-hwplo62n.web.app` (the last is B-1's `beta-preview` channel) |

Change the origins with `--cors-origins` or `DEPLOY_CORS_ORIGINS` (comma-separated, exact `http(s)://host[:port]`
origins; `*`, paths, userinfo and bad ports are rejected, because the API sends credentials-enabled CORS).
Origins are rewritten to the form browsers send (lowercase, default port dropped), since the backend
matches them as exact strings. The two
Firebase Hosting domains are the planned web host; add the real one when the web app is hosted.

## Cost guard

| Setting | Value | Why |
|---|---|---|
| min / max instances | 0 / 3 | scales to zero when idle; caps a traffic spike at 3. Both the revision (`--min-instances`) and the service-level (`--min`) minimum are pinned to 0 on every deploy |
| CPU / memory | 1 vCPU / 512 MiB | the content DB is read from the image, not loaded into memory |
| CPU billing | request-based (`--cpu-throttling`, pinned on every deploy) | no CPU charge between requests |
| concurrency / timeout | 80 / 300 s | SQLite reads are cheap; AI chat answers can take tens of seconds |
| Artifact Registry cleanup | keep the newest 3 images, delete the rest after 14 days | `deploy/ar-cleanup-policy.json` |

**At idle it costs about $0.01-0.05 a month**: no instances run, the five secret versions are inside
Secret Manager's free six, Cloud Build is inside its free 2,500 build-minutes, and the images
(about 120 MB each, at most 3 kept) are the only storage.

## Identity and permissions

- Runtime service account: `bible-api@bible-app-492520.iam.gserviceaccount.com`. Its only grant is
  `roles/secretmanager.secretAccessor` on each of the five secrets (per secret, not project-wide). It has
  no project roles. Cloud Run writes request and stdout logs without any role on the service account.
- **R-6b (auth and sync)** will need Firebase Admin / Firestore access for token verification and sync:
  grant `roles/datastore.user` (and, if it mints or manages users, `roles/firebaseauth.admin`) to this
  service account then. The backend uses Application Default Credentials; never add a key file.
- The service is public (`--allow-unauthenticated`); the content API needs no sign-in.

## One-time setup (already done, 2026-11-02)

Kept here so the setup can be repeated in a new project.

```bash
P=bible-app-492520
gcloud services enable run.googleapis.com cloudbuild.googleapis.com artifactregistry.googleapis.com \
  secretmanager.googleapis.com billingbudgets.googleapis.com --project $P
gcloud artifacts repositories create bible-app --repository-format=docker --location=us-central1 --project $P
gcloud artifacts repositories set-cleanup-policies bible-app --location us-central1 --project $P \
  --policy deploy/ar-cleanup-policy.json --no-dry-run
gcloud iam service-accounts create bible-api --display-name="bible-api Cloud Run runtime" --project $P
# --billing-project makes the Budget API bill this project's quota, not the gcloud default project.
gcloud billing budgets create --billing-account=012043-63207E-915034 --billing-project $P \
  --display-name='bible-app-492520 monthly ($20)' --budget-amount=20USD --calendar-period=month \
  --filter-projects=projects/$P \
  --threshold-rule=percent=0.5 --threshold-rule=percent=0.9 --threshold-rule=percent=1.0
python deploy.py --sync-secrets
python deploy.py
```

## Rollback and logs

```bash
gcloud run revisions list --service bible-api --region us-central1 --project bible-app-492520
gcloud run services update-traffic bible-api --to-revisions <revision>=100 --region us-central1 --project bible-app-492520
gcloud logging read 'resource.type="cloud_run_revision" AND resource.labels.service_name="bible-api" AND severity>=ERROR' \
  --project bible-app-492520 --limit 20 --freshness 1d
```

## Legacy services

`bible-api` and `bible-web` in **us-south1** (and the `cloud-run-apps` repository there, about 1.4 GB)
are the old app's deploy from April 2026. They scale to zero, run as the Compute Engine default service
account and hold plain env-var secrets. They are not used by the new client; delete them once nothing
points at them (John's call).
