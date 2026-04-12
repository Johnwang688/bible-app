-- Auto-generated from quiz-questions/judges.json
-- Book: Judges (book_number 7)

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  1,
  'Which tribe was told to go up first against the Canaanites?',
  '["Judah", "Simeon", "Adoni-Bezek", "Othniel"]'::jsonb,
  'Judah',
  'The LORD said Judah should go up first against the Canaanites (Judges 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Which tribe was told to go up first against the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  1,
  'Who went with Judah to fight the Canaanites?',
  '["Simeon", "Judah", "Adoni-Bezek", "Othniel"]'::jsonb,
  'Simeon',
  'Judah asked Simeon to go up with him into the allotted territory (Judges 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Who went with Judah to fight the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  1,
  'What king had his thumbs and great toes cut off?',
  '["Adoni-Bezek", "Judah", "Simeon", "Othniel"]'::jsonb,
  'Adoni-Bezek',
  'Adoni-Bezek was captured and had his thumbs and big toes cut off (Judges 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What king had his thumbs and great toes cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  1,
  'Who captured Kiriath Sepher and received Achsah as wife?',
  '["Othniel", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Othniel',
  'Othniel captured Kiriath Sepher and Caleb gave him Achsah (Judges 1:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Who captured Kiriath Sepher and received Achsah as wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  1,
  'What did Achsah ask her father for besides land?',
  '["Springs of water", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Springs of water',
  'Achsah asked Caleb for springs of water, and he gave her the upper and lower springs (Judges 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What did Achsah ask her father for besides land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  1,
  'What people did Benjamin fail to drive out from Jerusalem?',
  '["The Jebusites", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'The Jebusites',
  'Benjamin did not drive out the Jebusites living in Jerusalem (Judges 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What people did Benjamin fail to drive out from Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  1,
  'What pattern appears repeatedly in Judges 1 after early victories?',
  '["Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "It had rest for forty years", "He blew a trumpet and gathered men"]'::jsonb,
  'Several tribes did not fully drive out the inhabitants',
  'Judges 1 repeatedly says tribes failed to fully drive out the people of the land (Judges 1:27-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What pattern appears repeatedly in Judges 1 after early victories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  2,
  'In Judges 1, which tribe was told to go up first against the Canaanites?',
  '["Judah", "Springs of water", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Judah',
  'The LORD said Judah should go up first against the Canaanites (Judges 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'In Judges 1, which tribe was told to go up first against the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  2,
  'In Judges 1, who went with Judah to fight the Canaanites?',
  '["Simeon", "Springs of water", "Judah", "Adoni-Bezek"]'::jsonb,
  'Simeon',
  'Judah asked Simeon to go up with him into the allotted territory (Judges 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'In Judges 1, who went with Judah to fight the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  2,
  'In Judges 1, what king had his thumbs and great toes cut off?',
  '["Adoni-Bezek", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Adoni-Bezek',
  'Adoni-Bezek was captured and had his thumbs and big toes cut off (Judges 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'In Judges 1, what king had his thumbs and great toes cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  2,
  'In Judges 1, who captured Kiriath Sepher and received Achsah as wife?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'Othniel captured Kiriath Sepher and Caleb gave him Achsah (Judges 1:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'In Judges 1, who captured Kiriath Sepher and received Achsah as wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  2,
  'In Judges 1, what did Achsah ask her father for besides land?',
  '["Springs of water", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Springs of water',
  'Achsah asked Caleb for springs of water, and he gave her the upper and lower springs (Judges 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'In Judges 1, what did Achsah ask her father for besides land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  2,
  'In Judges 1, what people did Benjamin fail to drive out from Jerusalem?',
  '["The Jebusites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Jebusites',
  'Benjamin did not drive out the Jebusites living in Jerusalem (Judges 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'In Judges 1, what people did Benjamin fail to drive out from Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  2,
  'In Judges 1, what pattern appears repeatedly in Judges 1 after early victories?',
  '["Several tribes did not fully drive out the inhabitants", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Several tribes did not fully drive out the inhabitants',
  'Judges 1 repeatedly says tribes failed to fully drive out the people of the land (Judges 1:27-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'In Judges 1, what pattern appears repeatedly in Judges 1 after early victories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  3,
  'According to Judges 1, which tribe was told to go up first against the Canaanites?',
  '["Judah", "Springs of water", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Judah',
  'The LORD said Judah should go up first against the Canaanites (Judges 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 1, which tribe was told to go up first against the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  3,
  'According to Judges 1, who went with Judah to fight the Canaanites?',
  '["Simeon", "Springs of water", "Judah", "Adoni-Bezek"]'::jsonb,
  'Simeon',
  'Judah asked Simeon to go up with him into the allotted territory (Judges 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 1, who went with Judah to fight the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  3,
  'According to Judges 1, what king had his thumbs and great toes cut off?',
  '["Adoni-Bezek", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Adoni-Bezek',
  'Adoni-Bezek was captured and had his thumbs and big toes cut off (Judges 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 1, what king had his thumbs and great toes cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  3,
  'According to Judges 1, who captured Kiriath Sepher and received Achsah as wife?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'Othniel captured Kiriath Sepher and Caleb gave him Achsah (Judges 1:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 1, who captured Kiriath Sepher and received Achsah as wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  3,
  'According to Judges 1, what did Achsah ask her father for besides land?',
  '["Springs of water", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Springs of water',
  'Achsah asked Caleb for springs of water, and he gave her the upper and lower springs (Judges 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 1, what did Achsah ask her father for besides land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  3,
  'According to Judges 1, what people did Benjamin fail to drive out from Jerusalem?',
  '["The Jebusites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Jebusites',
  'Benjamin did not drive out the Jebusites living in Jerusalem (Judges 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 1, what people did Benjamin fail to drive out from Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  3,
  'According to Judges 1, what pattern appears repeatedly in Judges 1 after early victories?',
  '["Several tribes did not fully drive out the inhabitants", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Several tribes did not fully drive out the inhabitants',
  'Judges 1 repeatedly says tribes failed to fully drive out the people of the land (Judges 1:27-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 1, what pattern appears repeatedly in Judges 1 after early victories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  4,
  'From Judges 1, which tribe was told to go up first against the Canaanites?',
  '["Judah", "Springs of water", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Judah',
  'The LORD said Judah should go up first against the Canaanites (Judges 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'From Judges 1, which tribe was told to go up first against the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  4,
  'From Judges 1, who went with Judah to fight the Canaanites?',
  '["Simeon", "Springs of water", "Judah", "Adoni-Bezek"]'::jsonb,
  'Simeon',
  'Judah asked Simeon to go up with him into the allotted territory (Judges 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'From Judges 1, who went with Judah to fight the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  4,
  'From Judges 1, what king had his thumbs and great toes cut off?',
  '["Adoni-Bezek", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Adoni-Bezek',
  'Adoni-Bezek was captured and had his thumbs and big toes cut off (Judges 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'From Judges 1, what king had his thumbs and great toes cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  4,
  'From Judges 1, who captured Kiriath Sepher and received Achsah as wife?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'Othniel captured Kiriath Sepher and Caleb gave him Achsah (Judges 1:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'From Judges 1, who captured Kiriath Sepher and received Achsah as wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  4,
  'From Judges 1, what did Achsah ask her father for besides land?',
  '["Springs of water", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Springs of water',
  'Achsah asked Caleb for springs of water, and he gave her the upper and lower springs (Judges 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'From Judges 1, what did Achsah ask her father for besides land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  4,
  'From Judges 1, what people did Benjamin fail to drive out from Jerusalem?',
  '["The Jebusites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Jebusites',
  'Benjamin did not drive out the Jebusites living in Jerusalem (Judges 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'From Judges 1, what people did Benjamin fail to drive out from Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  4,
  'From Judges 1, what pattern appears repeatedly in Judges 1 after early victories?',
  '["Several tribes did not fully drive out the inhabitants", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Several tribes did not fully drive out the inhabitants',
  'Judges 1 repeatedly says tribes failed to fully drive out the people of the land (Judges 1:27-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'From Judges 1, what pattern appears repeatedly in Judges 1 after early victories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  5,
  'In the events of Judges 1, which tribe was told to go up first against the Canaanites?',
  '["Judah", "Springs of water", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Judah',
  'The LORD said Judah should go up first against the Canaanites (Judges 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 1, which tribe was told to go up first against the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  5,
  'In the events of Judges 1, who went with Judah to fight the Canaanites?',
  '["Simeon", "Springs of water", "Judah", "Adoni-Bezek"]'::jsonb,
  'Simeon',
  'Judah asked Simeon to go up with him into the allotted territory (Judges 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 1, who went with Judah to fight the Canaanites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  5,
  'In the events of Judges 1, what king had his thumbs and great toes cut off?',
  '["Adoni-Bezek", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Adoni-Bezek',
  'Adoni-Bezek was captured and had his thumbs and big toes cut off (Judges 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 1, what king had his thumbs and great toes cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  5,
  'In the events of Judges 1, who captured Kiriath Sepher and received Achsah as wife?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'Othniel captured Kiriath Sepher and Caleb gave him Achsah (Judges 1:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 1, who captured Kiriath Sepher and received Achsah as wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  5,
  'In the events of Judges 1, what did Achsah ask her father for besides land?',
  '["Springs of water", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Springs of water',
  'Achsah asked Caleb for springs of water, and he gave her the upper and lower springs (Judges 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 1, what did Achsah ask her father for besides land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  5,
  'In the events of Judges 1, what people did Benjamin fail to drive out from Jerusalem?',
  '["The Jebusites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Jebusites',
  'Benjamin did not drive out the Jebusites living in Jerusalem (Judges 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 1, what people did Benjamin fail to drive out from Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  1,
  5,
  'In the events of Judges 1, what pattern appears repeatedly in Judges 1 after early victories?',
  '["Several tribes did not fully drive out the inhabitants", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Several tribes did not fully drive out the inhabitants',
  'Judges 1 repeatedly says tribes failed to fully drive out the people of the land (Judges 1:27-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 1, what pattern appears repeatedly in Judges 1 after early victories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  1,
  'Who came up from Gilgal to Bochim with a message from the LORD?',
  '["The angel of the LORD", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'The angel of the LORD',
  'The angel of the LORD came up from Gilgal to Bochim and spoke to Israel (Judges 2:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Who came up from Gilgal to Bochim with a message from the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  1,
  'What did the people do at Bochim after hearing the LORD''s rebuke?',
  '["They wept", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They wept',
  'The people lifted up their voices and wept at Bochim (Judges 2:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What did the people do at Bochim after hearing the LORD''s rebuke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  1,
  'What did the new generation fail to know after Joshua died?',
  '["The LORD and His work for Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD and His work for Israel',
  'A later generation arose that did not know the LORD or the work He had done for Israel (Judges 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What did the new generation fail to know after Joshua died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  1,
  'Whom did Israel begin to serve in Judges 2?',
  '["The Baals", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'The Baals',
  'The children of Israel followed other gods and served the Baals (Judges 2:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Whom did Israel begin to serve in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  1,
  'Why did the LORD raise up judges in Judges 2?',
  '["To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel", "Because Midian ravaged the land"]'::jsonb,
  'To save Israel from those who plundered them',
  'The LORD raised up judges who saved Israel from plunderers (Judges 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Why did the LORD raise up judges in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  1,
  'What happened when a judge died in Judges 2?',
  '["The people turned back and became more corrupt", "Several tribes did not fully drive out the inhabitants", "It had rest for forty years", "He blew a trumpet and gathered men"]'::jsonb,
  'The people turned back and became more corrupt',
  'After a judge died, the people turned back and acted more corruptly (Judges 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What happened when a judge died in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  1,
  'Why did the LORD leave certain nations in the land according to Judges 2?',
  '["To test whether Israel would keep the LORD''s way", "To save Israel from those who plundered them", "To test Israel", "Because Midian ravaged the land"]'::jsonb,
  'To test whether Israel would keep the LORD''s way',
  'The LORD left nations to test whether Israel would walk in His way (Judges 2:20-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Why did the LORD leave certain nations in the land according to Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  2,
  'In Judges 2, who came up from Gilgal to Bochim with a message from the LORD?',
  '["The angel of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The angel of the LORD',
  'The angel of the LORD came up from Gilgal to Bochim and spoke to Israel (Judges 2:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'In Judges 2, who came up from Gilgal to Bochim with a message from the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  2,
  'In Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?',
  '["They wept", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They wept',
  'The people lifted up their voices and wept at Bochim (Judges 2:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'In Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  2,
  'In Judges 2, what did the new generation fail to know after Joshua died?',
  '["The LORD and His work for Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD and His work for Israel',
  'A later generation arose that did not know the LORD or the work He had done for Israel (Judges 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'In Judges 2, what did the new generation fail to know after Joshua died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  2,
  'In Judges 2, whom did Israel begin to serve in Judges 2?',
  '["The Baals", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Baals',
  'The children of Israel followed other gods and served the Baals (Judges 2:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'In Judges 2, whom did Israel begin to serve in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  2,
  'In Judges 2, why did the LORD raise up judges in Judges 2?',
  '["To save Israel from those who plundered them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To save Israel from those who plundered them',
  'The LORD raised up judges who saved Israel from plunderers (Judges 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'In Judges 2, why did the LORD raise up judges in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  2,
  'In Judges 2, what happened when a judge died in Judges 2?',
  '["The people turned back and became more corrupt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The people turned back and became more corrupt',
  'After a judge died, the people turned back and acted more corruptly (Judges 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'In Judges 2, what happened when a judge died in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  2,
  'In Judges 2, why did the LORD leave certain nations in the land according to Judges 2?',
  '["To test whether Israel would keep the LORD''s way", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test whether Israel would keep the LORD''s way',
  'The LORD left nations to test whether Israel would walk in His way (Judges 2:20-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'In Judges 2, why did the LORD leave certain nations in the land according to Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  3,
  'According to Judges 2, who came up from Gilgal to Bochim with a message from the LORD?',
  '["The angel of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The angel of the LORD',
  'The angel of the LORD came up from Gilgal to Bochim and spoke to Israel (Judges 2:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 2, who came up from Gilgal to Bochim with a message from the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  3,
  'According to Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?',
  '["They wept", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They wept',
  'The people lifted up their voices and wept at Bochim (Judges 2:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  3,
  'According to Judges 2, what did the new generation fail to know after Joshua died?',
  '["The LORD and His work for Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD and His work for Israel',
  'A later generation arose that did not know the LORD or the work He had done for Israel (Judges 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 2, what did the new generation fail to know after Joshua died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  3,
  'According to Judges 2, whom did Israel begin to serve in Judges 2?',
  '["The Baals", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Baals',
  'The children of Israel followed other gods and served the Baals (Judges 2:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 2, whom did Israel begin to serve in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  3,
  'According to Judges 2, why did the LORD raise up judges in Judges 2?',
  '["To save Israel from those who plundered them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To save Israel from those who plundered them',
  'The LORD raised up judges who saved Israel from plunderers (Judges 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 2, why did the LORD raise up judges in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  3,
  'According to Judges 2, what happened when a judge died in Judges 2?',
  '["The people turned back and became more corrupt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The people turned back and became more corrupt',
  'After a judge died, the people turned back and acted more corruptly (Judges 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 2, what happened when a judge died in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  3,
  'According to Judges 2, why did the LORD leave certain nations in the land according to Judges 2?',
  '["To test whether Israel would keep the LORD''s way", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test whether Israel would keep the LORD''s way',
  'The LORD left nations to test whether Israel would walk in His way (Judges 2:20-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 2, why did the LORD leave certain nations in the land according to Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  4,
  'From Judges 2, who came up from Gilgal to Bochim with a message from the LORD?',
  '["The angel of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The angel of the LORD',
  'The angel of the LORD came up from Gilgal to Bochim and spoke to Israel (Judges 2:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'From Judges 2, who came up from Gilgal to Bochim with a message from the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  4,
  'From Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?',
  '["They wept", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They wept',
  'The people lifted up their voices and wept at Bochim (Judges 2:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'From Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  4,
  'From Judges 2, what did the new generation fail to know after Joshua died?',
  '["The LORD and His work for Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD and His work for Israel',
  'A later generation arose that did not know the LORD or the work He had done for Israel (Judges 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'From Judges 2, what did the new generation fail to know after Joshua died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  4,
  'From Judges 2, whom did Israel begin to serve in Judges 2?',
  '["The Baals", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Baals',
  'The children of Israel followed other gods and served the Baals (Judges 2:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'From Judges 2, whom did Israel begin to serve in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  4,
  'From Judges 2, why did the LORD raise up judges in Judges 2?',
  '["To save Israel from those who plundered them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To save Israel from those who plundered them',
  'The LORD raised up judges who saved Israel from plunderers (Judges 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'From Judges 2, why did the LORD raise up judges in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  4,
  'From Judges 2, what happened when a judge died in Judges 2?',
  '["The people turned back and became more corrupt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The people turned back and became more corrupt',
  'After a judge died, the people turned back and acted more corruptly (Judges 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'From Judges 2, what happened when a judge died in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  4,
  'From Judges 2, why did the LORD leave certain nations in the land according to Judges 2?',
  '["To test whether Israel would keep the LORD''s way", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test whether Israel would keep the LORD''s way',
  'The LORD left nations to test whether Israel would walk in His way (Judges 2:20-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'From Judges 2, why did the LORD leave certain nations in the land according to Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  5,
  'In the events of Judges 2, who came up from Gilgal to Bochim with a message from the LORD?',
  '["The angel of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The angel of the LORD',
  'The angel of the LORD came up from Gilgal to Bochim and spoke to Israel (Judges 2:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 2, who came up from Gilgal to Bochim with a message from the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  5,
  'In the events of Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?',
  '["They wept", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They wept',
  'The people lifted up their voices and wept at Bochim (Judges 2:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 2, what did the people do at Bochim after hearing the LORD''s rebuke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  5,
  'In the events of Judges 2, what did the new generation fail to know after Joshua died?',
  '["The LORD and His work for Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD and His work for Israel',
  'A later generation arose that did not know the LORD or the work He had done for Israel (Judges 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 2, what did the new generation fail to know after Joshua died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  5,
  'In the events of Judges 2, whom did Israel begin to serve in Judges 2?',
  '["The Baals", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Baals',
  'The children of Israel followed other gods and served the Baals (Judges 2:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 2, whom did Israel begin to serve in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  5,
  'In the events of Judges 2, why did the LORD raise up judges in Judges 2?',
  '["To save Israel from those who plundered them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To save Israel from those who plundered them',
  'The LORD raised up judges who saved Israel from plunderers (Judges 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 2, why did the LORD raise up judges in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  5,
  'In the events of Judges 2, what happened when a judge died in Judges 2?',
  '["The people turned back and became more corrupt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The people turned back and became more corrupt',
  'After a judge died, the people turned back and acted more corruptly (Judges 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 2, what happened when a judge died in Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  2,
  5,
  'In the events of Judges 2, why did the LORD leave certain nations in the land according to Judges 2?',
  '["To test whether Israel would keep the LORD''s way", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test whether Israel would keep the LORD''s way',
  'The LORD left nations to test whether Israel would walk in His way (Judges 2:20-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 2, why did the LORD leave certain nations in the land according to Judges 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  1,
  'Why were certain nations left in the land according to Judges 3?',
  '["To test Israel", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "Because Midian ravaged the land"]'::jsonb,
  'To test Israel',
  'The nations were left to test Israel and teach warfare to later generations (Judges 3:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Why were certain nations left in the land according to Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  1,
  'Who was the first judge raised up in Judges 3?',
  '["Othniel", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Othniel',
  'The LORD raised up Othniel to save Israel (Judges 3:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Who was the first judge raised up in Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  1,
  'Which king oppressed Israel before Ehud delivered them?',
  '["Eglon king of Moab", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eglon king of Moab',
  'Eglon king of Moab oppressed Israel for eighteen years (Judges 3:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Which king oppressed Israel before Ehud delivered them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  1,
  'What physical detail about Ehud is specifically mentioned?',
  '["He was left-handed", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He was left-handed',
  'Ehud is described as a left-handed man (Judges 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What physical detail about Ehud is specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  1,
  'What weapon did Ehud make to kill Eglon?',
  '["A two-edged dagger", "Milk", "That dew would fall on the fleece alone", "Empty pitchers with torches inside"]'::jsonb,
  'A two-edged dagger',
  'Ehud made a double-edged dagger a cubit long (Judges 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What weapon did Ehud make to kill Eglon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  1,
  'How many Philistines did Shamgar kill with an ox goad?',
  '["Six hundred", "Nine hundred", "Forty years", "Three hundred"]'::jsonb,
  'Six hundred',
  'Shamgar struck down six hundred Philistines with an ox goad (Judges 3:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'How many Philistines did Shamgar kill with an ox goad?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  1,
  'What happened to the land after Othniel judged Israel?',
  '["It had rest for forty years", "Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "He blew a trumpet and gathered men"]'::jsonb,
  'It had rest for forty years',
  'The land had rest for forty years under Othniel (Judges 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What happened to the land after Othniel judged Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  2,
  'In Judges 3, why were certain nations left in the land according to Judges 3?',
  '["To test Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test Israel',
  'The nations were left to test Israel and teach warfare to later generations (Judges 3:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In Judges 3, why were certain nations left in the land according to Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  2,
  'In Judges 3, who was the first judge raised up in Judges 3?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'The LORD raised up Othniel to save Israel (Judges 3:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In Judges 3, who was the first judge raised up in Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  2,
  'In Judges 3, which king oppressed Israel before Ehud delivered them?',
  '["Eglon king of Moab", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eglon king of Moab',
  'Eglon king of Moab oppressed Israel for eighteen years (Judges 3:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In Judges 3, which king oppressed Israel before Ehud delivered them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  2,
  'In Judges 3, what physical detail about Ehud is specifically mentioned?',
  '["He was left-handed", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He was left-handed',
  'Ehud is described as a left-handed man (Judges 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In Judges 3, what physical detail about Ehud is specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  2,
  'In Judges 3, what weapon did Ehud make to kill Eglon?',
  '["A two-edged dagger", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A two-edged dagger',
  'Ehud made a double-edged dagger a cubit long (Judges 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In Judges 3, what weapon did Ehud make to kill Eglon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  2,
  'In Judges 3, how many Philistines did Shamgar kill with an ox goad?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Shamgar struck down six hundred Philistines with an ox goad (Judges 3:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In Judges 3, how many Philistines did Shamgar kill with an ox goad?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  2,
  'In Judges 3, what happened to the land after Othniel judged Israel?',
  '["It had rest for forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It had rest for forty years',
  'The land had rest for forty years under Othniel (Judges 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In Judges 3, what happened to the land after Othniel judged Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  3,
  'According to Judges 3, why were certain nations left in the land according to Judges 3?',
  '["To test Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test Israel',
  'The nations were left to test Israel and teach warfare to later generations (Judges 3:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 3, why were certain nations left in the land according to Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  3,
  'According to Judges 3, who was the first judge raised up in Judges 3?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'The LORD raised up Othniel to save Israel (Judges 3:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 3, who was the first judge raised up in Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  3,
  'According to Judges 3, which king oppressed Israel before Ehud delivered them?',
  '["Eglon king of Moab", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eglon king of Moab',
  'Eglon king of Moab oppressed Israel for eighteen years (Judges 3:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 3, which king oppressed Israel before Ehud delivered them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  3,
  'According to Judges 3, what physical detail about Ehud is specifically mentioned?',
  '["He was left-handed", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He was left-handed',
  'Ehud is described as a left-handed man (Judges 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 3, what physical detail about Ehud is specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  3,
  'According to Judges 3, what weapon did Ehud make to kill Eglon?',
  '["A two-edged dagger", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A two-edged dagger',
  'Ehud made a double-edged dagger a cubit long (Judges 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 3, what weapon did Ehud make to kill Eglon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  3,
  'According to Judges 3, how many Philistines did Shamgar kill with an ox goad?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Shamgar struck down six hundred Philistines with an ox goad (Judges 3:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 3, how many Philistines did Shamgar kill with an ox goad?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  3,
  'According to Judges 3, what happened to the land after Othniel judged Israel?',
  '["It had rest for forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It had rest for forty years',
  'The land had rest for forty years under Othniel (Judges 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 3, what happened to the land after Othniel judged Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  4,
  'From Judges 3, why were certain nations left in the land according to Judges 3?',
  '["To test Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test Israel',
  'The nations were left to test Israel and teach warfare to later generations (Judges 3:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'From Judges 3, why were certain nations left in the land according to Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  4,
  'From Judges 3, who was the first judge raised up in Judges 3?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'The LORD raised up Othniel to save Israel (Judges 3:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'From Judges 3, who was the first judge raised up in Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  4,
  'From Judges 3, which king oppressed Israel before Ehud delivered them?',
  '["Eglon king of Moab", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eglon king of Moab',
  'Eglon king of Moab oppressed Israel for eighteen years (Judges 3:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'From Judges 3, which king oppressed Israel before Ehud delivered them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  4,
  'From Judges 3, what physical detail about Ehud is specifically mentioned?',
  '["He was left-handed", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He was left-handed',
  'Ehud is described as a left-handed man (Judges 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'From Judges 3, what physical detail about Ehud is specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  4,
  'From Judges 3, what weapon did Ehud make to kill Eglon?',
  '["A two-edged dagger", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A two-edged dagger',
  'Ehud made a double-edged dagger a cubit long (Judges 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'From Judges 3, what weapon did Ehud make to kill Eglon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  4,
  'From Judges 3, how many Philistines did Shamgar kill with an ox goad?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Shamgar struck down six hundred Philistines with an ox goad (Judges 3:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'From Judges 3, how many Philistines did Shamgar kill with an ox goad?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  4,
  'From Judges 3, what happened to the land after Othniel judged Israel?',
  '["It had rest for forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It had rest for forty years',
  'The land had rest for forty years under Othniel (Judges 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'From Judges 3, what happened to the land after Othniel judged Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  5,
  'In the events of Judges 3, why were certain nations left in the land according to Judges 3?',
  '["To test Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To test Israel',
  'The nations were left to test Israel and teach warfare to later generations (Judges 3:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 3, why were certain nations left in the land according to Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  5,
  'In the events of Judges 3, who was the first judge raised up in Judges 3?',
  '["Othniel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Othniel',
  'The LORD raised up Othniel to save Israel (Judges 3:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 3, who was the first judge raised up in Judges 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  5,
  'In the events of Judges 3, which king oppressed Israel before Ehud delivered them?',
  '["Eglon king of Moab", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eglon king of Moab',
  'Eglon king of Moab oppressed Israel for eighteen years (Judges 3:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 3, which king oppressed Israel before Ehud delivered them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  5,
  'In the events of Judges 3, what physical detail about Ehud is specifically mentioned?',
  '["He was left-handed", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He was left-handed',
  'Ehud is described as a left-handed man (Judges 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 3, what physical detail about Ehud is specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  5,
  'In the events of Judges 3, what weapon did Ehud make to kill Eglon?',
  '["A two-edged dagger", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A two-edged dagger',
  'Ehud made a double-edged dagger a cubit long (Judges 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 3, what weapon did Ehud make to kill Eglon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  5,
  'In the events of Judges 3, how many Philistines did Shamgar kill with an ox goad?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Shamgar struck down six hundred Philistines with an ox goad (Judges 3:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 3, how many Philistines did Shamgar kill with an ox goad?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  3,
  5,
  'In the events of Judges 3, what happened to the land after Othniel judged Israel?',
  '["It had rest for forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It had rest for forty years',
  'The land had rest for forty years under Othniel (Judges 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 3, what happened to the land after Othniel judged Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  1,
  'Which woman judged Israel under a palm tree?',
  '["Deborah", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Deborah',
  'Deborah was judging Israel under the palm tree of Deborah (Judges 4:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Which woman judged Israel under a palm tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  1,
  'Whom did Deborah summon to lead Israel''s army?',
  '["Barak", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Barak',
  'Deborah called Barak and gave him the LORD''s command (Judges 4:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Whom did Deborah summon to lead Israel''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  1,
  'What enemy commander fought against Israel in Judges 4?',
  '["Sisera", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Sisera',
  'Sisera commanded Jabin''s army against Israel (Judges 4:2, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What enemy commander fought against Israel in Judges 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  1,
  'How many iron chariots did Sisera have?',
  '["Nine hundred", "Six hundred", "Forty years", "Three hundred"]'::jsonb,
  'Nine hundred',
  'Sisera had nine hundred iron chariots (Judges 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'How many iron chariots did Sisera have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  1,
  'Who killed Sisera after he fled from the battle?',
  '["Jael", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Jael',
  'Jael killed Sisera by driving a tent peg through his head (Judges 4:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Who killed Sisera after he fled from the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  1,
  'What did Barak say before going to battle?',
  '["He would go only if Deborah went with him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He would go only if Deborah went with him',
  'Barak said he would go if Deborah went with him (Judges 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What did Barak say before going to battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  1,
  'To whom did Deborah say the LORD would sell Sisera?',
  '["A woman", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'A woman',
  'Deborah said the LORD would sell Sisera into the hand of a woman (Judges 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'To whom did Deborah say the LORD would sell Sisera?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  2,
  'In Judges 4, which woman judged Israel under a palm tree?',
  '["Deborah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah',
  'Deborah was judging Israel under the palm tree of Deborah (Judges 4:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'In Judges 4, which woman judged Israel under a palm tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  2,
  'In Judges 4, whom did Deborah summon to lead Israel''s army?',
  '["Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Barak',
  'Deborah called Barak and gave him the LORD''s command (Judges 4:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'In Judges 4, whom did Deborah summon to lead Israel''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  2,
  'In Judges 4, what enemy commander fought against Israel in Judges 4?',
  '["Sisera", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Sisera',
  'Sisera commanded Jabin''s army against Israel (Judges 4:2, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'In Judges 4, what enemy commander fought against Israel in Judges 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  2,
  'In Judges 4, how many iron chariots did Sisera have?',
  '["Nine hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nine hundred',
  'Sisera had nine hundred iron chariots (Judges 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'In Judges 4, how many iron chariots did Sisera have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  2,
  'In Judges 4, who killed Sisera after he fled from the battle?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael killed Sisera by driving a tent peg through his head (Judges 4:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'In Judges 4, who killed Sisera after he fled from the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  2,
  'In Judges 4, what did Barak say before going to battle?',
  '["He would go only if Deborah went with him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He would go only if Deborah went with him',
  'Barak said he would go if Deborah went with him (Judges 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'In Judges 4, what did Barak say before going to battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  2,
  'In Judges 4, to whom did Deborah say the LORD would sell Sisera?',
  '["A woman", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A woman',
  'Deborah said the LORD would sell Sisera into the hand of a woman (Judges 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'In Judges 4, to whom did Deborah say the LORD would sell Sisera?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  3,
  'According to Judges 4, which woman judged Israel under a palm tree?',
  '["Deborah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah',
  'Deborah was judging Israel under the palm tree of Deborah (Judges 4:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 4, which woman judged Israel under a palm tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  3,
  'According to Judges 4, whom did Deborah summon to lead Israel''s army?',
  '["Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Barak',
  'Deborah called Barak and gave him the LORD''s command (Judges 4:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 4, whom did Deborah summon to lead Israel''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  3,
  'According to Judges 4, what enemy commander fought against Israel in Judges 4?',
  '["Sisera", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Sisera',
  'Sisera commanded Jabin''s army against Israel (Judges 4:2, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 4, what enemy commander fought against Israel in Judges 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  3,
  'According to Judges 4, how many iron chariots did Sisera have?',
  '["Nine hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nine hundred',
  'Sisera had nine hundred iron chariots (Judges 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 4, how many iron chariots did Sisera have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  3,
  'According to Judges 4, who killed Sisera after he fled from the battle?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael killed Sisera by driving a tent peg through his head (Judges 4:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 4, who killed Sisera after he fled from the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  3,
  'According to Judges 4, what did Barak say before going to battle?',
  '["He would go only if Deborah went with him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He would go only if Deborah went with him',
  'Barak said he would go if Deborah went with him (Judges 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 4, what did Barak say before going to battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  3,
  'According to Judges 4, to whom did Deborah say the LORD would sell Sisera?',
  '["A woman", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A woman',
  'Deborah said the LORD would sell Sisera into the hand of a woman (Judges 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 4, to whom did Deborah say the LORD would sell Sisera?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  4,
  'From Judges 4, which woman judged Israel under a palm tree?',
  '["Deborah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah',
  'Deborah was judging Israel under the palm tree of Deborah (Judges 4:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'From Judges 4, which woman judged Israel under a palm tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  4,
  'From Judges 4, whom did Deborah summon to lead Israel''s army?',
  '["Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Barak',
  'Deborah called Barak and gave him the LORD''s command (Judges 4:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'From Judges 4, whom did Deborah summon to lead Israel''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  4,
  'From Judges 4, what enemy commander fought against Israel in Judges 4?',
  '["Sisera", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Sisera',
  'Sisera commanded Jabin''s army against Israel (Judges 4:2, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'From Judges 4, what enemy commander fought against Israel in Judges 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  4,
  'From Judges 4, how many iron chariots did Sisera have?',
  '["Nine hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nine hundred',
  'Sisera had nine hundred iron chariots (Judges 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'From Judges 4, how many iron chariots did Sisera have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  4,
  'From Judges 4, who killed Sisera after he fled from the battle?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael killed Sisera by driving a tent peg through his head (Judges 4:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'From Judges 4, who killed Sisera after he fled from the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  4,
  'From Judges 4, what did Barak say before going to battle?',
  '["He would go only if Deborah went with him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He would go only if Deborah went with him',
  'Barak said he would go if Deborah went with him (Judges 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'From Judges 4, what did Barak say before going to battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  4,
  'From Judges 4, to whom did Deborah say the LORD would sell Sisera?',
  '["A woman", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A woman',
  'Deborah said the LORD would sell Sisera into the hand of a woman (Judges 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'From Judges 4, to whom did Deborah say the LORD would sell Sisera?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  5,
  'In the events of Judges 4, which woman judged Israel under a palm tree?',
  '["Deborah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah',
  'Deborah was judging Israel under the palm tree of Deborah (Judges 4:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 4, which woman judged Israel under a palm tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  5,
  'In the events of Judges 4, whom did Deborah summon to lead Israel''s army?',
  '["Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Barak',
  'Deborah called Barak and gave him the LORD''s command (Judges 4:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 4, whom did Deborah summon to lead Israel''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  5,
  'In the events of Judges 4, what enemy commander fought against Israel in Judges 4?',
  '["Sisera", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Sisera',
  'Sisera commanded Jabin''s army against Israel (Judges 4:2, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 4, what enemy commander fought against Israel in Judges 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  5,
  'In the events of Judges 4, how many iron chariots did Sisera have?',
  '["Nine hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nine hundred',
  'Sisera had nine hundred iron chariots (Judges 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 4, how many iron chariots did Sisera have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  5,
  'In the events of Judges 4, who killed Sisera after he fled from the battle?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael killed Sisera by driving a tent peg through his head (Judges 4:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 4, who killed Sisera after he fled from the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  5,
  'In the events of Judges 4, what did Barak say before going to battle?',
  '["He would go only if Deborah went with him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He would go only if Deborah went with him',
  'Barak said he would go if Deborah went with him (Judges 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 4, what did Barak say before going to battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  4,
  5,
  'In the events of Judges 4, to whom did Deborah say the LORD would sell Sisera?',
  '["A woman", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A woman',
  'Deborah said the LORD would sell Sisera into the hand of a woman (Judges 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 4, to whom did Deborah say the LORD would sell Sisera?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  1,
  'Who sang the victory song in Judges 5?',
  '["Deborah and Barak", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Deborah and Barak',
  'Deborah and Barak sang on the day of victory (Judges 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Who sang the victory song in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  1,
  'Which woman is called most blessed in the song of Judges 5?',
  '["Jael", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Jael',
  'Jael is called most blessed among women in the song (Judges 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Which woman is called most blessed in the song of Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  1,
  'What did Jael give Sisera when he asked for water?',
  '["Milk", "A two-edged dagger", "That dew would fall on the fleece alone", "Empty pitchers with torches inside"]'::jsonb,
  'Milk',
  'Jael gave Sisera milk in a princely bowl (Judges 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What did Jael give Sisera when he asked for water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  1,
  'What natural force fought against Sisera according to the song?',
  '["The stars from heaven", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The stars from heaven',
  'The song says the stars fought from heaven against Sisera (Judges 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What natural force fought against Sisera according to the song?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  1,
  'Which river swept away the enemies in Judges 5?',
  '["The river Kishon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The river Kishon',
  'The river Kishon swept them away (Judges 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Which river swept away the enemies in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  1,
  'Which tribe is rebuked for staying with the sheepfolds?',
  '["Reuben", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Reuben',
  'Reuben is rebuked for great searchings of heart among the sheepfolds (Judges 5:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Which tribe is rebuked for staying with the sheepfolds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  1,
  'How long did the land have rest after Deborah''s victory?',
  '["Forty years", "Six hundred", "Nine hundred", "Three hundred"]'::jsonb,
  'Forty years',
  'The land had rest for forty years after the victory (Judges 5:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'How long did the land have rest after Deborah''s victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  2,
  'In Judges 5, who sang the victory song in Judges 5?',
  '["Deborah and Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah and Barak',
  'Deborah and Barak sang on the day of victory (Judges 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'In Judges 5, who sang the victory song in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  2,
  'In Judges 5, which woman is called most blessed in the song of Judges 5?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael is called most blessed among women in the song (Judges 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'In Judges 5, which woman is called most blessed in the song of Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  2,
  'In Judges 5, what did Jael give Sisera when he asked for water?',
  '["Milk", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Milk',
  'Jael gave Sisera milk in a princely bowl (Judges 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'In Judges 5, what did Jael give Sisera when he asked for water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  2,
  'In Judges 5, what natural force fought against Sisera according to the song?',
  '["The stars from heaven", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The stars from heaven',
  'The song says the stars fought from heaven against Sisera (Judges 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'In Judges 5, what natural force fought against Sisera according to the song?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  2,
  'In Judges 5, which river swept away the enemies in Judges 5?',
  '["The river Kishon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The river Kishon',
  'The river Kishon swept them away (Judges 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'In Judges 5, which river swept away the enemies in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  2,
  'In Judges 5, which tribe is rebuked for staying with the sheepfolds?',
  '["Reuben", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Reuben',
  'Reuben is rebuked for great searchings of heart among the sheepfolds (Judges 5:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'In Judges 5, which tribe is rebuked for staying with the sheepfolds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  2,
  'In Judges 5, how long did the land have rest after Deborah''s victory?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years after the victory (Judges 5:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'In Judges 5, how long did the land have rest after Deborah''s victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  3,
  'According to Judges 5, who sang the victory song in Judges 5?',
  '["Deborah and Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah and Barak',
  'Deborah and Barak sang on the day of victory (Judges 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 5, who sang the victory song in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  3,
  'According to Judges 5, which woman is called most blessed in the song of Judges 5?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael is called most blessed among women in the song (Judges 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 5, which woman is called most blessed in the song of Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  3,
  'According to Judges 5, what did Jael give Sisera when he asked for water?',
  '["Milk", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Milk',
  'Jael gave Sisera milk in a princely bowl (Judges 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 5, what did Jael give Sisera when he asked for water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  3,
  'According to Judges 5, what natural force fought against Sisera according to the song?',
  '["The stars from heaven", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The stars from heaven',
  'The song says the stars fought from heaven against Sisera (Judges 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 5, what natural force fought against Sisera according to the song?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  3,
  'According to Judges 5, which river swept away the enemies in Judges 5?',
  '["The river Kishon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The river Kishon',
  'The river Kishon swept them away (Judges 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 5, which river swept away the enemies in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  3,
  'According to Judges 5, which tribe is rebuked for staying with the sheepfolds?',
  '["Reuben", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Reuben',
  'Reuben is rebuked for great searchings of heart among the sheepfolds (Judges 5:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 5, which tribe is rebuked for staying with the sheepfolds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  3,
  'According to Judges 5, how long did the land have rest after Deborah''s victory?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years after the victory (Judges 5:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 5, how long did the land have rest after Deborah''s victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  4,
  'From Judges 5, who sang the victory song in Judges 5?',
  '["Deborah and Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah and Barak',
  'Deborah and Barak sang on the day of victory (Judges 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'From Judges 5, who sang the victory song in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  4,
  'From Judges 5, which woman is called most blessed in the song of Judges 5?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael is called most blessed among women in the song (Judges 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'From Judges 5, which woman is called most blessed in the song of Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  4,
  'From Judges 5, what did Jael give Sisera when he asked for water?',
  '["Milk", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Milk',
  'Jael gave Sisera milk in a princely bowl (Judges 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'From Judges 5, what did Jael give Sisera when he asked for water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  4,
  'From Judges 5, what natural force fought against Sisera according to the song?',
  '["The stars from heaven", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The stars from heaven',
  'The song says the stars fought from heaven against Sisera (Judges 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'From Judges 5, what natural force fought against Sisera according to the song?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  4,
  'From Judges 5, which river swept away the enemies in Judges 5?',
  '["The river Kishon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The river Kishon',
  'The river Kishon swept them away (Judges 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'From Judges 5, which river swept away the enemies in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  4,
  'From Judges 5, which tribe is rebuked for staying with the sheepfolds?',
  '["Reuben", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Reuben',
  'Reuben is rebuked for great searchings of heart among the sheepfolds (Judges 5:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'From Judges 5, which tribe is rebuked for staying with the sheepfolds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  4,
  'From Judges 5, how long did the land have rest after Deborah''s victory?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years after the victory (Judges 5:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'From Judges 5, how long did the land have rest after Deborah''s victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  5,
  'In the events of Judges 5, who sang the victory song in Judges 5?',
  '["Deborah and Barak", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Deborah and Barak',
  'Deborah and Barak sang on the day of victory (Judges 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 5, who sang the victory song in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  5,
  'In the events of Judges 5, which woman is called most blessed in the song of Judges 5?',
  '["Jael", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jael',
  'Jael is called most blessed among women in the song (Judges 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 5, which woman is called most blessed in the song of Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  5,
  'In the events of Judges 5, what did Jael give Sisera when he asked for water?',
  '["Milk", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Milk',
  'Jael gave Sisera milk in a princely bowl (Judges 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 5, what did Jael give Sisera when he asked for water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  5,
  'In the events of Judges 5, what natural force fought against Sisera according to the song?',
  '["The stars from heaven", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The stars from heaven',
  'The song says the stars fought from heaven against Sisera (Judges 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 5, what natural force fought against Sisera according to the song?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  5,
  'In the events of Judges 5, which river swept away the enemies in Judges 5?',
  '["The river Kishon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The river Kishon',
  'The river Kishon swept them away (Judges 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 5, which river swept away the enemies in Judges 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  5,
  'In the events of Judges 5, which tribe is rebuked for staying with the sheepfolds?',
  '["Reuben", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Reuben',
  'Reuben is rebuked for great searchings of heart among the sheepfolds (Judges 5:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 5, which tribe is rebuked for staying with the sheepfolds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  5,
  5,
  'In the events of Judges 5, how long did the land have rest after Deborah''s victory?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years after the victory (Judges 5:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 5, how long did the land have rest after Deborah''s victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  1,
  'Who was threshing wheat in a winepress when the angel of the LORD appeared?',
  '["Gideon", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Gideon',
  'Gideon was threshing wheat in the winepress when the angel appeared (Judges 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Who was threshing wheat in a winepress when the angel of the LORD appeared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  1,
  'What title did the angel call Gideon?',
  '["Mighty man of valor", "Jerubbaal", "\"The sword of the LORD and of Gideon\"", "\"The LORD shall rule over you\""]'::jsonb,
  'Mighty man of valor',
  'The angel addressed Gideon as a mighty man of valor (Judges 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What title did the angel call Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  1,
  'What sign did Gideon ask concerning the fleece?',
  '["That dew would fall on the fleece alone", "A two-edged dagger", "Milk", "Empty pitchers with torches inside"]'::jsonb,
  'That dew would fall on the fleece alone',
  'Gideon asked for signs involving the fleece and the dew (Judges 6:36-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What sign did Gideon ask concerning the fleece?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  1,
  'Whose altar did Gideon tear down by night?',
  '["Baal''s altar belonging to his father", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Baal''s altar belonging to his father',
  'Gideon tore down the altar of Baal and cut down the Asherah (Judges 6:25-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Whose altar did Gideon tear down by night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  1,
  'What new name was given to Gideon after the altar incident?',
  '["Jerubbaal", "Mighty man of valor", "\"The sword of the LORD and of Gideon\"", "\"The LORD shall rule over you\""]'::jsonb,
  'Jerubbaal',
  'Gideon was called Jerubbaal after tearing down Baal''s altar (Judges 6:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What new name was given to Gideon after the altar incident?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  1,
  'What happened when the Spirit of the LORD clothed Gideon?',
  '["He blew a trumpet and gathered men", "Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "It had rest for forty years"]'::jsonb,
  'He blew a trumpet and gathered men',
  'When the Spirit clothed Gideon, he blew a trumpet and summoned Israel (Judges 6:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What happened when the Spirit of the LORD clothed Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  1,
  'Why was Israel impoverished in Judges 6?',
  '["Because Midian ravaged the land", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'Because Midian ravaged the land',
  'Midian destroyed Israel''s produce and livestock, leaving them impoverished (Judges 6:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Why was Israel impoverished in Judges 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  2,
  'In Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?',
  '["Gideon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gideon',
  'Gideon was threshing wheat in the winepress when the angel appeared (Judges 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'In Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  2,
  'In Judges 6, what title did the angel call Gideon?',
  '["Mighty man of valor", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Mighty man of valor',
  'The angel addressed Gideon as a mighty man of valor (Judges 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'In Judges 6, what title did the angel call Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  2,
  'In Judges 6, what sign did Gideon ask concerning the fleece?',
  '["That dew would fall on the fleece alone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That dew would fall on the fleece alone',
  'Gideon asked for signs involving the fleece and the dew (Judges 6:36-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'In Judges 6, what sign did Gideon ask concerning the fleece?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  2,
  'In Judges 6, whose altar did Gideon tear down by night?',
  '["Baal''s altar belonging to his father", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Baal''s altar belonging to his father',
  'Gideon tore down the altar of Baal and cut down the Asherah (Judges 6:25-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'In Judges 6, whose altar did Gideon tear down by night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  2,
  'In Judges 6, what new name was given to Gideon after the altar incident?',
  '["Jerubbaal", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jerubbaal',
  'Gideon was called Jerubbaal after tearing down Baal''s altar (Judges 6:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'In Judges 6, what new name was given to Gideon after the altar incident?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  2,
  'In Judges 6, what happened when the Spirit of the LORD clothed Gideon?',
  '["He blew a trumpet and gathered men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He blew a trumpet and gathered men',
  'When the Spirit clothed Gideon, he blew a trumpet and summoned Israel (Judges 6:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'In Judges 6, what happened when the Spirit of the LORD clothed Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  2,
  'In Judges 6, why was Israel impoverished in Judges 6?',
  '["Because Midian ravaged the land", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because Midian ravaged the land',
  'Midian destroyed Israel''s produce and livestock, leaving them impoverished (Judges 6:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'In Judges 6, why was Israel impoverished in Judges 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  3,
  'According to Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?',
  '["Gideon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gideon',
  'Gideon was threshing wheat in the winepress when the angel appeared (Judges 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  3,
  'According to Judges 6, what title did the angel call Gideon?',
  '["Mighty man of valor", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Mighty man of valor',
  'The angel addressed Gideon as a mighty man of valor (Judges 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 6, what title did the angel call Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  3,
  'According to Judges 6, what sign did Gideon ask concerning the fleece?',
  '["That dew would fall on the fleece alone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That dew would fall on the fleece alone',
  'Gideon asked for signs involving the fleece and the dew (Judges 6:36-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 6, what sign did Gideon ask concerning the fleece?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  3,
  'According to Judges 6, whose altar did Gideon tear down by night?',
  '["Baal''s altar belonging to his father", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Baal''s altar belonging to his father',
  'Gideon tore down the altar of Baal and cut down the Asherah (Judges 6:25-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 6, whose altar did Gideon tear down by night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  3,
  'According to Judges 6, what new name was given to Gideon after the altar incident?',
  '["Jerubbaal", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jerubbaal',
  'Gideon was called Jerubbaal after tearing down Baal''s altar (Judges 6:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 6, what new name was given to Gideon after the altar incident?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  3,
  'According to Judges 6, what happened when the Spirit of the LORD clothed Gideon?',
  '["He blew a trumpet and gathered men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He blew a trumpet and gathered men',
  'When the Spirit clothed Gideon, he blew a trumpet and summoned Israel (Judges 6:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 6, what happened when the Spirit of the LORD clothed Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  3,
  'According to Judges 6, why was Israel impoverished in Judges 6?',
  '["Because Midian ravaged the land", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because Midian ravaged the land',
  'Midian destroyed Israel''s produce and livestock, leaving them impoverished (Judges 6:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 6, why was Israel impoverished in Judges 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  4,
  'From Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?',
  '["Gideon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gideon',
  'Gideon was threshing wheat in the winepress when the angel appeared (Judges 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'From Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  4,
  'From Judges 6, what title did the angel call Gideon?',
  '["Mighty man of valor", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Mighty man of valor',
  'The angel addressed Gideon as a mighty man of valor (Judges 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'From Judges 6, what title did the angel call Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  4,
  'From Judges 6, what sign did Gideon ask concerning the fleece?',
  '["That dew would fall on the fleece alone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That dew would fall on the fleece alone',
  'Gideon asked for signs involving the fleece and the dew (Judges 6:36-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'From Judges 6, what sign did Gideon ask concerning the fleece?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  4,
  'From Judges 6, whose altar did Gideon tear down by night?',
  '["Baal''s altar belonging to his father", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Baal''s altar belonging to his father',
  'Gideon tore down the altar of Baal and cut down the Asherah (Judges 6:25-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'From Judges 6, whose altar did Gideon tear down by night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  4,
  'From Judges 6, what new name was given to Gideon after the altar incident?',
  '["Jerubbaal", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jerubbaal',
  'Gideon was called Jerubbaal after tearing down Baal''s altar (Judges 6:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'From Judges 6, what new name was given to Gideon after the altar incident?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  4,
  'From Judges 6, what happened when the Spirit of the LORD clothed Gideon?',
  '["He blew a trumpet and gathered men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He blew a trumpet and gathered men',
  'When the Spirit clothed Gideon, he blew a trumpet and summoned Israel (Judges 6:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'From Judges 6, what happened when the Spirit of the LORD clothed Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  4,
  'From Judges 6, why was Israel impoverished in Judges 6?',
  '["Because Midian ravaged the land", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because Midian ravaged the land',
  'Midian destroyed Israel''s produce and livestock, leaving them impoverished (Judges 6:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'From Judges 6, why was Israel impoverished in Judges 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  5,
  'In the events of Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?',
  '["Gideon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gideon',
  'Gideon was threshing wheat in the winepress when the angel appeared (Judges 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 6, who was threshing wheat in a winepress when the angel of the LORD appeared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  5,
  'In the events of Judges 6, what title did the angel call Gideon?',
  '["Mighty man of valor", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Mighty man of valor',
  'The angel addressed Gideon as a mighty man of valor (Judges 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 6, what title did the angel call Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  5,
  'In the events of Judges 6, what sign did Gideon ask concerning the fleece?',
  '["That dew would fall on the fleece alone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That dew would fall on the fleece alone',
  'Gideon asked for signs involving the fleece and the dew (Judges 6:36-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 6, what sign did Gideon ask concerning the fleece?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  5,
  'In the events of Judges 6, whose altar did Gideon tear down by night?',
  '["Baal''s altar belonging to his father", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Baal''s altar belonging to his father',
  'Gideon tore down the altar of Baal and cut down the Asherah (Judges 6:25-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 6, whose altar did Gideon tear down by night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  5,
  'In the events of Judges 6, what new name was given to Gideon after the altar incident?',
  '["Jerubbaal", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jerubbaal',
  'Gideon was called Jerubbaal after tearing down Baal''s altar (Judges 6:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 6, what new name was given to Gideon after the altar incident?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  5,
  'In the events of Judges 6, what happened when the Spirit of the LORD clothed Gideon?',
  '["He blew a trumpet and gathered men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He blew a trumpet and gathered men',
  'When the Spirit clothed Gideon, he blew a trumpet and summoned Israel (Judges 6:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 6, what happened when the Spirit of the LORD clothed Gideon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  6,
  5,
  'In the events of Judges 6, why was Israel impoverished in Judges 6?',
  '["Because Midian ravaged the land", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because Midian ravaged the land',
  'Midian destroyed Israel''s produce and livestock, leaving them impoverished (Judges 6:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 6, why was Israel impoverished in Judges 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  1,
  'Why did the LORD reduce Gideon''s army?',
  '["So Israel would not boast against Him", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'So Israel would not boast against Him',
  'The LORD reduced the army so Israel could not say its own hand saved it (Judges 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Why did the LORD reduce Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  1,
  'How many men remained with Gideon after the testing by the water?',
  '["Three hundred", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Three hundred',
  'Only three hundred men remained with Gideon (Judges 7:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'How many men remained with Gideon after the testing by the water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  1,
  'What did Gideon hear in the Midianite camp that encouraged him?',
  '["A dream about a barley loaf overturning a tent", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A dream about a barley loaf overturning a tent',
  'A Midianite told a dream about a barley cake overturning the tent (Judges 7:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What did Gideon hear in the Midianite camp that encouraged him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  1,
  'What did Gideon''s men carry besides trumpets?',
  '["Empty pitchers with torches inside", "A two-edged dagger", "Milk", "That dew would fall on the fleece alone"]'::jsonb,
  'Empty pitchers with torches inside',
  'They carried trumpets and empty pitchers with torches inside them (Judges 7:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What did Gideon''s men carry besides trumpets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  1,
  'What cry did Gideon''s men shout in the attack?',
  '["\"The sword of the LORD and of Gideon\"", "Mighty man of valor", "Jerubbaal", "\"The LORD shall rule over you\""]'::jsonb,
  '"The sword of the LORD and of Gideon"',
  'They cried, The sword of the LORD and of Gideon (Judges 7:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What cry did Gideon''s men shout in the attack?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  1,
  'What happened in the Midianite camp when Gideon''s men broke the pitchers?',
  '["The LORD set every man''s sword against his fellow", "Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "It had rest for forty years"]'::jsonb,
  'The LORD set every man''s sword against his fellow',
  'The LORD set the Midianites against one another in confusion (Judges 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What happened in the Midianite camp when Gideon''s men broke the pitchers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  1,
  'Why did Gideon worship after hearing the dream interpretation?',
  '["Because he knew the LORD had given Midian into his hand", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'Because he knew the LORD had given Midian into his hand',
  'Gideon worshiped after hearing the dream and its interpretation (Judges 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Why did Gideon worship after hearing the dream interpretation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  2,
  'In Judges 7, why did the LORD reduce Gideon''s army?',
  '["So Israel would not boast against Him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So Israel would not boast against Him',
  'The LORD reduced the army so Israel could not say its own hand saved it (Judges 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'In Judges 7, why did the LORD reduce Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  2,
  'In Judges 7, how many men remained with Gideon after the testing by the water?',
  '["Three hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred',
  'Only three hundred men remained with Gideon (Judges 7:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'In Judges 7, how many men remained with Gideon after the testing by the water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  2,
  'In Judges 7, what did Gideon hear in the Midianite camp that encouraged him?',
  '["A dream about a barley loaf overturning a tent", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A dream about a barley loaf overturning a tent',
  'A Midianite told a dream about a barley cake overturning the tent (Judges 7:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'In Judges 7, what did Gideon hear in the Midianite camp that encouraged him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  2,
  'In Judges 7, what did Gideon''s men carry besides trumpets?',
  '["Empty pitchers with torches inside", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Empty pitchers with torches inside',
  'They carried trumpets and empty pitchers with torches inside them (Judges 7:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'In Judges 7, what did Gideon''s men carry besides trumpets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  2,
  'In Judges 7, what cry did Gideon''s men shout in the attack?',
  '["\"The sword of the LORD and of Gideon\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The sword of the LORD and of Gideon"',
  'They cried, The sword of the LORD and of Gideon (Judges 7:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'In Judges 7, what cry did Gideon''s men shout in the attack?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  2,
  'In Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?',
  '["The LORD set every man''s sword against his fellow", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD set every man''s sword against his fellow',
  'The LORD set the Midianites against one another in confusion (Judges 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'In Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  2,
  'In Judges 7, why did Gideon worship after hearing the dream interpretation?',
  '["Because he knew the LORD had given Midian into his hand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he knew the LORD had given Midian into his hand',
  'Gideon worshiped after hearing the dream and its interpretation (Judges 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'In Judges 7, why did Gideon worship after hearing the dream interpretation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  3,
  'According to Judges 7, why did the LORD reduce Gideon''s army?',
  '["So Israel would not boast against Him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So Israel would not boast against Him',
  'The LORD reduced the army so Israel could not say its own hand saved it (Judges 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 7, why did the LORD reduce Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  3,
  'According to Judges 7, how many men remained with Gideon after the testing by the water?',
  '["Three hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred',
  'Only three hundred men remained with Gideon (Judges 7:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 7, how many men remained with Gideon after the testing by the water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  3,
  'According to Judges 7, what did Gideon hear in the Midianite camp that encouraged him?',
  '["A dream about a barley loaf overturning a tent", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A dream about a barley loaf overturning a tent',
  'A Midianite told a dream about a barley cake overturning the tent (Judges 7:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 7, what did Gideon hear in the Midianite camp that encouraged him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  3,
  'According to Judges 7, what did Gideon''s men carry besides trumpets?',
  '["Empty pitchers with torches inside", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Empty pitchers with torches inside',
  'They carried trumpets and empty pitchers with torches inside them (Judges 7:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 7, what did Gideon''s men carry besides trumpets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  3,
  'According to Judges 7, what cry did Gideon''s men shout in the attack?',
  '["\"The sword of the LORD and of Gideon\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The sword of the LORD and of Gideon"',
  'They cried, The sword of the LORD and of Gideon (Judges 7:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 7, what cry did Gideon''s men shout in the attack?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  3,
  'According to Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?',
  '["The LORD set every man''s sword against his fellow", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD set every man''s sword against his fellow',
  'The LORD set the Midianites against one another in confusion (Judges 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  3,
  'According to Judges 7, why did Gideon worship after hearing the dream interpretation?',
  '["Because he knew the LORD had given Midian into his hand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he knew the LORD had given Midian into his hand',
  'Gideon worshiped after hearing the dream and its interpretation (Judges 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 7, why did Gideon worship after hearing the dream interpretation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  4,
  'From Judges 7, why did the LORD reduce Gideon''s army?',
  '["So Israel would not boast against Him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So Israel would not boast against Him',
  'The LORD reduced the army so Israel could not say its own hand saved it (Judges 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'From Judges 7, why did the LORD reduce Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  4,
  'From Judges 7, how many men remained with Gideon after the testing by the water?',
  '["Three hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred',
  'Only three hundred men remained with Gideon (Judges 7:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'From Judges 7, how many men remained with Gideon after the testing by the water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  4,
  'From Judges 7, what did Gideon hear in the Midianite camp that encouraged him?',
  '["A dream about a barley loaf overturning a tent", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A dream about a barley loaf overturning a tent',
  'A Midianite told a dream about a barley cake overturning the tent (Judges 7:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'From Judges 7, what did Gideon hear in the Midianite camp that encouraged him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  4,
  'From Judges 7, what did Gideon''s men carry besides trumpets?',
  '["Empty pitchers with torches inside", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Empty pitchers with torches inside',
  'They carried trumpets and empty pitchers with torches inside them (Judges 7:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'From Judges 7, what did Gideon''s men carry besides trumpets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  4,
  'From Judges 7, what cry did Gideon''s men shout in the attack?',
  '["\"The sword of the LORD and of Gideon\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The sword of the LORD and of Gideon"',
  'They cried, The sword of the LORD and of Gideon (Judges 7:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'From Judges 7, what cry did Gideon''s men shout in the attack?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  4,
  'From Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?',
  '["The LORD set every man''s sword against his fellow", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD set every man''s sword against his fellow',
  'The LORD set the Midianites against one another in confusion (Judges 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'From Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  4,
  'From Judges 7, why did Gideon worship after hearing the dream interpretation?',
  '["Because he knew the LORD had given Midian into his hand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he knew the LORD had given Midian into his hand',
  'Gideon worshiped after hearing the dream and its interpretation (Judges 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'From Judges 7, why did Gideon worship after hearing the dream interpretation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  5,
  'In the events of Judges 7, why did the LORD reduce Gideon''s army?',
  '["So Israel would not boast against Him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So Israel would not boast against Him',
  'The LORD reduced the army so Israel could not say its own hand saved it (Judges 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 7, why did the LORD reduce Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  5,
  'In the events of Judges 7, how many men remained with Gideon after the testing by the water?',
  '["Three hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred',
  'Only three hundred men remained with Gideon (Judges 7:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 7, how many men remained with Gideon after the testing by the water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  5,
  'In the events of Judges 7, what did Gideon hear in the Midianite camp that encouraged him?',
  '["A dream about a barley loaf overturning a tent", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A dream about a barley loaf overturning a tent',
  'A Midianite told a dream about a barley cake overturning the tent (Judges 7:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 7, what did Gideon hear in the Midianite camp that encouraged him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  5,
  'In the events of Judges 7, what did Gideon''s men carry besides trumpets?',
  '["Empty pitchers with torches inside", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Empty pitchers with torches inside',
  'They carried trumpets and empty pitchers with torches inside them (Judges 7:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 7, what did Gideon''s men carry besides trumpets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  5,
  'In the events of Judges 7, what cry did Gideon''s men shout in the attack?',
  '["\"The sword of the LORD and of Gideon\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The sword of the LORD and of Gideon"',
  'They cried, The sword of the LORD and of Gideon (Judges 7:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 7, what cry did Gideon''s men shout in the attack?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  5,
  'In the events of Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?',
  '["The LORD set every man''s sword against his fellow", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The LORD set every man''s sword against his fellow',
  'The LORD set the Midianites against one another in confusion (Judges 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 7, what happened in the Midianite camp when Gideon''s men broke the pitchers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  7,
  5,
  'In the events of Judges 7, why did Gideon worship after hearing the dream interpretation?',
  '["Because he knew the LORD had given Midian into his hand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he knew the LORD had given Midian into his hand',
  'Gideon worshiped after hearing the dream and its interpretation (Judges 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 7, why did Gideon worship after hearing the dream interpretation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  1,
  'Which two Midianite kings did Gideon pursue in Judges 8?',
  '["Zebah and Zalmunna", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Zebah and Zalmunna',
  'Gideon pursued and captured Zebah and Zalmunna (Judges 8:5, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'Which two Midianite kings did Gideon pursue in Judges 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  1,
  'What did the men of Succoth refuse to give Gideon''s army?',
  '["Bread", "A two-edged dagger", "Milk", "That dew would fall on the fleece alone"]'::jsonb,
  'Bread',
  'The men of Succoth refused to give bread to Gideon''s weary men (Judges 8:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What did the men of Succoth refuse to give Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  1,
  'What did Gideon make from the golden earrings taken from the spoil?',
  '["An ephod", "A two-edged dagger", "Milk", "That dew would fall on the fleece alone"]'::jsonb,
  'An ephod',
  'Gideon made an ephod from the gold taken in battle (Judges 8:24-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What did Gideon make from the golden earrings taken from the spoil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  1,
  'What did Israel ask Gideon to do after the victory?',
  '["Rule over them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Rule over them',
  'Israel asked Gideon and his family to rule over them (Judges 8:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What did Israel ask Gideon to do after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  1,
  'How did Gideon answer Israel''s request to rule?',
  '["\"The LORD shall rule over you\"", "Mighty man of valor", "Jerubbaal", "\"The sword of the LORD and of Gideon\""]'::jsonb,
  '"The LORD shall rule over you"',
  'Gideon said he would not rule over them because the LORD would rule over them (Judges 8:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'How did Gideon answer Israel''s request to rule?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  1,
  'What happened to Gideon''s ephod at Ophrah?',
  '["It became a snare", "Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "It had rest for forty years"]'::jsonb,
  'It became a snare',
  'The ephod became a snare to Gideon and his house (Judges 8:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What happened to Gideon''s ephod at Ophrah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  1,
  'How long did the land have rest in Gideon''s days?',
  '["Forty years", "Six hundred", "Nine hundred", "Three hundred"]'::jsonb,
  'Forty years',
  'The land had rest for forty years in the days of Gideon (Judges 8:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'How long did the land have rest in Gideon''s days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  2,
  'In Judges 8, which two Midianite kings did Gideon pursue in Judges 8?',
  '["Zebah and Zalmunna", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Zebah and Zalmunna',
  'Gideon pursued and captured Zebah and Zalmunna (Judges 8:5, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In Judges 8, which two Midianite kings did Gideon pursue in Judges 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  2,
  'In Judges 8, what did the men of Succoth refuse to give Gideon''s army?',
  '["Bread", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bread',
  'The men of Succoth refused to give bread to Gideon''s weary men (Judges 8:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In Judges 8, what did the men of Succoth refuse to give Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  2,
  'In Judges 8, what did Gideon make from the golden earrings taken from the spoil?',
  '["An ephod", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod',
  'Gideon made an ephod from the gold taken in battle (Judges 8:24-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In Judges 8, what did Gideon make from the golden earrings taken from the spoil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  2,
  'In Judges 8, what did Israel ask Gideon to do after the victory?',
  '["Rule over them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Rule over them',
  'Israel asked Gideon and his family to rule over them (Judges 8:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In Judges 8, what did Israel ask Gideon to do after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  2,
  'In Judges 8, how did Gideon answer Israel''s request to rule?',
  '["\"The LORD shall rule over you\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The LORD shall rule over you"',
  'Gideon said he would not rule over them because the LORD would rule over them (Judges 8:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In Judges 8, how did Gideon answer Israel''s request to rule?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  2,
  'In Judges 8, what happened to Gideon''s ephod at Ophrah?',
  '["It became a snare", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It became a snare',
  'The ephod became a snare to Gideon and his house (Judges 8:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In Judges 8, what happened to Gideon''s ephod at Ophrah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  2,
  'In Judges 8, how long did the land have rest in Gideon''s days?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years in the days of Gideon (Judges 8:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In Judges 8, how long did the land have rest in Gideon''s days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  3,
  'According to Judges 8, which two Midianite kings did Gideon pursue in Judges 8?',
  '["Zebah and Zalmunna", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Zebah and Zalmunna',
  'Gideon pursued and captured Zebah and Zalmunna (Judges 8:5, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 8, which two Midianite kings did Gideon pursue in Judges 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  3,
  'According to Judges 8, what did the men of Succoth refuse to give Gideon''s army?',
  '["Bread", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bread',
  'The men of Succoth refused to give bread to Gideon''s weary men (Judges 8:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 8, what did the men of Succoth refuse to give Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  3,
  'According to Judges 8, what did Gideon make from the golden earrings taken from the spoil?',
  '["An ephod", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod',
  'Gideon made an ephod from the gold taken in battle (Judges 8:24-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 8, what did Gideon make from the golden earrings taken from the spoil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  3,
  'According to Judges 8, what did Israel ask Gideon to do after the victory?',
  '["Rule over them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Rule over them',
  'Israel asked Gideon and his family to rule over them (Judges 8:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 8, what did Israel ask Gideon to do after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  3,
  'According to Judges 8, how did Gideon answer Israel''s request to rule?',
  '["\"The LORD shall rule over you\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The LORD shall rule over you"',
  'Gideon said he would not rule over them because the LORD would rule over them (Judges 8:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 8, how did Gideon answer Israel''s request to rule?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  3,
  'According to Judges 8, what happened to Gideon''s ephod at Ophrah?',
  '["It became a snare", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It became a snare',
  'The ephod became a snare to Gideon and his house (Judges 8:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 8, what happened to Gideon''s ephod at Ophrah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  3,
  'According to Judges 8, how long did the land have rest in Gideon''s days?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years in the days of Gideon (Judges 8:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 8, how long did the land have rest in Gideon''s days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  4,
  'From Judges 8, which two Midianite kings did Gideon pursue in Judges 8?',
  '["Zebah and Zalmunna", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Zebah and Zalmunna',
  'Gideon pursued and captured Zebah and Zalmunna (Judges 8:5, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'From Judges 8, which two Midianite kings did Gideon pursue in Judges 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  4,
  'From Judges 8, what did the men of Succoth refuse to give Gideon''s army?',
  '["Bread", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bread',
  'The men of Succoth refused to give bread to Gideon''s weary men (Judges 8:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'From Judges 8, what did the men of Succoth refuse to give Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  4,
  'From Judges 8, what did Gideon make from the golden earrings taken from the spoil?',
  '["An ephod", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod',
  'Gideon made an ephod from the gold taken in battle (Judges 8:24-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'From Judges 8, what did Gideon make from the golden earrings taken from the spoil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  4,
  'From Judges 8, what did Israel ask Gideon to do after the victory?',
  '["Rule over them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Rule over them',
  'Israel asked Gideon and his family to rule over them (Judges 8:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'From Judges 8, what did Israel ask Gideon to do after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  4,
  'From Judges 8, how did Gideon answer Israel''s request to rule?',
  '["\"The LORD shall rule over you\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The LORD shall rule over you"',
  'Gideon said he would not rule over them because the LORD would rule over them (Judges 8:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'From Judges 8, how did Gideon answer Israel''s request to rule?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  4,
  'From Judges 8, what happened to Gideon''s ephod at Ophrah?',
  '["It became a snare", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It became a snare',
  'The ephod became a snare to Gideon and his house (Judges 8:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'From Judges 8, what happened to Gideon''s ephod at Ophrah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  4,
  'From Judges 8, how long did the land have rest in Gideon''s days?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years in the days of Gideon (Judges 8:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'From Judges 8, how long did the land have rest in Gideon''s days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  5,
  'In the events of Judges 8, which two Midianite kings did Gideon pursue in Judges 8?',
  '["Zebah and Zalmunna", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Zebah and Zalmunna',
  'Gideon pursued and captured Zebah and Zalmunna (Judges 8:5, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 8, which two Midianite kings did Gideon pursue in Judges 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  5,
  'In the events of Judges 8, what did the men of Succoth refuse to give Gideon''s army?',
  '["Bread", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bread',
  'The men of Succoth refused to give bread to Gideon''s weary men (Judges 8:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 8, what did the men of Succoth refuse to give Gideon''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  5,
  'In the events of Judges 8, what did Gideon make from the golden earrings taken from the spoil?',
  '["An ephod", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod',
  'Gideon made an ephod from the gold taken in battle (Judges 8:24-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 8, what did Gideon make from the golden earrings taken from the spoil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  5,
  'In the events of Judges 8, what did Israel ask Gideon to do after the victory?',
  '["Rule over them", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Rule over them',
  'Israel asked Gideon and his family to rule over them (Judges 8:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 8, what did Israel ask Gideon to do after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  5,
  'In the events of Judges 8, how did Gideon answer Israel''s request to rule?',
  '["\"The LORD shall rule over you\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"The LORD shall rule over you"',
  'Gideon said he would not rule over them because the LORD would rule over them (Judges 8:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 8, how did Gideon answer Israel''s request to rule?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  5,
  'In the events of Judges 8, what happened to Gideon''s ephod at Ophrah?',
  '["It became a snare", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It became a snare',
  'The ephod became a snare to Gideon and his house (Judges 8:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 8, what happened to Gideon''s ephod at Ophrah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  8,
  5,
  'In the events of Judges 8, how long did the land have rest in Gideon''s days?',
  '["Forty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty years',
  'The land had rest for forty years in the days of Gideon (Judges 8:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 8, how long did the land have rest in Gideon''s days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  1,
  'Who killed his brothers to make himself king at Shechem?',
  '["Abimelech", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Abimelech',
  'Abimelech killed his brothers and made himself king (Judges 9:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Who killed his brothers to make himself king at Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  1,
  'How many brothers of Abimelech were killed on one stone?',
  '["Seventy", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Seventy',
  'Abimelech killed seventy of his brothers on one stone (Judges 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'How many brothers of Abimelech were killed on one stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  1,
  'Who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?',
  '["Jotham", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Jotham',
  'Jotham escaped and spoke his parable from Mount Gerizim (Judges 9:5, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  1,
  'What plant accepted the offer to rule in Jotham''s parable?',
  '["The bramble", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The bramble',
  'In Jotham''s parable, the bramble accepted the rule (Judges 9:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What plant accepted the offer to rule in Jotham''s parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  1,
  'What did a woman drop on Abimelech''s head at Thebez?',
  '["An upper millstone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An upper millstone',
  'A woman threw an upper millstone on Abimelech''s head (Judges 9:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What did a woman drop on Abimelech''s head at Thebez?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  1,
  'Why did Abimelech ask his armor-bearer to kill him?',
  '["So people would not say a woman killed him", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'So people would not say a woman killed him',
  'Abimelech wanted to avoid the disgrace of being said to have died by a woman''s hand (Judges 9:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Why did Abimelech ask his armor-bearer to kill him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  1,
  'What did God return upon Abimelech and the men of Shechem?',
  '["The evil they had done", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The evil they had done',
  'God returned the evil of Abimelech and the men of Shechem upon their heads (Judges 9:56-57).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What did God return upon Abimelech and the men of Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  2,
  'In Judges 9, who killed his brothers to make himself king at Shechem?',
  '["Abimelech", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abimelech',
  'Abimelech killed his brothers and made himself king (Judges 9:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'In Judges 9, who killed his brothers to make himself king at Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  2,
  'In Judges 9, how many brothers of Abimelech were killed on one stone?',
  '["Seventy", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seventy',
  'Abimelech killed seventy of his brothers on one stone (Judges 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'In Judges 9, how many brothers of Abimelech were killed on one stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  2,
  'In Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?',
  '["Jotham", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jotham',
  'Jotham escaped and spoke his parable from Mount Gerizim (Judges 9:5, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'In Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  2,
  'In Judges 9, what plant accepted the offer to rule in Jotham''s parable?',
  '["The bramble", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The bramble',
  'In Jotham''s parable, the bramble accepted the rule (Judges 9:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'In Judges 9, what plant accepted the offer to rule in Jotham''s parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  2,
  'In Judges 9, what did a woman drop on Abimelech''s head at Thebez?',
  '["An upper millstone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An upper millstone',
  'A woman threw an upper millstone on Abimelech''s head (Judges 9:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'In Judges 9, what did a woman drop on Abimelech''s head at Thebez?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  2,
  'In Judges 9, why did Abimelech ask his armor-bearer to kill him?',
  '["So people would not say a woman killed him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So people would not say a woman killed him',
  'Abimelech wanted to avoid the disgrace of being said to have died by a woman''s hand (Judges 9:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'In Judges 9, why did Abimelech ask his armor-bearer to kill him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  2,
  'In Judges 9, what did God return upon Abimelech and the men of Shechem?',
  '["The evil they had done", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The evil they had done',
  'God returned the evil of Abimelech and the men of Shechem upon their heads (Judges 9:56-57).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'In Judges 9, what did God return upon Abimelech and the men of Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  3,
  'According to Judges 9, who killed his brothers to make himself king at Shechem?',
  '["Abimelech", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abimelech',
  'Abimelech killed his brothers and made himself king (Judges 9:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 9, who killed his brothers to make himself king at Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  3,
  'According to Judges 9, how many brothers of Abimelech were killed on one stone?',
  '["Seventy", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seventy',
  'Abimelech killed seventy of his brothers on one stone (Judges 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 9, how many brothers of Abimelech were killed on one stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  3,
  'According to Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?',
  '["Jotham", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jotham',
  'Jotham escaped and spoke his parable from Mount Gerizim (Judges 9:5, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  3,
  'According to Judges 9, what plant accepted the offer to rule in Jotham''s parable?',
  '["The bramble", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The bramble',
  'In Jotham''s parable, the bramble accepted the rule (Judges 9:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 9, what plant accepted the offer to rule in Jotham''s parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  3,
  'According to Judges 9, what did a woman drop on Abimelech''s head at Thebez?',
  '["An upper millstone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An upper millstone',
  'A woman threw an upper millstone on Abimelech''s head (Judges 9:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 9, what did a woman drop on Abimelech''s head at Thebez?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  3,
  'According to Judges 9, why did Abimelech ask his armor-bearer to kill him?',
  '["So people would not say a woman killed him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So people would not say a woman killed him',
  'Abimelech wanted to avoid the disgrace of being said to have died by a woman''s hand (Judges 9:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 9, why did Abimelech ask his armor-bearer to kill him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  3,
  'According to Judges 9, what did God return upon Abimelech and the men of Shechem?',
  '["The evil they had done", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The evil they had done',
  'God returned the evil of Abimelech and the men of Shechem upon their heads (Judges 9:56-57).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 9, what did God return upon Abimelech and the men of Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  4,
  'From Judges 9, who killed his brothers to make himself king at Shechem?',
  '["Abimelech", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abimelech',
  'Abimelech killed his brothers and made himself king (Judges 9:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'From Judges 9, who killed his brothers to make himself king at Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  4,
  'From Judges 9, how many brothers of Abimelech were killed on one stone?',
  '["Seventy", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seventy',
  'Abimelech killed seventy of his brothers on one stone (Judges 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'From Judges 9, how many brothers of Abimelech were killed on one stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  4,
  'From Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?',
  '["Jotham", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jotham',
  'Jotham escaped and spoke his parable from Mount Gerizim (Judges 9:5, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'From Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  4,
  'From Judges 9, what plant accepted the offer to rule in Jotham''s parable?',
  '["The bramble", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The bramble',
  'In Jotham''s parable, the bramble accepted the rule (Judges 9:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'From Judges 9, what plant accepted the offer to rule in Jotham''s parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  4,
  'From Judges 9, what did a woman drop on Abimelech''s head at Thebez?',
  '["An upper millstone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An upper millstone',
  'A woman threw an upper millstone on Abimelech''s head (Judges 9:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'From Judges 9, what did a woman drop on Abimelech''s head at Thebez?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  4,
  'From Judges 9, why did Abimelech ask his armor-bearer to kill him?',
  '["So people would not say a woman killed him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So people would not say a woman killed him',
  'Abimelech wanted to avoid the disgrace of being said to have died by a woman''s hand (Judges 9:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'From Judges 9, why did Abimelech ask his armor-bearer to kill him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  4,
  'From Judges 9, what did God return upon Abimelech and the men of Shechem?',
  '["The evil they had done", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The evil they had done',
  'God returned the evil of Abimelech and the men of Shechem upon their heads (Judges 9:56-57).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'From Judges 9, what did God return upon Abimelech and the men of Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  5,
  'In the events of Judges 9, who killed his brothers to make himself king at Shechem?',
  '["Abimelech", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abimelech',
  'Abimelech killed his brothers and made himself king (Judges 9:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 9, who killed his brothers to make himself king at Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  5,
  'In the events of Judges 9, how many brothers of Abimelech were killed on one stone?',
  '["Seventy", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seventy',
  'Abimelech killed seventy of his brothers on one stone (Judges 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 9, how many brothers of Abimelech were killed on one stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  5,
  'In the events of Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?',
  '["Jotham", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jotham',
  'Jotham escaped and spoke his parable from Mount Gerizim (Judges 9:5, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 9, who escaped Abimelech''s slaughter and later spoke from Mount Gerizim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  5,
  'In the events of Judges 9, what plant accepted the offer to rule in Jotham''s parable?',
  '["The bramble", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The bramble',
  'In Jotham''s parable, the bramble accepted the rule (Judges 9:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 9, what plant accepted the offer to rule in Jotham''s parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  5,
  'In the events of Judges 9, what did a woman drop on Abimelech''s head at Thebez?',
  '["An upper millstone", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An upper millstone',
  'A woman threw an upper millstone on Abimelech''s head (Judges 9:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 9, what did a woman drop on Abimelech''s head at Thebez?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  5,
  'In the events of Judges 9, why did Abimelech ask his armor-bearer to kill him?',
  '["So people would not say a woman killed him", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'So people would not say a woman killed him',
  'Abimelech wanted to avoid the disgrace of being said to have died by a woman''s hand (Judges 9:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 9, why did Abimelech ask his armor-bearer to kill him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  9,
  5,
  'In the events of Judges 9, what did God return upon Abimelech and the men of Shechem?',
  '["The evil they had done", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The evil they had done',
  'God returned the evil of Abimelech and the men of Shechem upon their heads (Judges 9:56-57).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 9, what did God return upon Abimelech and the men of Shechem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  1,
  'Which judge from Issachar judged Israel after Abimelech?',
  '["Tola", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Tola',
  'Tola arose to save Israel after Abimelech (Judges 10:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Which judge from Issachar judged Israel after Abimelech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  1,
  'Which judge had thirty sons riding thirty donkeys?',
  '["Jair", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Jair',
  'Jair had thirty sons who rode thirty donkeys and ruled thirty cities (Judges 10:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Which judge had thirty sons riding thirty donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  1,
  'For how many years did the Philistines and Ammonites oppress Israel?',
  '["Eighteen years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eighteen years',
  'The people were oppressed for eighteen years (Judges 10:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'For how many years did the Philistines and Ammonites oppress Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  1,
  'What did Israel put away when they returned to the LORD in Judges 10?',
  '["The foreign gods", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The foreign gods',
  'Israel put away the foreign gods and served the LORD (Judges 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What did Israel put away when they returned to the LORD in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  1,
  'What did the LORD tell Israel to do after they cried out in Judges 10?',
  '["\"Go and cry out to the gods you have chosen\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Go and cry out to the gods you have chosen"',
  'The LORD rebuked Israel and told them to cry out to the gods they had chosen (Judges 10:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What did the LORD tell Israel to do after they cried out in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  1,
  'Which enemy gathered in Gilead in Judges 10?',
  '["The Ammonites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Ammonites',
  'The Ammonites gathered and camped in Gilead (Judges 10:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Which enemy gathered in Gilead in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  1,
  'What question did the leaders of Gilead ask at the end of Judges 10?',
  '["\"Who will begin to fight against the Ammonites?\"", "Mighty man of valor", "Jerubbaal", "\"The sword of the LORD and of Gideon\""]'::jsonb,
  '"Who will begin to fight against the Ammonites?"',
  'The leaders asked who would begin to fight the Ammonites (Judges 10:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What question did the leaders of Gilead ask at the end of Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  2,
  'In Judges 10, which judge from Issachar judged Israel after Abimelech?',
  '["Tola", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Tola',
  'Tola arose to save Israel after Abimelech (Judges 10:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'In Judges 10, which judge from Issachar judged Israel after Abimelech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  2,
  'In Judges 10, which judge had thirty sons riding thirty donkeys?',
  '["Jair", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jair',
  'Jair had thirty sons who rode thirty donkeys and ruled thirty cities (Judges 10:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'In Judges 10, which judge had thirty sons riding thirty donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  2,
  'In Judges 10, for how many years did the Philistines and Ammonites oppress Israel?',
  '["Eighteen years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eighteen years',
  'The people were oppressed for eighteen years (Judges 10:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'In Judges 10, for how many years did the Philistines and Ammonites oppress Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  2,
  'In Judges 10, what did Israel put away when they returned to the LORD in Judges 10?',
  '["The foreign gods", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The foreign gods',
  'Israel put away the foreign gods and served the LORD (Judges 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'In Judges 10, what did Israel put away when they returned to the LORD in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  2,
  'In Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?',
  '["\"Go and cry out to the gods you have chosen\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Go and cry out to the gods you have chosen"',
  'The LORD rebuked Israel and told them to cry out to the gods they had chosen (Judges 10:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'In Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  2,
  'In Judges 10, which enemy gathered in Gilead in Judges 10?',
  '["The Ammonites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Ammonites',
  'The Ammonites gathered and camped in Gilead (Judges 10:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'In Judges 10, which enemy gathered in Gilead in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  2,
  'In Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?',
  '["\"Who will begin to fight against the Ammonites?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Who will begin to fight against the Ammonites?"',
  'The leaders asked who would begin to fight the Ammonites (Judges 10:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'In Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  3,
  'According to Judges 10, which judge from Issachar judged Israel after Abimelech?',
  '["Tola", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Tola',
  'Tola arose to save Israel after Abimelech (Judges 10:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 10, which judge from Issachar judged Israel after Abimelech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  3,
  'According to Judges 10, which judge had thirty sons riding thirty donkeys?',
  '["Jair", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jair',
  'Jair had thirty sons who rode thirty donkeys and ruled thirty cities (Judges 10:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 10, which judge had thirty sons riding thirty donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  3,
  'According to Judges 10, for how many years did the Philistines and Ammonites oppress Israel?',
  '["Eighteen years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eighteen years',
  'The people were oppressed for eighteen years (Judges 10:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 10, for how many years did the Philistines and Ammonites oppress Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  3,
  'According to Judges 10, what did Israel put away when they returned to the LORD in Judges 10?',
  '["The foreign gods", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The foreign gods',
  'Israel put away the foreign gods and served the LORD (Judges 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 10, what did Israel put away when they returned to the LORD in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  3,
  'According to Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?',
  '["\"Go and cry out to the gods you have chosen\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Go and cry out to the gods you have chosen"',
  'The LORD rebuked Israel and told them to cry out to the gods they had chosen (Judges 10:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  3,
  'According to Judges 10, which enemy gathered in Gilead in Judges 10?',
  '["The Ammonites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Ammonites',
  'The Ammonites gathered and camped in Gilead (Judges 10:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 10, which enemy gathered in Gilead in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  3,
  'According to Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?',
  '["\"Who will begin to fight against the Ammonites?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Who will begin to fight against the Ammonites?"',
  'The leaders asked who would begin to fight the Ammonites (Judges 10:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  4,
  'From Judges 10, which judge from Issachar judged Israel after Abimelech?',
  '["Tola", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Tola',
  'Tola arose to save Israel after Abimelech (Judges 10:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'From Judges 10, which judge from Issachar judged Israel after Abimelech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  4,
  'From Judges 10, which judge had thirty sons riding thirty donkeys?',
  '["Jair", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jair',
  'Jair had thirty sons who rode thirty donkeys and ruled thirty cities (Judges 10:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'From Judges 10, which judge had thirty sons riding thirty donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  4,
  'From Judges 10, for how many years did the Philistines and Ammonites oppress Israel?',
  '["Eighteen years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eighteen years',
  'The people were oppressed for eighteen years (Judges 10:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'From Judges 10, for how many years did the Philistines and Ammonites oppress Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  4,
  'From Judges 10, what did Israel put away when they returned to the LORD in Judges 10?',
  '["The foreign gods", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The foreign gods',
  'Israel put away the foreign gods and served the LORD (Judges 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'From Judges 10, what did Israel put away when they returned to the LORD in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  4,
  'From Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?',
  '["\"Go and cry out to the gods you have chosen\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Go and cry out to the gods you have chosen"',
  'The LORD rebuked Israel and told them to cry out to the gods they had chosen (Judges 10:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'From Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  4,
  'From Judges 10, which enemy gathered in Gilead in Judges 10?',
  '["The Ammonites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Ammonites',
  'The Ammonites gathered and camped in Gilead (Judges 10:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'From Judges 10, which enemy gathered in Gilead in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  4,
  'From Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?',
  '["\"Who will begin to fight against the Ammonites?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Who will begin to fight against the Ammonites?"',
  'The leaders asked who would begin to fight the Ammonites (Judges 10:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'From Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  5,
  'In the events of Judges 10, which judge from Issachar judged Israel after Abimelech?',
  '["Tola", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Tola',
  'Tola arose to save Israel after Abimelech (Judges 10:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 10, which judge from Issachar judged Israel after Abimelech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  5,
  'In the events of Judges 10, which judge had thirty sons riding thirty donkeys?',
  '["Jair", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jair',
  'Jair had thirty sons who rode thirty donkeys and ruled thirty cities (Judges 10:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 10, which judge had thirty sons riding thirty donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  5,
  'In the events of Judges 10, for how many years did the Philistines and Ammonites oppress Israel?',
  '["Eighteen years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Eighteen years',
  'The people were oppressed for eighteen years (Judges 10:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 10, for how many years did the Philistines and Ammonites oppress Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  5,
  'In the events of Judges 10, what did Israel put away when they returned to the LORD in Judges 10?',
  '["The foreign gods", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The foreign gods',
  'Israel put away the foreign gods and served the LORD (Judges 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 10, what did Israel put away when they returned to the LORD in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  5,
  'In the events of Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?',
  '["\"Go and cry out to the gods you have chosen\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Go and cry out to the gods you have chosen"',
  'The LORD rebuked Israel and told them to cry out to the gods they had chosen (Judges 10:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 10, what did the LORD tell Israel to do after they cried out in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  5,
  'In the events of Judges 10, which enemy gathered in Gilead in Judges 10?',
  '["The Ammonites", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Ammonites',
  'The Ammonites gathered and camped in Gilead (Judges 10:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 10, which enemy gathered in Gilead in Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  10,
  5,
  'In the events of Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?',
  '["\"Who will begin to fight against the Ammonites?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Who will begin to fight against the Ammonites?"',
  'The leaders asked who would begin to fight the Ammonites (Judges 10:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 10, what question did the leaders of Gilead ask at the end of Judges 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  1,
  'Which judge was the son of a prostitute and became a mighty warrior?',
  '["Jephthah", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Jephthah',
  'Jephthah the Gileadite was a mighty warrior and the son of a prostitute (Judges 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'Which judge was the son of a prostitute and became a mighty warrior?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  1,
  'From what land did Jephthah lead men before being called back?',
  '["The land of Tob", "Timnah", "Lehi", "Bethlehem in Judah"]'::jsonb,
  'The land of Tob',
  'Jephthah dwelt in the land of Tob before the elders called him back (Judges 11:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'From what land did Jephthah lead men before being called back?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  1,
  'What vow did Jephthah make before fighting the Ammonites?',
  '["To offer whatever came out of his house if the LORD gave victory", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To offer whatever came out of his house if the LORD gave victory',
  'Jephthah vowed to offer what came out of his house if he returned in peace (Judges 11:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'What vow did Jephthah make before fighting the Ammonites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  1,
  'Who came out first to meet Jephthah after the victory?',
  '["His daughter", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'His daughter',
  'Jephthah''s daughter came out first with tambourines and dancing (Judges 11:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'Who came out first to meet Jephthah after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  1,
  'How long had Israel possessed the disputed land according to Jephthah?',
  '["Three hundred years", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Three hundred years',
  'Jephthah argued that Israel had possessed the land for three hundred years (Judges 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'How long had Israel possessed the disputed land according to Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  1,
  'What happened when the Spirit of the LORD came upon Jephthah?',
  '["He passed through Gilead and Manasseh toward battle", "Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "It had rest for forty years"]'::jsonb,
  'He passed through Gilead and Manasseh toward battle',
  'Jephthah moved toward battle when the Spirit of the LORD came upon him (Judges 11:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'What happened when the Spirit of the LORD came upon Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  1,
  'What yearly custom arose in Israel because of Jephthah''s daughter?',
  '["The daughters of Israel commemorated her four days each year", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The daughters of Israel commemorated her four days each year',
  'The daughters of Israel went yearly to commemorate Jephthah''s daughter (Judges 11:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'What yearly custom arose in Israel because of Jephthah''s daughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  2,
  'In Judges 11, which judge was the son of a prostitute and became a mighty warrior?',
  '["Jephthah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jephthah',
  'Jephthah the Gileadite was a mighty warrior and the son of a prostitute (Judges 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'In Judges 11, which judge was the son of a prostitute and became a mighty warrior?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  2,
  'In Judges 11, from what land did Jephthah lead men before being called back?',
  '["The land of Tob", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The land of Tob',
  'Jephthah dwelt in the land of Tob before the elders called him back (Judges 11:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'In Judges 11, from what land did Jephthah lead men before being called back?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  2,
  'In Judges 11, what vow did Jephthah make before fighting the Ammonites?',
  '["To offer whatever came out of his house if the LORD gave victory", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To offer whatever came out of his house if the LORD gave victory',
  'Jephthah vowed to offer what came out of his house if he returned in peace (Judges 11:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'In Judges 11, what vow did Jephthah make before fighting the Ammonites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  2,
  'In Judges 11, who came out first to meet Jephthah after the victory?',
  '["His daughter", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His daughter',
  'Jephthah''s daughter came out first with tambourines and dancing (Judges 11:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'In Judges 11, who came out first to meet Jephthah after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  2,
  'In Judges 11, how long had Israel possessed the disputed land according to Jephthah?',
  '["Three hundred years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred years',
  'Jephthah argued that Israel had possessed the land for three hundred years (Judges 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'In Judges 11, how long had Israel possessed the disputed land according to Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  2,
  'In Judges 11, what happened when the Spirit of the LORD came upon Jephthah?',
  '["He passed through Gilead and Manasseh toward battle", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He passed through Gilead and Manasseh toward battle',
  'Jephthah moved toward battle when the Spirit of the LORD came upon him (Judges 11:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'In Judges 11, what happened when the Spirit of the LORD came upon Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  2,
  'In Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?',
  '["The daughters of Israel commemorated her four days each year", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The daughters of Israel commemorated her four days each year',
  'The daughters of Israel went yearly to commemorate Jephthah''s daughter (Judges 11:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'In Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  3,
  'According to Judges 11, which judge was the son of a prostitute and became a mighty warrior?',
  '["Jephthah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jephthah',
  'Jephthah the Gileadite was a mighty warrior and the son of a prostitute (Judges 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 11, which judge was the son of a prostitute and became a mighty warrior?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  3,
  'According to Judges 11, from what land did Jephthah lead men before being called back?',
  '["The land of Tob", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The land of Tob',
  'Jephthah dwelt in the land of Tob before the elders called him back (Judges 11:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 11, from what land did Jephthah lead men before being called back?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  3,
  'According to Judges 11, what vow did Jephthah make before fighting the Ammonites?',
  '["To offer whatever came out of his house if the LORD gave victory", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To offer whatever came out of his house if the LORD gave victory',
  'Jephthah vowed to offer what came out of his house if he returned in peace (Judges 11:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 11, what vow did Jephthah make before fighting the Ammonites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  3,
  'According to Judges 11, who came out first to meet Jephthah after the victory?',
  '["His daughter", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His daughter',
  'Jephthah''s daughter came out first with tambourines and dancing (Judges 11:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 11, who came out first to meet Jephthah after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  3,
  'According to Judges 11, how long had Israel possessed the disputed land according to Jephthah?',
  '["Three hundred years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred years',
  'Jephthah argued that Israel had possessed the land for three hundred years (Judges 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 11, how long had Israel possessed the disputed land according to Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  3,
  'According to Judges 11, what happened when the Spirit of the LORD came upon Jephthah?',
  '["He passed through Gilead and Manasseh toward battle", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He passed through Gilead and Manasseh toward battle',
  'Jephthah moved toward battle when the Spirit of the LORD came upon him (Judges 11:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 11, what happened when the Spirit of the LORD came upon Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  3,
  'According to Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?',
  '["The daughters of Israel commemorated her four days each year", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The daughters of Israel commemorated her four days each year',
  'The daughters of Israel went yearly to commemorate Jephthah''s daughter (Judges 11:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  4,
  'From Judges 11, which judge was the son of a prostitute and became a mighty warrior?',
  '["Jephthah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jephthah',
  'Jephthah the Gileadite was a mighty warrior and the son of a prostitute (Judges 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'From Judges 11, which judge was the son of a prostitute and became a mighty warrior?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  4,
  'From Judges 11, from what land did Jephthah lead men before being called back?',
  '["The land of Tob", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The land of Tob',
  'Jephthah dwelt in the land of Tob before the elders called him back (Judges 11:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'From Judges 11, from what land did Jephthah lead men before being called back?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  4,
  'From Judges 11, what vow did Jephthah make before fighting the Ammonites?',
  '["To offer whatever came out of his house if the LORD gave victory", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To offer whatever came out of his house if the LORD gave victory',
  'Jephthah vowed to offer what came out of his house if he returned in peace (Judges 11:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'From Judges 11, what vow did Jephthah make before fighting the Ammonites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  4,
  'From Judges 11, who came out first to meet Jephthah after the victory?',
  '["His daughter", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His daughter',
  'Jephthah''s daughter came out first with tambourines and dancing (Judges 11:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'From Judges 11, who came out first to meet Jephthah after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  4,
  'From Judges 11, how long had Israel possessed the disputed land according to Jephthah?',
  '["Three hundred years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred years',
  'Jephthah argued that Israel had possessed the land for three hundred years (Judges 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'From Judges 11, how long had Israel possessed the disputed land according to Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  4,
  'From Judges 11, what happened when the Spirit of the LORD came upon Jephthah?',
  '["He passed through Gilead and Manasseh toward battle", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He passed through Gilead and Manasseh toward battle',
  'Jephthah moved toward battle when the Spirit of the LORD came upon him (Judges 11:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'From Judges 11, what happened when the Spirit of the LORD came upon Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  4,
  'From Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?',
  '["The daughters of Israel commemorated her four days each year", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The daughters of Israel commemorated her four days each year',
  'The daughters of Israel went yearly to commemorate Jephthah''s daughter (Judges 11:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'From Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  5,
  'In the events of Judges 11, which judge was the son of a prostitute and became a mighty warrior?',
  '["Jephthah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jephthah',
  'Jephthah the Gileadite was a mighty warrior and the son of a prostitute (Judges 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 11, which judge was the son of a prostitute and became a mighty warrior?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  5,
  'In the events of Judges 11, from what land did Jephthah lead men before being called back?',
  '["The land of Tob", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The land of Tob',
  'Jephthah dwelt in the land of Tob before the elders called him back (Judges 11:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 11, from what land did Jephthah lead men before being called back?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  5,
  'In the events of Judges 11, what vow did Jephthah make before fighting the Ammonites?',
  '["To offer whatever came out of his house if the LORD gave victory", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To offer whatever came out of his house if the LORD gave victory',
  'Jephthah vowed to offer what came out of his house if he returned in peace (Judges 11:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 11, what vow did Jephthah make before fighting the Ammonites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  5,
  'In the events of Judges 11, who came out first to meet Jephthah after the victory?',
  '["His daughter", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His daughter',
  'Jephthah''s daughter came out first with tambourines and dancing (Judges 11:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 11, who came out first to meet Jephthah after the victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  5,
  'In the events of Judges 11, how long had Israel possessed the disputed land according to Jephthah?',
  '["Three hundred years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred years',
  'Jephthah argued that Israel had possessed the land for three hundred years (Judges 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 11, how long had Israel possessed the disputed land according to Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  5,
  'In the events of Judges 11, what happened when the Spirit of the LORD came upon Jephthah?',
  '["He passed through Gilead and Manasseh toward battle", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He passed through Gilead and Manasseh toward battle',
  'Jephthah moved toward battle when the Spirit of the LORD came upon him (Judges 11:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 11, what happened when the Spirit of the LORD came upon Jephthah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  11,
  5,
  'In the events of Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?',
  '["The daughters of Israel commemorated her four days each year", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The daughters of Israel commemorated her four days each year',
  'The daughters of Israel went yearly to commemorate Jephthah''s daughter (Judges 11:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 11, what yearly custom arose in Israel because of Jephthah''s daughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  1,
  'Which tribe quarreled with Jephthah after the victory over Ammon?',
  '["Ephraim", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Ephraim',
  'The men of Ephraim quarreled with Jephthah after the victory (Judges 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Which tribe quarreled with Jephthah after the victory over Ammon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  1,
  'What word was used to test fleeing Ephraimites at the Jordan?',
  '["\"Shibboleth\"", "Mighty man of valor", "Jerubbaal", "\"The sword of the LORD and of Gideon\""]'::jsonb,
  '"Shibboleth"',
  'The Gileadites tested the Ephraimites by asking them to say Shibboleth (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'What word was used to test fleeing Ephraimites at the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  1,
  'How many Ephraimites fell at the fords of the Jordan?',
  '["Forty-two thousand", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Forty-two thousand',
  'Forty-two thousand Ephraimites fell at the Jordan crossings (Judges 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'How many Ephraimites fell at the fords of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  1,
  'Which judge had thirty sons and thirty daughters?',
  '["Ibzan", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Ibzan',
  'Ibzan had thirty sons and thirty daughters (Judges 12:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Which judge had thirty sons and thirty daughters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  1,
  'Which judge had forty sons and thirty grandsons who rode seventy donkeys?',
  '["Abdon", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Abdon',
  'Abdon had forty sons and thirty grandsons who rode seventy donkeys (Judges 12:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Which judge had forty sons and thirty grandsons who rode seventy donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  1,
  'How many years did Jephthah judge Israel?',
  '["Six years", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Six years',
  'Jephthah judged Israel for six years (Judges 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'How many years did Jephthah judge Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  1,
  'Why were the Ephraimites exposed at the Jordan crossings?',
  '["They could not pronounce the test word correctly", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'They could not pronounce the test word correctly',
  'They said Sibboleth instead of Shibboleth and were identified (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Why were the Ephraimites exposed at the Jordan crossings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  2,
  'In Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?',
  '["Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ephraim',
  'The men of Ephraim quarreled with Jephthah after the victory (Judges 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'In Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  2,
  'In Judges 12, what word was used to test fleeing Ephraimites at the Jordan?',
  '["\"Shibboleth\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Shibboleth"',
  'The Gileadites tested the Ephraimites by asking them to say Shibboleth (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'In Judges 12, what word was used to test fleeing Ephraimites at the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  2,
  'In Judges 12, how many Ephraimites fell at the fords of the Jordan?',
  '["Forty-two thousand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty-two thousand',
  'Forty-two thousand Ephraimites fell at the Jordan crossings (Judges 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'In Judges 12, how many Ephraimites fell at the fords of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  2,
  'In Judges 12, which judge had thirty sons and thirty daughters?',
  '["Ibzan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ibzan',
  'Ibzan had thirty sons and thirty daughters (Judges 12:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'In Judges 12, which judge had thirty sons and thirty daughters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  2,
  'In Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?',
  '["Abdon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abdon',
  'Abdon had forty sons and thirty grandsons who rode seventy donkeys (Judges 12:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'In Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  2,
  'In Judges 12, how many years did Jephthah judge Israel?',
  '["Six years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six years',
  'Jephthah judged Israel for six years (Judges 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'In Judges 12, how many years did Jephthah judge Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  2,
  'In Judges 12, why were the Ephraimites exposed at the Jordan crossings?',
  '["They could not pronounce the test word correctly", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They could not pronounce the test word correctly',
  'They said Sibboleth instead of Shibboleth and were identified (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'In Judges 12, why were the Ephraimites exposed at the Jordan crossings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  3,
  'According to Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?',
  '["Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ephraim',
  'The men of Ephraim quarreled with Jephthah after the victory (Judges 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  3,
  'According to Judges 12, what word was used to test fleeing Ephraimites at the Jordan?',
  '["\"Shibboleth\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Shibboleth"',
  'The Gileadites tested the Ephraimites by asking them to say Shibboleth (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 12, what word was used to test fleeing Ephraimites at the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  3,
  'According to Judges 12, how many Ephraimites fell at the fords of the Jordan?',
  '["Forty-two thousand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty-two thousand',
  'Forty-two thousand Ephraimites fell at the Jordan crossings (Judges 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 12, how many Ephraimites fell at the fords of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  3,
  'According to Judges 12, which judge had thirty sons and thirty daughters?',
  '["Ibzan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ibzan',
  'Ibzan had thirty sons and thirty daughters (Judges 12:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 12, which judge had thirty sons and thirty daughters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  3,
  'According to Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?',
  '["Abdon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abdon',
  'Abdon had forty sons and thirty grandsons who rode seventy donkeys (Judges 12:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  3,
  'According to Judges 12, how many years did Jephthah judge Israel?',
  '["Six years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six years',
  'Jephthah judged Israel for six years (Judges 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 12, how many years did Jephthah judge Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  3,
  'According to Judges 12, why were the Ephraimites exposed at the Jordan crossings?',
  '["They could not pronounce the test word correctly", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They could not pronounce the test word correctly',
  'They said Sibboleth instead of Shibboleth and were identified (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 12, why were the Ephraimites exposed at the Jordan crossings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  4,
  'From Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?',
  '["Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ephraim',
  'The men of Ephraim quarreled with Jephthah after the victory (Judges 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'From Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  4,
  'From Judges 12, what word was used to test fleeing Ephraimites at the Jordan?',
  '["\"Shibboleth\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Shibboleth"',
  'The Gileadites tested the Ephraimites by asking them to say Shibboleth (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'From Judges 12, what word was used to test fleeing Ephraimites at the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  4,
  'From Judges 12, how many Ephraimites fell at the fords of the Jordan?',
  '["Forty-two thousand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty-two thousand',
  'Forty-two thousand Ephraimites fell at the Jordan crossings (Judges 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'From Judges 12, how many Ephraimites fell at the fords of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  4,
  'From Judges 12, which judge had thirty sons and thirty daughters?',
  '["Ibzan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ibzan',
  'Ibzan had thirty sons and thirty daughters (Judges 12:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'From Judges 12, which judge had thirty sons and thirty daughters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  4,
  'From Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?',
  '["Abdon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abdon',
  'Abdon had forty sons and thirty grandsons who rode seventy donkeys (Judges 12:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'From Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  4,
  'From Judges 12, how many years did Jephthah judge Israel?',
  '["Six years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six years',
  'Jephthah judged Israel for six years (Judges 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'From Judges 12, how many years did Jephthah judge Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  4,
  'From Judges 12, why were the Ephraimites exposed at the Jordan crossings?',
  '["They could not pronounce the test word correctly", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They could not pronounce the test word correctly',
  'They said Sibboleth instead of Shibboleth and were identified (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'From Judges 12, why were the Ephraimites exposed at the Jordan crossings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  5,
  'In the events of Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?',
  '["Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ephraim',
  'The men of Ephraim quarreled with Jephthah after the victory (Judges 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 12, which tribe quarreled with Jephthah after the victory over Ammon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  5,
  'In the events of Judges 12, what word was used to test fleeing Ephraimites at the Jordan?',
  '["\"Shibboleth\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Shibboleth"',
  'The Gileadites tested the Ephraimites by asking them to say Shibboleth (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 12, what word was used to test fleeing Ephraimites at the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  5,
  'In the events of Judges 12, how many Ephraimites fell at the fords of the Jordan?',
  '["Forty-two thousand", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Forty-two thousand',
  'Forty-two thousand Ephraimites fell at the Jordan crossings (Judges 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 12, how many Ephraimites fell at the fords of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  5,
  'In the events of Judges 12, which judge had thirty sons and thirty daughters?',
  '["Ibzan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ibzan',
  'Ibzan had thirty sons and thirty daughters (Judges 12:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 12, which judge had thirty sons and thirty daughters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  5,
  'In the events of Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?',
  '["Abdon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Abdon',
  'Abdon had forty sons and thirty grandsons who rode seventy donkeys (Judges 12:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 12, which judge had forty sons and thirty grandsons who rode seventy donkeys?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  5,
  'In the events of Judges 12, how many years did Jephthah judge Israel?',
  '["Six years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six years',
  'Jephthah judged Israel for six years (Judges 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 12, how many years did Jephthah judge Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  12,
  5,
  'In the events of Judges 12, why were the Ephraimites exposed at the Jordan crossings?',
  '["They could not pronounce the test word correctly", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They could not pronounce the test word correctly',
  'They said Sibboleth instead of Shibboleth and were identified (Judges 12:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 12, why were the Ephraimites exposed at the Jordan crossings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  1,
  'To whom did the angel announce the birth of Samson?',
  '["Manoah''s wife", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Manoah''s wife',
  'The angel of the LORD appeared first to Manoah''s wife (Judges 13:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'To whom did the angel announce the birth of Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  1,
  'What was Samson to be from the womb?',
  '["A Nazirite to God", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A Nazirite to God',
  'Samson was to be a Nazirite to God from the womb (Judges 13:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What was Samson to be from the womb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  1,
  'What was Samson''s mother told not to drink?',
  '["Wine or strong drink", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Wine or strong drink',
  'She was told not to drink wine or strong drink (Judges 13:4, 7, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What was Samson''s mother told not to drink?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  1,
  'What happened to the angel of the LORD when Manoah offered the sacrifice?',
  '["He ascended in the flame of the altar", "Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "It had rest for forty years"]'::jsonb,
  'He ascended in the flame of the altar',
  'The angel ascended in the flame of the altar (Judges 13:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What happened to the angel of the LORD when Manoah offered the sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  1,
  'What name was given to the child born at the end of Judges 13?',
  '["Samson", "Mighty man of valor", "Jerubbaal", "\"The sword of the LORD and of Gideon\""]'::jsonb,
  'Samson',
  'The woman bore a son and named him Samson (Judges 13:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What name was given to the child born at the end of Judges 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  1,
  'What did Manoah fear after seeing the angel ascend?',
  '["\"We shall surely die, because we have seen God\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"We shall surely die, because we have seen God"',
  'Manoah feared they would die because they had seen God (Judges 13:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What did Manoah fear after seeing the angel ascend?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  1,
  'What began to stir Samson when he grew?',
  '["The Spirit of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Spirit of the LORD',
  'The Spirit of the LORD began to stir Samson (Judges 13:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What began to stir Samson when he grew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  2,
  'In Judges 13, to whom did the angel announce the birth of Samson?',
  '["Manoah''s wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Manoah''s wife',
  'The angel of the LORD appeared first to Manoah''s wife (Judges 13:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'In Judges 13, to whom did the angel announce the birth of Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  2,
  'In Judges 13, what was Samson to be from the womb?',
  '["A Nazirite to God", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A Nazirite to God',
  'Samson was to be a Nazirite to God from the womb (Judges 13:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'In Judges 13, what was Samson to be from the womb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  2,
  'In Judges 13, what was Samson''s mother told not to drink?',
  '["Wine or strong drink", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Wine or strong drink',
  'She was told not to drink wine or strong drink (Judges 13:4, 7, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'In Judges 13, what was Samson''s mother told not to drink?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  2,
  'In Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?',
  '["He ascended in the flame of the altar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He ascended in the flame of the altar',
  'The angel ascended in the flame of the altar (Judges 13:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'In Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  2,
  'In Judges 13, what name was given to the child born at the end of Judges 13?',
  '["Samson", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Samson',
  'The woman bore a son and named him Samson (Judges 13:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'In Judges 13, what name was given to the child born at the end of Judges 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  2,
  'In Judges 13, what did Manoah fear after seeing the angel ascend?',
  '["\"We shall surely die, because we have seen God\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"We shall surely die, because we have seen God"',
  'Manoah feared they would die because they had seen God (Judges 13:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'In Judges 13, what did Manoah fear after seeing the angel ascend?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  2,
  'In Judges 13, what began to stir Samson when he grew?',
  '["The Spirit of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Spirit of the LORD',
  'The Spirit of the LORD began to stir Samson (Judges 13:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'In Judges 13, what began to stir Samson when he grew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  3,
  'According to Judges 13, to whom did the angel announce the birth of Samson?',
  '["Manoah''s wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Manoah''s wife',
  'The angel of the LORD appeared first to Manoah''s wife (Judges 13:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 13, to whom did the angel announce the birth of Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  3,
  'According to Judges 13, what was Samson to be from the womb?',
  '["A Nazirite to God", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A Nazirite to God',
  'Samson was to be a Nazirite to God from the womb (Judges 13:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 13, what was Samson to be from the womb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  3,
  'According to Judges 13, what was Samson''s mother told not to drink?',
  '["Wine or strong drink", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Wine or strong drink',
  'She was told not to drink wine or strong drink (Judges 13:4, 7, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 13, what was Samson''s mother told not to drink?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  3,
  'According to Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?',
  '["He ascended in the flame of the altar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He ascended in the flame of the altar',
  'The angel ascended in the flame of the altar (Judges 13:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  3,
  'According to Judges 13, what name was given to the child born at the end of Judges 13?',
  '["Samson", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Samson',
  'The woman bore a son and named him Samson (Judges 13:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 13, what name was given to the child born at the end of Judges 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  3,
  'According to Judges 13, what did Manoah fear after seeing the angel ascend?',
  '["\"We shall surely die, because we have seen God\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"We shall surely die, because we have seen God"',
  'Manoah feared they would die because they had seen God (Judges 13:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 13, what did Manoah fear after seeing the angel ascend?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  3,
  'According to Judges 13, what began to stir Samson when he grew?',
  '["The Spirit of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Spirit of the LORD',
  'The Spirit of the LORD began to stir Samson (Judges 13:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 13, what began to stir Samson when he grew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  4,
  'From Judges 13, to whom did the angel announce the birth of Samson?',
  '["Manoah''s wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Manoah''s wife',
  'The angel of the LORD appeared first to Manoah''s wife (Judges 13:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'From Judges 13, to whom did the angel announce the birth of Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  4,
  'From Judges 13, what was Samson to be from the womb?',
  '["A Nazirite to God", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A Nazirite to God',
  'Samson was to be a Nazirite to God from the womb (Judges 13:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'From Judges 13, what was Samson to be from the womb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  4,
  'From Judges 13, what was Samson''s mother told not to drink?',
  '["Wine or strong drink", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Wine or strong drink',
  'She was told not to drink wine or strong drink (Judges 13:4, 7, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'From Judges 13, what was Samson''s mother told not to drink?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  4,
  'From Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?',
  '["He ascended in the flame of the altar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He ascended in the flame of the altar',
  'The angel ascended in the flame of the altar (Judges 13:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'From Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  4,
  'From Judges 13, what name was given to the child born at the end of Judges 13?',
  '["Samson", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Samson',
  'The woman bore a son and named him Samson (Judges 13:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'From Judges 13, what name was given to the child born at the end of Judges 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  4,
  'From Judges 13, what did Manoah fear after seeing the angel ascend?',
  '["\"We shall surely die, because we have seen God\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"We shall surely die, because we have seen God"',
  'Manoah feared they would die because they had seen God (Judges 13:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'From Judges 13, what did Manoah fear after seeing the angel ascend?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  4,
  'From Judges 13, what began to stir Samson when he grew?',
  '["The Spirit of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Spirit of the LORD',
  'The Spirit of the LORD began to stir Samson (Judges 13:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'From Judges 13, what began to stir Samson when he grew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  5,
  'In the events of Judges 13, to whom did the angel announce the birth of Samson?',
  '["Manoah''s wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Manoah''s wife',
  'The angel of the LORD appeared first to Manoah''s wife (Judges 13:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 13, to whom did the angel announce the birth of Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  5,
  'In the events of Judges 13, what was Samson to be from the womb?',
  '["A Nazirite to God", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A Nazirite to God',
  'Samson was to be a Nazirite to God from the womb (Judges 13:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 13, what was Samson to be from the womb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  5,
  'In the events of Judges 13, what was Samson''s mother told not to drink?',
  '["Wine or strong drink", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Wine or strong drink',
  'She was told not to drink wine or strong drink (Judges 13:4, 7, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 13, what was Samson''s mother told not to drink?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  5,
  'In the events of Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?',
  '["He ascended in the flame of the altar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He ascended in the flame of the altar',
  'The angel ascended in the flame of the altar (Judges 13:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 13, what happened to the angel of the LORD when Manoah offered the sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  5,
  'In the events of Judges 13, what name was given to the child born at the end of Judges 13?',
  '["Samson", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Samson',
  'The woman bore a son and named him Samson (Judges 13:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 13, what name was given to the child born at the end of Judges 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  5,
  'In the events of Judges 13, what did Manoah fear after seeing the angel ascend?',
  '["\"We shall surely die, because we have seen God\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"We shall surely die, because we have seen God"',
  'Manoah feared they would die because they had seen God (Judges 13:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 13, what did Manoah fear after seeing the angel ascend?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  13,
  5,
  'In the events of Judges 13, what began to stir Samson when he grew?',
  '["The Spirit of the LORD", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The Spirit of the LORD',
  'The Spirit of the LORD began to stir Samson (Judges 13:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 13, what began to stir Samson when he grew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  1,
  'From what city did Samson want a wife in Judges 14?',
  '["Timnah", "The land of Tob", "Lehi", "Bethlehem in Judah"]'::jsonb,
  'Timnah',
  'Samson wanted a Philistine woman from Timnah (Judges 14:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'From what city did Samson want a wife in Judges 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  1,
  'What animal did Samson tear apart on the way to Timnah?',
  '["A young lion", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A young lion',
  'The Spirit of the LORD came upon Samson and he tore apart a young lion (Judges 14:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What animal did Samson tear apart on the way to Timnah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  1,
  'What did Samson later find in the lion''s carcass?',
  '["Honey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Honey',
  'Samson found a swarm of bees and honey in the carcass (Judges 14:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What did Samson later find in the lion''s carcass?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  1,
  'What riddle did Samson pose at the feast?',
  '["\"Out of the eater came something to eat, and out of the strong came something sweet\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Out of the eater came something to eat, and out of the strong came something sweet"',
  'Samson posed that riddle to the Philistines at the feast (Judges 14:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What riddle did Samson pose at the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  1,
  'Who pressed Samson until he explained the riddle?',
  '["His wife", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'His wife',
  'Samson''s wife wept before him until he explained the riddle (Judges 14:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'Who pressed Samson until he explained the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  1,
  'What answer did the Philistines give to Samson''s riddle?',
  '["\"What is sweeter than honey? What is stronger than a lion?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"What is sweeter than honey? What is stronger than a lion?"',
  'The men of the city answered Samson''s riddle with honey and lion (Judges 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What answer did the Philistines give to Samson''s riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  1,
  'How did Samson pay the thirty garments owed after losing the riddle?',
  '["He struck down thirty men of Ashkelon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He struck down thirty men of Ashkelon',
  'Samson killed thirty men of Ashkelon and took their garments (Judges 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'How did Samson pay the thirty garments owed after losing the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  2,
  'In Judges 14, from what city did Samson want a wife in Judges 14?',
  '["Timnah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Timnah',
  'Samson wanted a Philistine woman from Timnah (Judges 14:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'In Judges 14, from what city did Samson want a wife in Judges 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  2,
  'In Judges 14, what animal did Samson tear apart on the way to Timnah?',
  '["A young lion", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A young lion',
  'The Spirit of the LORD came upon Samson and he tore apart a young lion (Judges 14:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'In Judges 14, what animal did Samson tear apart on the way to Timnah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  2,
  'In Judges 14, what did Samson later find in the lion''s carcass?',
  '["Honey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Honey',
  'Samson found a swarm of bees and honey in the carcass (Judges 14:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'In Judges 14, what did Samson later find in the lion''s carcass?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  2,
  'In Judges 14, what riddle did Samson pose at the feast?',
  '["\"Out of the eater came something to eat, and out of the strong came something sweet\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Out of the eater came something to eat, and out of the strong came something sweet"',
  'Samson posed that riddle to the Philistines at the feast (Judges 14:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'In Judges 14, what riddle did Samson pose at the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  2,
  'In Judges 14, who pressed Samson until he explained the riddle?',
  '["His wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His wife',
  'Samson''s wife wept before him until he explained the riddle (Judges 14:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'In Judges 14, who pressed Samson until he explained the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  2,
  'In Judges 14, what answer did the Philistines give to Samson''s riddle?',
  '["\"What is sweeter than honey? What is stronger than a lion?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"What is sweeter than honey? What is stronger than a lion?"',
  'The men of the city answered Samson''s riddle with honey and lion (Judges 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'In Judges 14, what answer did the Philistines give to Samson''s riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  2,
  'In Judges 14, how did Samson pay the thirty garments owed after losing the riddle?',
  '["He struck down thirty men of Ashkelon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He struck down thirty men of Ashkelon',
  'Samson killed thirty men of Ashkelon and took their garments (Judges 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'In Judges 14, how did Samson pay the thirty garments owed after losing the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  3,
  'According to Judges 14, from what city did Samson want a wife in Judges 14?',
  '["Timnah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Timnah',
  'Samson wanted a Philistine woman from Timnah (Judges 14:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 14, from what city did Samson want a wife in Judges 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  3,
  'According to Judges 14, what animal did Samson tear apart on the way to Timnah?',
  '["A young lion", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A young lion',
  'The Spirit of the LORD came upon Samson and he tore apart a young lion (Judges 14:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 14, what animal did Samson tear apart on the way to Timnah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  3,
  'According to Judges 14, what did Samson later find in the lion''s carcass?',
  '["Honey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Honey',
  'Samson found a swarm of bees and honey in the carcass (Judges 14:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 14, what did Samson later find in the lion''s carcass?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  3,
  'According to Judges 14, what riddle did Samson pose at the feast?',
  '["\"Out of the eater came something to eat, and out of the strong came something sweet\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Out of the eater came something to eat, and out of the strong came something sweet"',
  'Samson posed that riddle to the Philistines at the feast (Judges 14:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 14, what riddle did Samson pose at the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  3,
  'According to Judges 14, who pressed Samson until he explained the riddle?',
  '["His wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His wife',
  'Samson''s wife wept before him until he explained the riddle (Judges 14:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 14, who pressed Samson until he explained the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  3,
  'According to Judges 14, what answer did the Philistines give to Samson''s riddle?',
  '["\"What is sweeter than honey? What is stronger than a lion?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"What is sweeter than honey? What is stronger than a lion?"',
  'The men of the city answered Samson''s riddle with honey and lion (Judges 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 14, what answer did the Philistines give to Samson''s riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  3,
  'According to Judges 14, how did Samson pay the thirty garments owed after losing the riddle?',
  '["He struck down thirty men of Ashkelon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He struck down thirty men of Ashkelon',
  'Samson killed thirty men of Ashkelon and took their garments (Judges 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 14, how did Samson pay the thirty garments owed after losing the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  4,
  'From Judges 14, from what city did Samson want a wife in Judges 14?',
  '["Timnah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Timnah',
  'Samson wanted a Philistine woman from Timnah (Judges 14:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'From Judges 14, from what city did Samson want a wife in Judges 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  4,
  'From Judges 14, what animal did Samson tear apart on the way to Timnah?',
  '["A young lion", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A young lion',
  'The Spirit of the LORD came upon Samson and he tore apart a young lion (Judges 14:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'From Judges 14, what animal did Samson tear apart on the way to Timnah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  4,
  'From Judges 14, what did Samson later find in the lion''s carcass?',
  '["Honey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Honey',
  'Samson found a swarm of bees and honey in the carcass (Judges 14:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'From Judges 14, what did Samson later find in the lion''s carcass?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  4,
  'From Judges 14, what riddle did Samson pose at the feast?',
  '["\"Out of the eater came something to eat, and out of the strong came something sweet\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Out of the eater came something to eat, and out of the strong came something sweet"',
  'Samson posed that riddle to the Philistines at the feast (Judges 14:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'From Judges 14, what riddle did Samson pose at the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  4,
  'From Judges 14, who pressed Samson until he explained the riddle?',
  '["His wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His wife',
  'Samson''s wife wept before him until he explained the riddle (Judges 14:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'From Judges 14, who pressed Samson until he explained the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  4,
  'From Judges 14, what answer did the Philistines give to Samson''s riddle?',
  '["\"What is sweeter than honey? What is stronger than a lion?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"What is sweeter than honey? What is stronger than a lion?"',
  'The men of the city answered Samson''s riddle with honey and lion (Judges 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'From Judges 14, what answer did the Philistines give to Samson''s riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  4,
  'From Judges 14, how did Samson pay the thirty garments owed after losing the riddle?',
  '["He struck down thirty men of Ashkelon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He struck down thirty men of Ashkelon',
  'Samson killed thirty men of Ashkelon and took their garments (Judges 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'From Judges 14, how did Samson pay the thirty garments owed after losing the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  5,
  'In the events of Judges 14, from what city did Samson want a wife in Judges 14?',
  '["Timnah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Timnah',
  'Samson wanted a Philistine woman from Timnah (Judges 14:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 14, from what city did Samson want a wife in Judges 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  5,
  'In the events of Judges 14, what animal did Samson tear apart on the way to Timnah?',
  '["A young lion", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A young lion',
  'The Spirit of the LORD came upon Samson and he tore apart a young lion (Judges 14:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 14, what animal did Samson tear apart on the way to Timnah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  5,
  'In the events of Judges 14, what did Samson later find in the lion''s carcass?',
  '["Honey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Honey',
  'Samson found a swarm of bees and honey in the carcass (Judges 14:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 14, what did Samson later find in the lion''s carcass?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  5,
  'In the events of Judges 14, what riddle did Samson pose at the feast?',
  '["\"Out of the eater came something to eat, and out of the strong came something sweet\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Out of the eater came something to eat, and out of the strong came something sweet"',
  'Samson posed that riddle to the Philistines at the feast (Judges 14:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 14, what riddle did Samson pose at the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  5,
  'In the events of Judges 14, who pressed Samson until he explained the riddle?',
  '["His wife", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'His wife',
  'Samson''s wife wept before him until he explained the riddle (Judges 14:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 14, who pressed Samson until he explained the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  5,
  'In the events of Judges 14, what answer did the Philistines give to Samson''s riddle?',
  '["\"What is sweeter than honey? What is stronger than a lion?\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"What is sweeter than honey? What is stronger than a lion?"',
  'The men of the city answered Samson''s riddle with honey and lion (Judges 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 14, what answer did the Philistines give to Samson''s riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  14,
  5,
  'In the events of Judges 14, how did Samson pay the thirty garments owed after losing the riddle?',
  '["He struck down thirty men of Ashkelon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He struck down thirty men of Ashkelon',
  'Samson killed thirty men of Ashkelon and took their garments (Judges 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 14, how did Samson pay the thirty garments owed after losing the riddle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  1,
  'What did Samson use to burn the Philistines'' grain fields?',
  '["Three hundred foxes with torches", "A two-edged dagger", "Milk", "That dew would fall on the fleece alone"]'::jsonb,
  'Three hundred foxes with torches',
  'Samson tied torches to foxes and burned the Philistines'' fields (Judges 15:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What did Samson use to burn the Philistines'' grain fields?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  1,
  'Why was Samson''s wife given to another man?',
  '["Because her father thought Samson hated her", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'Because her father thought Samson hated her',
  'Her father gave her to another because he thought Samson hated her (Judges 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'Why was Samson''s wife given to another man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  1,
  'What did the Philistines do to Samson''s wife and her father?',
  '["Burned them with fire", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Burned them with fire',
  'The Philistines burned Samson''s wife and her father (Judges 15:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What did the Philistines do to Samson''s wife and her father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  1,
  'What weapon did Samson use to kill a thousand Philistines?',
  '["A fresh jawbone of a donkey", "A two-edged dagger", "Milk", "That dew would fall on the fleece alone"]'::jsonb,
  'A fresh jawbone of a donkey',
  'Samson killed a thousand men with a donkey''s jawbone (Judges 15:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What weapon did Samson use to kill a thousand Philistines?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  1,
  'At what place did Samson become very thirsty after the battle?',
  '["Lehi", "The land of Tob", "Timnah", "Bethlehem in Judah"]'::jsonb,
  'Lehi',
  'Samson became very thirsty after the battle at Lehi (Judges 15:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'At what place did Samson become very thirsty after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  1,
  'What did God provide for Samson when he was thirsty?',
  '["Water from a hollow place", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Water from a hollow place',
  'God split the hollow place and water came out (Judges 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What did God provide for Samson when he was thirsty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  1,
  'How many years did Samson judge Israel according to Judges 15?',
  '["Twenty years", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Twenty years',
  'Samson judged Israel twenty years in the days of the Philistines (Judges 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'How many years did Samson judge Israel according to Judges 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  2,
  'In Judges 15, what did Samson use to burn the Philistines'' grain fields?',
  '["Three hundred foxes with torches", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred foxes with torches',
  'Samson tied torches to foxes and burned the Philistines'' fields (Judges 15:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'In Judges 15, what did Samson use to burn the Philistines'' grain fields?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  2,
  'In Judges 15, why was Samson''s wife given to another man?',
  '["Because her father thought Samson hated her", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because her father thought Samson hated her',
  'Her father gave her to another because he thought Samson hated her (Judges 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'In Judges 15, why was Samson''s wife given to another man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  2,
  'In Judges 15, what did the Philistines do to Samson''s wife and her father?',
  '["Burned them with fire", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Burned them with fire',
  'The Philistines burned Samson''s wife and her father (Judges 15:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'In Judges 15, what did the Philistines do to Samson''s wife and her father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  2,
  'In Judges 15, what weapon did Samson use to kill a thousand Philistines?',
  '["A fresh jawbone of a donkey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A fresh jawbone of a donkey',
  'Samson killed a thousand men with a donkey''s jawbone (Judges 15:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'In Judges 15, what weapon did Samson use to kill a thousand Philistines?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  2,
  'In Judges 15, at what place did Samson become very thirsty after the battle?',
  '["Lehi", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Lehi',
  'Samson became very thirsty after the battle at Lehi (Judges 15:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'In Judges 15, at what place did Samson become very thirsty after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  2,
  'In Judges 15, what did God provide for Samson when he was thirsty?',
  '["Water from a hollow place", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Water from a hollow place',
  'God split the hollow place and water came out (Judges 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'In Judges 15, what did God provide for Samson when he was thirsty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  2,
  'In Judges 15, how many years did Samson judge Israel according to Judges 15?',
  '["Twenty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Twenty years',
  'Samson judged Israel twenty years in the days of the Philistines (Judges 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'In Judges 15, how many years did Samson judge Israel according to Judges 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  3,
  'According to Judges 15, what did Samson use to burn the Philistines'' grain fields?',
  '["Three hundred foxes with torches", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred foxes with torches',
  'Samson tied torches to foxes and burned the Philistines'' fields (Judges 15:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 15, what did Samson use to burn the Philistines'' grain fields?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  3,
  'According to Judges 15, why was Samson''s wife given to another man?',
  '["Because her father thought Samson hated her", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because her father thought Samson hated her',
  'Her father gave her to another because he thought Samson hated her (Judges 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 15, why was Samson''s wife given to another man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  3,
  'According to Judges 15, what did the Philistines do to Samson''s wife and her father?',
  '["Burned them with fire", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Burned them with fire',
  'The Philistines burned Samson''s wife and her father (Judges 15:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 15, what did the Philistines do to Samson''s wife and her father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  3,
  'According to Judges 15, what weapon did Samson use to kill a thousand Philistines?',
  '["A fresh jawbone of a donkey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A fresh jawbone of a donkey',
  'Samson killed a thousand men with a donkey''s jawbone (Judges 15:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 15, what weapon did Samson use to kill a thousand Philistines?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  3,
  'According to Judges 15, at what place did Samson become very thirsty after the battle?',
  '["Lehi", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Lehi',
  'Samson became very thirsty after the battle at Lehi (Judges 15:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 15, at what place did Samson become very thirsty after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  3,
  'According to Judges 15, what did God provide for Samson when he was thirsty?',
  '["Water from a hollow place", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Water from a hollow place',
  'God split the hollow place and water came out (Judges 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 15, what did God provide for Samson when he was thirsty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  3,
  'According to Judges 15, how many years did Samson judge Israel according to Judges 15?',
  '["Twenty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Twenty years',
  'Samson judged Israel twenty years in the days of the Philistines (Judges 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 15, how many years did Samson judge Israel according to Judges 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  4,
  'From Judges 15, what did Samson use to burn the Philistines'' grain fields?',
  '["Three hundred foxes with torches", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred foxes with torches',
  'Samson tied torches to foxes and burned the Philistines'' fields (Judges 15:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'From Judges 15, what did Samson use to burn the Philistines'' grain fields?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  4,
  'From Judges 15, why was Samson''s wife given to another man?',
  '["Because her father thought Samson hated her", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because her father thought Samson hated her',
  'Her father gave her to another because he thought Samson hated her (Judges 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'From Judges 15, why was Samson''s wife given to another man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  4,
  'From Judges 15, what did the Philistines do to Samson''s wife and her father?',
  '["Burned them with fire", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Burned them with fire',
  'The Philistines burned Samson''s wife and her father (Judges 15:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'From Judges 15, what did the Philistines do to Samson''s wife and her father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  4,
  'From Judges 15, what weapon did Samson use to kill a thousand Philistines?',
  '["A fresh jawbone of a donkey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A fresh jawbone of a donkey',
  'Samson killed a thousand men with a donkey''s jawbone (Judges 15:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'From Judges 15, what weapon did Samson use to kill a thousand Philistines?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  4,
  'From Judges 15, at what place did Samson become very thirsty after the battle?',
  '["Lehi", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Lehi',
  'Samson became very thirsty after the battle at Lehi (Judges 15:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'From Judges 15, at what place did Samson become very thirsty after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  4,
  'From Judges 15, what did God provide for Samson when he was thirsty?',
  '["Water from a hollow place", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Water from a hollow place',
  'God split the hollow place and water came out (Judges 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'From Judges 15, what did God provide for Samson when he was thirsty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  4,
  'From Judges 15, how many years did Samson judge Israel according to Judges 15?',
  '["Twenty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Twenty years',
  'Samson judged Israel twenty years in the days of the Philistines (Judges 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'From Judges 15, how many years did Samson judge Israel according to Judges 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  5,
  'In the events of Judges 15, what did Samson use to burn the Philistines'' grain fields?',
  '["Three hundred foxes with torches", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Three hundred foxes with torches',
  'Samson tied torches to foxes and burned the Philistines'' fields (Judges 15:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 15, what did Samson use to burn the Philistines'' grain fields?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  5,
  'In the events of Judges 15, why was Samson''s wife given to another man?',
  '["Because her father thought Samson hated her", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because her father thought Samson hated her',
  'Her father gave her to another because he thought Samson hated her (Judges 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 15, why was Samson''s wife given to another man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  5,
  'In the events of Judges 15, what did the Philistines do to Samson''s wife and her father?',
  '["Burned them with fire", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Burned them with fire',
  'The Philistines burned Samson''s wife and her father (Judges 15:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 15, what did the Philistines do to Samson''s wife and her father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  5,
  'In the events of Judges 15, what weapon did Samson use to kill a thousand Philistines?',
  '["A fresh jawbone of a donkey", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'A fresh jawbone of a donkey',
  'Samson killed a thousand men with a donkey''s jawbone (Judges 15:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 15, what weapon did Samson use to kill a thousand Philistines?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  5,
  'In the events of Judges 15, at what place did Samson become very thirsty after the battle?',
  '["Lehi", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Lehi',
  'Samson became very thirsty after the battle at Lehi (Judges 15:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 15, at what place did Samson become very thirsty after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  5,
  'In the events of Judges 15, what did God provide for Samson when he was thirsty?',
  '["Water from a hollow place", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Water from a hollow place',
  'God split the hollow place and water came out (Judges 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 15, what did God provide for Samson when he was thirsty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  15,
  5,
  'In the events of Judges 15, how many years did Samson judge Israel according to Judges 15?',
  '["Twenty years", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Twenty years',
  'Samson judged Israel twenty years in the days of the Philistines (Judges 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 15, how many years did Samson judge Israel according to Judges 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  1,
  'What woman in the Valley of Sorek did Samson love?',
  '["Delilah", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Delilah',
  'Samson loved a woman in the Valley of Sorek named Delilah (Judges 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What woman in the Valley of Sorek did Samson love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  1,
  'What secret of Samson''s strength did Delilah finally learn?',
  '["No razor had come upon his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'No razor had come upon his head',
  'Samson told Delilah he was a Nazirite and no razor had touched his head (Judges 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What secret of Samson''s strength did Delilah finally learn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  1,
  'What did the Philistines do to Samson after capturing him?',
  '["They put out his eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They put out his eyes',
  'The Philistines seized Samson and put out his eyes (Judges 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What did the Philistines do to Samson after capturing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  1,
  'What began to grow again after Samson was shaved?',
  '["The hair of his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The hair of his head',
  'The hair of Samson''s head began to grow again (Judges 16:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What began to grow again after Samson was shaved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  1,
  'Which Philistine god did the rulers praise after capturing Samson?',
  '["Dagon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dagon',
  'They praised Dagon for delivering Samson into their hand (Judges 16:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'Which Philistine god did the rulers praise after capturing Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  1,
  'What did Samson ask God to remember before his final act?',
  '["That he might be avenged once for his two eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That he might be avenged once for his two eyes',
  'Samson prayed for strength to be avenged for his eyes (Judges 16:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What did Samson ask God to remember before his final act?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  1,
  'How did Samson kill more people at his death than in his life?',
  '["He pulled down the temple pillars", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He pulled down the temple pillars',
  'Samson pulled down the pillars and the house fell on the Philistines (Judges 16:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'How did Samson kill more people at his death than in his life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  2,
  'In Judges 16, what woman in the Valley of Sorek did Samson love?',
  '["Delilah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Delilah',
  'Samson loved a woman in the Valley of Sorek named Delilah (Judges 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'In Judges 16, what woman in the Valley of Sorek did Samson love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  2,
  'In Judges 16, what secret of Samson''s strength did Delilah finally learn?',
  '["No razor had come upon his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'No razor had come upon his head',
  'Samson told Delilah he was a Nazirite and no razor had touched his head (Judges 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'In Judges 16, what secret of Samson''s strength did Delilah finally learn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  2,
  'In Judges 16, what did the Philistines do to Samson after capturing him?',
  '["They put out his eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They put out his eyes',
  'The Philistines seized Samson and put out his eyes (Judges 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'In Judges 16, what did the Philistines do to Samson after capturing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  2,
  'In Judges 16, what began to grow again after Samson was shaved?',
  '["The hair of his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The hair of his head',
  'The hair of Samson''s head began to grow again (Judges 16:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'In Judges 16, what began to grow again after Samson was shaved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  2,
  'In Judges 16, which Philistine god did the rulers praise after capturing Samson?',
  '["Dagon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dagon',
  'They praised Dagon for delivering Samson into their hand (Judges 16:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'In Judges 16, which Philistine god did the rulers praise after capturing Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  2,
  'In Judges 16, what did Samson ask God to remember before his final act?',
  '["That he might be avenged once for his two eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That he might be avenged once for his two eyes',
  'Samson prayed for strength to be avenged for his eyes (Judges 16:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'In Judges 16, what did Samson ask God to remember before his final act?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  2,
  'In Judges 16, how did Samson kill more people at his death than in his life?',
  '["He pulled down the temple pillars", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He pulled down the temple pillars',
  'Samson pulled down the pillars and the house fell on the Philistines (Judges 16:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'In Judges 16, how did Samson kill more people at his death than in his life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  3,
  'According to Judges 16, what woman in the Valley of Sorek did Samson love?',
  '["Delilah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Delilah',
  'Samson loved a woman in the Valley of Sorek named Delilah (Judges 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 16, what woman in the Valley of Sorek did Samson love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  3,
  'According to Judges 16, what secret of Samson''s strength did Delilah finally learn?',
  '["No razor had come upon his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'No razor had come upon his head',
  'Samson told Delilah he was a Nazirite and no razor had touched his head (Judges 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 16, what secret of Samson''s strength did Delilah finally learn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  3,
  'According to Judges 16, what did the Philistines do to Samson after capturing him?',
  '["They put out his eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They put out his eyes',
  'The Philistines seized Samson and put out his eyes (Judges 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 16, what did the Philistines do to Samson after capturing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  3,
  'According to Judges 16, what began to grow again after Samson was shaved?',
  '["The hair of his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The hair of his head',
  'The hair of Samson''s head began to grow again (Judges 16:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 16, what began to grow again after Samson was shaved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  3,
  'According to Judges 16, which Philistine god did the rulers praise after capturing Samson?',
  '["Dagon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dagon',
  'They praised Dagon for delivering Samson into their hand (Judges 16:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 16, which Philistine god did the rulers praise after capturing Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  3,
  'According to Judges 16, what did Samson ask God to remember before his final act?',
  '["That he might be avenged once for his two eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That he might be avenged once for his two eyes',
  'Samson prayed for strength to be avenged for his eyes (Judges 16:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 16, what did Samson ask God to remember before his final act?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  3,
  'According to Judges 16, how did Samson kill more people at his death than in his life?',
  '["He pulled down the temple pillars", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He pulled down the temple pillars',
  'Samson pulled down the pillars and the house fell on the Philistines (Judges 16:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 16, how did Samson kill more people at his death than in his life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  4,
  'From Judges 16, what woman in the Valley of Sorek did Samson love?',
  '["Delilah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Delilah',
  'Samson loved a woman in the Valley of Sorek named Delilah (Judges 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'From Judges 16, what woman in the Valley of Sorek did Samson love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  4,
  'From Judges 16, what secret of Samson''s strength did Delilah finally learn?',
  '["No razor had come upon his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'No razor had come upon his head',
  'Samson told Delilah he was a Nazirite and no razor had touched his head (Judges 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'From Judges 16, what secret of Samson''s strength did Delilah finally learn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  4,
  'From Judges 16, what did the Philistines do to Samson after capturing him?',
  '["They put out his eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They put out his eyes',
  'The Philistines seized Samson and put out his eyes (Judges 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'From Judges 16, what did the Philistines do to Samson after capturing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  4,
  'From Judges 16, what began to grow again after Samson was shaved?',
  '["The hair of his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The hair of his head',
  'The hair of Samson''s head began to grow again (Judges 16:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'From Judges 16, what began to grow again after Samson was shaved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  4,
  'From Judges 16, which Philistine god did the rulers praise after capturing Samson?',
  '["Dagon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dagon',
  'They praised Dagon for delivering Samson into their hand (Judges 16:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'From Judges 16, which Philistine god did the rulers praise after capturing Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  4,
  'From Judges 16, what did Samson ask God to remember before his final act?',
  '["That he might be avenged once for his two eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That he might be avenged once for his two eyes',
  'Samson prayed for strength to be avenged for his eyes (Judges 16:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'From Judges 16, what did Samson ask God to remember before his final act?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  4,
  'From Judges 16, how did Samson kill more people at his death than in his life?',
  '["He pulled down the temple pillars", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He pulled down the temple pillars',
  'Samson pulled down the pillars and the house fell on the Philistines (Judges 16:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'From Judges 16, how did Samson kill more people at his death than in his life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  5,
  'In the events of Judges 16, what woman in the Valley of Sorek did Samson love?',
  '["Delilah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Delilah',
  'Samson loved a woman in the Valley of Sorek named Delilah (Judges 16:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 16, what woman in the Valley of Sorek did Samson love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  5,
  'In the events of Judges 16, what secret of Samson''s strength did Delilah finally learn?',
  '["No razor had come upon his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'No razor had come upon his head',
  'Samson told Delilah he was a Nazirite and no razor had touched his head (Judges 16:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 16, what secret of Samson''s strength did Delilah finally learn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  5,
  'In the events of Judges 16, what did the Philistines do to Samson after capturing him?',
  '["They put out his eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'They put out his eyes',
  'The Philistines seized Samson and put out his eyes (Judges 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 16, what did the Philistines do to Samson after capturing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  5,
  'In the events of Judges 16, what began to grow again after Samson was shaved?',
  '["The hair of his head", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The hair of his head',
  'The hair of Samson''s head began to grow again (Judges 16:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 16, what began to grow again after Samson was shaved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  5,
  'In the events of Judges 16, which Philistine god did the rulers praise after capturing Samson?',
  '["Dagon", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dagon',
  'They praised Dagon for delivering Samson into their hand (Judges 16:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 16, which Philistine god did the rulers praise after capturing Samson?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  5,
  'In the events of Judges 16, what did Samson ask God to remember before his final act?',
  '["That he might be avenged once for his two eyes", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'That he might be avenged once for his two eyes',
  'Samson prayed for strength to be avenged for his eyes (Judges 16:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 16, what did Samson ask God to remember before his final act?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  16,
  5,
  'In the events of Judges 16, how did Samson kill more people at his death than in his life?',
  '["He pulled down the temple pillars", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He pulled down the temple pillars',
  'Samson pulled down the pillars and the house fell on the Philistines (Judges 16:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 16, how did Samson kill more people at his death than in his life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  1,
  'Who made a carved image from silver given by his mother?',
  '["Micah", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Micah',
  'Micah''s mother dedicated silver for a carved image, and Micah made it (Judges 17:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Who made a carved image from silver given by his mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  1,
  'From what town was the young Levite who came to Micah?',
  '["Bethlehem in Judah", "The land of Tob", "Timnah", "Lehi"]'::jsonb,
  'Bethlehem in Judah',
  'The young Levite was from Bethlehem in Judah (Judges 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'From what town was the young Levite who came to Micah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  1,
  'What did Micah make in addition to the carved image?',
  '["An ephod and household idols", "A two-edged dagger", "Milk", "That dew would fall on the fleece alone"]'::jsonb,
  'An ephod and household idols',
  'Micah had a shrine, an ephod, and household idols (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'What did Micah make in addition to the carved image?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  1,
  'Whom did Micah first consecrate as priest before the Levite arrived?',
  '["One of his sons", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'One of his sons',
  'Micah consecrated one of his sons as priest (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Whom did Micah first consecrate as priest before the Levite arrived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  1,
  'What did Micah pay the Levite to stay with him?',
  '["Ten pieces of silver a year, clothes, and food", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ten pieces of silver a year, clothes, and food',
  'Micah promised the Levite silver, clothing, and provisions (Judges 17:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'What did Micah pay the Levite to stay with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  1,
  'What statement about Israel''s condition appears in Judges 17?',
  '["\"Everyone did what was right in his own eyes\"", "Mighty man of valor", "Jerubbaal", "\"The sword of the LORD and of Gideon\""]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The chapter says everyone did what was right in his own eyes because there was no king in Israel (Judges 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'What statement about Israel''s condition appears in Judges 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  1,
  'Why did Micah think the LORD would prosper him?',
  '["Because he had a Levite as priest", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'Because he had a Levite as priest',
  'Micah thought having a Levite as priest would bring him prosperity (Judges 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Why did Micah think the LORD would prosper him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  2,
  'In Judges 17, who made a carved image from silver given by his mother?',
  '["Micah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Micah',
  'Micah''s mother dedicated silver for a carved image, and Micah made it (Judges 17:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'In Judges 17, who made a carved image from silver given by his mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  2,
  'In Judges 17, from what town was the young Levite who came to Micah?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The young Levite was from Bethlehem in Judah (Judges 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'In Judges 17, from what town was the young Levite who came to Micah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  2,
  'In Judges 17, what did Micah make in addition to the carved image?',
  '["An ephod and household idols", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod and household idols',
  'Micah had a shrine, an ephod, and household idols (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'In Judges 17, what did Micah make in addition to the carved image?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  2,
  'In Judges 17, whom did Micah first consecrate as priest before the Levite arrived?',
  '["One of his sons", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One of his sons',
  'Micah consecrated one of his sons as priest (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'In Judges 17, whom did Micah first consecrate as priest before the Levite arrived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  2,
  'In Judges 17, what did Micah pay the Levite to stay with him?',
  '["Ten pieces of silver a year, clothes, and food", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ten pieces of silver a year, clothes, and food',
  'Micah promised the Levite silver, clothing, and provisions (Judges 17:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'In Judges 17, what did Micah pay the Levite to stay with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  2,
  'In Judges 17, what statement about Israel''s condition appears in Judges 17?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The chapter says everyone did what was right in his own eyes because there was no king in Israel (Judges 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'In Judges 17, what statement about Israel''s condition appears in Judges 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  2,
  'In Judges 17, why did Micah think the LORD would prosper him?',
  '["Because he had a Levite as priest", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he had a Levite as priest',
  'Micah thought having a Levite as priest would bring him prosperity (Judges 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'In Judges 17, why did Micah think the LORD would prosper him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  3,
  'According to Judges 17, who made a carved image from silver given by his mother?',
  '["Micah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Micah',
  'Micah''s mother dedicated silver for a carved image, and Micah made it (Judges 17:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 17, who made a carved image from silver given by his mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  3,
  'According to Judges 17, from what town was the young Levite who came to Micah?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The young Levite was from Bethlehem in Judah (Judges 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 17, from what town was the young Levite who came to Micah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  3,
  'According to Judges 17, what did Micah make in addition to the carved image?',
  '["An ephod and household idols", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod and household idols',
  'Micah had a shrine, an ephod, and household idols (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 17, what did Micah make in addition to the carved image?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  3,
  'According to Judges 17, whom did Micah first consecrate as priest before the Levite arrived?',
  '["One of his sons", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One of his sons',
  'Micah consecrated one of his sons as priest (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 17, whom did Micah first consecrate as priest before the Levite arrived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  3,
  'According to Judges 17, what did Micah pay the Levite to stay with him?',
  '["Ten pieces of silver a year, clothes, and food", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ten pieces of silver a year, clothes, and food',
  'Micah promised the Levite silver, clothing, and provisions (Judges 17:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 17, what did Micah pay the Levite to stay with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  3,
  'According to Judges 17, what statement about Israel''s condition appears in Judges 17?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The chapter says everyone did what was right in his own eyes because there was no king in Israel (Judges 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 17, what statement about Israel''s condition appears in Judges 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  3,
  'According to Judges 17, why did Micah think the LORD would prosper him?',
  '["Because he had a Levite as priest", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he had a Levite as priest',
  'Micah thought having a Levite as priest would bring him prosperity (Judges 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 17, why did Micah think the LORD would prosper him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  4,
  'From Judges 17, who made a carved image from silver given by his mother?',
  '["Micah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Micah',
  'Micah''s mother dedicated silver for a carved image, and Micah made it (Judges 17:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'From Judges 17, who made a carved image from silver given by his mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  4,
  'From Judges 17, from what town was the young Levite who came to Micah?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The young Levite was from Bethlehem in Judah (Judges 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'From Judges 17, from what town was the young Levite who came to Micah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  4,
  'From Judges 17, what did Micah make in addition to the carved image?',
  '["An ephod and household idols", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod and household idols',
  'Micah had a shrine, an ephod, and household idols (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'From Judges 17, what did Micah make in addition to the carved image?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  4,
  'From Judges 17, whom did Micah first consecrate as priest before the Levite arrived?',
  '["One of his sons", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One of his sons',
  'Micah consecrated one of his sons as priest (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'From Judges 17, whom did Micah first consecrate as priest before the Levite arrived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  4,
  'From Judges 17, what did Micah pay the Levite to stay with him?',
  '["Ten pieces of silver a year, clothes, and food", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ten pieces of silver a year, clothes, and food',
  'Micah promised the Levite silver, clothing, and provisions (Judges 17:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'From Judges 17, what did Micah pay the Levite to stay with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  4,
  'From Judges 17, what statement about Israel''s condition appears in Judges 17?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The chapter says everyone did what was right in his own eyes because there was no king in Israel (Judges 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'From Judges 17, what statement about Israel''s condition appears in Judges 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  4,
  'From Judges 17, why did Micah think the LORD would prosper him?',
  '["Because he had a Levite as priest", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he had a Levite as priest',
  'Micah thought having a Levite as priest would bring him prosperity (Judges 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'From Judges 17, why did Micah think the LORD would prosper him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  5,
  'In the events of Judges 17, who made a carved image from silver given by his mother?',
  '["Micah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Micah',
  'Micah''s mother dedicated silver for a carved image, and Micah made it (Judges 17:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 17, who made a carved image from silver given by his mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  5,
  'In the events of Judges 17, from what town was the young Levite who came to Micah?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The young Levite was from Bethlehem in Judah (Judges 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 17, from what town was the young Levite who came to Micah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  5,
  'In the events of Judges 17, what did Micah make in addition to the carved image?',
  '["An ephod and household idols", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ephod and household idols',
  'Micah had a shrine, an ephod, and household idols (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 17, what did Micah make in addition to the carved image?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  5,
  'In the events of Judges 17, whom did Micah first consecrate as priest before the Levite arrived?',
  '["One of his sons", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One of his sons',
  'Micah consecrated one of his sons as priest (Judges 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 17, whom did Micah first consecrate as priest before the Levite arrived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  5,
  'In the events of Judges 17, what did Micah pay the Levite to stay with him?',
  '["Ten pieces of silver a year, clothes, and food", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Ten pieces of silver a year, clothes, and food',
  'Micah promised the Levite silver, clothing, and provisions (Judges 17:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 17, what did Micah pay the Levite to stay with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  5,
  'In the events of Judges 17, what statement about Israel''s condition appears in Judges 17?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The chapter says everyone did what was right in his own eyes because there was no king in Israel (Judges 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 17, what statement about Israel''s condition appears in Judges 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  17,
  5,
  'In the events of Judges 17, why did Micah think the LORD would prosper him?',
  '["Because he had a Levite as priest", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because he had a Levite as priest',
  'Micah thought having a Levite as priest would bring him prosperity (Judges 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 17, why did Micah think the LORD would prosper him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  1,
  'Which tribe was still seeking an inheritance in Judges 18?',
  '["Dan", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Dan',
  'The tribe of Dan was seeking an inheritance to dwell in (Judges 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'Which tribe was still seeking an inheritance in Judges 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  1,
  'What city did the Danite spies say was quiet and secure?',
  '["Laish", "The land of Tob", "Timnah", "Lehi"]'::jsonb,
  'Laish',
  'The spies described Laish as quiet and secure (Judges 18:7, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What city did the Danite spies say was quiet and secure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  1,
  'What religious objects did the Danites take from Micah''s house?',
  '["The carved image, ephod, household idols, and metal image", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The carved image, ephod, household idols, and metal image',
  'The Danites took Micah''s religious objects and the Levite (Judges 18:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What religious objects did the Danites take from Micah''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  1,
  'What did the Danites rename Laish after conquering it?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'They renamed Laish after Dan their father (Judges 18:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What did the Danites rename Laish after conquering it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  1,
  'What priest did the Danites persuade to go with them?',
  '["The young Levite from Micah''s house", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The young Levite from Micah''s house',
  'The Danites persuaded Micah''s priest to go with them (Judges 18:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What priest did the Danites persuade to go with them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  1,
  'Why did the Danites choose Laish as a target?',
  '["It was far from Sidon and had no deliverer", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'It was far from Sidon and had no deliverer',
  'Laish was quiet, secure, and isolated from help (Judges 18:7, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'Why did the Danites choose Laish as a target?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  1,
  'What continuing problem does Judges 18 show in Israel?',
  '["Private idolatry became tribal idolatry", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Private idolatry became tribal idolatry',
  'The Danites set up Micah''s image for themselves, showing deepening idolatry (Judges 18:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What continuing problem does Judges 18 show in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  2,
  'In Judges 18, which tribe was still seeking an inheritance in Judges 18?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'The tribe of Dan was seeking an inheritance to dwell in (Judges 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'In Judges 18, which tribe was still seeking an inheritance in Judges 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  2,
  'In Judges 18, what city did the Danite spies say was quiet and secure?',
  '["Laish", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Laish',
  'The spies described Laish as quiet and secure (Judges 18:7, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'In Judges 18, what city did the Danite spies say was quiet and secure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  2,
  'In Judges 18, what religious objects did the Danites take from Micah''s house?',
  '["The carved image, ephod, household idols, and metal image", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The carved image, ephod, household idols, and metal image',
  'The Danites took Micah''s religious objects and the Levite (Judges 18:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'In Judges 18, what religious objects did the Danites take from Micah''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  2,
  'In Judges 18, what did the Danites rename Laish after conquering it?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'They renamed Laish after Dan their father (Judges 18:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'In Judges 18, what did the Danites rename Laish after conquering it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  2,
  'In Judges 18, what priest did the Danites persuade to go with them?',
  '["The young Levite from Micah''s house", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The young Levite from Micah''s house',
  'The Danites persuaded Micah''s priest to go with them (Judges 18:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'In Judges 18, what priest did the Danites persuade to go with them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  2,
  'In Judges 18, why did the Danites choose Laish as a target?',
  '["It was far from Sidon and had no deliverer", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It was far from Sidon and had no deliverer',
  'Laish was quiet, secure, and isolated from help (Judges 18:7, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'In Judges 18, why did the Danites choose Laish as a target?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  2,
  'In Judges 18, what continuing problem does Judges 18 show in Israel?',
  '["Private idolatry became tribal idolatry", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Private idolatry became tribal idolatry',
  'The Danites set up Micah''s image for themselves, showing deepening idolatry (Judges 18:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'In Judges 18, what continuing problem does Judges 18 show in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  3,
  'According to Judges 18, which tribe was still seeking an inheritance in Judges 18?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'The tribe of Dan was seeking an inheritance to dwell in (Judges 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 18, which tribe was still seeking an inheritance in Judges 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  3,
  'According to Judges 18, what city did the Danite spies say was quiet and secure?',
  '["Laish", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Laish',
  'The spies described Laish as quiet and secure (Judges 18:7, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 18, what city did the Danite spies say was quiet and secure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  3,
  'According to Judges 18, what religious objects did the Danites take from Micah''s house?',
  '["The carved image, ephod, household idols, and metal image", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The carved image, ephod, household idols, and metal image',
  'The Danites took Micah''s religious objects and the Levite (Judges 18:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 18, what religious objects did the Danites take from Micah''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  3,
  'According to Judges 18, what did the Danites rename Laish after conquering it?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'They renamed Laish after Dan their father (Judges 18:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 18, what did the Danites rename Laish after conquering it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  3,
  'According to Judges 18, what priest did the Danites persuade to go with them?',
  '["The young Levite from Micah''s house", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The young Levite from Micah''s house',
  'The Danites persuaded Micah''s priest to go with them (Judges 18:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 18, what priest did the Danites persuade to go with them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  3,
  'According to Judges 18, why did the Danites choose Laish as a target?',
  '["It was far from Sidon and had no deliverer", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It was far from Sidon and had no deliverer',
  'Laish was quiet, secure, and isolated from help (Judges 18:7, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 18, why did the Danites choose Laish as a target?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  3,
  'According to Judges 18, what continuing problem does Judges 18 show in Israel?',
  '["Private idolatry became tribal idolatry", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Private idolatry became tribal idolatry',
  'The Danites set up Micah''s image for themselves, showing deepening idolatry (Judges 18:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 18, what continuing problem does Judges 18 show in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  4,
  'From Judges 18, which tribe was still seeking an inheritance in Judges 18?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'The tribe of Dan was seeking an inheritance to dwell in (Judges 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'From Judges 18, which tribe was still seeking an inheritance in Judges 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  4,
  'From Judges 18, what city did the Danite spies say was quiet and secure?',
  '["Laish", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Laish',
  'The spies described Laish as quiet and secure (Judges 18:7, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'From Judges 18, what city did the Danite spies say was quiet and secure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  4,
  'From Judges 18, what religious objects did the Danites take from Micah''s house?',
  '["The carved image, ephod, household idols, and metal image", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The carved image, ephod, household idols, and metal image',
  'The Danites took Micah''s religious objects and the Levite (Judges 18:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'From Judges 18, what religious objects did the Danites take from Micah''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  4,
  'From Judges 18, what did the Danites rename Laish after conquering it?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'They renamed Laish after Dan their father (Judges 18:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'From Judges 18, what did the Danites rename Laish after conquering it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  4,
  'From Judges 18, what priest did the Danites persuade to go with them?',
  '["The young Levite from Micah''s house", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The young Levite from Micah''s house',
  'The Danites persuaded Micah''s priest to go with them (Judges 18:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'From Judges 18, what priest did the Danites persuade to go with them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  4,
  'From Judges 18, why did the Danites choose Laish as a target?',
  '["It was far from Sidon and had no deliverer", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It was far from Sidon and had no deliverer',
  'Laish was quiet, secure, and isolated from help (Judges 18:7, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'From Judges 18, why did the Danites choose Laish as a target?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  4,
  'From Judges 18, what continuing problem does Judges 18 show in Israel?',
  '["Private idolatry became tribal idolatry", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Private idolatry became tribal idolatry',
  'The Danites set up Micah''s image for themselves, showing deepening idolatry (Judges 18:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'From Judges 18, what continuing problem does Judges 18 show in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  5,
  'In the events of Judges 18, which tribe was still seeking an inheritance in Judges 18?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'The tribe of Dan was seeking an inheritance to dwell in (Judges 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 18, which tribe was still seeking an inheritance in Judges 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  5,
  'In the events of Judges 18, what city did the Danite spies say was quiet and secure?',
  '["Laish", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Laish',
  'The spies described Laish as quiet and secure (Judges 18:7, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 18, what city did the Danite spies say was quiet and secure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  5,
  'In the events of Judges 18, what religious objects did the Danites take from Micah''s house?',
  '["The carved image, ephod, household idols, and metal image", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The carved image, ephod, household idols, and metal image',
  'The Danites took Micah''s religious objects and the Levite (Judges 18:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 18, what religious objects did the Danites take from Micah''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  5,
  'In the events of Judges 18, what did the Danites rename Laish after conquering it?',
  '["Dan", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Dan',
  'They renamed Laish after Dan their father (Judges 18:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 18, what did the Danites rename Laish after conquering it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  5,
  'In the events of Judges 18, what priest did the Danites persuade to go with them?',
  '["The young Levite from Micah''s house", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'The young Levite from Micah''s house',
  'The Danites persuaded Micah''s priest to go with them (Judges 18:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 18, what priest did the Danites persuade to go with them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  5,
  'In the events of Judges 18, why did the Danites choose Laish as a target?',
  '["It was far from Sidon and had no deliverer", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'It was far from Sidon and had no deliverer',
  'Laish was quiet, secure, and isolated from help (Judges 18:7, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 18, why did the Danites choose Laish as a target?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  18,
  5,
  'In the events of Judges 18, what continuing problem does Judges 18 show in Israel?',
  '["Private idolatry became tribal idolatry", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Private idolatry became tribal idolatry',
  'The Danites set up Micah''s image for themselves, showing deepening idolatry (Judges 18:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 18, what continuing problem does Judges 18 show in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  1,
  'From what town was the Levite''s concubine?',
  '["Bethlehem in Judah", "The land of Tob", "Timnah", "Lehi"]'::jsonb,
  'Bethlehem in Judah',
  'The Levite''s concubine was from Bethlehem in Judah (Judges 19:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'From what town was the Levite''s concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  1,
  'In what Benjaminite city did the Levite and his concubine spend the night?',
  '["Gibeah", "The land of Tob", "Timnah", "Lehi"]'::jsonb,
  'Gibeah',
  'They stayed in Gibeah of Benjamin (Judges 19:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'In what Benjaminite city did the Levite and his concubine spend the night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  1,
  'Who offered hospitality to the Levite in Gibeah?',
  '["An old man from the hill country of Ephraim", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'An old man from the hill country of Ephraim',
  'An old man took them into his house in Gibeah (Judges 19:16-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'Who offered hospitality to the Levite in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  1,
  'What happened to the Levite''s concubine during the night in Gibeah?',
  '["She was abused and died", "Several tribes did not fully drive out the inhabitants", "The people turned back and became more corrupt", "It had rest for forty years"]'::jsonb,
  'She was abused and died',
  'The men of the city abused the concubine and she died (Judges 19:22-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'What happened to the Levite''s concubine during the night in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  1,
  'What did the Levite do with the body of his concubine?',
  '["He cut it into twelve pieces", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He cut it into twelve pieces',
  'The Levite divided her body into twelve pieces and sent them through Israel (Judges 19:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'What did the Levite do with the body of his concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  1,
  'Why did the Levite send the pieces throughout Israel?',
  '["To call attention to the outrage in Gibeah", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'To call attention to the outrage in Gibeah',
  'He sent the pieces to expose the shocking evil done in Israel (Judges 19:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'Why did the Levite send the pieces throughout Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  1,
  'What did all who saw the pieces say?',
  '["Nothing like this had happened since Israel came up from Egypt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nothing like this had happened since Israel came up from Egypt',
  'The people said nothing like it had been seen or done since the exodus (Judges 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'What did all who saw the pieces say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  2,
  'In Judges 19, from what town was the Levite''s concubine?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The Levite''s concubine was from Bethlehem in Judah (Judges 19:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'In Judges 19, from what town was the Levite''s concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  2,
  'In Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'They stayed in Gibeah of Benjamin (Judges 19:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'In Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  2,
  'In Judges 19, who offered hospitality to the Levite in Gibeah?',
  '["An old man from the hill country of Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An old man from the hill country of Ephraim',
  'An old man took them into his house in Gibeah (Judges 19:16-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'In Judges 19, who offered hospitality to the Levite in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  2,
  'In Judges 19, what happened to the Levite''s concubine during the night in Gibeah?',
  '["She was abused and died", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'She was abused and died',
  'The men of the city abused the concubine and she died (Judges 19:22-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'In Judges 19, what happened to the Levite''s concubine during the night in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  2,
  'In Judges 19, what did the Levite do with the body of his concubine?',
  '["He cut it into twelve pieces", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He cut it into twelve pieces',
  'The Levite divided her body into twelve pieces and sent them through Israel (Judges 19:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'In Judges 19, what did the Levite do with the body of his concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  2,
  'In Judges 19, why did the Levite send the pieces throughout Israel?',
  '["To call attention to the outrage in Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To call attention to the outrage in Gibeah',
  'He sent the pieces to expose the shocking evil done in Israel (Judges 19:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'In Judges 19, why did the Levite send the pieces throughout Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  2,
  'In Judges 19, what did all who saw the pieces say?',
  '["Nothing like this had happened since Israel came up from Egypt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nothing like this had happened since Israel came up from Egypt',
  'The people said nothing like it had been seen or done since the exodus (Judges 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'In Judges 19, what did all who saw the pieces say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  3,
  'According to Judges 19, from what town was the Levite''s concubine?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The Levite''s concubine was from Bethlehem in Judah (Judges 19:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 19, from what town was the Levite''s concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  3,
  'According to Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'They stayed in Gibeah of Benjamin (Judges 19:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  3,
  'According to Judges 19, who offered hospitality to the Levite in Gibeah?',
  '["An old man from the hill country of Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An old man from the hill country of Ephraim',
  'An old man took them into his house in Gibeah (Judges 19:16-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 19, who offered hospitality to the Levite in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  3,
  'According to Judges 19, what happened to the Levite''s concubine during the night in Gibeah?',
  '["She was abused and died", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'She was abused and died',
  'The men of the city abused the concubine and she died (Judges 19:22-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 19, what happened to the Levite''s concubine during the night in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  3,
  'According to Judges 19, what did the Levite do with the body of his concubine?',
  '["He cut it into twelve pieces", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He cut it into twelve pieces',
  'The Levite divided her body into twelve pieces and sent them through Israel (Judges 19:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 19, what did the Levite do with the body of his concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  3,
  'According to Judges 19, why did the Levite send the pieces throughout Israel?',
  '["To call attention to the outrage in Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To call attention to the outrage in Gibeah',
  'He sent the pieces to expose the shocking evil done in Israel (Judges 19:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 19, why did the Levite send the pieces throughout Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  3,
  'According to Judges 19, what did all who saw the pieces say?',
  '["Nothing like this had happened since Israel came up from Egypt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nothing like this had happened since Israel came up from Egypt',
  'The people said nothing like it had been seen or done since the exodus (Judges 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 19, what did all who saw the pieces say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  4,
  'From Judges 19, from what town was the Levite''s concubine?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The Levite''s concubine was from Bethlehem in Judah (Judges 19:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'From Judges 19, from what town was the Levite''s concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  4,
  'From Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'They stayed in Gibeah of Benjamin (Judges 19:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'From Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  4,
  'From Judges 19, who offered hospitality to the Levite in Gibeah?',
  '["An old man from the hill country of Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An old man from the hill country of Ephraim',
  'An old man took them into his house in Gibeah (Judges 19:16-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'From Judges 19, who offered hospitality to the Levite in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  4,
  'From Judges 19, what happened to the Levite''s concubine during the night in Gibeah?',
  '["She was abused and died", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'She was abused and died',
  'The men of the city abused the concubine and she died (Judges 19:22-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'From Judges 19, what happened to the Levite''s concubine during the night in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  4,
  'From Judges 19, what did the Levite do with the body of his concubine?',
  '["He cut it into twelve pieces", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He cut it into twelve pieces',
  'The Levite divided her body into twelve pieces and sent them through Israel (Judges 19:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'From Judges 19, what did the Levite do with the body of his concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  4,
  'From Judges 19, why did the Levite send the pieces throughout Israel?',
  '["To call attention to the outrage in Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To call attention to the outrage in Gibeah',
  'He sent the pieces to expose the shocking evil done in Israel (Judges 19:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'From Judges 19, why did the Levite send the pieces throughout Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  4,
  'From Judges 19, what did all who saw the pieces say?',
  '["Nothing like this had happened since Israel came up from Egypt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nothing like this had happened since Israel came up from Egypt',
  'The people said nothing like it had been seen or done since the exodus (Judges 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'From Judges 19, what did all who saw the pieces say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  5,
  'In the events of Judges 19, from what town was the Levite''s concubine?',
  '["Bethlehem in Judah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Bethlehem in Judah',
  'The Levite''s concubine was from Bethlehem in Judah (Judges 19:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 19, from what town was the Levite''s concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  5,
  'In the events of Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'They stayed in Gibeah of Benjamin (Judges 19:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 19, in what Benjaminite city did the Levite and his concubine spend the night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  5,
  'In the events of Judges 19, who offered hospitality to the Levite in Gibeah?',
  '["An old man from the hill country of Ephraim", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An old man from the hill country of Ephraim',
  'An old man took them into his house in Gibeah (Judges 19:16-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 19, who offered hospitality to the Levite in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  5,
  'In the events of Judges 19, what happened to the Levite''s concubine during the night in Gibeah?',
  '["She was abused and died", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'She was abused and died',
  'The men of the city abused the concubine and she died (Judges 19:22-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 19, what happened to the Levite''s concubine during the night in Gibeah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  5,
  'In the events of Judges 19, what did the Levite do with the body of his concubine?',
  '["He cut it into twelve pieces", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'He cut it into twelve pieces',
  'The Levite divided her body into twelve pieces and sent them through Israel (Judges 19:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 19, what did the Levite do with the body of his concubine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  5,
  'In the events of Judges 19, why did the Levite send the pieces throughout Israel?',
  '["To call attention to the outrage in Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'To call attention to the outrage in Gibeah',
  'He sent the pieces to expose the shocking evil done in Israel (Judges 19:29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 19, why did the Levite send the pieces throughout Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  19,
  5,
  'In the events of Judges 19, what did all who saw the pieces say?',
  '["Nothing like this had happened since Israel came up from Egypt", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Nothing like this had happened since Israel came up from Egypt',
  'The people said nothing like it had been seen or done since the exodus (Judges 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 19, what did all who saw the pieces say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  1,
  'Against which tribe did Israel gather for battle in Judges 20?',
  '["Benjamin", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Benjamin',
  'The tribes gathered against Benjamin because of the crime at Gibeah (Judges 20:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'Against which tribe did Israel gather for battle in Judges 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  1,
  'What left-handed Benjaminite fighters are specifically mentioned?',
  '["Seven hundred chosen men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seven hundred chosen men',
  'Benjamin had seven hundred chosen left-handed men (Judges 20:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'What left-handed Benjaminite fighters are specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  1,
  'How many times did Israel initially go up and lose before winning?',
  '["Two times", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Two times',
  'Israel lost two battles before the LORD gave victory on the third day (Judges 20:18-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'How many times did Israel initially go up and lose before winning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  1,
  'What strategy helped Israel defeat Benjamin in the final battle?',
  '["An ambush against Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ambush against Gibeah',
  'Israel set men in ambush against Gibeah (Judges 20:29-37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'What strategy helped Israel defeat Benjamin in the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  1,
  'Who asked counsel of the LORD before the final battle?',
  '["Phinehas son of Eleazar", "Judah", "Simeon", "Adoni-Bezek"]'::jsonb,
  'Phinehas son of Eleazar',
  'Phinehas stood before the ark and asked counsel of the LORD (Judges 20:27-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'Who asked counsel of the LORD before the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  1,
  'How many men of Benjamin remained after the battle?',
  '["Six hundred", "Nine hundred", "Forty years", "Three hundred"]'::jsonb,
  'Six hundred',
  'Six hundred Benjaminites fled to the rock of Rimmon (Judges 20:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'How many men of Benjamin remained after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  1,
  'What city did the ambush set on fire as a signal?',
  '["Gibeah", "The land of Tob", "Timnah", "Lehi"]'::jsonb,
  'Gibeah',
  'The ambush set Gibeah on fire as the signal in battle (Judges 20:37-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'What city did the ambush set on fire as a signal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  2,
  'In Judges 20, against which tribe did Israel gather for battle in Judges 20?',
  '["Benjamin", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Benjamin',
  'The tribes gathered against Benjamin because of the crime at Gibeah (Judges 20:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'In Judges 20, against which tribe did Israel gather for battle in Judges 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  2,
  'In Judges 20, what left-handed Benjaminite fighters are specifically mentioned?',
  '["Seven hundred chosen men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seven hundred chosen men',
  'Benjamin had seven hundred chosen left-handed men (Judges 20:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'In Judges 20, what left-handed Benjaminite fighters are specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  2,
  'In Judges 20, how many times did Israel initially go up and lose before winning?',
  '["Two times", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Two times',
  'Israel lost two battles before the LORD gave victory on the third day (Judges 20:18-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'In Judges 20, how many times did Israel initially go up and lose before winning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  2,
  'In Judges 20, what strategy helped Israel defeat Benjamin in the final battle?',
  '["An ambush against Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ambush against Gibeah',
  'Israel set men in ambush against Gibeah (Judges 20:29-37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'In Judges 20, what strategy helped Israel defeat Benjamin in the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  2,
  'In Judges 20, who asked counsel of the LORD before the final battle?',
  '["Phinehas son of Eleazar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Phinehas son of Eleazar',
  'Phinehas stood before the ark and asked counsel of the LORD (Judges 20:27-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'In Judges 20, who asked counsel of the LORD before the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  2,
  'In Judges 20, how many men of Benjamin remained after the battle?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Six hundred Benjaminites fled to the rock of Rimmon (Judges 20:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'In Judges 20, how many men of Benjamin remained after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  2,
  'In Judges 20, what city did the ambush set on fire as a signal?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'The ambush set Gibeah on fire as the signal in battle (Judges 20:37-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'In Judges 20, what city did the ambush set on fire as a signal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  3,
  'According to Judges 20, against which tribe did Israel gather for battle in Judges 20?',
  '["Benjamin", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Benjamin',
  'The tribes gathered against Benjamin because of the crime at Gibeah (Judges 20:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 20, against which tribe did Israel gather for battle in Judges 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  3,
  'According to Judges 20, what left-handed Benjaminite fighters are specifically mentioned?',
  '["Seven hundred chosen men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seven hundred chosen men',
  'Benjamin had seven hundred chosen left-handed men (Judges 20:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 20, what left-handed Benjaminite fighters are specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  3,
  'According to Judges 20, how many times did Israel initially go up and lose before winning?',
  '["Two times", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Two times',
  'Israel lost two battles before the LORD gave victory on the third day (Judges 20:18-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 20, how many times did Israel initially go up and lose before winning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  3,
  'According to Judges 20, what strategy helped Israel defeat Benjamin in the final battle?',
  '["An ambush against Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ambush against Gibeah',
  'Israel set men in ambush against Gibeah (Judges 20:29-37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 20, what strategy helped Israel defeat Benjamin in the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  3,
  'According to Judges 20, who asked counsel of the LORD before the final battle?',
  '["Phinehas son of Eleazar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Phinehas son of Eleazar',
  'Phinehas stood before the ark and asked counsel of the LORD (Judges 20:27-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 20, who asked counsel of the LORD before the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  3,
  'According to Judges 20, how many men of Benjamin remained after the battle?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Six hundred Benjaminites fled to the rock of Rimmon (Judges 20:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 20, how many men of Benjamin remained after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  3,
  'According to Judges 20, what city did the ambush set on fire as a signal?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'The ambush set Gibeah on fire as the signal in battle (Judges 20:37-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 20, what city did the ambush set on fire as a signal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  4,
  'From Judges 20, against which tribe did Israel gather for battle in Judges 20?',
  '["Benjamin", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Benjamin',
  'The tribes gathered against Benjamin because of the crime at Gibeah (Judges 20:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'From Judges 20, against which tribe did Israel gather for battle in Judges 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  4,
  'From Judges 20, what left-handed Benjaminite fighters are specifically mentioned?',
  '["Seven hundred chosen men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seven hundred chosen men',
  'Benjamin had seven hundred chosen left-handed men (Judges 20:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'From Judges 20, what left-handed Benjaminite fighters are specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  4,
  'From Judges 20, how many times did Israel initially go up and lose before winning?',
  '["Two times", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Two times',
  'Israel lost two battles before the LORD gave victory on the third day (Judges 20:18-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'From Judges 20, how many times did Israel initially go up and lose before winning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  4,
  'From Judges 20, what strategy helped Israel defeat Benjamin in the final battle?',
  '["An ambush against Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ambush against Gibeah',
  'Israel set men in ambush against Gibeah (Judges 20:29-37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'From Judges 20, what strategy helped Israel defeat Benjamin in the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  4,
  'From Judges 20, who asked counsel of the LORD before the final battle?',
  '["Phinehas son of Eleazar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Phinehas son of Eleazar',
  'Phinehas stood before the ark and asked counsel of the LORD (Judges 20:27-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'From Judges 20, who asked counsel of the LORD before the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  4,
  'From Judges 20, how many men of Benjamin remained after the battle?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Six hundred Benjaminites fled to the rock of Rimmon (Judges 20:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'From Judges 20, how many men of Benjamin remained after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  4,
  'From Judges 20, what city did the ambush set on fire as a signal?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'The ambush set Gibeah on fire as the signal in battle (Judges 20:37-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'From Judges 20, what city did the ambush set on fire as a signal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  5,
  'In the events of Judges 20, against which tribe did Israel gather for battle in Judges 20?',
  '["Benjamin", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Benjamin',
  'The tribes gathered against Benjamin because of the crime at Gibeah (Judges 20:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 20, against which tribe did Israel gather for battle in Judges 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  5,
  'In the events of Judges 20, what left-handed Benjaminite fighters are specifically mentioned?',
  '["Seven hundred chosen men", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Seven hundred chosen men',
  'Benjamin had seven hundred chosen left-handed men (Judges 20:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 20, what left-handed Benjaminite fighters are specifically mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  5,
  'In the events of Judges 20, how many times did Israel initially go up and lose before winning?',
  '["Two times", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Two times',
  'Israel lost two battles before the LORD gave victory on the third day (Judges 20:18-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 20, how many times did Israel initially go up and lose before winning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  5,
  'In the events of Judges 20, what strategy helped Israel defeat Benjamin in the final battle?',
  '["An ambush against Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'An ambush against Gibeah',
  'Israel set men in ambush against Gibeah (Judges 20:29-37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 20, what strategy helped Israel defeat Benjamin in the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  5,
  'In the events of Judges 20, who asked counsel of the LORD before the final battle?',
  '["Phinehas son of Eleazar", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Phinehas son of Eleazar',
  'Phinehas stood before the ark and asked counsel of the LORD (Judges 20:27-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 20, who asked counsel of the LORD before the final battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  5,
  'In the events of Judges 20, how many men of Benjamin remained after the battle?',
  '["Six hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Six hundred',
  'Six hundred Benjaminites fled to the rock of Rimmon (Judges 20:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 20, how many men of Benjamin remained after the battle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  20,
  5,
  'In the events of Judges 20, what city did the ambush set on fire as a signal?',
  '["Gibeah", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Gibeah',
  'The ambush set Gibeah on fire as the signal in battle (Judges 20:37-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 20, what city did the ambush set on fire as a signal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  1,
  'What problem troubled Israel after the war with Benjamin?',
  '["One tribe was nearly wiped out", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One tribe was nearly wiped out',
  'Israel grieved because Benjamin was nearly cut off from Israel (Judges 21:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'What problem troubled Israel after the war with Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  1,
  'Which city was struck because it had not come to the assembly before the LORD?',
  '["Jabesh Gilead", "The land of Tob", "Timnah", "Lehi"]'::jsonb,
  'Jabesh Gilead',
  'Israel struck Jabesh Gilead because it had not come to the assembly (Judges 21:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'Which city was struck because it had not come to the assembly before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  1,
  'How many virgins were found at Jabesh Gilead and given to Benjamin?',
  '["Four hundred", "Six hundred", "Nine hundred", "Forty years"]'::jsonb,
  'Four hundred',
  'Four hundred young virgins from Jabesh Gilead were spared and given to Benjamin (Judges 21:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'How many virgins were found at Jabesh Gilead and given to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  1,
  'From what festival place were wives taken for the remaining Benjaminites?',
  '["Shiloh", "The land of Tob", "Timnah", "Lehi"]'::jsonb,
  'Shiloh',
  'The remaining Benjaminites took wives from the daughters dancing at Shiloh (Judges 21:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'From what festival place were wives taken for the remaining Benjaminites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  1,
  'Why did Israel refuse to give daughters directly to Benjamin?',
  '["Because they had sworn an oath", "To save Israel from those who plundered them", "To test whether Israel would keep the LORD''s way", "To test Israel"]'::jsonb,
  'Because they had sworn an oath',
  'Israel had sworn not to give their daughters as wives to Benjamin (Judges 21:1, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'Why did Israel refuse to give daughters directly to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  1,
  'What repeated statement closes the book of Judges?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The book closes by saying everyone did what was right in his own eyes because there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'What repeated statement closes the book of Judges?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  1,
  'What does the ending of Judges emphasize about Israel''s condition?',
  '["There was no king in Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'There was no king in Israel',
  'The final verse emphasizes that there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'What does the ending of Judges emphasize about Israel''s condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  2,
  'In Judges 21, what problem troubled Israel after the war with Benjamin?',
  '["One tribe was nearly wiped out", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One tribe was nearly wiped out',
  'Israel grieved because Benjamin was nearly cut off from Israel (Judges 21:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'In Judges 21, what problem troubled Israel after the war with Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  2,
  'In Judges 21, which city was struck because it had not come to the assembly before the LORD?',
  '["Jabesh Gilead", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jabesh Gilead',
  'Israel struck Jabesh Gilead because it had not come to the assembly (Judges 21:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'In Judges 21, which city was struck because it had not come to the assembly before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  2,
  'In Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?',
  '["Four hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Four hundred',
  'Four hundred young virgins from Jabesh Gilead were spared and given to Benjamin (Judges 21:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'In Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  2,
  'In Judges 21, from what festival place were wives taken for the remaining Benjaminites?',
  '["Shiloh", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Shiloh',
  'The remaining Benjaminites took wives from the daughters dancing at Shiloh (Judges 21:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'In Judges 21, from what festival place were wives taken for the remaining Benjaminites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  2,
  'In Judges 21, why did Israel refuse to give daughters directly to Benjamin?',
  '["Because they had sworn an oath", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because they had sworn an oath',
  'Israel had sworn not to give their daughters as wives to Benjamin (Judges 21:1, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'In Judges 21, why did Israel refuse to give daughters directly to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  2,
  'In Judges 21, what repeated statement closes the book of Judges?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The book closes by saying everyone did what was right in his own eyes because there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'In Judges 21, what repeated statement closes the book of Judges?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  2,
  'In Judges 21, what does the ending of Judges emphasize about Israel''s condition?',
  '["There was no king in Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'There was no king in Israel',
  'The final verse emphasizes that there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'In Judges 21, what does the ending of Judges emphasize about Israel''s condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  3,
  'According to Judges 21, what problem troubled Israel after the war with Benjamin?',
  '["One tribe was nearly wiped out", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One tribe was nearly wiped out',
  'Israel grieved because Benjamin was nearly cut off from Israel (Judges 21:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 21, what problem troubled Israel after the war with Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  3,
  'According to Judges 21, which city was struck because it had not come to the assembly before the LORD?',
  '["Jabesh Gilead", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jabesh Gilead',
  'Israel struck Jabesh Gilead because it had not come to the assembly (Judges 21:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 21, which city was struck because it had not come to the assembly before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  3,
  'According to Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?',
  '["Four hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Four hundred',
  'Four hundred young virgins from Jabesh Gilead were spared and given to Benjamin (Judges 21:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  3,
  'According to Judges 21, from what festival place were wives taken for the remaining Benjaminites?',
  '["Shiloh", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Shiloh',
  'The remaining Benjaminites took wives from the daughters dancing at Shiloh (Judges 21:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 21, from what festival place were wives taken for the remaining Benjaminites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  3,
  'According to Judges 21, why did Israel refuse to give daughters directly to Benjamin?',
  '["Because they had sworn an oath", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because they had sworn an oath',
  'Israel had sworn not to give their daughters as wives to Benjamin (Judges 21:1, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 21, why did Israel refuse to give daughters directly to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  3,
  'According to Judges 21, what repeated statement closes the book of Judges?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The book closes by saying everyone did what was right in his own eyes because there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 21, what repeated statement closes the book of Judges?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  3,
  'According to Judges 21, what does the ending of Judges emphasize about Israel''s condition?',
  '["There was no king in Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'There was no king in Israel',
  'The final verse emphasizes that there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'According to Judges 21, what does the ending of Judges emphasize about Israel''s condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  4,
  'From Judges 21, what problem troubled Israel after the war with Benjamin?',
  '["One tribe was nearly wiped out", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One tribe was nearly wiped out',
  'Israel grieved because Benjamin was nearly cut off from Israel (Judges 21:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'From Judges 21, what problem troubled Israel after the war with Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  4,
  'From Judges 21, which city was struck because it had not come to the assembly before the LORD?',
  '["Jabesh Gilead", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jabesh Gilead',
  'Israel struck Jabesh Gilead because it had not come to the assembly (Judges 21:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'From Judges 21, which city was struck because it had not come to the assembly before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  4,
  'From Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?',
  '["Four hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Four hundred',
  'Four hundred young virgins from Jabesh Gilead were spared and given to Benjamin (Judges 21:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'From Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  4,
  'From Judges 21, from what festival place were wives taken for the remaining Benjaminites?',
  '["Shiloh", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Shiloh',
  'The remaining Benjaminites took wives from the daughters dancing at Shiloh (Judges 21:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'From Judges 21, from what festival place were wives taken for the remaining Benjaminites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  4,
  'From Judges 21, why did Israel refuse to give daughters directly to Benjamin?',
  '["Because they had sworn an oath", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because they had sworn an oath',
  'Israel had sworn not to give their daughters as wives to Benjamin (Judges 21:1, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'From Judges 21, why did Israel refuse to give daughters directly to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  4,
  'From Judges 21, what repeated statement closes the book of Judges?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The book closes by saying everyone did what was right in his own eyes because there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'From Judges 21, what repeated statement closes the book of Judges?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  4,
  'From Judges 21, what does the ending of Judges emphasize about Israel''s condition?',
  '["There was no king in Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'There was no king in Israel',
  'The final verse emphasizes that there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'From Judges 21, what does the ending of Judges emphasize about Israel''s condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  5,
  'In the events of Judges 21, what problem troubled Israel after the war with Benjamin?',
  '["One tribe was nearly wiped out", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'One tribe was nearly wiped out',
  'Israel grieved because Benjamin was nearly cut off from Israel (Judges 21:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 21, what problem troubled Israel after the war with Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  5,
  'In the events of Judges 21, which city was struck because it had not come to the assembly before the LORD?',
  '["Jabesh Gilead", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Jabesh Gilead',
  'Israel struck Jabesh Gilead because it had not come to the assembly (Judges 21:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 21, which city was struck because it had not come to the assembly before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  5,
  'In the events of Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?',
  '["Four hundred", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Four hundred',
  'Four hundred young virgins from Jabesh Gilead were spared and given to Benjamin (Judges 21:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 21, how many virgins were found at Jabesh Gilead and given to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  5,
  'In the events of Judges 21, from what festival place were wives taken for the remaining Benjaminites?',
  '["Shiloh", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Shiloh',
  'The remaining Benjaminites took wives from the daughters dancing at Shiloh (Judges 21:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 21, from what festival place were wives taken for the remaining Benjaminites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  5,
  'In the events of Judges 21, why did Israel refuse to give daughters directly to Benjamin?',
  '["Because they had sworn an oath", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'Because they had sworn an oath',
  'Israel had sworn not to give their daughters as wives to Benjamin (Judges 21:1, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 21, why did Israel refuse to give daughters directly to Benjamin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  5,
  'In the events of Judges 21, what repeated statement closes the book of Judges?',
  '["\"Everyone did what was right in his own eyes\"", "Springs of water", "Judah", "Simeon"]'::jsonb,
  '"Everyone did what was right in his own eyes"',
  'The book closes by saying everyone did what was right in his own eyes because there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 21, what repeated statement closes the book of Judges?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  7,
  21,
  5,
  'In the events of Judges 21, what does the ending of Judges emphasize about Israel''s condition?',
  '["There was no king in Israel", "Springs of water", "Judah", "Simeon"]'::jsonb,
  'There was no king in Israel',
  'The final verse emphasizes that there was no king in Israel (Judges 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 7
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'In the events of Judges 21, what does the ending of Judges emphasize about Israel''s condition?'
);
