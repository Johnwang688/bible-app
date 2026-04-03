from pydantic import BaseModel


class CommentaryEntry(BaseModel):
    id: int
    book_number: int
    chapter: int
    verse_start: int
    verse_end: int | None = None
    source: str  # "matthew_henry", "treasury_scripture", etc.
    content: str


class CommentaryRequest(BaseModel):
    book: str
    chapter: int
    verse: int | None = None
    source: str | None = None  # if None, return all available
