# Logos Light — Bible App for Young Adults

A Bible study application with integrated AI agents, commentaries, and multi-language support, built for teenagers and young adults.

## Architecture Overview

```
bible-app/
├── app/
│   ├── main.py                  # FastAPI entry point
│   ├── core/
│   │   ├── config.py            # Settings & environment variables
│   │   ├── security.py          # Auth helpers (JWT, Google OAuth)
│   │   └── supabase_client.py   # Supabase client singleton
│   ├── api/
│   │   └── v1/
│   │       ├── router.py        # API v1 router aggregation
│   │       └── endpoints/
│   │           ├── auth.py      # Sign-up / sign-in (email + Google)
│   │           ├── bible.py     # Bible text endpoints
│   │           ├── commentary.py # Commentary endpoints
│   │           ├── highlights.py # User highlights & bookmarks
│   │           └── ai.py        # AI agent endpoints
│   ├── models/
│   │   ├── bible.py             # Bible text ORM models
│   │   ├── user.py              # User model
│   │   └── highlight.py         # Highlight / bookmark models
│   ├── schemas/
│   │   ├── bible.py             # Pydantic request/response schemas
│   │   ├── user.py
│   │   ├── ai.py                # AI request/response schemas
│   │   └── commentary.py
│   ├── services/
│   │   ├── bible_service.py     # Bible text query logic
│   │   ├── commentary_service.py
│   │   └── agents/
│   │       ├── orchestrator.py  # Main AI assistant (navigation, commands)
│   │       ├── summarizer.py    # Summarize highlighted text
│   │       └── verse_agent.py   # Verse lookup & cross-reference agent
│   └── db/
│       ├── session.py           # Async DB session
│       └── migrations/         # Alembic or raw SQL migrations
├── data/                        # Bible text seed data (JSON/CSV)
├── scripts/
│   └── seed_bible.py           # Script to load Bible data into Supabase
├── tests/
├── requirements.txt
├── .env.example
└── README.md
```

## Tech Stack

| Layer        | Technology                                    |
|-------------|-----------------------------------------------|
| Backend     | Python 3.14 + FastAPI                         |
| Database    | Supabase (PostgreSQL) + Row Level Security    |
| Auth        | Supabase Auth (Email + Google OAuth)          |
| AI          | OpenAI API (multi-agent)                      |
| Frontend    | TBD (React or Astro)                          |
| Deployment  | TBD                                           |

## AI Agent Architecture

```
User Input
    │
    ▼
┌─────────────────────┐
│   Orchestrator Agent │  ← Main assistant: interprets intent
│   (always active)    │     navigates, highlights, searches
└────────┬────────────┘
         │ routes to specialized agents when needed
         ├──────────────────┐
         ▼                  ▼
┌──────────────┐   ┌──────────────────┐
│ Summarizer   │   │ Verse Agent      │
│ Agent        │   │                  │
│              │   │ - Cross-refs     │
│ - Commentary │   │ - Passage lookup │
│ - Verses     │   │ - Keyword search │
└──────────────┘   └──────────────────┘
```

- **Orchestrator**: The primary agent users interact with. Handles navigation
  ("take me to John 3"), highlighting commands, and delegates to sub-agents.
- **Summarizer**: Activated when user selects text and requests a summary
  (commentary or verse passages). Returns age-appropriate explanations.
- **Verse Agent**: Handles verse/chapter lookups, cross-references, and
  keyword-based search across the Bible text.

## Bible Translations (MVP)

### English
- **KJV** — King James Version (Public Domain)
- **WEB** — World English Bible (Public Domain)
- **BSB** — Berean Standard Bible (Free use, check license)

### Chinese
- **CUV** — Chinese Union Version (Public Domain — original 1919)
- **CUNP** — Chinese Union New Punctuation (check licensing)

## Commentary

For MVP, we use public domain / openly licensed commentaries:
- **Matthew Henry's Concise Commentary** (Public Domain)
- **Treasury of Scripture Knowledge** cross-references (Public Domain)

> **Note**: Dr. Constable's Expository Notes are NOT open source.
> They require written permission for redistribution in an app.
> We can pursue permission separately, but MVP uses public domain sources.

## Getting Started

```bash
# 1. Clone and set up environment
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt

# 2. Copy env and fill in your keys
cp .env.example .env

# 3. Run the dev server
uvicorn app.main:app --reload --port 8000

# 4. Seed Bible data
python scripts/seed_bible.py
```

The dependency set is trimmed to packages installable with plain `pip` for the current backend.
Pins were updated to versions that support Python 3.14 wheels and optional Rust-backed / unused auth extras were removed from `requirements.txt`.

## Environment Variables

See `.env.example` for required configuration.
