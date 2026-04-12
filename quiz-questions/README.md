# Quiz generation (simple)

You only need **three commands**, in order.

## 0. One-time: API key

Put this in **`bible-app/.env`** (next to `package.json`):

```bash
GEMINI_API_KEY=paste_your_key_here
```

## 1. Build the batch files (OT — a few chapters per file)

Default is **3 chapters per file** (keeps each API response smaller so JSON is less likely to **cut off halfway**). Override: `CHAPTER_CHUNK=2 npm run quiz:write-chapter-batches` if you still see truncation.

```bash
cd /Users/reeliu/Desktop/bible-app
npm run quiz:write-chapter-batches
```

## 2. Call Gemini (creates JSON in `outputs/`)

```bash
cd /Users/reeliu/Desktop/bible-app
SKIP_EXISTING=0 npm run quiz:gemini-batches
```

- This takes a **long** time (many batches). Leave Terminal open, or use **Background** below.
- If it stops halfway and you run it again, use **`SKIP_EXISTING=1`** instead so it skips batches that already finished.

## 3. Merge into one file per book

```bash
cd /Users/reeliu/Desktop/bible-app
npm run quiz:rebuild-by-book
```

Done. Merged books live in **`outputs/by-book/`**.

---

## Optional: start over (delete old JSON only)

```bash
cd /Users/reeliu/Desktop/bible-app
rm -f quiz-questions/outputs/*-ch*.json quiz-questions/outputs/*.invalid.json quiz-questions/outputs/by-book/*.json
```

After changing chapter chunk size, run step 1 again so filenames match. Do **not** delete `quiz-questions/batch-chunks/` unless you will run step 1 again.

## If you see “Unexpected end of JSON”

The model hit its **output length** limit and the file was cut off mid-array. Use **smaller** batches: `CHAPTER_CHUNK=2 npm run quiz:write-chapter-batches`, delete bad `.invalid.json`/`outputs` as above, then run step 2 again.

---

## Optional: run in background and watch a log

Start:

```bash
cd /Users/reeliu/Desktop/bible-app
caffeinate -is nohup env SKIP_EXISTING=0 npm run quiz:gemini-batches > gemini-ot.log 2>&1 &
```

Watch:

```bash
tail -f /Users/reeliu/Desktop/bible-app/gemini-ot.log
```

---

## Where the prompt is

The instructions to the model are in **`prompt.md`** (the script reads it for you — you don’t paste it manually).
