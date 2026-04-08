from pydantic import BaseModel


class TranslationInfo(BaseModel):
    id: str
    name: str
    abbreviation: str
    language: str
    license: str
    description: str | None = None


class VerseOut(BaseModel):
    id: int
    book: str | None = None
    book_number: int
    chapter: int
    verse: int
    text: str
    translation: str


class ChapterOut(BaseModel):
    book: str
    book_number: int
    chapter: int
    translation: str
    verses: list[VerseOut]
    total_verses: int


class BookInfo(BaseModel):
    book_number: int
    name: str
    name_zh: str | None = None
    name_zh_simplified: str | None = None
    testament: str  # "OT" or "NT"
    total_chapters: int


class SearchResult(BaseModel):
    verse: VerseOut
    relevance: float | None = None


class SearchRequest(BaseModel):
    query: str
    translation: str = "WEB"
    book: str | None = None
    limit: int = 20
