from fastapi import HTTPException
from supabase import create_client, Client

from app.core.config import get_settings

_supabase_client: Client | None = None
_supabase_admin: Client | None = None


def create_supabase() -> Client:
    settings = get_settings()
    if not (settings.supabase_url or "").strip() or not (settings.supabase_anon_key or "").strip():
        raise HTTPException(
            status_code=503,
            detail=(
                "Authentication is not configured. Set SUPABASE_URL and SUPABASE_ANON_KEY in .env "
                "(see .env.example)."
            ),
        )
    return create_client(
        settings.supabase_url,
        settings.supabase_anon_key,
    )


def create_supabase_admin() -> Client:
    settings = get_settings()
    if not (settings.supabase_url or "").strip() or not (settings.supabase_service_role_key or "").strip():
        raise HTTPException(
            status_code=503,
            detail=(
                "Server database access is not configured. Set SUPABASE_URL and "
                "SUPABASE_SERVICE_ROLE_KEY in .env (see .env.example)."
            ),
        )
    return create_client(
        settings.supabase_url,
        settings.supabase_service_role_key,
    )


def get_supabase() -> Client:
    """Public client using anon key — respects RLS policies."""
    global _supabase_client
    if _supabase_client is None:
        _supabase_client = create_supabase()
    return _supabase_client


def get_supabase_admin() -> Client:
    """Admin client using service role key — bypasses RLS. Use carefully."""
    global _supabase_admin
    if _supabase_admin is None:
        _supabase_admin = create_supabase_admin()
    return _supabase_admin
