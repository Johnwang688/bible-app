'''
Use to generate entire book questions
command: python -m quiz-questions.generate_quiz --book "Esther" --cache-file esther.json
'''

import argparse
import asyncio
import json
import re
import os
import sys

# Ensure asyncio works smoothly on Windows
if sys.platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsProactorEventLoopPolicy())

BIBLE_BOOKS = {
    "Genesis": {"book_number": 1, "chapters": 50},
    "Exodus": {"book_number": 2, "chapters": 40},
    "Leviticus": {"book_number": 3, "chapters": 27},
    "Numbers": {"book_number": 4, "chapters": 36},
    "Deuteronomy": {"book_number": 5, "chapters": 34},
    "Joshua": {"book_number": 6, "chapters": 24},
    "Judges": {"book_number": 7, "chapters": 21},
    "Ruth": {"book_number": 8, "chapters": 4},
    "1 Samuel": {"book_number": 9, "chapters": 31},
    "2 Samuel": {"book_number": 10, "chapters": 24},
    "1 Kings": {"book_number": 11, "chapters": 22},
    "2 Kings": {"book_number": 12, "chapters": 25},
    "1 Chronicles": {"book_number": 13, "chapters": 29},
    "2 Chronicles": {"book_number": 14, "chapters": 36},
    "Ezra": {"book_number": 15, "chapters": 10},
    "Nehemiah": {"book_number": 16, "chapters": 13},
    "Esther": {"book_number": 17, "chapters": 10},
    "Job": {"book_number": 18, "chapters": 42},
    "Psalms": {"book_number": 19, "chapters": 150},
    "Proverbs": {"book_number": 20, "chapters": 31},
    "Ecclesiastes": {"book_number": 21, "chapters": 12},
    "Song of Solomon": {"book_number": 22, "chapters": 8},
    "Isaiah": {"book_number": 23, "chapters": 66},
    "Jeremiah": {"book_number": 24, "chapters": 52},
    "Lamentations": {"book_number": 25, "chapters": 5},
    "Ezekiel": {"book_number": 26, "chapters": 48},
    "Daniel": {"book_number": 27, "chapters": 12},
    "Hosea": {"book_number": 28, "chapters": 14},
    "Joel": {"book_number": 29, "chapters": 3},
    "Amos": {"book_number": 30, "chapters": 9},
    "Obadiah": {"book_number": 31, "chapters": 1},
    "Jonah": {"book_number": 32, "chapters": 4},
    "Micah": {"book_number": 33, "chapters": 7},
    "Nahum": {"book_number": 34, "chapters": 3},
    "Habakkuk": {"book_number": 35, "chapters": 3},
    "Zephaniah": {"book_number": 36, "chapters": 3},
    "Haggai": {"book_number": 37, "chapters": 2},
    "Zechariah": {"book_number": 38, "chapters": 14},
    "Malachi": {"book_number": 39, "chapters": 4},
    "Matthew": {"book_number": 40, "chapters": 28},
    "Mark": {"book_number": 41, "chapters": 16},
    "Luke": {"book_number": 42, "chapters": 24},
    "John": {"book_number": 43, "chapters": 21},
    "Acts": {"book_number": 44, "chapters": 28},
    "Romans": {"book_number": 45, "chapters": 16},
    "1 Corinthians": {"book_number": 46, "chapters": 16},
    "2 Corinthians": {"book_number": 47, "chapters": 13},
    "Galatians": {"book_number": 48, "chapters": 6},
    "Ephesians": {"book_number": 49, "chapters": 6},
    "Philippians": {"book_number": 50, "chapters": 4},
    "Colossians": {"book_number": 51, "chapters": 4},
    "1 Thessalonians": {"book_number": 52, "chapters": 5},
    "2 Thessalonians": {"book_number": 53, "chapters": 3},
    "1 Timothy": {"book_number": 54, "chapters": 6},
    "2 Timothy": {"book_number": 55, "chapters": 4},
    "Titus": {"book_number": 56, "chapters": 3},
    "Philemon": {"book_number": 57, "chapters": 1},
    "Hebrews": {"book_number": 58, "chapters": 13},
    "James": {"book_number": 59, "chapters": 5},
    "1 Peter": {"book_number": 60, "chapters": 5},
    "2 Peter": {"book_number": 61, "chapters": 3},
    "1 John": {"book_number": 62, "chapters": 5},
    "2 John": {"book_number": 63, "chapters": 1},
    "3 John": {"book_number": 64, "chapters": 1},
    "Jude": {"book_number": 65, "chapters": 1},
    "Revelation": {"book_number": 66, "chapters": 22},
}

# Normalize lookup dictionary to handle different casings and spaces
BOOK_LOOKUP = {k.lower().replace(" ", ""): k for k in BIBLE_BOOKS.keys()}


def normalize_int(value, default=0):
    try:
        return int(value)
    except (TypeError, ValueError):
        return default


def normalize_question(question):
    if not isinstance(question, dict):
        return None

    prompt = question.get("prompt")
    if not isinstance(prompt, str) or not prompt.strip():
        return None

    normalized = dict(question)
    normalized["chapter"] = normalize_int(question.get("chapter"), 0)
    normalized["difficulty_stage"] = normalize_int(question.get("difficulty_stage"), 0)
    normalized["prompt"] = prompt.strip()
    return normalized


def question_sort_key(question):
    return (
        normalize_int(question.get("chapter"), 0),
        normalize_int(question.get("difficulty_stage"), 0),
        str(question.get("prompt", "")),
    )

async def run_chapter(book_name, book_number, chapter_num, base_prompt, semaphore):
    # Customize the prompt for this specific chapter
    prompt = base_prompt.replace("<book-name>", book_name)
    
    # Ensure book_number is explicitly set in instructions
    prompt = prompt.replace("Replace `book_number` with the correct integer for your app’s book table.",
                            f"Use book_number {book_number} for {book_name}.")
    
    # Append the strict requirements requested by the user
    specific_instructions = f"""

---
# CRITICAL INSTRUCTIONS FOR THIS SPECIFIC BATCH
1. **Scope:** You are generating questions ONLY for {book_name} Chapter {chapter_num}. Do not output any other chapters.
2. **Accuracy Requirement:** You MUST go online and fetch the text for {book_name} chapter {chapter_num} to guarantee accuracy. Use the fetched text to inform all questions.
3. **Variety:** Make sure that there are no question prompts that are reused within the same phase (difficulty stage). There can be the same question prompt in different stages, but the same stage should have 10 completely different and unique question prompts.
4. **Formatting:** Return ONLY valid JSON containing the array of question objects. No markdown formatting, no explanations outside the JSON.
"""
    prompt += specific_instructions

    async with semaphore:
        print(f"Starting generation for {book_name} Chapter {chapter_num}...")
        
        # Execute the gemini ask command with shell=True and pass the prompt via stdin
        process = await asyncio.create_subprocess_shell(
            'gemini ask',
            stdin=asyncio.subprocess.PIPE,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE
        )
        
        stdout, stderr = await process.communicate(input=prompt.encode('utf-8'))
        
        if process.returncode != 0:
            print(f"Error for Chapter {chapter_num}: {stderr.decode('utf-8')}")
            return []

        output = stdout.decode('utf-8')
        
        # Try to extract JSON from the output (in case it still wrapped it in markdown)
        json_match = re.search(r'\[.*\]', output, re.DOTALL)
        if json_match:
            json_str = json_match.group(0)
            try:
                data = json.loads(json_str)
                # Filter to only keep questions for this chapter and ensure valid shape
                valid_data = []
                for q in data:
                    if str(q.get('chapter')) == str(chapter_num):
                        # Ensure book_number is correct
                        q['book_number'] = book_number
                        normalized_question = normalize_question(q)
                        if normalized_question is not None:
                            valid_data.append(normalized_question)
                
                print(f"✓ Chapter {chapter_num} completed successfully ({len(valid_data)} questions).")
                return valid_data
            except json.JSONDecodeError as e:
                print(f"Failed to parse JSON for Chapter {chapter_num}: {e}")
                print(f"Raw output was:\n{output[:200]}...")
                return []
        else:
            print(f"No JSON array found in response for Chapter {chapter_num}.")
            print(f"Raw output was:\n{output[:200]}...")
            return []

async def main():
    parser = argparse.ArgumentParser(description="Generate quiz questions for a book of the Bible.")
    parser.add_argument("--book", type=str, required=True, help="Name of the book (e.g. Genesis, '1 John', 2john)")
    parser.add_argument("--start", type=int, help="Starting chapter number (inclusive)")
    parser.add_argument("--end", type=int, help="Ending chapter number (inclusive)")
    parser.add_argument("--cache-file", type=str, required=True, help="Output JSON cache file name (e.g. genesis.json)")
    
    args = parser.parse_args()

    # Look up the book
    book_key_normalized = args.book.lower().replace(" ", "")
    if book_key_normalized not in BOOK_LOOKUP:
        print(f"Error: Unknown book '{args.book}'. Please check the spelling.")
        return
    
    book_name = BOOK_LOOKUP[book_key_normalized]
    book_info = BIBLE_BOOKS[book_name]
    total_chapters = book_info["chapters"]
    book_number = book_info["book_number"]

    # Validate start and end
    start_chapter = args.start if args.start is not None else 1
    end_chapter = args.end if args.end is not None else total_chapters

    if start_chapter < 1 or start_chapter > total_chapters:
        print(f"Warning: --start {start_chapter} is out of bounds for {book_name} (has {total_chapters} chapters).")
        return
    
    if end_chapter < 1 or end_chapter > total_chapters:
        print(f"Warning: --end {end_chapter} is out of bounds for {book_name} (has {total_chapters} chapters).")
        return

    if start_chapter > end_chapter:
        print(f"Warning: --start ({start_chapter}) cannot be greater than --end ({end_chapter}).")
        return

    prompt_file_path = os.path.join("quiz-questions", "prompt.md")
    # If a relative path is passed for cache-file, we put it in quiz-questions.
    # If the user passed just a filename like 'genesis.json', we'll default it there.
    output_file_path = os.path.join("quiz-questions", args.cache_file)
    # allow providing full paths if desired:
    if os.path.isabs(args.cache_file) or os.path.dirname(args.cache_file):
         output_file_path = args.cache_file

    if not os.path.exists(prompt_file_path):
        print(f"Error: {prompt_file_path} not found.")
        return

    with open(prompt_file_path, "r", encoding="utf-8") as f:
        base_prompt = f.read()

    # Create a semaphore to limit concurrent executions
    semaphore = asyncio.Semaphore(10)
    
    tasks = []
    
    chapter_range_len = end_chapter - start_chapter + 1
    print(f"Queueing {chapter_range_len} chapters of {book_name} (Chapters {start_chapter}-{end_chapter}) for generation...")
    for i in range(start_chapter, end_chapter + 1):
        tasks.append(run_chapter(book_name, book_number, i, base_prompt, semaphore))

    # Run all tasks concurrently
    results = await asyncio.gather(*tasks)

    # Flatten the results list
    all_questions = []
    for chapter_questions in results:
        if isinstance(chapter_questions, list):
            all_questions.extend(chapter_questions)

    # Sort the resulting questions by chapter, then difficulty_stage, then prompt
    print("Sorting questions...")
    all_questions = [q for q in (normalize_question(item) for item in all_questions) if q is not None]
    all_questions.sort(key=question_sort_key)

    print(f"\nTotal questions generated: {len(all_questions)}")
    
    # Write to final JSON file
    os.makedirs(os.path.dirname(os.path.abspath(output_file_path)), exist_ok=True)
    
    # If caching iteratively, load existing JSON data and update
    if os.path.exists(output_file_path):
        try:
            with open(output_file_path, "r", encoding="utf-8") as f:
                existing_data = json.load(f)
        except json.JSONDecodeError:
            existing_data = []
            
        # Remove any questions for chapters we just generated, and merge
        generated_chapters = set(range(start_chapter, end_chapter + 1))
        normalized_existing = [q for q in (normalize_question(item) for item in existing_data) if q is not None]
        filtered_existing = [q for q in normalized_existing if q.get('chapter') not in generated_chapters]
        all_questions = filtered_existing + all_questions
        all_questions.sort(key=question_sort_key)

    with open(output_file_path, "w", encoding="utf-8") as f:
        print(f"Writing questions to {output_file_path}...")
        json.dump(all_questions, f, indent=4)
        
    print(f"Successfully saved all questions to {output_file_path}")

if __name__ == "__main__":
    asyncio.run(main())