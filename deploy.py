#!/usr/bin/env python3
"""
Build and deploy backend + frontend to Google Cloud Run (Artifact Registry + gcloud run deploy).

Usage (from repo root):
  python deploy.py
  python deploy.py --dry-run
  python deploy.py --backend-only
  python deploy.py --frontend-only

Requires: authenticated `gcloud` (same as manual deploy). On Windows, set GCLOUD_PATH if needed.

Override defaults with flags or env:
  DEPLOY_PROJECT, DEPLOY_REGION, DEPLOY_BACKEND_URL
"""

from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path

# Defaults match this project’s prior setup; override with flags or env.
_DEFAULT_PROJECT = "bible-app-492520"
_DEFAULT_REGION = "us-south1"
_DEFAULT_BACKEND_URL = "https://bible-api-593497511935.us-south1.run.app"


def _repo_root() -> Path:
    return Path(__file__).resolve().parent


def _resolve_gcloud() -> str:
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
        "gcloud CLI not found. Add Google Cloud SDK\\bin to PATH or set GCLOUD_PATH."
    )


def _run(
    gcloud: str,
    args: list[str],
    *,
    cwd: Path | None = None,
    dry_run: bool,
) -> None:
    cmd = [gcloud, *args]
    if dry_run:
        print(f"[dry-run] cwd={cwd or Path.cwd()}  {' '.join(cmd)}")
        return
    print(f"→ {' '.join(cmd)}")
    subprocess.run(cmd, cwd=cwd, check=True)


def main() -> int:
    parser = argparse.ArgumentParser(description="Deploy bible-api and bible-web to Cloud Run.")
    parser.add_argument(
        "--project",
        default=os.environ.get("DEPLOY_PROJECT", _DEFAULT_PROJECT),
        help="GCP project ID",
    )
    parser.add_argument(
        "--region",
        default=os.environ.get("DEPLOY_REGION", _DEFAULT_REGION),
        help="Cloud Run / Artifact Registry region",
    )
    parser.add_argument(
        "--backend-url",
        default=os.environ.get("DEPLOY_BACKEND_URL", _DEFAULT_BACKEND_URL),
        help="Public API base URL (no trailing slash); baked into Next.js rewrites at build time",
    )
    parser.add_argument("--backend-only", action="store_true", help="Only API image + deploy")
    parser.add_argument("--frontend-only", action="store_true", help="Only web image + deploy")
    parser.add_argument("--dry-run", action="store_true", help="Print gcloud commands only")
    args = parser.parse_args()

    if args.backend_only and args.frontend_only:
        print("Use only one of --backend-only / --frontend-only", file=sys.stderr)
        return 1

    root = _repo_root()
    frontend = root / "frontend-next"
    backend_url = args.backend_url.rstrip("/")
    registry = f"{args.region}-docker.pkg.dev/{args.project}/cloud-run-apps"
    api_image = f"{registry}/bible-api:latest"
    web_image = f"{registry}/bible-web:latest"

    try:
        gcloud = _resolve_gcloud()
    except FileNotFoundError as e:
        print(str(e), file=sys.stderr)
        return 1

    do_backend = not args.frontend_only
    do_frontend = not args.backend_only

    try:
        if do_backend:
            _run(
                gcloud,
                [
                    "builds",
                    "submit",
                    "--tag",
                    api_image,
                    ".",
                ],
                cwd=root,
                dry_run=args.dry_run,
            )
            _run(
                gcloud,
                [
                    "run",
                    "deploy",
                    "bible-api",
                    "--image",
                    api_image,
                    "--region",
                    args.region,
                    "--platform",
                    "managed",
                    "--allow-unauthenticated",
                    "--project",
                    args.project,
                ],
                cwd=root,
                dry_run=args.dry_run,
            )

        if do_frontend:
            if not (frontend / "cloudbuild.yaml").is_file():
                print(f"Missing {frontend / 'cloudbuild.yaml'}", file=sys.stderr)
                return 1
            subs = f"_BACKEND_URL={backend_url},_IMAGE={web_image}"
            _run(
                gcloud,
                [
                    "builds",
                    "submit",
                    "--config",
                    "cloudbuild.yaml",
                    f"--substitutions={subs}",
                    ".",
                ],
                cwd=frontend,
                dry_run=args.dry_run,
            )
            _run(
                gcloud,
                [
                    "run",
                    "deploy",
                    "bible-web",
                    "--image",
                    web_image,
                    "--region",
                    args.region,
                    "--platform",
                    "managed",
                    "--allow-unauthenticated",
                    "--project",
                    args.project,
                ],
                cwd=frontend,
                dry_run=args.dry_run,
            )
    except subprocess.CalledProcessError:
        return 1

    if not args.dry_run:
        print("Done. Backend:", api_image)
        print("       Frontend:", web_image)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
