# Stage 1: build the read-only content database (W1). The build verifies every
# source file against content/source/MANIFEST.json.
FROM python:3.12-slim AS content
WORKDIR /src
COPY scripts/build_content.py ./scripts/build_content.py
COPY content/source ./content/source
RUN python scripts/build_content.py --source content/source --out /out/content.sqlite

# Stage 2: the API image. Only the built database is copied in, not the sources.
FROM python:3.12-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --from=content /out/content.sqlite ./build/content.sqlite
COPY app ./app

CMD ["sh", "-c", "exec uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8080}"]
