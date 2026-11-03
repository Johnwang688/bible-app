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

Bounded on the request path (security review 4, S4-6). Verification fetches App Check's signing keys (JWKS) over
the network, so it runs on a small worker pool and the request waits for it only so long:

- monitor mode waits at most ``MONITOR_WAIT_SECONDS``; a verification still running then finishes off the request
  path and logs its outcome when it ends (monitor mode never changes an answer, so it never holds one for long);
- enforce mode waits at most ``ENFORCE_WAIT_SECONDS``; a verification still running then is a 503 (it could not be
  checked in time), like any other infrastructure failure;
- at most ``MAX_IN_FLIGHT`` verifications run at once; past that, monitor mode skips the check (logged) and enforce
  mode answers 503, so a hung key endpoint cannot pile up threads.

The key fetch itself gets a ``KEY_FETCH_TIMEOUT_SECONDS`` timeout (firebase_admin sets none, so PyJWT's 30 s
applied), and fetches are throttled: a token whose key id matches no cached key refetches the key set at most once
per ``KEY_REFETCH_INTERVAL_SECONDS`` (otherwise it is refused as invalid at once), and after a failed fetch no new
fetch is tried for ``KEY_FETCH_BACKOFF_SECONDS`` (the check is "unavailable" at once meanwhile). Both are set on the
key client firebase_admin keeps per app, once (``_guard_key_client``); if those internals ever change, that step is
skipped and the waits above still bound the request.
"""

from __future__ import annotations

import logging
import threading
import time
from concurrent.futures import Future, ThreadPoolExecutor
from concurrent.futures import TimeoutError as FutureTimeout
from enum import Enum
from typing import Any, Callable

import firebase_admin
import jwt
from firebase_admin import app_check

from app.core.config import get_settings

logger = logging.getLogger(__name__)

APP_CHECK_HEADER = "X-Firebase-AppCheck"

MONITOR_WAIT_SECONDS = 0.25
ENFORCE_WAIT_SECONDS = 5.0
MAX_IN_FLIGHT = 8
KEY_FETCH_TIMEOUT_SECONDS = 3.0
KEY_REFETCH_INTERVAL_SECONDS = 60.0
KEY_FETCH_BACKOFF_SECONDS = 5.0


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


# ---- The key client: a fetch timeout and a fetch throttle -------------------------------------------------------

_guard_lock = threading.Lock()


def _guard_key_client(app: firebase_admin.App) -> None:
    """Bound the JWKS fetches of firebase_admin's App Check key client for ``app`` (once per client).

    Reaches into firebase_admin (``_get_app_check_service``, ``_jwks_client``) and PyJWT (``fetch_data``,
    ``timeout``, ``jwk_set_cache``); anything missing or unexpected skips the step. Never raises.
    """
    try:
        service = app_check._get_app_check_service(app)
        client = getattr(service, "_jwks_client", None)
        if not isinstance(client, jwt.PyJWKClient):
            return
        with _guard_lock:
            if getattr(client, "_bible_app_guarded", False):
                return
            client.timeout = min(float(client.timeout), KEY_FETCH_TIMEOUT_SECONDS)
            client.fetch_data = _throttled_fetch(client, client.fetch_data)  # type: ignore[method-assign]
            client._bible_app_guarded = True  # type: ignore[attr-defined]
    except Exception:  # an app without a project id, a test double, changed internals: verify as it comes
        return


def _throttled_fetch(client: jwt.PyJWKClient, fetch: Callable[[], Any]) -> Callable[[], Any]:
    """``fetch`` (PyJWKClient.fetch_data), refusing at once when a fetch now would be a refetch for an unknown key
    id within the interval, or a retry within the backoff after a failure."""
    last_attempt: list[float] = []
    last_failure: list[float] = []
    lock = threading.Lock()

    def fetch_data() -> Any:
        now = time.monotonic()
        with lock:
            cache = getattr(client, "jwk_set_cache", None)
            cached = cache is not None and cache.get() is not None
            if cached and last_attempt and now - last_attempt[0] < KEY_REFETCH_INTERVAL_SECONDS:
                # PyJWT refetches the whole key set for a key id the cached set lacks (a forged token's).
                raise jwt.PyJWKClientError("App Check key id unknown (refetch throttled)")
            if not cached and last_failure and now - last_failure[0] < KEY_FETCH_BACKOFF_SECONDS:
                raise jwt.PyJWKClientConnectionError("App Check key fetch backing off after a failure")
            last_attempt[:] = [now]
        try:
            return fetch()
        except Exception:
            with lock:
                last_failure[:] = [time.monotonic()]
            raise

    return fetch_data


# ---- Bounded verification ----------------------------------------------------------------------------------------

_executor = ThreadPoolExecutor(max_workers=MAX_IN_FLIGHT, thread_name_prefix="app-check")
_slots = threading.BoundedSemaphore(MAX_IN_FLIGHT)


def _verify_in_slot(token: str, app: firebase_admin.App) -> tuple[AppCheckOutcome, str | None]:
    try:
        _guard_key_client(app)
        return verify_app_check(token, app)
    finally:
        _slots.release()


def _log_outcome(outcome: AppCheckOutcome, error_type: str | None) -> None:
    if outcome is AppCheckOutcome.MISSING:
        logger.warning("App Check token missing")
    elif outcome is AppCheckOutcome.INVALID:
        logger.warning("App Check token invalid: %s", error_type)
    elif outcome is AppCheckOutcome.UNAVAILABLE:
        # Monitor mode counts this as invalid (it cannot be verified); enforce mode answers 503.
        logger.warning("App Check token invalid (verification unavailable): %s", error_type)


def _log_when_done(future: Future) -> None:
    """Monitor mode: log the outcome of a verification the request stopped waiting for. Never raises."""
    try:
        _log_outcome(*future.result())
    except Exception as exc:
        logger.warning("App Check token invalid (verification unavailable): %s", type(exc).__name__)


def _bounded_verify(
    token: str | None, app: firebase_admin.App, mode: AppCheckMode
) -> tuple[AppCheckOutcome, str | None] | None:
    """The outcome, or None when monitor mode stopped waiting (then it is logged when it ends, off the request)."""
    token = (token or "").strip()
    if not token:
        return AppCheckOutcome.MISSING, None
    if not _slots.acquire(blocking=False):
        return AppCheckOutcome.UNAVAILABLE, "TooManyVerifications"
    try:
        future = _executor.submit(_verify_in_slot, token, app)
    except Exception as exc:  # the pool is shut down (interpreter exit)
        _slots.release()
        return AppCheckOutcome.UNAVAILABLE, type(exc).__name__
    wait = MONITOR_WAIT_SECONDS if mode is AppCheckMode.MONITOR else ENFORCE_WAIT_SECONDS
    try:
        return future.result(timeout=wait)
    except FutureTimeout:
        if mode is AppCheckMode.MONITOR:
            future.add_done_callback(_log_when_done)
            return None
        return AppCheckOutcome.UNAVAILABLE, "Timeout"
    except Exception as exc:  # verify_app_check never raises; belt and braces
        return AppCheckOutcome.UNAVAILABLE, type(exc).__name__


def check_app_check(token: str | None, app: firebase_admin.App) -> None:
    """Apply ``APP_CHECK_MODE`` to the request's App Check token (call only after the ID token is accepted).

    Returns when the request may go on; raises ``AppCheckRefused`` in enforce mode. Waits for the verification at
    most ``MONITOR_WAIT_SECONDS`` (monitor; a slower one is logged when it ends) or ``ENFORCE_WAIT_SECONDS``.
    """
    mode = app_check_mode()
    if mode is AppCheckMode.OFF:
        return
    result = _bounded_verify(token, app, mode)
    if result is None:
        return
    outcome, error_type = result
    if outcome is AppCheckOutcome.VERIFIED:
        return
    _log_outcome(outcome, error_type)
    if mode is AppCheckMode.ENFORCE:
        raise AppCheckRefused(unavailable=outcome is AppCheckOutcome.UNAVAILABLE)
