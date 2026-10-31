from pydantic import BaseModel


class VerseWordOut(BaseModel):
    english_order: int
    english: str | None = None
    english_kind: str | None = None
    original: str | None = None
    translit: str | None = None
    language: str | None = None
    strongs: str | None = None
    lemma: str | None = None
    gloss: str | None = None
    grammar: str | None = None
    parsing: str | None = None
    parsing_code: str | None = None
    footnote: str | None = None


class VerseWordsOut(BaseModel):
    book: str
    book_number: int
    chapter: int
    verse: int
    translation: str
    words: list[VerseWordOut]


class LexiconReferenceOut(BaseModel):
    book: str
    book_number: int
    chapter: int
    verse: int


class LexiconEntryOut(BaseModel):
    strongs: str
    language: str | None = None
    lemma: str | None = None
    translit: str | None = None
    gloss: str | None = None
    definition: str | None = None
    occurrences: int
    verse_count: int
    references: list[LexiconReferenceOut]
    source: str
