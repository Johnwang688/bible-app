from pathlib import Path

from fastapi import Depends, FastAPI, HTTPException, Query, Request, Response, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

from app.core.config import get_settings
from app.core.security import get_current_user
from app.core.supabase_client import get_supabase
from app.schemas.account import (
    AuthResponse as AccountAuthResponse,
    ReadingProgressIn,
    ReadingProgressOut,
    RefreshSessionRequest,
    StudyItemCreate,
    StudyItemOut,
    StudyItemUpdate,
    UserProfile,
    UserProfileUpdate,
    UserSettingsIn,
    UserSettingsOut,
    UserSignIn,
    UserSignUp,
)
from app.schemas.ai import AIChatRequest, AIChatResponse
from app.schemas.bible import BookInfo, ChapterOut, SearchRequest, SearchResult, VerseOut
from app.schemas.commentary import CommentaryEntry, SummaryEntityPageOut
from app.services.account_service import (
    create_study_item,
    delete_study_item,
    get_or_create_profile,
    get_reading_progress,
    get_user_settings,
    list_study_items,
    replace_study_items,
    refresh_user_session,
    sign_in_user,
    sign_out_user,
    sign_up_user,
    update_profile,
    update_study_item,
    upsert_reading_progress,
    upsert_user_settings,
)
from app.services.ai_service import (
    AIServiceUnavailable,
    InMemoryRateLimiter,
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
from app.services.summary_entity_service import get_summary_entity_page
from app.schemas.quiz import (
    ChapterProgressOut,
    ChapterQuizOut,
    MasteryOverviewOut,
    QuizSubmitIn,
    QuizSubmitOut,
    WalletOut,
)
from app.services.quiz_service import (
    get_chapter_quiz,
    get_chapter_progress,
    get_mastery_overview,
    get_wallet,
    submit_quiz,
)


settings = get_settings()

# Rate limiters for auth endpoints — separate from the AI limiter
_SIGNUP_RATE_LIMITER = InMemoryRateLimiter(limit=5, window_seconds=600)   # 5 sign-ups per 10 min per IP
_SIGNIN_RATE_LIMITER = InMemoryRateLimiter(limit=10, window_seconds=300)  # 10 sign-ins per 5 min per IP

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
async def get_translations(response: Response) -> list[dict]:
    response.headers["Cache-Control"] = "public, max-age=86400"
    db = get_supabase()
    result = db.table("translations").select("id, name, language, license").order("id").execute()
    return result.data or []


@app.get("/api/v1/books", response_model=list[BookInfo], tags=["bible"])
async def get_books(response: Response) -> list[BookInfo]:
    response.headers["Cache-Control"] = "public, max-age=86400"
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


@app.get(
    "/api/v1/summary-entities/{kind}/{slug}",
    response_model=SummaryEntityPageOut,
    tags=["commentary"],
)
async def read_summary_entity(kind: str, slug: str) -> SummaryEntityPageOut:
    if kind not in ("theme", "person"):
        raise HTTPException(status_code=404, detail="Unknown entity kind")
    data = get_summary_entity_page(kind, slug)
    if not data:
        raise HTTPException(status_code=404, detail="Entity not found")
    return SummaryEntityPageOut(**data)


@app.post("/api/v1/auth/signup", response_model=AccountAuthResponse, tags=["auth"])
async def auth_sign_up(request: Request, payload: UserSignUp) -> AccountAuthResponse:
    try:
        _SIGNUP_RATE_LIMITER.check(get_request_identity(request))
    except RateLimitExceeded as exc:
        raise HTTPException(
            status_code=429,
            detail="Too many sign-up attempts. Please wait a few minutes and try again.",
            headers={"Retry-After": str(exc.retry_after_seconds)},
        ) from exc
    return sign_up_user(payload.email.strip(), payload.password, payload.display_name)


@app.post("/api/v1/auth/signin", response_model=AccountAuthResponse, tags=["auth"])
async def auth_sign_in(request: Request, payload: UserSignIn) -> AccountAuthResponse:
    try:
        _SIGNIN_RATE_LIMITER.check(get_request_identity(request))
    except RateLimitExceeded as exc:
        raise HTTPException(
            status_code=429,
            detail="Too many sign-in attempts. Please wait a few minutes and try again.",
            headers={"Retry-After": str(exc.retry_after_seconds)},
        ) from exc
    return sign_in_user(payload.email.strip(), payload.password)


@app.post("/api/v1/auth/refresh", response_model=AccountAuthResponse, tags=["auth"])
async def auth_refresh(payload: RefreshSessionRequest) -> AccountAuthResponse:
    return refresh_user_session(payload.refresh_token)


@app.post("/api/v1/auth/signout", status_code=status.HTTP_204_NO_CONTENT, tags=["auth"])
async def auth_sign_out(request: Request, current_user: dict = Depends(get_current_user)) -> Response:
    auth_header = request.headers.get("authorization")
    token = auth_header.split(" ", 1)[1] if auth_header and " " in auth_header else None
    if token:
        sign_out_user(token)
    return Response(status_code=status.HTTP_204_NO_CONTENT)


@app.get("/api/v1/me", response_model=UserProfile, tags=["account"])
async def read_me(current_user: dict = Depends(get_current_user)) -> UserProfile:
    return get_or_create_profile(current_user)


@app.patch("/api/v1/me", response_model=UserProfile, tags=["account"])
async def patch_me(
    payload: UserProfileUpdate,
    current_user: dict = Depends(get_current_user),
) -> UserProfile:
    return update_profile(current_user["id"], payload)


@app.get("/api/v1/study-items", response_model=list[StudyItemOut], tags=["account"])
async def read_study_items(current_user: dict = Depends(get_current_user)) -> list[StudyItemOut]:
    return list_study_items(current_user["id"])


@app.post("/api/v1/study-items", response_model=StudyItemOut, tags=["account"])
async def post_study_item(
    payload: StudyItemCreate,
    current_user: dict = Depends(get_current_user),
) -> StudyItemOut:
    return create_study_item(current_user["id"], payload)


@app.put("/api/v1/study-items", response_model=list[StudyItemOut], tags=["account"])
async def put_study_items(
    payload: list[StudyItemCreate],
    current_user: dict = Depends(get_current_user),
) -> list[StudyItemOut]:
    return replace_study_items(current_user["id"], payload)


@app.patch("/api/v1/study-items/{item_id}", response_model=StudyItemOut, tags=["account"])
async def patch_study_item(
    item_id: int,
    payload: StudyItemUpdate,
    current_user: dict = Depends(get_current_user),
) -> StudyItemOut:
    return update_study_item(current_user["id"], item_id, payload)


@app.delete("/api/v1/study-items/{item_id}", status_code=status.HTTP_204_NO_CONTENT, tags=["account"])
async def remove_study_item(item_id: int, current_user: dict = Depends(get_current_user)) -> Response:
    delete_study_item(current_user["id"], item_id)
    return Response(status_code=status.HTTP_204_NO_CONTENT)


@app.get("/api/v1/reading-progress", response_model=list[ReadingProgressOut], tags=["account"])
async def read_reading_progress(current_user: dict = Depends(get_current_user)) -> list[ReadingProgressOut]:
    return get_reading_progress(current_user["id"])


@app.put("/api/v1/reading-progress", response_model=list[ReadingProgressOut], tags=["account"])
async def put_reading_progress(
    payload: list[ReadingProgressIn],
    current_user: dict = Depends(get_current_user),
) -> list[ReadingProgressOut]:
    return upsert_reading_progress(current_user["id"], payload)


@app.get("/api/v1/user-settings", response_model=UserSettingsOut, tags=["account"])
async def read_user_settings(current_user: dict = Depends(get_current_user)) -> UserSettingsOut:
    return get_user_settings(current_user["id"])


@app.put("/api/v1/user-settings", response_model=UserSettingsOut, tags=["account"])
async def put_user_settings(
    payload: UserSettingsIn,
    current_user: dict = Depends(get_current_user),
) -> UserSettingsOut:
    return upsert_user_settings(current_user["id"], payload)


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


# ── Quiz & Mastery ────────────────────────────────────────────────────────────

@app.get("/api/v1/quiz/{book_number}/{chapter}", response_model=ChapterQuizOut, tags=["quiz"])
async def read_chapter_quiz(
    book_number: int,
    chapter: int,
    current_user: dict = Depends(get_current_user),
) -> ChapterQuizOut:
    return get_chapter_quiz(current_user["id"], book_number, chapter)


@app.post("/api/v1/quiz/submit", response_model=QuizSubmitOut, tags=["quiz"])
async def post_quiz_submit(
    payload: QuizSubmitIn,
    current_user: dict = Depends(get_current_user),
) -> QuizSubmitOut:
    return submit_quiz(current_user["id"], payload)


@app.get(
    "/api/v1/quiz/progress/{book_number}/{chapter}",
    response_model=ChapterProgressOut,
    tags=["quiz"],
)
async def read_chapter_progress(
    book_number: int,
    chapter: int,
    current_user: dict = Depends(get_current_user),
) -> ChapterProgressOut:
    return get_chapter_progress(current_user["id"], book_number, chapter)


@app.get("/api/v1/wallet", response_model=WalletOut, tags=["quiz"])
async def read_wallet(current_user: dict = Depends(get_current_user)) -> WalletOut:
    return get_wallet(current_user["id"])


@app.get(
    "/api/v1/quiz/mastery-overview",
    response_model=MasteryOverviewOut,
    tags=["quiz"],
)
async def read_mastery_overview(
    current_user: dict = Depends(get_current_user),
) -> MasteryOverviewOut:
    return get_mastery_overview(current_user["id"])


# Serve the frontend — must be last so API routes take precedence
_frontend_dir = Path(__file__).parent.parent / "frontend"
if _frontend_dir.exists():
    app.mount("/", StaticFiles(directory=_frontend_dir, html=True), name="frontend")
