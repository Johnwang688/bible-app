-- Re-seed Acts after duplicate-prompt fix (clears partial rows from skipped INSERTs).
DELETE FROM quiz_question_bank WHERE book_number = 44;

-- ============================================================================
-- LOGOS LIGHT — Acts (book 44) quiz questions from quiz-questions/acts.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 1, 'According to Acts 1, what does the chapter say about Jesus?', '["Jesus showed himself alive forty days and spoke about God’s Kingdom.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Jesus showed himself alive forty days and spoke about God’s Kingdom.', 'Jesus showed himself alive forty days and spoke about God’s Kingdom (Acts 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 1, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 1, 'According to Acts 1, what happened?', '["Apostles were told to wait in Jerusalem for the Father’s promise.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Apostles were told to wait in Jerusalem for the Father’s promise.', 'Apostles were told to wait in Jerusalem for the Father’s promise (Acts 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 1, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 1, 'According to Acts 1, what would happen when the Holy Spirit came?', '["They would receive power when the Holy Spirit came and be witnesses everywhere.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'They would receive power when the Holy Spirit came and be witnesses everywhere.', 'They would receive power when the Holy Spirit came and be witnesses everywhere (Acts 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 1, what would happen when the Holy Spirit came?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 1, 'According to Acts 1, what happened when Jesus ascended?', '["Jesus was taken up in a cloud; two men said he would return the same way.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Jesus was taken up in a cloud; two men said he would return the same way.', 'Jesus was taken up in a cloud; two men said he would return the same way (Acts 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 1, what happened when Jesus ascended?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 1, 'According to Acts 1, what does the chapter say about Peter?', '["Peter said Scripture required Judas’s office to pass to another.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Peter said Scripture required Judas’s office to pass to another.', 'Peter said Scripture required Judas’s office to pass to another (Acts 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 1, what does the chapter say about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 2, 'According to Acts 1, with what did Jesus say they would be baptized?', '["you will be baptized in the Holy Spirit", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'you will be baptized in the Holy Spirit', 'you will be baptized in the Holy Spirit (Acts 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 1, with what did Jesus say they would be baptized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 2, 'According to Acts 1, what did Jesus say his followers would be?', '["You will be witnesses to me", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'You will be witnesses to me', 'You will be witnesses to me (Acts 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 1, what did Jesus say his followers would be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 2, 'According to Acts 1, what happened (Acts 1:4)?', '["a cloud received him out of their sight", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'a cloud received him out of their sight', 'a cloud received him out of their sight (Acts 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 1, what happened (Acts 1:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 2, 'According to Acts 1, what happened (Acts 1:8)?', '["will come back in the same way", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'will come back in the same way', 'will come back in the same way (Acts 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 1, what happened (Acts 1:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 2, 'According to Acts 1, what Scripture did Peter apply to Judas?', '["Let another take his office", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'Let another take his office', 'Let another take his office (Acts 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 1, what Scripture did Peter apply to Judas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 3, 'What does Acts 1 teach?', '["Apostles were told to wait in Jerusalem for the Father’s promise.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Apostles were told to wait in Jerusalem for the Father’s promise.', 'Apostles were told to wait in Jerusalem for the Father’s promise (Acts 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 1 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 3, 'According to Acts 1, what would happen when the Holy Spirit came?', '["They would receive power when the Holy Spirit came and be witnesses everywhere.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'They would receive power when the Holy Spirit came and be witnesses everywhere.', 'They would receive power when the Holy Spirit came and be witnesses everywhere (Acts 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 1, what would happen when the Holy Spirit came?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 3, 'According to Acts 1, what happened when Jesus ascended?', '["Jesus was taken up in a cloud; two men said he would return the same way.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Jesus was taken up in a cloud; two men said he would return the same way.', 'Jesus was taken up in a cloud; two men said he would return the same way (Acts 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 1, what happened when Jesus ascended?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 3, 'What does Acts 1 teach about Peter?', '["Peter said Scripture required Judas’s office to pass to another.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Peter said Scripture required Judas’s office to pass to another.', 'Peter said Scripture required Judas’s office to pass to another (Acts 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 1 teach about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 3, 'What does Acts 1 teach about the ascension?', '["A successor must have been with them from John’s baptism to the ascension.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'A successor must have been with them from John’s baptism to the ascension.', 'A successor must have been with them from John’s baptism to the ascension (Acts 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 1 teach about the ascension?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 4, 'According to Acts 1, what did Jesus say his followers would be?', '["You will be witnesses to me", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'You will be witnesses to me', 'You will be witnesses to me (Acts 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 1, what did Jesus say his followers would be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 4, 'Which phrase belongs in Acts 1 (Acts 1:3)?', '["a cloud received him out of their sight", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'a cloud received him out of their sight', 'a cloud received him out of their sight (Acts 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 1 (Acts 1:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 4, 'Which phrase belongs in Acts 1 (Acts 1:4)?', '["will come back in the same way", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'will come back in the same way', 'will come back in the same way (Acts 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 1 (Acts 1:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 4, 'According to Acts 1, what Scripture did Peter apply to Judas?', '["Let another take his office", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'Let another take his office', 'Let another take his office (Acts 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 1, what Scripture did Peter apply to Judas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 4, 'According to Acts 1, on whom did the lot fall?', '["the lot fell on Matthias", "filled with the Holy Spirit", "this is what has been spoken through the prophet Joel", "God raised up"]'::jsonb, 'the lot fell on Matthias', 'the lot fell on Matthias (Acts 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 1, on whom did the lot fall?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 5, 'According to Acts 1, what would happen when the Holy Spirit came?', '["They would receive power when the Holy Spirit came and be witnesses everywhere.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'They would receive power when the Holy Spirit came and be witnesses everywhere.', 'They would receive power when the Holy Spirit came and be witnesses everywhere (Acts 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 1, what would happen when the Holy Spirit came?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 5, 'According to Acts 1, what happened when Jesus ascended?', '["Jesus was taken up in a cloud; two men said he would return the same way.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Jesus was taken up in a cloud; two men said he would return the same way.', 'Jesus was taken up in a cloud; two men said he would return the same way (Acts 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 1, what happened when Jesus ascended?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 5, 'What major point does Acts 1 make about Peter?', '["Peter said Scripture required Judas’s office to pass to another.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'Peter said Scripture required Judas’s office to pass to another.', 'Peter said Scripture required Judas’s office to pass to another (Acts 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 1 make about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 5, 'What major point does Acts 1 make about the ascension?', '["A successor must have been with them from John’s baptism to the ascension.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'A successor must have been with them from John’s baptism to the ascension.', 'A successor must have been with them from John’s baptism to the ascension (Acts 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 1 make about the ascension?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 1, 5, 'According to Acts 1, what happened to Matthias?', '["They drew lots and Matthias was numbered with the eleven apostles.", "A sound like wind filled the house; tongues like fire rested on each.", "They spoke in languages the Spirit gave them.", "Peter said this fulfilled Joel’s outpouring on all flesh."]'::jsonb, 'They drew lots and Matthias was numbered with the eleven apostles.', 'They drew lots and Matthias was numbered with the eleven apostles (Acts 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 1, what happened to Matthias?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 1, 'According to Acts 2, what filled the house at Pentecost?', '["A sound like wind filled the house; tongues like fire rested on each.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'A sound like wind filled the house; tongues like fire rested on each.', 'A sound like wind filled the house; tongues like fire rested on each (Acts 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 2, what filled the house at Pentecost?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 1, 'According to Acts 2, what did the believers begin to do?', '["They spoke in languages the Spirit gave them.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They spoke in languages the Spirit gave them.', 'They spoke in languages the Spirit gave them (Acts 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 2, what did the believers begin to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 1, 'According to Acts 2, what does the chapter say about Peter?', '["Peter said this fulfilled Joel’s outpouring on all flesh.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said this fulfilled Joel’s outpouring on all flesh.', 'Peter said this fulfilled Joel’s outpouring on all flesh (Acts 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 2, what does the chapter say about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 1, 'According to Acts 2, what did Peter declare about Jesus?', '["He declared Jesus crucified by lawless hands but raised by God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He declared Jesus crucified by lawless hands but raised by God.', 'He declared Jesus crucified by lawless hands but raised by God (Acts 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 2, what did Peter declare about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 1, 'According to Acts 2, what did God make Jesus?', '["God made Jesus both Lord and Christ.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'God made Jesus both Lord and Christ.', 'God made Jesus both Lord and Christ (Acts 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 2, what did God make Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 2, 'According to Acts 2, what were they filled with?', '["filled with the Holy Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'filled with the Holy Spirit', 'filled with the Holy Spirit (Acts 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 2, what were they filled with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 2, 'According to Acts 2, what happened?', '["this is what has been spoken through the prophet Joel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'this is what has been spoken through the prophet Joel', 'this is what has been spoken through the prophet Joel (Acts 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 2, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 2, 'According to Acts 2, what did God do for Jesus?', '["God raised up", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God raised up', 'God raised up (Acts 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 2, what did God do for Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 2, 'According to Acts 2, who did God make Jesus to be?', '["God has made him both Lord and Christ", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God has made him both Lord and Christ', 'God has made him both Lord and Christ (Acts 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 2, who did God make Jesus to be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 2, 'According to Acts 2, what did Peter tell the crowd to do?', '["Repent, and be baptized", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Repent, and be baptized', 'Repent, and be baptized (Acts 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 2, what did Peter tell the crowd to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 3, 'According to Acts 2, what did the believers begin to do?', '["They spoke in languages the Spirit gave them.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They spoke in languages the Spirit gave them.', 'They spoke in languages the Spirit gave them (Acts 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 2, what did the believers begin to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 3, 'What does Acts 2 teach about Peter?', '["Peter said this fulfilled Joel’s outpouring on all flesh.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said this fulfilled Joel’s outpouring on all flesh.', 'Peter said this fulfilled Joel’s outpouring on all flesh (Acts 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 2 teach about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 3, 'According to Acts 2, what did Peter declare about Jesus?', '["He declared Jesus crucified by lawless hands but raised by God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He declared Jesus crucified by lawless hands but raised by God.', 'He declared Jesus crucified by lawless hands but raised by God (Acts 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 2, what did Peter declare about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 3, 'According to Acts 2, what did God make Jesus?', '["God made Jesus both Lord and Christ.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'God made Jesus both Lord and Christ.', 'God made Jesus both Lord and Christ (Acts 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 2, what did God make Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 3, 'According to Acts 2, how many were baptized that day?', '["About three thousand were baptized that day.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'About three thousand were baptized that day.', 'About three thousand were baptized that day (Acts 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 2, how many were baptized that day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 4, 'Which phrase belongs in Acts 2 (Acts 2:2)?', '["this is what has been spoken through the prophet Joel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'this is what has been spoken through the prophet Joel', 'this is what has been spoken through the prophet Joel (Acts 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 2 (Acts 2:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 4, 'According to Acts 2, what did God do for Jesus?', '["God raised up", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God raised up', 'God raised up (Acts 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 2, what did God do for Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 4, 'According to Acts 2, who did God make Jesus to be?', '["God has made him both Lord and Christ", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God has made him both Lord and Christ', 'God has made him both Lord and Christ (Acts 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 2, who did God make Jesus to be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 4, 'According to Acts 2, what did Peter tell the crowd to do?', '["Repent, and be baptized", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Repent, and be baptized', 'Repent, and be baptized (Acts 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 2, what did Peter tell the crowd to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 4, 'Which phrase belongs in Acts 2 (Acts 2:22)?', '["about three thousand souls", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'about three thousand souls', 'about three thousand souls (Acts 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 2 (Acts 2:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 5, 'What major point does Acts 2 make about Peter?', '["Peter said this fulfilled Joel’s outpouring on all flesh.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said this fulfilled Joel’s outpouring on all flesh.', 'Peter said this fulfilled Joel’s outpouring on all flesh (Acts 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 2 make about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 5, 'According to Acts 2, what did Peter declare about Jesus?', '["He declared Jesus crucified by lawless hands but raised by God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He declared Jesus crucified by lawless hands but raised by God.', 'He declared Jesus crucified by lawless hands but raised by God (Acts 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 2, what did Peter declare about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 5, 'According to Acts 2, what did God make Jesus?', '["God made Jesus both Lord and Christ.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'God made Jesus both Lord and Christ.', 'God made Jesus both Lord and Christ (Acts 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 2, what did God make Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 5, 'According to Acts 2, how many were baptized that day?', '["About three thousand were baptized that day.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'About three thousand were baptized that day.', 'About three thousand were baptized that day (Acts 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 2, how many were baptized that day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 2, 5, 'According to Acts 2, what did the Lord do daily?', '["The Lord added to the assembly daily those being saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord added to the assembly daily those being saved.', 'The Lord added to the assembly daily those being saved (Acts 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 2, what did the Lord do daily?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 1, 'According to Acts 3, what does the chapter say about Jesus (Acts 3:6)?', '["Peter commanded the beggar to walk in the name of Jesus Christ of Nazareth.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter commanded the beggar to walk in the name of Jesus Christ of Nazareth.', 'Peter commanded the beggar to walk in the name of Jesus Christ of Nazareth (Acts 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 3, what does the chapter say about Jesus (Acts 3:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 1, 'According to Acts 3, what does the chapter say about the temple?', '["The man leaped and walked into the temple praising God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The man leaped and walked into the temple praising God.', 'The man leaped and walked into the temple praising God (Acts 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 3, what does the chapter say about the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 1, 'According to Acts 3, what does the chapter say about Peter?', '["Peter said they denied the Holy and Righteous One before Pilate.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said they denied the Holy and Righteous One before Pilate.', 'Peter said they denied the Holy and Righteous One before Pilate (Acts 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 3, what does the chapter say about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 1, 'According to Acts 3, what does the chapter say about Jesus (Acts 3:15)?', '["Faith in Jesus’s name gave the man perfect soundness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Faith in Jesus’s name gave the man perfect soundness.', 'Faith in Jesus’s name gave the man perfect soundness (Acts 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 3, what does the chapter say about Jesus (Acts 3:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 1, 'According to Acts 3, what happened?', '["He called for repentance so sins might be blotted out.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He called for repentance so sins might be blotted out.', 'He called for repentance so sins might be blotted out (Acts 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 3, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 2, 'According to Acts 3, what does the chapter say about Jesus?', '["In the name of Jesus Christ of Nazareth, get up and walk", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'In the name of Jesus Christ of Nazareth, get up and walk', 'In the name of Jesus Christ of Nazareth, get up and walk (Acts 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 3, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 2, 'According to Acts 3, what happened (Acts 3:8)?', '["Silver and gold I have not", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Silver and gold I have not', 'Silver and gold I have not (Acts 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 3, what happened (Acts 3:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 2, 'According to Acts 3, what happened (Acts 3:13)?', '["whom you delivered up, and denied in the presence of Pilate", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'whom you delivered up, and denied in the presence of Pilate', 'whom you delivered up, and denied in the presence of Pilate (Acts 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 3, what happened (Acts 3:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 2, 'According to Acts 3, what does the chapter say about the resurrection?', '["killed the Prince of life, whom God raised from the dead", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'killed the Prince of life, whom God raised from the dead', 'killed the Prince of life, whom God raised from the dead (Acts 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 3, what does the chapter say about the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 2, 'According to Acts 3, what does the chapter say about repentance?', '["Repent therefore, and turn again", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Repent therefore, and turn again', 'Repent therefore, and turn again (Acts 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 3, what does the chapter say about repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 3, 'What does Acts 3 teach about the temple?', '["The man leaped and walked into the temple praising God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The man leaped and walked into the temple praising God.', 'The man leaped and walked into the temple praising God (Acts 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 3 teach about the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 3, 'What does Acts 3 teach about Peter?', '["Peter said they denied the Holy and Righteous One before Pilate.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said they denied the Holy and Righteous One before Pilate.', 'Peter said they denied the Holy and Righteous One before Pilate (Acts 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 3 teach about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 3, 'What does Acts 3 teach about Jesus?', '["Faith in Jesus’s name gave the man perfect soundness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Faith in Jesus’s name gave the man perfect soundness.', 'Faith in Jesus’s name gave the man perfect soundness (Acts 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 3 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 3, 'According to Acts 3, what happened (Acts 3:15)?', '["He called for repentance so sins might be blotted out.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He called for repentance so sins might be blotted out.', 'He called for repentance so sins might be blotted out (Acts 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 3, what happened (Acts 3:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 3, 'According to Acts 3, what happened (Acts 3:16)?', '["He cited Moses about the prophet they must hear.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He cited Moses about the prophet they must hear.', 'He cited Moses about the prophet they must hear (Acts 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 3, what happened (Acts 3:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 4, 'Which phrase belongs in Acts 3 (Acts 3:6)?', '["Silver and gold I have not", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Silver and gold I have not', 'Silver and gold I have not (Acts 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 3 (Acts 3:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 4, 'Which phrase belongs in Acts 3 (Acts 3:8)?', '["whom you delivered up, and denied in the presence of Pilate", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'whom you delivered up, and denied in the presence of Pilate', 'whom you delivered up, and denied in the presence of Pilate (Acts 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 3 (Acts 3:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 4, 'Which phrase in Acts 3 speaks about the resurrection?', '["killed the Prince of life, whom God raised from the dead", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'killed the Prince of life, whom God raised from the dead', 'killed the Prince of life, whom God raised from the dead (Acts 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 3 speaks about the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 4, 'Which phrase in Acts 3 speaks about repentance?', '["Repent therefore, and turn again", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Repent therefore, and turn again', 'Repent therefore, and turn again (Acts 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 3 speaks about repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 4, 'Which phrase belongs in Acts 3 (Acts 3:16)?', '["All the families of the earth will be blessed", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'All the families of the earth will be blessed', 'All the families of the earth will be blessed (Acts 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 3 (Acts 3:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 5, 'What major point does Acts 3 make about Peter?', '["Peter said they denied the Holy and Righteous One before Pilate.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said they denied the Holy and Righteous One before Pilate.', 'Peter said they denied the Holy and Righteous One before Pilate (Acts 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 3 make about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 5, 'What major point does Acts 3 make about Jesus?', '["Faith in Jesus’s name gave the man perfect soundness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Faith in Jesus’s name gave the man perfect soundness.', 'Faith in Jesus’s name gave the man perfect soundness (Acts 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 3 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 5, 'According to Acts 3, what happened (Acts 3:13)?', '["He called for repentance so sins might be blotted out.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He called for repentance so sins might be blotted out.', 'He called for repentance so sins might be blotted out (Acts 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 3, what happened (Acts 3:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 5, 'According to Acts 3, what happened (Acts 3:15)?', '["He cited Moses about the prophet they must hear.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He cited Moses about the prophet they must hear.', 'He cited Moses about the prophet they must hear (Acts 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 3, what happened (Acts 3:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 3, 5, 'According to Acts 3, what did God do?', '["God sent Jesus first to bless by turning them from wickedness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'God sent Jesus first to bless by turning them from wickedness.', 'God sent Jesus first to bless by turning them from wickedness (Acts 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 3, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 1, 'According to Acts 4, what did they do?', '["They were seized for proclaiming resurrection in Jesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They were seized for proclaiming resurrection in Jesus.', 'They were seized for proclaiming resurrection in Jesus (Acts 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 4, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 1, 'According to Acts 4, what does the chapter say about Jesus?', '["Peter said the man stands whole in the name of Jesus raised from the dead.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said the man stands whole in the name of Jesus raised from the dead.', 'Peter said the man stands whole in the name of Jesus raised from the dead (Acts 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 4, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 1, 'According to Acts 4, what does the chapter say about Jesus'' name?', '["There is no other name by which we must be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'There is no other name by which we must be saved.', 'There is no other name by which we must be saved (Acts 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 4, what does the chapter say about Jesus'' name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 1, 'According to Acts 4, what does the chapter say about Peter?', '["Peter and John refused to stop speaking what they witnessed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter and John refused to stop speaking what they witnessed.', 'Peter and John refused to stop speaking what they witnessed (Acts 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 4, what does the chapter say about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 1, 'According to Acts 4, what happened?', '["The company prayed for boldness despite threats.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The company prayed for boldness despite threats.', 'The company prayed for boldness despite threats (Acts 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 4, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 2, 'According to Acts 4, what does the chapter say about Jesus?', '["proclaimed in Jesus the resurrection from the dead", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'proclaimed in Jesus the resurrection from the dead', 'proclaimed in Jesus the resurrection from the dead (Acts 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 4, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 2, 'According to Acts 4, what does the chapter say about the resurrection?', '["whom you crucified, whom God raised from the dead", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'whom you crucified, whom God raised from the dead', 'whom you crucified, whom God raised from the dead (Acts 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 4, what does the chapter say about the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 2, 'According to Acts 4, what happened (Acts 4:12)?', '["There is salvation in no one else", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'There is salvation in no one else', 'There is salvation in no one else (Acts 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 4, what happened (Acts 4:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 2, 'According to Acts 4, what happened (Acts 4:19)?', '["We must obey God rather than men", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'We must obey God rather than men', 'We must obey God rather than men (Acts 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 4, what happened (Acts 4:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 2, 'According to Acts 4, what happened (Acts 4:20)?', '["the place was shaken", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the place was shaken', 'the place was shaken (Acts 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 4, what happened (Acts 4:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 3, 'What does Acts 4 teach about Jesus?', '["Peter said the man stands whole in the name of Jesus raised from the dead.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said the man stands whole in the name of Jesus raised from the dead.', 'Peter said the man stands whole in the name of Jesus raised from the dead (Acts 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 4 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 3, 'What does Acts 4 teach about Jesus'' name?', '["There is no other name by which we must be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'There is no other name by which we must be saved.', 'There is no other name by which we must be saved (Acts 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 4 teach about Jesus'' name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 3, 'What does Acts 4 teach about Peter?', '["Peter and John refused to stop speaking what they witnessed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter and John refused to stop speaking what they witnessed.', 'Peter and John refused to stop speaking what they witnessed (Acts 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 4 teach about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 3, 'What does Acts 4 teach (Acts 4:19)?', '["The company prayed for boldness despite threats.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The company prayed for boldness despite threats.', 'The company prayed for boldness despite threats (Acts 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 4 teach (Acts 4:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 3, 'What does Acts 4 teach (Acts 4:20)?', '["The place was shaken; they spoke God’s word with boldness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The place was shaken; they spoke God’s word with boldness.', 'The place was shaken; they spoke God’s word with boldness (Acts 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 4 teach (Acts 4:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 4, 'Which phrase in Acts 4 speaks about the resurrection?', '["whom you crucified, whom God raised from the dead", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'whom you crucified, whom God raised from the dead', 'whom you crucified, whom God raised from the dead (Acts 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 4 speaks about the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 4, 'Which phrase belongs in Acts 4 (Acts 4:10)?', '["There is salvation in no one else", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'There is salvation in no one else', 'There is salvation in no one else (Acts 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 4 (Acts 4:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 4, 'Which phrase belongs in Acts 4 (Acts 4:12)?', '["We must obey God rather than men", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'We must obey God rather than men', 'We must obey God rather than men (Acts 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 4 (Acts 4:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 4, 'Which phrase belongs in Acts 4 (Acts 4:19)?', '["the place was shaken", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the place was shaken', 'the place was shaken (Acts 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 4 (Acts 4:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 4, 'Which phrase belongs in Acts 4 (Acts 4:20)?', '["of one heart and soul", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'of one heart and soul', 'of one heart and soul (Acts 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 4 (Acts 4:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 5, 'What major point does Acts 4 make about Jesus'' name?', '["There is no other name by which we must be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'There is no other name by which we must be saved.', 'There is no other name by which we must be saved (Acts 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 4 make about Jesus'' name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 5, 'What major point does Acts 4 make about Peter?', '["Peter and John refused to stop speaking what they witnessed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter and John refused to stop speaking what they witnessed.', 'Peter and John refused to stop speaking what they witnessed (Acts 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 4 make about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 5, 'What major point is made in Acts 4 (Acts 4:12)?', '["The company prayed for boldness despite threats.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The company prayed for boldness despite threats.', 'The company prayed for boldness despite threats (Acts 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 4 (Acts 4:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 5, 'What major point is made in Acts 4 (Acts 4:19)?', '["The place was shaken; they spoke God’s word with boldness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The place was shaken; they spoke God’s word with boldness.', 'The place was shaken; they spoke God’s word with boldness (Acts 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 4 (Acts 4:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 4, 5, 'What major point does Acts 4 make about Barnabas?', '["Barnabas sold a field and laid the money at the apostles’ feet.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Barnabas sold a field and laid the money at the apostles’ feet.', 'Barnabas sold a field and laid the money at the apostles’ feet (Acts 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 4 make about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 1, 'According to Acts 5, what does the chapter say about the Holy Spirit?', '["Peter charged Ananias with lying to the Holy Spirit, not merely men.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter charged Ananias with lying to the Holy Spirit, not merely men.', 'Peter charged Ananias with lying to the Holy Spirit, not merely men (Acts 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 5, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 1, 'According to Acts 5, what happened (Acts 5:5)?', '["Sapphira fell dead after agreeing to the lie.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Sapphira fell dead after agreeing to the lie.', 'Sapphira fell dead after agreeing to the lie (Acts 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 5, what happened (Acts 5:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 1, 'According to Acts 5, what does the chapter say about the temple?', '["An angel freed the apostles to speak in the temple.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel freed the apostles to speak in the temple.', 'An angel freed the apostles to speak in the temple (Acts 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 5, what does the chapter say about the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 1, 'According to Acts 5, what does the chapter say about Jesus?', '["Peter said God exalted Jesus to give repentance and forgiveness to Israel.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God exalted Jesus to give repentance and forgiveness to Israel.', 'Peter said God exalted Jesus to give repentance and forgiveness to Israel (Acts 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 5, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 1, 'According to Acts 5, what happened (Acts 5:20)?', '["Gamaliel warned against fighting God if the work is of him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gamaliel warned against fighting God if the work is of him.', 'Gamaliel warned against fighting God if the work is of him (Acts 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 5, what happened (Acts 5:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 2, 'According to Acts 5, what happened (Acts 5:3)?', '["You haven’t lied to men, but to God", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'You haven’t lied to men, but to God', 'You haven’t lied to men, but to God (Acts 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 5, what happened (Acts 5:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 2, 'According to Acts 5, what does the chapter say about the temple?', '["Go stand and speak in the temple", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Go stand and speak in the temple', 'Go stand and speak in the temple (Acts 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 5, what does the chapter say about the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 2, 'According to Acts 5, what happened (Acts 5:9)?', '["We must obey God rather than men", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'We must obey God rather than men', 'We must obey God rather than men (Acts 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 5, what happened (Acts 5:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 2, 'According to Acts 5, what happened (Acts 5:19)?', '["fighting against God", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'fighting against God', 'fighting against God (Acts 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 5, what happened (Acts 5:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 2, 'According to Acts 5, what happened (Acts 5:20)?', '["rejoicing that they were counted worthy to suffer dishonor", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'rejoicing that they were counted worthy to suffer dishonor', 'rejoicing that they were counted worthy to suffer dishonor (Acts 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 5, what happened (Acts 5:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 3, 'What does Acts 5 teach (Acts 5:3)?', '["Sapphira fell dead after agreeing to the lie.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Sapphira fell dead after agreeing to the lie.', 'Sapphira fell dead after agreeing to the lie (Acts 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 5 teach (Acts 5:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 3, 'What does Acts 5 teach about the temple?', '["An angel freed the apostles to speak in the temple.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel freed the apostles to speak in the temple.', 'An angel freed the apostles to speak in the temple (Acts 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 5 teach about the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 3, 'What does Acts 5 teach about Jesus (Acts 5:9)?', '["Peter said God exalted Jesus to give repentance and forgiveness to Israel.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God exalted Jesus to give repentance and forgiveness to Israel.', 'Peter said God exalted Jesus to give repentance and forgiveness to Israel (Acts 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 5 teach about Jesus (Acts 5:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 3, 'What does Acts 5 teach (Acts 5:19)?', '["Gamaliel warned against fighting God if the work is of him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gamaliel warned against fighting God if the work is of him.', 'Gamaliel warned against fighting God if the work is of him (Acts 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 5 teach (Acts 5:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 3, 'What does Acts 5 teach about Jesus (Acts 5:20)?', '["The apostles were beaten yet rejoiced to suffer for Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The apostles were beaten yet rejoiced to suffer for Jesus’s name.', 'The apostles were beaten yet rejoiced to suffer for Jesus’s name (Acts 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 5 teach about Jesus (Acts 5:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 4, 'Which phrase in Acts 5 speaks about the temple?', '["Go stand and speak in the temple", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Go stand and speak in the temple', 'Go stand and speak in the temple (Acts 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 5 speaks about the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 4, 'Which phrase belongs in Acts 5 (Acts 5:5)?', '["We must obey God rather than men", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'We must obey God rather than men', 'We must obey God rather than men (Acts 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 5 (Acts 5:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 4, 'Which phrase belongs in Acts 5 (Acts 5:9)?', '["fighting against God", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'fighting against God', 'fighting against God (Acts 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 5 (Acts 5:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 4, 'Which phrase belongs in Acts 5 (Acts 5:19)?', '["rejoicing that they were counted worthy to suffer dishonor", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'rejoicing that they were counted worthy to suffer dishonor', 'rejoicing that they were counted worthy to suffer dishonor (Acts 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 5 (Acts 5:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 4, 'Which phrase belongs in Acts 5 (Acts 5:20)?', '["You haven’t lied to men, but to God", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'You haven’t lied to men, but to God', 'You haven’t lied to men, but to God (Acts 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 5 (Acts 5:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 5, 'What major point does Acts 5 make about the temple?', '["An angel freed the apostles to speak in the temple.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel freed the apostles to speak in the temple.', 'An angel freed the apostles to speak in the temple (Acts 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 5 make about the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 5, 'What major point does Acts 5 make about Jesus (Acts 5:5)?', '["Peter said God exalted Jesus to give repentance and forgiveness to Israel.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God exalted Jesus to give repentance and forgiveness to Israel.', 'Peter said God exalted Jesus to give repentance and forgiveness to Israel (Acts 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 5 make about Jesus (Acts 5:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 5, 'What major point is made in Acts 5?', '["Gamaliel warned against fighting God if the work is of him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gamaliel warned against fighting God if the work is of him.', 'Gamaliel warned against fighting God if the work is of him (Acts 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 5, 'What major point does Acts 5 make about Jesus (Acts 5:19)?', '["The apostles were beaten yet rejoiced to suffer for Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The apostles were beaten yet rejoiced to suffer for Jesus’s name.', 'The apostles were beaten yet rejoiced to suffer for Jesus’s name (Acts 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 5 make about Jesus (Acts 5:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 5, 5, 'According to Acts 5, what did they do?', '["They did not stop teaching and preaching Jesus the Christ.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They did not stop teaching and preaching Jesus the Christ.', 'They did not stop teaching and preaching Jesus the Christ (Acts 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 5, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 1, 'According to Acts 6, what happened?', '["Complaint arose that Hellenist widows were neglected.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Complaint arose that Hellenist widows were neglected.', 'Complaint arose that Hellenist widows were neglected (Acts 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 6, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 1, 'According to Acts 6, what does the chapter say about the Holy Spirit?', '["Seven men full of the Spirit and wisdom were chosen and hands laid on them.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Seven men full of the Spirit and wisdom were chosen and hands laid on them.', 'Seven men full of the Spirit and wisdom were chosen and hands laid on them (Acts 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 6, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 1, 'According to Acts 6, what does the chapter say about faith?', '["The word multiplied; many priests obeyed the faith.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The word multiplied; many priests obeyed the faith.', 'The word multiplied; many priests obeyed the faith (Acts 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 6, what does the chapter say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 1, 'According to Acts 6, what does the chapter say about Stephen?', '["Stephen did great wonders among the people.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Stephen did great wonders among the people.', 'Stephen did great wonders among the people (Acts 6:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 6, what does the chapter say about Stephen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 1, 'According to Acts 6, what does the chapter say about witness?', '["False witnesses said he spoke against the holy place and Moses’s customs.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'False witnesses said he spoke against the holy place and Moses’s customs.', 'False witnesses said he spoke against the holy place and Moses’s customs (Acts 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 6, what does the chapter say about witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 2, 'According to Acts 6, what does the chapter say about the word of God (Acts 6:2)?', '["It is not appropriate for us to forsake the word of God and serve tables", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'It is not appropriate for us to forsake the word of God and serve tables', 'It is not appropriate for us to forsake the word of God and serve tables (Acts 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 6, what does the chapter say about the word of God (Acts 6:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 2, 'According to Acts 6, what does the chapter say about the Holy Spirit?', '["Stephen, a man full of faith and of the Holy Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Stephen, a man full of faith and of the Holy Spirit', 'Stephen, a man full of faith and of the Holy Spirit (Acts 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 6, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 2, 'According to Acts 6, what does the chapter say about the word of God (Acts 6:5)?', '["The word of God increased", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The word of God increased', 'The word of God increased (Acts 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 6, what does the chapter say about the word of God (Acts 6:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 2, 'According to Acts 6, what did they do?', '["They weren’t able to withstand the wisdom and the Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'They weren’t able to withstand the wisdom and the Spirit', 'They weren’t able to withstand the wisdom and the Spirit (Acts 6:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 6, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 2, 'According to Acts 6, what does the chapter say about an angel?', '["his face like it was the face of an angel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'his face like it was the face of an angel', 'his face like it was the face of an angel (Acts 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 6, what does the chapter say about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 3, 'What does Acts 6 teach about the Holy Spirit?', '["Seven men full of the Spirit and wisdom were chosen and hands laid on them.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Seven men full of the Spirit and wisdom were chosen and hands laid on them.', 'Seven men full of the Spirit and wisdom were chosen and hands laid on them (Acts 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 6 teach about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 3, 'What does Acts 6 teach about faith?', '["The word multiplied; many priests obeyed the faith.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The word multiplied; many priests obeyed the faith.', 'The word multiplied; many priests obeyed the faith (Acts 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 6 teach about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 3, 'What does Acts 6 teach about Stephen?', '["Stephen did great wonders among the people.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Stephen did great wonders among the people.', 'Stephen did great wonders among the people (Acts 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 6 teach about Stephen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 3, 'What does Acts 6 teach about witness?', '["False witnesses said he spoke against the holy place and Moses’s customs.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'False witnesses said he spoke against the holy place and Moses’s customs.', 'False witnesses said he spoke against the holy place and Moses’s customs (Acts 6:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 6 teach about witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 3, 'What does Acts 6 teach about an angel?', '["The council saw his face like an angel’s face.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The council saw his face like an angel’s face.', 'The council saw his face like an angel’s face (Acts 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 6 teach about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 4, 'Which phrase in Acts 6 speaks about the Holy Spirit?', '["Stephen, a man full of faith and of the Holy Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Stephen, a man full of faith and of the Holy Spirit', 'Stephen, a man full of faith and of the Holy Spirit (Acts 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 6 speaks about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 4, 'Which phrase in Acts 6 speaks about the word of God (Acts 6:3)?', '["The word of God increased", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The word of God increased', 'The word of God increased (Acts 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 6 speaks about the word of God (Acts 6:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 4, 'According to Acts 6, what did they do?', '["They weren’t able to withstand the wisdom and the Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'They weren’t able to withstand the wisdom and the Spirit', 'They weren’t able to withstand the wisdom and the Spirit (Acts 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 6, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 4, 'Which phrase in Acts 6 speaks about an angel?', '["his face like it was the face of an angel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'his face like it was the face of an angel', 'his face like it was the face of an angel (Acts 6:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 6 speaks about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 4, 'Which phrase in Acts 6 speaks about the word of God (Acts 6:8)?', '["It is not appropriate for us to forsake the word of God and serve tables", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'It is not appropriate for us to forsake the word of God and serve tables', 'It is not appropriate for us to forsake the word of God and serve tables (Acts 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 6 speaks about the word of God (Acts 6:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 5, 'What major point does Acts 6 make about faith?', '["The word multiplied; many priests obeyed the faith.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The word multiplied; many priests obeyed the faith.', 'The word multiplied; many priests obeyed the faith (Acts 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 6 make about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 5, 'What major point does Acts 6 make about Stephen?', '["Stephen did great wonders among the people.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Stephen did great wonders among the people.', 'Stephen did great wonders among the people (Acts 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 6 make about Stephen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 5, 'What major point does Acts 6 make about witness?', '["False witnesses said he spoke against the holy place and Moses’s customs.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'False witnesses said he spoke against the holy place and Moses’s customs.', 'False witnesses said he spoke against the holy place and Moses’s customs (Acts 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 6 make about witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 5, 'What major point does Acts 6 make about an angel?', '["The council saw his face like an angel’s face.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The council saw his face like an angel’s face.', 'The council saw his face like an angel’s face (Acts 6:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 6 make about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 6, 5, 'What major point is made in Acts 6?', '["Complaint arose that Hellenist widows were neglected.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Complaint arose that Hellenist widows were neglected.', 'Complaint arose that Hellenist widows were neglected (Acts 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 1, 'According to Acts 7, what does the chapter say about Stephen?', '["Stephen traced Israel’s history from Abraham through Moses and the prophets.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Stephen traced Israel’s history from Abraham through Moses and the prophets.', 'Stephen traced Israel’s history from Abraham through Moses and the prophets (Acts 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 7, what does the chapter say about Stephen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 1, 'According to Acts 7, what happened (Acts 7:35)?', '["He accused them of always resisting the Holy Spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He accused them of always resisting the Holy Spirit.', 'He accused them of always resisting the Holy Spirit (Acts 7:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:35)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 1, 'According to Acts 7, what happened (Acts 7:51)?', '["He said they betrayed and murdered the Righteous One.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said they betrayed and murdered the Righteous One.', 'He said they betrayed and murdered the Righteous One (Acts 7:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:51)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 1, 'According to Acts 7, what happened (Acts 7:52)?', '["He saw the Son of Man standing at God’s right hand.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He saw the Son of Man standing at God’s right hand.', 'He saw the Son of Man standing at God’s right hand (Acts 7:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:52)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 1, 'According to Acts 7, what did they do?', '["They stoned him outside the city.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They stoned him outside the city.', 'They stoned him outside the city (Acts 7:55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 7, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 2, 'According to Acts 7, what happened (Acts 7:2)?', '["You stiff-necked and uncircumcised in heart and ears", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'You stiff-necked and uncircumcised in heart and ears', 'You stiff-necked and uncircumcised in heart and ears (Acts 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 2, 'According to Acts 7, what happened (Acts 7:35)?', '["I see the heavens opened, and the Son of Man standing", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I see the heavens opened, and the Son of Man standing', 'I see the heavens opened, and the Son of Man standing (Acts 7:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:35)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 2, 'According to Acts 7, what does the chapter say about the Holy Spirit?', '["Lord Jesus, receive my spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Lord Jesus, receive my spirit', 'Lord Jesus, receive my spirit (Acts 7:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 7, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 2, 'According to Acts 7, what happened (Acts 7:52)?', '["don’t hold this sin against them", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'don’t hold this sin against them', 'don’t hold this sin against them (Acts 7:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:52)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 2, 'According to Acts 7, what does the chapter say about witness?', '["the witnesses placed their garments at the feet of a young man named Saul", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the witnesses placed their garments at the feet of a young man named Saul', 'the witnesses placed their garments at the feet of a young man named Saul (Acts 7:55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 7, what does the chapter say about witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 3, 'According to Acts 7, what happened (Acts 7:2)?', '["He accused them of always resisting the Holy Spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He accused them of always resisting the Holy Spirit.', 'He accused them of always resisting the Holy Spirit (Acts 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 3, 'According to Acts 7, what happened (Acts 7:35)?', '["He said they betrayed and murdered the Righteous One.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said they betrayed and murdered the Righteous One.', 'He said they betrayed and murdered the Righteous One (Acts 7:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:35)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 3, 'According to Acts 7, what happened (Acts 7:51)?', '["He saw the Son of Man standing at God’s right hand.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He saw the Son of Man standing at God’s right hand.', 'He saw the Son of Man standing at God’s right hand (Acts 7:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:51)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 3, 'According to Acts 7, what did they do?', '["They stoned him outside the city.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They stoned him outside the city.', 'They stoned him outside the city (Acts 7:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 7, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 3, 'According to Acts 7, what happened (Acts 7:55)?', '["He asked the Lord Jesus to receive his spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He asked the Lord Jesus to receive his spirit.', 'He asked the Lord Jesus to receive his spirit (Acts 7:55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:55)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 4, 'Which phrase belongs in Acts 7 (Acts 7:2)?', '["I see the heavens opened, and the Son of Man standing", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I see the heavens opened, and the Son of Man standing', 'I see the heavens opened, and the Son of Man standing (Acts 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 7 (Acts 7:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 4, 'Which phrase in Acts 7 speaks about the Holy Spirit?', '["Lord Jesus, receive my spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Lord Jesus, receive my spirit', 'Lord Jesus, receive my spirit (Acts 7:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 7 speaks about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 4, 'Which phrase belongs in Acts 7 (Acts 7:51)?', '["don’t hold this sin against them", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'don’t hold this sin against them', 'don’t hold this sin against them (Acts 7:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 7 (Acts 7:51)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 4, 'Which phrase in Acts 7 speaks about witness?', '["the witnesses placed their garments at the feet of a young man named Saul", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the witnesses placed their garments at the feet of a young man named Saul', 'the witnesses placed their garments at the feet of a young man named Saul (Acts 7:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 7 speaks about witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 4, 'Which phrase belongs in Acts 7 (Acts 7:55)?', '["You stiff-necked and uncircumcised in heart and ears", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'You stiff-necked and uncircumcised in heart and ears', 'You stiff-necked and uncircumcised in heart and ears (Acts 7:55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 7 (Acts 7:55)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 5, 'According to Acts 7, what happened (Acts 7:2)?', '["He said they betrayed and murdered the Righteous One.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said they betrayed and murdered the Righteous One.', 'He said they betrayed and murdered the Righteous One (Acts 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 5, 'According to Acts 7, what happened (Acts 7:35)?', '["He saw the Son of Man standing at God’s right hand.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He saw the Son of Man standing at God’s right hand.', 'He saw the Son of Man standing at God’s right hand (Acts 7:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:35)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 5, 'According to Acts 7, what did they do?', '["They stoned him outside the city.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They stoned him outside the city.', 'They stoned him outside the city (Acts 7:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 7, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 5, 'According to Acts 7, what happened (Acts 7:52)?', '["He asked the Lord Jesus to receive his spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He asked the Lord Jesus to receive his spirit.', 'He asked the Lord Jesus to receive his spirit (Acts 7:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:52)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 7, 5, 'According to Acts 7, what happened (Acts 7:55)?', '["He asked that their sin not be held against them.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He asked that their sin not be held against them.', 'He asked that their sin not be held against them (Acts 7:55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 7, what happened (Acts 7:55)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 1, 'According to Acts 8, what does the chapter say about Stephen?', '["Saul consented to Stephen’s death and later dragged believers to prison.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Saul consented to Stephen’s death and later dragged believers to prison.', 'Saul consented to Stephen’s death and later dragged believers to prison (Acts 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 8, what does the chapter say about Stephen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 1, 'According to Acts 8, what happened?', '["Those scattered preached the word.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Those scattered preached the word.', 'Those scattered preached the word (Acts 8:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 8, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 1, 'According to Acts 8, what does the chapter say about Philip?', '["Philip proclaimed Christ in Samaria with deliverances and healings.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Philip proclaimed Christ in Samaria with deliverances and healings.', 'Philip proclaimed Christ in Samaria with deliverances and healings (Acts 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 8, what does the chapter say about Philip?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 1, 'According to Acts 8, what does the chapter say about the Holy Spirit?', '["Peter and John prayed and laid hands so Samaritans received the Holy Spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter and John prayed and laid hands so Samaritans received the Holy Spirit.', 'Peter and John prayed and laid hands so Samaritans received the Holy Spirit (Acts 8:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 8, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 1, 'According to Acts 8, what does the chapter say about Peter?', '["Peter told Simon his money should perish for seeking to buy God’s gift.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter told Simon his money should perish for seeking to buy God’s gift.', 'Peter told Simon his money should perish for seeking to buy God’s gift (Acts 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 8, what does the chapter say about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 2, 'According to Acts 8, what happened (Acts 8:1)?', '["Saul was consenting to his death", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Saul was consenting to his death', 'Saul was consenting to his death (Acts 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 8, what happened (Acts 8:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 2, 'According to Acts 8, what does the chapter say about Philip?', '["Philip went down to the city of Samaria", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Philip went down to the city of Samaria', 'Philip went down to the city of Samaria (Acts 8:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 8, what does the chapter say about Philip?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 2, 'According to Acts 8, what happened (Acts 8:4)?', '["May your silver perish with you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'May your silver perish with you', 'May your silver perish with you (Acts 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 8, what happened (Acts 8:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 2, 'According to Acts 8, what did they do?', '["they received the Holy Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'they received the Holy Spirit', 'they received the Holy Spirit (Acts 8:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 8, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 2, 'According to Acts 8, what does the chapter say about Jesus?', '["Philip opened his mouth, and beginning from this Scripture, preached to him about Jesus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Philip opened his mouth, and beginning from this Scripture, preached to him about Jesus', 'Philip opened his mouth, and beginning from this Scripture, preached to him about Jesus (Acts 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 8, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 3, 'What does Acts 8 teach?', '["Those scattered preached the word.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Those scattered preached the word.', 'Those scattered preached the word (Acts 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 8 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 3, 'What does Acts 8 teach about Philip?', '["Philip proclaimed Christ in Samaria with deliverances and healings.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Philip proclaimed Christ in Samaria with deliverances and healings.', 'Philip proclaimed Christ in Samaria with deliverances and healings (Acts 8:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 8 teach about Philip?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 3, 'What does Acts 8 teach about the Holy Spirit?', '["Peter and John prayed and laid hands so Samaritans received the Holy Spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter and John prayed and laid hands so Samaritans received the Holy Spirit.', 'Peter and John prayed and laid hands so Samaritans received the Holy Spirit (Acts 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 8 teach about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 3, 'What does Acts 8 teach about Peter?', '["Peter told Simon his money should perish for seeking to buy God’s gift.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter told Simon his money should perish for seeking to buy God’s gift.', 'Peter told Simon his money should perish for seeking to buy God’s gift (Acts 8:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 8 teach about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 3, 'What does Acts 8 teach about Jesus?', '["Philip baptized the eunuch after preaching Jesus from Isaiah.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Philip baptized the eunuch after preaching Jesus from Isaiah.', 'Philip baptized the eunuch after preaching Jesus from Isaiah (Acts 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 8 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 4, 'Which phrase in Acts 8 speaks about Philip?', '["Philip went down to the city of Samaria", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Philip went down to the city of Samaria', 'Philip went down to the city of Samaria (Acts 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 8 speaks about Philip?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 4, 'Which phrase belongs in Acts 8?', '["May your silver perish with you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'May your silver perish with you', 'May your silver perish with you (Acts 8:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 4, 'According to Acts 8, what did they do?', '["they received the Holy Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'they received the Holy Spirit', 'they received the Holy Spirit (Acts 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 8, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 4, 'Which phrase in Acts 8 speaks about Jesus?', '["Philip opened his mouth, and beginning from this Scripture, preached to him about Jesus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Philip opened his mouth, and beginning from this Scripture, preached to him about Jesus', 'Philip opened his mouth, and beginning from this Scripture, preached to him about Jesus (Acts 8:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 8 speaks about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 4, 'Which phrase in Acts 8 speaks about the Holy Spirit?', '["the Spirit of the Lord caught Philip away", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the Spirit of the Lord caught Philip away', 'the Spirit of the Lord caught Philip away (Acts 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 8 speaks about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 5, 'What major point does Acts 8 make about Philip?', '["Philip proclaimed Christ in Samaria with deliverances and healings.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Philip proclaimed Christ in Samaria with deliverances and healings.', 'Philip proclaimed Christ in Samaria with deliverances and healings (Acts 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 8 make about Philip?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 5, 'What major point does Acts 8 make about the Holy Spirit (Acts 8:3)?', '["Peter and John prayed and laid hands so Samaritans received the Holy Spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter and John prayed and laid hands so Samaritans received the Holy Spirit.', 'Peter and John prayed and laid hands so Samaritans received the Holy Spirit (Acts 8:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 8 make about the Holy Spirit (Acts 8:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 5, 'What major point does Acts 8 make about Peter?', '["Peter told Simon his money should perish for seeking to buy God’s gift.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter told Simon his money should perish for seeking to buy God’s gift.', 'Peter told Simon his money should perish for seeking to buy God’s gift (Acts 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 8 make about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 5, 'What major point does Acts 8 make about Jesus?', '["Philip baptized the eunuch after preaching Jesus from Isaiah.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Philip baptized the eunuch after preaching Jesus from Isaiah.', 'Philip baptized the eunuch after preaching Jesus from Isaiah (Acts 8:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 8 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 8, 5, 'What major point does Acts 8 make about the Holy Spirit (Acts 8:12)?', '["The Spirit caught Philip away; he preached to cities as far as Caesarea.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Spirit caught Philip away; he preached to cities as far as Caesarea.', 'The Spirit caught Philip away; he preached to cities as far as Caesarea (Acts 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 8 make about the Holy Spirit (Acts 8:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 1, 'According to Acts 9, what does the chapter say about Jesus (Acts 9:4)?', '["Jesus identified himself as the one Saul persecuted.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jesus identified himself as the one Saul persecuted.', 'Jesus identified himself as the one Saul persecuted (Acts 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 9, what does the chapter say about Jesus (Acts 9:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 1, 'According to Acts 9, what does the chapter say about the Holy Spirit?', '["Ananias laid hands so Saul received sight and the Holy Spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Ananias laid hands so Saul received sight and the Holy Spirit.', 'Ananias laid hands so Saul received sight and the Holy Spirit (Acts 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 9, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 1, 'According to Acts 9, what does the chapter say about Jesus (Acts 9:15)?', '["Saul immediately proclaimed Jesus as the Son of God in synagogues.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Saul immediately proclaimed Jesus as the Son of God in synagogues.', 'Saul immediately proclaimed Jesus as the Son of God in synagogues (Acts 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 9, what does the chapter say about Jesus (Acts 9:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 1, 'According to Acts 9, what does the chapter say about the Jews?', '["Disciples lowered him in a basket when Jews plotted to kill him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples lowered him in a basket when Jews plotted to kill him.', 'Disciples lowered him in a basket when Jews plotted to kill him (Acts 9:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 9, what does the chapter say about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 1, 'According to Acts 9, what does the chapter say about Barnabas?', '["Barnabas told the apostles how Saul had seen the Lord.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Barnabas told the apostles how Saul had seen the Lord.', 'Barnabas told the apostles how Saul had seen the Lord (Acts 9:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 9, what does the chapter say about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 2, 'According to Acts 9, Saul, Saul, why do you persecute me?', '["Saul, Saul, why do you persecute me?", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Saul, Saul, why do you persecute me?', 'Saul, Saul, why do you persecute me? (Acts 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 9, Saul, Saul, why do you persecute me?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 2, 'According to Acts 9, what does the chapter say about Jesus?', '["I am Jesus, whom you are persecuting", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am Jesus, whom you are persecuting', 'I am Jesus, whom you are persecuting (Acts 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 9, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 2, 'According to Acts 9, what happened (Acts 9:15)?', '["he is my chosen vessel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he is my chosen vessel', 'he is my chosen vessel (Acts 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 9, what happened (Acts 9:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 2, 'According to Acts 9, what happened (Acts 9:17)?', '["lowered him in a basket", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'lowered him in a basket', 'lowered him in a basket (Acts 9:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 9, what happened (Acts 9:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 2, 'According to Acts 9, what does the chapter say about Barnabas?', '["Barnabas took him and brought him to the apostles", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Barnabas took him and brought him to the apostles', 'Barnabas took him and brought him to the apostles (Acts 9:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 9, what does the chapter say about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 3, 'What does Acts 9 teach about the Holy Spirit?', '["Ananias laid hands so Saul received sight and the Holy Spirit.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Ananias laid hands so Saul received sight and the Holy Spirit.', 'Ananias laid hands so Saul received sight and the Holy Spirit (Acts 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 9 teach about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 3, 'What does Acts 9 teach about Jesus?', '["Saul immediately proclaimed Jesus as the Son of God in synagogues.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Saul immediately proclaimed Jesus as the Son of God in synagogues.', 'Saul immediately proclaimed Jesus as the Son of God in synagogues (Acts 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 9 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 3, 'What does Acts 9 teach about the Jews?', '["Disciples lowered him in a basket when Jews plotted to kill him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples lowered him in a basket when Jews plotted to kill him.', 'Disciples lowered him in a basket when Jews plotted to kill him (Acts 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 9 teach about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 3, 'What does Acts 9 teach about Barnabas?', '["Barnabas told the apostles how Saul had seen the Lord.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Barnabas told the apostles how Saul had seen the Lord.', 'Barnabas told the apostles how Saul had seen the Lord (Acts 9:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 9 teach about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 3, 'What does Acts 9 teach about Peter?', '["Peter healed paralyzed Aeneas in Lydda.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter healed paralyzed Aeneas in Lydda.', 'Peter healed paralyzed Aeneas in Lydda (Acts 9:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 9 teach about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 4, 'Which phrase in Acts 9 speaks about Jesus (Acts 9:4)?', '["I am Jesus, whom you are persecuting", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am Jesus, whom you are persecuting', 'I am Jesus, whom you are persecuting (Acts 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 9 speaks about Jesus (Acts 9:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 4, 'According to Acts 9, what happened?', '["he is my chosen vessel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he is my chosen vessel', 'he is my chosen vessel (Acts 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 9, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 4, 'Which phrase belongs in Acts 9?', '["lowered him in a basket", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'lowered him in a basket', 'lowered him in a basket (Acts 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 4, 'Which phrase in Acts 9 speaks about Barnabas?', '["Barnabas took him and brought him to the apostles", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Barnabas took him and brought him to the apostles', 'Barnabas took him and brought him to the apostles (Acts 9:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 9 speaks about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 4, 'Which phrase in Acts 9 speaks about Jesus (Acts 9:20)?', '["Jesus Christ heals you. Get up and make your bed", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Jesus Christ heals you. Get up and make your bed', 'Jesus Christ heals you. Get up and make your bed (Acts 9:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 9 speaks about Jesus (Acts 9:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 5, 'What major point does Acts 9 make about Jesus?', '["Saul immediately proclaimed Jesus as the Son of God in synagogues.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Saul immediately proclaimed Jesus as the Son of God in synagogues.', 'Saul immediately proclaimed Jesus as the Son of God in synagogues (Acts 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 9 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 5, 'What major point does Acts 9 make about the Jews?', '["Disciples lowered him in a basket when Jews plotted to kill him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples lowered him in a basket when Jews plotted to kill him.', 'Disciples lowered him in a basket when Jews plotted to kill him (Acts 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 9 make about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 5, 'What major point does Acts 9 make about Barnabas?', '["Barnabas told the apostles how Saul had seen the Lord.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Barnabas told the apostles how Saul had seen the Lord.', 'Barnabas told the apostles how Saul had seen the Lord (Acts 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 9 make about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 5, 'What major point does Acts 9 make about Peter (Acts 9:17)?', '["Peter healed paralyzed Aeneas in Lydda.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter healed paralyzed Aeneas in Lydda.', 'Peter healed paralyzed Aeneas in Lydda (Acts 9:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 9 make about Peter (Acts 9:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 9, 5, 'What major point does Acts 9 make about Peter (Acts 9:20)?', '["Peter raised Tabitha, and many believed in Joppa.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter raised Tabitha, and many believed in Joppa.', 'Peter raised Tabitha, and many believed in Joppa (Acts 9:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 9 make about Peter (Acts 9:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 1, 'According to Acts 10, what does the chapter say about Peter (Acts 10:3)?', '["An angel told Cornelius to send for Peter at Joppa.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel told Cornelius to send for Peter at Joppa.', 'An angel told Cornelius to send for Peter at Joppa (Acts 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 10, what does the chapter say about Peter (Acts 10:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 1, 'According to Acts 10, what does the chapter say about Peter (Acts 10:4)?', '["Peter saw the sheet vision three times with the command to eat.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter saw the sheet vision three times with the command to eat.', 'Peter saw the sheet vision three times with the command to eat (Acts 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 10, what does the chapter say about Peter (Acts 10:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 1, 'According to Acts 10, what does the chapter say about Peter (Acts 10:15)?', '["Peter said God showed him not to call any man unholy or unclean.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God showed him not to call any man unholy or unclean.', 'Peter said God showed him not to call any man unholy or unclean (Acts 10:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 10, what does the chapter say about Peter (Acts 10:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 1, 'According to Acts 10, what happened?', '["He testified that God accepts those who fear him and work righteousness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He testified that God accepts those who fear him and work righteousness.', 'He testified that God accepts those who fear him and work righteousness (Acts 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 10, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 1, 'According to Acts 10, what does the chapter say about the Holy Spirit?', '["The Holy Spirit fell on hearers before baptism was finished.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Holy Spirit fell on hearers before baptism was finished.', 'The Holy Spirit fell on hearers before baptism was finished (Acts 10:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 10, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 2, 'According to Acts 10, what does the chapter say about prayer?', '["Your prayers and your gifts to the needy have gone up for a memorial", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Your prayers and your gifts to the needy have gone up for a memorial', 'Your prayers and your gifts to the needy have gone up for a memorial (Acts 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 10, what does the chapter say about prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 2, 'According to Acts 10, What God has cleansed, you must not call unclean', '["What God has cleansed, you must not call unclean", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'What God has cleansed, you must not call unclean', 'What God has cleansed, you must not call unclean (Acts 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 10, What God has cleansed, you must not call unclean'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 2, 'According to Acts 10, what did God do?', '["God doesn’t show favoritism", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God doesn’t show favoritism', 'God doesn’t show favoritism (Acts 10:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 10, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 2, 'According to Acts 10, what does the chapter say about the Holy Spirit?', '["the Holy Spirit fell on all those who heard the word", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the Holy Spirit fell on all those who heard the word', 'the Holy Spirit fell on all those who heard the word (Acts 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 10, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 2, 'According to Acts 10, what did they do?', '["They have received the Holy Spirit just like us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'They have received the Holy Spirit just like us', 'They have received the Holy Spirit just like us (Acts 10:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 10, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 3, 'What does Acts 10 teach about Peter (Acts 10:3)?', '["Peter saw the sheet vision three times with the command to eat.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter saw the sheet vision three times with the command to eat.', 'Peter saw the sheet vision three times with the command to eat (Acts 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 10 teach about Peter (Acts 10:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 3, 'What does Acts 10 teach about Peter (Acts 10:4)?', '["Peter said God showed him not to call any man unholy or unclean.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God showed him not to call any man unholy or unclean.', 'Peter said God showed him not to call any man unholy or unclean (Acts 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 10 teach about Peter (Acts 10:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 3, 'According to Acts 10, what happened?', '["He testified that God accepts those who fear him and work righteousness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He testified that God accepts those who fear him and work righteousness.', 'He testified that God accepts those who fear him and work righteousness (Acts 10:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 10, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 3, 'What does Acts 10 teach about the Holy Spirit?', '["The Holy Spirit fell on hearers before baptism was finished.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Holy Spirit fell on hearers before baptism was finished.', 'The Holy Spirit fell on hearers before baptism was finished (Acts 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 10 teach about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 3, 'According to Acts 10, what did they do?', '["They spoke in languages and magnified God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They spoke in languages and magnified God.', 'They spoke in languages and magnified God (Acts 10:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 10, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 4, 'According to Acts 10, What God has cleansed, you must not call unclean', '["What God has cleansed, you must not call unclean", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'What God has cleansed, you must not call unclean', 'What God has cleansed, you must not call unclean (Acts 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 10, What God has cleansed, you must not call unclean'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 4, 'According to Acts 10, what did God do?', '["God doesn’t show favoritism", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God doesn’t show favoritism', 'God doesn’t show favoritism (Acts 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 10, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 4, 'Which phrase in Acts 10 speaks about the Holy Spirit?', '["the Holy Spirit fell on all those who heard the word", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the Holy Spirit fell on all those who heard the word', 'the Holy Spirit fell on all those who heard the word (Acts 10:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 10 speaks about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 4, 'According to Acts 10, what did they do?', '["They have received the Holy Spirit just like us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'They have received the Holy Spirit just like us', 'They have received the Holy Spirit just like us (Acts 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 10, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 4, 'Which phrase in Acts 10 speaks about prayer?', '["Your prayers and your gifts to the needy have gone up for a memorial", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Your prayers and your gifts to the needy have gone up for a memorial', 'Your prayers and your gifts to the needy have gone up for a memorial (Acts 10:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 10 speaks about prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 5, 'What major point does Acts 10 make about Peter?', '["Peter said God showed him not to call any man unholy or unclean.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God showed him not to call any man unholy or unclean.', 'Peter said God showed him not to call any man unholy or unclean (Acts 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 10 make about Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 5, 'According to Acts 10, what happened?', '["He testified that God accepts those who fear him and work righteousness.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He testified that God accepts those who fear him and work righteousness.', 'He testified that God accepts those who fear him and work righteousness (Acts 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 10, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 5, 'What major point does Acts 10 make about the Holy Spirit?', '["The Holy Spirit fell on hearers before baptism was finished.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Holy Spirit fell on hearers before baptism was finished.', 'The Holy Spirit fell on hearers before baptism was finished (Acts 10:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 10 make about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 5, 'According to Acts 10, what did they do?', '["They spoke in languages and magnified God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They spoke in languages and magnified God.', 'They spoke in languages and magnified God (Acts 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 10, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 10, 5, 'What major point does Acts 10 make about Jesus?', '["Peter commanded baptism in the name of Jesus Christ.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter commanded baptism in the name of Jesus Christ.', 'Peter commanded baptism in the name of Jesus Christ (Acts 10:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 10 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 1, 'According to Acts 11, what does the chapter say about the Holy Spirit?', '["Peter retold the sheet vision and Spirit falling on Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter retold the sheet vision and Spirit falling on Gentiles.', 'Peter retold the sheet vision and Spirit falling on Gentiles (Acts 11:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 11, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 1, 'According to Acts 11, what does the chapter say about repentance?', '["The Jerusalem group glorified God for Gentile repentance to life.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Jerusalem group glorified God for Gentile repentance to life.', 'The Jerusalem group glorified God for Gentile repentance to life (Acts 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 11, what does the chapter say about repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 1, 'According to Acts 11, what happened (Acts 11:18)?', '["A great number believed at Antioch.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'A great number believed at Antioch.', 'A great number believed at Antioch (Acts 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 11, what happened (Acts 11:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 1, 'According to Acts 11, what happened (Acts 11:21)?', '["Disciples were first called Christians in Antioch.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples were first called Christians in Antioch.', 'Disciples were first called Christians in Antioch (Acts 11:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 11, what happened (Acts 11:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 1, 'According to Acts 11, what happened (Acts 11:26)?', '["Agabus foretold a great famine in Claudius’s days.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agabus foretold a great famine in Claudius’s days.', 'Agabus foretold a great famine in Claudius’s days (Acts 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 11, what happened (Acts 11:26)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 2, 'According to Acts 11, what did God do (Acts 11:15)?', '["God gave to them the same gift as us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God gave to them the same gift as us', 'God gave to them the same gift as us (Acts 11:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 11, what did God do (Acts 11:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 2, 'According to Acts 11, what did God do (Acts 11:17)?', '["God has also granted to the Gentiles repentance to life", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God has also granted to the Gentiles repentance to life', 'God has also granted to the Gentiles repentance to life (Acts 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 11, what did God do (Acts 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 2, 'According to Acts 11, what happened (Acts 11:18)?', '["The disciples were first called Christians in Antioch", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The disciples were first called Christians in Antioch', 'The disciples were first called Christians in Antioch (Acts 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 11, what happened (Acts 11:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 2, 'According to Acts 11, what happened (Acts 11:21)?', '["there should be a great famine all over the world", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'there should be a great famine all over the world', 'there should be a great famine all over the world (Acts 11:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 11, what happened (Acts 11:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 2, 'According to Acts 11, what does the chapter say about the Holy Spirit?', '["Peter retold the sheet vision and Spirit falling on Gentiles.", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Peter retold the sheet vision and Spirit falling on Gentiles.', 'Peter retold the sheet vision and Spirit falling on Gentiles (Acts 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 11, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 3, 'What does Acts 11 teach about repentance?', '["The Jerusalem group glorified God for Gentile repentance to life.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Jerusalem group glorified God for Gentile repentance to life.', 'The Jerusalem group glorified God for Gentile repentance to life (Acts 11:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 11 teach about repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 3, 'What does Acts 11 teach (Acts 11:17)?', '["A great number believed at Antioch.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'A great number believed at Antioch.', 'A great number believed at Antioch (Acts 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 11 teach (Acts 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 3, 'What does Acts 11 teach (Acts 11:18)?', '["Disciples were first called Christians in Antioch.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples were first called Christians in Antioch.', 'Disciples were first called Christians in Antioch (Acts 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 11 teach (Acts 11:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 3, 'What does Acts 11 teach (Acts 11:21)?', '["Agabus foretold a great famine in Claudius’s days.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agabus foretold a great famine in Claudius’s days.', 'Agabus foretold a great famine in Claudius’s days (Acts 11:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 11 teach (Acts 11:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 3, 'What does Acts 11 teach about Barnabas?', '["Disciples sent relief to Judea by Barnabas and Saul.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples sent relief to Judea by Barnabas and Saul.', 'Disciples sent relief to Judea by Barnabas and Saul (Acts 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 11 teach about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 4, 'According to Acts 11, what did God do (Acts 11:15)?', '["God has also granted to the Gentiles repentance to life", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God has also granted to the Gentiles repentance to life', 'God has also granted to the Gentiles repentance to life (Acts 11:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 11, what did God do (Acts 11:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 4, 'Which phrase belongs in Acts 11 (Acts 11:17)?', '["The disciples were first called Christians in Antioch", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The disciples were first called Christians in Antioch', 'The disciples were first called Christians in Antioch (Acts 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 11 (Acts 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 4, 'Which phrase belongs in Acts 11 (Acts 11:18)?', '["there should be a great famine all over the world", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'there should be a great famine all over the world', 'there should be a great famine all over the world (Acts 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 11 (Acts 11:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 4, 'Which phrase in Acts 11 speaks about the Holy Spirit?', '["Peter retold the sheet vision and Spirit falling on Gentiles.", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Peter retold the sheet vision and Spirit falling on Gentiles.', 'Peter retold the sheet vision and Spirit falling on Gentiles (Acts 11:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 11 speaks about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 4, 'According to Acts 11, what did God do (Acts 11:26)?', '["God gave to them the same gift as us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God gave to them the same gift as us', 'God gave to them the same gift as us (Acts 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 11, what did God do (Acts 11:26)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 5, 'What major point is made in Acts 11 (Acts 11:15)?', '["A great number believed at Antioch.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'A great number believed at Antioch.', 'A great number believed at Antioch (Acts 11:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 11 (Acts 11:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 5, 'What major point is made in Acts 11 (Acts 11:17)?', '["Disciples were first called Christians in Antioch.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples were first called Christians in Antioch.', 'Disciples were first called Christians in Antioch (Acts 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 11 (Acts 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 5, 'What major point is made in Acts 11 (Acts 11:18)?', '["Agabus foretold a great famine in Claudius’s days.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agabus foretold a great famine in Claudius’s days.', 'Agabus foretold a great famine in Claudius’s days (Acts 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 11 (Acts 11:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 5, 'What major point does Acts 11 make about Barnabas?', '["Disciples sent relief to Judea by Barnabas and Saul.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Disciples sent relief to Judea by Barnabas and Saul.', 'Disciples sent relief to Judea by Barnabas and Saul (Acts 11:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 11 make about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 11, 5, 'What major point does Acts 11 make about the Holy Spirit?', '["Peter retold the sheet vision and Spirit falling on Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter retold the sheet vision and Spirit falling on Gentiles.', 'Peter retold the sheet vision and Spirit falling on Gentiles (Acts 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 11 make about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 1, 'According to Acts 12, what does the chapter say about Peter (Acts 12:2)?', '["Herod killed James with the sword and seized Peter.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Herod killed James with the sword and seized Peter.', 'Herod killed James with the sword and seized Peter (Acts 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 12, what does the chapter say about Peter (Acts 12:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 1, 'According to Acts 12, what does the chapter say about Peter (Acts 12:5)?', '["An angel woke Peter, chains fell, and the iron gate opened.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel woke Peter, chains fell, and the iron gate opened.', 'An angel woke Peter, chains fell, and the iron gate opened (Acts 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 12, what does the chapter say about Peter (Acts 12:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 1, 'According to Acts 12, what does the chapter say about Peter (Acts 12:7)?', '["Rhoda recognized Peter’s voice but the house doubted.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Rhoda recognized Peter’s voice but the house doubted.', 'Rhoda recognized Peter’s voice but the house doubted (Acts 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 12, what does the chapter say about Peter (Acts 12:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 1, 'According to Acts 12, what does the chapter say about Peter (Acts 12:11)?', '["Herod had the guards put to death when Peter vanished.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Herod had the guards put to death when Peter vanished.', 'Herod had the guards put to death when Peter vanished (Acts 12:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 12, what does the chapter say about Peter (Acts 12:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 1, 'According to Acts 12, what does the chapter say about an angel?', '["An angel struck Herod for accepting divine honors; worms consumed him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel struck Herod for accepting divine honors; worms consumed him.', 'An angel struck Herod for accepting divine honors; worms consumed him (Acts 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 12, what does the chapter say about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 2, 'According to Acts 12, what does the chapter say about prayer?', '["constant prayer was made by the assembly to God for him", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'constant prayer was made by the assembly to God for him', 'constant prayer was made by the assembly to God for him (Acts 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 12, what does the chapter say about prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 2, 'According to Acts 12, what happened (Acts 12:5)?', '["His chains fell off his hands", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'His chains fell off his hands', 'His chains fell off his hands (Acts 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 12, what happened (Acts 12:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 2, 'According to Acts 12, what does the chapter say about an angel?', '["Now I truly know that the Lord has sent out his angel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Now I truly know that the Lord has sent out his angel', 'Now I truly know that the Lord has sent out his angel (Acts 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 12, what does the chapter say about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 2, 'According to Acts 12, what happened (Acts 12:11)?', '["The voice of a god, and not of a man", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The voice of a god, and not of a man', 'The voice of a god, and not of a man (Acts 12:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 12, what happened (Acts 12:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 2, 'According to Acts 12, what happened (Acts 12:12)?', '["he was eaten by worms and died", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he was eaten by worms and died', 'he was eaten by worms and died (Acts 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 12, what happened (Acts 12:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 3, 'What does Acts 12 teach about Peter (Acts 12:2)?', '["An angel woke Peter, chains fell, and the iron gate opened.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel woke Peter, chains fell, and the iron gate opened.', 'An angel woke Peter, chains fell, and the iron gate opened (Acts 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 12 teach about Peter (Acts 12:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 3, 'What does Acts 12 teach about Peter (Acts 12:5)?', '["Rhoda recognized Peter’s voice but the house doubted.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Rhoda recognized Peter’s voice but the house doubted.', 'Rhoda recognized Peter’s voice but the house doubted (Acts 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 12 teach about Peter (Acts 12:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 3, 'What does Acts 12 teach about Peter (Acts 12:7)?', '["Herod had the guards put to death when Peter vanished.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Herod had the guards put to death when Peter vanished.', 'Herod had the guards put to death when Peter vanished (Acts 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 12 teach about Peter (Acts 12:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 3, 'What does Acts 12 teach about an angel?', '["An angel struck Herod for accepting divine honors; worms consumed him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel struck Herod for accepting divine honors; worms consumed him.', 'An angel struck Herod for accepting divine honors; worms consumed him (Acts 12:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 12 teach about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 3, 'What does Acts 12 teach about Barnabas?', '["Barnabas and Saul returned from Jerusalem with John Mark.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Barnabas and Saul returned from Jerusalem with John Mark.', 'Barnabas and Saul returned from Jerusalem with John Mark (Acts 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 12 teach about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 4, 'Which phrase belongs in Acts 12 (Acts 12:2)?', '["His chains fell off his hands", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'His chains fell off his hands', 'His chains fell off his hands (Acts 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 12 (Acts 12:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 4, 'Which phrase in Acts 12 speaks about an angel?', '["Now I truly know that the Lord has sent out his angel", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Now I truly know that the Lord has sent out his angel', 'Now I truly know that the Lord has sent out his angel (Acts 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 12 speaks about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 4, 'Which phrase belongs in Acts 12 (Acts 12:7)?', '["The voice of a god, and not of a man", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The voice of a god, and not of a man', 'The voice of a god, and not of a man (Acts 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 12 (Acts 12:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 4, 'According to Acts 12, what happened?', '["he was eaten by worms and died", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he was eaten by worms and died', 'he was eaten by worms and died (Acts 12:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 12, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 4, 'Which phrase in Acts 12 speaks about the word of God?', '["the word of God grew and multiplied", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the word of God grew and multiplied', 'the word of God grew and multiplied (Acts 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 12 speaks about the word of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 5, 'What major point does Acts 12 make about Peter (Acts 12:2)?', '["Rhoda recognized Peter’s voice but the house doubted.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Rhoda recognized Peter’s voice but the house doubted.', 'Rhoda recognized Peter’s voice but the house doubted (Acts 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 12 make about Peter (Acts 12:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 5, 'What major point does Acts 12 make about Peter (Acts 12:5)?', '["Herod had the guards put to death when Peter vanished.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Herod had the guards put to death when Peter vanished.', 'Herod had the guards put to death when Peter vanished (Acts 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 12 make about Peter (Acts 12:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 5, 'What major point does Acts 12 make about an angel?', '["An angel struck Herod for accepting divine honors; worms consumed him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel struck Herod for accepting divine honors; worms consumed him.', 'An angel struck Herod for accepting divine honors; worms consumed him (Acts 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 12 make about an angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 5, 'What major point does Acts 12 make about Barnabas?', '["Barnabas and Saul returned from Jerusalem with John Mark.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Barnabas and Saul returned from Jerusalem with John Mark.', 'Barnabas and Saul returned from Jerusalem with John Mark (Acts 12:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 12 make about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 12, 5, 'What major point does Acts 12 make about Peter (Acts 12:12)?', '["Herod killed James with the sword and seized Peter.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Herod killed James with the sword and seized Peter.', 'Herod killed James with the sword and seized Peter (Acts 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 12 make about Peter (Acts 12:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 1, 'According to Acts 13, what does the chapter say about the Holy Spirit?', '["The Spirit said to separate Barnabas and Saul for his work.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Spirit said to separate Barnabas and Saul for his work.', 'The Spirit said to separate Barnabas and Saul for his work (Acts 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 13, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 1, 'According to Acts 13, what does the chapter say about Paul (Acts 13:3)?', '["Paul struck Elymas blind for opposing the faith.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul struck Elymas blind for opposing the faith.', 'Paul struck Elymas blind for opposing the faith (Acts 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 13, what does the chapter say about Paul (Acts 13:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 1, 'According to Acts 13, what does the chapter say about Jesus?', '["Paul preached Jesus crucified, buried, raised, and seen by witnesses.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul preached Jesus crucified, buried, raised, and seen by witnesses.', 'Paul preached Jesus crucified, buried, raised, and seen by witnesses (Acts 13:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 13, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 1, 'According to Acts 13, what happened?', '["He offered remission of sins and justification not by Moses’s law alone.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He offered remission of sins and justification not by Moses’s law alone.', 'He offered remission of sins and justification not by Moses’s law alone (Acts 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 13, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 1, 'According to Acts 13, what does the chapter say about Paul (Acts 13:12)?', '["Jews contradicted; Paul said they judged themselves unworthy of eternal life.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews contradicted; Paul said they judged themselves unworthy of eternal life.', 'Jews contradicted; Paul said they judged themselves unworthy of eternal life (Acts 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 13, what does the chapter say about Paul (Acts 13:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 2, 'According to Acts 13, what does the chapter say about Barnabas?', '["Separate Barnabas and Saul for me", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Separate Barnabas and Saul for me', 'Separate Barnabas and Saul for me (Acts 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 13, what does the chapter say about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 2, 'According to Acts 13, what does the chapter say about Paul?', '["Saul, who is also called Paul", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Saul, who is also called Paul', 'Saul, who is also called Paul (Acts 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 13, what does the chapter say about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 2, 'According to Acts 13, what happened?', '["the hand of the Lord is on you, and you will be blind", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the hand of the Lord is on you, and you will be blind', 'the hand of the Lord is on you, and you will be blind (Acts 13:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 13, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 2, 'According to Acts 13, what did God do?', '["God has fulfilled this to us in that he raised up Jesus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God has fulfilled this to us in that he raised up Jesus', 'God has fulfilled this to us in that he raised up Jesus (Acts 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 13, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 2, 'According to Acts 13, what does the chapter say about the Gentiles?', '["we turn to the Gentiles", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'we turn to the Gentiles', 'we turn to the Gentiles (Acts 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 13, what does the chapter say about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 3, 'What does Acts 13 teach about Paul (Acts 13:2)?', '["Paul struck Elymas blind for opposing the faith.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul struck Elymas blind for opposing the faith.', 'Paul struck Elymas blind for opposing the faith (Acts 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 13 teach about Paul (Acts 13:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 3, 'What does Acts 13 teach about Jesus?', '["Paul preached Jesus crucified, buried, raised, and seen by witnesses.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul preached Jesus crucified, buried, raised, and seen by witnesses.', 'Paul preached Jesus crucified, buried, raised, and seen by witnesses (Acts 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 13 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 3, 'According to Acts 13, what happened?', '["He offered remission of sins and justification not by Moses’s law alone.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He offered remission of sins and justification not by Moses’s law alone.', 'He offered remission of sins and justification not by Moses’s law alone (Acts 13:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 13, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 3, 'What does Acts 13 teach about Paul (Acts 13:11)?', '["Jews contradicted; Paul said they judged themselves unworthy of eternal life.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews contradicted; Paul said they judged themselves unworthy of eternal life.', 'Jews contradicted; Paul said they judged themselves unworthy of eternal life (Acts 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 13 teach about Paul (Acts 13:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 3, 'What does Acts 13 teach about the Gentiles?', '["Gentiles glorified the word; as many as appointed to eternal life believed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gentiles glorified the word; as many as appointed to eternal life believed.', 'Gentiles glorified the word; as many as appointed to eternal life believed (Acts 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 13 teach about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 4, 'Which phrase in Acts 13 speaks about Paul?', '["Saul, who is also called Paul", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Saul, who is also called Paul', 'Saul, who is also called Paul (Acts 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 13 speaks about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 4, 'Which phrase belongs in Acts 13 (Acts 13:3)?', '["the hand of the Lord is on you, and you will be blind", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the hand of the Lord is on you, and you will be blind', 'the hand of the Lord is on you, and you will be blind (Acts 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 13 (Acts 13:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 4, 'According to Acts 13, what did God do?', '["God has fulfilled this to us in that he raised up Jesus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'God has fulfilled this to us in that he raised up Jesus', 'God has fulfilled this to us in that he raised up Jesus (Acts 13:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 13, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 4, 'Which phrase in Acts 13 speaks about the Gentiles?', '["we turn to the Gentiles", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'we turn to the Gentiles', 'we turn to the Gentiles (Acts 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 13 speaks about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 4, 'Which phrase belongs in Acts 13 (Acts 13:12)?', '["as many as were appointed to eternal life believed", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'as many as were appointed to eternal life believed', 'as many as were appointed to eternal life believed (Acts 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 13 (Acts 13:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 5, 'What major point does Acts 13 make about Jesus?', '["Paul preached Jesus crucified, buried, raised, and seen by witnesses.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul preached Jesus crucified, buried, raised, and seen by witnesses.', 'Paul preached Jesus crucified, buried, raised, and seen by witnesses (Acts 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 13 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 5, 'According to Acts 13, what happened?', '["He offered remission of sins and justification not by Moses’s law alone.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He offered remission of sins and justification not by Moses’s law alone.', 'He offered remission of sins and justification not by Moses’s law alone (Acts 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 13, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 5, 'What major point does Acts 13 make about Paul?', '["Jews contradicted; Paul said they judged themselves unworthy of eternal life.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews contradicted; Paul said they judged themselves unworthy of eternal life.', 'Jews contradicted; Paul said they judged themselves unworthy of eternal life (Acts 13:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 13 make about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 5, 'What major point does Acts 13 make about the Gentiles?', '["Gentiles glorified the word; as many as appointed to eternal life believed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gentiles glorified the word; as many as appointed to eternal life believed.', 'Gentiles glorified the word; as many as appointed to eternal life believed (Acts 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 13 make about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 13, 5, 'What major point does Acts 13 make about the Holy Spirit?', '["The Spirit said to separate Barnabas and Saul for his work.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Spirit said to separate Barnabas and Saul for his work.', 'The Spirit said to separate Barnabas and Saul for his work (Acts 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 13 make about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 1, 'According to Acts 14, what happened?', '["The Lord testified to his word with signs in Iconium.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord testified to his word with signs in Iconium.', 'The Lord testified to his word with signs in Iconium (Acts 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 14, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 1, 'According to Acts 14, what does the chapter say about Paul (Acts 14:9)?', '["Paul healed a lifelong cripple who had faith to be healed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul healed a lifelong cripple who had faith to be healed.', 'Paul healed a lifelong cripple who had faith to be healed (Acts 14:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 14, what does the chapter say about Paul (Acts 14:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 1, 'According to Acts 14, what did they do (Acts 14:10)?', '["They urged Lycaonians to turn from vain things to the living God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They urged Lycaonians to turn from vain things to the living God.', 'They urged Lycaonians to turn from vain things to the living God (Acts 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 1, 'According to Acts 14, what does the chapter say about Paul (Acts 14:15)?', '["Jews persuaded the crowd to stone Paul; he entered the city next day.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews persuaded the crowd to stone Paul; he entered the city next day.', 'Jews persuaded the crowd to stone Paul; he entered the city next day (Acts 14:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 14, what does the chapter say about Paul (Acts 14:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 1, 'According to Acts 14, what did they do (Acts 14:19)?', '["They appointed elders with prayer and fasting in each assembly.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They appointed elders with prayer and fasting in each assembly.', 'They appointed elders with prayer and fasting in each assembly (Acts 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 2, 'According to Acts 14, what does the chapter say about grace?', '["the Lord, who testified to the word of his grace", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the Lord, who testified to the word of his grace', 'the Lord, who testified to the word of his grace (Acts 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 14, what does the chapter say about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 2, 'According to Acts 14, what happened (Acts 14:9)?', '["Stand upright on your feet!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Stand upright on your feet!', 'Stand upright on your feet! (Acts 14:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 14, what happened (Acts 14:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 2, 'According to Acts 14, what happened (Acts 14:10)?', '["We also are men of like passions with you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'We also are men of like passions with you', 'We also are men of like passions with you (Acts 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 14, what happened (Acts 14:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 2, 'According to Acts 14, what does the chapter say about God''s Kingdom?', '["through many afflictions we must enter into God’s Kingdom", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'through many afflictions we must enter into God’s Kingdom', 'through many afflictions we must enter into God’s Kingdom (Acts 14:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 14, what does the chapter say about God''s Kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 2, 'According to Acts 14, what happened (Acts 14:19)?', '["he had opened a door of faith to the nations", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he had opened a door of faith to the nations', 'he had opened a door of faith to the nations (Acts 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 14, what happened (Acts 14:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 3, 'What does Acts 14 teach about Paul (Acts 14:3)?', '["Paul healed a lifelong cripple who had faith to be healed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul healed a lifelong cripple who had faith to be healed.', 'Paul healed a lifelong cripple who had faith to be healed (Acts 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 14 teach about Paul (Acts 14:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 3, 'According to Acts 14, what did they do (Acts 14:9)?', '["They urged Lycaonians to turn from vain things to the living God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They urged Lycaonians to turn from vain things to the living God.', 'They urged Lycaonians to turn from vain things to the living God (Acts 14:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 3, 'What does Acts 14 teach about Paul (Acts 14:10)?', '["Jews persuaded the crowd to stone Paul; he entered the city next day.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews persuaded the crowd to stone Paul; he entered the city next day.', 'Jews persuaded the crowd to stone Paul; he entered the city next day (Acts 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 14 teach about Paul (Acts 14:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 3, 'According to Acts 14, what did they do (Acts 14:15)?', '["They appointed elders with prayer and fasting in each assembly.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They appointed elders with prayer and fasting in each assembly.', 'They appointed elders with prayer and fasting in each assembly (Acts 14:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 3, 'According to Acts 14, what did they do (Acts 14:19)?', '["They reported God had opened a door of faith to the nations.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They reported God had opened a door of faith to the nations.', 'They reported God had opened a door of faith to the nations (Acts 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 4, 'Which phrase belongs in Acts 14 (Acts 14:3)?', '["Stand upright on your feet!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Stand upright on your feet!', 'Stand upright on your feet! (Acts 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 14 (Acts 14:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 4, 'Which phrase belongs in Acts 14 (Acts 14:9)?', '["We also are men of like passions with you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'We also are men of like passions with you', 'We also are men of like passions with you (Acts 14:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 14 (Acts 14:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 4, 'Which phrase in Acts 14 speaks about God''s Kingdom?', '["through many afflictions we must enter into God’s Kingdom", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'through many afflictions we must enter into God’s Kingdom', 'through many afflictions we must enter into God’s Kingdom (Acts 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 14 speaks about God''s Kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 4, 'According to Acts 14, what happened?', '["he had opened a door of faith to the nations", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he had opened a door of faith to the nations', 'he had opened a door of faith to the nations (Acts 14:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 14, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 4, 'Which phrase in Acts 14 speaks about grace?', '["the Lord, who testified to the word of his grace", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the Lord, who testified to the word of his grace', 'the Lord, who testified to the word of his grace (Acts 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 14 speaks about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 5, 'According to Acts 14, what did they do (Acts 14:3)?', '["They urged Lycaonians to turn from vain things to the living God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They urged Lycaonians to turn from vain things to the living God.', 'They urged Lycaonians to turn from vain things to the living God (Acts 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 5, 'What major point does Acts 14 make about Paul?', '["Jews persuaded the crowd to stone Paul; he entered the city next day.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews persuaded the crowd to stone Paul; he entered the city next day.', 'Jews persuaded the crowd to stone Paul; he entered the city next day (Acts 14:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 14 make about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 5, 'According to Acts 14, what did they do (Acts 14:10)?', '["They appointed elders with prayer and fasting in each assembly.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They appointed elders with prayer and fasting in each assembly.', 'They appointed elders with prayer and fasting in each assembly (Acts 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 5, 'According to Acts 14, what did they do (Acts 14:15)?', '["They reported God had opened a door of faith to the nations.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They reported God had opened a door of faith to the nations.', 'They reported God had opened a door of faith to the nations (Acts 14:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 14, what did they do (Acts 14:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 14, 5, 'What major point is made in Acts 14?', '["The Lord testified to his word with signs in Iconium.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord testified to his word with signs in Iconium.', 'The Lord testified to his word with signs in Iconium (Acts 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 1, 'According to Acts 15, what does the chapter say about the Gentiles?', '["Some said Gentiles must be circumcised after Moses to be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Some said Gentiles must be circumcised after Moses to be saved.', 'Some said Gentiles must be circumcised after Moses to be saved (Acts 15:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 15, what does the chapter say about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 1, 'According to Acts 15, what does the chapter say about the Holy Spirit (Acts 15:8)?', '["Peter said God gave Gentiles the Holy Spirit as to Jewish believers.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God gave Gentiles the Holy Spirit as to Jewish believers.', 'Peter said God gave Gentiles the Holy Spirit as to Jewish believers (Acts 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 15, what does the chapter say about the Holy Spirit (Acts 15:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 1, 'According to Acts 15, what happened?', '["James judged not to trouble Gentile converts beyond four abstentions.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'James judged not to trouble Gentile converts beyond four abstentions.', 'James judged not to trouble Gentile converts beyond four abstentions (Acts 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 15, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 1, 'According to Acts 15, what does the chapter say about the law?', '["The letter said they gave no command to circumcise and keep the whole law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The letter said they gave no command to circumcise and keep the whole law.', 'The letter said they gave no command to circumcise and keep the whole law (Acts 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 15, what does the chapter say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 1, 'According to Acts 15, what does the chapter say about the Holy Spirit (Acts 15:19)?', '["It seemed good to the Holy Spirit and to the apostles and elders.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'It seemed good to the Holy Spirit and to the apostles and elders.', 'It seemed good to the Holy Spirit and to the apostles and elders (Acts 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 15, what does the chapter say about the Holy Spirit (Acts 15:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 2, 'According to Acts 15, what does the chapter say about faith?', '["cleansing their hearts by faith", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'cleansing their hearts by faith', 'cleansing their hearts by faith (Acts 15:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 15, what does the chapter say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 2, 'According to Acts 15, what does the chapter say about Jesus?', '["we are saved through the grace of the Lord Jesus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'we are saved through the grace of the Lord Jesus', 'we are saved through the grace of the Lord Jesus (Acts 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 15, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 2, 'According to Acts 15, what does the chapter say about the Holy Spirit?', '["It seemed good to the Holy Spirit, and to us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'It seemed good to the Holy Spirit, and to us', 'It seemed good to the Holy Spirit, and to us (Acts 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 15, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 2, 'According to Acts 15, what happened?', '["abstain from things sacrificed to idols, from blood", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'abstain from things sacrificed to idols, from blood', 'abstain from things sacrificed to idols, from blood (Acts 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 15, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 2, 'According to Acts 15, what does the chapter say about Barnabas?', '["Barnabas took Mark with him and sailed away to Cyprus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Barnabas took Mark with him and sailed away to Cyprus', 'Barnabas took Mark with him and sailed away to Cyprus (Acts 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 15, what does the chapter say about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 3, 'What does Acts 15 teach about the Holy Spirit (Acts 15:7)?', '["Peter said God gave Gentiles the Holy Spirit as to Jewish believers.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Peter said God gave Gentiles the Holy Spirit as to Jewish believers.', 'Peter said God gave Gentiles the Holy Spirit as to Jewish believers (Acts 15:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 15 teach about the Holy Spirit (Acts 15:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 3, 'What does Acts 15 teach?', '["James judged not to trouble Gentile converts beyond four abstentions.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'James judged not to trouble Gentile converts beyond four abstentions.', 'James judged not to trouble Gentile converts beyond four abstentions (Acts 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 15 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 3, 'What does Acts 15 teach about the law?', '["The letter said they gave no command to circumcise and keep the whole law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The letter said they gave no command to circumcise and keep the whole law.', 'The letter said they gave no command to circumcise and keep the whole law (Acts 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 15 teach about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 3, 'What does Acts 15 teach about the Holy Spirit (Acts 15:11)?', '["It seemed good to the Holy Spirit and to the apostles and elders.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'It seemed good to the Holy Spirit and to the apostles and elders.', 'It seemed good to the Holy Spirit and to the apostles and elders (Acts 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 15 teach about the Holy Spirit (Acts 15:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 3, 'What does Acts 15 teach about Paul?', '["Paul and Barnabas separated over taking Mark; Paul went with Silas.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul and Barnabas separated over taking Mark; Paul went with Silas.', 'Paul and Barnabas separated over taking Mark; Paul went with Silas (Acts 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 15 teach about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 4, 'Which phrase in Acts 15 speaks about Jesus?', '["we are saved through the grace of the Lord Jesus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'we are saved through the grace of the Lord Jesus', 'we are saved through the grace of the Lord Jesus (Acts 15:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 15 speaks about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 4, 'Which phrase in Acts 15 speaks about the Holy Spirit?', '["It seemed good to the Holy Spirit, and to us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'It seemed good to the Holy Spirit, and to us', 'It seemed good to the Holy Spirit, and to us (Acts 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 15 speaks about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 4, 'Which phrase belongs in Acts 15?', '["abstain from things sacrificed to idols, from blood", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'abstain from things sacrificed to idols, from blood', 'abstain from things sacrificed to idols, from blood (Acts 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 4, 'Which phrase in Acts 15 speaks about Barnabas?', '["Barnabas took Mark with him and sailed away to Cyprus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Barnabas took Mark with him and sailed away to Cyprus', 'Barnabas took Mark with him and sailed away to Cyprus (Acts 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 15 speaks about Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 4, 'Which phrase in Acts 15 speaks about faith?', '["cleansing their hearts by faith", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'cleansing their hearts by faith', 'cleansing their hearts by faith (Acts 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 15 speaks about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 5, 'What major point is made in Acts 15?', '["James judged not to trouble Gentile converts beyond four abstentions.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'James judged not to trouble Gentile converts beyond four abstentions.', 'James judged not to trouble Gentile converts beyond four abstentions (Acts 15:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 5, 'What major point does Acts 15 make about the law?', '["The letter said they gave no command to circumcise and keep the whole law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The letter said they gave no command to circumcise and keep the whole law.', 'The letter said they gave no command to circumcise and keep the whole law (Acts 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 15 make about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 5, 'What major point does Acts 15 make about the Holy Spirit?', '["It seemed good to the Holy Spirit and to the apostles and elders.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'It seemed good to the Holy Spirit and to the apostles and elders.', 'It seemed good to the Holy Spirit and to the apostles and elders (Acts 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 15 make about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 5, 'What major point does Acts 15 make about Paul?', '["Paul and Barnabas separated over taking Mark; Paul went with Silas.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul and Barnabas separated over taking Mark; Paul went with Silas.', 'Paul and Barnabas separated over taking Mark; Paul went with Silas (Acts 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 15 make about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 15, 5, 'What major point does Acts 15 make about the Gentiles?', '["Some said Gentiles must be circumcised after Moses to be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Some said Gentiles must be circumcised after Moses to be saved.', 'Some said Gentiles must be circumcised after Moses to be saved (Acts 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 15 make about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 1, 'According to Acts 16, what does the chapter say about Paul (Acts 16:3)?', '["Paul circumcised Timothy because Jews knew his father was Greek.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul circumcised Timothy because Jews knew his father was Greek.', 'Paul circumcised Timothy because Jews knew his father was Greek (Acts 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 16, what does the chapter say about Paul (Acts 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 1, 'According to Acts 16, what did they do?', '["They delivered the apostles’ and elders’ decrees to strengthen churches.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They delivered the apostles’ and elders’ decrees to strengthen churches.', 'They delivered the apostles’ and elders’ decrees to strengthen churches (Acts 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 16, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 1, 'According to Acts 16, what does the chapter say about Paul (Acts 16:9)?', '["Paul saw a man of Macedonia begging help in a vision.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul saw a man of Macedonia begging help in a vision.', 'Paul saw a man of Macedonia begging help in a vision (Acts 16:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 16, what does the chapter say about Paul (Acts 16:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 1, 'According to Acts 16, what does the chapter say about Paul (Acts 16:10)?', '["The Lord opened Lydia’s heart to Paul’s words.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord opened Lydia’s heart to Paul’s words.', 'The Lord opened Lydia’s heart to Paul’s words (Acts 16:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 16, what does the chapter say about Paul (Acts 16:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 1, 'According to Acts 16, what does the chapter say about the Holy Spirit?', '["Paul commanded an unclean spirit out in Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul commanded an unclean spirit out in Jesus’s name.', 'Paul commanded an unclean spirit out in Jesus’s name (Acts 16:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 16, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 2, 'According to Acts 16, what happened (Acts 16:3)?', '["Come over into Macedonia and help us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Come over into Macedonia and help us', 'Come over into Macedonia and help us (Acts 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 16, what happened (Acts 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 2, 'According to Acts 16, what happened (Acts 16:4)?', '["The Lord opened her heart", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The Lord opened her heart', 'The Lord opened her heart (Acts 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 16, what happened (Acts 16:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 2, 'According to Acts 16, what does the chapter say about Jesus (Acts 16:9)?', '["I command you in the name of Jesus Christ to come out of her!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I command you in the name of Jesus Christ to come out of her!', 'I command you in the name of Jesus Christ to come out of her! (Acts 16:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 16, what does the chapter say about Jesus (Acts 16:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 2, 'According to Acts 16, what does the chapter say about Jesus (Acts 16:10)?', '["Believe in the Lord Jesus Christ, and you will be saved", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Believe in the Lord Jesus Christ, and you will be saved', 'Believe in the Lord Jesus Christ, and you will be saved (Acts 16:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 16, what does the chapter say about Jesus (Acts 16:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 2, 'According to Acts 16, what did they do?', '["They have beaten us publicly without a trial, men who are Romans", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'They have beaten us publicly without a trial, men who are Romans', 'They have beaten us publicly without a trial, men who are Romans (Acts 16:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 16, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 3, 'According to Acts 16, what did they do?', '["They delivered the apostles’ and elders’ decrees to strengthen churches.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'They delivered the apostles’ and elders’ decrees to strengthen churches.', 'They delivered the apostles’ and elders’ decrees to strengthen churches (Acts 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 16, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 3, 'What does Acts 16 teach about Paul (Acts 16:4)?', '["Paul saw a man of Macedonia begging help in a vision.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul saw a man of Macedonia begging help in a vision.', 'Paul saw a man of Macedonia begging help in a vision (Acts 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 16 teach about Paul (Acts 16:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 3, 'What does Acts 16 teach about Paul (Acts 16:9)?', '["The Lord opened Lydia’s heart to Paul’s words.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord opened Lydia’s heart to Paul’s words.', 'The Lord opened Lydia’s heart to Paul’s words (Acts 16:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 16 teach about Paul (Acts 16:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 3, 'What does Acts 16 teach about the Holy Spirit?', '["Paul commanded an unclean spirit out in Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul commanded an unclean spirit out in Jesus’s name.', 'Paul commanded an unclean spirit out in Jesus’s name (Acts 16:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 16 teach about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 3, 'What does Acts 16 teach about baptism?', '["The jailer and household were baptized after believing.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The jailer and household were baptized after believing.', 'The jailer and household were baptized after believing (Acts 16:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 16 teach about baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 4, 'Which phrase belongs in Acts 16 (Acts 16:3)?', '["The Lord opened her heart", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The Lord opened her heart', 'The Lord opened her heart (Acts 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 16 (Acts 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 4, 'Which phrase in Acts 16 speaks about Jesus (Acts 16:4)?', '["I command you in the name of Jesus Christ to come out of her!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I command you in the name of Jesus Christ to come out of her!', 'I command you in the name of Jesus Christ to come out of her! (Acts 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 16 speaks about Jesus (Acts 16:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 4, 'Which phrase in Acts 16 speaks about Jesus (Acts 16:9)?', '["Believe in the Lord Jesus Christ, and you will be saved", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Believe in the Lord Jesus Christ, and you will be saved', 'Believe in the Lord Jesus Christ, and you will be saved (Acts 16:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 16 speaks about Jesus (Acts 16:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 4, 'According to Acts 16, what did they do?', '["They have beaten us publicly without a trial, men who are Romans", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'They have beaten us publicly without a trial, men who are Romans', 'They have beaten us publicly without a trial, men who are Romans (Acts 16:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 16, what did they do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 4, 'Which phrase belongs in Acts 16 (Acts 16:14)?', '["Come over into Macedonia and help us", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Come over into Macedonia and help us', 'Come over into Macedonia and help us (Acts 16:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 16 (Acts 16:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 5, 'What major point does Acts 16 make about Paul (Acts 16:3)?', '["Paul saw a man of Macedonia begging help in a vision.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul saw a man of Macedonia begging help in a vision.', 'Paul saw a man of Macedonia begging help in a vision (Acts 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 16 make about Paul (Acts 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 5, 'What major point does Acts 16 make about Paul (Acts 16:4)?', '["The Lord opened Lydia’s heart to Paul’s words.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord opened Lydia’s heart to Paul’s words.', 'The Lord opened Lydia’s heart to Paul’s words (Acts 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 16 make about Paul (Acts 16:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 5, 'What major point does Acts 16 make about the Holy Spirit?', '["Paul commanded an unclean spirit out in Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul commanded an unclean spirit out in Jesus’s name.', 'Paul commanded an unclean spirit out in Jesus’s name (Acts 16:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 16 make about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 5, 'What major point does Acts 16 make about baptism?', '["The jailer and household were baptized after believing.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The jailer and household were baptized after believing.', 'The jailer and household were baptized after believing (Acts 16:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 16 make about baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 16, 5, 'What major point does Acts 16 make about Paul (Acts 16:14)?', '["Magistrates begged Paul and Silas when they learned they were Romans.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Magistrates begged Paul and Silas when they learned they were Romans.', 'Magistrates begged Paul and Silas when they learned they were Romans (Acts 16:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 16 make about Paul (Acts 16:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 1, 'According to Acts 17, what does the chapter say about Paul (Acts 17:3)?', '["Paul showed from Scripture that Christ must suffer and rise.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul showed from Scripture that Christ must suffer and rise.', 'Paul showed from Scripture that Christ must suffer and rise (Acts 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 17, what does the chapter say about Paul (Acts 17:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 1, 'According to Acts 17, what does the chapter say about Jesus?', '["Accusers charged Jason with welcoming those who say another king, Jesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Accusers charged Jason with welcoming those who say another king, Jesus.', 'Accusers charged Jason with welcoming those who say another king, Jesus (Acts 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 17, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 1, 'According to Acts 17, what happened (Acts 17:7)?', '["Beroeans examined the Scriptures daily.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Beroeans examined the Scriptures daily.', 'Beroeans examined the Scriptures daily (Acts 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 1, 'According to Acts 17, what does the chapter say about Paul (Acts 17:11)?', '["Paul cited the altar TO AN UNKNOWN GOD.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul cited the altar TO AN UNKNOWN GOD.', 'Paul cited the altar TO AN UNKNOWN GOD (Acts 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 17, what does the chapter say about Paul (Acts 17:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 1, 'According to Acts 17, what happened (Acts 17:23)?', '["He said God commands all people everywhere to repent.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said God commands all people everywhere to repent.', 'He said God commands all people everywhere to repent (Acts 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 2, 'According to Acts 17, what does the chapter say about Jesus?', '["This Jesus, whom I proclaim to you, is the Christ", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'This Jesus, whom I proclaim to you, is the Christ', 'This Jesus, whom I proclaim to you, is the Christ (Acts 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 17, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 2, 'According to Acts 17, what happened (Acts 17:6)?', '["examining the Scriptures daily to see whether these things were so", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'examining the Scriptures daily to see whether these things were so', 'examining the Scriptures daily to see whether these things were so (Acts 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 2, 'According to Acts 17, what happened (Acts 17:7)?', '["TO AN UNKNOWN GOD", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'TO AN UNKNOWN GOD', 'TO AN UNKNOWN GOD (Acts 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 2, 'According to Acts 17, what happened (Acts 17:11)?', '["he has appointed a day in which he will judge the world", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he has appointed a day in which he will judge the world', 'he has appointed a day in which he will judge the world (Acts 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 2, 'According to Acts 17, what does the chapter say about the resurrection?', '["raised him from the dead", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'raised him from the dead', 'raised him from the dead (Acts 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 17, what does the chapter say about the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 3, 'What does Acts 17 teach about Jesus?', '["Accusers charged Jason with welcoming those who say another king, Jesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Accusers charged Jason with welcoming those who say another king, Jesus.', 'Accusers charged Jason with welcoming those who say another king, Jesus (Acts 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 17 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 3, 'What does Acts 17 teach?', '["Beroeans examined the Scriptures daily.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Beroeans examined the Scriptures daily.', 'Beroeans examined the Scriptures daily (Acts 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 17 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 3, 'What does Acts 17 teach about Paul?', '["Paul cited the altar TO AN UNKNOWN GOD.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul cited the altar TO AN UNKNOWN GOD.', 'Paul cited the altar TO AN UNKNOWN GOD (Acts 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 17 teach about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 3, 'According to Acts 17, what happened (Acts 17:11)?', '["He said God commands all people everywhere to repent.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said God commands all people everywhere to repent.', 'He said God commands all people everywhere to repent (Acts 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 3, 'According to Acts 17, what happened (Acts 17:23)?', '["He set a day of judgment by the man God raised from the dead.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He set a day of judgment by the man God raised from the dead.', 'He set a day of judgment by the man God raised from the dead (Acts 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 4, 'Which phrase belongs in Acts 17 (Acts 17:3)?', '["examining the Scriptures daily to see whether these things were so", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'examining the Scriptures daily to see whether these things were so', 'examining the Scriptures daily to see whether these things were so (Acts 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 17 (Acts 17:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 4, 'Which phrase belongs in Acts 17 (Acts 17:6)?', '["TO AN UNKNOWN GOD", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'TO AN UNKNOWN GOD', 'TO AN UNKNOWN GOD (Acts 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 17 (Acts 17:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 4, 'According to Acts 17, what happened?', '["he has appointed a day in which he will judge the world", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he has appointed a day in which he will judge the world', 'he has appointed a day in which he will judge the world (Acts 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 17, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 4, 'Which phrase in Acts 17 speaks about the resurrection?', '["raised him from the dead", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'raised him from the dead', 'raised him from the dead (Acts 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 17 speaks about the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 4, 'Which phrase in Acts 17 speaks about Jesus?', '["This Jesus, whom I proclaim to you, is the Christ", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'This Jesus, whom I proclaim to you, is the Christ', 'This Jesus, whom I proclaim to you, is the Christ (Acts 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 17 speaks about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 5, 'What major point is made in Acts 17?', '["Beroeans examined the Scriptures daily.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Beroeans examined the Scriptures daily.', 'Beroeans examined the Scriptures daily (Acts 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 5, 'What major point does Acts 17 make about Paul (Acts 17:6)?', '["Paul cited the altar TO AN UNKNOWN GOD.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul cited the altar TO AN UNKNOWN GOD.', 'Paul cited the altar TO AN UNKNOWN GOD (Acts 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 17 make about Paul (Acts 17:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 5, 'According to Acts 17, what happened (Acts 17:7)?', '["He said God commands all people everywhere to repent.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said God commands all people everywhere to repent.', 'He said God commands all people everywhere to repent (Acts 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 5, 'According to Acts 17, what happened (Acts 17:11)?', '["He set a day of judgment by the man God raised from the dead.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He set a day of judgment by the man God raised from the dead.', 'He set a day of judgment by the man God raised from the dead (Acts 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 17, what happened (Acts 17:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 17, 5, 'What major point does Acts 17 make about Paul (Acts 17:23)?', '["Paul showed from Scripture that Christ must suffer and rise.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul showed from Scripture that Christ must suffer and rise.', 'Paul showed from Scripture that Christ must suffer and rise (Acts 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 17 make about Paul (Acts 17:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 1, 'According to Acts 18, what does the chapter say about Paul (Acts 18:4)?', '["Paul reasoned in Corinth’s synagogue every Sabbath.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul reasoned in Corinth’s synagogue every Sabbath.', 'Paul reasoned in Corinth’s synagogue every Sabbath (Acts 18:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 18, what does the chapter say about Paul (Acts 18:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 1, 'According to Acts 18, what does the chapter say about Paul (Acts 18:6)?', '["The Lord told Paul not to fear; he had many people in the city.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord told Paul not to fear; he had many people in the city.', 'The Lord told Paul not to fear; he had many people in the city (Acts 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 18, what does the chapter say about Paul (Acts 18:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 1, 'According to Acts 18, what does the chapter say about the law?', '["Gallio refused to judge questions of Jewish law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gallio refused to judge questions of Jewish law.', 'Gallio refused to judge questions of Jewish law (Acts 18:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 18, what does the chapter say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 1, 'According to Acts 18, what does the chapter say about Paul (Acts 18:9)?', '["Paul left Priscilla and Aquila at Ephesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul left Priscilla and Aquila at Ephesus.', 'Paul left Priscilla and Aquila at Ephesus (Acts 18:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 18, what does the chapter say about Paul (Acts 18:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 1, 'According to Acts 18, what happened?', '["Apollos knew only John’s baptism until Priscilla and Aquila taught him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Apollos knew only John’s baptism until Priscilla and Aquila taught him.', 'Apollos knew only John’s baptism until Priscilla and Aquila taught him (Acts 18:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 18, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 2, 'According to Acts 18, what happened (Acts 18:4)?', '["I am with you, and no one will attack you to harm you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am with you, and no one will attack you to harm you', 'I am with you, and no one will attack you to harm you (Acts 18:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 18, what happened (Acts 18:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 2, 'According to Acts 18, what does the chapter say about the Gentiles?', '["From now on, I will go to the Gentiles!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'From now on, I will go to the Gentiles!', 'From now on, I will go to the Gentiles! (Acts 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 18, what does the chapter say about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 2, 'According to Acts 18, what happened (Acts 18:8)?', '["I don’t want to be a judge of these matters", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I don’t want to be a judge of these matters', 'I don’t want to be a judge of these matters (Acts 18:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 18, what happened (Acts 18:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 2, 'According to Acts 18, what happened (Acts 18:9)?', '["explained to him the way of God more accurately", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'explained to him the way of God more accurately', 'explained to him the way of God more accurately (Acts 18:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 18, what happened (Acts 18:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 2, 'According to Acts 18, what does the chapter say about Jesus?', '["publicly showing by the Scriptures that Jesus was the Christ", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'publicly showing by the Scriptures that Jesus was the Christ', 'publicly showing by the Scriptures that Jesus was the Christ (Acts 18:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 18, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 3, 'What does Acts 18 teach about Paul (Acts 18:4)?', '["The Lord told Paul not to fear; he had many people in the city.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord told Paul not to fear; he had many people in the city.', 'The Lord told Paul not to fear; he had many people in the city (Acts 18:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 18 teach about Paul (Acts 18:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 3, 'What does Acts 18 teach about the law?', '["Gallio refused to judge questions of Jewish law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gallio refused to judge questions of Jewish law.', 'Gallio refused to judge questions of Jewish law (Acts 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 18 teach about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 3, 'What does Acts 18 teach about Paul (Acts 18:8)?', '["Paul left Priscilla and Aquila at Ephesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul left Priscilla and Aquila at Ephesus.', 'Paul left Priscilla and Aquila at Ephesus (Acts 18:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 18 teach about Paul (Acts 18:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 3, 'What does Acts 18 teach?', '["Apollos knew only John’s baptism until Priscilla and Aquila taught him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Apollos knew only John’s baptism until Priscilla and Aquila taught him.', 'Apollos knew only John’s baptism until Priscilla and Aquila taught him (Acts 18:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 18 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 3, 'What does Acts 18 teach about Jesus?', '["Apollos publicly showed from Scripture that Jesus was the Christ.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Apollos publicly showed from Scripture that Jesus was the Christ.', 'Apollos publicly showed from Scripture that Jesus was the Christ (Acts 18:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 18 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 4, 'Which phrase in Acts 18 speaks about the Gentiles?', '["From now on, I will go to the Gentiles!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'From now on, I will go to the Gentiles!', 'From now on, I will go to the Gentiles! (Acts 18:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 18 speaks about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 4, 'Which phrase belongs in Acts 18 (Acts 18:6)?', '["I don’t want to be a judge of these matters", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I don’t want to be a judge of these matters', 'I don’t want to be a judge of these matters (Acts 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 18 (Acts 18:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 4, 'Which phrase belongs in Acts 18 (Acts 18:8)?', '["explained to him the way of God more accurately", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'explained to him the way of God more accurately', 'explained to him the way of God more accurately (Acts 18:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 18 (Acts 18:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 4, 'Which phrase in Acts 18 speaks about Jesus?', '["publicly showing by the Scriptures that Jesus was the Christ", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'publicly showing by the Scriptures that Jesus was the Christ', 'publicly showing by the Scriptures that Jesus was the Christ (Acts 18:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 18 speaks about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 4, 'Which phrase belongs in Acts 18 (Acts 18:10)?', '["I am with you, and no one will attack you to harm you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am with you, and no one will attack you to harm you', 'I am with you, and no one will attack you to harm you (Acts 18:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 18 (Acts 18:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 5, 'What major point does Acts 18 make about the law?', '["Gallio refused to judge questions of Jewish law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Gallio refused to judge questions of Jewish law.', 'Gallio refused to judge questions of Jewish law (Acts 18:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 18 make about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 5, 'What major point does Acts 18 make about Paul (Acts 18:6)?', '["Paul left Priscilla and Aquila at Ephesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul left Priscilla and Aquila at Ephesus.', 'Paul left Priscilla and Aquila at Ephesus (Acts 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 18 make about Paul (Acts 18:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 5, 'What major point is made in Acts 18?', '["Apollos knew only John’s baptism until Priscilla and Aquila taught him.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Apollos knew only John’s baptism until Priscilla and Aquila taught him.', 'Apollos knew only John’s baptism until Priscilla and Aquila taught him (Acts 18:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 5, 'What major point does Acts 18 make about Jesus?', '["Apollos publicly showed from Scripture that Jesus was the Christ.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Apollos publicly showed from Scripture that Jesus was the Christ.', 'Apollos publicly showed from Scripture that Jesus was the Christ (Acts 18:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 18 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 18, 5, 'What major point does Acts 18 make about Paul (Acts 18:10)?', '["Paul reasoned in Corinth’s synagogue every Sabbath.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul reasoned in Corinth’s synagogue every Sabbath.', 'Paul reasoned in Corinth’s synagogue every Sabbath (Acts 18:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 18 make about Paul (Acts 18:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 1, 'According to Acts 19, what does the chapter say about the Holy Spirit (Acts 19:2)?', '["Twelve men were re-baptized and received the Holy Spirit through Paul’s hands.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Twelve men were re-baptized and received the Holy Spirit through Paul’s hands.', 'Twelve men were re-baptized and received the Holy Spirit through Paul’s hands (Acts 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 19, what does the chapter say about the Holy Spirit (Acts 19:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 1, 'According to Acts 19, what does the chapter say about Paul (Acts 19:5)?', '["Paul taught daily two years; Asia heard the word.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul taught daily two years; Asia heard the word.', 'Paul taught daily two years; Asia heard the word (Acts 19:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 19, what does the chapter say about Paul (Acts 19:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 1, 'According to Acts 19, what does the chapter say about the Holy Spirit (Acts 19:6)?', '["Evil spirit knew Jesus and Paul but not the exorcists.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Evil spirit knew Jesus and Paul but not the exorcists.', 'Evil spirit knew Jesus and Paul but not the exorcists (Acts 19:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 19, what does the chapter say about the Holy Spirit (Acts 19:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 1, 'According to Acts 19, what happened?', '["Believers burned books worth fifty thousand pieces of silver.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Believers burned books worth fifty thousand pieces of silver.', 'Believers burned books worth fifty thousand pieces of silver (Acts 19:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 19, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 1, 'According to Acts 19, what does the chapter say about Paul (Acts 19:11)?', '["Paul said he must see Rome after Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he must see Rome after Jerusalem.', 'Paul said he must see Rome after Jerusalem (Acts 19:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 19, what does the chapter say about Paul (Acts 19:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 2, 'According to Acts 19, what does the chapter say about the Holy Spirit?', '["we haven’t even heard that there is a Holy Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'we haven’t even heard that there is a Holy Spirit', 'we haven’t even heard that there is a Holy Spirit (Acts 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 19, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 2, 'According to Acts 19, what happened (Acts 19:5)?', '["reasoning daily in the school of Tyrannus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'reasoning daily in the school of Tyrannus', 'reasoning daily in the school of Tyrannus (Acts 19:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 19, what happened (Acts 19:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 2, 'According to Acts 19, Jesus I know, and Paul I know, but who are you?', '["Jesus I know, and Paul I know, but who are you?", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Jesus I know, and Paul I know, but who are you?', 'Jesus I know, and Paul I know, but who are you? (Acts 19:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 19, Jesus I know, and Paul I know, but who are you?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 2, 'According to Acts 19, what happened (Acts 19:10)?', '["fifty thousand pieces of silver", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'fifty thousand pieces of silver', 'fifty thousand pieces of silver (Acts 19:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 19, what happened (Acts 19:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 2, 'According to Acts 19, what happened (Acts 19:11)?', '["Great is Artemis of the Ephesians!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Great is Artemis of the Ephesians!', 'Great is Artemis of the Ephesians! (Acts 19:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 19, what happened (Acts 19:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 3, 'What does Acts 19 teach about Paul (Acts 19:2)?', '["Paul taught daily two years; Asia heard the word.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul taught daily two years; Asia heard the word.', 'Paul taught daily two years; Asia heard the word (Acts 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 19 teach about Paul (Acts 19:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 3, 'What does Acts 19 teach about the Holy Spirit?', '["Evil spirit knew Jesus and Paul but not the exorcists.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Evil spirit knew Jesus and Paul but not the exorcists.', 'Evil spirit knew Jesus and Paul but not the exorcists (Acts 19:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 19 teach about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 3, 'What does Acts 19 teach?', '["Believers burned books worth fifty thousand pieces of silver.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Believers burned books worth fifty thousand pieces of silver.', 'Believers burned books worth fifty thousand pieces of silver (Acts 19:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 19 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 3, 'What does Acts 19 teach about Paul (Acts 19:10)?', '["Paul said he must see Rome after Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he must see Rome after Jerusalem.', 'Paul said he must see Rome after Jerusalem (Acts 19:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 19 teach about Paul (Acts 19:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 3, 'What does Acts 19 teach about Paul (Acts 19:11)?', '["Demetrius feared Paul’s teaching hurt the Artemis trade.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Demetrius feared Paul’s teaching hurt the Artemis trade.', 'Demetrius feared Paul’s teaching hurt the Artemis trade (Acts 19:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 19 teach about Paul (Acts 19:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 4, 'Which phrase belongs in Acts 19 (Acts 19:2)?', '["reasoning daily in the school of Tyrannus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'reasoning daily in the school of Tyrannus', 'reasoning daily in the school of Tyrannus (Acts 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 19 (Acts 19:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 4, 'According to Acts 19, Jesus I know, and Paul I know, but who are you?', '["Jesus I know, and Paul I know, but who are you?", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Jesus I know, and Paul I know, but who are you?', 'Jesus I know, and Paul I know, but who are you? (Acts 19:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 19, Jesus I know, and Paul I know, but who are you?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 4, 'Which phrase belongs in Acts 19 (Acts 19:6)?', '["fifty thousand pieces of silver", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'fifty thousand pieces of silver', 'fifty thousand pieces of silver (Acts 19:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 19 (Acts 19:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 4, 'Which phrase belongs in Acts 19 (Acts 19:10)?', '["Great is Artemis of the Ephesians!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Great is Artemis of the Ephesians!', 'Great is Artemis of the Ephesians! (Acts 19:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 19 (Acts 19:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 4, 'Which phrase in Acts 19 speaks about the Holy Spirit?', '["we haven’t even heard that there is a Holy Spirit", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'we haven’t even heard that there is a Holy Spirit', 'we haven’t even heard that there is a Holy Spirit (Acts 19:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 19 speaks about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 5, 'What major point does Acts 19 make about the Holy Spirit?', '["Evil spirit knew Jesus and Paul but not the exorcists.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Evil spirit knew Jesus and Paul but not the exorcists.', 'Evil spirit knew Jesus and Paul but not the exorcists (Acts 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 19 make about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 5, 'What major point is made in Acts 19 (Acts 19:5)?', '["Believers burned books worth fifty thousand pieces of silver.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Believers burned books worth fifty thousand pieces of silver.', 'Believers burned books worth fifty thousand pieces of silver (Acts 19:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 19 (Acts 19:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 5, 'What major point does Acts 19 make about Paul (Acts 19:6)?', '["Paul said he must see Rome after Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he must see Rome after Jerusalem.', 'Paul said he must see Rome after Jerusalem (Acts 19:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 19 make about Paul (Acts 19:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 5, 'What major point does Acts 19 make about Paul (Acts 19:10)?', '["Demetrius feared Paul’s teaching hurt the Artemis trade.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Demetrius feared Paul’s teaching hurt the Artemis trade.', 'Demetrius feared Paul’s teaching hurt the Artemis trade (Acts 19:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 19 make about Paul (Acts 19:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 19, 5, 'What major point is made in Acts 19 (Acts 19:11)?', '["The town clerk warned against riot without cause.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The town clerk warned against riot without cause.', 'The town clerk warned against riot without cause (Acts 19:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 19 (Acts 19:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 1, 'According to Acts 20, what does the chapter say about Paul?', '["Paul raised Eutychus after he fell dead from the window.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul raised Eutychus after he fell dead from the window.', 'Paul raised Eutychus after he fell dead from the window (Acts 20:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 20, what does the chapter say about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 1, 'According to Acts 20, what happened (Acts 20:9)?', '["He said he declared the whole counsel of God publicly and house to house.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said he declared the whole counsel of God publicly and house to house.', 'He said he declared the whole counsel of God publicly and house to house (Acts 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 1, 'According to Acts 20, what happened (Acts 20:10)?', '["He testified to repentance toward God and faith toward Jesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He testified to repentance toward God and faith toward Jesus.', 'He testified to repentance toward God and faith toward Jesus (Acts 20:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 1, 'According to Acts 20, what happened (Acts 20:12)?', '["He warned overseers to shepherd the church God purchased with his own blood.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He warned overseers to shepherd the church God purchased with his own blood.', 'He warned overseers to shepherd the church God purchased with his own blood (Acts 20:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 1, 'According to Acts 20, what happened (Acts 20:21)?', '["He foretold grievous wolves and men speaking perverse things.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He foretold grievous wolves and men speaking perverse things.', 'He foretold grievous wolves and men speaking perverse things (Acts 20:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 2, 'According to Acts 20, what happened (Acts 20:7)?', '["his life is in him", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'his life is in him', 'his life is in him (Acts 20:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 2, 'According to Acts 20, what happened (Acts 20:9)?', '["I didn’t shrink from declaring to you the whole counsel of God", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I didn’t shrink from declaring to you the whole counsel of God', 'I didn’t shrink from declaring to you the whole counsel of God (Acts 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 2, 'According to Acts 20, what does the chapter say about the church?', '["to shepherd the assembly of the Lord and God which he purchased with his own blood", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'to shepherd the assembly of the Lord and God which he purchased with his own blood', 'to shepherd the assembly of the Lord and God which he purchased with his own blood (Acts 20:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 20, what does the chapter say about the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 2, 'According to Acts 20, what happened (Acts 20:12)?', '["vicious wolves will enter in among you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'vicious wolves will enter in among you', 'vicious wolves will enter in among you (Acts 20:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 2, 'According to Acts 20, what happened (Acts 20:21)?', '["It is more blessed to give than to receive", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'It is more blessed to give than to receive', 'It is more blessed to give than to receive (Acts 20:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 3, 'According to Acts 20, what happened (Acts 20:7)?', '["He said he declared the whole counsel of God publicly and house to house.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said he declared the whole counsel of God publicly and house to house.', 'He said he declared the whole counsel of God publicly and house to house (Acts 20:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 3, 'According to Acts 20, what happened (Acts 20:9)?', '["He testified to repentance toward God and faith toward Jesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He testified to repentance toward God and faith toward Jesus.', 'He testified to repentance toward God and faith toward Jesus (Acts 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 3, 'According to Acts 20, what happened (Acts 20:10)?', '["He warned overseers to shepherd the church God purchased with his own blood.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He warned overseers to shepherd the church God purchased with his own blood.', 'He warned overseers to shepherd the church God purchased with his own blood (Acts 20:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 3, 'According to Acts 20, what happened (Acts 20:12)?', '["He foretold grievous wolves and men speaking perverse things.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He foretold grievous wolves and men speaking perverse things.', 'He foretold grievous wolves and men speaking perverse things (Acts 20:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 3, 'According to Acts 20, what happened (Acts 20:21)?', '["He quoted Jesus: it is more blessed to give than to receive.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He quoted Jesus: it is more blessed to give than to receive.', 'He quoted Jesus: it is more blessed to give than to receive (Acts 20:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 4, 'Which phrase belongs in Acts 20 (Acts 20:7)?', '["I didn’t shrink from declaring to you the whole counsel of God", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I didn’t shrink from declaring to you the whole counsel of God', 'I didn’t shrink from declaring to you the whole counsel of God (Acts 20:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 20 (Acts 20:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 4, 'Which phrase in Acts 20 speaks about the church?', '["to shepherd the assembly of the Lord and God which he purchased with his own blood", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'to shepherd the assembly of the Lord and God which he purchased with his own blood', 'to shepherd the assembly of the Lord and God which he purchased with his own blood (Acts 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 20 speaks about the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 4, 'Which phrase belongs in Acts 20 (Acts 20:10)?', '["vicious wolves will enter in among you", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'vicious wolves will enter in among you', 'vicious wolves will enter in among you (Acts 20:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 20 (Acts 20:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 4, 'Which phrase belongs in Acts 20 (Acts 20:12)?', '["It is more blessed to give than to receive", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'It is more blessed to give than to receive', 'It is more blessed to give than to receive (Acts 20:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 20 (Acts 20:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 4, 'Which phrase belongs in Acts 20 (Acts 20:21)?', '["his life is in him", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'his life is in him', 'his life is in him (Acts 20:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 20 (Acts 20:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 5, 'According to Acts 20, what happened (Acts 20:7)?', '["He testified to repentance toward God and faith toward Jesus.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He testified to repentance toward God and faith toward Jesus.', 'He testified to repentance toward God and faith toward Jesus (Acts 20:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 5, 'According to Acts 20, what happened (Acts 20:9)?', '["He warned overseers to shepherd the church God purchased with his own blood.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He warned overseers to shepherd the church God purchased with his own blood.', 'He warned overseers to shepherd the church God purchased with his own blood (Acts 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 5, 'According to Acts 20, what happened (Acts 20:10)?', '["He foretold grievous wolves and men speaking perverse things.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He foretold grievous wolves and men speaking perverse things.', 'He foretold grievous wolves and men speaking perverse things (Acts 20:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 5, 'According to Acts 20, what happened (Acts 20:12)?', '["He quoted Jesus: it is more blessed to give than to receive.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He quoted Jesus: it is more blessed to give than to receive.', 'He quoted Jesus: it is more blessed to give than to receive (Acts 20:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 20, what happened (Acts 20:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 20, 5, 'What major point does Acts 20 make about Paul?', '["Paul raised Eutychus after he fell dead from the window.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul raised Eutychus after he fell dead from the window.', 'Paul raised Eutychus after he fell dead from the window (Acts 20:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 20 make about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 1, 'According to Acts 21, what does the chapter say about the Holy Spirit?', '["Tyre disciples said through the Spirit not to go up to Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Tyre disciples said through the Spirit not to go up to Jerusalem.', 'Tyre disciples said through the Spirit not to go up to Jerusalem (Acts 21:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 21, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 1, 'According to Acts 21, what does the chapter say about Paul (Acts 21:11)?', '["Agabus bound Paul’s belt symbolizing binding at Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agabus bound Paul’s belt symbolizing binding at Jerusalem.', 'Agabus bound Paul’s belt symbolizing binding at Jerusalem (Acts 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 21, what does the chapter say about Paul (Acts 21:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 1, 'According to Acts 21, what does the chapter say about Jesus?', '["Paul said he was ready to die for the Lord Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he was ready to die for the Lord Jesus’s name.', 'Paul said he was ready to die for the Lord Jesus’s name (Acts 21:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 21, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 1, 'According to Acts 21, what does the chapter say about Paul (Acts 21:19)?', '["Elders asked Paul to join purification to show he kept the law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Elders asked Paul to join purification to show he kept the law.', 'Elders asked Paul to join purification to show he kept the law (Acts 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 21, what does the chapter say about Paul (Acts 21:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 1, 'According to Acts 21, what does the chapter say about the Jews?', '["Jews falsely accused him of bringing Trophimus into the temple.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews falsely accused him of bringing Trophimus into the temple.', 'Jews falsely accused him of bringing Trophimus into the temple (Acts 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 21, what does the chapter say about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 2, 'According to Acts 21, what does the chapter say about the Holy Spirit?', '["through the Spirit that he should not go up to Jerusalem", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'through the Spirit that he should not go up to Jerusalem', 'through the Spirit that he should not go up to Jerusalem (Acts 21:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 21, what does the chapter say about the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 2, 'According to Acts 21, what happened (Acts 21:11)?', '["I am ready not only to be bound, but also to die", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am ready not only to be bound, but also to die', 'I am ready not only to be bound, but also to die (Acts 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 21, what happened (Acts 21:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 2, 'According to Acts 21, what happened (Acts 21:13)?', '["The Lord’s will be done", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The Lord’s will be done', 'The Lord’s will be done (Acts 21:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 21, what happened (Acts 21:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 2, 'According to Acts 21, what happened (Acts 21:19)?', '["purify yourself with them", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'purify yourself with them', 'purify yourself with them (Acts 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 21, what happened (Acts 21:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 2, 'According to Acts 21, what happened (Acts 21:24)?', '["he also brought Greeks into the temple", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he also brought Greeks into the temple', 'he also brought Greeks into the temple (Acts 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 21, what happened (Acts 21:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 3, 'What does Acts 21 teach about Paul (Acts 21:4)?', '["Agabus bound Paul’s belt symbolizing binding at Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agabus bound Paul’s belt symbolizing binding at Jerusalem.', 'Agabus bound Paul’s belt symbolizing binding at Jerusalem (Acts 21:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 21 teach about Paul (Acts 21:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 3, 'What does Acts 21 teach about Jesus?', '["Paul said he was ready to die for the Lord Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he was ready to die for the Lord Jesus’s name.', 'Paul said he was ready to die for the Lord Jesus’s name (Acts 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 21 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 3, 'What does Acts 21 teach about Paul (Acts 21:13)?', '["Elders asked Paul to join purification to show he kept the law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Elders asked Paul to join purification to show he kept the law.', 'Elders asked Paul to join purification to show he kept the law (Acts 21:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 21 teach about Paul (Acts 21:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 3, 'What does Acts 21 teach about the Jews?', '["Jews falsely accused him of bringing Trophimus into the temple.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews falsely accused him of bringing Trophimus into the temple.', 'Jews falsely accused him of bringing Trophimus into the temple (Acts 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 21 teach about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 3, 'What does Acts 21 teach about Paul (Acts 21:24)?', '["The commander arrested Paul and bound him with chains.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The commander arrested Paul and bound him with chains.', 'The commander arrested Paul and bound him with chains (Acts 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 21 teach about Paul (Acts 21:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 4, 'Which phrase belongs in Acts 21 (Acts 21:4)?', '["I am ready not only to be bound, but also to die", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am ready not only to be bound, but also to die', 'I am ready not only to be bound, but also to die (Acts 21:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 21 (Acts 21:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 4, 'Which phrase belongs in Acts 21 (Acts 21:11)?', '["The Lord’s will be done", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'The Lord’s will be done', 'The Lord’s will be done (Acts 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 21 (Acts 21:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 4, 'Which phrase belongs in Acts 21 (Acts 21:13)?', '["purify yourself with them", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'purify yourself with them', 'purify yourself with them (Acts 21:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 21 (Acts 21:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 4, 'According to Acts 21, what happened?', '["he also brought Greeks into the temple", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he also brought Greeks into the temple', 'he also brought Greeks into the temple (Acts 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 21, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 4, 'Which phrase belongs in Acts 21 (Acts 21:24)?', '["I am a Jew, from Tarsus in Cilicia", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am a Jew, from Tarsus in Cilicia', 'I am a Jew, from Tarsus in Cilicia (Acts 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 21 (Acts 21:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 5, 'What major point does Acts 21 make about Jesus?', '["Paul said he was ready to die for the Lord Jesus’s name.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he was ready to die for the Lord Jesus’s name.', 'Paul said he was ready to die for the Lord Jesus’s name (Acts 21:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 21 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 5, 'What major point does Acts 21 make about Paul (Acts 21:11)?', '["Elders asked Paul to join purification to show he kept the law.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Elders asked Paul to join purification to show he kept the law.', 'Elders asked Paul to join purification to show he kept the law (Acts 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 21 make about Paul (Acts 21:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 5, 'What major point does Acts 21 make about the Jews?', '["Jews falsely accused him of bringing Trophimus into the temple.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews falsely accused him of bringing Trophimus into the temple.', 'Jews falsely accused him of bringing Trophimus into the temple (Acts 21:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 21 make about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 5, 'What major point does Acts 21 make about Paul (Acts 21:19)?', '["The commander arrested Paul and bound him with chains.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The commander arrested Paul and bound him with chains.', 'The commander arrested Paul and bound him with chains (Acts 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 21 make about Paul (Acts 21:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 21, 5, 'What major point does Acts 21 make about Paul (Acts 21:24)?', '["Paul asked to speak to the crowd in Hebrew.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul asked to speak to the crowd in Hebrew.', 'Paul asked to speak to the crowd in Hebrew (Acts 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 21 make about Paul (Acts 21:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 1, 'According to Acts 22, what does the chapter say about Paul?', '["Paul said he was educated under Gamaliel and persecuted the Way.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he was educated under Gamaliel and persecuted the Way.', 'Paul said he was educated under Gamaliel and persecuted the Way (Acts 22:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 22, what does the chapter say about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 1, 'According to Acts 22, what does the chapter say about Jesus?', '["Jesus identified himself on the Damascus road.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jesus identified himself on the Damascus road.', 'Jesus identified himself on the Damascus road (Acts 22:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 22, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 1, 'According to Acts 22, what does the chapter say about baptism?', '["Ananias told him to be baptized and wash away sins.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Ananias told him to be baptized and wash away sins.', 'Ananias told him to be baptized and wash away sins (Acts 22:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 22, what does the chapter say about baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 1, 'According to Acts 22, what does the chapter say about the Gentiles (Acts 22:21)?', '["The Lord sent him far to the Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord sent him far to the Gentiles.', 'The Lord sent him far to the Gentiles (Acts 22:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 22, what does the chapter say about the Gentiles (Acts 22:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 1, 'According to Acts 22, what does the chapter say about the Gentiles (Acts 22:22)?', '["The crowd raged when he mentioned Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The crowd raged when he mentioned Gentiles.', 'The crowd raged when he mentioned Gentiles (Acts 22:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 22, what does the chapter say about the Gentiles (Acts 22:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 2, 'According to Acts 22, what does the chapter say about Jesus?', '["I am Jesus of Nazareth, whom you persecute", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am Jesus of Nazareth, whom you persecute', 'I am Jesus of Nazareth, whom you persecute (Acts 22:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 22, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 2, 'According to Acts 22, what happened (Acts 22:8)?', '["Arise, and go into Damascus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Arise, and go into Damascus', 'Arise, and go into Damascus (Acts 22:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 22, what happened (Acts 22:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 2, 'According to Acts 22, what does the chapter say about sins?', '["wash away your sins, calling on the name of the Lord", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'wash away your sins, calling on the name of the Lord', 'wash away your sins, calling on the name of the Lord (Acts 22:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 22, what does the chapter say about sins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 2, 'According to Acts 22, what does the chapter say about the Gentiles?', '["I will send you out far from here to the Gentiles", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I will send you out far from here to the Gentiles', 'I will send you out far from here to the Gentiles (Acts 22:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 22, what does the chapter say about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 2, 'According to Acts 22, what happened (Acts 22:22)?', '["But I was born a Roman", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'But I was born a Roman', 'But I was born a Roman (Acts 22:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 22, what happened (Acts 22:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 3, 'What does Acts 22 teach about Jesus?', '["Jesus identified himself on the Damascus road.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jesus identified himself on the Damascus road.', 'Jesus identified himself on the Damascus road (Acts 22:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 22 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 3, 'What does Acts 22 teach about baptism?', '["Ananias told him to be baptized and wash away sins.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Ananias told him to be baptized and wash away sins.', 'Ananias told him to be baptized and wash away sins (Acts 22:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 22 teach about baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 3, 'What does Acts 22 teach about the Gentiles (Acts 22:16)?', '["The Lord sent him far to the Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord sent him far to the Gentiles.', 'The Lord sent him far to the Gentiles (Acts 22:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 22 teach about the Gentiles (Acts 22:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 3, 'What does Acts 22 teach about the Gentiles (Acts 22:21)?', '["The crowd raged when he mentioned Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The crowd raged when he mentioned Gentiles.', 'The crowd raged when he mentioned Gentiles (Acts 22:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 22 teach about the Gentiles (Acts 22:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 3, 'What does Acts 22 teach about Paul?', '["Paul’s Roman birth halted illegal scourging.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul’s Roman birth halted illegal scourging.', 'Paul’s Roman birth halted illegal scourging (Acts 22:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 22 teach about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 4, 'Which phrase belongs in Acts 22 (Acts 22:3)?', '["Arise, and go into Damascus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Arise, and go into Damascus', 'Arise, and go into Damascus (Acts 22:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 22 (Acts 22:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 4, 'Which phrase in Acts 22 speaks about sins?', '["wash away your sins, calling on the name of the Lord", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'wash away your sins, calling on the name of the Lord', 'wash away your sins, calling on the name of the Lord (Acts 22:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 22 speaks about sins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 4, 'Which phrase in Acts 22 speaks about the Gentiles?', '["I will send you out far from here to the Gentiles", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I will send you out far from here to the Gentiles', 'I will send you out far from here to the Gentiles (Acts 22:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 22 speaks about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 4, 'Which phrase belongs in Acts 22 (Acts 22:21)?', '["But I was born a Roman", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'But I was born a Roman', 'But I was born a Roman (Acts 22:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 22 (Acts 22:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 4, 'Which phrase in Acts 22 speaks about Jesus?', '["I am Jesus of Nazareth, whom you persecute", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am Jesus of Nazareth, whom you persecute', 'I am Jesus of Nazareth, whom you persecute (Acts 22:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 22 speaks about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 5, 'What major point does Acts 22 make about baptism?', '["Ananias told him to be baptized and wash away sins.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Ananias told him to be baptized and wash away sins.', 'Ananias told him to be baptized and wash away sins (Acts 22:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 22 make about baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 5, 'What major point does Acts 22 make about the Gentiles (Acts 22:8)?', '["The Lord sent him far to the Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord sent him far to the Gentiles.', 'The Lord sent him far to the Gentiles (Acts 22:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 22 make about the Gentiles (Acts 22:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 5, 'What major point does Acts 22 make about the Gentiles (Acts 22:16)?', '["The crowd raged when he mentioned Gentiles.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The crowd raged when he mentioned Gentiles.', 'The crowd raged when he mentioned Gentiles (Acts 22:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 22 make about the Gentiles (Acts 22:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 5, 'What major point does Acts 22 make about Paul (Acts 22:21)?', '["Paul’s Roman birth halted illegal scourging.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul’s Roman birth halted illegal scourging.', 'Paul’s Roman birth halted illegal scourging (Acts 22:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 22 make about Paul (Acts 22:21)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 22, 5, 'What major point does Acts 22 make about Paul (Acts 22:22)?', '["Paul said he was educated under Gamaliel and persecuted the Way.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he was educated under Gamaliel and persecuted the Way.', 'Paul said he was educated under Gamaliel and persecuted the Way (Acts 22:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 22 make about Paul (Acts 22:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 1, 'According to Acts 23, what does the chapter say about Paul (Acts 23:1)?', '["Paul said he lived in good conscience before God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he lived in good conscience before God.', 'Paul said he lived in good conscience before God (Acts 23:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 23, what does the chapter say about Paul (Acts 23:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 1, 'According to Acts 23, what happened?', '["He split the council by professing hope in the resurrection.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He split the council by professing hope in the resurrection.', 'He split the council by professing hope in the resurrection (Acts 23:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 23, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 1, 'According to Acts 23, what does the chapter say about Paul (Acts 23:8)?', '["The Lord said Paul would testify at Rome as at Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord said Paul would testify at Rome as at Jerusalem.', 'The Lord said Paul would testify at Rome as at Jerusalem (Acts 23:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 23, what does the chapter say about Paul (Acts 23:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 1, 'According to Acts 23, what does the chapter say about Paul (Acts 23:11)?', '["More than forty men vowed not to eat until they killed Paul.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'More than forty men vowed not to eat until they killed Paul.', 'More than forty men vowed not to eat until they killed Paul (Acts 23:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 23, what does the chapter say about Paul (Acts 23:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 1, 'According to Acts 23, what does the chapter say about Paul (Acts 23:12)?', '["Paul’s nephew told the commander the ambush plan.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul’s nephew told the commander the ambush plan.', 'Paul’s nephew told the commander the ambush plan (Acts 23:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 23, what does the chapter say about Paul (Acts 23:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 2, 'According to Acts 23, what happened (Acts 23:1)?', '["Concerning the hope and resurrection of the dead I am being judged", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Concerning the hope and resurrection of the dead I am being judged', 'Concerning the hope and resurrection of the dead I am being judged (Acts 23:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 23, what happened (Acts 23:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 2, 'According to Acts 23, what does the chapter say about Paul (Acts 23:6)?', '["Cheer up, Paul, for as you have testified about me at Jerusalem, so you must testify also at Rome", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Cheer up, Paul, for as you have testified about me at Jerusalem, so you must testify also at Rome', 'Cheer up, Paul, for as you have testified about me at Jerusalem, so you must testify also at Rome (Acts 23:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 23, what does the chapter say about Paul (Acts 23:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 2, 'According to Acts 23, what does the chapter say about Paul (Acts 23:8)?', '["neither eat nor drink until they have killed Paul", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'neither eat nor drink until they have killed Paul', 'neither eat nor drink until they have killed Paul (Acts 23:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 23, what does the chapter say about Paul (Acts 23:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 2, 'According to Acts 23, what happened (Acts 23:11)?', '["Claudius Lysias to the most excellent governor Felix", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Claudius Lysias to the most excellent governor Felix', 'Claudius Lysias to the most excellent governor Felix (Acts 23:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 23, what happened (Acts 23:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 2, 'According to Acts 23, what does the chapter say about Paul (Acts 23:12)?', '["Paul said he lived in good conscience before God.", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Paul said he lived in good conscience before God.', 'Paul said he lived in good conscience before God (Acts 23:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 23, what does the chapter say about Paul (Acts 23:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 3, 'According to Acts 23, what happened?', '["He split the council by professing hope in the resurrection.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He split the council by professing hope in the resurrection.', 'He split the council by professing hope in the resurrection (Acts 23:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 23, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 3, 'What does Acts 23 teach about Paul (Acts 23:6)?', '["The Lord said Paul would testify at Rome as at Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord said Paul would testify at Rome as at Jerusalem.', 'The Lord said Paul would testify at Rome as at Jerusalem (Acts 23:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 23 teach about Paul (Acts 23:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 3, 'What does Acts 23 teach about Paul (Acts 23:8)?', '["More than forty men vowed not to eat until they killed Paul.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'More than forty men vowed not to eat until they killed Paul.', 'More than forty men vowed not to eat until they killed Paul (Acts 23:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 23 teach about Paul (Acts 23:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 3, 'What does Acts 23 teach about Paul (Acts 23:11)?', '["Paul’s nephew told the commander the ambush plan.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul’s nephew told the commander the ambush plan.', 'Paul’s nephew told the commander the ambush plan (Acts 23:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 23 teach about Paul (Acts 23:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 3, 'What does Acts 23 teach about Paul (Acts 23:12)?', '["Paul was sent by night with soldiers to Felix in Caesarea.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul was sent by night with soldiers to Felix in Caesarea.', 'Paul was sent by night with soldiers to Felix in Caesarea (Acts 23:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 23 teach about Paul (Acts 23:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 4, 'Which phrase in Acts 23 speaks about Paul (Acts 23:1)?', '["Cheer up, Paul, for as you have testified about me at Jerusalem, so you must testify also at Rome", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Cheer up, Paul, for as you have testified about me at Jerusalem, so you must testify also at Rome', 'Cheer up, Paul, for as you have testified about me at Jerusalem, so you must testify also at Rome (Acts 23:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 23 speaks about Paul (Acts 23:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 4, 'Which phrase in Acts 23 speaks about Paul (Acts 23:6)?', '["neither eat nor drink until they have killed Paul", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'neither eat nor drink until they have killed Paul', 'neither eat nor drink until they have killed Paul (Acts 23:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 23 speaks about Paul (Acts 23:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 4, 'Which phrase belongs in Acts 23 (Acts 23:8)?', '["Claudius Lysias to the most excellent governor Felix", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Claudius Lysias to the most excellent governor Felix', 'Claudius Lysias to the most excellent governor Felix (Acts 23:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 23 (Acts 23:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 4, 'Which phrase in Acts 23 speaks about Paul (Acts 23:11)?', '["Paul said he lived in good conscience before God.", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Paul said he lived in good conscience before God.', 'Paul said he lived in good conscience before God (Acts 23:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 23 speaks about Paul (Acts 23:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 4, 'Which phrase belongs in Acts 23 (Acts 23:12)?', '["Concerning the hope and resurrection of the dead I am being judged", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Concerning the hope and resurrection of the dead I am being judged', 'Concerning the hope and resurrection of the dead I am being judged (Acts 23:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 23 (Acts 23:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 5, 'What major point does Acts 23 make about Paul (Acts 23:1)?', '["The Lord said Paul would testify at Rome as at Jerusalem.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The Lord said Paul would testify at Rome as at Jerusalem.', 'The Lord said Paul would testify at Rome as at Jerusalem (Acts 23:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 23 make about Paul (Acts 23:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 5, 'What major point does Acts 23 make about Paul (Acts 23:6)?', '["More than forty men vowed not to eat until they killed Paul.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'More than forty men vowed not to eat until they killed Paul.', 'More than forty men vowed not to eat until they killed Paul (Acts 23:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 23 make about Paul (Acts 23:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 5, 'What major point does Acts 23 make about Paul (Acts 23:8)?', '["Paul’s nephew told the commander the ambush plan.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul’s nephew told the commander the ambush plan.', 'Paul’s nephew told the commander the ambush plan (Acts 23:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 23 make about Paul (Acts 23:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 5, 'What major point does Acts 23 make about Paul (Acts 23:11)?', '["Paul was sent by night with soldiers to Felix in Caesarea.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul was sent by night with soldiers to Felix in Caesarea.', 'Paul was sent by night with soldiers to Felix in Caesarea (Acts 23:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 23 make about Paul (Acts 23:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 23, 5, 'What major point does Acts 23 make about Paul (Acts 23:12)?', '["Paul said he lived in good conscience before God.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he lived in good conscience before God.', 'Paul said he lived in good conscience before God (Acts 23:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 23 make about Paul (Acts 23:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 1, 'According to Acts 24, what does the chapter say about Paul (Acts 24:5)?', '["Tertullus called Paul a ringleader of the Nazarene sect.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Tertullus called Paul a ringleader of the Nazarene sect.', 'Tertullus called Paul a ringleader of the Nazarene sect (Acts 24:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 24, what does the chapter say about Paul (Acts 24:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 1, 'According to Acts 24, what does the chapter say about Paul (Acts 24:10)?', '["Paul confessed worshiping the God of the fathers according to the Way.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul confessed worshiping the God of the fathers according to the Way.', 'Paul confessed worshiping the God of the fathers according to the Way (Acts 24:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 24, what does the chapter say about Paul (Acts 24:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 1, 'According to Acts 24, what happened (Acts 24:14)?', '["He said he believed in resurrection of both just and unjust.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said he believed in resurrection of both just and unjust.', 'He said he believed in resurrection of both just and unjust (Acts 24:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 24, what happened (Acts 24:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 1, 'According to Acts 24, what happened (Acts 24:15)?', '["Felix postponed judgment wanting Lysias’s account.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix postponed judgment wanting Lysias’s account.', 'Felix postponed judgment wanting Lysias’s account (Acts 24:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 24, what happened (Acts 24:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 1, 'According to Acts 24, what does the chapter say about Paul (Acts 24:22)?', '["Felix trembled when Paul spoke of righteousness and coming judgment.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix trembled when Paul spoke of righteousness and coming judgment.', 'Felix trembled when Paul spoke of righteousness and coming judgment (Acts 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 24, what does the chapter say about Paul (Acts 24:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 2, 'According to Acts 24, what happened (Acts 24:5)?', '["a ringleader of the sect of the Nazarenes", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'a ringleader of the sect of the Nazarenes', 'a ringleader of the sect of the Nazarenes (Acts 24:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 24, what happened (Acts 24:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 2, 'According to Acts 24, what does the chapter say about the law?', '["I serve the God of our fathers, believing all things which are according to the law", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I serve the God of our fathers, believing all things which are according to the law', 'I serve the God of our fathers, believing all things which are according to the law (Acts 24:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 24, what does the chapter say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 2, 'According to Acts 24, what happened (Acts 24:14)?', '["there will be a resurrection of the dead, both of the just and unjust", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'there will be a resurrection of the dead, both of the just and unjust', 'there will be a resurrection of the dead, both of the just and unjust (Acts 24:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 24, what happened (Acts 24:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 2, 'According to Acts 24, what happened (Acts 24:15)?', '["Felix was terrified", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Felix was terrified', 'Felix was terrified (Acts 24:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 24, what happened (Acts 24:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 2, 'According to Acts 24, what does the chapter say about Paul?', '["Felix left Paul in bonds", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Felix left Paul in bonds', 'Felix left Paul in bonds (Acts 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 24, what does the chapter say about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 3, 'What does Acts 24 teach about Paul (Acts 24:5)?', '["Paul confessed worshiping the God of the fathers according to the Way.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul confessed worshiping the God of the fathers according to the Way.', 'Paul confessed worshiping the God of the fathers according to the Way (Acts 24:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 24 teach about Paul (Acts 24:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 3, 'According to Acts 24, what happened?', '["He said he believed in resurrection of both just and unjust.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said he believed in resurrection of both just and unjust.', 'He said he believed in resurrection of both just and unjust (Acts 24:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 24, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 3, 'What does Acts 24 teach?', '["Felix postponed judgment wanting Lysias’s account.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix postponed judgment wanting Lysias’s account.', 'Felix postponed judgment wanting Lysias’s account (Acts 24:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 24 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 3, 'What does Acts 24 teach about Paul (Acts 24:15)?', '["Felix trembled when Paul spoke of righteousness and coming judgment.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix trembled when Paul spoke of righteousness and coming judgment.', 'Felix trembled when Paul spoke of righteousness and coming judgment (Acts 24:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 24 teach about Paul (Acts 24:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 3, 'What does Acts 24 teach about Paul (Acts 24:22)?', '["Felix left Paul bound two years to please the Jews.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix left Paul bound two years to please the Jews.', 'Felix left Paul bound two years to please the Jews (Acts 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 24 teach about Paul (Acts 24:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 4, 'Which phrase in Acts 24 speaks about the law?', '["I serve the God of our fathers, believing all things which are according to the law", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I serve the God of our fathers, believing all things which are according to the law', 'I serve the God of our fathers, believing all things which are according to the law (Acts 24:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 24 speaks about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 4, 'Which phrase belongs in Acts 24 (Acts 24:10)?', '["there will be a resurrection of the dead, both of the just and unjust", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'there will be a resurrection of the dead, both of the just and unjust', 'there will be a resurrection of the dead, both of the just and unjust (Acts 24:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 24 (Acts 24:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 4, 'Which phrase belongs in Acts 24 (Acts 24:14)?', '["Felix was terrified", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Felix was terrified', 'Felix was terrified (Acts 24:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 24 (Acts 24:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 4, 'Which phrase in Acts 24 speaks about Paul?', '["Felix left Paul in bonds", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Felix left Paul in bonds', 'Felix left Paul in bonds (Acts 24:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 24 speaks about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 4, 'Which phrase belongs in Acts 24 (Acts 24:22)?', '["a ringleader of the sect of the Nazarenes", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'a ringleader of the sect of the Nazarenes', 'a ringleader of the sect of the Nazarenes (Acts 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 24 (Acts 24:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 5, 'According to Acts 24, what happened?', '["He said he believed in resurrection of both just and unjust.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said he believed in resurrection of both just and unjust.', 'He said he believed in resurrection of both just and unjust (Acts 24:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 24, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 5, 'What major point is made in Acts 24?', '["Felix postponed judgment wanting Lysias’s account.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix postponed judgment wanting Lysias’s account.', 'Felix postponed judgment wanting Lysias’s account (Acts 24:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 5, 'What major point does Acts 24 make about Paul (Acts 24:14)?', '["Felix trembled when Paul spoke of righteousness and coming judgment.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix trembled when Paul spoke of righteousness and coming judgment.', 'Felix trembled when Paul spoke of righteousness and coming judgment (Acts 24:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 24 make about Paul (Acts 24:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 5, 'What major point does Acts 24 make about Paul (Acts 24:15)?', '["Felix left Paul bound two years to please the Jews.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Felix left Paul bound two years to please the Jews.', 'Felix left Paul bound two years to please the Jews (Acts 24:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 24 make about Paul (Acts 24:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 24, 5, 'What major point does Acts 24 make about Paul (Acts 24:22)?', '["Tertullus called Paul a ringleader of the Nazarene sect.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Tertullus called Paul a ringleader of the Nazarene sect.', 'Tertullus called Paul a ringleader of the Nazarene sect (Acts 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 24 make about Paul (Acts 24:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 1, 'According to Acts 25, what does the chapter say about Paul (Acts 25:3)?', '["Jews asked Festus to summon Paul to Jerusalem to kill him en route.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews asked Festus to summon Paul to Jerusalem to kill him en route.', 'Jews asked Festus to summon Paul to Jerusalem to kill him en route (Acts 25:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 25, what does the chapter say about Paul (Acts 25:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 1, 'According to Acts 25, what does the chapter say about Paul (Acts 25:4)?', '["Paul said he stood before Caesar’s seat where he ought be tried.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he stood before Caesar’s seat where he ought be tried.', 'Paul said he stood before Caesar’s seat where he ought be tried (Acts 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 25, what does the chapter say about Paul (Acts 25:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 1, 'According to Acts 25, what does the chapter say about Paul (Acts 25:8)?', '["Paul appealed to Caesar; Festus granted it.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul appealed to Caesar; Festus granted it.', 'Paul appealed to Caesar; Festus granted it (Acts 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 25, what does the chapter say about Paul (Acts 25:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 1, 'According to Acts 25, what does the chapter say about Jesus?', '["Festus told Agrippa the dispute was about Jesus dead vs. alive.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Festus told Agrippa the dispute was about Jesus dead vs. alive.', 'Festus told Agrippa the dispute was about Jesus dead vs. alive (Acts 25:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 25, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 1, 'According to Acts 25, what does the chapter say about Paul (Acts 25:11)?', '["Agrippa wanted to hear Paul himself.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agrippa wanted to hear Paul himself.', 'Agrippa wanted to hear Paul himself (Acts 25:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 25, what does the chapter say about Paul (Acts 25:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 2, 'According to Acts 25, what happened (Acts 25:3)?', '["plotting to kill him on the way", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'plotting to kill him on the way', 'plotting to kill him on the way (Acts 25:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 25, what happened (Acts 25:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 2, 'According to Acts 25, what does the chapter say about Caesar (Acts 25:4)?', '["I am standing before Caesar’s judgment seat", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am standing before Caesar’s judgment seat', 'I am standing before Caesar’s judgment seat (Acts 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 25, what does the chapter say about Caesar (Acts 25:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 2, 'According to Acts 25, what does the chapter say about Caesar (Acts 25:8)?', '["I appeal to Caesar!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I appeal to Caesar!', 'I appeal to Caesar! (Acts 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 25, what does the chapter say about Caesar (Acts 25:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 2, 'According to Acts 25, what does the chapter say about Jesus?', '["one Jesus, who was dead, whom Paul affirmed to be alive", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'one Jesus, who was dead, whom Paul affirmed to be alive', 'one Jesus, who was dead, whom Paul affirmed to be alive (Acts 25:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 25, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 2, 'According to Acts 25, what happened (Acts 25:11)?', '["Tomorrow you shall hear him", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Tomorrow you shall hear him', 'Tomorrow you shall hear him (Acts 25:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 25, what happened (Acts 25:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 3, 'What does Acts 25 teach about Paul (Acts 25:3)?', '["Paul said he stood before Caesar’s seat where he ought be tried.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he stood before Caesar’s seat where he ought be tried.', 'Paul said he stood before Caesar’s seat where he ought be tried (Acts 25:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 25 teach about Paul (Acts 25:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 3, 'What does Acts 25 teach about Paul (Acts 25:4)?', '["Paul appealed to Caesar; Festus granted it.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul appealed to Caesar; Festus granted it.', 'Paul appealed to Caesar; Festus granted it (Acts 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 25 teach about Paul (Acts 25:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 3, 'What does Acts 25 teach about Jesus?', '["Festus told Agrippa the dispute was about Jesus dead vs. alive.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Festus told Agrippa the dispute was about Jesus dead vs. alive.', 'Festus told Agrippa the dispute was about Jesus dead vs. alive (Acts 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 25 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 3, 'What does Acts 25 teach about Paul (Acts 25:10)?', '["Agrippa wanted to hear Paul himself.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agrippa wanted to hear Paul himself.', 'Agrippa wanted to hear Paul himself (Acts 25:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 25 teach about Paul (Acts 25:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 3, 'What does Acts 25 teach about Paul (Acts 25:11)?', '["Jews asked Festus to summon Paul to Jerusalem to kill him en route.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews asked Festus to summon Paul to Jerusalem to kill him en route.', 'Jews asked Festus to summon Paul to Jerusalem to kill him en route (Acts 25:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 25 teach about Paul (Acts 25:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 4, 'Which phrase in Acts 25 speaks about Caesar (Acts 25:3)?', '["I am standing before Caesar’s judgment seat", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am standing before Caesar’s judgment seat', 'I am standing before Caesar’s judgment seat (Acts 25:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 25 speaks about Caesar (Acts 25:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 4, 'Which phrase in Acts 25 speaks about Caesar (Acts 25:4)?', '["I appeal to Caesar!", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I appeal to Caesar!', 'I appeal to Caesar! (Acts 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 25 speaks about Caesar (Acts 25:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 4, 'Which phrase in Acts 25 speaks about Jesus?', '["one Jesus, who was dead, whom Paul affirmed to be alive", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'one Jesus, who was dead, whom Paul affirmed to be alive', 'one Jesus, who was dead, whom Paul affirmed to be alive (Acts 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 25 speaks about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 4, 'Which phrase belongs in Acts 25 (Acts 25:10)?', '["Tomorrow you shall hear him", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'Tomorrow you shall hear him', 'Tomorrow you shall hear him (Acts 25:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 25 (Acts 25:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 4, 'Which phrase belongs in Acts 25 (Acts 25:11)?', '["plotting to kill him on the way", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'plotting to kill him on the way', 'plotting to kill him on the way (Acts 25:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 25 (Acts 25:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 5, 'What major point does Acts 25 make about Paul (Acts 25:3)?', '["Paul appealed to Caesar; Festus granted it.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul appealed to Caesar; Festus granted it.', 'Paul appealed to Caesar; Festus granted it (Acts 25:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 25 make about Paul (Acts 25:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 5, 'What major point does Acts 25 make about Jesus?', '["Festus told Agrippa the dispute was about Jesus dead vs. alive.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Festus told Agrippa the dispute was about Jesus dead vs. alive.', 'Festus told Agrippa the dispute was about Jesus dead vs. alive (Acts 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 25 make about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 5, 'What major point does Acts 25 make about Paul (Acts 25:8)?', '["Agrippa wanted to hear Paul himself.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agrippa wanted to hear Paul himself.', 'Agrippa wanted to hear Paul himself (Acts 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 25 make about Paul (Acts 25:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 5, 'What major point does Acts 25 make about Paul (Acts 25:10)?', '["Jews asked Festus to summon Paul to Jerusalem to kill him en route.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jews asked Festus to summon Paul to Jerusalem to kill him en route.', 'Jews asked Festus to summon Paul to Jerusalem to kill him en route (Acts 25:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 25 make about Paul (Acts 25:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 25, 5, 'What major point does Acts 25 make about Paul (Acts 25:11)?', '["Paul said he stood before Caesar’s seat where he ought be tried.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he stood before Caesar’s seat where he ought be tried.', 'Paul said he stood before Caesar’s seat where he ought be tried (Acts 25:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 25 make about Paul (Acts 25:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 1, 'According to Acts 26, what does the chapter say about Paul (Acts 26:6)?', '["Paul said he was a Pharisee judged for hope of resurrection.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he was a Pharisee judged for hope of resurrection.', 'Paul said he was a Pharisee judged for hope of resurrection (Acts 26:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 26, what does the chapter say about Paul (Acts 26:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 1, 'According to Acts 26, what does the chapter say about Jesus?', '["Jesus commissioned him to turn Gentiles from darkness to light.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jesus commissioned him to turn Gentiles from darkness to light.', 'Jesus commissioned him to turn Gentiles from darkness to light (Acts 26:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 26, what does the chapter say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 1, 'According to Acts 26, what does the chapter say about Paul (Acts 26:14)?', '["Festus said Paul’s learning made him insane.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Festus said Paul’s learning made him insane.', 'Festus said Paul’s learning made him insane (Acts 26:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 26, what does the chapter say about Paul (Acts 26:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 1, 'According to Acts 26, what does the chapter say about Paul (Acts 26:18)?', '["Paul said he spoke true and reasonable words.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he spoke true and reasonable words.', 'Paul said he spoke true and reasonable words (Acts 26:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 26, what does the chapter say about Paul (Acts 26:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 1, 'According to Acts 26, what does the chapter say about Paul (Acts 26:19)?', '["Agrippa asked if Paul tried to make him a Christian.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agrippa asked if Paul tried to make him a Christian.', 'Agrippa asked if Paul tried to make him a Christian (Acts 26:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 26, what does the chapter say about Paul (Acts 26:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 2, 'According to Acts 26, what happened (Acts 26:6)?', '["for the hope of the promise made by God to our fathers", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'for the hope of the promise made by God to our fathers', 'for the hope of the promise made by God to our fathers (Acts 26:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 26, what happened (Acts 26:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 2, 'According to Acts 26, what happened (Acts 26:8)?', '["to open their eyes, that they may turn from darkness to light", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'to open their eyes, that they may turn from darkness to light', 'to open their eyes, that they may turn from darkness to light (Acts 26:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 26, what happened (Acts 26:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 2, 'According to Acts 26, what happened (Acts 26:14)?', '["I am not crazy, most excellent Festus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am not crazy, most excellent Festus', 'I am not crazy, most excellent Festus (Acts 26:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 26, what happened (Acts 26:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 2, 'According to Acts 26, With a little persuasion are you trying to make me a Christian?', '["With a little persuasion are you trying to make me a Christian?", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'With a little persuasion are you trying to make me a Christian?', 'With a little persuasion are you trying to make me a Christian? (Acts 26:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 26, With a little persuasion are you trying to make me a Christian?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 2, 'According to Acts 26, what does the chapter say about Caesar?', '["This man might have been set free if he had not appealed to Caesar", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'This man might have been set free if he had not appealed to Caesar', 'This man might have been set free if he had not appealed to Caesar (Acts 26:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 26, what does the chapter say about Caesar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 3, 'What does Acts 26 teach about Jesus?', '["Jesus commissioned him to turn Gentiles from darkness to light.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Jesus commissioned him to turn Gentiles from darkness to light.', 'Jesus commissioned him to turn Gentiles from darkness to light (Acts 26:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 26 teach about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 3, 'What does Acts 26 teach about Paul (Acts 26:8)?', '["Festus said Paul’s learning made him insane.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Festus said Paul’s learning made him insane.', 'Festus said Paul’s learning made him insane (Acts 26:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 26 teach about Paul (Acts 26:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 3, 'What does Acts 26 teach about Paul (Acts 26:14)?', '["Paul said he spoke true and reasonable words.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he spoke true and reasonable words.', 'Paul said he spoke true and reasonable words (Acts 26:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 26 teach about Paul (Acts 26:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 3, 'What does Acts 26 teach about Paul (Acts 26:18)?', '["Agrippa asked if Paul tried to make him a Christian.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agrippa asked if Paul tried to make him a Christian.', 'Agrippa asked if Paul tried to make him a Christian (Acts 26:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 26 teach about Paul (Acts 26:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 3, 'What does Acts 26 teach about Paul (Acts 26:19)?', '["The king and governor agreed Paul did nothing worthy of death or chains.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The king and governor agreed Paul did nothing worthy of death or chains.', 'The king and governor agreed Paul did nothing worthy of death or chains (Acts 26:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 26 teach about Paul (Acts 26:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 4, 'Which phrase belongs in Acts 26 (Acts 26:6)?', '["to open their eyes, that they may turn from darkness to light", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'to open their eyes, that they may turn from darkness to light', 'to open their eyes, that they may turn from darkness to light (Acts 26:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 26 (Acts 26:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 4, 'Which phrase belongs in Acts 26 (Acts 26:8)?', '["I am not crazy, most excellent Festus", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'I am not crazy, most excellent Festus', 'I am not crazy, most excellent Festus (Acts 26:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 26 (Acts 26:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 4, 'According to Acts 26, With a little persuasion are you trying to make me a Christian?', '["With a little persuasion are you trying to make me a Christian?", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'With a little persuasion are you trying to make me a Christian?', 'With a little persuasion are you trying to make me a Christian? (Acts 26:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 26, With a little persuasion are you trying to make me a Christian?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 4, 'Which phrase in Acts 26 speaks about Caesar?', '["This man might have been set free if he had not appealed to Caesar", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'This man might have been set free if he had not appealed to Caesar', 'This man might have been set free if he had not appealed to Caesar (Acts 26:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 26 speaks about Caesar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 4, 'Which phrase belongs in Acts 26 (Acts 26:19)?', '["for the hope of the promise made by God to our fathers", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'for the hope of the promise made by God to our fathers', 'for the hope of the promise made by God to our fathers (Acts 26:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 26 (Acts 26:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 5, 'What major point does Acts 26 make about Paul (Acts 26:6)?', '["Festus said Paul’s learning made him insane.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Festus said Paul’s learning made him insane.', 'Festus said Paul’s learning made him insane (Acts 26:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 26 make about Paul (Acts 26:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 5, 'What major point does Acts 26 make about Paul (Acts 26:8)?', '["Paul said he spoke true and reasonable words.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he spoke true and reasonable words.', 'Paul said he spoke true and reasonable words (Acts 26:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 26 make about Paul (Acts 26:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 5, 'What major point does Acts 26 make about Paul (Acts 26:14)?', '["Agrippa asked if Paul tried to make him a Christian.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Agrippa asked if Paul tried to make him a Christian.', 'Agrippa asked if Paul tried to make him a Christian (Acts 26:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 26 make about Paul (Acts 26:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 5, 'What major point does Acts 26 make about Paul (Acts 26:18)?', '["The king and governor agreed Paul did nothing worthy of death or chains.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The king and governor agreed Paul did nothing worthy of death or chains.', 'The king and governor agreed Paul did nothing worthy of death or chains (Acts 26:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 26 make about Paul (Acts 26:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 26, 5, 'What major point does Acts 26 make about Paul (Acts 26:19)?', '["Paul said he was a Pharisee judged for hope of resurrection.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said he was a Pharisee judged for hope of resurrection.', 'Paul said he was a Pharisee judged for hope of resurrection (Acts 26:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 26 make about Paul (Acts 26:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 1, 'According to Acts 27, what does the chapter say about Paul (Acts 27:10)?', '["Paul foresaw injury and loss if they sailed from Crete.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul foresaw injury and loss if they sailed from Crete.', 'Paul foresaw injury and loss if they sailed from Crete (Acts 27:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 27, what does the chapter say about Paul (Acts 27:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 1, 'According to Acts 27, what happened (Acts 27:14)?', '["The ship was caught by Euroclydon and driven days without sun or stars.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The ship was caught by Euroclydon and driven days without sun or stars.', 'The ship was caught by Euroclydon and driven days without sun or stars (Acts 27:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 27, what happened (Acts 27:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 1, 'According to Acts 27, what does the chapter say about Paul (Acts 27:20)?', '["An angel said Paul must stand before Caesar and all would be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel said Paul must stand before Caesar and all would be saved.', 'An angel said Paul must stand before Caesar and all would be saved (Acts 27:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 27, what does the chapter say about Paul (Acts 27:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 1, 'According to Acts 27, what does the chapter say about Paul (Acts 27:23)?', '["Paul said not a hair would perish from their heads.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said not a hair would perish from their heads.', 'Paul said not a hair would perish from their heads (Acts 27:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 27, what does the chapter say about Paul (Acts 27:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 1, 'According to Acts 27, what happened (Acts 27:24)?', '["Two hundred seventy-six people were on the ship.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Two hundred seventy-six people were on the ship.', 'Two hundred seventy-six people were on the ship (Acts 27:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 27, what happened (Acts 27:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 2, 'According to Acts 27, what happened (Acts 27:10)?', '["the voyage will be with injury and much loss", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the voyage will be with injury and much loss', 'the voyage will be with injury and much loss (Acts 27:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 27, what happened (Acts 27:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 2, 'According to Acts 27, what happened (Acts 27:14)?', '["which is called Euroclydon", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'which is called Euroclydon', 'which is called Euroclydon (Acts 27:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 27, what happened (Acts 27:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 2, 'According to Acts 27, what happened (Acts 27:20)?', '["all hope that we would be saved was now taken away", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'all hope that we would be saved was now taken away', 'all hope that we would be saved was now taken away (Acts 27:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 27, what happened (Acts 27:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 2, 'According to Acts 27, what does the chapter say about Caesar?', '["You must stand before Caesar", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'You must stand before Caesar', 'You must stand before Caesar (Acts 27:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 27, what does the chapter say about Caesar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 2, 'According to Acts 27, what happened (Acts 27:24)?', '["two hundred seventy-six souls on the ship", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'two hundred seventy-six souls on the ship', 'two hundred seventy-six souls on the ship (Acts 27:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 27, what happened (Acts 27:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 3, 'What does Acts 27 teach (Acts 27:10)?', '["The ship was caught by Euroclydon and driven days without sun or stars.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'The ship was caught by Euroclydon and driven days without sun or stars.', 'The ship was caught by Euroclydon and driven days without sun or stars (Acts 27:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 27 teach (Acts 27:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 3, 'What does Acts 27 teach about Paul (Acts 27:14)?', '["An angel said Paul must stand before Caesar and all would be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel said Paul must stand before Caesar and all would be saved.', 'An angel said Paul must stand before Caesar and all would be saved (Acts 27:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 27 teach about Paul (Acts 27:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 3, 'What does Acts 27 teach about Paul (Acts 27:20)?', '["Paul said not a hair would perish from their heads.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said not a hair would perish from their heads.', 'Paul said not a hair would perish from their heads (Acts 27:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 27 teach about Paul (Acts 27:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 3, 'What does Acts 27 teach (Acts 27:23)?', '["Two hundred seventy-six people were on the ship.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Two hundred seventy-six people were on the ship.', 'Two hundred seventy-six people were on the ship (Acts 27:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 27 teach (Acts 27:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 3, 'What does Acts 27 teach about Paul (Acts 27:24)?', '["Julius kept soldiers from killing prisoners so Paul could be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Julius kept soldiers from killing prisoners so Paul could be saved.', 'Julius kept soldiers from killing prisoners so Paul could be saved (Acts 27:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 27 teach about Paul (Acts 27:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 4, 'Which phrase belongs in Acts 27 (Acts 27:10)?', '["which is called Euroclydon", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'which is called Euroclydon', 'which is called Euroclydon (Acts 27:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 27 (Acts 27:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 4, 'Which phrase belongs in Acts 27 (Acts 27:14)?', '["all hope that we would be saved was now taken away", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'all hope that we would be saved was now taken away', 'all hope that we would be saved was now taken away (Acts 27:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 27 (Acts 27:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 4, 'Which phrase in Acts 27 speaks about Caesar?', '["You must stand before Caesar", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'You must stand before Caesar', 'You must stand before Caesar (Acts 27:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 27 speaks about Caesar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 4, 'Which phrase belongs in Acts 27 (Acts 27:23)?', '["two hundred seventy-six souls on the ship", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'two hundred seventy-six souls on the ship', 'two hundred seventy-six souls on the ship (Acts 27:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 27 (Acts 27:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 4, 'Which phrase belongs in Acts 27 (Acts 27:24)?', '["So they all escaped safely to the land", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'So they all escaped safely to the land', 'So they all escaped safely to the land (Acts 27:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 27 (Acts 27:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 5, 'What major point does Acts 27 make about Paul (Acts 27:10)?', '["An angel said Paul must stand before Caesar and all would be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'An angel said Paul must stand before Caesar and all would be saved.', 'An angel said Paul must stand before Caesar and all would be saved (Acts 27:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 27 make about Paul (Acts 27:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 5, 'What major point does Acts 27 make about Paul (Acts 27:14)?', '["Paul said not a hair would perish from their heads.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul said not a hair would perish from their heads.', 'Paul said not a hair would perish from their heads (Acts 27:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 27 make about Paul (Acts 27:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 5, 'What major point is made in Acts 27?', '["Two hundred seventy-six people were on the ship.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Two hundred seventy-six people were on the ship.', 'Two hundred seventy-six people were on the ship (Acts 27:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Acts 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 5, 'What major point does Acts 27 make about Paul (Acts 27:23)?', '["Julius kept soldiers from killing prisoners so Paul could be saved.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Julius kept soldiers from killing prisoners so Paul could be saved.', 'Julius kept soldiers from killing prisoners so Paul could be saved (Acts 27:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 27 make about Paul (Acts 27:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 27, 5, 'What major point does Acts 27 make about Paul (Acts 27:24)?', '["Paul foresaw injury and loss if they sailed from Crete.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul foresaw injury and loss if they sailed from Crete.', 'Paul foresaw injury and loss if they sailed from Crete (Acts 27:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 27 make about Paul (Acts 27:24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 1, 'According to Acts 28, what does the chapter say about Paul?', '["Paul shook off the viper into the fire unharmed.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Paul shook off the viper into the fire unharmed.', 'Paul shook off the viper into the fire unharmed (Acts 28:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 28, what does the chapter say about Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 1, 'According to Acts 28, what happened (Acts 28:8)?', '["He healed Publius’s father of fever and dysentery.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He healed Publius’s father of fever and dysentery.', 'He healed Publius’s father of fever and dysentery (Acts 28:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 1, 'According to Acts 28, what does the chapter say about Rome?', '["In Rome he said he was bound for the hope of Israel.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'In Rome he said he was bound for the hope of Israel.', 'In Rome he said he was bound for the hope of Israel (Acts 28:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 28, what does the chapter say about Rome?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 1, 'According to Acts 28, what happened (Acts 28:20)?', '["He reasoned about God’s Kingdom and Jesus from law and prophets.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He reasoned about God’s Kingdom and Jesus from law and prophets.', 'He reasoned about God’s Kingdom and Jesus from law and prophets (Acts 28:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 1, 'According to Acts 28, what happened (Acts 28:23)?', '["He applied Isaiah about dull hearing and closed eyes.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He applied Isaiah about dull hearing and closed eyes.', 'He applied Isaiah about dull hearing and closed eyes (Acts 28:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 2, 'According to Acts 28, what happened (Acts 28:5)?', '["he shook off the creature into the fire, and wasn’t harmed", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he shook off the creature into the fire, and wasn’t harmed', 'he shook off the creature into the fire, and wasn’t harmed (Acts 28:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 2, 'According to Acts 28, what happened (Acts 28:8)?', '["because of the hope of Israel I am bound with this chain", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'because of the hope of Israel I am bound with this chain', 'because of the hope of Israel I am bound with this chain (Acts 28:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 2, 'According to Acts 28, what does the chapter say about Jesus (Acts 28:15)?', '["persuading them concerning Jesus, both from the law of Moses and from the prophets", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'persuading them concerning Jesus, both from the law of Moses and from the prophets', 'persuading them concerning Jesus, both from the law of Moses and from the prophets (Acts 28:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 28, what does the chapter say about Jesus (Acts 28:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 2, 'According to Acts 28, what happened (Acts 28:20)?', '["the salvation of God is sent to the nations", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the salvation of God is sent to the nations', 'the salvation of God is sent to the nations (Acts 28:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 2, 'According to Acts 28, what does the chapter say about Jesus (Acts 28:23)?', '["preaching God’s Kingdom, and teaching the things concerning the Lord Jesus Christ with all boldness, without hindrance", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'preaching God’s Kingdom, and teaching the things concerning the Lord Jesus Christ with all boldness, without hindrance', 'preaching God’s Kingdom, and teaching the things concerning the Lord Jesus Christ with all boldness, without hindrance (Acts 28:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Acts 28, what does the chapter say about Jesus (Acts 28:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 3, 'According to Acts 28, what happened (Acts 28:5)?', '["He healed Publius’s father of fever and dysentery.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He healed Publius’s father of fever and dysentery.', 'He healed Publius’s father of fever and dysentery (Acts 28:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 3, 'What does Acts 28 teach about Rome?', '["In Rome he said he was bound for the hope of Israel.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'In Rome he said he was bound for the hope of Israel.', 'In Rome he said he was bound for the hope of Israel (Acts 28:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Acts 28 teach about Rome?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 3, 'According to Acts 28, what happened (Acts 28:15)?', '["He reasoned about God’s Kingdom and Jesus from law and prophets.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He reasoned about God’s Kingdom and Jesus from law and prophets.', 'He reasoned about God’s Kingdom and Jesus from law and prophets (Acts 28:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 3, 'According to Acts 28, what happened (Acts 28:20)?', '["He applied Isaiah about dull hearing and closed eyes.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He applied Isaiah about dull hearing and closed eyes.', 'He applied Isaiah about dull hearing and closed eyes (Acts 28:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 3, 'According to Acts 28, what happened (Acts 28:23)?', '["He said God’s salvation was sent to the nations who would listen.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said God’s salvation was sent to the nations who would listen.', 'He said God’s salvation was sent to the nations who would listen (Acts 28:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:23)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 4, 'Which phrase belongs in Acts 28 (Acts 28:5)?', '["because of the hope of Israel I am bound with this chain", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'because of the hope of Israel I am bound with this chain', 'because of the hope of Israel I am bound with this chain (Acts 28:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 28 (Acts 28:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 4, 'Which phrase in Acts 28 speaks about Jesus (Acts 28:8)?', '["persuading them concerning Jesus, both from the law of Moses and from the prophets", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'persuading them concerning Jesus, both from the law of Moses and from the prophets', 'persuading them concerning Jesus, both from the law of Moses and from the prophets (Acts 28:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 28 speaks about Jesus (Acts 28:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 4, 'Which phrase belongs in Acts 28 (Acts 28:15)?', '["the salvation of God is sent to the nations", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'the salvation of God is sent to the nations', 'the salvation of God is sent to the nations (Acts 28:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Acts 28 (Acts 28:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 4, 'Which phrase in Acts 28 speaks about Jesus (Acts 28:20)?', '["preaching God’s Kingdom, and teaching the things concerning the Lord Jesus Christ with all boldness, without hindrance", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'preaching God’s Kingdom, and teaching the things concerning the Lord Jesus Christ with all boldness, without hindrance', 'preaching God’s Kingdom, and teaching the things concerning the Lord Jesus Christ with all boldness, without hindrance (Acts 28:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Acts 28 speaks about Jesus (Acts 28:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 4, 'According to Acts 28, what happened?', '["he shook off the creature into the fire, and wasn’t harmed", "you will be baptized in the Holy Spirit", "You will be witnesses to me", "a cloud received him out of their sight"]'::jsonb, 'he shook off the creature into the fire, and wasn’t harmed', 'he shook off the creature into the fire, and wasn’t harmed (Acts 28:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Acts 28, what happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 5, 'What major point does Acts 28 make about Rome?', '["In Rome he said he was bound for the hope of Israel.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'In Rome he said he was bound for the hope of Israel.', 'In Rome he said he was bound for the hope of Israel (Acts 28:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 28 make about Rome?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 5, 'According to Acts 28, what happened (Acts 28:8)?', '["He reasoned about God’s Kingdom and Jesus from law and prophets.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He reasoned about God’s Kingdom and Jesus from law and prophets.', 'He reasoned about God’s Kingdom and Jesus from law and prophets (Acts 28:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 5, 'According to Acts 28, what happened (Acts 28:15)?', '["He applied Isaiah about dull hearing and closed eyes.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He applied Isaiah about dull hearing and closed eyes.', 'He applied Isaiah about dull hearing and closed eyes (Acts 28:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 5, 'According to Acts 28, what happened (Acts 28:20)?', '["He said God’s salvation was sent to the nations who would listen.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'He said God’s salvation was sent to the nations who would listen.', 'He said God’s salvation was sent to the nations who would listen (Acts 28:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Acts 28, what happened (Acts 28:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 44, 28, 5, 'What major point does Acts 28 make about Jesus?', '["Two years he preached God’s Kingdom and taught about Jesus boldly.", "Jesus showed himself alive forty days and spoke about God’s Kingdom.", "Apostles were told to wait in Jerusalem for the Father’s promise.", "They would receive power when the Holy Spirit came and be witnesses everywhere."]'::jsonb, 'Two years he preached God’s Kingdom and taught about Jesus boldly.', 'Two years he preached God’s Kingdom and taught about Jesus boldly (Acts 28:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 44
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Acts 28 make about Jesus?'
);
