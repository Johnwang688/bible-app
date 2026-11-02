"""Firebase ID-token verification for user endpoints.

The Firebase Admin app is created lazily on first use (never at import) with Application Default
Credentials and the configured project id. No key files are read or written.

Security notes:
- Tokens are verified with ``check_revoked=True`` so revoked sessions and disabled users are refused.
- Never log the token or its claims; only the exception type.
- ``FIREBASE_AUTH_EMULATOR_HOST`` makes the Admin SDK accept unsigned tokens, and ``FIRESTORE_EMULATOR_HOST``
  sends the Admin SDK's Firestore client (the delete's marker and wipe) to another host. If **either** is
  set, endpoints that act on data (``get_firebase_user``, and the delete itself through
  ``emulator_refused``) need the full, explicit emulator setup: ``app_env == "development"``,
  ``ALLOW_FIREBASE_EMULATORS=1``, **both** variables set and a ``demo-`` project id (a demo project can never
  reach real Firebase). The identity-only ``get_firebase_identity`` (whoami, no data) needs just
  ``app_env == "development"``. Anything else with either variable set is refused (503) and logged, before
  any token verification or Firestore call.
- App Check (``app.core.app_check``): the ``X-Firebase-AppCheck`` header is checked only **after** the ID token
  is accepted, per ``APP_CHECK_MODE`` (monitor logs, enforce refuses with the same 401, off ignores it).
- The uid is used as a Firestore path segment, so a uid outside ``[A-Za-z0-9_-]{1,128}`` is refused (401)
  before any use ('/' would split the path into another user's tree).
"""

from __future__ import annotations

import logging
import os
import re
import threading
from dataclasses import dataclass

import firebase_admin
from fastapi import Depends, Header, HTTPException, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from firebase_admin import auth

from app.core.app_check import APP_CHECK_HEADER, AppCheckRefused, check_app_check
from app.core.config import get_settings

logger = logging.getLogger(__name__)

_bearer = HTTPBearer(auto_error=False)

_app_lock = threading.Lock()
_app: firebase_admin.App | None = None

# A uid that is safe as a single Firestore path segment (Firebase's own uids are 28 such characters).
_UID_RE = re.compile(r"[A-Za-z0-9_-]{1,128}")

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


_EMULATOR_VARS = ("FIREBASE_AUTH_EMULATOR_HOST", "FIRESTORE_EMULATOR_HOST")


def emulator_refused(*, data_access: bool = True) -> bool:
    """True when a Firebase emulator variable is set but must not be honoured for this request.

    The one check for both token verification and the account delete; read at request time. If either
    ``FIREBASE_AUTH_EMULATOR_HOST`` or ``FIRESTORE_EMULATOR_HOST`` is set, ``data_access`` callers need the
    full emulator setup (see the module docstring); identity-only callers need only the development
    environment. Logs an error when it refuses.
    """
    present = [name for name in _EMULATOR_VARS if os.environ.get(name)]
    if not present:
        return False
    settings = get_settings()
    allowed = settings.app_env == "development"
    if data_access:
        allowed = (
            allowed
            and os.environ.get("ALLOW_FIREBASE_EMULATORS") == "1"
            and all(os.environ.get(name) for name in _EMULATOR_VARS)
            and str(settings.firebase_project_id or "").startswith("demo-")
        )
    if allowed:
        return False
    logger.error(
        "%s set without the full emulator setup (development, ALLOW_FIREBASE_EMULATORS=1, "
        "FIREBASE_AUTH_EMULATOR_HOST and FIRESTORE_EMULATOR_HOST, a demo- project); refusing Firebase calls",
        " and ".join(present),
    )
    return True


def _verify(
    credentials: HTTPAuthorizationCredentials | None, app_check_token: str | None, *, data_access: bool
) -> FirebaseUser:
    if credentials is None or (credentials.scheme or "").lower() != "bearer":
        raise _unauthorized()
    token = (credentials.credentials or "").strip()
    if not token:
        raise _unauthorized()

    if emulator_refused(data_access=data_access):
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
    if not isinstance(uid, str) or not _UID_RE.fullmatch(uid):
        logger.warning("Firebase token rejected: unacceptable uid")
        raise _unauthorized()

    email = claims.get("email")
    if not isinstance(email, str) or not email:
        email = None
    raw_auth_time = claims.get("auth_time")
    auth_time: int | None = None
    if isinstance(raw_auth_time, (int, float)) and not isinstance(raw_auth_time, bool):
        auth_time = int(raw_auth_time)

    # App Check, only once the ID token is accepted (so a bad ID token is a 401 whatever the mode).
    try:
        check_app_check(app_check_token, app)
    except AppCheckRefused as refused:
        raise (_unavailable() if refused.unavailable else _unauthorized()) from None

    return FirebaseUser(uid=uid, email=email, auth_time=auth_time)


def get_firebase_user(
    credentials: HTTPAuthorizationCredentials | None = Depends(_bearer),
    app_check_token: str | None = Header(default=None, alias=APP_CHECK_HEADER),
) -> FirebaseUser:
    """FastAPI dependency: verify the Bearer Firebase ID token (then App Check) and return the signed-in user.

    The default for any endpoint that reads or changes data: the Firebase emulators are honoured only with the
    full emulator setup.
    """
    return _verify(credentials, app_check_token, data_access=True)


def get_firebase_identity(
    credentials: HTTPAuthorizationCredentials | None = Depends(_bearer),
    app_check_token: str | None = Header(default=None, alias=APP_CHECK_HEADER),
) -> FirebaseUser:
    """Like ``get_firebase_user``, for endpoints that only echo the token's own identity (whoami) and touch
    no data: the emulators are honoured in development without the full emulator setup."""
    return _verify(credentials, app_check_token, data_access=False)
