from app.core.book_catalog import BOOK_BY_NUMBER, BOOK_DATA
from app.core.supabase_client import get_supabase
from app.schemas.bible import VerseOut, ChapterOut, BookInfo, SearchResult

# Quick lookup maps
_BOOK_BY_NAME: dict[str, dict] = {}
for _b in BOOK_DATA:
    _BOOK_BY_NAME[_b["name"].lower()] = _b
    _BOOK_BY_NAME[_b["name_zh"].lower()] = _b
    _BOOK_BY_NAME[_b["name_zh_simplified"].lower()] = _b
    _BOOK_BY_NAME[_b["osis"].lower()] = _b


def _normalize_book_key(value: str) -> str:
    return "".join(ch for ch in value.lower() if ch.isalnum())


def _levenshtein_distance(a: str, b: str) -> int:
    if a == b:
        return 0
    if not a:
        return len(b)
    if not b:
        return len(a)
    prev = list(range(len(b) + 1))
    curr = [0] * (len(b) + 1)
    for i, ch_a in enumerate(a, start=1):
        curr[0] = i
        for j, ch_b in enumerate(b, start=1):
            cost = 0 if ch_a == ch_b else 1
            curr[j] = min(
                curr[j - 1] + 1,
                prev[j] + 1,
                prev[j - 1] + cost,
            )
        prev, curr = curr, prev
    return prev[-1]


def resolve_book(identifier: str | int) -> dict | None:
    """Resolve a book by name (fuzzy) or number."""
    if isinstance(identifier, int):
        return BOOK_BY_NUMBER.get(identifier)
    key = identifier.strip().lower()
    if key in _BOOK_BY_NAME:
        return _BOOK_BY_NAME[key]
    normalized_key = _normalize_book_key(key)
    if not normalized_key:
        return None
    for book in BOOK_DATA:
        if any(
            _normalize_book_key(alias) == normalized_key
            for alias in (book["name"], book["name_zh"], book["name_zh_simplified"], book["osis"])
        ):
            return book
    # Fuzzy: check if any book name starts with the input
    prefix_matches = [
        data for name, data in _BOOK_BY_NAME.items() if name.startswith(key)
    ]
    if prefix_matches:
        return min(prefix_matches, key=lambda data: len(data["name"]))

    best_match: dict | None = None
    best_distance: int | None = None
    for book in BOOK_DATA:
        for alias in (book["name"], book["name_zh"], book["name_zh_simplified"], book["osis"]):
            normalized_name = _normalize_book_key(alias)
            prefix_name = normalized_name[: max(len(normalized_key), 1)]
            distance = min(
                _levenshtein_distance(normalized_key, normalized_name),
                _levenshtein_distance(normalized_key, prefix_name),
            )
            if best_distance is None or distance < best_distance:
                best_match = book
                best_distance = distance
    max_distance = 1 if len(normalized_key) <= 4 else 2 if len(normalized_key) <= 8 else 3
    if best_match and best_distance is not None and best_distance <= max_distance:
        return best_match
    return None


def list_books() -> list[BookInfo]:
    return [
        BookInfo(
            book_number=b["number"],
            name=b["name"],
            name_zh=b["name_zh"],
            name_zh_simplified=b["name_zh_simplified"],
            testament=b["testament"],
            total_chapters=b["chapters"],
        )
        for b in BOOK_DATA
    ]


async def get_chapter(
    book: str, chapter: int, translation: str = "WEB"
) -> ChapterOut | None:
    """Fetch all verses for a given chapter."""
    book_info = resolve_book(book)
    if not book_info:
        return None

    db = get_supabase()
    result = (
        db.table("verses")
        .select("*")
        .eq("book_number", book_info["number"])
        .eq("chapter", chapter)
        .eq("translation", translation)
        .order("verse")
        .execute()
    )

    if not result.data:
        return None

    verses = [VerseOut(**row) for row in result.data]
    return ChapterOut(
        book=book_info["name"],
        book_number=book_info["number"],
        chapter=chapter,
        translation=translation,
        verses=verses,
        total_verses=len(verses),
    )


async def get_verse(
    book: str, chapter: int, verse: int, translation: str = "WEB"
) -> VerseOut | None:
    """Fetch a single verse."""
    book_info = resolve_book(book)
    if not book_info:
        return None

    db = get_supabase()
    result = (
        db.table("verses")
        .select("*")
        .eq("book_number", book_info["number"])
        .eq("chapter", chapter)
        .eq("verse", verse)
        .eq("translation", translation)
        .single()
        .execute()
    )

    if not result.data:
        return None
    return VerseOut(**result.data)


async def get_verse_range(
    book: str,
    chapter: int,
    verse_start: int,
    verse_end: int,
    translation: str = "WEB",
) -> list[VerseOut]:
    """Fetch a range of verses (e.g., John 3:16-18)."""
    book_info = resolve_book(book)
    if not book_info:
        return []

    db = get_supabase()
    result = (
        db.table("verses")
        .select("*")
        .eq("book_number", book_info["number"])
        .eq("chapter", chapter)
        .gte("verse", verse_start)
        .lte("verse", verse_end)
        .eq("translation", translation)
        .order("verse")
        .execute()
    )

    return [VerseOut(**row) for row in result.data] if result.data else []


async def search_verses(
    query: str, translation: str = "WEB", book: str | None = None, limit: int = 20
) -> list[SearchResult]:
    """
    Phrase search across verses with relevance ranking and a substring fallback.
    """
    trimmed_query = query.strip()
    if not trimmed_query:
        return []

    db = get_supabase()
    safe_limit = max(1, min(limit, 50))
    book_info = resolve_book(book) if book else None

    try:
        rpc_result = (
            db.rpc(
                "search_bible",
                {
                    "p_query": trimmed_query,
                    "p_translation": translation,
                    "p_book_number": book_info["number"] if book_info else None,
                    "p_limit": safe_limit,
                },
            )
            .execute()
        )
        ranked_rows = rpc_result.data or []
        if ranked_rows:
            results: list[SearchResult] = []
            for row in ranked_rows:
                book_number = int(row["book_num"])
                chapter_num = int(row["chapter_num"])
                verse_num = int(row["verse_num"])
                book_meta = BOOK_BY_NUMBER.get(book_number)
                results.append(
                    SearchResult(
                        verse=VerseOut(
                            id=book_number * 1_000_000 + chapter_num * 1_000 + verse_num,
                            book=book_meta["name"] if book_meta else None,
                            book_number=book_number,
                            chapter=chapter_num,
                            verse=verse_num,
                            text=row["verse_text"],
                            translation=translation,
                        ),
                        relevance=float(row.get("rank") or 0.0),
                    )
                )
            return results
    except Exception:
        # Fall back to the original substring-based search if the database RPC
        # is unavailable or the query cannot be parsed into a tsquery.
        pass

    q = (
        db.table("verses")
        .select("*")
        .eq("translation", translation)
    )

    if book_info:
        q = q.eq("book_number", book_info["number"])

    terms = [term for term in trimmed_query.split() if term]
    if len(terms) <= 1:
        q = q.ilike("text", f"%{trimmed_query}%")
    else:
        for term in terms:
            q = q.ilike("text", f"%{term}%")

    result = (
        q.order("book_number")
        .order("chapter")
        .order("verse")
        .limit(safe_limit)
        .execute()
    )

    return [
        SearchResult(verse=VerseOut(**row), relevance=None)
        for row in (result.data or [])
    ]
