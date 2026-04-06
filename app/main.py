from pathlib import Path

from fastapi import FastAPI, HTTPException, Query, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

from app.core.config import get_settings
from app.core.supabase_client import get_supabase
from app.schemas.ai import AIChatRequest, AIChatResponse
from app.schemas.bible import BookInfo, ChapterOut, SearchRequest, SearchResult, VerseOut
from app.schemas.commentary import CommentaryEntry
from app.services.ai_service import (
    AIServiceUnavailable,
    RateLimitExceeded,
    chat_with_ai,
    check_rate_limit,
    get_request_identity,
)
from app.services.bible_service import (
    get_chapter,
    get_verse,
    get_verse_range,
    list_books,
    search_verses,
)
from app.services.commentary_service import get_commentary, list_commentary_sources


settings = get_settings()

app = FastAPI(
    title=settings.app_name,
    version="0.1.0",
    description="Backend API for the Logos Light Bible app.",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origin_list,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/api", tags=["meta"])
async def root() -> dict[str, str]:
    return {
        "app": settings.app_name,
        "environment": settings.app_env,
        "docs": "/docs",
        "health": "/health",
    }


@app.get("/health", tags=["meta"])
async def health_check() -> dict[str, object]:
    return {
        "status": "ok",
        "app": settings.app_name,
        "environment": settings.app_env,
        "openai_configured": bool(settings.openai_api_key and settings.openai_model),
        "supabase_configured": bool(
            settings.supabase_url
            and settings.supabase_anon_key
            and settings.supabase_service_role_key
        ),
    }


@app.get("/api/v1/translations", tags=["bible"])
async def get_translations() -> list[dict]:
    db = get_supabase()
    result = db.table("translations").select("id, name, language, license").order("id").execute()
    return result.data or []


@app.get("/api/v1/books", response_model=list[BookInfo], tags=["bible"])
async def get_books() -> list[BookInfo]:
    return list_books()


@app.get(
    "/api/v1/chapters/{book}/{chapter}",
    response_model=ChapterOut,
    tags=["bible"],
)
async def read_chapter(
    book: str,
    chapter: int,
    translation: str = Query(default=settings.default_translation),
) -> ChapterOut:
    chapter_data = await get_chapter(book=book, chapter=chapter, translation=translation)
    if chapter_data is None:
        raise HTTPException(status_code=404, detail="Chapter not found")
    return chapter_data


@app.get(
    "/api/v1/verses/{book}/{chapter}/{verse}",
    response_model=VerseOut,
    tags=["bible"],
)
async def read_verse(
    book: str,
    chapter: int,
    verse: int,
    translation: str = Query(default=settings.default_translation),
) -> VerseOut:
    verse_data = await get_verse(
        book=book,
        chapter=chapter,
        verse=verse,
        translation=translation,
    )
    if verse_data is None:
        raise HTTPException(status_code=404, detail="Verse not found")
    return verse_data


@app.get(
    "/api/v1/verses/{book}/{chapter}/{verse_start}/{verse_end}",
    response_model=list[VerseOut],
    tags=["bible"],
)
async def read_verse_range(
    book: str,
    chapter: int,
    verse_start: int,
    verse_end: int,
    translation: str = Query(default=settings.default_translation),
) -> list[VerseOut]:
    verses = await get_verse_range(
        book=book,
        chapter=chapter,
        verse_start=verse_start,
        verse_end=verse_end,
        translation=translation,
    )
    if not verses:
        raise HTTPException(status_code=404, detail="Verse range not found")
    return verses


@app.post("/api/v1/search", response_model=list[SearchResult], tags=["bible"])
async def search_bible(request: SearchRequest) -> list[SearchResult]:
    return await search_verses(
        query=request.query,
        translation=request.translation,
        book=request.book,
        limit=request.limit,
    )


@app.get(
    "/api/v1/commentary",
    response_model=list[CommentaryEntry],
    tags=["commentary"],
)
async def read_commentary(
    book: str,
    chapter: int,
    verse: int | None = None,
    source: str | None = None,
) -> list[CommentaryEntry]:
    return await get_commentary(book=book, chapter=chapter, verse=verse, source=source)


@app.get("/api/v1/commentary/sources", tags=["commentary"])
async def get_commentary_sources() -> list[dict]:
    return await list_commentary_sources()


@app.post("/api/v1/ai/chat", response_model=AIChatResponse, tags=["ai"])
async def ai_chat(request: Request, payload: AIChatRequest) -> AIChatResponse:
    message = payload.message.strip()
    if not message:
        raise HTTPException(status_code=400, detail="Please enter a question for the AI assistant.")
    if len(message) > 1500:
        raise HTTPException(
            status_code=400,
            detail="Please keep your message under 1,500 characters so the assistant stays focused and affordable.",
        )

    try:
        check_rate_limit(get_request_identity(request))
        return await chat_with_ai(payload)
    except RateLimitExceeded as exc:
        raise HTTPException(
            status_code=429,
            detail=exc.message,
            headers={"Retry-After": str(exc.retry_after_seconds)},
        ) from exc
    except AIServiceUnavailable as exc:
        raise HTTPException(status_code=503, detail=str(exc)) from exc


# Serve the frontend — must be last so API routes take precedence
_frontend_dir = Path(__file__).parent.parent / "frontend"
if _frontend_dir.exists():
    app.mount("/", StaticFiles(directory=_frontend_dir, html=True), name="frontend")
