import re
from typing import Literal

from pydantic import BaseModel, EmailStr, field_validator


class UserSignUp(BaseModel):
    email: EmailStr
    password: str
    display_name: str | None = None

    @field_validator("password")
    @classmethod
    def password_strength(cls, v: str) -> str:
        if len(v) < 8:
            raise ValueError("Password must be at least 8 characters.")
        if not re.search(r"[A-Za-z]", v):
            raise ValueError("Password must contain at least one letter.")
        if not re.search(r"[0-9!@#$%^&*()_+\-=\[\]{};':\"\\|,.<>/?]", v):
            raise ValueError("Password must contain at least one number or special character.")
        return v


class UserSignIn(BaseModel):
    email: str
    password: str


class RefreshSessionRequest(BaseModel):
    refresh_token: str


class AuthResponse(BaseModel):
    access_token: str
    refresh_token: str
    user_id: str
    email: str


class UserProfile(BaseModel):
    id: str
    email: str
    display_name: str | None = None
    avatar_url: str | None = None
    preferred_translation: str = "WEB"
    preferred_language: str = "en"


class UserProfileUpdate(BaseModel):
    display_name: str | None = None
    avatar_url: str | None = None
    preferred_translation: str | None = None
    preferred_language: str | None = None


StudyItemKind = Literal["highlight", "bookmark", "note"]


class StudyItemCreate(BaseModel):
    translation: str
    book_number: int
    chapter: int
    verse_start: int
    verse_end: int | None = None
    kind: StudyItemKind
    color: str | None = None
    note: str | None = None


class StudyItemUpdate(BaseModel):
    translation: str | None = None
    book_number: int | None = None
    chapter: int | None = None
    verse_start: int | None = None
    verse_end: int | None = None
    kind: StudyItemKind | None = None
    color: str | None = None
    note: str | None = None


class StudyItemOut(BaseModel):
    id: int
    user_id: str
    translation: str
    book_number: int
    chapter: int
    verse_start: int
    verse_end: int | None = None
    kind: StudyItemKind
    color: str | None = None
    note: str | None = None
    created_at: str | None = None
    updated_at: str | None = None


class ReadingProgressIn(BaseModel):
    translation: str
    book_number: int
    chapter: int
    last_verse: int = 1


class ReadingProgressOut(BaseModel):
    id: int | None = None
    user_id: str
    translation: str
    book_number: int
    chapter: int
    last_verse: int = 1
    updated_at: str | None = None


DefaultPanel = Literal["none", "commentary", "ai", "study"]
FontScale = Literal["8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28", "30"]
LineHeight = Literal["1.5", "2", "2.5"]
SidePanelPosition = Literal["left", "right"]
ReaderFont = Literal["georgia", "charter", "palatino", "garamond", "times", "sans", "openSans", "dyslexie"]
HighlightColor = Literal["yellow", "amber", "green", "blue", "pink", "lavender", "mint"]
ReadingMode = Literal["single", "book", "paged-single", "paged-double"]


class RecentPassage(BaseModel):
    book: str
    chapter: int
    translation: str
    saved_at: int


class UserSettingsIn(BaseModel):
    theme: str = "default"
    font_scale: FontScale = "20"
    line_height: LineHeight = "2"
    reduced_motion: bool = False
    page_flip_enabled: bool = True
    default_panel: DefaultPanel = "none"
    side_panel_position: SidePanelPosition = "right"
    reader_font: ReaderFont = "georgia"
    highlight_color: HighlightColor = "yellow"
    reading_mode: ReadingMode = "single"
    recent_passages: list[RecentPassage] = []


class UserSettingsOut(UserSettingsIn):
    user_id: str
    updated_at: str | None = None
