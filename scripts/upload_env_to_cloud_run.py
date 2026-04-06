#!/usr/bin/env python3
"""
Single-use helper: read selected variables from the repo-root .env file and
apply them to a Cloud Run service via `gcloud` (plain env vars only).

Requirements:
  - Authenticated `gcloud` CLI (same account/project as your service).
  - `python-dotenv` (already in this repo's requirements.txt).

Usage (from repo root, with .venv activated):
  python scripts/upload_env_to_cloud_run.py
  python scripts/upload_env_to_cloud_run.py --dry-run
  python scripts/upload_env_to_cloud_run.py --service bible-api --region us-south1

Notes:
  - Merges with existing *plain* env vars on the service so keys you omit in .env
    keep their current Cloud Run values.
  - If the service uses Secret Manager references (valueFrom) on any env var,
    this script aborts unless you pass --drop-secret-refs (you will need to
    re-add those in the console).
  - Does not upload your .env file to Google; only runs a local gcloud update.
"""

from __future__ import annotations

import argparse
import json
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

try:
    from dotenv import dotenv_values
except ImportError:
    print("Install dependencies: pip install python-dotenv", file=sys.stderr)
    sys.exit(1)

# Keys we sync from .env (matches .env.example / backend Settings).
_WHITELIST = frozenset(
    {
        "SUPABASE_URL",
        "SUPABASE_ANON_KEY",
        "SUPABASE_SERVICE_ROLE_KEY",
        "OPENAI_API_KEY",
        "OPENAI_MODEL",
        "GOOGLE_CLIENT_ID",
        "GOOGLE_CLIENT_SECRET",
        "APP_NAME",
        "APP_ENV",
        "APP_SECRET_KEY",
        "CORS_ORIGINS",
        "DEFAULT_TRANSLATION",
    }
)


def _repo_root() -> Path:
    return Path(__file__).resolve().parent.parent


def _load_dotenv_whitelist(env_path: Path) -> dict[str, str]:
    raw = dotenv_values(env_path)
    out: dict[str, str] = {}
    for key in _WHITELIST:
        if key not in raw:
            continue
        val = raw[key]
        if val is None or str(val).strip() == "":
            continue
        out[key] = str(val).strip()
    return out


def _resolve_gcloud() -> str:
    """
    Windows: subprocess does not apply PATHEXT, so `gcloud` alone often fails even
    when `gcloud.cmd` is on PATH. Resolve the real path (or use GCLOUD_PATH).
    """
    override = os.environ.get("GCLOUD_PATH")
    if override:
        p = Path(override)
        if p.is_file():
            return str(p)
    for name in ("gcloud", "gcloud.cmd", "gcloud.exe"):
        found = shutil.which(name)
        if found:
            return found
    raise FileNotFoundError(
        "gcloud CLI not found. Use a shell where `gcloud` works, add Google Cloud SDK\\bin "
        "to your user PATH, or set GCLOUD_PATH to the full path of gcloud.cmd "
        r'(e.g. C:\Users\YOU\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin\gcloud.cmd).'
    )


def _gcloud_json(gcloud: str, args: list[str]) -> dict:
    proc = subprocess.run(
        [gcloud, *args],
        check=True,
        capture_output=True,
        text=True,
    )
    return json.loads(proc.stdout)


def _describe_service_env(
    gcloud: str, service: str, region: str, project: str | None
) -> tuple[list[str], dict[str, str]]:
    """Return (names_that_use_secret_refs, plain_name_value)."""
    base = [
        "run",
        "services",
        "describe",
        service,
        "--region",
        region,
        "--format",
        "json",
    ]
    if project:
        base = ["--project", project, *base]
    data = _gcloud_json(gcloud, base)
    env_list = (
        data.get("spec", {})
        .get("template", {})
        .get("spec", {})
        .get("containers", [{}])[0]
        .get("env", [])
    )
    secret_names: list[str] = []
    plain: dict[str, str] = {}
    for item in env_list:
        name = item.get("name")
        if not name:
            continue
        if "valueFrom" in item:
            secret_names.append(name)
            continue
        if "value" in item:
            plain[name] = item["value"]
    return secret_names, plain


def _emit_env_yaml(env: dict[str, str]) -> str:
    """One key per line; values as JSON-encoded scalars (valid in YAML)."""
    lines = [f"{k}: {json.dumps(v)}" for k, v in sorted(env.items())]
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description="Push whitelisted .env keys to Cloud Run.")
    parser.add_argument("--service", default="bible-api", help="Cloud Run service name")
    parser.add_argument("--region", default="us-south1", help="Cloud Run region")
    parser.add_argument(
        "--project",
        default=None,
        help="GCP project ID (defaults to gcloud config)",
    )
    parser.add_argument(
        "--env-file",
        type=Path,
        default=None,
        help="Path to .env (default: .env in repo root)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print merged env keys and YAML; do not call gcloud update",
    )
    parser.add_argument(
        "--drop-secret-refs",
        action="store_true",
        help="If any env vars use Secret Manager refs, drop them and continue (unsafe).",
    )
    args = parser.parse_args()

    root = _repo_root()
    env_path = args.env_file or (root / ".env")
    if not env_path.is_file():
        print(f"Missing .env at {env_path}", file=sys.stderr)
        return 1

    try:
        gcloud_exe = _resolve_gcloud()
    except FileNotFoundError as e:
        print(str(e), file=sys.stderr)
        return 1

    try:
        secret_refs, cloud_plain = _describe_service_env(
            gcloud_exe, args.service, args.region, args.project
        )
    except subprocess.CalledProcessError as e:
        print(e.stderr or e.stdout or str(e), file=sys.stderr)
        return 1

    if secret_refs and not args.drop_secret_refs:
        print(
            "This service has environment variables backed by secrets "
            f"(valueFrom): {', '.join(secret_refs)}.\n"
            "This script only applies plain values. Use the console, or re-run with "
            "--drop-secret-refs after you understand those bindings will be removed.",
            file=sys.stderr,
        )
        return 1

    from_dotenv = _load_dotenv_whitelist(env_path)
    if not from_dotenv:
        print(
            "No whitelisted keys with non-empty values found in .env; nothing to apply.",
            file=sys.stderr,
        )
        return 1

    merged = {**cloud_plain, **from_dotenv}

    yaml_body = _emit_env_yaml(merged)
    if args.dry_run:
        print("Merged env (count {}): {}".format(len(merged), ", ".join(sorted(merged))))
        print("--- env-vars-file ---")
        print(yaml_body)
        return 0

    update_cmd = [
        gcloud_exe,
        "run",
        "services",
        "update",
        args.service,
        "--region",
        args.region,
    ]
    if args.project:
        update_cmd.extend(["--project", args.project])

    with tempfile.NamedTemporaryFile(
        mode="w",
        suffix=".yaml",
        delete=False,
        encoding="utf-8",
        newline="\n",
    ) as tmp:
        tmp.write(yaml_body)
        tmp_path = tmp.name

    update_cmd.append(f"--env-vars-file={tmp_path}")

    try:
        subprocess.run(update_cmd, check=True)
    except subprocess.CalledProcessError:
        return 1
    finally:
        Path(tmp_path).unlink(missing_ok=True)

    print(
        f"Updated Cloud Run service {args.service!r} in {args.region!r} "
        f"with {len(merged)} environment variable(s)."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
