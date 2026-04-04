from app.core.supabase_client import get_supabase
from app.schemas.commentary import CommentaryEntry
from app.services.bible_service import resolve_book


async def get_commentary(
    book: str,
    chapter: int,
    verse: int | None = None,
    source: str | None = None,
) -> list[CommentaryEntry]:
    """
    Fetch commentary entries for a given passage.
    Optionally filter by verse and/or commentary source.
    """
    book_info = resolve_book(book)
    if not book_info:
        return []

    db = get_supabase()
    q = (
        db.table("commentaries")
        .select("*")
        .eq("book_number", book_info["number"])
        .eq("chapter", chapter)
    )

    if verse is not None:
        # Get commentaries that cover this verse (range-aware)
        q = q.lte("verse_start", verse)
        # verse_end might be null (single-verse commentary)
        # We handle this in application logic below

    if source:
        q = q.eq("source", source)

    result = q.order("verse_start").execute()

    entries = []
    for row in result.data or []:
        entry = CommentaryEntry(**row)
        # Filter: if verse requested and entry has a range, check it covers the verse
        if verse is not None and entry.verse_end is not None:
            if verse > entry.verse_end:
                continue
        entries.append(entry)

    return entries


async def list_commentary_sources() -> list[dict]:
    """Return available commentary sources from the database."""
    db = get_supabase()
    result = (
        db.table("commentary_sources")
        .select("id, name, license, description")
        .order("name")
        .execute()
    )
    return result.data or []
