from pydantic import BaseModel


class UserSignUp(BaseModel):
    email: str
    password: str


class UserSignIn(BaseModel):
    email: str
    password: str


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
