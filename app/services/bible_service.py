import logging
import sqlite3

from app.core.book_catalog import BOOK_BY_NUMBER, BOOK_DATA
from app.core.content_db import fetch_all, fetch_one
from app.schemas.bible import VerseOut, ChapterOut, BookInfo, SearchResult

logger = logging.getLogger(__name__)

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

    rows = fetch_all(
        "SELECT * FROM verses WHERE translation = ? AND book_number = ? AND chapter = ? ORDER BY verse",
        (translation, book_info["number"], chapter),
    )
    if not rows:
        return None

    verses = [VerseOut(**row) for row in rows]
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

    row = fetch_one(
        "SELECT * FROM verses WHERE translation = ? AND book_number = ? AND chapter = ? AND verse = ?",
        (translation, book_info["number"], chapter, verse),
    )
    return VerseOut(**row) if row else None


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

    rows = fetch_all(
        "SELECT * FROM verses WHERE translation = ? AND book_number = ? AND chapter = ? "
        "AND verse BETWEEN ? AND ? ORDER BY verse",
        (translation, book_info["number"], chapter, verse_start, verse_end),
    )
    return [VerseOut(**row) for row in rows]


# English stop words dropped by Postgres's english text search configuration (snowball list).
_EN_STOP_WORDS = frozenset(
    """
    i me my myself we our ours ourselves you your yours yourself yourselves he him his himself
    she her hers herself it its itself they them their theirs themselves what which who whom
    this that these those am is are was were be been being have has had having do does did doing
    a an the and but if or because as until while of at by for with about against between into
    through during before after above below to from up down in out on off over under again
    further then once here there when where why how all any both each few more most other some
    such no nor not only own same so than too very s t can will just don should now
    """.split()
)
_EN_TERM_PUNCTUATION = "'’-"  # kept inside English terms; the tokenizer treats them as separators
_ZH_MIN_FTS_CHARS = 3  # the trigram index cannot match anything shorter
_SQL_LIKE_ESCAPE = "\\"


def _clean_term(term: str, keep: str = "") -> str:
    """Drop everything except letters, digits and `keep`, so no FTS5 syntax can survive in a term."""
    return "".join(ch for ch in term if ch.isalnum() or ch in keep)


def _translation_language(translation: str) -> str | None:
    row = fetch_one("SELECT language FROM translations WHERE id = ?", (translation,))
    return row["language"] if row else None


def _fts_plan(query: str, language: str | None) -> tuple[str, str] | None:
    """Return (fts table, MATCH expression) for the query, or None when it needs the substring path."""
    terms = query.split()
    if language == "en":
        cleaned = [_clean_term(t, _EN_TERM_PUNCTUATION) for t in terms]
        words = [t for t in cleaned if any(ch.isalnum() for ch in t) and t.casefold() not in _EN_STOP_WORDS]
        if not words:
            return None
        return "verses_fts_en", " AND ".join(f'"{w}"' for w in words)
    if language and language.startswith("zh"):
        words = [t for t in (_clean_term(t) for t in terms) if t]
        if not words or any(len(w) < _ZH_MIN_FTS_CHARS for w in words):
            return None
        return "verses_fts_zh", " AND ".join(f'"{w}"' for w in words)
    return None


def _fts_rows(
    fts: str,
    match: str,
    translation: str,
    book_number: int | None,
    select: str,
    order: str,
    limit: int | None,
) -> list[dict]:
    sql = (
        f"SELECT {select} FROM {fts} JOIN verses v ON v.id = {fts}.rowid "
        f"WHERE {fts} MATCH ? AND v.translation = ?"
    )
    params: list = [match, translation]
    if book_number is not None:
        sql += " AND v.book_number = ?"
        params.append(book_number)
    sql += f" ORDER BY {order}"
    if limit is not None:
        sql += " LIMIT ?"
        params.append(limit)
    try:
        return fetch_all(sql, tuple(params))
    except sqlite3.Error:
        logger.exception("FTS query failed for %r; treating as no match", match)
        return []


def find_verse_matches(
    query: str, translation: str, book_number: int | None = None
) -> list[tuple[int, int, int]]:
    """Every verse matching the full-text query as sorted (book, chapter, verse); no limit, no substring fallback."""
    plan = _fts_plan(query, _translation_language(translation))
    if plan is None:
        return []
    fts, match = plan
    rows = _fts_rows(
        fts,
        match,
        translation,
        book_number,
        "v.book_number AS b, v.chapter AS c, v.verse AS n",
        "b, c, n",
        None,
    )
    return [(r["b"], r["c"], r["n"]) for r in rows]


def _substring_search(
    terms: list[str], translation: str, book_number: int | None, limit: int
) -> list[SearchResult]:
    sql = "SELECT * FROM verses WHERE translation = ?"
    params: list = [translation]
    if book_number is not None:
        sql += " AND book_number = ?"
        params.append(book_number)
    for term in terms:
        escaped = (
            term.replace(_SQL_LIKE_ESCAPE, _SQL_LIKE_ESCAPE * 2)
            .replace("%", _SQL_LIKE_ESCAPE + "%")
            .replace("_", _SQL_LIKE_ESCAPE + "_")
        )
        sql += f" AND text LIKE ? ESCAPE '{_SQL_LIKE_ESCAPE}'"
        params.append(f"%{escaped}%")
    sql += " ORDER BY book_number, chapter, verse LIMIT ?"
    params.append(limit)
    return [SearchResult(verse=VerseOut(**row), relevance=None) for row in fetch_all(sql, tuple(params))]


async def search_verses(
    query: str, translation: str = "WEB", book: str | None = None, limit: int = 20
) -> list[SearchResult]:
    """
    Full-text search across verses ranked by bm25, with a substring fallback.
    """
    trimmed_query = query.strip()
    if not trimmed_query:
        return []

    safe_limit = max(1, min(limit, 50))
    book_info = resolve_book(book) if book else None
    book_number = book_info["number"] if book_info else None

    plan = _fts_plan(trimmed_query, _translation_language(translation))
    if plan is not None:
        fts, match = plan
        ranked_rows = _fts_rows(
            fts,
            match,
            translation,
            book_number,
            f"v.book_number AS b, v.chapter AS c, v.verse AS n, v.text AS t, bm25({fts}) AS score",
            f"bm25({fts}) ASC, b, c, n",
            safe_limit,
        )
        results: list[SearchResult] = []
        for row in ranked_rows:
            book_meta = BOOK_BY_NUMBER.get(row["b"])
            results.append(
                SearchResult(
                    verse=VerseOut(
                        id=row["b"] * 1_000_000 + row["c"] * 1_000 + row["n"],
                        book=book_meta["name"] if book_meta else None,
                        book_number=row["b"],
                        chapter=row["c"],
                        verse=row["n"],
                        text=row["t"],
                        translation=translation,
                    ),
                    relevance=float(-row["score"]),
                )
            )
        if results:
            return results

    return _substring_search(trimmed_query.split(), translation, book_number, safe_limit)
