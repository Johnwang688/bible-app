from pydantic import BaseModel, Field


class SummaryEntityTag(BaseModel):
    slug: str
    label: str


class CommentaryEntry(BaseModel):
    id: int
    book_number: int
    chapter: int
    verse_start: int
    verse_end: int | None = None
    source: str  # "matthew_henry", "treasury_scripture", etc.
    content: str
    theme_tags: list[SummaryEntityTag] | None = Field(default=None)
    people_tags: list[SummaryEntityTag] | None = Field(default=None)
    place_tags: list[SummaryEntityTag] | None = Field(default=None)


class CommentaryRequest(BaseModel):
    book: str
    chapter: int
    verse: int | None = None
    source: str | None = None  # if None, return all available


class SummaryEntityReferenceOut(BaseModel):
    commentary_id: int
    book_number: int
    book_name: str
    chapter: int


class SummaryEntityPageOut(BaseModel):
    kind: str
    slug: str
    label: str
    references: list[SummaryEntityReferenceOut]


class SummaryEntityListItemOut(BaseModel):
    slug: str
    label: str
