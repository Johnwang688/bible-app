FROM python:3.12-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Read-only Bible content: built into build/content.sqlite at image build time (W1).
# The build verifies every source file against content/source/MANIFEST.json.
COPY scripts/build_content.py ./scripts/build_content.py
COPY content/source ./content/source
RUN python scripts/build_content.py --source content/source --out build/content.sqlite \
    && rm -rf content/source

COPY app ./app

CMD ["sh", "-c", "exec uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8080}"]
