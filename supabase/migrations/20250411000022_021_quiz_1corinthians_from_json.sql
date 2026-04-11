-- ============================================================================
-- LOGOS LIGHT - 1 Corinthians (book 46) quiz questions from quiz-questions/1corinthians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 1, 'According to 1 Corinthians 1, what had the Corinthian believers been enriched in?', '["You were enriched in everything in him.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'You were enriched in everything in him.', 'You were enriched in everything in him (1 Corinthians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 1, what had the Corinthian believers been enriched in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 1, 'According to 1 Corinthians 1, what did Paul urge the Corinthians to do?', '["That you all speak the same thing.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'That you all speak the same thing.', 'That you all speak the same thing (1 Corinthians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul urge the Corinthians to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 1, 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?', '["Is Christ divided?","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'Is Christ divided?', 'Is Christ divided? (1 Corinthians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 1, 'According to 1 Corinthians 1, what did Christ send Paul to do?', '["Christ sent me not to baptize, but to preach the Good News.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'Christ sent me not to baptize, but to preach the Good News.', 'Christ sent me not to baptize, but to preach the Good News (1 Corinthians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 1, what did Christ send Paul to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 1, 'According to 1 Corinthians 1, what did Paul say he preached?', '["We preach Christ crucified.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'We preach Christ crucified.', 'We preach Christ crucified (1 Corinthians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul say he preached?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 2, 'According to 1 Corinthians 1, to whom was this letter addressed?', '["To the assembly of God which is at Corinth","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'To the assembly of God which is at Corinth', 'To the assembly of God which is at Corinth (1 Corinthians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 1, to whom was this letter addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 2, 'According to 1 Corinthians 1, what had happened to the Corinthians in Christ?', '["you were enriched in him","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'you were enriched in him', 'you were enriched in him (1 Corinthians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 1, what had happened to the Corinthians in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 2, 'According to 1 Corinthians 1, what did Paul want the Corinthians to have?', '["that you all agree","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'that you all agree', 'that you all agree (1 Corinthians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul want the Corinthians to have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 2, 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?', '["Is Christ divided?","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'Is Christ divided?', 'Is Christ divided? (1 Corinthians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 2, 'According to 1 Corinthians 1, what did God do?', '["Christ didn''t send me to baptize","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'Christ didn''t send me to baptize', 'Christ didn''t send me to baptize (1 Corinthians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 1, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 3, 'According to 1 Corinthians 1, what did Paul urge the Corinthians to do?', '["That you all speak the same thing.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'That you all speak the same thing.', 'That you all speak the same thing (1 Corinthians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul urge the Corinthians to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 3, 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?', '["Is Christ divided?","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'Is Christ divided?', 'Is Christ divided? (1 Corinthians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 3, 'According to 1 Corinthians 1, what did Christ send Paul to do?', '["Christ sent me not to baptize, but to preach the Good News.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'Christ sent me not to baptize, but to preach the Good News.', 'Christ sent me not to baptize, but to preach the Good News (1 Corinthians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 1, what did Christ send Paul to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 3, 'According to 1 Corinthians 1, what did Paul say he preached?', '["We preach Christ crucified.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'We preach Christ crucified.', 'We preach Christ crucified (1 Corinthians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul say he preached?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 3, 'According to 1 Corinthians 1, what had the Corinthian believers been enriched in?', '["You were enriched in everything in him.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'You were enriched in everything in him.', 'You were enriched in everything in him (1 Corinthians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 1, what had the Corinthian believers been enriched in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 4, 'According to 1 Corinthians 1, what had happened to the Corinthians in Christ?', '["you were enriched in him","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'you were enriched in him', 'you were enriched in him (1 Corinthians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 1, what had happened to the Corinthians in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 4, 'According to 1 Corinthians 1, what did Paul want the Corinthians to have?', '["that you all agree","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'that you all agree', 'that you all agree (1 Corinthians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul want the Corinthians to have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 4, 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?', '["Is Christ divided?","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'Is Christ divided?', 'Is Christ divided? (1 Corinthians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 4, 'According to 1 Corinthians 1, what did God do?', '["Christ didn''t send me to baptize","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'Christ didn''t send me to baptize', 'Christ didn''t send me to baptize (1 Corinthians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 1, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 4, 'According to 1 Corinthians 1, what does Paul say ?we? do?', '["we preach Christ crucified","I came not to you with excellence of speech","in demonstration of the Spirit and of power","We speak God''s wisdom in a mystery"]'::jsonb, 'we preach Christ crucified', 'we preach Christ crucified (1 Corinthians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 1, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 5, 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?', '["Is Christ divided?","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'Is Christ divided?', 'Is Christ divided? (1 Corinthians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 1, what question does Paul ask to rebuke division?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 5, 'According to 1 Corinthians 1, what did Christ send Paul to do?', '["Christ sent me not to baptize, but to preach the Good News.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'Christ sent me not to baptize, but to preach the Good News.', 'Christ sent me not to baptize, but to preach the Good News (1 Corinthians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 1, what did Christ send Paul to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 5, 'According to 1 Corinthians 1, what did Paul say he preached?', '["We preach Christ crucified.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'We preach Christ crucified.', 'We preach Christ crucified (1 Corinthians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul say he preached?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 5, 'According to 1 Corinthians 1, what had the Corinthian believers been enriched in?', '["You were enriched in everything in him.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'You were enriched in everything in him.', 'You were enriched in everything in him (1 Corinthians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 1, what had the Corinthian believers been enriched in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 1, 5, 'According to 1 Corinthians 1, what did Paul urge the Corinthians to do?', '["That you all speak the same thing.","I came not with excellence of speech.","We speak wisdom among the perfect.","The natural man doesn''t receive the things of God''s Spirit."]'::jsonb, 'That you all speak the same thing.', 'That you all speak the same thing (1 Corinthians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 1, what did Paul urge the Corinthians to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 1, 'According to 1 Corinthians 2, how did Paul say he came to them?', '["I came not with excellence of speech.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I came not with excellence of speech.', 'I came not with excellence of speech (1 Corinthians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 2, how did Paul say he came to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 1, 'According to 1 Corinthians 2, among whom does Paul say wisdom is spoken?', '["We speak wisdom among the perfect.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We speak wisdom among the perfect.', 'We speak wisdom among the perfect (1 Corinthians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 2, among whom does Paul say wisdom is spoken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 1, 'According to 1 Corinthians 2, what does Paul say about God?', '["The natural man doesn''t receive the things of God''s Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The natural man doesn''t receive the things of God''s Spirit.', 'The natural man doesn''t receive the things of God''s Spirit (1 Corinthians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 2, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 1, 'According to 1 Corinthians 2, what are believers called?', '["You are God''s temple.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'You are God''s temple.', 'You are God''s temple (1 Corinthians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 2, what are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 1, 'According to 1 Corinthians 2, what does Paul say about Christ?', '["No other foundation can anyone lay than that which is laid-Jesus Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'No other foundation can anyone lay than that which is laid-Jesus Christ.', 'No other foundation can anyone lay than that which is laid-Jesus Christ (1 Corinthians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 2, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 2, 'According to 1 Corinthians 2, how did Paul say he came to them?', '["I came not to you with excellence of speech","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I came not to you with excellence of speech', 'I came not to you with excellence of speech (1 Corinthians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 2, how did Paul say he came to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 2, 'According to 1 Corinthians 2, in what did Paul say his message came?', '["in demonstration of the Spirit and of power","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'in demonstration of the Spirit and of power', 'in demonstration of the Spirit and of power (1 Corinthians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 2, in what did Paul say his message came?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 2, 'According to 1 Corinthians 2, what does Paul say ?we? do?', '["We speak God''s wisdom in a mystery","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'We speak God''s wisdom in a mystery', 'We speak God''s wisdom in a mystery (1 Corinthians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 2, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 2, 'According to 1 Corinthians 2, what does Paul say about God?', '["The natural man doesn''t receive the things of the Spirit of God","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The natural man doesn''t receive the things of the Spirit of God', 'The natural man doesn''t receive the things of the Spirit of God (1 Corinthians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 2, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 2, 'According to 1 Corinthians 2, what are believers called?', '["You are God''s temple","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'You are God''s temple', 'You are God''s temple (1 Corinthians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 2, what are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 3, 'According to 1 Corinthians 2, among whom does Paul say wisdom is spoken?', '["We speak wisdom among the perfect.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We speak wisdom among the perfect.', 'We speak wisdom among the perfect (1 Corinthians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 2, among whom does Paul say wisdom is spoken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 3, 'What does 1 Corinthians 2 teach about God?', '["The natural man doesn''t receive the things of God''s Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The natural man doesn''t receive the things of God''s Spirit.', 'The natural man doesn''t receive the things of God''s Spirit (1 Corinthians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 2 teach about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 3, 'According to 1 Corinthians 2, what are believers called?', '["You are God''s temple.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'You are God''s temple.', 'You are God''s temple (1 Corinthians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 2, what are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 3, 'What does 1 Corinthians 2 teach about Christ?', '["No other foundation can anyone lay than that which is laid-Jesus Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'No other foundation can anyone lay than that which is laid-Jesus Christ.', 'No other foundation can anyone lay than that which is laid-Jesus Christ (1 Corinthians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 2 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 3, 'According to 1 Corinthians 2, how did Paul say he came to them?', '["I came not with excellence of speech.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I came not with excellence of speech.', 'I came not with excellence of speech (1 Corinthians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 2, how did Paul say he came to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 4, 'According to 1 Corinthians 2, in what did Paul say his message came?', '["in demonstration of the Spirit and of power","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'in demonstration of the Spirit and of power', 'in demonstration of the Spirit and of power (1 Corinthians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 2, in what did Paul say his message came?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 4, 'According to 1 Corinthians 2, what does Paul say ?we? do?', '["We speak God''s wisdom in a mystery","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'We speak God''s wisdom in a mystery', 'We speak God''s wisdom in a mystery (1 Corinthians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 2, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 4, 'Which phrase in 1 Corinthians 2 speaks about God?', '["The natural man doesn''t receive the things of the Spirit of God","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The natural man doesn''t receive the things of the Spirit of God', 'The natural man doesn''t receive the things of the Spirit of God (1 Corinthians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 2 speaks about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 4, 'According to 1 Corinthians 2, what are believers called?', '["You are God''s temple","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'You are God''s temple', 'You are God''s temple (1 Corinthians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 2, what are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 4, 'Which phrase belongs in 1 Corinthians 2?', '["For no one can lay any other foundation","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'For no one can lay any other foundation', 'For no one can lay any other foundation (1 Corinthians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 5, 'What major point does 1 Corinthians 2 make about God?', '["The natural man doesn''t receive the things of God''s Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The natural man doesn''t receive the things of God''s Spirit.', 'The natural man doesn''t receive the things of God''s Spirit (1 Corinthians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 2 make about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 5, 'According to 1 Corinthians 2, what are believers called?', '["You are God''s temple.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'You are God''s temple.', 'You are God''s temple (1 Corinthians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 2, what are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 5, 'What major point does 1 Corinthians 2 make about Christ?', '["No other foundation can anyone lay than that which is laid-Jesus Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'No other foundation can anyone lay than that which is laid-Jesus Christ.', 'No other foundation can anyone lay than that which is laid-Jesus Christ (1 Corinthians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 2 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 5, 'According to 1 Corinthians 2, how did Paul say he came to them?', '["I came not with excellence of speech.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I came not with excellence of speech.', 'I came not with excellence of speech (1 Corinthians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 2, how did Paul say he came to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 2, 5, 'According to 1 Corinthians 2, among whom does Paul say wisdom is spoken?', '["We speak wisdom among the perfect.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We speak wisdom among the perfect.', 'We speak wisdom among the perfect (1 Corinthians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 2, among whom does Paul say wisdom is spoken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 1, 'According to 1 Corinthians 3, what does Paul say about the Spirit?', '["I couldn''t speak to you as spiritual, but as fleshly.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I couldn''t speak to you as spiritual, but as fleshly.', 'I couldn''t speak to you as spiritual, but as fleshly (1 Corinthians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 1, 'According to 1 Corinthians 3, what does Paul say about God?', '["I planted. Apollos watered. But God gave the increase.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I planted. Apollos watered. But God gave the increase.', 'I planted. Apollos watered. But God gave the increase (1 Corinthians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 1, 'According to 1 Corinthians 3, how does Paul describe himself and Apollos?', '["Who then is Apollos, and who is Paul, but servants?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Who then is Apollos, and who is Paul, but servants?', 'Who then is Apollos, and who is Paul, but servants? (1 Corinthians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 3, how does Paul describe himself and Apollos?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 1, 'According to 1 Corinthians 3, what does Paul say about Christ?', '["All things are yours, and you are Christ''s.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'All things are yours, and you are Christ''s.', 'All things are yours, and you are Christ''s (1 Corinthians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 1, 'According to 1 Corinthians 3, what does Paul say about God?', '["Ministers and God who gives growth","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Ministers and God who gives growth', 'Ministers and God who gives growth (1 Corinthians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 2, 'According to 1 Corinthians 3, what does Paul say about the Spirit?', '["I couldn''t speak to you as spiritual","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I couldn''t speak to you as spiritual', 'I couldn''t speak to you as spiritual (1 Corinthians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 2, 'According to 1 Corinthians 3, what does Paul say about God?', '["I planted. Apollos watered. But God gave the increase","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I planted. Apollos watered. But God gave the increase', 'I planted. Apollos watered. But God gave the increase (1 Corinthians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 2, 'According to 1 Corinthians 3, what does Paul say ?we? do?', '["We are God''s fellow workers","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'We are God''s fellow workers', 'We are God''s fellow workers (1 Corinthians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 2, 'According to 1 Corinthians 3, what does Paul say about God?', '["stewards of God''s mysteries","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'stewards of God''s mysteries', 'stewards of God''s mysteries (1 Corinthians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 2, 'According to 1 Corinthians 3, what does Paul say?', '["All things are yours","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'All things are yours', 'All things are yours (1 Corinthians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 3, 'What does 1 Corinthians 3 teach about God?', '["I planted. Apollos watered. But God gave the increase.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I planted. Apollos watered. But God gave the increase.', 'I planted. Apollos watered. But God gave the increase (1 Corinthians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 3 teach about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 3, 'According to 1 Corinthians 3, how does Paul describe himself and Apollos?', '["Who then is Apollos, and who is Paul, but servants?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Who then is Apollos, and who is Paul, but servants?', 'Who then is Apollos, and who is Paul, but servants? (1 Corinthians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 3, how does Paul describe himself and Apollos?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 3, 'What does 1 Corinthians 3 teach about Christ?', '["All things are yours, and you are Christ''s.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'All things are yours, and you are Christ''s.', 'All things are yours, and you are Christ''s (1 Corinthians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 3 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 3, 'What does 1 Corinthians 3 teach about God?', '["Ministers and God who gives growth","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Ministers and God who gives growth', 'Ministers and God who gives growth (1 Corinthians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 3 teach about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 3, 'What does 1 Corinthians 3 teach about the Spirit?', '["I couldn''t speak to you as spiritual, but as fleshly.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I couldn''t speak to you as spiritual, but as fleshly.', 'I couldn''t speak to you as spiritual, but as fleshly (1 Corinthians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 3 teach about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 4, 'Which phrase in 1 Corinthians 3 speaks about God?', '["I planted. Apollos watered. But God gave the increase","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I planted. Apollos watered. But God gave the increase', 'I planted. Apollos watered. But God gave the increase (1 Corinthians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 3 speaks about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 4, 'According to 1 Corinthians 3, what does Paul say ?we? do?', '["We are God''s fellow workers","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'We are God''s fellow workers', 'We are God''s fellow workers (1 Corinthians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 3, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 4, 'Which phrase in 1 Corinthians 3 speaks about God?', '["stewards of God''s mysteries","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'stewards of God''s mysteries', 'stewards of God''s mysteries (1 Corinthians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 3 speaks about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 4, 'Which phrase belongs in 1 Corinthians 3?', '["All things are yours","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'All things are yours', 'All things are yours (1 Corinthians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 4, 'Which phrase in 1 Corinthians 3 speaks about the Spirit?', '["I couldn''t speak to you as spiritual","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I couldn''t speak to you as spiritual', 'I couldn''t speak to you as spiritual (1 Corinthians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 3 speaks about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 5, 'According to 1 Corinthians 3, how does Paul describe himself and Apollos?', '["Who then is Apollos, and who is Paul, but servants?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Who then is Apollos, and who is Paul, but servants?', 'Who then is Apollos, and who is Paul, but servants? (1 Corinthians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 3, how does Paul describe himself and Apollos?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 5, 'What major point does 1 Corinthians 3 make about Christ?', '["All things are yours, and you are Christ''s.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'All things are yours, and you are Christ''s.', 'All things are yours, and you are Christ''s (1 Corinthians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 3 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 5, 'What major point does 1 Corinthians 3 make about God?', '["Ministers and God who gives growth","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Ministers and God who gives growth', 'Ministers and God who gives growth (1 Corinthians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 3 make about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 5, 'What major point does 1 Corinthians 3 make about the Spirit?', '["I couldn''t speak to you as spiritual, but as fleshly.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I couldn''t speak to you as spiritual, but as fleshly.', 'I couldn''t speak to you as spiritual, but as fleshly (1 Corinthians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 3 make about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 3, 5, 'What major point does 1 Corinthians 3 make about God?', '["I planted. Apollos watered. But God gave the increase.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I planted. Apollos watered. But God gave the increase.', 'I planted. Apollos watered. But God gave the increase (1 Corinthians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 3 make about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 1, 'According to 1 Corinthians 4, what does Paul say about faith?', '["It is required in stewards that a man be found faithful.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'It is required in stewards that a man be found faithful.', 'It is required in stewards that a man be found faithful (1 Corinthians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 1, 'According to 1 Corinthians 4, what is the kingdom of God not in?', '["The Kingdom of God is not in word, but in power.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The Kingdom of God is not in word, but in power.', 'The Kingdom of God is not in word, but in power (1 Corinthians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 4, what is the kingdom of God not in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 1, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["We are fools for Christ''s sake, but you are wise in Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We are fools for Christ''s sake, but you are wise in Christ.', 'We are fools for Christ''s sake, but you are wise in Christ (1 Corinthians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 1, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["We labor, working with our own hands.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We labor, working with our own hands.', 'We labor, working with our own hands (1 Corinthians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 1, 'According to 1 Corinthians 4, what does Paul say?', '["Stewards; apostles'' example","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Stewards; apostles'' example', 'Stewards; apostles'' example (1 Corinthians 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 2, 'According to 1 Corinthians 4, what does Paul say about Christ?', '["servants of Christ, and stewards of God''s mysteries","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'servants of Christ, and stewards of God''s mysteries', 'servants of Christ, and stewards of God''s mysteries (1 Corinthians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 2, 'According to 1 Corinthians 4, what does Paul say about faith?', '["required in stewards, that a man be found faithful","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'required in stewards, that a man be found faithful', 'required in stewards, that a man be found faithful (1 Corinthians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 2, 'According to 1 Corinthians 4, what does Paul say about God?', '["the Kingdom of God is not in word, but in power","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the Kingdom of God is not in word, but in power', 'the Kingdom of God is not in word, but in power (1 Corinthians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 2, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["we are fools for Christ''s sake","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'we are fools for Christ''s sake', 'we are fools for Christ''s sake (1 Corinthians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 2, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["we both hunger and thirst, and are poorly clothed","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'we both hunger and thirst, and are poorly clothed', 'we both hunger and thirst, and are poorly clothed (1 Corinthians 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 3, 'According to 1 Corinthians 4, what is the kingdom of God not in?', '["The Kingdom of God is not in word, but in power.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The Kingdom of God is not in word, but in power.', 'The Kingdom of God is not in word, but in power (1 Corinthians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 4, what is the kingdom of God not in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 3, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["We are fools for Christ''s sake, but you are wise in Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We are fools for Christ''s sake, but you are wise in Christ.', 'We are fools for Christ''s sake, but you are wise in Christ (1 Corinthians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 3, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["We labor, working with our own hands.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We labor, working with our own hands.', 'We labor, working with our own hands (1 Corinthians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 3, 'What does 1 Corinthians 4 teach?', '["Stewards; apostles'' example","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Stewards; apostles'' example', 'Stewards; apostles'' example (1 Corinthians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 4 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 3, 'What does 1 Corinthians 4 teach about faith?', '["It is required in stewards that a man be found faithful.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'It is required in stewards that a man be found faithful.', 'It is required in stewards that a man be found faithful (1 Corinthians 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 4 teach about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 4, 'Which phrase in 1 Corinthians 4 speaks about faith?', '["required in stewards, that a man be found faithful","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'required in stewards, that a man be found faithful', 'required in stewards, that a man be found faithful (1 Corinthians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 4 speaks about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 4, 'Which phrase in 1 Corinthians 4 speaks about God?', '["the Kingdom of God is not in word, but in power","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the Kingdom of God is not in word, but in power', 'the Kingdom of God is not in word, but in power (1 Corinthians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 4 speaks about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 4, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["we are fools for Christ''s sake","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'we are fools for Christ''s sake', 'we are fools for Christ''s sake (1 Corinthians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 4, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["we both hunger and thirst, and are poorly clothed","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'we both hunger and thirst, and are poorly clothed', 'we both hunger and thirst, and are poorly clothed (1 Corinthians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 4, 'Which phrase in 1 Corinthians 4 speaks about Christ?', '["servants of Christ, and stewards of God''s mysteries","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'servants of Christ, and stewards of God''s mysteries', 'servants of Christ, and stewards of God''s mysteries (1 Corinthians 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 4 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 5, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["We are fools for Christ''s sake, but you are wise in Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We are fools for Christ''s sake, but you are wise in Christ.', 'We are fools for Christ''s sake, but you are wise in Christ (1 Corinthians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 5, 'According to 1 Corinthians 4, what does Paul say ?we? do?', '["We labor, working with our own hands.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We labor, working with our own hands.', 'We labor, working with our own hands (1 Corinthians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 4, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 5, 'What major point is made in 1 Corinthians 4?', '["Stewards; apostles'' example","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Stewards; apostles'' example', 'Stewards; apostles'' example (1 Corinthians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 5, 'What major point does 1 Corinthians 4 make about faith?', '["It is required in stewards that a man be found faithful.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'It is required in stewards that a man be found faithful.', 'It is required in stewards that a man be found faithful (1 Corinthians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 4 make about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 4, 5, 'According to 1 Corinthians 4, what is the kingdom of God not in?', '["The Kingdom of God is not in word, but in power.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The Kingdom of God is not in word, but in power.', 'The Kingdom of God is not in word, but in power (1 Corinthians 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 4, what is the kingdom of God not in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 1, 'According to 1 Corinthians 5, what sin had been reported among the Corinthians?', '["It is actually reported that there is sexual immorality among you.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'It is actually reported that there is sexual immorality among you.', 'It is actually reported that there is sexual immorality among you (1 Corinthians 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 5, what sin had been reported among the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 1, 'According to 1 Corinthians 5, what did Paul tell the church to do with the wicked man?', '["Remove the wicked man from among yourselves.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Remove the wicked man from among yourselves.', 'Remove the wicked man from among yourselves (1 Corinthians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 5, what did Paul tell the church to do with the wicked man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 1, 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?', '["Don''t you know that a little yeast leavens the whole lump?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t you know that a little yeast leavens the whole lump?', 'Don''t you know that a little yeast leavens the whole lump? (1 Corinthians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 1, 'According to 1 Corinthians 5, who does Paul say has been sacrificed for us?', '["Christ our Passover has been sacrificed for us.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Christ our Passover has been sacrificed for us.', 'Christ our Passover has been sacrificed for us (1 Corinthians 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 5, who does Paul say has been sacrificed for us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 1, 'According to 1 Corinthians 5, whom does Paul say he is not judging?', '["For what do I have to do with also judging those who are outside?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For what do I have to do with also judging those who are outside?', 'For what do I have to do with also judging those who are outside? (1 Corinthians 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 5, whom does Paul say he is not judging?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 2, 'According to 1 Corinthians 5, what does Paul say?', '["It is actually reported that there is sexual immorality among you","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'It is actually reported that there is sexual immorality among you', 'It is actually reported that there is sexual immorality among you (1 Corinthians 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 5, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 2, 'According to 1 Corinthians 5, what does Paul say?', '["Remove the wicked man from among yourselves","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Remove the wicked man from among yourselves', 'Remove the wicked man from among yourselves (1 Corinthians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 5, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 2, 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?', '["Don''t you know that a little yeast leavens the whole lump?","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Don''t you know that a little yeast leavens the whole lump?', 'Don''t you know that a little yeast leavens the whole lump? (1 Corinthians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 2, 'According to 1 Corinthians 5, what does Paul say about Christ?', '["For indeed Christ, our Passover, has been sacrificed for us","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'For indeed Christ, our Passover, has been sacrificed for us', 'For indeed Christ, our Passover, has been sacrificed for us (1 Corinthians 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 5, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 2, 'According to 1 Corinthians 5, what does Paul say about God?', '["those who are outside, God judges","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'those who are outside, God judges', 'those who are outside, God judges (1 Corinthians 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 5, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 3, 'According to 1 Corinthians 5, what did Paul tell the church to do with the wicked man?', '["Remove the wicked man from among yourselves.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Remove the wicked man from among yourselves.', 'Remove the wicked man from among yourselves (1 Corinthians 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 5, what did Paul tell the church to do with the wicked man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 3, 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?', '["Don''t you know that a little yeast leavens the whole lump?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t you know that a little yeast leavens the whole lump?', 'Don''t you know that a little yeast leavens the whole lump? (1 Corinthians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 3, 'According to 1 Corinthians 5, who does Paul say has been sacrificed for us?', '["Christ our Passover has been sacrificed for us.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Christ our Passover has been sacrificed for us.', 'Christ our Passover has been sacrificed for us (1 Corinthians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 5, who does Paul say has been sacrificed for us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 3, 'According to 1 Corinthians 5, whom does Paul say he is not judging?', '["For what do I have to do with also judging those who are outside?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For what do I have to do with also judging those who are outside?', 'For what do I have to do with also judging those who are outside? (1 Corinthians 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 5, whom does Paul say he is not judging?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 3, 'According to 1 Corinthians 5, what sin had been reported among the Corinthians?', '["It is actually reported that there is sexual immorality among you.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'It is actually reported that there is sexual immorality among you.', 'It is actually reported that there is sexual immorality among you (1 Corinthians 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 5, what sin had been reported among the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 4, 'Which phrase belongs in 1 Corinthians 5?', '["Remove the wicked man from among yourselves","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Remove the wicked man from among yourselves', 'Remove the wicked man from among yourselves (1 Corinthians 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 4, 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?', '["Don''t you know that a little yeast leavens the whole lump?","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Don''t you know that a little yeast leavens the whole lump?', 'Don''t you know that a little yeast leavens the whole lump? (1 Corinthians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 4, 'Which phrase in 1 Corinthians 5 speaks about Christ?', '["For indeed Christ, our Passover, has been sacrificed for us","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'For indeed Christ, our Passover, has been sacrificed for us', 'For indeed Christ, our Passover, has been sacrificed for us (1 Corinthians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 5 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 4, 'Which phrase in 1 Corinthians 5 speaks about God?', '["those who are outside, God judges","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'those who are outside, God judges', 'those who are outside, God judges (1 Corinthians 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 5 speaks about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 4, 'Which phrase belongs in 1 Corinthians 5?', '["It is actually reported that there is sexual immorality among you","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'It is actually reported that there is sexual immorality among you', 'It is actually reported that there is sexual immorality among you (1 Corinthians 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 5, 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?', '["Don''t you know that a little yeast leavens the whole lump?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t you know that a little yeast leavens the whole lump?', 'Don''t you know that a little yeast leavens the whole lump? (1 Corinthians 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 5, Don''t you know that a little yeast leavens the whole lump?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 5, 'According to 1 Corinthians 5, who does Paul say has been sacrificed for us?', '["Christ our Passover has been sacrificed for us.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Christ our Passover has been sacrificed for us.', 'Christ our Passover has been sacrificed for us (1 Corinthians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 5, who does Paul say has been sacrificed for us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 5, 'According to 1 Corinthians 5, whom does Paul say he is not judging?', '["For what do I have to do with also judging those who are outside?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For what do I have to do with also judging those who are outside?', 'For what do I have to do with also judging those who are outside? (1 Corinthians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 5, whom does Paul say he is not judging?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 5, 'According to 1 Corinthians 5, what sin had been reported among the Corinthians?', '["It is actually reported that there is sexual immorality among you.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'It is actually reported that there is sexual immorality among you.', 'It is actually reported that there is sexual immorality among you (1 Corinthians 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 5, what sin had been reported among the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 5, 5, 'According to 1 Corinthians 5, what did Paul tell the church to do with the wicked man?', '["Remove the wicked man from among yourselves.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Remove the wicked man from among yourselves.', 'Remove the wicked man from among yourselves (1 Corinthians 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 5, what did Paul tell the church to do with the wicked man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 1, 'According to 1 Corinthians 6, before whom were some believers taking their cases?', '["Dare any of you go to law before the unrighteous?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Dare any of you go to law before the unrighteous?', 'Dare any of you go to law before the unrighteous? (1 Corinthians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 6, before whom were some believers taking their cases?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 1, 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?', '["Don''t you know that the saints will judge the world?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t you know that the saints will judge the world?', 'Don''t you know that the saints will judge the world? (1 Corinthians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 1, 'According to 1 Corinthians 6, what does Paul say about God?', '["The unrighteous will not inherit God''s Kingdom.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The unrighteous will not inherit God''s Kingdom.', 'The unrighteous will not inherit God''s Kingdom (1 Corinthians 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 6, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 1, 'According to 1 Corinthians 6, what does Paul say about Christ?', '["Your bodies are members of Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Your bodies are members of Christ.', 'Your bodies are members of Christ (1 Corinthians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 6, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 1, 'According to 1 Corinthians 6, what is the believer?s body called?', '["Your body is a temple of the Holy Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Your body is a temple of the Holy Spirit.', 'Your body is a temple of the Holy Spirit (1 Corinthians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 6, what is the believer?s body called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 2, 'According to 1 Corinthians 6, what does Paul say?', '["Dare any of you, having a matter against his neighbor","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Dare any of you, having a matter against his neighbor', 'Dare any of you, having a matter against his neighbor (1 Corinthians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 6, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 2, 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?', '["Don''t you know that the saints will judge the world?","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Don''t you know that the saints will judge the world?', 'Don''t you know that the saints will judge the world? (1 Corinthians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 2, 'According to 1 Corinthians 6, what does Paul say about God?', '["the unrighteous will not inherit God''s Kingdom","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the unrighteous will not inherit God''s Kingdom', 'the unrighteous will not inherit God''s Kingdom (1 Corinthians 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 6, what does Paul say about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 2, 'According to 1 Corinthians 6, what does Paul say about Christ?', '["your bodies are members of Christ","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'your bodies are members of Christ', 'your bodies are members of Christ (1 Corinthians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 6, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 2, 'According to 1 Corinthians 6, what does Paul say about the Spirit?', '["your body is a temple of the Holy Spirit","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'your body is a temple of the Holy Spirit', 'your body is a temple of the Holy Spirit (1 Corinthians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 6, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 3, 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?', '["Don''t you know that the saints will judge the world?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t you know that the saints will judge the world?', 'Don''t you know that the saints will judge the world? (1 Corinthians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 3, 'What does 1 Corinthians 6 teach about God?', '["The unrighteous will not inherit God''s Kingdom.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The unrighteous will not inherit God''s Kingdom.', 'The unrighteous will not inherit God''s Kingdom (1 Corinthians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 6 teach about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 3, 'What does 1 Corinthians 6 teach about Christ?', '["Your bodies are members of Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Your bodies are members of Christ.', 'Your bodies are members of Christ (1 Corinthians 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 6 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 3, 'According to 1 Corinthians 6, what is the believer?s body called?', '["Your body is a temple of the Holy Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Your body is a temple of the Holy Spirit.', 'Your body is a temple of the Holy Spirit (1 Corinthians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 6, what is the believer?s body called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 3, 'According to 1 Corinthians 6, before whom were some believers taking their cases?', '["Dare any of you go to law before the unrighteous?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Dare any of you go to law before the unrighteous?', 'Dare any of you go to law before the unrighteous? (1 Corinthians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 6, before whom were some believers taking their cases?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 4, 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?', '["Don''t you know that the saints will judge the world?","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Don''t you know that the saints will judge the world?', 'Don''t you know that the saints will judge the world? (1 Corinthians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 4, 'Which phrase in 1 Corinthians 6 speaks about God?', '["the unrighteous will not inherit God''s Kingdom","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the unrighteous will not inherit God''s Kingdom', 'the unrighteous will not inherit God''s Kingdom (1 Corinthians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 6 speaks about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 4, 'Which phrase in 1 Corinthians 6 speaks about Christ?', '["your bodies are members of Christ","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'your bodies are members of Christ', 'your bodies are members of Christ (1 Corinthians 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 6 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 4, 'Which phrase in 1 Corinthians 6 speaks about the Spirit?', '["your body is a temple of the Holy Spirit","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'your body is a temple of the Holy Spirit', 'your body is a temple of the Holy Spirit (1 Corinthians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 6 speaks about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 4, 'Which phrase belongs in 1 Corinthians 6?', '["Dare any of you, having a matter against his neighbor","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Dare any of you, having a matter against his neighbor', 'Dare any of you, having a matter against his neighbor (1 Corinthians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 5, 'What major point does 1 Corinthians 6 make about God?', '["The unrighteous will not inherit God''s Kingdom.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The unrighteous will not inherit God''s Kingdom.', 'The unrighteous will not inherit God''s Kingdom (1 Corinthians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 6 make about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 5, 'What major point does 1 Corinthians 6 make about Christ?', '["Your bodies are members of Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Your bodies are members of Christ.', 'Your bodies are members of Christ (1 Corinthians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 6 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 5, 'According to 1 Corinthians 6, what is the believer?s body called?', '["Your body is a temple of the Holy Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Your body is a temple of the Holy Spirit.', 'Your body is a temple of the Holy Spirit (1 Corinthians 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 6, what is the believer?s body called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 5, 'According to 1 Corinthians 6, before whom were some believers taking their cases?', '["Dare any of you go to law before the unrighteous?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Dare any of you go to law before the unrighteous?', 'Dare any of you go to law before the unrighteous? (1 Corinthians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 6, before whom were some believers taking their cases?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 6, 5, 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?', '["Don''t you know that the saints will judge the world?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t you know that the saints will judge the world?', 'Don''t you know that the saints will judge the world? (1 Corinthians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 6, Don''t you know that the saints will judge the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 1, 'According to 1 Corinthians 7, what does Paul say a husband should render to his wife?', '["Let the husband render to his wife the affection owed her.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let the husband render to his wife the affection owed her.', 'Let the husband render to his wife the affection owed her (1 Corinthians 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say a husband should render to his wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 1, 'According to 1 Corinthians 7, what does Paul say?', '["Don''t deprive one another, unless by consent for a season.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t deprive one another, unless by consent for a season.', 'Don''t deprive one another, unless by consent for a season (1 Corinthians 7:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 1, 'According to 1 Corinthians 7, what does the unmarried person care about?', '["He who is unmarried cares about the things of the Lord.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'He who is unmarried cares about the things of the Lord.', 'He who is unmarried cares about the things of the Lord (1 Corinthians 7:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 7, what does the unmarried person care about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 1, 'According to 1 Corinthians 7, what did Paul say he wished about others?', '["I wish all men were like me.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I wish all men were like me.', 'I wish all men were like me (1 Corinthians 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 7, what did Paul say he wished about others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 1, 'According to 1 Corinthians 7, what does Paul say about an unbelieving husband with a believing wife?', '["The unbelieving husband is sanctified in the wife.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The unbelieving husband is sanctified in the wife.', 'The unbelieving husband is sanctified in the wife (1 Corinthians 7:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say about an unbelieving husband with a believing wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 2, 'According to 1 Corinthians 7, what instruction is given?', '["Let each man have his own wife","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Let each man have his own wife', 'Let each man have his own wife (1 Corinthians 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 7, what instruction is given?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 2, 'According to 1 Corinthians 7, what does Paul say?', '["The husband should give to his wife her conjugal rights","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The husband should give to his wife her conjugal rights', 'The husband should give to his wife her conjugal rights (1 Corinthians 7:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 2, 'According to 1 Corinthians 7, what does Paul say?', '["Don''t deprive one another","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Don''t deprive one another', 'Don''t deprive one another (1 Corinthians 7:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 2, 'According to 1 Corinthians 7, what does Paul say?', '["He who is unmarried cares about the things of the Lord","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'He who is unmarried cares about the things of the Lord', 'He who is unmarried cares about the things of the Lord (1 Corinthians 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 2, 'According to 1 Corinthians 7, what does Paul say?', '["The unbelieving husband is sanctified in the wife","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The unbelieving husband is sanctified in the wife', 'The unbelieving husband is sanctified in the wife (1 Corinthians 7:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 3, 'What does 1 Corinthians 7 teach?', '["Don''t deprive one another, unless by consent for a season.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t deprive one another, unless by consent for a season.', 'Don''t deprive one another, unless by consent for a season (1 Corinthians 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 7 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 3, 'According to 1 Corinthians 7, what does the unmarried person care about?', '["He who is unmarried cares about the things of the Lord.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'He who is unmarried cares about the things of the Lord.', 'He who is unmarried cares about the things of the Lord (1 Corinthians 7:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 7, what does the unmarried person care about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 3, 'According to 1 Corinthians 7, what did Paul say he wished about others?', '["I wish all men were like me.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I wish all men were like me.', 'I wish all men were like me (1 Corinthians 7:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 7, what did Paul say he wished about others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 3, 'According to 1 Corinthians 7, what does Paul say about an unbelieving husband with a believing wife?', '["The unbelieving husband is sanctified in the wife.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The unbelieving husband is sanctified in the wife.', 'The unbelieving husband is sanctified in the wife (1 Corinthians 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say about an unbelieving husband with a believing wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 3, 'According to 1 Corinthians 7, what does Paul say a husband should render to his wife?', '["Let the husband render to his wife the affection owed her.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let the husband render to his wife the affection owed her.', 'Let the husband render to his wife the affection owed her (1 Corinthians 7:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say a husband should render to his wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 4, 'Which phrase belongs in 1 Corinthians 7?', '["The husband should give to his wife her conjugal rights","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The husband should give to his wife her conjugal rights', 'The husband should give to his wife her conjugal rights (1 Corinthians 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 4, 'Which phrase belongs in 1 Corinthians 7?', '["Don''t deprive one another","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Don''t deprive one another', 'Don''t deprive one another (1 Corinthians 7:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 4, 'Which phrase belongs in 1 Corinthians 7?', '["He who is unmarried cares about the things of the Lord","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'He who is unmarried cares about the things of the Lord', 'He who is unmarried cares about the things of the Lord (1 Corinthians 7:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 4, 'Which phrase belongs in 1 Corinthians 7?', '["The unbelieving husband is sanctified in the wife","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The unbelieving husband is sanctified in the wife', 'The unbelieving husband is sanctified in the wife (1 Corinthians 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 4, 'According to 1 Corinthians 7, what instruction is given?', '["Let each man have his own wife","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Let each man have his own wife', 'Let each man have his own wife (1 Corinthians 7:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 7, what instruction is given?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 5, 'According to 1 Corinthians 7, what does the unmarried person care about?', '["He who is unmarried cares about the things of the Lord.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'He who is unmarried cares about the things of the Lord.', 'He who is unmarried cares about the things of the Lord (1 Corinthians 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 7, what does the unmarried person care about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 5, 'According to 1 Corinthians 7, what did Paul say he wished about others?', '["I wish all men were like me.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I wish all men were like me.', 'I wish all men were like me (1 Corinthians 7:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 7, what did Paul say he wished about others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 5, 'According to 1 Corinthians 7, what does Paul say about an unbelieving husband with a believing wife?', '["The unbelieving husband is sanctified in the wife.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The unbelieving husband is sanctified in the wife.', 'The unbelieving husband is sanctified in the wife (1 Corinthians 7:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say about an unbelieving husband with a believing wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 5, 'According to 1 Corinthians 7, what does Paul say a husband should render to his wife?', '["Let the husband render to his wife the affection owed her.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let the husband render to his wife the affection owed her.', 'Let the husband render to his wife the affection owed her (1 Corinthians 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 7, what does Paul say a husband should render to his wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 7, 5, 'What major point is made in 1 Corinthians 7?', '["Don''t deprive one another, unless by consent for a season.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Don''t deprive one another, unless by consent for a season.', 'Don''t deprive one another, unless by consent for a season (1 Corinthians 7:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 1, 'According to 1 Corinthians 8, what does Paul say knowledge does?', '["Knowledge puffs up, but love builds up.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Knowledge puffs up, but love builds up.', 'Knowledge puffs up, but love builds up (1 Corinthians 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say knowledge does?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 1, 'According to 1 Corinthians 8, what does Paul say ?we? do?', '["We know that we all have knowledge.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We know that we all have knowledge.', 'We know that we all have knowledge (1 Corinthians 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 1, 'According to 1 Corinthians 8, what does Paul say?', '["An idol is nothing in the world.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'An idol is nothing in the world.', 'An idol is nothing in the world (1 Corinthians 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 1, 'According to 1 Corinthians 8, what does Paul say?', '["Through your knowledge he who is weak perishes.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Through your knowledge he who is weak perishes.', 'Through your knowledge he who is weak perishes (1 Corinthians 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 1, 'According to 1 Corinthians 8, what does Paul say?', '["If food causes my brother to stumble, I will eat no meat forevermore.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If food causes my brother to stumble, I will eat no meat forevermore.', 'If food causes my brother to stumble, I will eat no meat forevermore (1 Corinthians 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 2, 'According to 1 Corinthians 8, what does Paul say about love?', '["Knowledge puffs up, but love builds up","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Knowledge puffs up, but love builds up', 'Knowledge puffs up, but love builds up (1 Corinthians 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 2, 'According to 1 Corinthians 8, what does Paul say ?we? do?', '["we know that we all have knowledge","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'we know that we all have knowledge', 'we know that we all have knowledge (1 Corinthians 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 2, 'According to 1 Corinthians 8, what does Paul say there is?', '["there is no God but one","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'there is no God but one', 'there is no God but one (1 Corinthians 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say there is?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 2, 'According to 1 Corinthians 8, what does Paul say?', '["through your knowledge, he who is weak perishes","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'through your knowledge, he who is weak perishes', 'through your knowledge, he who is weak perishes (1 Corinthians 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 2, 'According to 1 Corinthians 8, what does Paul say?', '["if food causes my brother to stumble, I will eat no meat forevermore","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'if food causes my brother to stumble, I will eat no meat forevermore', 'if food causes my brother to stumble, I will eat no meat forevermore (1 Corinthians 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 3, 'According to 1 Corinthians 8, what does Paul say ?we? do?', '["We know that we all have knowledge.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We know that we all have knowledge.', 'We know that we all have knowledge (1 Corinthians 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 3, 'What does 1 Corinthians 8 teach?', '["An idol is nothing in the world.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'An idol is nothing in the world.', 'An idol is nothing in the world (1 Corinthians 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 8 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 3, 'What does 1 Corinthians 8 teach?', '["Through your knowledge he who is weak perishes.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Through your knowledge he who is weak perishes.', 'Through your knowledge he who is weak perishes (1 Corinthians 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 8 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 3, 'What does 1 Corinthians 8 teach?', '["If food causes my brother to stumble, I will eat no meat forevermore.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If food causes my brother to stumble, I will eat no meat forevermore.', 'If food causes my brother to stumble, I will eat no meat forevermore (1 Corinthians 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 8 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 3, 'According to 1 Corinthians 8, what does Paul say knowledge does?', '["Knowledge puffs up, but love builds up.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Knowledge puffs up, but love builds up.', 'Knowledge puffs up, but love builds up (1 Corinthians 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say knowledge does?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 4, 'According to 1 Corinthians 8, what does Paul say ?we? do?', '["we know that we all have knowledge","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'we know that we all have knowledge', 'we know that we all have knowledge (1 Corinthians 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 4, 'According to 1 Corinthians 8, what does Paul say there is?', '["there is no God but one","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'there is no God but one', 'there is no God but one (1 Corinthians 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say there is?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 4, 'Which phrase belongs in 1 Corinthians 8?', '["through your knowledge, he who is weak perishes","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'through your knowledge, he who is weak perishes', 'through your knowledge, he who is weak perishes (1 Corinthians 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 4, 'Which phrase belongs in 1 Corinthians 8?', '["if food causes my brother to stumble, I will eat no meat forevermore","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'if food causes my brother to stumble, I will eat no meat forevermore', 'if food causes my brother to stumble, I will eat no meat forevermore (1 Corinthians 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 4, 'Which phrase in 1 Corinthians 8 speaks about love?', '["Knowledge puffs up, but love builds up","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Knowledge puffs up, but love builds up', 'Knowledge puffs up, but love builds up (1 Corinthians 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 8 speaks about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 5, 'What major point is made in 1 Corinthians 8?', '["An idol is nothing in the world.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'An idol is nothing in the world.', 'An idol is nothing in the world (1 Corinthians 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 5, 'What major point is made in 1 Corinthians 8?', '["Through your knowledge he who is weak perishes.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Through your knowledge he who is weak perishes.', 'Through your knowledge he who is weak perishes (1 Corinthians 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 5, 'What major point is made in 1 Corinthians 8?', '["If food causes my brother to stumble, I will eat no meat forevermore.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If food causes my brother to stumble, I will eat no meat forevermore.', 'If food causes my brother to stumble, I will eat no meat forevermore (1 Corinthians 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 5, 'According to 1 Corinthians 8, what does Paul say knowledge does?', '["Knowledge puffs up, but love builds up.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Knowledge puffs up, but love builds up.', 'Knowledge puffs up, but love builds up (1 Corinthians 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say knowledge does?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 8, 5, 'According to 1 Corinthians 8, what does Paul say ?we? do?', '["We know that we all have knowledge.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'We know that we all have knowledge.', 'We know that we all have knowledge (1 Corinthians 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 8, what does Paul say ?we? do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 1, 'According to 1 Corinthians 9, what two questions does Paul ask about himself?', '["Am I not free? Am I not an apostle?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Am I not free? Am I not an apostle?', 'Am I not free? Am I not an apostle? (1 Corinthians 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 9, what two questions does Paul ask about himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 1, 'According to 1 Corinthians 9, what does Paul say ministers may rightly receive?', '["If we sowed to you spiritual things, is it a great thing if we reap your fleshly things?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If we sowed to you spiritual things, is it a great thing if we reap your fleshly things?', 'If we sowed to you spiritual things, is it a great thing if we reap your fleshly things? (1 Corinthians 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say ministers may rightly receive?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 1, 'According to 1 Corinthians 9, what does Paul say?', '["I robbed other assemblies, taking wages from them.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I robbed other assemblies, taking wages from them.', 'I robbed other assemblies, taking wages from them (1 Corinthians 9:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 1, 'According to 1 Corinthians 9, what does Paul say?', '["Woe is to me if I don''t preach the Good News!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Woe is to me if I don''t preach the Good News!', 'Woe is to me if I don''t preach the Good News! (1 Corinthians 9:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 1, 'According to 1 Corinthians 9, what does Paul say about the body?', '["I discipline my body and bring it into submission.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I discipline my body and bring it into submission.', 'I discipline my body and bring it into submission (1 Corinthians 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 2, 'According to 1 Corinthians 9, what two questions does Paul ask about himself?', '["Am I not free? Am I not an apostle?","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Am I not free? Am I not an apostle?', 'Am I not free? Am I not an apostle? (1 Corinthians 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 9, what two questions does Paul ask about himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 2, 'According to 1 Corinthians 9, what does Paul say about the Spirit?', '["If we sowed to you spiritual things","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'If we sowed to you spiritual things', 'If we sowed to you spiritual things (1 Corinthians 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 2, 'According to 1 Corinthians 9, what does Paul say?', '["I robbed other assemblies","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I robbed other assemblies', 'I robbed other assemblies (1 Corinthians 9:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 2, 'According to 1 Corinthians 9, what does Paul say?', '["Woe is to me if I don''t preach the Good News!","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Woe is to me if I don''t preach the Good News!', 'Woe is to me if I don''t preach the Good News! (1 Corinthians 9:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 2, 'According to 1 Corinthians 9, what does Paul say?', '["I run, therefore, in such a way","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I run, therefore, in such a way', 'I run, therefore, in such a way (1 Corinthians 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 3, 'According to 1 Corinthians 9, what does Paul say ministers may rightly receive?', '["If we sowed to you spiritual things, is it a great thing if we reap your fleshly things?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If we sowed to you spiritual things, is it a great thing if we reap your fleshly things?', 'If we sowed to you spiritual things, is it a great thing if we reap your fleshly things? (1 Corinthians 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say ministers may rightly receive?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 3, 'What does 1 Corinthians 9 teach?', '["I robbed other assemblies, taking wages from them.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I robbed other assemblies, taking wages from them.', 'I robbed other assemblies, taking wages from them (1 Corinthians 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 9 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 3, 'What does 1 Corinthians 9 teach?', '["Woe is to me if I don''t preach the Good News!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Woe is to me if I don''t preach the Good News!', 'Woe is to me if I don''t preach the Good News! (1 Corinthians 9:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 9 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 3, 'What does 1 Corinthians 9 teach about the body?', '["I discipline my body and bring it into submission.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I discipline my body and bring it into submission.', 'I discipline my body and bring it into submission (1 Corinthians 9:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 9 teach about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 3, 'According to 1 Corinthians 9, what two questions does Paul ask about himself?', '["Am I not free? Am I not an apostle?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Am I not free? Am I not an apostle?', 'Am I not free? Am I not an apostle? (1 Corinthians 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 9, what two questions does Paul ask about himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 4, 'Which phrase in 1 Corinthians 9 speaks about the Spirit?', '["If we sowed to you spiritual things","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'If we sowed to you spiritual things', 'If we sowed to you spiritual things (1 Corinthians 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 9 speaks about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 4, 'Which phrase belongs in 1 Corinthians 9?', '["I robbed other assemblies","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I robbed other assemblies', 'I robbed other assemblies (1 Corinthians 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 4, 'Which phrase belongs in 1 Corinthians 9?', '["Woe is to me if I don''t preach the Good News!","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Woe is to me if I don''t preach the Good News!', 'Woe is to me if I don''t preach the Good News! (1 Corinthians 9:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 4, 'Which phrase belongs in 1 Corinthians 9?', '["I run, therefore, in such a way","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I run, therefore, in such a way', 'I run, therefore, in such a way (1 Corinthians 9:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 4, 'Which phrase in 1 Corinthians 9 speaks about the body?', '["I discipline my body","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'I discipline my body', 'I discipline my body (1 Corinthians 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 9 speaks about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 5, 'What major point is made in 1 Corinthians 9?', '["I robbed other assemblies, taking wages from them.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I robbed other assemblies, taking wages from them.', 'I robbed other assemblies, taking wages from them (1 Corinthians 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 5, 'What major point is made in 1 Corinthians 9?', '["Woe is to me if I don''t preach the Good News!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Woe is to me if I don''t preach the Good News!', 'Woe is to me if I don''t preach the Good News! (1 Corinthians 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 5, 'What major point does 1 Corinthians 9 make about the body?', '["I discipline my body and bring it into submission.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'I discipline my body and bring it into submission.', 'I discipline my body and bring it into submission (1 Corinthians 9:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 9 make about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 5, 'According to 1 Corinthians 9, what two questions does Paul ask about himself?', '["Am I not free? Am I not an apostle?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Am I not free? Am I not an apostle?', 'Am I not free? Am I not an apostle? (1 Corinthians 9:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 9, what two questions does Paul ask about himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 9, 5, 'According to 1 Corinthians 9, what does Paul say ministers may rightly receive?', '["If we sowed to you spiritual things, is it a great thing if we reap your fleshly things?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If we sowed to you spiritual things, is it a great thing if we reap your fleshly things?', 'If we sowed to you spiritual things, is it a great thing if we reap your fleshly things? (1 Corinthians 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 9, what does Paul say ministers may rightly receive?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 1, 'According to 1 Corinthians 10, what were Israel?s experiences for believers?', '["Now these things were our examples.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now these things were our examples.', 'Now these things were our examples (1 Corinthians 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 10, what were Israel?s experiences for believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 1, 'According to 1 Corinthians 10, who does Paul say the rock was?', '["That Rock was Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'That Rock was Christ.', 'That Rock was Christ (1 Corinthians 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 10, who does Paul say the rock was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 1, 'According to 1 Corinthians 10, what does Paul tell believers to flee from?', '["Flee from idolatry!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Flee from idolatry!', 'Flee from idolatry! (1 Corinthians 10:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul tell believers to flee from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 1, 'According to 1 Corinthians 10, The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?', '["The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?', 'The cup of blessing which we bless, isn''t it a sharing of the blood of Christ? (1 Corinthians 10:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 10, The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 1, 'According to 1 Corinthians 10, whose good should each person seek?', '["Let no one seek his own good, but the good of his neighbor.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let no one seek his own good, but the good of his neighbor.', 'Let no one seek his own good, but the good of his neighbor (1 Corinthians 10:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 10, whose good should each person seek?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 2, 'According to 1 Corinthians 10, what does Paul say?', '["Now these things were our examples","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Now these things were our examples', 'Now these things were our examples (1 Corinthians 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 2, 'According to 1 Corinthians 10, what does Paul say about Christ?', '["that Rock was Christ","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'that Rock was Christ', 'that Rock was Christ (1 Corinthians 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 2, 'According to 1 Corinthians 10, what does Paul say?', '["Therefore let him who thinks he stands be careful","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Therefore let him who thinks he stands be careful', 'Therefore let him who thinks he stands be careful (1 Corinthians 10:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 2, 'According to 1 Corinthians 10, what does Paul tell believers to flee from?', '["Flee from idolatry!","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Flee from idolatry!', 'Flee from idolatry! (1 Corinthians 10:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul tell believers to flee from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 2, 'According to 1 Corinthians 10, what does Paul say?', '["The cup of blessing which we bless","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The cup of blessing which we bless', 'The cup of blessing which we bless (1 Corinthians 10:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 3, 'According to 1 Corinthians 10, who does Paul say the rock was?', '["That Rock was Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'That Rock was Christ.', 'That Rock was Christ (1 Corinthians 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 10, who does Paul say the rock was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 3, 'According to 1 Corinthians 10, what does Paul tell believers to flee from?', '["Flee from idolatry!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Flee from idolatry!', 'Flee from idolatry! (1 Corinthians 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul tell believers to flee from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 3, 'According to 1 Corinthians 10, The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?', '["The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?', 'The cup of blessing which we bless, isn''t it a sharing of the blood of Christ? (1 Corinthians 10:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 10, The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 3, 'According to 1 Corinthians 10, whose good should each person seek?', '["Let no one seek his own good, but the good of his neighbor.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let no one seek his own good, but the good of his neighbor.', 'Let no one seek his own good, but the good of his neighbor (1 Corinthians 10:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 10, whose good should each person seek?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 3, 'According to 1 Corinthians 10, what were Israel?s experiences for believers?', '["Now these things were our examples.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now these things were our examples.', 'Now these things were our examples (1 Corinthians 10:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 10, what were Israel?s experiences for believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 4, 'Which phrase in 1 Corinthians 10 speaks about Christ?', '["that Rock was Christ","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'that Rock was Christ', 'that Rock was Christ (1 Corinthians 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 10 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 4, 'Which phrase belongs in 1 Corinthians 10?', '["Therefore let him who thinks he stands be careful","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Therefore let him who thinks he stands be careful', 'Therefore let him who thinks he stands be careful (1 Corinthians 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 4, 'According to 1 Corinthians 10, what does Paul tell believers to flee from?', '["Flee from idolatry!","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Flee from idolatry!', 'Flee from idolatry! (1 Corinthians 10:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul tell believers to flee from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 4, 'Which phrase belongs in 1 Corinthians 10?', '["The cup of blessing which we bless","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The cup of blessing which we bless', 'The cup of blessing which we bless (1 Corinthians 10:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 4, 'Which phrase in 1 Corinthians 10 speaks about the law?', '["All things are lawful for me, but all things don''t edify","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'All things are lawful for me, but all things don''t edify', 'All things are lawful for me, but all things don''t edify (1 Corinthians 10:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 10 speaks about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 5, 'According to 1 Corinthians 10, what does Paul tell believers to flee from?', '["Flee from idolatry!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Flee from idolatry!', 'Flee from idolatry! (1 Corinthians 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 10, what does Paul tell believers to flee from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 5, 'According to 1 Corinthians 10, The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?', '["The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?', 'The cup of blessing which we bless, isn''t it a sharing of the blood of Christ? (1 Corinthians 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 10, The cup of blessing which we bless, isn''t it a sharing of the blood of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 5, 'According to 1 Corinthians 10, whose good should each person seek?', '["Let no one seek his own good, but the good of his neighbor.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let no one seek his own good, but the good of his neighbor.', 'Let no one seek his own good, but the good of his neighbor (1 Corinthians 10:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 10, whose good should each person seek?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 5, 'According to 1 Corinthians 10, what were Israel?s experiences for believers?', '["Now these things were our examples.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now these things were our examples.', 'Now these things were our examples (1 Corinthians 10:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 10, what were Israel?s experiences for believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 10, 5, 'According to 1 Corinthians 10, who does Paul say the rock was?', '["That Rock was Christ.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'That Rock was Christ.', 'That Rock was Christ (1 Corinthians 10:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 10, who does Paul say the rock was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 1, 'According to 1 Corinthians 11, what does Paul say about Christ?', '["The head of every man is Christ, and the head of the woman is the man.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The head of every man is Christ, and the head of the woman is the man.', 'The head of every man is Christ, and the head of the woman is the man (1 Corinthians 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 1, 'According to 1 Corinthians 11, what does Paul say?', '["For this cause the woman ought to have authority on her head.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For this cause the woman ought to have authority on her head.', 'For this cause the woman ought to have authority on her head (1 Corinthians 11:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 1, 'According to 1 Corinthians 11, what does Paul say?', '["The Lord Jesus on the night in which he was betrayed took bread.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The Lord Jesus on the night in which he was betrayed took bread.', 'The Lord Jesus on the night in which he was betrayed took bread (1 Corinthians 11:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 1, 'According to 1 Corinthians 11, what does Paul say?', '["For he who eats and drinks in an unworthy way eats and drinks judgment to himself.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For he who eats and drinks in an unworthy way eats and drinks judgment to himself.', 'For he who eats and drinks in an unworthy way eats and drinks judgment to himself (1 Corinthians 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 1, 'According to 1 Corinthians 11, what does Paul say?', '["If we discerned ourselves, we wouldn''t be judged.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If we discerned ourselves, we wouldn''t be judged.', 'If we discerned ourselves, we wouldn''t be judged (1 Corinthians 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 2, 'According to 1 Corinthians 11, what does Paul say about Christ?', '["the head of every man is Christ","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the head of every man is Christ', 'the head of every man is Christ (1 Corinthians 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 2, 'According to 1 Corinthians 11, what does Paul say?', '["the woman ought to have authority on her head","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the woman ought to have authority on her head', 'the woman ought to have authority on her head (1 Corinthians 11:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 2, 'According to 1 Corinthians 11, what does Paul say?', '["the Lord Jesus on the night in which he was betrayed","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the Lord Jesus on the night in which he was betrayed', 'the Lord Jesus on the night in which he was betrayed (1 Corinthians 11:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 2, 'According to 1 Corinthians 11, what does Paul say about the body?', '["This is my body, which is for you","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'This is my body, which is for you', 'This is my body, which is for you (1 Corinthians 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 2, 'According to 1 Corinthians 11, what does Paul say?', '["he who eats and drinks in an unworthy way","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he who eats and drinks in an unworthy way', 'he who eats and drinks in an unworthy way (1 Corinthians 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 11, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 3, 'What does 1 Corinthians 11 teach?', '["For this cause the woman ought to have authority on her head.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For this cause the woman ought to have authority on her head.', 'For this cause the woman ought to have authority on her head (1 Corinthians 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 11 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 3, 'What does 1 Corinthians 11 teach?', '["The Lord Jesus on the night in which he was betrayed took bread.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The Lord Jesus on the night in which he was betrayed took bread.', 'The Lord Jesus on the night in which he was betrayed took bread (1 Corinthians 11:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 11 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 3, 'What does 1 Corinthians 11 teach?', '["For he who eats and drinks in an unworthy way eats and drinks judgment to himself.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For he who eats and drinks in an unworthy way eats and drinks judgment to himself.', 'For he who eats and drinks in an unworthy way eats and drinks judgment to himself (1 Corinthians 11:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 11 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 3, 'What does 1 Corinthians 11 teach?', '["If we discerned ourselves, we wouldn''t be judged.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If we discerned ourselves, we wouldn''t be judged.', 'If we discerned ourselves, we wouldn''t be judged (1 Corinthians 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 11 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 3, 'What does 1 Corinthians 11 teach about Christ?', '["The head of every man is Christ, and the head of the woman is the man.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The head of every man is Christ, and the head of the woman is the man.', 'The head of every man is Christ, and the head of the woman is the man (1 Corinthians 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 11 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 4, 'Which phrase belongs in 1 Corinthians 11?', '["the woman ought to have authority on her head","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the woman ought to have authority on her head', 'the woman ought to have authority on her head (1 Corinthians 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 4, 'Which phrase belongs in 1 Corinthians 11?', '["the Lord Jesus on the night in which he was betrayed","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'the Lord Jesus on the night in which he was betrayed', 'the Lord Jesus on the night in which he was betrayed (1 Corinthians 11:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 4, 'Which phrase in 1 Corinthians 11 speaks about the body?', '["This is my body, which is for you","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'This is my body, which is for you', 'This is my body, which is for you (1 Corinthians 11:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 11 speaks about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 4, 'Which phrase belongs in 1 Corinthians 11?', '["he who eats and drinks in an unworthy way","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he who eats and drinks in an unworthy way', 'he who eats and drinks in an unworthy way (1 Corinthians 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 4, 'Which phrase belongs in 1 Corinthians 11?', '["if we discerned ourselves, we wouldn''t be judged","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'if we discerned ourselves, we wouldn''t be judged', 'if we discerned ourselves, we wouldn''t be judged (1 Corinthians 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 5, 'What major point is made in 1 Corinthians 11?', '["The Lord Jesus on the night in which he was betrayed took bread.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The Lord Jesus on the night in which he was betrayed took bread.', 'The Lord Jesus on the night in which he was betrayed took bread (1 Corinthians 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 5, 'What major point is made in 1 Corinthians 11?', '["For he who eats and drinks in an unworthy way eats and drinks judgment to himself.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For he who eats and drinks in an unworthy way eats and drinks judgment to himself.', 'For he who eats and drinks in an unworthy way eats and drinks judgment to himself (1 Corinthians 11:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 5, 'What major point is made in 1 Corinthians 11?', '["If we discerned ourselves, we wouldn''t be judged.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If we discerned ourselves, we wouldn''t be judged.', 'If we discerned ourselves, we wouldn''t be judged (1 Corinthians 11:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 5, 'What major point does 1 Corinthians 11 make about Christ?', '["The head of every man is Christ, and the head of the woman is the man.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The head of every man is Christ, and the head of the woman is the man.', 'The head of every man is Christ, and the head of the woman is the man (1 Corinthians 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 11 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 11, 5, 'What major point is made in 1 Corinthians 11?', '["For this cause the woman ought to have authority on her head.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For this cause the woman ought to have authority on her head.', 'For this cause the woman ought to have authority on her head (1 Corinthians 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 1, 'According to 1 Corinthians 12, what does Paul say about the Spirit?', '["No one can say, ''Jesus is Lord,'' but by the Holy Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'No one can say, ''Jesus is Lord,'' but by the Holy Spirit.', 'No one can say, ''Jesus is Lord,'' but by the Holy Spirit (1 Corinthians 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 1, 'According to 1 Corinthians 12, what does Paul say about the different workings among believers?', '["There are various kinds of workings, but the same God.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'There are various kinds of workings, but the same God.', 'There are various kinds of workings, but the same God (1 Corinthians 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say about the different workings among believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 1, 'According to 1 Corinthians 12, how does Paul describe the body?', '["For the body is not one member, but many.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For the body is not one member, but many.', 'For the body is not one member, but many (1 Corinthians 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 12, how does Paul describe the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 1, 'According to 1 Corinthians 12, what did God do for the weaker parts of the body?', '["God composed the body together, giving more abundant honor to the inferior part.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'God composed the body together, giving more abundant honor to the inferior part.', 'God composed the body together, giving more abundant honor to the inferior part (1 Corinthians 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 12, what did God do for the weaker parts of the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 1, 'According to 1 Corinthians 12, what happens when one member suffers?', '["If one member suffers, all the members suffer with it.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If one member suffers, all the members suffer with it.', 'If one member suffers, all the members suffer with it (1 Corinthians 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 12, what happens when one member suffers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 2, 'According to 1 Corinthians 12, what does Paul say about the Spirit?', '["no one can say, ''Jesus is Lord,'' but by the Holy Spirit","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'no one can say, ''Jesus is Lord,'' but by the Holy Spirit', 'no one can say, ''Jesus is Lord,'' but by the Holy Spirit (1 Corinthians 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 2, 'According to 1 Corinthians 12, what does Paul say there is?', '["there are various kinds of workings, but the same God","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'there are various kinds of workings, but the same God', 'there are various kinds of workings, but the same God (1 Corinthians 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say there is?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 2, 'According to 1 Corinthians 12, what does Paul say about the body?', '["For the body is not one member, but many","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'For the body is not one member, but many', 'For the body is not one member, but many (1 Corinthians 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 2, 'According to 1 Corinthians 12, what did God do?', '["God composed the body together","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'God composed the body together', 'God composed the body together (1 Corinthians 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 12, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 2, 'According to 1 Corinthians 12, what does Paul say?', '["If one member suffers, all the members suffer with it","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'If one member suffers, all the members suffer with it', 'If one member suffers, all the members suffer with it (1 Corinthians 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 3, 'According to 1 Corinthians 12, what does Paul say about the different workings among believers?', '["There are various kinds of workings, but the same God.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'There are various kinds of workings, but the same God.', 'There are various kinds of workings, but the same God (1 Corinthians 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say about the different workings among believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 3, 'According to 1 Corinthians 12, how does Paul describe the body?', '["For the body is not one member, but many.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For the body is not one member, but many.', 'For the body is not one member, but many (1 Corinthians 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 12, how does Paul describe the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 3, 'According to 1 Corinthians 12, what did God do for the weaker parts of the body?', '["God composed the body together, giving more abundant honor to the inferior part.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'God composed the body together, giving more abundant honor to the inferior part.', 'God composed the body together, giving more abundant honor to the inferior part (1 Corinthians 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 12, what did God do for the weaker parts of the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 3, 'According to 1 Corinthians 12, what happens when one member suffers?', '["If one member suffers, all the members suffer with it.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If one member suffers, all the members suffer with it.', 'If one member suffers, all the members suffer with it (1 Corinthians 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 12, what happens when one member suffers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 3, 'What does 1 Corinthians 12 teach about the Spirit?', '["No one can say, ''Jesus is Lord,'' but by the Holy Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'No one can say, ''Jesus is Lord,'' but by the Holy Spirit.', 'No one can say, ''Jesus is Lord,'' but by the Holy Spirit (1 Corinthians 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 12 teach about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 4, 'According to 1 Corinthians 12, what does Paul say there is?', '["there are various kinds of workings, but the same God","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'there are various kinds of workings, but the same God', 'there are various kinds of workings, but the same God (1 Corinthians 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say there is?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 4, 'Which phrase in 1 Corinthians 12 speaks about the body?', '["For the body is not one member, but many","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'For the body is not one member, but many', 'For the body is not one member, but many (1 Corinthians 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 12 speaks about the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 4, 'According to 1 Corinthians 12, what did God do?', '["God composed the body together","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'God composed the body together', 'God composed the body together (1 Corinthians 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 12, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 4, 'Which phrase belongs in 1 Corinthians 12?', '["If one member suffers, all the members suffer with it","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'If one member suffers, all the members suffer with it', 'If one member suffers, all the members suffer with it (1 Corinthians 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 4, 'Which phrase in 1 Corinthians 12 speaks about the Spirit?', '["no one can say, ''Jesus is Lord,'' but by the Holy Spirit","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'no one can say, ''Jesus is Lord,'' but by the Holy Spirit', 'no one can say, ''Jesus is Lord,'' but by the Holy Spirit (1 Corinthians 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 12 speaks about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 5, 'According to 1 Corinthians 12, how does Paul describe the body?', '["For the body is not one member, but many.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For the body is not one member, but many.', 'For the body is not one member, but many (1 Corinthians 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 12, how does Paul describe the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 5, 'According to 1 Corinthians 12, what did God do for the weaker parts of the body?', '["God composed the body together, giving more abundant honor to the inferior part.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'God composed the body together, giving more abundant honor to the inferior part.', 'God composed the body together, giving more abundant honor to the inferior part (1 Corinthians 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 12, what did God do for the weaker parts of the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 5, 'According to 1 Corinthians 12, what happens when one member suffers?', '["If one member suffers, all the members suffer with it.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If one member suffers, all the members suffer with it.', 'If one member suffers, all the members suffer with it (1 Corinthians 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 12, what happens when one member suffers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 5, 'What major point does 1 Corinthians 12 make about the Spirit?', '["No one can say, ''Jesus is Lord,'' but by the Holy Spirit.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'No one can say, ''Jesus is Lord,'' but by the Holy Spirit.', 'No one can say, ''Jesus is Lord,'' but by the Holy Spirit (1 Corinthians 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 12 make about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 12, 5, 'According to 1 Corinthians 12, what does Paul say about the different workings among believers?', '["There are various kinds of workings, but the same God.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'There are various kinds of workings, but the same God.', 'There are various kinds of workings, but the same God (1 Corinthians 12:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 12, what does Paul say about the different workings among believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 1, 'According to 1 Corinthians 13, what does Paul say about love?', '["If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass.', 'If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass (1 Corinthians 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 1, 'According to 1 Corinthians 13, how is love described?', '["Love is patient and is kind.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Love is patient and is kind.', 'Love is patient and is kind (1 Corinthians 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 13, how is love described?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 1, 'According to 1 Corinthians 13, what does Paul say love never does?', '["Love never fails.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Love never fails.', 'Love never fails (1 Corinthians 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say love never does?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 1, 'According to 1 Corinthians 13, how does Paul describe our present knowledge?', '["Now we see in a mirror, dimly, but then face to face.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now we see in a mirror, dimly, but then face to face.', 'Now we see in a mirror, dimly, but then face to face (1 Corinthians 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 13, how does Paul describe our present knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 1, 'According to 1 Corinthians 13, what does Paul say about love?', '["But now faith, hope, and love remain-these three. The greatest of these is love.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'But now faith, hope, and love remain-these three. The greatest of these is love.', 'But now faith, hope, and love remain-these three. The greatest of these is love (1 Corinthians 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 2, 'According to 1 Corinthians 13, what does Paul say?', '["If I speak with the languages of men and of angels","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'If I speak with the languages of men and of angels', 'If I speak with the languages of men and of angels (1 Corinthians 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 2, 'According to 1 Corinthians 13, what does Paul say about love?', '["Love is patient and is kind","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Love is patient and is kind', 'Love is patient and is kind (1 Corinthians 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 2, 'According to 1 Corinthians 13, what does Paul say about love?', '["Love never fails","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Love never fails', 'Love never fails (1 Corinthians 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 2, 'According to 1 Corinthians 13, what does Paul say?', '["For we know in part","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'For we know in part', 'For we know in part (1 Corinthians 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 2, 'According to 1 Corinthians 13, what does Paul say?', '["then face to face","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'then face to face', 'then face to face (1 Corinthians 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 3, 'According to 1 Corinthians 13, how is love described?', '["Love is patient and is kind.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Love is patient and is kind.', 'Love is patient and is kind (1 Corinthians 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 13, how is love described?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 3, 'According to 1 Corinthians 13, what does Paul say love never does?', '["Love never fails.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Love never fails.', 'Love never fails (1 Corinthians 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say love never does?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 3, 'According to 1 Corinthians 13, how does Paul describe our present knowledge?', '["Now we see in a mirror, dimly, but then face to face.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now we see in a mirror, dimly, but then face to face.', 'Now we see in a mirror, dimly, but then face to face (1 Corinthians 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 13, how does Paul describe our present knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 3, 'What does 1 Corinthians 13 teach about love?', '["But now faith, hope, and love remain-these three. The greatest of these is love.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'But now faith, hope, and love remain-these three. The greatest of these is love.', 'But now faith, hope, and love remain-these three. The greatest of these is love (1 Corinthians 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 13 teach about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 3, 'What does 1 Corinthians 13 teach about love?', '["If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass.', 'If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass (1 Corinthians 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 13 teach about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 4, 'Which phrase in 1 Corinthians 13 speaks about love?', '["Love is patient and is kind","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Love is patient and is kind', 'Love is patient and is kind (1 Corinthians 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 13 speaks about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 4, 'Which phrase in 1 Corinthians 13 speaks about love?', '["Love never fails","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Love never fails', 'Love never fails (1 Corinthians 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 13 speaks about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 4, 'Which phrase belongs in 1 Corinthians 13?', '["For we know in part","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'For we know in part', 'For we know in part (1 Corinthians 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 4, 'Which phrase belongs in 1 Corinthians 13?', '["then face to face","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'then face to face', 'then face to face (1 Corinthians 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 4, 'Which phrase in 1 Corinthians 13 speaks about love?', '["The greatest of these is love","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The greatest of these is love', 'The greatest of these is love (1 Corinthians 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 13 speaks about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 5, 'According to 1 Corinthians 13, what does Paul say love never does?', '["Love never fails.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Love never fails.', 'Love never fails (1 Corinthians 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 13, what does Paul say love never does?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 5, 'According to 1 Corinthians 13, how does Paul describe our present knowledge?', '["Now we see in a mirror, dimly, but then face to face.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now we see in a mirror, dimly, but then face to face.', 'Now we see in a mirror, dimly, but then face to face (1 Corinthians 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 13, how does Paul describe our present knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 5, 'What major point does 1 Corinthians 13 make about love?', '["But now faith, hope, and love remain-these three. The greatest of these is love.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'But now faith, hope, and love remain-these three. The greatest of these is love.', 'But now faith, hope, and love remain-these three. The greatest of these is love (1 Corinthians 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 13 make about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 5, 'What major point does 1 Corinthians 13 make about love?', '["If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass.', 'If I speak with the languages of men and of angels, but don''t have love, I have become sounding brass (1 Corinthians 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 13 make about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 13, 5, 'According to 1 Corinthians 13, how is love described?', '["Love is patient and is kind.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Love is patient and is kind.', 'Love is patient and is kind (1 Corinthians 13:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 13, how is love described?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 1, 'According to 1 Corinthians 14, what does Paul say about the Spirit?', '["Follow after love, and desire spiritual gifts, but especially that you may prophesy.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Follow after love, and desire spiritual gifts, but especially that you may prophesy.', 'Follow after love, and desire spiritual gifts, but especially that you may prophesy (1 Corinthians 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 14, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 1, 'According to 1 Corinthians 14, what does Paul say?', '["He who prophesies speaks to men for their edification.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'He who prophesies speaks to men for their edification.', 'He who prophesies speaks to men for their edification (1 Corinthians 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 14, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 1, 'According to 1 Corinthians 14, what does Paul say?', '["All things must be done decently and in order.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'All things must be done decently and in order.', 'All things must be done decently and in order (1 Corinthians 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 14, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 1, 'According to 1 Corinthians 14, what is God not a God of?', '["God is not a God of confusion, but of peace.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'God is not a God of confusion, but of peace.', 'God is not a God of confusion, but of peace (1 Corinthians 14:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 14, what is God not a God of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 1, 'According to 1 Corinthians 14, how should all things be done?', '["Let all things be done decently and in order.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let all things be done decently and in order.', 'Let all things be done decently and in order (1 Corinthians 14:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 14, how should all things be done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 2, 'According to 1 Corinthians 14, what does Paul say about love?', '["Follow after love","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Follow after love', 'Follow after love (1 Corinthians 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 14, what does Paul say about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 2, 'According to 1 Corinthians 14, what does Paul say?', '["greater is he who prophesies","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'greater is he who prophesies', 'greater is he who prophesies (1 Corinthians 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 14, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 2, 'According to 1 Corinthians 14, what does Paul say?', '["he who speaks in a language speaks not to men","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he who speaks in a language speaks not to men', 'he who speaks in a language speaks not to men (1 Corinthians 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 14, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 2, 'According to 1 Corinthians 14, what did God do?', '["God is not a God of confusion","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'God is not a God of confusion', 'God is not a God of confusion (1 Corinthians 14:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 14, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 2, 'According to 1 Corinthians 14, what instruction is given?', '["Let all things be done decently and in order","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Let all things be done decently and in order', 'Let all things be done decently and in order (1 Corinthians 14:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 14, what instruction is given?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 3, 'What does 1 Corinthians 14 teach?', '["He who prophesies speaks to men for their edification.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'He who prophesies speaks to men for their edification.', 'He who prophesies speaks to men for their edification (1 Corinthians 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 14 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 3, 'What does 1 Corinthians 14 teach?', '["All things must be done decently and in order.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'All things must be done decently and in order.', 'All things must be done decently and in order (1 Corinthians 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 14 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 3, 'According to 1 Corinthians 14, what is God not a God of?', '["God is not a God of confusion, but of peace.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'God is not a God of confusion, but of peace.', 'God is not a God of confusion, but of peace (1 Corinthians 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 14, what is God not a God of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 3, 'According to 1 Corinthians 14, how should all things be done?', '["Let all things be done decently and in order.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let all things be done decently and in order.', 'Let all things be done decently and in order (1 Corinthians 14:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 14, how should all things be done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 3, 'What does 1 Corinthians 14 teach about the Spirit?', '["Follow after love, and desire spiritual gifts, but especially that you may prophesy.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Follow after love, and desire spiritual gifts, but especially that you may prophesy.', 'Follow after love, and desire spiritual gifts, but especially that you may prophesy (1 Corinthians 14:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 14 teach about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 4, 'Which phrase belongs in 1 Corinthians 14?', '["greater is he who prophesies","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'greater is he who prophesies', 'greater is he who prophesies (1 Corinthians 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 4, 'Which phrase belongs in 1 Corinthians 14?', '["he who speaks in a language speaks not to men","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he who speaks in a language speaks not to men', 'he who speaks in a language speaks not to men (1 Corinthians 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 4, 'According to 1 Corinthians 14, what did God do?', '["God is not a God of confusion","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'God is not a God of confusion', 'God is not a God of confusion (1 Corinthians 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 14, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 4, 'According to 1 Corinthians 14, what instruction is given?', '["Let all things be done decently and in order","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Let all things be done decently and in order', 'Let all things be done decently and in order (1 Corinthians 14:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 14, what instruction is given?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 4, 'Which phrase in 1 Corinthians 14 speaks about love?', '["Follow after love","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Follow after love', 'Follow after love (1 Corinthians 14:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 14 speaks about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 5, 'What major point is made in 1 Corinthians 14?', '["All things must be done decently and in order.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'All things must be done decently and in order.', 'All things must be done decently and in order (1 Corinthians 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 5, 'According to 1 Corinthians 14, what is God not a God of?', '["God is not a God of confusion, but of peace.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'God is not a God of confusion, but of peace.', 'God is not a God of confusion, but of peace (1 Corinthians 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 14, what is God not a God of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 5, 'According to 1 Corinthians 14, how should all things be done?', '["Let all things be done decently and in order.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let all things be done decently and in order.', 'Let all things be done decently and in order (1 Corinthians 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 14, how should all things be done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 5, 'What major point does 1 Corinthians 14 make about the Spirit?', '["Follow after love, and desire spiritual gifts, but especially that you may prophesy.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Follow after love, and desire spiritual gifts, but especially that you may prophesy.', 'Follow after love, and desire spiritual gifts, but especially that you may prophesy (1 Corinthians 14:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 14 make about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 14, 5, 'What major point is made in 1 Corinthians 14?', '["He who prophesies speaks to men for their edification.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'He who prophesies speaks to men for their edification.', 'He who prophesies speaks to men for their edification (1 Corinthians 14:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 1, 'According to 1 Corinthians 15, what did Paul say he delivered first of all?', '["For I delivered to you first of all that which I also received: that Christ died for our sins.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For I delivered to you first of all that which I also received: that Christ died for our sins.', 'For I delivered to you first of all that which I also received: that Christ died for our sins (1 Corinthians 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 15, what did Paul say he delivered first of all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 1, 'According to 1 Corinthians 15, what would be true if Christ had not been raised?', '["If Christ has not been raised, then our preaching is in vain.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If Christ has not been raised, then our preaching is in vain.', 'If Christ has not been raised, then our preaching is in vain (1 Corinthians 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 15, what would be true if Christ had not been raised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 1, 'According to 1 Corinthians 15, what is Christ called in relation to those who have died?', '["Christ has been raised from the dead, the first fruits of those who are asleep.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Christ has been raised from the dead, the first fruits of those who are asleep.', 'Christ has been raised from the dead, the first fruits of those who are asleep (1 Corinthians 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 15, what is Christ called in relation to those who have died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 1, 'According to 1 Corinthians 15, what is the last enemy to be destroyed?', '["The last enemy that will be abolished is death.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The last enemy that will be abolished is death.', 'The last enemy that will be abolished is death (1 Corinthians 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 15, what is the last enemy to be destroyed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 1, 'According to 1 Corinthians 15, what question is asked in triumph over death?', '["Death, where is your sting?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Death, where is your sting?', 'Death, where is your sting? (1 Corinthians 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 15, what question is asked in triumph over death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 2, 'According to 1 Corinthians 15, what did God do?', '["Christ died for our sins according to the Scriptures","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Christ died for our sins according to the Scriptures', 'Christ died for our sins according to the Scriptures (1 Corinthians 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 15, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 2, 'According to 1 Corinthians 15, what does Paul say?', '["he was buried","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he was buried', 'he was buried (1 Corinthians 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 15, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 2, 'According to 1 Corinthians 15, what does Paul say?', '["he has been raised on the third day","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he has been raised on the third day', 'he has been raised on the third day (1 Corinthians 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 15, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 2, 'According to 1 Corinthians 15, what does Paul say about Christ?', '["if Christ has not been raised, then our preaching is in vain","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'if Christ has not been raised, then our preaching is in vain', 'if Christ has not been raised, then our preaching is in vain (1 Corinthians 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 15, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 2, 'According to 1 Corinthians 15, what did God do?', '["Christ has been raised from the dead, the first fruits","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Christ has been raised from the dead, the first fruits', 'Christ has been raised from the dead, the first fruits (1 Corinthians 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 15, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 3, 'According to 1 Corinthians 15, what would be true if Christ had not been raised?', '["If Christ has not been raised, then our preaching is in vain.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If Christ has not been raised, then our preaching is in vain.', 'If Christ has not been raised, then our preaching is in vain (1 Corinthians 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 15, what would be true if Christ had not been raised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 3, 'According to 1 Corinthians 15, what is Christ called in relation to those who have died?', '["Christ has been raised from the dead, the first fruits of those who are asleep.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Christ has been raised from the dead, the first fruits of those who are asleep.', 'Christ has been raised from the dead, the first fruits of those who are asleep (1 Corinthians 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 15, what is Christ called in relation to those who have died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 3, 'According to 1 Corinthians 15, what is the last enemy to be destroyed?', '["The last enemy that will be abolished is death.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The last enemy that will be abolished is death.', 'The last enemy that will be abolished is death (1 Corinthians 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 15, what is the last enemy to be destroyed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 3, 'According to 1 Corinthians 15, what question is asked in triumph over death?', '["Death, where is your sting?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Death, where is your sting?', 'Death, where is your sting? (1 Corinthians 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 15, what question is asked in triumph over death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 3, 'According to 1 Corinthians 15, what did Paul say he delivered first of all?', '["For I delivered to you first of all that which I also received: that Christ died for our sins.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For I delivered to you first of all that which I also received: that Christ died for our sins.', 'For I delivered to you first of all that which I also received: that Christ died for our sins (1 Corinthians 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 15, what did Paul say he delivered first of all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 4, 'Which phrase belongs in 1 Corinthians 15?', '["he was buried","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he was buried', 'he was buried (1 Corinthians 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 4, 'Which phrase belongs in 1 Corinthians 15?', '["he has been raised on the third day","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'he has been raised on the third day', 'he has been raised on the third day (1 Corinthians 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 4, 'Which phrase in 1 Corinthians 15 speaks about Christ?', '["if Christ has not been raised, then our preaching is in vain","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'if Christ has not been raised, then our preaching is in vain', 'if Christ has not been raised, then our preaching is in vain (1 Corinthians 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 15 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 4, 'According to 1 Corinthians 15, what did God do?', '["Christ has been raised from the dead, the first fruits","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Christ has been raised from the dead, the first fruits', 'Christ has been raised from the dead, the first fruits (1 Corinthians 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 15, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 4, 'Which phrase belongs in 1 Corinthians 15?', '["The last enemy that will be abolished is death","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'The last enemy that will be abolished is death', 'The last enemy that will be abolished is death (1 Corinthians 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 5, 'According to 1 Corinthians 15, what is Christ called in relation to those who have died?', '["Christ has been raised from the dead, the first fruits of those who are asleep.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Christ has been raised from the dead, the first fruits of those who are asleep.', 'Christ has been raised from the dead, the first fruits of those who are asleep (1 Corinthians 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 15, what is Christ called in relation to those who have died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 5, 'According to 1 Corinthians 15, what is the last enemy to be destroyed?', '["The last enemy that will be abolished is death.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'The last enemy that will be abolished is death.', 'The last enemy that will be abolished is death (1 Corinthians 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 15, what is the last enemy to be destroyed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 5, 'According to 1 Corinthians 15, what question is asked in triumph over death?', '["Death, where is your sting?","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Death, where is your sting?', 'Death, where is your sting? (1 Corinthians 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 15, what question is asked in triumph over death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 5, 'According to 1 Corinthians 15, what did Paul say he delivered first of all?', '["For I delivered to you first of all that which I also received: that Christ died for our sins.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'For I delivered to you first of all that which I also received: that Christ died for our sins.', 'For I delivered to you first of all that which I also received: that Christ died for our sins (1 Corinthians 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 15, what did Paul say he delivered first of all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 15, 5, 'According to 1 Corinthians 15, what would be true if Christ had not been raised?', '["If Christ has not been raised, then our preaching is in vain.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If Christ has not been raised, then our preaching is in vain.', 'If Christ has not been raised, then our preaching is in vain (1 Corinthians 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 15, what would be true if Christ had not been raised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 1, 'According to 1 Corinthians 16, what does Paul say?', '["Now concerning the collection for the saints","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now concerning the collection for the saints', 'Now concerning the collection for the saints (1 Corinthians 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 1, 'According to 1 Corinthians 16, what instruction is given?', '["Let him that is taught in the word share all good things with him who teaches.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let him that is taught in the word share all good things with him who teaches.', 'Let him that is taught in the word share all good things with him who teaches (1 Corinthians 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 16, what instruction is given?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 1, 'According to 1 Corinthians 16, what does Paul say about faith?', '["Watch! Stand firm in the faith!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Watch! Stand firm in the faith!', 'Watch! Stand firm in the faith! (1 Corinthians 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 1, 'According to 1 Corinthians 16, what does Paul say about Christ?', '["If any man doesn''t love the Lord Jesus Christ, let him be accursed.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If any man doesn''t love the Lord Jesus Christ, let him be accursed.', 'If any man doesn''t love the Lord Jesus Christ, let him be accursed (1 Corinthians 16:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 1, 'According to 1 Corinthians 16, what does Paul say?', '["Maranatha!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Maranatha!', 'Maranatha! (1 Corinthians 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 2, 'According to 1 Corinthians 16, what does Paul say?', '["concerning the collection for the saints","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'concerning the collection for the saints', 'concerning the collection for the saints (1 Corinthians 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 2, 'According to 1 Corinthians 16, what does Paul say?', '["On the first day of the week","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'On the first day of the week', 'On the first day of the week (1 Corinthians 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 2, 'According to 1 Corinthians 16, what does Paul say about faith?', '["Watch! Stand firm in the faith!","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Watch! Stand firm in the faith!', 'Watch! Stand firm in the faith! (1 Corinthians 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 2, 'According to 1 Corinthians 16, how should everything be done?', '["Let all that you do be done in love.","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Let all that you do be done in love.', 'Let all that you do be done in love (1 Corinthians 16:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 16, how should everything be done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 2, 'According to 1 Corinthians 16, what does Paul say about Christ?', '["If any man doesn''t love the Lord Jesus Christ","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'If any man doesn''t love the Lord Jesus Christ', 'If any man doesn''t love the Lord Jesus Christ (1 Corinthians 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Corinthians 16, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 3, 'According to 1 Corinthians 16, what instruction is given?', '["Let him that is taught in the word share all good things with him who teaches.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let him that is taught in the word share all good things with him who teaches.', 'Let him that is taught in the word share all good things with him who teaches (1 Corinthians 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 1 Corinthians 16, what instruction is given?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 3, 'What does 1 Corinthians 16 teach about faith?', '["Watch! Stand firm in the faith!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Watch! Stand firm in the faith!', 'Watch! Stand firm in the faith! (1 Corinthians 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 16 teach about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 3, 'What does 1 Corinthians 16 teach about Christ?', '["If any man doesn''t love the Lord Jesus Christ, let him be accursed.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If any man doesn''t love the Lord Jesus Christ, let him be accursed.', 'If any man doesn''t love the Lord Jesus Christ, let him be accursed (1 Corinthians 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 16 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 3, 'What does 1 Corinthians 16 teach?', '["Maranatha!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Maranatha!', 'Maranatha! (1 Corinthians 16:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 16 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 3, 'What does 1 Corinthians 16 teach?', '["Now concerning the collection for the saints","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now concerning the collection for the saints', 'Now concerning the collection for the saints (1 Corinthians 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Corinthians 16 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 4, 'Which phrase belongs in 1 Corinthians 16?', '["On the first day of the week","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'On the first day of the week', 'On the first day of the week (1 Corinthians 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 4, 'Which phrase in 1 Corinthians 16 speaks about faith?', '["Watch! Stand firm in the faith!","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Watch! Stand firm in the faith!', 'Watch! Stand firm in the faith! (1 Corinthians 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 16 speaks about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 4, 'According to 1 Corinthians 16, how should everything be done?', '["Let all that you do be done in love.","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Let all that you do be done in love.', 'Let all that you do be done in love (1 Corinthians 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to 1 Corinthians 16, how should everything be done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 4, 'Which phrase in 1 Corinthians 16 speaks about Christ?', '["If any man doesn''t love the Lord Jesus Christ","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'If any man doesn''t love the Lord Jesus Christ', 'If any man doesn''t love the Lord Jesus Christ (1 Corinthians 16:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in 1 Corinthians 16 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 4, 'Which phrase belongs in 1 Corinthians 16?', '["Maranatha!","To the assembly of God which is at Corinth","you were enriched in him","that you all agree"]'::jsonb, 'Maranatha!', 'Maranatha! (1 Corinthians 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in 1 Corinthians 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 5, 'What major point does 1 Corinthians 16 make about faith?', '["Watch! Stand firm in the faith!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Watch! Stand firm in the faith!', 'Watch! Stand firm in the faith! (1 Corinthians 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 16 make about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 5, 'What major point does 1 Corinthians 16 make about Christ?', '["If any man doesn''t love the Lord Jesus Christ, let him be accursed.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'If any man doesn''t love the Lord Jesus Christ, let him be accursed.', 'If any man doesn''t love the Lord Jesus Christ, let him be accursed (1 Corinthians 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does 1 Corinthians 16 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 5, 'What major point is made in 1 Corinthians 16?', '["Maranatha!","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Maranatha!', 'Maranatha! (1 Corinthians 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 5, 'What major point is made in 1 Corinthians 16?', '["Now concerning the collection for the saints","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Now concerning the collection for the saints', 'Now concerning the collection for the saints (1 Corinthians 16:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in 1 Corinthians 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 46, 16, 5, 'According to 1 Corinthians 16, what instruction is given?', '["Let him that is taught in the word share all good things with him who teaches.","You were enriched in everything in him.","That you all speak the same thing.","Is Christ divided?"]'::jsonb, 'Let him that is taught in the word share all good things with him who teaches.', 'Let him that is taught in the word share all good things with him who teaches (1 Corinthians 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 46
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 1 Corinthians 16, what instruction is given?'
);
