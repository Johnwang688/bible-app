import logging

from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from gotrue.errors import AuthApiError

from app.core.supabase_client import create_supabase

logger = logging.getLogger(__name__)

security = HTTPBearer()


async def get_current_user(
    credentials: HTTPAuthorizationCredentials = Depends(security),
) -> dict:
    """
    Validate the JWT from Supabase Auth and return the user object.
    The frontend sends the access_token from Supabase in the Authorization header.
    """
    token = credentials.credentials
    supabase = create_supabase()

    try:
        user_response = supabase.auth.get_user(token)
        if user_response and user_response.user:
            return {
                "id": user_response.user.id,
                "email": user_response.user.email,
                "user_metadata": user_response.user.user_metadata,
            }
    except AuthApiError as exc:
        logger.warning("Token validation failed: %s", exc)
    except Exception:
        logger.exception("Unexpected error during token validation")

    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Invalid or expired token",
        headers={"WWW-Authenticate": "Bearer"},
    )
