#!/usr/bin/env bash
# Start backend and frontend concurrently

ROOT="$(cd "$(dirname "$0")" && pwd)"

cleanup() {
  echo ""
  echo "Shutting down..."
  kill "$BACKEND_PID" "$FRONTEND_PID" 2>/dev/null
  wait "$BACKEND_PID" "$FRONTEND_PID" 2>/dev/null
  exit 0
}
trap cleanup INT TERM

echo "Starting backend (port 8000)..."
cd "$ROOT"
uvicorn app.main:app --reload &
BACKEND_PID=$!

echo "Starting frontend (port 3000)..."
cd "$ROOT/frontend-next"
npm run dev &
FRONTEND_PID=$!

echo ""
echo "Backend PID: $BACKEND_PID"
echo "Frontend PID: $FRONTEND_PID"
echo "Press Ctrl+C to stop both."
echo ""

wait "$BACKEND_PID" "$FRONTEND_PID"
