-- Re-seed Romans after duplicate-prompt fix (clears partial rows from skipped INSERTs).
DELETE FROM quiz_question_bank WHERE book_number = 45;

-- ============================================================================
-- LOGOS LIGHT — Romans (book 45) quiz questions from quiz-questions/romans.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 1, 'According to Romans 1, what was promised through the prophets?', '["The gospel was promised through the prophets.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'The gospel was promised through the prophets.', 'The gospel was promised through the prophets (Romans 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 1, what was promised through the prophets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 1, 'According to Romans 1, what is revealed in the gospel?', '["In it God’s righteousness is revealed from faith to faith.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'In it God’s righteousness is revealed from faith to faith.', 'In it God’s righteousness is revealed from faith to faith (Romans 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 1, what is revealed in the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 1, 'According to Romans 1, what does Paul say about God''s righteousness?', '["God’s wrath is revealed against ungodliness and unrighteousness.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'God’s wrath is revealed against ungodliness and unrighteousness.', 'God’s wrath is revealed against ungodliness and unrighteousness (Romans 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 1, what does Paul say about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 1, 'According to Romans 1, what did people fail to do after knowing God?', '["They knew God but did not glorify him as God.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'They knew God but did not glorify him as God.', 'They knew God but did not glorify him as God (Romans 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 1, what did people fail to do after knowing God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 1, 'According to Romans 1, what did God do?', '["God gave them up in the lusts of their hearts.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'God gave them up in the lusts of their hearts.', 'God gave them up in the lusts of their hearts (Romans 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 1, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 2, 'How does Paul describe himself at the start of Romans 1?', '["a servant of Jesus Christ", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'a servant of Jesus Christ', 'a servant of Jesus Christ (Romans 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe himself at the start of Romans 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 2, 'What gospel does Paul mention in Romans 1?', '["the gospel of God", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'the gospel of God', 'the gospel of God (Romans 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What gospel does Paul mention in Romans 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 2, 'According to Romans 1, what is the gospel?', '["it is the power of God for salvation", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'it is the power of God for salvation', 'it is the power of God for salvation (Romans 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 1, what is the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 2, 'According to Romans 1, what is revealed from heaven?', '["For the wrath of God is revealed", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'For the wrath of God is revealed', 'For the wrath of God is revealed (Romans 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 1, what is revealed from heaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 2, 'According to Romans 1, what does Paul say about God''s glory?', '["they exchanged the glory of the incorruptible God", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'they exchanged the glory of the incorruptible God', 'they exchanged the glory of the incorruptible God (Romans 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 1, what does Paul say about God''s glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 3, 'According to Romans 1, what is revealed in the gospel?', '["In it God’s righteousness is revealed from faith to faith.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'In it God’s righteousness is revealed from faith to faith.', 'In it God’s righteousness is revealed from faith to faith (Romans 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 1, what is revealed in the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 3, 'What does Romans 1 teach about God''s righteousness?', '["God’s wrath is revealed against ungodliness and unrighteousness.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'God’s wrath is revealed against ungodliness and unrighteousness.', 'God’s wrath is revealed against ungodliness and unrighteousness (Romans 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 1 teach about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 3, 'According to Romans 1, what did people fail to do after knowing God?', '["They knew God but did not glorify him as God.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'They knew God but did not glorify him as God.', 'They knew God but did not glorify him as God (Romans 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 1, what did people fail to do after knowing God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 3, 'According to Romans 1, what did God do?', '["God gave them up in the lusts of their hearts.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'God gave them up in the lusts of their hearts.', 'God gave them up in the lusts of their hearts (Romans 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 1, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 3, 'According to Romans 1, what was promised through the prophets?', '["The gospel was promised through the prophets.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'The gospel was promised through the prophets.', 'The gospel was promised through the prophets (Romans 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 1, what was promised through the prophets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 4, 'What gospel does Paul mention in Romans 1?', '["the gospel of God", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'the gospel of God', 'the gospel of God (Romans 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What gospel does Paul mention in Romans 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 4, 'According to Romans 1, what is the gospel?', '["it is the power of God for salvation", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'it is the power of God for salvation', 'it is the power of God for salvation (Romans 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 1, what is the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 4, 'According to Romans 1, what is revealed from heaven?', '["For the wrath of God is revealed", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'For the wrath of God is revealed', 'For the wrath of God is revealed (Romans 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 1, what is revealed from heaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 4, 'Which phrase in Romans 1 speaks about God''s glory?', '["they exchanged the glory of the incorruptible God", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'they exchanged the glory of the incorruptible God', 'they exchanged the glory of the incorruptible God (Romans 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 1 speaks about God''s glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 4, 'According to Romans 1, what did God do?', '["God gave them up to the lusts of their hearts", "the judgment of God is according to truth", "repentance", "there is no partiality with God"]'::jsonb, 'God gave them up to the lusts of their hearts', 'God gave them up to the lusts of their hearts (Romans 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 1, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 5, 'What major point does Romans 1 make about God''s righteousness?', '["God’s wrath is revealed against ungodliness and unrighteousness.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'God’s wrath is revealed against ungodliness and unrighteousness.', 'God’s wrath is revealed against ungodliness and unrighteousness (Romans 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 1 make about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 5, 'According to Romans 1, what did people fail to do after knowing God?', '["They knew God but did not glorify him as God.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'They knew God but did not glorify him as God.', 'They knew God but did not glorify him as God (Romans 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 1, what did people fail to do after knowing God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 5, 'According to Romans 1, what did God do?', '["God gave them up in the lusts of their hearts.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'God gave them up in the lusts of their hearts.', 'God gave them up in the lusts of their hearts (Romans 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 1, what did God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 5, 'According to Romans 1, what was promised through the prophets?', '["The gospel was promised through the prophets.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'The gospel was promised through the prophets.', 'The gospel was promised through the prophets (Romans 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 1, what was promised through the prophets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 1, 5, 'According to Romans 1, what is revealed in the gospel?', '["In it God’s righteousness is revealed from faith to faith.", "You are without excuse who judge another.", "God will render to each according to his works.", "There is no partiality with God."]'::jsonb, 'In it God’s righteousness is revealed from faith to faith.', 'In it God’s righteousness is revealed from faith to faith (Romans 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 1, what is revealed in the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 1, 'According to Romans 2, what does Paul say?', '["You are without excuse who judge another.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You are without excuse who judge another.', 'You are without excuse who judge another (Romans 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 2, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 1, 'According to Romans 2, what will God do?', '["God will render to each according to his works.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God will render to each according to his works.', 'God will render to each according to his works (Romans 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 2, what will God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 1, 'According to Romans 2, what is true about partiality with god?', '["There is no partiality with God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no partiality with God.', 'There is no partiality with God (Romans 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 2, what is true about partiality with god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 1, 'According to Romans 2, what does Paul say about the law?', '["Circumcision profits if you are a doer of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Circumcision profits if you are a doer of the law.', 'Circumcision profits if you are a doer of the law (Romans 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 2, what does Paul say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 1, 'According to Romans 2, what does Paul say about a true Jew?', '["He is not a Jew who is one outwardly only.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He is not a Jew who is one outwardly only.', 'He is not a Jew who is one outwardly only (Romans 2:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 2, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 2, 'According to Romans 2, what is true about the judgment of God?', '["the judgment of God is according to truth", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the judgment of God is according to truth', 'the judgment of God is according to truth (Romans 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 2, what is true about the judgment of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 2, 'According to Romans 2, what does God''s kindness lead to?', '["repentance", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'repentance', 'repentance (Romans 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 2, what does God''s kindness lead to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 2, 'According to Romans 2, what is true about partiality with god?', '["there is no partiality with God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'there is no partiality with God', 'there is no partiality with God (Romans 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 2, what is true about partiality with god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 2, 'According to Romans 2, who are righteous before God?', '["not the hearers of the law are righteous", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'not the hearers of the law are righteous', 'not the hearers of the law are righteous (Romans 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 2, who are righteous before God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 2, 'According to Romans 2, what does Paul say about a true Jew?', '["he is not a Jew who is one outwardly", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'he is not a Jew who is one outwardly', 'he is not a Jew who is one outwardly (Romans 2:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 2, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 3, 'According to Romans 2, what will God do?', '["God will render to each according to his works.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God will render to each according to his works.', 'God will render to each according to his works (Romans 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 2, what will God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 3, 'According to Romans 2, what is true about partiality with god?', '["There is no partiality with God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no partiality with God.', 'There is no partiality with God (Romans 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 2, what is true about partiality with god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 3, 'What does Romans 2 teach about the law?', '["Circumcision profits if you are a doer of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Circumcision profits if you are a doer of the law.', 'Circumcision profits if you are a doer of the law (Romans 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 2 teach about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 3, 'According to Romans 2, what does Paul say about a true Jew?', '["He is not a Jew who is one outwardly only.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He is not a Jew who is one outwardly only.', 'He is not a Jew who is one outwardly only (Romans 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 2, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 3, 'What does Romans 2 teach?', '["You are without excuse who judge another.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You are without excuse who judge another.', 'You are without excuse who judge another (Romans 2:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 2 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 4, 'According to Romans 2, what does God''s kindness lead to?', '["repentance", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'repentance', 'repentance (Romans 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 2, what does God''s kindness lead to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 4, 'According to Romans 2, what is true about partiality with god?', '["there is no partiality with God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'there is no partiality with God', 'there is no partiality with God (Romans 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 2, what is true about partiality with god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 4, 'According to Romans 2, who are righteous before God?', '["not the hearers of the law are righteous", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'not the hearers of the law are righteous', 'not the hearers of the law are righteous (Romans 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 2, who are righteous before God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 4, 'According to Romans 2, what does Paul say about a true Jew?', '["he is not a Jew who is one outwardly", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'he is not a Jew who is one outwardly', 'he is not a Jew who is one outwardly (Romans 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 2, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 4, 'According to Romans 2, what is true about the judgment of God?', '["the judgment of God is according to truth", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the judgment of God is according to truth', 'the judgment of God is according to truth (Romans 2:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 2, what is true about the judgment of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 5, 'According to Romans 2, what is true about partiality with god?', '["There is no partiality with God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no partiality with God.', 'There is no partiality with God (Romans 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 2, what is true about partiality with god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 5, 'What major point does Romans 2 make about the law?', '["Circumcision profits if you are a doer of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Circumcision profits if you are a doer of the law.', 'Circumcision profits if you are a doer of the law (Romans 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 2 make about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 5, 'According to Romans 2, what does Paul say about a true Jew?', '["He is not a Jew who is one outwardly only.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He is not a Jew who is one outwardly only.', 'He is not a Jew who is one outwardly only (Romans 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 2, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 5, 'What major point is made in Romans 2?', '["You are without excuse who judge another.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You are without excuse who judge another.', 'You are without excuse who judge another (Romans 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 2, 5, 'According to Romans 2, what will God do?', '["God will render to each according to his works.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God will render to each according to his works.', 'God will render to each according to his works (Romans 2:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 2, what will God do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 1, 'According to Romans 3, what does Paul say about the Jews?', '["Jews were entrusted with the oracles of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Jews were entrusted with the oracles of God.', 'Jews were entrusted with the oracles of God (Romans 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 3, what does Paul say about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 1, 'According to Romans 3, what is true about one righteous; all have sinned?', '["There is no one righteous; all have sinned.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no one righteous; all have sinned.', 'There is no one righteous; all have sinned (Romans 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 3, what is true about one righteous; all have sinned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 1, 'According to Romans 3, how are people justified?', '["Being justified freely by his grace through redemption in Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Being justified freely by his grace through redemption in Christ.', 'Being justified freely by his grace through redemption in Christ (Romans 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 3, how are people justified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 1, 'According to Romans 3, what did God set forth?', '["God set him forth as a propitiation by faith in his blood.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God set him forth as a propitiation by faith in his blood.', 'God set him forth as a propitiation by faith in his blood (Romans 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 3, what did God set forth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 1, 'According to Romans 3, what does Paul say?', '["We maintain that a man is justified by faith apart from works of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We maintain that a man is justified by faith apart from works of the law.', 'We maintain that a man is justified by faith apart from works of the law (Romans 3:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 3, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 2, 'According to Romans 3, what does Paul say?', '["they were entrusted with the oracles of God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'they were entrusted with the oracles of God', 'they were entrusted with the oracles of God (Romans 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 3, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 2, 'According to Romans 3, what is true about one righteous?', '["There is no one righteous", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'There is no one righteous', 'There is no one righteous (Romans 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 3, what is true about one righteous?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 2, 'According to Romans 3, what is true about all people?', '["for all have sinned", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'for all have sinned', 'for all have sinned (Romans 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 3, what is true about all people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 2, 'According to Romans 3, how are people justified?', '["being justified freely by his grace", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'being justified freely by his grace', 'being justified freely by his grace (Romans 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 3, how are people justified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 2, 'According to Romans 3, what did God set forth?', '["God set him forth to be a propitiation", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'God set him forth to be a propitiation', 'God set him forth to be a propitiation (Romans 3:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 3, what did God set forth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 3, 'According to Romans 3, what is true about one righteous; all have sinned?', '["There is no one righteous; all have sinned.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no one righteous; all have sinned.', 'There is no one righteous; all have sinned (Romans 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 3, what is true about one righteous; all have sinned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 3, 'According to Romans 3, how are people justified?', '["Being justified freely by his grace through redemption in Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Being justified freely by his grace through redemption in Christ.', 'Being justified freely by his grace through redemption in Christ (Romans 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 3, how are people justified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 3, 'According to Romans 3, what did God set forth?', '["God set him forth as a propitiation by faith in his blood.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God set him forth as a propitiation by faith in his blood.', 'God set him forth as a propitiation by faith in his blood (Romans 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 3, what did God set forth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 3, 'According to Romans 3, what does Paul say?', '["We maintain that a man is justified by faith apart from works of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We maintain that a man is justified by faith apart from works of the law.', 'We maintain that a man is justified by faith apart from works of the law (Romans 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 3, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 3, 'What does Romans 3 teach about the Jews?', '["Jews were entrusted with the oracles of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Jews were entrusted with the oracles of God.', 'Jews were entrusted with the oracles of God (Romans 3:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 3 teach about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 4, 'According to Romans 3, what is true about one righteous?', '["There is no one righteous", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'There is no one righteous', 'There is no one righteous (Romans 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 3, what is true about one righteous?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 4, 'According to Romans 3, what is true about all people?', '["for all have sinned", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'for all have sinned', 'for all have sinned (Romans 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 3, what is true about all people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 4, 'According to Romans 3, how are people justified?', '["being justified freely by his grace", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'being justified freely by his grace', 'being justified freely by his grace (Romans 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 3, how are people justified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 4, 'According to Romans 3, what did God set forth?', '["God set him forth to be a propitiation", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'God set him forth to be a propitiation', 'God set him forth to be a propitiation (Romans 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 3, what did God set forth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 4, 'According to Romans 3, what does Paul say?', '["We maintain therefore that a man is justified by faith apart from the deeds of the law", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'We maintain therefore that a man is justified by faith apart from the deeds of the law', 'We maintain therefore that a man is justified by faith apart from the deeds of the law (Romans 3:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 3, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 5, 'According to Romans 3, how are people justified?', '["Being justified freely by his grace through redemption in Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Being justified freely by his grace through redemption in Christ.', 'Being justified freely by his grace through redemption in Christ (Romans 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 3, how are people justified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 5, 'According to Romans 3, what did God set forth?', '["God set him forth as a propitiation by faith in his blood.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God set him forth as a propitiation by faith in his blood.', 'God set him forth as a propitiation by faith in his blood (Romans 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 3, what did God set forth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 5, 'According to Romans 3, what does Paul say?', '["We maintain that a man is justified by faith apart from works of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We maintain that a man is justified by faith apart from works of the law.', 'We maintain that a man is justified by faith apart from works of the law (Romans 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 3, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 5, 'What major point does Romans 3 make about the Jews?', '["Jews were entrusted with the oracles of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Jews were entrusted with the oracles of God.', 'Jews were entrusted with the oracles of God (Romans 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 3 make about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 3, 5, 'According to Romans 3, what is true about one righteous; all have sinned?', '["There is no one righteous; all have sinned.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no one righteous; all have sinned.', 'There is no one righteous; all have sinned (Romans 3:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 3, what is true about one righteous; all have sinned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 1, 'According to Romans 4, what does Paul say about God''s righteousness (Rom 4:3)?', '["Abraham’s faith was counted for righteousness.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Abraham’s faith was counted for righteousness.', 'Abraham’s faith was counted for righteousness (Romans 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 4, what does Paul say about God''s righteousness (Rom 4:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 1, 'According to Romans 4, what does Paul say about God''s righteousness (Rom 4:5)?', '["Righteousness is not of the law but of faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Righteousness is not of the law but of faith.', 'Righteousness is not of the law but of faith (Romans 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 4, what does Paul say about God''s righteousness (Rom 4:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 1, 'According to Romans 4, what does Paul say about a true Jew?', '["He is father of circumcision to those who walk in faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He is father of circumcision to those who walk in faith.', 'He is father of circumcision to those who walk in faith (Romans 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 4, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 1, 'According to Romans 4, what does Paul say (Rom 4:12)?', '["In hope he believed against hope.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'In hope he believed against hope.', 'In hope he believed against hope (Romans 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 4, what does Paul say (Rom 4:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 1, 'According to Romans 4, what does Paul say (Rom 4:13)?', '["He was fully convinced that what God promised he was able to perform.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He was fully convinced that what God promised he was able to perform.', 'He was fully convinced that what God promised he was able to perform (Romans 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 4, what does Paul say (Rom 4:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 2, 'According to Romans 4, what does Paul say about Abraham?', '["Abraham believed God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Abraham believed God', 'Abraham believed God (Romans 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 4, what does Paul say about Abraham?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 2, 'According to Romans 4, what does Paul say about God''s righteousness?', '["his faith is counted for righteousness", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'his faith is counted for righteousness', 'his faith is counted for righteousness (Romans 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 4, what does Paul say about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 2, 'According to Romans 4, what does Paul say?', '["the heir of the world", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the heir of the world', 'the heir of the world (Romans 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 4, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 2, 'According to Romans 4, what does Paul say about faith?', '["the promise is of faith", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the promise is of faith', 'the promise is of faith (Romans 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 4, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 2, 'According to Romans 4, what does Paul say about sin?', '["David also pronounces blessing", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'David also pronounces blessing', 'David also pronounces blessing (Romans 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 4, what does Paul say about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 3, 'What does Romans 4 teach about God''s righteousness (Rom 4:3)?', '["Righteousness is not of the law but of faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Righteousness is not of the law but of faith.', 'Righteousness is not of the law but of faith (Romans 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 4 teach about God''s righteousness (Rom 4:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 3, 'According to Romans 4, what does Paul say about a true Jew?', '["He is father of circumcision to those who walk in faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He is father of circumcision to those who walk in faith.', 'He is father of circumcision to those who walk in faith (Romans 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 4, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 3, 'What does Romans 4 teach (Rom 4:11)?', '["In hope he believed against hope.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'In hope he believed against hope.', 'In hope he believed against hope (Romans 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 4 teach (Rom 4:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 3, 'What does Romans 4 teach (Rom 4:12)?', '["He was fully convinced that what God promised he was able to perform.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He was fully convinced that what God promised he was able to perform.', 'He was fully convinced that what God promised he was able to perform (Romans 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 4 teach (Rom 4:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 3, 'What does Romans 4 teach about God''s righteousness (Rom 4:13)?', '["Abraham’s faith was counted for righteousness.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Abraham’s faith was counted for righteousness.', 'Abraham’s faith was counted for righteousness (Romans 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 4 teach about God''s righteousness (Rom 4:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 4, 'Which phrase in Romans 4 speaks about God''s righteousness?', '["his faith is counted for righteousness", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'his faith is counted for righteousness', 'his faith is counted for righteousness (Romans 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 4 speaks about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 4, 'Which phrase belongs in Romans 4 (Rom 4:5)?', '["the heir of the world", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the heir of the world', 'the heir of the world (Romans 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 4 (Rom 4:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 4, 'Which phrase in Romans 4 speaks about faith?', '["the promise is of faith", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the promise is of faith', 'the promise is of faith (Romans 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 4 speaks about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 4, 'Which phrase in Romans 4 speaks about sin?', '["David also pronounces blessing", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'David also pronounces blessing', 'David also pronounces blessing (Romans 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 4 speaks about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 4, 'Which phrase belongs in Romans 4 (Rom 4:13)?', '["who is the father of us all", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'who is the father of us all', 'who is the father of us all (Romans 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 4 (Rom 4:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 5, 'According to Romans 4, what does Paul say about a true Jew?', '["He is father of circumcision to those who walk in faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He is father of circumcision to those who walk in faith.', 'He is father of circumcision to those who walk in faith (Romans 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 4, what does Paul say about a true Jew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 5, 'What major point is made in Romans 4 (Rom 4:5)?', '["In hope he believed against hope.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'In hope he believed against hope.', 'In hope he believed against hope (Romans 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 4 (Rom 4:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 5, 'What major point is made in Romans 4 (Rom 4:11)?', '["He was fully convinced that what God promised he was able to perform.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'He was fully convinced that what God promised he was able to perform.', 'He was fully convinced that what God promised he was able to perform (Romans 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 4 (Rom 4:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 5, 'What major point does Romans 4 make about God''s righteousness (Rom 4:12)?', '["Abraham’s faith was counted for righteousness.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Abraham’s faith was counted for righteousness.', 'Abraham’s faith was counted for righteousness (Romans 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 4 make about God''s righteousness (Rom 4:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 4, 5, 'What major point does Romans 4 make about God''s righteousness (Rom 4:13)?', '["Righteousness is not of the law but of faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Righteousness is not of the law but of faith.', 'Righteousness is not of the law but of faith (Romans 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 4 make about God''s righteousness (Rom 4:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 1, 'According to Romans 5, what does Paul say (Rom 5:1)?', '["We have peace with God through our Lord Jesus Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We have peace with God through our Lord Jesus Christ.', 'We have peace with God through our Lord Jesus Christ (Romans 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 1, 'According to Romans 5, what does Paul say about Christ?', '["Christ died for the ungodly at the right time.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Christ died for the ungodly at the right time.', 'Christ died for the ungodly at the right time (Romans 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 5, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 1, 'According to Romans 5, what does Paul say (Rom 5:6)?', '["We were reconciled while enemies.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We were reconciled while enemies.', 'We were reconciled while enemies (Romans 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 1, 'According to Romans 5, what does Paul say about grace?', '["Where sin abounded, grace abounded more.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Where sin abounded, grace abounded more.', 'Where sin abounded, grace abounded more (Romans 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 5, what does Paul say about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 1, 'According to Romans 5, what does Paul say about God''s righteousness?', '["As through one trespass all men were condemned, so through one act of righteousness all will be justified.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'As through one trespass all men were condemned, so through one act of righteousness all will be justified.', 'As through one trespass all men were condemned, so through one act of righteousness all will be justified (Romans 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 5, what does Paul say about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 2, 'According to Romans 5, what does Paul say (Rom 5:1)?', '["we have peace with God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'we have peace with God', 'we have peace with God (Romans 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 2, 'According to Romans 5, what does Paul say about Christ?', '["Christ died for the ungodly", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Christ died for the ungodly', 'Christ died for the ungodly (Romans 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 5, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 2, 'According to Romans 5, what does Paul say (Rom 5:6)?', '["while we were enemies, we were reconciled", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'while we were enemies, we were reconciled', 'while we were enemies, we were reconciled (Romans 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 2, 'According to Romans 5, what does Paul say about grace?', '["where sin abounded, grace abounded more", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'where sin abounded, grace abounded more', 'where sin abounded, grace abounded more (Romans 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 5, what does Paul say about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 2, 'According to Romans 5, what does Paul say about sin?', '["as through one man sin entered into the world", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'as through one man sin entered into the world', 'as through one man sin entered into the world (Romans 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 5, what does Paul say about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 3, 'What does Romans 5 teach about Christ?', '["Christ died for the ungodly at the right time.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Christ died for the ungodly at the right time.', 'Christ died for the ungodly at the right time (Romans 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 5 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 3, 'According to Romans 5, what does Paul say (Rom 5:5)?', '["We were reconciled while enemies.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We were reconciled while enemies.', 'We were reconciled while enemies (Romans 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 3, 'What does Romans 5 teach about grace?', '["Where sin abounded, grace abounded more.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Where sin abounded, grace abounded more.', 'Where sin abounded, grace abounded more (Romans 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 5 teach about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 3, 'What does Romans 5 teach about God''s righteousness?', '["As through one trespass all men were condemned, so through one act of righteousness all will be justified.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'As through one trespass all men were condemned, so through one act of righteousness all will be justified.', 'As through one trespass all men were condemned, so through one act of righteousness all will be justified (Romans 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 5 teach about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 3, 'According to Romans 5, what does Paul say (Rom 5:10)?', '["We have peace with God through our Lord Jesus Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We have peace with God through our Lord Jesus Christ.', 'We have peace with God through our Lord Jesus Christ (Romans 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 4, 'Which phrase in Romans 5 speaks about Christ?', '["Christ died for the ungodly", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Christ died for the ungodly', 'Christ died for the ungodly (Romans 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 5 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 4, 'Which phrase belongs in Romans 5?', '["while we were enemies, we were reconciled", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'while we were enemies, we were reconciled', 'while we were enemies, we were reconciled (Romans 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 4, 'Which phrase in Romans 5 speaks about grace?', '["where sin abounded, grace abounded more", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'where sin abounded, grace abounded more', 'where sin abounded, grace abounded more (Romans 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 5 speaks about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 4, 'Which phrase in Romans 5 speaks about sin?', '["as through one man sin entered into the world", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'as through one man sin entered into the world', 'as through one man sin entered into the world (Romans 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 5 speaks about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 4, 'According to Romans 5, what does Paul say?', '["we have peace with God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'we have peace with God', 'we have peace with God (Romans 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 5, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 5, 'According to Romans 5, what does Paul say (Rom 5:1)?', '["We were reconciled while enemies.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We were reconciled while enemies.', 'We were reconciled while enemies (Romans 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 5, 'What major point does Romans 5 make about grace?', '["Where sin abounded, grace abounded more.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Where sin abounded, grace abounded more.', 'Where sin abounded, grace abounded more (Romans 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 5 make about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 5, 'What major point does Romans 5 make about God''s righteousness?', '["As through one trespass all men were condemned, so through one act of righteousness all will be justified.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'As through one trespass all men were condemned, so through one act of righteousness all will be justified.', 'As through one trespass all men were condemned, so through one act of righteousness all will be justified (Romans 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 5 make about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 5, 'According to Romans 5, what does Paul say (Rom 5:8)?', '["We have peace with God through our Lord Jesus Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We have peace with God through our Lord Jesus Christ.', 'We have peace with God through our Lord Jesus Christ (Romans 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 5, what does Paul say (Rom 5:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 5, 5, 'What major point does Romans 5 make about Christ?', '["Christ died for the ungodly at the right time.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Christ died for the ungodly at the right time.', 'Christ died for the ungodly at the right time (Romans 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 5 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 1, 'According to Romans 6, We died to sin; how can we live any longer in it?', '["We died to sin; how can we live any longer in it?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We died to sin; how can we live any longer in it?', 'We died to sin; how can we live any longer in it? (Romans 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 6, We died to sin; how can we live any longer in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 1, 'According to Romans 6, what does Paul say (Rom 6:4)?', '["We were buried with him through baptism into death.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We were buried with him through baptism into death.', 'We were buried with him through baptism into death (Romans 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 6, what does Paul say (Rom 6:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 1, 'According to Romans 6, what does Paul say (Rom 6:6)?', '["Our old man was crucified with him.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Our old man was crucified with him.', 'Our old man was crucified with him (Romans 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 6, what does Paul say (Rom 6:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 1, 'According to Romans 6, what does Paul say (Rom 6:11)?', '["Present yourselves to God as alive from the dead.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Present yourselves to God as alive from the dead.', 'Present yourselves to God as alive from the dead (Romans 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 6, what does Paul say (Rom 6:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 1, 'According to Romans 6, what does Paul say about sin?', '["The wages of sin is death, but the free gift of God is eternal life.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The wages of sin is death, but the free gift of God is eternal life.', 'The wages of sin is death, but the free gift of God is eternal life (Romans 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 6, what does Paul say about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 2, 'According to Romans 6, How can we, who died to sin, still live in it?', '["How can we, who died to sin, still live in it?", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'How can we, who died to sin, still live in it?', 'How can we, who died to sin, still live in it? (Romans 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 6, How can we, who died to sin, still live in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 2, 'According to Romans 6, what does Paul say (Rom 6:4)?', '["We were buried therefore with him", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'We were buried therefore with him', 'We were buried therefore with him (Romans 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 6, what does Paul say (Rom 6:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 2, 'According to Romans 6, what does Paul say (Rom 6:6)?', '["our old man was crucified with him", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'our old man was crucified with him', 'our old man was crucified with him (Romans 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 6, what does Paul say (Rom 6:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 2, 'According to Romans 6, what does Paul say (Rom 6:11)?', '["present yourselves to God, as alive from the dead", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'present yourselves to God, as alive from the dead', 'present yourselves to God, as alive from the dead (Romans 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 6, what does Paul say (Rom 6:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 2, 'According to Romans 6, what does Paul say about sin?', '["But now, being made free from sin", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'But now, being made free from sin', 'But now, being made free from sin (Romans 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 6, what does Paul say about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 3, 'According to Romans 6, what does Paul say?', '["We were buried with him through baptism into death.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We were buried with him through baptism into death.', 'We were buried with him through baptism into death (Romans 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 6, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 3, 'What does Romans 6 teach (Rom 6:4)?', '["Our old man was crucified with him.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Our old man was crucified with him.', 'Our old man was crucified with him (Romans 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 6 teach (Rom 6:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 3, 'What does Romans 6 teach (Rom 6:6)?', '["Present yourselves to God as alive from the dead.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Present yourselves to God as alive from the dead.', 'Present yourselves to God as alive from the dead (Romans 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 6 teach (Rom 6:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 3, 'What does Romans 6 teach about sin?', '["The wages of sin is death, but the free gift of God is eternal life.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The wages of sin is death, but the free gift of God is eternal life.', 'The wages of sin is death, but the free gift of God is eternal life (Romans 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 6 teach about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 3, 'According to Romans 6, We died to sin; how can we live any longer in it?', '["We died to sin; how can we live any longer in it?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We died to sin; how can we live any longer in it?', 'We died to sin; how can we live any longer in it? (Romans 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 6, We died to sin; how can we live any longer in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 4, 'According to Romans 6, what does Paul say?', '["We were buried therefore with him", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'We were buried therefore with him', 'We were buried therefore with him (Romans 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 6, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 4, 'Which phrase belongs in Romans 6 (Rom 6:4)?', '["our old man was crucified with him", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'our old man was crucified with him', 'our old man was crucified with him (Romans 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 6 (Rom 6:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 4, 'Which phrase belongs in Romans 6 (Rom 6:6)?', '["present yourselves to God, as alive from the dead", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'present yourselves to God, as alive from the dead', 'present yourselves to God, as alive from the dead (Romans 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 6 (Rom 6:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 4, 'Which phrase in Romans 6 speaks about sin (Rom 6:11)?', '["But now, being made free from sin", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'But now, being made free from sin', 'But now, being made free from sin (Romans 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 6 speaks about sin (Rom 6:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 4, 'Which phrase in Romans 6 speaks about sin (Rom 6:13)?', '["the wages of sin is death", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the wages of sin is death', 'the wages of sin is death (Romans 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 6 speaks about sin (Rom 6:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 5, 'What major point is made in Romans 6 (Rom 6:2)?', '["Our old man was crucified with him.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Our old man was crucified with him.', 'Our old man was crucified with him (Romans 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 6 (Rom 6:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 5, 'What major point is made in Romans 6 (Rom 6:4)?', '["Present yourselves to God as alive from the dead.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Present yourselves to God as alive from the dead.', 'Present yourselves to God as alive from the dead (Romans 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 6 (Rom 6:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 5, 'What major point does Romans 6 make about sin?', '["The wages of sin is death, but the free gift of God is eternal life.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The wages of sin is death, but the free gift of God is eternal life.', 'The wages of sin is death, but the free gift of God is eternal life (Romans 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 6 make about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 5, 'According to Romans 6, We died to sin; how can we live any longer in it?', '["We died to sin; how can we live any longer in it?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We died to sin; how can we live any longer in it?', 'We died to sin; how can we live any longer in it? (Romans 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 6, We died to sin; how can we live any longer in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 6, 5, 'According to Romans 6, what does Paul say?', '["We were buried with him through baptism into death.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We were buried with him through baptism into death.', 'We were buried with him through baptism into death (Romans 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 6, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 1, 'According to Romans 7, what does Paul say about the law (Rom 7:7)?', '["Through the law comes the knowledge of sin.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Through the law comes the knowledge of sin.', 'Through the law comes the knowledge of sin (Romans 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 7, what does Paul say about the law (Rom 7:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 1, 'According to Romans 7, what does Paul say about sin?', '["Sin, finding occasion through the commandment, deceived me.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Sin, finding occasion through the commandment, deceived me.', 'Sin, finding occasion through the commandment, deceived me (Romans 7:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 7, what does Paul say about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 1, 'According to Romans 7, what does Paul say about the law (Rom 7:13)?', '["The law is spiritual, but I am fleshly.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The law is spiritual, but I am fleshly.', 'The law is spiritual, but I am fleshly (Romans 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 7, what does Paul say about the law (Rom 7:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 1, 'According to Romans 7, what does Paul say about the law (Rom 7:14)?', '["I see a different law in my members.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I see a different law in my members.', 'I see a different law in my members (Romans 7:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 7, what does Paul say about the law (Rom 7:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 1, 'According to Romans 7, what does Paul say about Christ?', '["Thanks be to God through Jesus Christ our Lord!", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Thanks be to God through Jesus Christ our Lord!', 'Thanks be to God through Jesus Christ our Lord! (Romans 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 7, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 2, 'According to Romans 7, what does Paul say about the law (Rom 7:7)?', '["through the law comes the knowledge of sin", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'through the law comes the knowledge of sin', 'through the law comes the knowledge of sin (Romans 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 7, what does Paul say about the law (Rom 7:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 2, 'According to Romans 7, what does Paul say about sin?', '["sin, finding occasion through the commandment", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'sin, finding occasion through the commandment', 'sin, finding occasion through the commandment (Romans 7:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 7, what does Paul say about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 2, 'According to Romans 7, what does Paul say about the law (Rom 7:13)?', '["the law is spiritual, but I am fleshly", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the law is spiritual, but I am fleshly', 'the law is spiritual, but I am fleshly (Romans 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 7, what does Paul say about the law (Rom 7:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 2, 'According to Romans 7, what does Paul say about the law (Rom 7:14)?', '["I see a different law in my members", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'I see a different law in my members', 'I see a different law in my members (Romans 7:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 7, what does Paul say about the law (Rom 7:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 2, 'According to Romans 7, what does Paul say?', '["Who will deliver me", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Who will deliver me', 'Who will deliver me (Romans 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 7, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 3, 'What does Romans 7 teach about sin?', '["Sin, finding occasion through the commandment, deceived me.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Sin, finding occasion through the commandment, deceived me.', 'Sin, finding occasion through the commandment, deceived me (Romans 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 7 teach about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 3, 'What does Romans 7 teach about the law (Rom 7:11)?', '["The law is spiritual, but I am fleshly.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The law is spiritual, but I am fleshly.', 'The law is spiritual, but I am fleshly (Romans 7:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 7 teach about the law (Rom 7:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 3, 'What does Romans 7 teach about the law (Rom 7:13)?', '["I see a different law in my members.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I see a different law in my members.', 'I see a different law in my members (Romans 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 7 teach about the law (Rom 7:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 3, 'What does Romans 7 teach about Christ?', '["Thanks be to God through Jesus Christ our Lord!", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Thanks be to God through Jesus Christ our Lord!', 'Thanks be to God through Jesus Christ our Lord! (Romans 7:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 7 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 3, 'What does Romans 7 teach about the law (Rom 7:22)?', '["Through the law comes the knowledge of sin.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Through the law comes the knowledge of sin.', 'Through the law comes the knowledge of sin (Romans 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 7 teach about the law (Rom 7:22)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 4, 'Which phrase in Romans 7 speaks about sin?', '["sin, finding occasion through the commandment", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'sin, finding occasion through the commandment', 'sin, finding occasion through the commandment (Romans 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 7 speaks about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 4, 'Which phrase in Romans 7 speaks about the law (Rom 7:11)?', '["the law is spiritual, but I am fleshly", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the law is spiritual, but I am fleshly', 'the law is spiritual, but I am fleshly (Romans 7:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 7 speaks about the law (Rom 7:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 4, 'Which phrase in Romans 7 speaks about the law (Rom 7:13)?', '["I see a different law in my members", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'I see a different law in my members', 'I see a different law in my members (Romans 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 7 speaks about the law (Rom 7:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 4, 'Which phrase belongs in Romans 7?', '["Who will deliver me", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Who will deliver me', 'Who will deliver me (Romans 7:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 4, 'Which phrase in Romans 7 speaks about Christ?', '["I thank God through Jesus Christ our Lord!", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'I thank God through Jesus Christ our Lord!', 'I thank God through Jesus Christ our Lord! (Romans 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 7 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 5, 'What major point does Romans 7 make about the law (Rom 7:7)?', '["The law is spiritual, but I am fleshly.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The law is spiritual, but I am fleshly.', 'The law is spiritual, but I am fleshly (Romans 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 7 make about the law (Rom 7:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 5, 'What major point does Romans 7 make about the law (Rom 7:11)?', '["I see a different law in my members.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I see a different law in my members.', 'I see a different law in my members (Romans 7:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 7 make about the law (Rom 7:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 5, 'What major point does Romans 7 make about Christ?', '["Thanks be to God through Jesus Christ our Lord!", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Thanks be to God through Jesus Christ our Lord!', 'Thanks be to God through Jesus Christ our Lord! (Romans 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 7 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 5, 'What major point does Romans 7 make about the law (Rom 7:14)?', '["Through the law comes the knowledge of sin.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Through the law comes the knowledge of sin.', 'Through the law comes the knowledge of sin (Romans 7:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 7 make about the law (Rom 7:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 7, 5, 'What major point does Romans 7 make about sin?', '["Sin, finding occasion through the commandment, deceived me.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Sin, finding occasion through the commandment, deceived me.', 'Sin, finding occasion through the commandment, deceived me (Romans 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 7 make about sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 1, 'According to Romans 8, what is stated about therefore now no condemnation?', '["There is therefore now no condemnation.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is therefore now no condemnation.', 'There is therefore now no condemnation (Romans 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 8, what is stated about therefore now no condemnation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 1, 'According to Romans 8, what does Paul say about the law?', '["The law of the Spirit of life in Christ Jesus made me free.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The law of the Spirit of life in Christ Jesus made me free.', 'The law of the Spirit of life in Christ Jesus made me free (Romans 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 8, what does Paul say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 1, 'According to Romans 8, what does Paul say about the Spirit?', '["You are not in the flesh but in the Spirit.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You are not in the flesh but in the Spirit.', 'You are not in the flesh but in the Spirit (Romans 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 8, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 1, 'According to Romans 8, what does Paul say?', '["We are children of God, and if children, then heirs.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We are children of God, and if children, then heirs.', 'We are children of God, and if children, then heirs (Romans 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 1, 'According to Romans 8, Who shall separate us from the love of Christ?', '["Who shall separate us from the love of Christ?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Who shall separate us from the love of Christ?', 'Who shall separate us from the love of Christ? (Romans 8:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 8, Who shall separate us from the love of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 2, 'According to Romans 8, what is stated about therefore now no condemnation?', '["There is therefore now no condemnation", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'There is therefore now no condemnation', 'There is therefore now no condemnation (Romans 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 8, what is stated about therefore now no condemnation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 2, 'According to Romans 8, what does Paul say about the law?', '["the law of the Spirit of life", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the law of the Spirit of life', 'the law of the Spirit of life (Romans 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 8, what does Paul say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 2, 'According to Romans 8, what does Paul say about the Spirit?', '["the Spirit of God dwells in you", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the Spirit of God dwells in you', 'the Spirit of God dwells in you (Romans 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 8, what does Paul say about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 2, 'According to Romans 8, what does Paul say about Christ?', '["heirs of God, and joint heirs with Christ", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'heirs of God, and joint heirs with Christ', 'heirs of God, and joint heirs with Christ (Romans 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 8, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 2, 'According to Romans 8, what does Paul say?', '["the sufferings of this present time are not worthy to be compared", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the sufferings of this present time are not worthy to be compared', 'the sufferings of this present time are not worthy to be compared (Romans 8:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 3, 'What does Romans 8 teach about the law?', '["The law of the Spirit of life in Christ Jesus made me free.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The law of the Spirit of life in Christ Jesus made me free.', 'The law of the Spirit of life in Christ Jesus made me free (Romans 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 8 teach about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 3, 'What does Romans 8 teach about the Spirit?', '["You are not in the flesh but in the Spirit.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You are not in the flesh but in the Spirit.', 'You are not in the flesh but in the Spirit (Romans 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 8 teach about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 3, 'According to Romans 8, what does Paul say?', '["We are children of God, and if children, then heirs.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We are children of God, and if children, then heirs.', 'We are children of God, and if children, then heirs (Romans 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 3, 'According to Romans 8, Who shall separate us from the love of Christ?', '["Who shall separate us from the love of Christ?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Who shall separate us from the love of Christ?', 'Who shall separate us from the love of Christ? (Romans 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 8, Who shall separate us from the love of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 3, 'According to Romans 8, what is stated about therefore now no condemnation?', '["There is therefore now no condemnation.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is therefore now no condemnation.', 'There is therefore now no condemnation (Romans 8:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 8, what is stated about therefore now no condemnation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 4, 'Which phrase in Romans 8 speaks about the law?', '["the law of the Spirit of life", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the law of the Spirit of life', 'the law of the Spirit of life (Romans 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 8 speaks about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 4, 'Which phrase in Romans 8 speaks about the Spirit?', '["the Spirit of God dwells in you", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the Spirit of God dwells in you', 'the Spirit of God dwells in you (Romans 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 8 speaks about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 4, 'Which phrase in Romans 8 speaks about Christ?', '["heirs of God, and joint heirs with Christ", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'heirs of God, and joint heirs with Christ', 'heirs of God, and joint heirs with Christ (Romans 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 8 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 4, 'Which phrase belongs in Romans 8 (Rom 8:11)?', '["the sufferings of this present time are not worthy to be compared", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the sufferings of this present time are not worthy to be compared', 'the sufferings of this present time are not worthy to be compared (Romans 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 8 (Rom 8:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 4, 'Which phrase belongs in Romans 8 (Rom 8:14)?', '["all things work together for good", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'all things work together for good', 'all things work together for good (Romans 8:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 8 (Rom 8:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 5, 'What major point does Romans 8 make about the Spirit?', '["You are not in the flesh but in the Spirit.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You are not in the flesh but in the Spirit.', 'You are not in the flesh but in the Spirit (Romans 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 8 make about the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 5, 'According to Romans 8, what does Paul say?', '["We are children of God, and if children, then heirs.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We are children of God, and if children, then heirs.', 'We are children of God, and if children, then heirs (Romans 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 8, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 5, 'According to Romans 8, Who shall separate us from the love of Christ?', '["Who shall separate us from the love of Christ?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Who shall separate us from the love of Christ?', 'Who shall separate us from the love of Christ? (Romans 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 8, Who shall separate us from the love of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 5, 'According to Romans 8, what is stated about therefore now no condemnation?', '["There is therefore now no condemnation.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is therefore now no condemnation.', 'There is therefore now no condemnation (Romans 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 8, what is stated about therefore now no condemnation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 8, 5, 'What major point does Romans 8 make about the law?', '["The law of the Spirit of life in Christ Jesus made me free.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The law of the Spirit of life in Christ Jesus made me free.', 'The law of the Spirit of life in Christ Jesus made me free (Romans 8:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 8 make about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 1, 'According to Romans 9, what does Paul say about Israel?', '["Not all who are descended from Israel are Israel.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Not all who are descended from Israel are Israel.', 'Not all who are descended from Israel are Israel (Romans 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 9, what does Paul say about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 1, 'According to Romans 9, what does Paul say (Rom 9:8)?', '["It is not the children of the flesh who are children of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'It is not the children of the flesh who are children of God.', 'It is not the children of the flesh who are children of God (Romans 9:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 9, what does Paul say (Rom 9:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 1, 'According to Romans 9, what does Paul say (Rom 9:11)?', '["I will have mercy on whom I have mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I will have mercy on whom I have mercy.', 'I will have mercy on whom I have mercy (Romans 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 9, what does Paul say (Rom 9:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 1, 'According to Romans 9, what does Paul say (Rom 9:15)?', '["So then it is not of him who wills, nor of him who runs, but of God who has mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'So then it is not of him who wills, nor of him who runs, but of God who has mercy.', 'So then it is not of him who wills, nor of him who runs, but of God who has mercy (Romans 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 9, what does Paul say (Rom 9:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 1, 'According to Romans 9, what does Paul say (Rom 9:16)?', '["They stumbled over the stumbling stone.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'They stumbled over the stumbling stone.', 'They stumbled over the stumbling stone (Romans 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 9, what does Paul say (Rom 9:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 2, 'According to Romans 9, what does Paul say about Israel?', '["not all who are descended from Israel are Israel", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'not all who are descended from Israel are Israel', 'not all who are descended from Israel are Israel (Romans 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 9, what does Paul say about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 2, 'According to Romans 9, what does Paul say (Rom 9:8)?', '["the children of the promise are counted as a seed", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the children of the promise are counted as a seed', 'the children of the promise are counted as a seed (Romans 9:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 9, what does Paul say (Rom 9:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 2, 'According to Romans 9, what does Paul say (Rom 9:11)?', '["I will have mercy on whom I have mercy", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'I will have mercy on whom I have mercy', 'I will have mercy on whom I have mercy (Romans 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 9, what does Paul say (Rom 9:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 2, 'According to Romans 9, what does Paul say (Rom 9:15)?', '["So then it is not of him who wills", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'So then it is not of him who wills', 'So then it is not of him who wills (Romans 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 9, what does Paul say (Rom 9:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 2, 'According to Romans 9, what does Paul say about the Jews?', '["even us whom he also called, not from the Jews only", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'even us whom he also called, not from the Jews only', 'even us whom he also called, not from the Jews only (Romans 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 9, what does Paul say about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 3, 'What does Romans 9 teach (Rom 9:6)?', '["It is not the children of the flesh who are children of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'It is not the children of the flesh who are children of God.', 'It is not the children of the flesh who are children of God (Romans 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 9 teach (Rom 9:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 3, 'What does Romans 9 teach (Rom 9:8)?', '["I will have mercy on whom I have mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I will have mercy on whom I have mercy.', 'I will have mercy on whom I have mercy (Romans 9:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 9 teach (Rom 9:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 3, 'What does Romans 9 teach (Rom 9:11)?', '["So then it is not of him who wills, nor of him who runs, but of God who has mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'So then it is not of him who wills, nor of him who runs, but of God who has mercy.', 'So then it is not of him who wills, nor of him who runs, but of God who has mercy (Romans 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 9 teach (Rom 9:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 3, 'What does Romans 9 teach (Rom 9:15)?', '["They stumbled over the stumbling stone.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'They stumbled over the stumbling stone.', 'They stumbled over the stumbling stone (Romans 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 9 teach (Rom 9:15)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 3, 'What does Romans 9 teach about Israel?', '["Not all who are descended from Israel are Israel.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Not all who are descended from Israel are Israel.', 'Not all who are descended from Israel are Israel (Romans 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 9 teach about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 4, 'Which phrase belongs in Romans 9 (Rom 9:6)?', '["the children of the promise are counted as a seed", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the children of the promise are counted as a seed', 'the children of the promise are counted as a seed (Romans 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 9 (Rom 9:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 4, 'Which phrase belongs in Romans 9 (Rom 9:8)?', '["I will have mercy on whom I have mercy", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'I will have mercy on whom I have mercy', 'I will have mercy on whom I have mercy (Romans 9:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 9 (Rom 9:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 4, 'Which phrase belongs in Romans 9 (Rom 9:11)?', '["So then it is not of him who wills", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'So then it is not of him who wills', 'So then it is not of him who wills (Romans 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 9 (Rom 9:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 4, 'Which phrase in Romans 9 speaks about the Jews?', '["even us whom he also called, not from the Jews only", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'even us whom he also called, not from the Jews only', 'even us whom he also called, not from the Jews only (Romans 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 9 speaks about the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 4, 'Which phrase belongs in Romans 9 (Rom 9:16)?', '["They stumbled over the stumbling stone", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'They stumbled over the stumbling stone', 'They stumbled over the stumbling stone (Romans 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 9 (Rom 9:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 5, 'What major point is made in Romans 9 (Rom 9:6)?', '["I will have mercy on whom I have mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I will have mercy on whom I have mercy.', 'I will have mercy on whom I have mercy (Romans 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 9 (Rom 9:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 5, 'What major point is made in Romans 9 (Rom 9:8)?', '["So then it is not of him who wills, nor of him who runs, but of God who has mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'So then it is not of him who wills, nor of him who runs, but of God who has mercy.', 'So then it is not of him who wills, nor of him who runs, but of God who has mercy (Romans 9:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 9 (Rom 9:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 5, 'What major point is made in Romans 9 (Rom 9:11)?', '["They stumbled over the stumbling stone.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'They stumbled over the stumbling stone.', 'They stumbled over the stumbling stone (Romans 9:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 9 (Rom 9:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 5, 'What major point does Romans 9 make about Israel?', '["Not all who are descended from Israel are Israel.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Not all who are descended from Israel are Israel.', 'Not all who are descended from Israel are Israel (Romans 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 9 make about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 9, 5, 'What major point is made in Romans 9 (Rom 9:16)?', '["It is not the children of the flesh who are children of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'It is not the children of the flesh who are children of God.', 'It is not the children of the flesh who are children of God (Romans 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 9 (Rom 9:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 1, 'According to Romans 10, what does Paul say about God''s righteousness (Rom 10:2)?', '["They being ignorant of God’s righteousness sought to establish their own.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'They being ignorant of God’s righteousness sought to establish their own.', 'They being ignorant of God’s righteousness sought to establish their own (Romans 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 10, what does Paul say about God''s righteousness (Rom 10:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 1, 'According to Romans 10, what does Paul say about God''s righteousness (Rom 10:3)?', '["Christ is the end of the law for righteousness to everyone who believes.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Christ is the end of the law for righteousness to everyone who believes.', 'Christ is the end of the law for righteousness to everyone who believes (Romans 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 10, what does Paul say about God''s righteousness (Rom 10:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 1, 'According to Romans 10, what does Paul say about Jesus Christ?', '["If you will confess with your mouth that Jesus is Lord", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'If you will confess with your mouth that Jesus is Lord', 'If you will confess with your mouth that Jesus is Lord (Romans 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 10, what does Paul say about Jesus Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 1, 'According to Romans 10, what does Paul say about faith?', '["Faith comes by hearing, and hearing by the word of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Faith comes by hearing, and hearing by the word of God.', 'Faith comes by hearing, and hearing by the word of God (Romans 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 10, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 1, 'According to Romans 10, what does Paul say?', '["All day long I spread out my hands to a disobedient people.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'All day long I spread out my hands to a disobedient people.', 'All day long I spread out my hands to a disobedient people (Romans 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 10, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 2, 'According to Romans 10, what does Paul say about God''s righteousness?', '["They being ignorant of God’s righteousness", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'They being ignorant of God’s righteousness', 'They being ignorant of God’s righteousness (Romans 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 10, what does Paul say about God''s righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 2, 'According to Romans 10, what does Paul say about the law?', '["Christ is the end of the law", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Christ is the end of the law', 'Christ is the end of the law (Romans 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 10, what does Paul say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 2, 'According to Romans 10, what does Paul say (Rom 10:4)?', '["if you will confess with your mouth", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'if you will confess with your mouth', 'if you will confess with your mouth (Romans 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 10, what does Paul say (Rom 10:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 2, 'According to Romans 10, what does Paul say (Rom 10:9)?', '["Whoever believes in him will not be disappointed", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Whoever believes in him will not be disappointed', 'Whoever believes in him will not be disappointed (Romans 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 10, what does Paul say (Rom 10:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 2, 'According to Romans 10, what does Paul say about faith?', '["faith comes by hearing", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'faith comes by hearing', 'faith comes by hearing (Romans 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 10, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 3, 'What does Romans 10 teach about God''s righteousness (Rom 10:2)?', '["Christ is the end of the law for righteousness to everyone who believes.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Christ is the end of the law for righteousness to everyone who believes.', 'Christ is the end of the law for righteousness to everyone who believes (Romans 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 10 teach about God''s righteousness (Rom 10:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 3, 'What does Romans 10 teach about Jesus Christ?', '["If you will confess with your mouth that Jesus is Lord", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'If you will confess with your mouth that Jesus is Lord', 'If you will confess with your mouth that Jesus is Lord (Romans 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 10 teach about Jesus Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 3, 'What does Romans 10 teach about faith?', '["Faith comes by hearing, and hearing by the word of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Faith comes by hearing, and hearing by the word of God.', 'Faith comes by hearing, and hearing by the word of God (Romans 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 10 teach about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 3, 'What does Romans 10 teach?', '["All day long I spread out my hands to a disobedient people.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'All day long I spread out my hands to a disobedient people.', 'All day long I spread out my hands to a disobedient people (Romans 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 10 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 3, 'What does Romans 10 teach about God''s righteousness (Rom 10:10)?', '["They being ignorant of God’s righteousness sought to establish their own.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'They being ignorant of God’s righteousness sought to establish their own.', 'They being ignorant of God’s righteousness sought to establish their own (Romans 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 10 teach about God''s righteousness (Rom 10:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 4, 'Which phrase in Romans 10 speaks about the law?', '["Christ is the end of the law", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Christ is the end of the law', 'Christ is the end of the law (Romans 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 10 speaks about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 4, 'Which phrase belongs in Romans 10 (Rom 10:3)?', '["if you will confess with your mouth", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'if you will confess with your mouth', 'if you will confess with your mouth (Romans 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 10 (Rom 10:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 4, 'Which phrase belongs in Romans 10 (Rom 10:4)?', '["Whoever believes in him will not be disappointed", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Whoever believes in him will not be disappointed', 'Whoever believes in him will not be disappointed (Romans 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 10 (Rom 10:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 4, 'Which phrase in Romans 10 speaks about faith?', '["faith comes by hearing", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'faith comes by hearing', 'faith comes by hearing (Romans 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 10 speaks about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 4, 'Which phrase belongs in Romans 10 (Rom 10:10)?', '["Did they not hear? Yes, they did", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Did they not hear? Yes, they did', 'Did they not hear? Yes, they did (Romans 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 10 (Rom 10:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 5, 'What major point does Romans 10 make about Jesus Christ?', '["If you will confess with your mouth that Jesus is Lord", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'If you will confess with your mouth that Jesus is Lord', 'If you will confess with your mouth that Jesus is Lord (Romans 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 10 make about Jesus Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 5, 'What major point does Romans 10 make about faith?', '["Faith comes by hearing, and hearing by the word of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Faith comes by hearing, and hearing by the word of God.', 'Faith comes by hearing, and hearing by the word of God (Romans 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 10 make about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 5, 'What major point is made in Romans 10?', '["All day long I spread out my hands to a disobedient people.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'All day long I spread out my hands to a disobedient people.', 'All day long I spread out my hands to a disobedient people (Romans 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 5, 'What major point does Romans 10 make about God''s righteousness (Rom 10:9)?', '["They being ignorant of God’s righteousness sought to establish their own.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'They being ignorant of God’s righteousness sought to establish their own.', 'They being ignorant of God’s righteousness sought to establish their own (Romans 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 10 make about God''s righteousness (Rom 10:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 10, 5, 'What major point does Romans 10 make about God''s righteousness (Rom 10:10)?', '["Christ is the end of the law for righteousness to everyone who believes.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Christ is the end of the law for righteousness to everyone who believes.', 'Christ is the end of the law for righteousness to everyone who believes (Romans 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 10 make about God''s righteousness (Rom 10:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 1, 'According to Romans 11, what has God done?', '["God has not rejected his people whom he foreknew.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God has not rejected his people whom he foreknew.', 'God has not rejected his people whom he foreknew (Romans 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 11, what has God done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 1, 'According to Romans 11, what is stated about also a remnant according to the election of grace?', '["There is also a remnant according to the election of grace.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is also a remnant according to the election of grace.', 'There is also a remnant according to the election of grace (Romans 11:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 11, what is stated about also a remnant according to the election of grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 1, 'According to Romans 11, what does Paul say (Rom 11:17)?', '["If the root is holy, so are the branches.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'If the root is holy, so are the branches.', 'If the root is holy, so are the branches (Romans 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 11, what does Paul say (Rom 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 1, 'According to Romans 11, what does Paul say (Rom 11:18)?', '["You do not support the root, but the root supports you.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You do not support the root, but the root supports you.', 'You do not support the root, but the root supports you (Romans 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 11, what does Paul say (Rom 11:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 1, 'According to Romans 11, what does Paul say about Israel?', '["All Israel will be saved.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'All Israel will be saved.', 'All Israel will be saved (Romans 11:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 11, what does Paul say about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 2, 'According to Romans 11, what has God done?', '["God has not rejected his people", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'God has not rejected his people', 'God has not rejected his people (Romans 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 11, what has God done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 2, 'According to Romans 11, what does Paul say about grace?', '["a remnant according to the election of grace", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'a remnant according to the election of grace', 'a remnant according to the election of grace (Romans 11:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 11, what does Paul say about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 2, 'According to Romans 11, what does Paul say (Rom 11:17)?', '["if some of the branches were broken off", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'if some of the branches were broken off', 'if some of the branches were broken off (Romans 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 11, what does Paul say (Rom 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 2, 'According to Romans 11, what does Paul say (Rom 11:18)?', '["don’t be conceited", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'don’t be conceited', 'don’t be conceited (Romans 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 11, what does Paul say (Rom 11:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 2, 'According to Romans 11, what does Paul say about Israel?', '["all Israel will be saved", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'all Israel will be saved', 'all Israel will be saved (Romans 11:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 11, what does Paul say about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 3, 'According to Romans 11, what is stated about also a remnant according to the election of grace?', '["There is also a remnant according to the election of grace.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is also a remnant according to the election of grace.', 'There is also a remnant according to the election of grace (Romans 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 11, what is stated about also a remnant according to the election of grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 3, 'What does Romans 11 teach (Rom 11:5)?', '["If the root is holy, so are the branches.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'If the root is holy, so are the branches.', 'If the root is holy, so are the branches (Romans 11:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 11 teach (Rom 11:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 3, 'What does Romans 11 teach (Rom 11:17)?', '["You do not support the root, but the root supports you.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You do not support the root, but the root supports you.', 'You do not support the root, but the root supports you (Romans 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 11 teach (Rom 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 3, 'What does Romans 11 teach about Israel?', '["All Israel will be saved.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'All Israel will be saved.', 'All Israel will be saved (Romans 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 11 teach about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 3, 'According to Romans 11, what has God done?', '["God has not rejected his people whom he foreknew.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God has not rejected his people whom he foreknew.', 'God has not rejected his people whom he foreknew (Romans 11:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 11, what has God done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 4, 'Which phrase in Romans 11 speaks about grace?', '["a remnant according to the election of grace", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'a remnant according to the election of grace', 'a remnant according to the election of grace (Romans 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 11 speaks about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 4, 'Which phrase belongs in Romans 11 (Rom 11:5)?', '["if some of the branches were broken off", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'if some of the branches were broken off', 'if some of the branches were broken off (Romans 11:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 11 (Rom 11:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 4, 'Which phrase belongs in Romans 11 (Rom 11:17)?', '["don’t be conceited", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'don’t be conceited', 'don’t be conceited (Romans 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 11 (Rom 11:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 4, 'Which phrase in Romans 11 speaks about Israel?', '["all Israel will be saved", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'all Israel will be saved', 'all Israel will be saved (Romans 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 11 speaks about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 4, 'Which phrase belongs in Romans 11 (Rom 11:20)?', '["the gifts and the calling of God are irrevocable", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the gifts and the calling of God are irrevocable', 'the gifts and the calling of God are irrevocable (Romans 11:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 11 (Rom 11:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 5, 'What major point is made in Romans 11 (Rom 11:1)?', '["If the root is holy, so are the branches.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'If the root is holy, so are the branches.', 'If the root is holy, so are the branches (Romans 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 11 (Rom 11:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 5, 'What major point is made in Romans 11 (Rom 11:5)?', '["You do not support the root, but the root supports you.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'You do not support the root, but the root supports you.', 'You do not support the root, but the root supports you (Romans 11:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 11 (Rom 11:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 5, 'What major point does Romans 11 make about Israel?', '["All Israel will be saved.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'All Israel will be saved.', 'All Israel will be saved (Romans 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 11 make about Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 5, 'According to Romans 11, what has God done?', '["God has not rejected his people whom he foreknew.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'God has not rejected his people whom he foreknew.', 'God has not rejected his people whom he foreknew (Romans 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 11, what has God done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 11, 5, 'According to Romans 11, what is stated about also a remnant according to the election of grace?', '["There is also a remnant according to the election of grace.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is also a remnant according to the election of grace.', 'There is also a remnant according to the election of grace (Romans 11:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 11, what is stated about also a remnant according to the election of grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 1, 'According to Romans 12, what does Paul say (Rom 12:1)?', '["Present your bodies a living sacrifice.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Present your bodies a living sacrifice.', 'Present your bodies a living sacrifice (Romans 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 12, what does Paul say (Rom 12:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 1, 'According to Romans 12, what does Paul say (Rom 12:2)?', '["Do not be conformed to this world.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Do not be conformed to this world.', 'Do not be conformed to this world (Romans 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 12, what does Paul say (Rom 12:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 1, 'According to Romans 12, what does Paul say (Rom 12:4)?', '["We have many members in one body.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We have many members in one body.', 'We have many members in one body (Romans 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 12, what does Paul say (Rom 12:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 1, 'According to Romans 12, what does Paul say about God''s love?', '["Let love be without hypocrisy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Let love be without hypocrisy.', 'Let love be without hypocrisy (Romans 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 12, what does Paul say about God''s love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 1, 'According to Romans 12, what does Paul say (Rom 12:9)?', '["Do not be overcome by evil, but overcome evil with good.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Do not be overcome by evil, but overcome evil with good.', 'Do not be overcome by evil, but overcome evil with good (Romans 12:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 12, what does Paul say (Rom 12:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 2, 'According to Romans 12, what does Paul say (Rom 12:1)?', '["present your bodies a living sacrifice", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'present your bodies a living sacrifice', 'present your bodies a living sacrifice (Romans 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 12, what does Paul say (Rom 12:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 2, 'According to Romans 12, what does Paul say (Rom 12:2)?', '["don’t be conformed to this world", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'don’t be conformed to this world', 'don’t be conformed to this world (Romans 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 12, what does Paul say (Rom 12:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 2, 'According to Romans 12, what does Paul say about Christ?', '["we, who are many, are one body in Christ", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'we, who are many, are one body in Christ', 'we, who are many, are one body in Christ (Romans 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 12, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 2, 'According to Romans 12, what does Paul say about God''s love?', '["Let love be without hypocrisy", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Let love be without hypocrisy', 'Let love be without hypocrisy (Romans 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 12, what does Paul say about God''s love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 2, 'According to Romans 12, what does Paul say (Rom 12:9)?', '["Bless those who persecute you", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Bless those who persecute you', 'Bless those who persecute you (Romans 12:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 12, what does Paul say (Rom 12:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 3, 'What does Romans 12 teach (Rom 12:1)?', '["Do not be conformed to this world.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Do not be conformed to this world.', 'Do not be conformed to this world (Romans 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 12 teach (Rom 12:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 3, 'According to Romans 12, what does Paul say?', '["We have many members in one body.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We have many members in one body.', 'We have many members in one body (Romans 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 12, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 3, 'What does Romans 12 teach about God''s love?', '["Let love be without hypocrisy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Let love be without hypocrisy.', 'Let love be without hypocrisy (Romans 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 12 teach about God''s love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 3, 'What does Romans 12 teach (Rom 12:5)?', '["Do not be overcome by evil, but overcome evil with good.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Do not be overcome by evil, but overcome evil with good.', 'Do not be overcome by evil, but overcome evil with good (Romans 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 12 teach (Rom 12:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 3, 'What does Romans 12 teach (Rom 12:9)?', '["Present your bodies a living sacrifice.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Present your bodies a living sacrifice.', 'Present your bodies a living sacrifice (Romans 12:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 12 teach (Rom 12:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 4, 'Which phrase belongs in Romans 12 (Rom 12:1)?', '["don’t be conformed to this world", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'don’t be conformed to this world', 'don’t be conformed to this world (Romans 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 12 (Rom 12:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 4, 'Which phrase in Romans 12 speaks about Christ?', '["we, who are many, are one body in Christ", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'we, who are many, are one body in Christ', 'we, who are many, are one body in Christ (Romans 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 12 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 4, 'Which phrase in Romans 12 speaks about God''s love?', '["Let love be without hypocrisy", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Let love be without hypocrisy', 'Let love be without hypocrisy (Romans 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 12 speaks about God''s love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 4, 'Which phrase belongs in Romans 12 (Rom 12:5)?', '["Bless those who persecute you", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Bless those who persecute you', 'Bless those who persecute you (Romans 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 12 (Rom 12:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 4, 'Which phrase belongs in Romans 12 (Rom 12:9)?', '["Do not be overcome by evil, but overcome evil with good", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Do not be overcome by evil, but overcome evil with good', 'Do not be overcome by evil, but overcome evil with good (Romans 12:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 12 (Rom 12:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 5, 'According to Romans 12, what does Paul say?', '["We have many members in one body.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We have many members in one body.', 'We have many members in one body (Romans 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 12, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 5, 'What major point does Romans 12 make about God''s love?', '["Let love be without hypocrisy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Let love be without hypocrisy.', 'Let love be without hypocrisy (Romans 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 12 make about God''s love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 5, 'What major point is made in Romans 12 (Rom 12:4)?', '["Do not be overcome by evil, but overcome evil with good.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Do not be overcome by evil, but overcome evil with good.', 'Do not be overcome by evil, but overcome evil with good (Romans 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 12 (Rom 12:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 5, 'What major point is made in Romans 12 (Rom 12:5)?', '["Present your bodies a living sacrifice.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Present your bodies a living sacrifice.', 'Present your bodies a living sacrifice (Romans 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 12 (Rom 12:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 12, 5, 'What major point is made in Romans 12 (Rom 12:9)?', '["Do not be conformed to this world.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Do not be conformed to this world.', 'Do not be conformed to this world (Romans 12:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 12 (Rom 12:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 1, 'According to Romans 13, what is true about authority except from god?', '["There is no authority except from God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no authority except from God.', 'There is no authority except from God (Romans 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 13, what is true about authority except from god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 1, 'According to Romans 13, what does Paul say (Rom 13:3)?', '["Rulers are not a terror to the good work.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Rulers are not a terror to the good work.', 'Rulers are not a terror to the good work (Romans 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 13, what does Paul say (Rom 13:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 1, 'According to Romans 13, what does Paul say about the law?', '["Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law.', 'Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law (Romans 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 13, what does Paul say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 1, 'According to Romans 13, what does Paul say (Rom 13:10)?', '["It is already time for you to awaken from sleep.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'It is already time for you to awaken from sleep.', 'It is already time for you to awaken from sleep (Romans 13:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 13, what does Paul say (Rom 13:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 1, 'According to Romans 13, what does Paul say about Christ?', '["Put on the Lord Jesus Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Put on the Lord Jesus Christ.', 'Put on the Lord Jesus Christ (Romans 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 13, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 2, 'According to Romans 13, what does Paul say (Rom 13:1)?', '["Let every soul be in subjection to the higher authorities", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Let every soul be in subjection to the higher authorities', 'Let every soul be in subjection to the higher authorities (Romans 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 13, what does Paul say (Rom 13:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 2, 'According to Romans 13, what is true about authority except from god?', '["there is no authority except from God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'there is no authority except from God', 'there is no authority except from God (Romans 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 13, what is true about authority except from god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 2, 'According to Romans 13, what does Paul say (Rom 13:4)?', '["rulers are not a terror to good work", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'rulers are not a terror to good work', 'rulers are not a terror to good work (Romans 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 13, what does Paul say (Rom 13:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 2, 'According to Romans 13, what does Paul say about the law?', '["love is therefore the fulfillment of the law", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'love is therefore the fulfillment of the law', 'love is therefore the fulfillment of the law (Romans 13:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 13, what does Paul say about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 2, 'According to Romans 13, what does Paul say (Rom 13:11)?', '["knowing the time", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'knowing the time', 'knowing the time (Romans 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 13, what does Paul say (Rom 13:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 3, 'What does Romans 13 teach (Rom 13:1)?', '["Rulers are not a terror to the good work.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Rulers are not a terror to the good work.', 'Rulers are not a terror to the good work (Romans 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 13 teach (Rom 13:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 3, 'What does Romans 13 teach about the law?', '["Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law.', 'Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law (Romans 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 13 teach about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 3, 'What does Romans 13 teach (Rom 13:4)?', '["It is already time for you to awaken from sleep.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'It is already time for you to awaken from sleep.', 'It is already time for you to awaken from sleep (Romans 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 13 teach (Rom 13:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 3, 'What does Romans 13 teach about Christ?', '["Put on the Lord Jesus Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Put on the Lord Jesus Christ.', 'Put on the Lord Jesus Christ (Romans 13:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 13 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 3, 'According to Romans 13, what is true about authority except from god?', '["There is no authority except from God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no authority except from God.', 'There is no authority except from God (Romans 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 13, what is true about authority except from god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 4, 'According to Romans 13, what is true about authority except from god?', '["there is no authority except from God", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'there is no authority except from God', 'there is no authority except from God (Romans 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 13, what is true about authority except from god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 4, 'Which phrase belongs in Romans 13 (Rom 13:3)?', '["rulers are not a terror to good work", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'rulers are not a terror to good work', 'rulers are not a terror to good work (Romans 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 13 (Rom 13:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 4, 'Which phrase in Romans 13 speaks about the law?', '["love is therefore the fulfillment of the law", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'love is therefore the fulfillment of the law', 'love is therefore the fulfillment of the law (Romans 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 13 speaks about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 4, 'Which phrase belongs in Romans 13 (Rom 13:10)?', '["knowing the time", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'knowing the time', 'knowing the time (Romans 13:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 13 (Rom 13:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 4, 'Which phrase in Romans 13 speaks about Christ?', '["Put on the Lord Jesus Christ", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Put on the Lord Jesus Christ', 'Put on the Lord Jesus Christ (Romans 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 13 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 5, 'What major point does Romans 13 make about the law?', '["Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law.', 'Love doesn’t harm a neighbor. Love therefore is the fulfillment of the law (Romans 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 13 make about the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 5, 'What major point is made in Romans 13 (Rom 13:3)?', '["It is already time for you to awaken from sleep.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'It is already time for you to awaken from sleep.', 'It is already time for you to awaken from sleep (Romans 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 13 (Rom 13:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 5, 'What major point does Romans 13 make about Christ?', '["Put on the Lord Jesus Christ.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Put on the Lord Jesus Christ.', 'Put on the Lord Jesus Christ (Romans 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 13 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 5, 'According to Romans 13, what is true about authority except from god?', '["There is no authority except from God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'There is no authority except from God.', 'There is no authority except from God (Romans 13:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 13, what is true about authority except from god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 13, 5, 'What major point is made in Romans 13 (Rom 13:11)?', '["Rulers are not a terror to the good work.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Rulers are not a terror to the good work.', 'Rulers are not a terror to the good work (Romans 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 13 (Rom 13:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 1, 'According to Romans 14, what does Paul say about faith?', '["Receive one who is weak in faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Receive one who is weak in faith.', 'Receive one who is weak in faith (Romans 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 14, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 1, 'According to Romans 14, Who are you who judge another’s servant?', '["Who are you who judge another’s servant?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Who are you who judge another’s servant?', 'Who are you who judge another’s servant? (Romans 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 14, Who are you who judge another’s servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 1, 'According to Romans 14, what does Paul say (Rom 14:10)?', '["The Kingdom of God is not eating and drinking", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The Kingdom of God is not eating and drinking', 'The Kingdom of God is not eating and drinking (Romans 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 14, what does Paul say (Rom 14:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 1, 'According to Romans 14, what does Paul say (Rom 14:13)?', '["We ought to bear the weaknesses of the weak.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We ought to bear the weaknesses of the weak.', 'We ought to bear the weaknesses of the weak (Romans 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 14, what does Paul say (Rom 14:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 1, 'According to Romans 14, what does Paul say about Christ?', '["Therefore accept one another, even as Christ also accepted you.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Therefore accept one another, even as Christ also accepted you.', 'Therefore accept one another, even as Christ also accepted you (Romans 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 14, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 2, 'According to Romans 14, what does Paul say about faith?', '["Now accept one who is weak in faith", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Now accept one who is weak in faith', 'Now accept one who is weak in faith (Romans 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 14, what does Paul say about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 2, 'According to Romans 14, Who are you who judges another’s servant?', '["Who are you who judges another’s servant?", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Who are you who judges another’s servant?', 'Who are you who judges another’s servant? (Romans 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 14, Who are you who judges another’s servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 2, 'According to Romans 14, what does Paul say (Rom 14:10)?', '["the Kingdom of God is not eating and drinking", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the Kingdom of God is not eating and drinking', 'the Kingdom of God is not eating and drinking (Romans 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 14, what does Paul say (Rom 14:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 2, 'According to Romans 14, what does Paul say (Rom 14:13)?', '["We ought to bear the weaknesses of the weak", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'We ought to bear the weaknesses of the weak', 'We ought to bear the weaknesses of the weak (Romans 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 14, what does Paul say (Rom 14:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 2, 'According to Romans 14, what does Paul say (Rom 14:17)?', '["Therefore let’s follow after things which make for peace", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Therefore let’s follow after things which make for peace', 'Therefore let’s follow after things which make for peace (Romans 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 14, what does Paul say (Rom 14:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 3, 'According to Romans 14, Who are you who judge another’s servant?', '["Who are you who judge another’s servant?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Who are you who judge another’s servant?', 'Who are you who judge another’s servant? (Romans 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 14, Who are you who judge another’s servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 3, 'What does Romans 14 teach?', '["The Kingdom of God is not eating and drinking", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The Kingdom of God is not eating and drinking', 'The Kingdom of God is not eating and drinking (Romans 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 14 teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 3, 'According to Romans 14, what does Paul say?', '["We ought to bear the weaknesses of the weak.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We ought to bear the weaknesses of the weak.', 'We ought to bear the weaknesses of the weak (Romans 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to Romans 14, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 3, 'What does Romans 14 teach about Christ?', '["Therefore accept one another, even as Christ also accepted you.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Therefore accept one another, even as Christ also accepted you.', 'Therefore accept one another, even as Christ also accepted you (Romans 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 14 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 3, 'What does Romans 14 teach about faith?', '["Receive one who is weak in faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Receive one who is weak in faith.', 'Receive one who is weak in faith (Romans 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 14 teach about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 4, 'According to Romans 14, Who are you who judges another’s servant?', '["Who are you who judges another’s servant?", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Who are you who judges another’s servant?', 'Who are you who judges another’s servant? (Romans 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 14, Who are you who judges another’s servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 4, 'Which phrase belongs in Romans 14 (Rom 14:4)?', '["the Kingdom of God is not eating and drinking", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the Kingdom of God is not eating and drinking', 'the Kingdom of God is not eating and drinking (Romans 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 14 (Rom 14:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 4, 'According to Romans 14, what does Paul say?', '["We ought to bear the weaknesses of the weak", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'We ought to bear the weaknesses of the weak', 'We ought to bear the weaknesses of the weak (Romans 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Romans 14, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 4, 'Which phrase belongs in Romans 14 (Rom 14:13)?', '["Therefore let’s follow after things which make for peace", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Therefore let’s follow after things which make for peace', 'Therefore let’s follow after things which make for peace (Romans 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 14 (Rom 14:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 4, 'Which phrase belongs in Romans 14 (Rom 14:17)?', '["Therefore accept one another", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Therefore accept one another', 'Therefore accept one another (Romans 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 14 (Rom 14:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 5, 'What major point is made in Romans 14?', '["The Kingdom of God is not eating and drinking", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The Kingdom of God is not eating and drinking', 'The Kingdom of God is not eating and drinking (Romans 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 5, 'According to Romans 14, what does Paul say?', '["We ought to bear the weaknesses of the weak.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'We ought to bear the weaknesses of the weak.', 'We ought to bear the weaknesses of the weak (Romans 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 14, what does Paul say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 5, 'What major point does Romans 14 make about Christ?', '["Therefore accept one another, even as Christ also accepted you.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Therefore accept one another, even as Christ also accepted you.', 'Therefore accept one another, even as Christ also accepted you (Romans 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 14 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 5, 'What major point does Romans 14 make about faith?', '["Receive one who is weak in faith.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Receive one who is weak in faith.', 'Receive one who is weak in faith (Romans 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 14 make about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 14, 5, 'According to Romans 14, Who are you who judge another’s servant?', '["Who are you who judge another’s servant?", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Who are you who judge another’s servant?', 'Who are you who judge another’s servant? (Romans 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to Romans 14, Who are you who judge another’s servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 1, 'According to Romans 15, what does Paul say (Rom 15:2)?', '["Let each of us please his neighbor for good.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Let each of us please his neighbor for good.', 'Let each of us please his neighbor for good (Romans 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 15, what does Paul say (Rom 15:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 1, 'According to Romans 15, what does Paul say about Christ?', '["Now I say that Christ has been made a servant of the circumcision", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Now I say that Christ has been made a servant of the circumcision', 'Now I say that Christ has been made a servant of the circumcision (Romans 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 15, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 1, 'According to Romans 15, what does Paul say about the Gentiles?', '["Gentiles might glorify God for his mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Gentiles might glorify God for his mercy.', 'Gentiles might glorify God for his mercy (Romans 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 15, what does Paul say about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 1, 'According to Romans 15, what does Paul say (Rom 15:12)?', '["I have served as a priest the Good News of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I have served as a priest the Good News of God.', 'I have served as a priest the Good News of God (Romans 15:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 15, what does Paul say (Rom 15:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 1, 'According to Romans 15, what does Paul say (Rom 15:16)?', '["I will come to you when I go to Spain.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I will come to you when I go to Spain.', 'I will come to you when I go to Spain (Romans 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 15, what does Paul say (Rom 15:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 2, 'According to Romans 15, what does Paul say (Rom 15:2)?', '["Let each one of us please his neighbor for that which is good", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Let each one of us please his neighbor for that which is good', 'Let each one of us please his neighbor for that which is good (Romans 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 15, what does Paul say (Rom 15:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 2, 'According to Romans 15, what does Paul say about Christ (Rom 15:8)?', '["Christ has been made a servant of the circumcision", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Christ has been made a servant of the circumcision', 'Christ has been made a servant of the circumcision (Romans 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 15, what does Paul say about Christ (Rom 15:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 2, 'According to Romans 15, what does Paul say about the Gentiles?', '["the Gentiles might glorify God for his mercy", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the Gentiles might glorify God for his mercy', 'the Gentiles might glorify God for his mercy (Romans 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 15, what does Paul say about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 2, 'According to Romans 15, what does Paul say about Christ (Rom 15:12)?', '["that I should be a servant of Christ Jesus to the Gentiles", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'that I should be a servant of Christ Jesus to the Gentiles', 'that I should be a servant of Christ Jesus to the Gentiles (Romans 15:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 15, what does Paul say about Christ (Rom 15:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 2, 'According to Romans 15, what does Paul say (Rom 15:16)?', '["when I go to Spain, I will come to you", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'when I go to Spain, I will come to you', 'when I go to Spain, I will come to you (Romans 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 15, what does Paul say (Rom 15:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 3, 'What does Romans 15 teach about Christ?', '["Now I say that Christ has been made a servant of the circumcision", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Now I say that Christ has been made a servant of the circumcision', 'Now I say that Christ has been made a servant of the circumcision (Romans 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 15 teach about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 3, 'What does Romans 15 teach about the Gentiles?', '["Gentiles might glorify God for his mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Gentiles might glorify God for his mercy.', 'Gentiles might glorify God for his mercy (Romans 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 15 teach about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 3, 'What does Romans 15 teach (Rom 15:9)?', '["I have served as a priest the Good News of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I have served as a priest the Good News of God.', 'I have served as a priest the Good News of God (Romans 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 15 teach (Rom 15:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 3, 'What does Romans 15 teach (Rom 15:12)?', '["I will come to you when I go to Spain.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I will come to you when I go to Spain.', 'I will come to you when I go to Spain (Romans 15:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 15 teach (Rom 15:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 3, 'What does Romans 15 teach (Rom 15:16)?', '["Let each of us please his neighbor for good.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Let each of us please his neighbor for good.', 'Let each of us please his neighbor for good (Romans 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 15 teach (Rom 15:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 4, 'Which phrase in Romans 15 speaks about Christ (Rom 15:2)?', '["Christ has been made a servant of the circumcision", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Christ has been made a servant of the circumcision', 'Christ has been made a servant of the circumcision (Romans 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 15 speaks about Christ (Rom 15:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 4, 'Which phrase in Romans 15 speaks about the Gentiles?', '["the Gentiles might glorify God for his mercy", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'the Gentiles might glorify God for his mercy', 'the Gentiles might glorify God for his mercy (Romans 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 15 speaks about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 4, 'Which phrase in Romans 15 speaks about Christ (Rom 15:9)?', '["that I should be a servant of Christ Jesus to the Gentiles", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'that I should be a servant of Christ Jesus to the Gentiles', 'that I should be a servant of Christ Jesus to the Gentiles (Romans 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 15 speaks about Christ (Rom 15:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 4, 'Which phrase belongs in Romans 15 (Rom 15:12)?', '["when I go to Spain, I will come to you", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'when I go to Spain, I will come to you', 'when I go to Spain, I will come to you (Romans 15:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 15 (Rom 15:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 4, 'Which phrase belongs in Romans 15 (Rom 15:16)?', '["Let each one of us please his neighbor for that which is good", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Let each one of us please his neighbor for that which is good', 'Let each one of us please his neighbor for that which is good (Romans 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 15 (Rom 15:16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 5, 'What major point does Romans 15 make about the Gentiles?', '["Gentiles might glorify God for his mercy.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Gentiles might glorify God for his mercy.', 'Gentiles might glorify God for his mercy (Romans 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 15 make about the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 5, 'What major point is made in Romans 15 (Rom 15:8)?', '["I have served as a priest the Good News of God.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I have served as a priest the Good News of God.', 'I have served as a priest the Good News of God (Romans 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 15 (Rom 15:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 5, 'What major point is made in Romans 15 (Rom 15:9)?', '["I will come to you when I go to Spain.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I will come to you when I go to Spain.', 'I will come to you when I go to Spain (Romans 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 15 (Rom 15:9)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 5, 'What major point is made in Romans 15 (Rom 15:12)?', '["Let each of us please his neighbor for good.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Let each of us please his neighbor for good.', 'Let each of us please his neighbor for good (Romans 15:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 15 (Rom 15:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 15, 5, 'What major point does Romans 15 make about Christ?', '["Now I say that Christ has been made a servant of the circumcision", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Now I say that Christ has been made a servant of the circumcision', 'Now I say that Christ has been made a servant of the circumcision (Romans 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 15 make about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 1, 'According to Romans 16, what does Paul say (Rom 16:1)?', '["I commend to you Phoebe our sister.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I commend to you Phoebe our sister.', 'I commend to you Phoebe our sister (Romans 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 1, 'According to Romans 16, what does Paul say (Rom 16:3)?', '["Greet Prisca and Aquila.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Greet Prisca and Aquila.', 'Greet Prisca and Aquila (Romans 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 1, 'According to Romans 16, what does Paul say (Rom 16:17)?', '["Note those who cause divisions.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Note those who cause divisions.', 'Note those who cause divisions (Romans 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 1, 'According to Romans 16, what does Paul say (Rom 16:19)?', '["The God of peace will quickly crush Satan under your feet.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The God of peace will quickly crush Satan under your feet.', 'The God of peace will quickly crush Satan under your feet (Romans 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 1, 'According to Romans 16, what does Paul say about God''s glory?', '["To the only wise God be the glory forever.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'To the only wise God be the glory forever.', 'To the only wise God be the glory forever (Romans 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Romans 16, what does Paul say about God''s glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 2, 'According to Romans 16, what does Paul say (Rom 16:1)?', '["I commend to you Phoebe our sister", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'I commend to you Phoebe our sister', 'I commend to you Phoebe our sister (Romans 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 2, 'According to Romans 16, what does Paul say (Rom 16:3)?', '["Greet Prisca and Aquila", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Greet Prisca and Aquila', 'Greet Prisca and Aquila (Romans 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 2, 'According to Romans 16, what does Paul say (Rom 16:17)?', '["Now I beg you, brothers, look out for those", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Now I beg you, brothers, look out for those', 'Now I beg you, brothers, look out for those (Romans 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 2, 'According to Romans 16, what does Paul say (Rom 16:19)?', '["The God of peace will soon crush Satan under your feet", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'The God of peace will soon crush Satan under your feet', 'The God of peace will soon crush Satan under your feet (Romans 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 16, what does Paul say (Rom 16:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 2, 'According to Romans 16, what does Paul say about Christ?', '["to the only wise God, through Jesus Christ, be the glory forever", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'to the only wise God, through Jesus Christ, be the glory forever', 'to the only wise God, through Jesus Christ, be the glory forever (Romans 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Romans 16, what does Paul say about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 3, 'What does Romans 16 teach (Rom 16:1)?', '["Greet Prisca and Aquila.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Greet Prisca and Aquila.', 'Greet Prisca and Aquila (Romans 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 16 teach (Rom 16:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 3, 'What does Romans 16 teach (Rom 16:3)?', '["Note those who cause divisions.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Note those who cause divisions.', 'Note those who cause divisions (Romans 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 16 teach (Rom 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 3, 'What does Romans 16 teach (Rom 16:17)?', '["The God of peace will quickly crush Satan under your feet.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The God of peace will quickly crush Satan under your feet.', 'The God of peace will quickly crush Satan under your feet (Romans 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 16 teach (Rom 16:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 3, 'What does Romans 16 teach about God''s glory?', '["To the only wise God be the glory forever.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'To the only wise God be the glory forever.', 'To the only wise God be the glory forever (Romans 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 16 teach about God''s glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 3, 'What does Romans 16 teach (Rom 16:20)?', '["I commend to you Phoebe our sister.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I commend to you Phoebe our sister.', 'I commend to you Phoebe our sister (Romans 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Romans 16 teach (Rom 16:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 4, 'Which phrase belongs in Romans 16 (Rom 16:1)?', '["Greet Prisca and Aquila", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Greet Prisca and Aquila', 'Greet Prisca and Aquila (Romans 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 16 (Rom 16:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 4, 'Which phrase belongs in Romans 16 (Rom 16:3)?', '["Now I beg you, brothers, look out for those", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'Now I beg you, brothers, look out for those', 'Now I beg you, brothers, look out for those (Romans 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 16 (Rom 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 4, 'Which phrase belongs in Romans 16 (Rom 16:17)?', '["The God of peace will soon crush Satan under your feet", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'The God of peace will soon crush Satan under your feet', 'The God of peace will soon crush Satan under your feet (Romans 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 16 (Rom 16:17)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 4, 'Which phrase in Romans 16 speaks about Christ?', '["to the only wise God, through Jesus Christ, be the glory forever", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'to the only wise God, through Jesus Christ, be the glory forever', 'to the only wise God, through Jesus Christ, be the glory forever (Romans 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase in Romans 16 speaks about Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 4, 'Which phrase belongs in Romans 16 (Rom 16:20)?', '["I commend to you Phoebe our sister", "a servant of Jesus Christ", "the gospel of God", "it is the power of God for salvation"]'::jsonb, 'I commend to you Phoebe our sister', 'I commend to you Phoebe our sister (Romans 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which phrase belongs in Romans 16 (Rom 16:20)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 5, 'What major point is made in Romans 16 (Rom 16:1)?', '["Note those who cause divisions.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Note those who cause divisions.', 'Note those who cause divisions (Romans 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 16 (Rom 16:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 5, 'What major point is made in Romans 16 (Rom 16:3)?', '["The God of peace will quickly crush Satan under your feet.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'The God of peace will quickly crush Satan under your feet.', 'The God of peace will quickly crush Satan under your feet (Romans 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 16 (Rom 16:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 5, 'What major point does Romans 16 make about God''s glory?', '["To the only wise God be the glory forever.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'To the only wise God be the glory forever.', 'To the only wise God be the glory forever (Romans 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point does Romans 16 make about God''s glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 5, 'What major point is made in Romans 16 (Rom 16:19)?', '["I commend to you Phoebe our sister.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'I commend to you Phoebe our sister.', 'I commend to you Phoebe our sister (Romans 16:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 16 (Rom 16:19)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 45, 16, 5, 'What major point is made in Romans 16 (Rom 16:20)?', '["Greet Prisca and Aquila.", "The gospel was promised through the prophets.", "In it God’s righteousness is revealed from faith to faith.", "God’s wrath is revealed against ungodliness and unrighteousness."]'::jsonb, 'Greet Prisca and Aquila.', 'Greet Prisca and Aquila (Romans 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 45
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What major point is made in Romans 16 (Rom 16:20)?'
);
