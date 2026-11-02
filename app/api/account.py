"""Account endpoints for Firebase-authenticated users: who am I, and delete my data.

The uid always comes from the verified ID token, never from the query string or body.
"""

from __future__ import annotations

import logging
import time

from fastapi import APIRouter, Depends, HTTPException, Response, status
from firebase_admin import auth

from app.core.firebase_auth import FirebaseUnavailable, FirebaseUser, get_firebase_app, get_firebase_user

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/api/v1/account", tags=["account"])

# The client re-authenticates just before deleting; older sign-ins are refused.
RECENT_LOGIN_SECONDS = 300
DELETE_FAILED_DETAIL = "Couldn't delete the account. Try again."


def _delete_failed() -> HTTPException:
    return HTTPException(status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail=DELETE_FAILED_DETAIL)


@router.get("")
def read_account(user: FirebaseUser = Depends(get_firebase_user)) -> dict[str, str | None]:
    return {"uid": user.uid, "email": user.email}


@router.delete("", status_code=status.HTTP_204_NO_CONTENT, response_class=Response)
def delete_account(user: FirebaseUser = Depends(get_firebase_user)) -> Response:
    if user.auth_time is None or int(time.time()) - user.auth_time > RECENT_LOGIN_SECONDS:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="recent-login-required")

    uid = user.uid
    try:
        app = get_firebase_app()
    except FirebaseUnavailable:
        raise _delete_failed() from None

    # (b) End every session first so no client can write while the data is being removed.
    try:
        auth.revoke_refresh_tokens(uid, app=app)
    except auth.UserNotFoundError:
        pass  # already deleted by an earlier attempt; still clear any leftover data
    except Exception as exc:
        logger.warning("Account deletion: revoking tokens failed: %s", type(exc).__name__)
        raise _delete_failed() from None

    # (c) Remove all Firestore data under users/{uid}. Keep the auth user if this fails so a retry works.
    try:
        from firebase_admin import firestore

        db = firestore.client(app)
        db.recursive_delete(db.collection("users").document(uid))
    except Exception as exc:
        logger.warning("Account deletion: Firestore delete failed: %s", type(exc).__name__)
        raise _delete_failed() from None

    # (d) Delete the auth user last.
    try:
        auth.delete_user(uid, app=app)
    except auth.UserNotFoundError:
        pass
    except Exception as exc:
        logger.warning("Account deletion: deleting the auth user failed: %s", type(exc).__name__)
        raise _delete_failed() from None

    return Response(status_code=status.HTTP_204_NO_CONTENT)
