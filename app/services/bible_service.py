from app.core.supabase_client import get_supabase
from app.schemas.bible import VerseOut, ChapterOut, BookInfo, SearchResult


BOOK_DATA = [
    {"number": 1, "name": "Genesis", "testament": "OT", "chapters": 50},
    {"number": 2, "name": "Exodus", "testament": "OT", "chapters": 40},
    {"number": 3, "name": "Leviticus", "testament": "OT", "chapters": 27},
    {"number": 4, "name": "Numbers", "testament": "OT", "chapters": 36},
    {"number": 5, "name": "Deuteronomy", "testament": "OT", "chapters": 34},
    {"number": 6, "name": "Joshua", "testament": "OT", "chapters": 24},
    {"number": 7, "name": "Judges", "testament": "OT", "chapters": 21},
    {"number": 8, "name": "Ruth", "testament": "OT", "chapters": 4},
    {"number": 9, "name": "1 Samuel", "testament": "OT", "chapters": 31},
    {"number": 10, "name": "2 Samuel", "testament": "OT", "chapters": 24},
    {"number": 11, "name": "1 Kings", "testament": "OT", "chapters": 22},
    {"number": 12, "name": "2 Kings", "testament": "OT", "chapters": 25},
    {"number": 13, "name": "1 Chronicles", "testament": "OT", "chapters": 29},
    {"number": 14, "name": "2 Chronicles", "testament": "OT", "chapters": 36},
    {"number": 15, "name": "Ezra", "testament": "OT", "chapters": 10},
    {"number": 16, "name": "Nehemiah", "testament": "OT", "chapters": 13},
    {"number": 17, "name": "Esther", "testament": "OT", "chapters": 10},
    {"number": 18, "name": "Job", "testament": "OT", "chapters": 42},
    {"number": 19, "name": "Psalms", "testament": "OT", "chapters": 150},
    {"number": 20, "name": "Proverbs", "testament": "OT", "chapters": 31},
    {"number": 21, "name": "Ecclesiastes", "testament": "OT", "chapters": 12},
    {"number": 22, "name": "Song of Solomon", "testament": "OT", "chapters": 8},
    {"number": 23, "name": "Isaiah", "testament": "OT", "chapters": 66},
    {"number": 24, "name": "Jeremiah", "testament": "OT", "chapters": 52},
    {"number": 25, "name": "Lamentations", "testament": "OT", "chapters": 5},
    {"number": 26, "name": "Ezekiel", "testament": "OT", "chapters": 48},
    {"number": 27, "name": "Daniel", "testament": "OT", "chapters": 12},
    {"number": 28, "name": "Hosea", "testament": "OT", "chapters": 14},
    {"number": 29, "name": "Joel", "testament": "OT", "chapters": 3},
    {"number": 30, "name": "Amos", "testament": "OT", "chapters": 9},
    {"number": 31, "name": "Obadiah", "testament": "OT", "chapters": 1},
    {"number": 32, "name": "Jonah", "testament": "OT", "chapters": 4},
    {"number": 33, "name": "Micah", "testament": "OT", "chapters": 7},
    {"number": 34, "name": "Nahum", "testament": "OT", "chapters": 3},
    {"number": 35, "name": "Habakkuk", "testament": "OT", "chapters": 3},
    {"number": 36, "name": "Zephaniah", "testament": "OT", "chapters": 3},
    {"number": 37, "name": "Haggai", "testament": "OT", "chapters": 2},
    {"number": 38, "name": "Zechariah", "testament": "OT", "chapters": 14},
    {"number": 39, "name": "Malachi", "testament": "OT", "chapters": 4},
    {"number": 40, "name": "Matthew", "testament": "NT", "chapters": 28},
    {"number": 41, "name": "Mark", "testament": "NT", "chapters": 16},
    {"number": 42, "name": "Luke", "testament": "NT", "chapters": 24},
    {"number": 43, "name": "John", "testament": "NT", "chapters": 21},
    {"number": 44, "name": "Acts", "testament": "NT", "chapters": 28},
    {"number": 45, "name": "Romans", "testament": "NT", "chapters": 16},
    {"number": 46, "name": "1 Corinthians", "testament": "NT", "chapters": 16},
    {"number": 47, "name": "2 Corinthians", "testament": "NT", "chapters": 13},
    {"number": 48, "name": "Galatians", "testament": "NT", "chapters": 6},
    {"number": 49, "name": "Ephesians", "testament": "NT", "chapters": 6},
    {"number": 50, "name": "Philippians", "testament": "NT", "chapters": 4},
    {"number": 51, "name": "Colossians", "testament": "NT", "chapters": 4},
    {"number": 52, "name": "1 Thessalonians", "testament": "NT", "chapters": 5},
    {"number": 53, "name": "2 Thessalonians", "testament": "NT", "chapters": 3},
    {"number": 54, "name": "1 Timothy", "testament": "NT", "chapters": 6},
    {"number": 55, "name": "2 Timothy", "testament": "NT", "chapters": 4},
    {"number": 56, "name": "Titus", "testament": "NT", "chapters": 3},
    {"number": 57, "name": "Philemon", "testament": "NT", "chapters": 1},
    {"number": 58, "name": "Hebrews", "testament": "NT", "chapters": 13},
    {"number": 59, "name": "James", "testament": "NT", "chapters": 5},
    {"number": 60, "name": "1 Peter", "testament": "NT", "chapters": 5},
    {"number": 61, "name": "2 Peter", "testament": "NT", "chapters": 3},
    {"number": 62, "name": "1 John", "testament": "NT", "chapters": 5},
    {"number": 63, "name": "2 John", "testament": "NT", "chapters": 1},
    {"number": 64, "name": "3 John", "testament": "NT", "chapters": 1},
    {"number": 65, "name": "Jude", "testament": "NT", "chapters": 1},
    {"number": 66, "name": "Revelation", "testament": "NT", "chapters": 22},
]

# Quick lookup maps
_BOOK_BY_NAME: dict[str, dict] = {}
_BOOK_BY_NUMBER: dict[int, dict] = {}
for _b in BOOK_DATA:
    _BOOK_BY_NAME[_b["name"].lower()] = _b
    _BOOK_BY_NUMBER[_b["number"]] = _b


def resolve_book(identifier: str | int) -> dict | None:
    """Resolve a book by name (fuzzy) or number."""
    if isinstance(identifier, int):
        return _BOOK_BY_NUMBER.get(identifier)
    key = identifier.strip().lower()
    if key in _BOOK_BY_NAME:
        return _BOOK_BY_NAME[key]
    # Fuzzy: check if any book name starts with the input
    for name, data in _BOOK_BY_NAME.items():
        if name.startswith(key):
            return data
    return None


def list_books() -> list[BookInfo]:
    return [
        BookInfo(
            book_number=b["number"],
            name=b["name"],
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
    Phrase search across verses using case-insensitive substring matching.
    """
    db = get_supabase()

    q = (
        db.table("verses")
        .select("*")
        .ilike("text", f"%{query}%")
        .eq("translation", translation)
    )

    if book:
        book_info = resolve_book(book)
        if book_info:
            q = q.eq("book_number", book_info["number"])

    result = q.order("book_number").order("chapter").order("verse").limit(limit).execute()

    return [
        SearchResult(verse=VerseOut(**row), relevance=None)
        for row in (result.data or [])
    ]
