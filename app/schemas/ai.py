from pydantic import BaseModel
from enum import Enum


class AgentType(str, Enum):
    ORCHESTRATOR = "orchestrator"
    SUMMARIZER = "summarizer"
    VERSE_AGENT = "verse_agent"


class AIRequest(BaseModel):
    """General AI chat request from the user."""
    message: str
    context: dict | None = None  # current book/chapter/verse, highlights, etc.
    conversation_history: list[dict] = []


class SummarizeRequest(BaseModel):
    """Request to summarize highlighted text."""
    text: str
    source_type: str  # "verse" or "commentary"
    reference: str | None = None  # e.g. "John 3:16" or "Matthew Henry on John 3"


class AIAction(BaseModel):
    """An action the AI wants the frontend to perform."""
    action: str  # "navigate", "highlight", "show_commentary", "show_verses", "scroll_to"
    params: dict


class AIResponse(BaseModel):
    """Response from any AI agent."""
    message: str
    actions: list[AIAction] = []
    agent: AgentType
    suggested_follow_ups: list[str] = []


class SummarizeResponse(BaseModel):
    summary: str
    key_points: list[str] = []
    related_verses: list[str] = []
