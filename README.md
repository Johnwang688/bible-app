# Open Bible

A Bible study app for teenagers and young adults — Scripture reading, AI-assisted study, chapter summaries, quizzes, and people/places/themes exploration.

The backend and internal docs use the name **Logos Light**.

## Features

- **Reader** — Multiple translations, typography controls, page-flip navigation, highlights, and reading progress
- **AI assistant** — Chat grounded in Scripture and commentary; guided chapter study; entity overviews for themes, people, and places
- **Commentary** — Matthew Henry, Treasury of Scripture Knowledge cross-references, and authored chapter summaries
- **Quizzes & mastery** — Chapter quizzes with hints, rewards, and progress tracking
- **Entity pages** — Browse themes, people, and places linked from chapter summaries

## Tech stack

| Layer      | Technology                                      |
| ---------- | ----------------------------------------------- |
| Backend    | Python 3.14 + FastAPI                           |
| Frontend   | Next.js 15 (React 19, TypeScript, Turbopack)    |
| Database   | Supabase (PostgreSQL + Row Level Security)      |
| Auth       | Supabase Auth (email; Google OAuth supported)   |
| AI         | OpenAI API                                      |
| Deployment | Google Cloud Run (`deploy.py`)                  |

## Project structure

```
bible-app/
├── app/                    # FastAPI backend
│   ├── main.py             # Routes (flat module, not nested routers)
│   ├── core/               # Config, auth, Supabase client
│   ├── schemas/            # Pydantic request/response models
│   ├── services/           # Bible, commentary, AI, quiz, account logic
│   └── prompts/ai/         # AI system prompt fragments
├── frontend-next/          # Next.js app (proxies /api → backend)
├── supabase/migrations/    # SQL schema and seed migrations
├── commentary/             # Chapter summary JSON (offline authoring)
├── quiz-questions/         # Quiz question JSON + generation scripts
├── scripts/                # Data loaders and maintenance utilities
├── docs/                   # Architecture and feature notes
├── tests/
├── start.sh                # Run backend + frontend together (Unix)
├── deploy.py               # Deploy to Google Cloud Run
└── requirements.txt
```

## Getting started

### Prerequisites

- Python 3.14+
- Node.js 20+
- A [Supabase](https://supabase.com) project
- An [OpenAI API key](https://platform.openai.com) (for AI features)

### 1. Backend

```bash
python -m venv .venv

# Windows
.venv\Scripts\activate

# macOS / Linux
source .venv/bin/activate

pip install -r requirements.txt
cp .env.example .env   # fill in keys (see below)
```

Apply database migrations with the Supabase CLI, or run the SQL files in `supabase/migrations/` against your project.

Load chapter summaries (optional, requires service role key):

```bash
python scripts/load_summary.py
```

Start the API:

```bash
uvicorn app.main:app --reload --port 8000
```

API docs: [http://localhost:8000/docs](http://localhost:8000/docs)

### 2. Frontend

```bash
cd frontend-next
npm install
npm run dev
```

App: [http://localhost:3000](http://localhost:3000)

The frontend rewrites `/api/*` to the backend. Override with `BACKEND_URL` if needed.

### 3. Run both (Unix)

```bash
./start.sh
```

## Environment variables

Copy `.env.example` to `.env` at the repo root.

| Variable | Required | Purpose |
| -------- | -------- | ------- |
| `SUPABASE_URL` | Yes | Supabase project URL |
| `SUPABASE_ANON_KEY` | Yes | Public anon key |
| `SUPABASE_SERVICE_ROLE_KEY` | Yes | Server-side DB access |
| `OPENAI_API_KEY` | For AI | Chat and entity content |
| `OPENAI_MODEL` | No | Defaults to `gpt-5.4-nano` |
| `APP_ENV` | No | `development` or production |
| `CORS_ORIGINS` | No | Comma-separated allowed origins |
| `DEV_ACCOUNT_EMAIL` | No | Dev wallet floor for a test account |
| `GEMINI_API_KEY` | No | Quiz batch generation scripts only |

See `app/core/config.py` for the full settings list.

## Bible translations

English: **KJV**, **WEB** (default), **BSB**

Chinese: **CUV**, **CUNP**

Translations are stored in Supabase. Use `scripts/load_usfx_translation.py` to load additional text.

## Commentary sources

MVP uses public-domain and openly licensed sources:

- **Matthew Henry's Concise Commentary**
- **Treasury of Scripture Knowledge** (cross-references)
- **Chapter summaries** — authored in `commentary/` and loaded via `scripts/load_summary.py`

> Dr. Constable's Expository Notes are not redistributable without permission and are not included.

## AI assistant

The AI layer lives in `app/services/ai_service.py` with composable prompts in `app/prompts/ai/`. It handles:

- Sidebar chat with navigation actions (go to passage, highlight, search)
- Guided chapter study (section breakdowns and deep dives)
- On-demand entity content for theme/person/place pages

Rate limiting is applied per IP for unauthenticated requests.

## Quizzes

Quiz questions are authored as JSON in `quiz-questions/` and loaded via Supabase migrations. See [`quiz-questions/README.md`](quiz-questions/README.md) for the Gemini batch generation workflow.

## Deployment

```bash
python deploy.py              # backend + frontend to Cloud Run
python deploy.py --dry-run    # print commands without running
python deploy.py --backend-only
python deploy.py --frontend-only
```

Requires an authenticated `gcloud` CLI. Override defaults with `DEPLOY_PROJECT`, `DEPLOY_REGION`, and `DEPLOY_BACKEND_URL`.

## Docs

- [`docs/chapter-summary-system.md`](docs/chapter-summary-system.md) — Summaries, entities, and navigation
- [`docs/people-and-places.md`](docs/people-and-places.md) — People and places data model
- [`docs/scroll-performance-thread-notes.md`](docs/scroll-performance-thread-notes.md) — Reader performance notes

## Tests

```bash
pytest
```
