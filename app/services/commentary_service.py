from app.core.content_db import fetch_all
from app.schemas.commentary import CommentaryEntry, SummaryEntityTag
from app.services.bible_service import resolve_book
from app.services.summary_entity_service import SUMMARY_SOURCE, fetch_tags_for_commentary_ids


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

    sql = "SELECT * FROM commentaries WHERE book_number = ? AND chapter = ?"
    params: list = [book_info["number"], chapter]
    if verse is not None:
        # Commentaries starting at or before this verse; ranges are checked against verse_end below.
        sql += " AND verse_start <= ?"
        params.append(verse)
    if source:
        sql += " AND source = ?"
        params.append(source)
    sql += " ORDER BY verse_start, id"
    rows = fetch_all(sql, tuple(params))

    entries = []
    for row in rows:
        entry = CommentaryEntry(**row)
        # Filter: if verse requested and entry has a range, check it covers the verse
        if verse is not None and entry.verse_end is not None:
            if verse > entry.verse_end:
                continue
        entries.append(entry)

    summary_ids = [e.id for e in entries if e.source == SUMMARY_SOURCE]
    if summary_ids:
        tag_map = fetch_tags_for_commentary_ids(summary_ids)
        out: list[CommentaryEntry] = []
        for entry in entries:
            if entry.source != SUMMARY_SOURCE:
                out.append(entry)
                continue
            tags = tag_map.get(entry.id, {"theme_tags": [], "people_tags": [], "place_tags": []})
            out.append(
                entry.model_copy(
                    update={
                        "theme_tags": [
                            SummaryEntityTag(**t) for t in tags.get("theme_tags") or []
                        ],
                        "people_tags": [
                            SummaryEntityTag(**t) for t in tags.get("people_tags") or []
                        ],
                        "place_tags": [
                            SummaryEntityTag(**t) for t in tags.get("place_tags") or []
                        ],
                    }
                )
            )
        return out

    return entries


async def list_commentary_sources() -> list[dict]:
    """Return available commentary sources from the database."""
    return fetch_all("SELECT id, name, license, description FROM commentary_sources ORDER BY name")
