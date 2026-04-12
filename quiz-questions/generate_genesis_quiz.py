import asyncio
import json
import re
import os
import sys

# Ensure asyncio works smoothly on Windows
if sys.platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsProactorEventLoopPolicy())

async def run_chapter(chapter_num, base_prompt, semaphore):
    # Customize the prompt for this specific chapter
    prompt = base_prompt.replace("<book-name>", "Genesis")
    
    # Ensure book_number is explicitly set in instructions
    prompt = prompt.replace("Replace `book_number` with the correct integer for your app’s book table.",
                            "Use book_number 1 for Genesis.")
    
    # Append the strict requirements requested by the user
    specific_instructions = f"""

---
# CRITICAL INSTRUCTIONS FOR THIS SPECIFIC BATCH
1. **Scope:** You are generating questions ONLY for Genesis Chapter {chapter_num}. Do not output any other chapters.
2. **Accuracy Requirement:** You MUST go online and fetch the text for Genesis chapter {chapter_num} to guarantee accuracy. Use the fetched text to inform all questions.
3. **Variety:** Make sure that there are no question prompts that are reused within the same phase (difficulty stage). There can be the same question prompt in different stages, but the same stage should have 10 completely different and unique question prompts.
4. **Formatting:** Return ONLY valid JSON containing the array of question objects. No markdown formatting, no explanations outside the JSON.
"""
    prompt += specific_instructions

    async with semaphore:
        print(f"Starting generation for Genesis Chapter {chapter_num}...")
        
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
                        # Ensure book_number is 1
                        q['book_number'] = 1
                        valid_data.append(q)
                
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
    prompt_file_path = os.path.join("quiz-questions", "prompt.md")
    output_file_path = os.path.join("quiz-questions", "genesis.json")

    if not os.path.exists(prompt_file_path):
        print(f"Error: {prompt_file_path} not found.")
        return

    with open(prompt_file_path, "r", encoding="utf-8") as f:
        base_prompt = f.read()

    # Create a semaphore to limit concurrent executions (preventing extreme rate limiting or system hang)
    # Using 10 concurrent threads/tasks by default, adjust if needed.
    semaphore = asyncio.Semaphore(10)
    
    total_chapters = 50
    tasks = []
    
    print(f"Queueing {total_chapters} chapters of Genesis for generation...")
    for i in range(1, total_chapters + 1):
        tasks.append(run_chapter(i, base_prompt, semaphore))

    # Run all tasks concurrently
    results = await asyncio.gather(*tasks)

    # Flatten the results list
    all_questions = []
    for chapter_questions in results:
        all_questions.extend(chapter_questions)

    # Sort the resulting questions by chapter, then difficulty_stage, then prompt
    print("Sorting questions...")
    all_questions.sort(key=lambda x: (x.get('chapter', 0), x.get('difficulty_stage', 0), x.get('prompt', '')))

    print(f"\nTotal questions generated: {len(all_questions)}")
    
    # Write to final JSON file
    with open(output_file_path, "w", encoding="utf-8") as f:
        print("Writing questions to file...")
        json.dump(all_questions, f, indent=4)
        
    print(f"Successfully saved all questions to {output_file_path}")

if __name__ == "__main__":
    asyncio.run(main())
