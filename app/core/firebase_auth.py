"""Firebase ID-token verification for user endpoints.

The Firebase Admin app is created lazily on first use (never at import) with Application Default
Credentials and the configured project id. No key files are read or written.

Security notes:
- Tokens are verified with ``check_revoked=True`` so revoked sessions and disabled users are refused.
- Never log the token or its claims; only the exception type.
- ``FIREBASE_AUTH_EMULATOR_HOST`` makes the Admin SDK accept unsigned tokens, so it is refused outside
  development.
"""

from __future__ import annotations

import logging
import os
import threading
from dataclasses import dataclass

import firebase_admin
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from firebase_admin import auth

from app.core.config import get_settings

logger = logging.getLogger(__name__)

_bearer = HTTPBearer(auto_error=False)

_app_lock = threading.Lock()
_app: firebase_admin.App | None = None

INVALID_TOKEN_DETAIL = "Invalid token"  # must not hint at the reason (expired / revoked / disabled)
UNAVAILABLE_DETAIL = "Sign-in is unavailable"

# Errors that mean "this token is not acceptable" (401). UserNotFoundError covers a token whose user has
# since been deleted (check_revoked looks the user up), e.g. a retried account deletion.
_REJECTED_TOKEN_ERRORS: tuple[type[BaseException], ...] = (
    auth.InvalidIdTokenError,  # includes ExpiredIdTokenError and RevokedIdTokenError
    auth.ExpiredIdTokenError,
    auth.RevokedIdTokenError,
    auth.UserDisabledError,
    auth.UserNotFoundError,
    ValueError,
)


class FirebaseUnavailable(Exception):
    """The Admin SDK could not be initialised (for example ADC missing)."""


@dataclass(frozen=True)
class FirebaseUser:
    uid: str
    email: str | None
    auth_time: int | None


def get_firebase_app() -> firebase_admin.App:
    """Return the default Firebase Admin app, creating it once (thread-safe) on first use."""
    global _app
    if _app is not None:
        return _app
    with _app_lock:
        if _app is not None:
            return _app
        try:
            try:
                app = firebase_admin.get_app()
            except ValueError:
                app = firebase_admin.initialize_app(
                    firebase_admin.credentials.ApplicationDefault(),
                    options={"projectId": get_settings().firebase_project_id},
                )
        except Exception as exc:  # DefaultCredentialsError or anything else unexpected
            logger.warning("Firebase Admin initialisation failed: %s", type(exc).__name__)
            raise FirebaseUnavailable from exc
        _app = app
        return _app


def _unauthorized() -> HTTPException:
    return HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail=INVALID_TOKEN_DETAIL,
        headers={"WWW-Authenticate": "Bearer"},
    )


def _unavailable() -> HTTPException:
    return HTTPException(status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail=UNAVAILABLE_DETAIL)


def _emulator_refused() -> bool:
    if not os.environ.get("FIREBASE_AUTH_EMULATOR_HOST"):
        return False
    if get_settings().app_env == "development":
        return False
    logger.error("FIREBASE_AUTH_EMULATOR_HOST is set outside development; refusing to verify tokens")
    return True


def get_firebase_user(
    credentials: HTTPAuthorizationCredentials | None = Depends(_bearer),
) -> FirebaseUser:
    """FastAPI dependency: verify the Bearer Firebase ID token and return the signed-in user."""
    if credentials is None or (credentials.scheme or "").lower() != "bearer":
        raise _unauthorized()
    token = (credentials.credentials or "").strip()
    if not token:
        raise _unauthorized()

    if _emulator_refused():
        raise _unavailable()

    try:
        app = get_firebase_app()
    except FirebaseUnavailable:
        raise _unavailable() from None

    try:
        claims = auth.verify_id_token(token, app=app, check_revoked=True)
    except auth.CertificateFetchError as exc:
        logger.warning("Firebase token verification unavailable: %s", type(exc).__name__)
        raise _unavailable() from None
    except _REJECTED_TOKEN_ERRORS as exc:
        logger.warning("Firebase token rejected: %s", type(exc).__name__)
        raise _unauthorized() from None
    except Exception as exc:  # network / credentials problems during the revocation lookup, etc.
        logger.warning("Firebase token verification failed: %s", type(exc).__name__)
        raise _unavailable() from None

    if not isinstance(claims, dict):
        raise _unauthorized()
    uid = claims.get("uid")
    if not isinstance(uid, str) or not uid:
        raise _unauthorized()

    email = claims.get("email")
    if not isinstance(email, str) or not email:
        email = None
    raw_auth_time = claims.get("auth_time")
    auth_time: int | None = None
    if isinstance(raw_auth_time, (int, float)) and not isinstance(raw_auth_time, bool):
        auth_time = int(raw_auth_time)

    return FirebaseUser(uid=uid, email=email, auth_time=auth_time)
