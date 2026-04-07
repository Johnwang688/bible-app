from __future__ import annotations

from datetime import UTC, datetime
from typing import Any

from fastapi import HTTPException
from gotrue.errors import AuthApiError

from app.core.supabase_client import create_supabase, get_supabase_admin
from app.schemas.account import (
    AuthResponse,
    ReadingProgressIn,
    ReadingProgressOut,
    StudyItemCreate,
    StudyItemOut,
    StudyItemUpdate,
    UserProfile,
    UserProfileUpdate,
    UserSettingsIn,
    UserSettingsOut,
)


def _require_session(response: Any, message: str) -> AuthResponse:
    session = getattr(response, "session", None)
    user = getattr(response, "user", None) or getattr(session, "user", None)
    if not session or not user:
        raise HTTPException(status_code=400, detail=message)
    return AuthResponse(
        access_token=session.access_token,
        refresh_token=session.refresh_token,
        user_id=user.id,
        email=user.email or "",
    )


def sign_up_user(email: str, password: str, display_name: str | None = None) -> AuthResponse:
    admin = get_supabase_admin()
    # Create the user via admin API so we can auto-confirm the email without
    # relying on Supabase's email sender (which has tight rate limits).
    try:
        admin.auth.admin.create_user(
            {
                "email": email,
                "password": password,
                "email_confirm": True,
                "user_metadata": {"full_name": display_name} if display_name else {},
            }
        )
    except AuthApiError as exc:
        status = 409 if "already registered" in str(exc).lower() else 400
        raise HTTPException(status_code=status, detail=str(exc)) from exc

    # Sign in immediately to return a live session.
    client = create_supabase()
    try:
        response = client.auth.sign_in_with_password({"email": email, "password": password})
    except AuthApiError as exc:
        raise HTTPException(status_code=400, detail=str(exc)) from exc
    return _require_session(response, "Sign-up succeeded but could not create a session.")


def sign_in_user(email: str, password: str) -> AuthResponse:
    client = create_supabase()
    try:
        response = client.auth.sign_in_with_password({"email": email, "password": password})
    except AuthApiError as exc:
        raise HTTPException(status_code=401, detail="Invalid email or password.") from exc
    return _require_session(response, "Invalid email or password.")


def refresh_user_session(refresh_token: str) -> AuthResponse:
    client = create_supabase()
    response = client.auth.refresh_session(refresh_token)
    return _require_session(response, "Could not refresh the session.")


def sign_out_user(access_token: str) -> None:
    client = create_supabase()
    client.auth.admin.sign_out(access_token, "global")


def get_profile(user_id: str) -> UserProfile:
    db = get_supabase_admin()
    result = (
        db.table("profiles")
        .select("id, email, display_name, avatar_url, preferred_translation, preferred_language")
        .eq("id", user_id)
        .limit(1)
        .execute()
    )
    row = (result.data or [None])[0]
    if not row:
        raise HTTPException(status_code=404, detail="Profile not found.")
    return UserProfile(**row)


def update_profile(user_id: str, payload: UserProfileUpdate) -> UserProfile:
    db = get_supabase_admin()
    updates = payload.model_dump(exclude_none=True)
    if updates:
        updates["updated_at"] = datetime.now(UTC).isoformat()
        db.table("profiles").update(updates).eq("id", user_id).execute()
    return get_profile(user_id)


def list_study_items(user_id: str) -> list[StudyItemOut]:
    db = get_supabase_admin()
    result = (
        db.table("study_items")
        .select("*")
        .eq("user_id", user_id)
        .order("updated_at", desc=True)
        .execute()
    )
    return [StudyItemOut(**row) for row in (result.data or [])]


def create_study_item(user_id: str, payload: StudyItemCreate) -> StudyItemOut:
    db = get_supabase_admin()
    row = payload.model_dump()
    row["user_id"] = user_id
    result = db.table("study_items").insert(row).execute()
    created = (result.data or [None])[0]
    if not created:
        raise HTTPException(status_code=500, detail="Could not create study item.")
    return StudyItemOut(**created)


def replace_study_items(user_id: str, items: list[StudyItemCreate]) -> list[StudyItemOut]:
    db = get_supabase_admin()
    db.table("study_items").delete().eq("user_id", user_id).execute()
    payload = []
    for item in items:
        row = item.model_dump()
        row["user_id"] = user_id
        payload.append(row)
    if payload:
        db.table("study_items").insert(payload).execute()
    return list_study_items(user_id)


def update_study_item(user_id: str, item_id: int, payload: StudyItemUpdate) -> StudyItemOut:
    db = get_supabase_admin()
    updates = payload.model_dump(exclude_none=True)
    if not updates:
        existing = (
            db.table("study_items")
            .select("*")
            .eq("id", item_id)
            .eq("user_id", user_id)
            .limit(1)
            .execute()
        )
        row = (existing.data or [None])[0]
    else:
        result = (
            db.table("study_items")
            .update(updates)
            .eq("id", item_id)
            .eq("user_id", user_id)
            .execute()
        )
        row = (result.data or [None])[0]
    if not row:
        raise HTTPException(status_code=404, detail="Study item not found.")
    return StudyItemOut(**row)


def delete_study_item(user_id: str, item_id: int) -> None:
    db = get_supabase_admin()
    result = db.table("study_items").delete().eq("id", item_id).eq("user_id", user_id).execute()
    if result.data is not None and len(result.data) == 0:
        raise HTTPException(status_code=404, detail="Study item not found.")


def get_reading_progress(user_id: str) -> list[ReadingProgressOut]:
    db = get_supabase_admin()
    result = (
        db.table("reading_progress")
        .select("*")
        .eq("user_id", user_id)
        .order("updated_at", desc=True)
        .execute()
    )
    return [ReadingProgressOut(**row) for row in (result.data or [])]


def upsert_reading_progress(user_id: str, items: list[ReadingProgressIn]) -> list[ReadingProgressOut]:
    db = get_supabase_admin()
    payload = []
    for item in items:
        row = item.model_dump()
        row["user_id"] = user_id
        payload.append(row)
    if payload:
        db.table("reading_progress").upsert(payload, on_conflict="user_id,translation,book_number").execute()
    return get_reading_progress(user_id)


def get_user_settings(user_id: str) -> UserSettingsOut:
    db = get_supabase_admin()
    result = db.table("user_settings").select("*").eq("user_id", user_id).limit(1).execute()
    row = (result.data or [None])[0]
    if not row:
        defaults = UserSettingsIn()
        payload = defaults.model_dump()
        payload["user_id"] = user_id
        try:
            db.table("user_settings").upsert(payload, on_conflict="user_id").execute()
        except Exception:
            # DB schema may be behind pending migrations; fall back to in-memory defaults
            pass
        return UserSettingsOut(user_id=user_id, **defaults.model_dump())
    # Row exists — coerce legacy string values to current schema
    _coerce_settings_row(row)
    try:
        return UserSettingsOut(**row)
    except Exception:
        return UserSettingsOut(user_id=user_id, **UserSettingsIn().model_dump())


def _coerce_settings_row(row: dict) -> None:
    """Map legacy column values to current schema values in-place."""
    _font_scale_map = {"comfortable": "18", "large": "20", "xlarge": "24"}
    _line_height_map = {"relaxed": "1.5", "airy": "2"}
    if row.get("font_scale") in _font_scale_map:
        row["font_scale"] = _font_scale_map[row["font_scale"]]
    if row.get("line_height") in _line_height_map:
        row["line_height"] = _line_height_map[row["line_height"]]
    if "page_flip_enabled" not in row:
        row["page_flip_enabled"] = True
    if "side_panel_position" not in row:
        row["side_panel_position"] = "right"
    _fonts = {"georgia", "charter", "palatino", "garamond", "times", "sans"}
    _highlights = {"yellow", "amber", "green", "blue", "pink", "lavender", "mint"}
    if row.get("reader_font") not in _fonts:
        row["reader_font"] = "georgia"
    if row.get("highlight_color") not in _highlights:
        row["highlight_color"] = "yellow"


def upsert_user_settings(user_id: str, payload: UserSettingsIn) -> UserSettingsOut:
    db = get_supabase_admin()
    row = payload.model_dump()
    row["user_id"] = user_id
    try:
        db.table("user_settings").upsert(row, on_conflict="user_id").execute()
    except Exception:
        # DB schema may be behind pending migrations; partial upsert with known columns
        safe_row = {k: v for k, v in row.items() if k not in ("page_flip_enabled",)}
        try:
            db.table("user_settings").upsert(safe_row, on_conflict="user_id").execute()
        except Exception:
            pass
    return get_user_settings(user_id)
