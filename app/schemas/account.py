from typing import Literal

from pydantic import BaseModel


class UserSignUp(BaseModel):
    email: str
    password: str
    display_name: str | None = None


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
FontScale = Literal["comfortable", "large", "xlarge"]
LineHeight = Literal["relaxed", "airy"]


class RecentPassage(BaseModel):
    book: str
    chapter: int
    translation: str
    saved_at: int


class UserSettingsIn(BaseModel):
    theme: str = "default"
    font_scale: FontScale = "comfortable"
    line_height: LineHeight = "relaxed"
    reduced_motion: bool = False
    high_contrast: bool = False
    default_panel: DefaultPanel = "none"
    recent_passages: list[RecentPassage] = []


class UserSettingsOut(UserSettingsIn):
    user_id: str
    updated_at: str | None = None
