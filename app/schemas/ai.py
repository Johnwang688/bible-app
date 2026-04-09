from __future__ import annotations

from enum import Enum
from typing import Literal

from pydantic import BaseModel, Field


class AIActionType(str, Enum):
    NAVIGATE = "navigate"
    OPEN_COMMENTARY = "open_commentary"


class AIContext(BaseModel):
    book: str
    chapter: int
    translation: str = "WEB"


class AIHistoryMessage(BaseModel):
    role: Literal["user", "assistant"]
    content: str


class AIActionParams(BaseModel):
    book: str | None = None
    chapter: int | None = None
    verse_start: int | None = None
    verse_end: int | None = None
    source: str | None = None


class AIAction(BaseModel):
    type: AIActionType
    label: str
    description: str = ""
    params: AIActionParams = Field(default_factory=AIActionParams)


class AdditionalChapter(BaseModel):
    book: str
    chapter: int


class AIChatRequest(BaseModel):
    message: str
    context: AIContext
    conversation_history: list[AIHistoryMessage] = Field(default_factory=list)
    additional_chapters: list[AdditionalChapter] = Field(default_factory=list)
    personality: str = "jessica"


class AIModelResponse(BaseModel):
    message: str
    references: list[str] = Field(default_factory=list)
    actions: list[AIAction] = Field(default_factory=list)
    suggested_follow_ups: list[str] = Field(default_factory=list)


class AIChatResponse(AIModelResponse):
    context_label: str


class EntityContentRequest(BaseModel):
    prompt: str
    max_tokens: int = 3500


class EntityContentResponse(BaseModel):
    content: str
