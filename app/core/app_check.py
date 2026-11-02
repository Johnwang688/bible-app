"""Firebase App Check on the backend's user endpoints (R-6b follow-up).

The client sends an App Check token in ``X-Firebase-AppCheck`` next to the Bearer ID token. It is checked only
**after** the ID token is accepted (``firebase_auth._verify``), so a request without a valid ID token is a 401 in
every mode. ``APP_CHECK_MODE`` (read per request, through ``get_settings``):

- ``monitor`` (the default): a missing or invalid token is logged as a warning naming only the outcome and the
  request goes on.
- ``enforce``: a missing or invalid token is a 401 (the same detail and ``WWW-Authenticate`` as a bad ID token); a
  verification that cannot run (network, signing keys, credentials) is a 503.
- ``off``: the header is ignored and nothing is verified.
- anything else is treated as ``enforce`` (fail closed) and logged once per value.

Never log a token or its claims; only the outcome and the exception type. ``verify_token`` is called through the
``firebase_admin.app_check`` module so tests can patch it. See docs/app-check.md for the switch to enforce.
"""

from __future__ import annotations

import logging
import threading
from enum import Enum

import firebase_admin
import jwt
from firebase_admin import app_check

from app.core.config import get_settings

logger = logging.getLogger(__name__)

APP_CHECK_HEADER = "X-Firebase-AppCheck"


class AppCheckMode(str, Enum):
    MONITOR = "monitor"
    ENFORCE = "enforce"
    OFF = "off"


class AppCheckOutcome(str, Enum):
    VERIFIED = "verified"
    MISSING = "missing"
    INVALID = "invalid"
    UNAVAILABLE = "unavailable"  # the check could not run (infrastructure), not a verdict on the token


# Errors that are a verdict on the token itself. ``PyJWKClientConnectionError`` (a subclass of
# ``PyJWKClientError``) is the signing-key fetch failing and is handled first, as UNAVAILABLE; any other
# ``PyJWKClientError`` is a token whose key id matches no App Check key (a forged token).
_REJECTED_TOKEN_ERRORS: tuple[type[BaseException], ...] = (
    ValueError,
    jwt.InvalidTokenError,
    jwt.PyJWKClientError,
)

_warned_modes: set[str] = set()
_warned_lock = threading.Lock()


def app_check_mode() -> AppCheckMode:
    """The configured mode; an unknown value is ``enforce`` (fail closed), logged once per value."""
    raw = str(get_settings().app_check_mode or "").strip().lower()
    if raw == "":
        raw = AppCheckMode.MONITOR.value
    try:
        return AppCheckMode(raw)
    except ValueError:
        with _warned_lock:
            first = raw not in _warned_modes
            _warned_modes.add(raw)
        if first:
            # The value is operator config, not a secret; cut it short anyway.
            logger.error("Unknown APP_CHECK_MODE %r; treating it as 'enforce'", raw[:32])
        return AppCheckMode.ENFORCE


class AppCheckRefused(Exception):
    """Enforce mode refuses the request. ``unavailable`` means 503 (the check could not run), else 401."""

    def __init__(self, *, unavailable: bool) -> None:
        super().__init__("App Check refused")
        self.unavailable = unavailable


def verify_app_check(token: str | None, app: firebase_admin.App) -> tuple[AppCheckOutcome, str | None]:
    """Verify an App Check token: the outcome, and the exception type's name for the log line. Never raises,
    never logs."""
    token = (token or "").strip()
    if not token:
        return AppCheckOutcome.MISSING, None
    try:
        claims = app_check.verify_token(token, app=app)
    except jwt.PyJWKClientConnectionError as exc:
        return AppCheckOutcome.UNAVAILABLE, type(exc).__name__
    except _REJECTED_TOKEN_ERRORS as exc:
        return AppCheckOutcome.INVALID, type(exc).__name__
    except Exception as exc:
        return AppCheckOutcome.UNAVAILABLE, type(exc).__name__
    if not isinstance(claims, dict):
        return AppCheckOutcome.INVALID, type(claims).__name__
    return AppCheckOutcome.VERIFIED, None


def check_app_check(token: str | None, app: firebase_admin.App) -> None:
    """Apply ``APP_CHECK_MODE`` to the request's App Check token (call only after the ID token is accepted).

    Returns when the request may go on; raises ``AppCheckRefused`` in enforce mode.
    """
    mode = app_check_mode()
    if mode is AppCheckMode.OFF:
        return
    outcome, error_type = verify_app_check(token, app)
    if outcome is AppCheckOutcome.VERIFIED:
        return
    if outcome is AppCheckOutcome.MISSING:
        logger.warning("App Check token missing")
    elif outcome is AppCheckOutcome.INVALID:
        logger.warning("App Check token invalid: %s", error_type)
    else:
        # Monitor mode counts this as invalid (it cannot be verified); enforce mode answers 503.
        logger.warning("App Check token invalid (verification unavailable): %s", error_type)
    if mode is AppCheckMode.ENFORCE:
        raise AppCheckRefused(unavailable=outcome is AppCheckOutcome.UNAVAILABLE)
