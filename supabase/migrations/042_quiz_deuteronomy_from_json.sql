-- ============================================================================
-- LOGOS LIGHT - Deuteronomy (book 5) quiz questions from quiz-questions/deuteronomy.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 1, 'Who is the main speaker or figure in Deuteronomy 1?', '["Moses", "Og king of Bashan", "the LORD", "false prophets and tempters to idolatry"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 1, 'Which group is most directly addressed or involved in Deuteronomy 1?', '["Israel east of the Jordan", "Reuben, Gad, and half Manasseh", "Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant"]'::jsonb, 'Israel east of the Jordan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 1, 'What place is central in Deuteronomy 1?', '["Horeb", "Bashan", "the land of Sihon king of Heshbon", "the land they were about to enter"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 1, 'What event is described in Deuteronomy 1?', '["the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land", "the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant"]'::jsonb, 'the appointment of judges and the recounting of the rebellion at Kadesh Barnea', 'That is the main event or action described in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 1, 'Which detail appears in Deuteronomy 1?', '["judges were appointed to help bear the burden of leadership", "Og and his cities were defeated", "Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments"]'::jsonb, 'judges were appointed to help bear the burden of leadership', 'That specific detail appears in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 1, 'What other detail is included in Deuteronomy 1?', '["the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan", "Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form"]'::jsonb, 'the people refused to enter the land after the spies'' report', 'That additional detail is included in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 1, 'What outcome is emphasized in Deuteronomy 1?', '["the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest", "Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land"]'::jsonb, 'the wilderness generation was sentenced to die outside the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 2, 'What was one reason given in Deuteronomy 1?', '["the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols"]'::jsonb, 'the people rebelled against the command of the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 2, 'In Deuteronomy 1, what happened as a result of the chapter''s events or commands?', '["the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest", "Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land"]'::jsonb, 'the wilderness generation was sentenced to die outside the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 1, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 2, 'In Deuteronomy 1, what was the people''s situation or setting?', '["Israel east of the Jordan", "Reuben, Gad, and half Manasseh", "Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant"]'::jsonb, 'Israel east of the Jordan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 1, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 2, 'In Deuteronomy 1, which action or event took place?', '["the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land", "the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant"]'::jsonb, 'the appointment of judges and the recounting of the rebellion at Kadesh Barnea', 'That is the main event or action described in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 1, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 2, 'In Deuteronomy 1, which concrete instruction or fact is mentioned?', '["judges were appointed to help bear the burden of leadership", "Og and his cities were defeated", "Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments"]'::jsonb, 'judges were appointed to help bear the burden of leadership', 'That specific detail appears in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 1, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 2, 'In Deuteronomy 1, which additional fact is stated?', '["the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan", "Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form"]'::jsonb, 'the people refused to enter the land after the spies'' report', 'That additional detail is included in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 1, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 2, 'In Deuteronomy 1, what location or setting matters to the chapter?', '["Horeb", "Bashan", "the land of Sihon king of Heshbon", "the land they were about to enter"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 1, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 3, 'What does Deuteronomy 1 say that Moses did or declared?', '["the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land", "the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant"]'::jsonb, 'the appointment of judges and the recounting of the rebellion at Kadesh Barnea', 'That is the main event or action described in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 1 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 3, 'Why was this emphasized in Deuteronomy 1?', '["the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols"]'::jsonb, 'the people rebelled against the command of the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 3, 'What fact in Deuteronomy 1 helps explain the chapter''s message?', '["judges were appointed to help bear the burden of leadership", "Og and his cities were defeated", "Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments"]'::jsonb, 'judges were appointed to help bear the burden of leadership', 'That specific detail appears in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 1 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 3, 'What second fact in Deuteronomy 1 develops the chapter''s message?', '["the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan", "Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form"]'::jsonb, 'the people refused to enter the land after the spies'' report', 'That additional detail is included in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 1 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 3, 'What result in Deuteronomy 1 shows the consequence of obedience or disobedience?', '["the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest", "Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land"]'::jsonb, 'the wilderness generation was sentenced to die outside the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 1 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 3, 'Who is especially in view in Deuteronomy 1?', '["Israel east of the Jordan", "Reuben, Gad, and half Manasseh", "Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant"]'::jsonb, 'Israel east of the Jordan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 3, 'What place or setting frames the action in Deuteronomy 1?', '["Horeb", "Bashan", "the land of Sihon king of Heshbon", "the land they were about to enter"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 4, 'In Deuteronomy 1, what concrete act shows how the covenant was being applied?', '["judges were appointed to help bear the burden of leadership", "Og and his cities were defeated", "Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments"]'::jsonb, 'judges were appointed to help bear the burden of leadership', 'That specific detail appears in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 1, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 4, 'In Deuteronomy 1, what further act or fact supports the chapter''s message?', '["the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan", "Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form"]'::jsonb, 'the people refused to enter the land after the spies'' report', 'That additional detail is included in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 1, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 4, 'What larger event in Deuteronomy 1 gives those details their meaning?', '["the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land", "the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant"]'::jsonb, 'the appointment of judges and the recounting of the rebellion at Kadesh Barnea', 'That is the main event or action described in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 1 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 4, 'What result in Deuteronomy 1 shaped Israel''s future action?', '["the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest", "Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land"]'::jsonb, 'the wilderness generation was sentenced to die outside the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 1 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 4, 'Why did this matter according to Deuteronomy 1?', '["the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols"]'::jsonb, 'the people rebelled against the command of the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 4, 'Who had to respond to these things in Deuteronomy 1?', '["Israel east of the Jordan", "Reuben, Gad, and half Manasseh", "Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant"]'::jsonb, 'Israel east of the Jordan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 4, 'Where is the action or teaching set in Deuteronomy 1?', '["Horeb", "Bashan", "the land of Sihon king of Heshbon", "the land they were about to enter"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 1?', '["the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols"]'::jsonb, 'the people rebelled against the command of the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 5, 'What event in Deuteronomy 1 most clearly carries that message?', '["the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land", "the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant"]'::jsonb, 'the appointment of judges and the recounting of the rebellion at Kadesh Barnea', 'That is the main event or action described in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 1 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 5, 'What detail in Deuteronomy 1 makes that message concrete?', '["judges were appointed to help bear the burden of leadership", "Og and his cities were defeated", "Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments"]'::jsonb, 'judges were appointed to help bear the burden of leadership', 'That specific detail appears in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 1 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 5, 'What additional detail in Deuteronomy 1 sharpens that message?', '["the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan", "Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form"]'::jsonb, 'the people refused to enter the land after the spies'' report', 'That additional detail is included in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 1 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 5, 'What outcome in Deuteronomy 1 gives the chapter lasting force?', '["the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest", "Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land"]'::jsonb, 'the wilderness generation was sentenced to die outside the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 1 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 5, 'Who stands under that message in Deuteronomy 1?', '["Israel east of the Jordan", "Reuben, Gad, and half Manasseh", "Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant"]'::jsonb, 'Israel east of the Jordan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 1, 5, 'What setting in Deuteronomy 1 helps anchor the message?', '["Horeb", "Bashan", "the land of Sihon king of Heshbon", "the land they were about to enter"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 1:9-18, 26-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 1 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 1, 'Who is the main speaker or figure in Deuteronomy 2?', '["the LORD", "Moses", "Og king of Bashan", "false prophets and tempters to idolatry"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 1, 'Which group is most directly addressed or involved in Deuteronomy 2?', '["Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant", "Reuben, Gad, and half Manasseh", "the covenant assembly"]'::jsonb, 'Israel passing by Edom, Moab, and Ammon', 'That group is directly addressed or involved in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 1, 'What place is central in Deuteronomy 2?', '["the land of Sihon king of Heshbon", "Horeb", "Bashan", "the land they were about to enter"]'::jsonb, 'the land of Sihon king of Heshbon', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 1, 'What event is described in Deuteronomy 2?', '["the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant", "the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments"]'::jsonb, 'the wilderness route around related nations and the defeat of Sihon', 'That is the main event or action described in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 1, 'Which detail appears in Deuteronomy 2?', '["Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments", "Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt"]'::jsonb, 'Israel was told not to fight Edom, Moab, or Ammon', 'That specific detail appears in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 1, 'What other detail is included in Deuteronomy 2?', '["Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form", "the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice"]'::jsonb, 'Sihon refused passage and was defeated', 'That additional detail is included in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 1, 'What outcome is emphasized in Deuteronomy 2?', '["Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land", "Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded"]'::jsonb, 'Israel received Sihon''s land east of the Jordan', 'That is the outcome emphasized in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 2, 'What was one reason given in Deuteronomy 2?', '["the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols", "the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant"]'::jsonb, 'the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 2, 'In Deuteronomy 2, what happened as a result of the chapter''s events or commands?', '["Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land", "Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded"]'::jsonb, 'Israel received Sihon''s land east of the Jordan', 'That is the outcome emphasized in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 2, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 2, 'In Deuteronomy 2, what was the people''s situation or setting?', '["Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant", "Reuben, Gad, and half Manasseh", "the covenant assembly"]'::jsonb, 'Israel passing by Edom, Moab, and Ammon', 'That group is directly addressed or involved in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 2, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 2, 'In Deuteronomy 2, which action or event took place?', '["the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant", "the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments"]'::jsonb, 'the wilderness route around related nations and the defeat of Sihon', 'That is the main event or action described in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 2, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 2, 'In Deuteronomy 2, which concrete instruction or fact is mentioned?', '["Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments", "Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt"]'::jsonb, 'Israel was told not to fight Edom, Moab, or Ammon', 'That specific detail appears in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 2, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 2, 'In Deuteronomy 2, which additional fact is stated?', '["Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form", "the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice"]'::jsonb, 'Sihon refused passage and was defeated', 'That additional detail is included in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 2, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 2, 'In Deuteronomy 2, what location or setting matters to the chapter?', '["the land of Sihon king of Heshbon", "Horeb", "Bashan", "the land they were about to enter"]'::jsonb, 'the land of Sihon king of Heshbon', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 2, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 3, 'What does Deuteronomy 2 say that the LORD did or declared?', '["the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant", "the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments"]'::jsonb, 'the wilderness route around related nations and the defeat of Sihon', 'That is the main event or action described in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 2 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 3, 'Why was this emphasized in Deuteronomy 2?', '["the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols", "the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant"]'::jsonb, 'the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 3, 'What fact in Deuteronomy 2 helps explain the chapter''s message?', '["Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments", "Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt"]'::jsonb, 'Israel was told not to fight Edom, Moab, or Ammon', 'That specific detail appears in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 2 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 3, 'What second fact in Deuteronomy 2 develops the chapter''s message?', '["Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form", "the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice"]'::jsonb, 'Sihon refused passage and was defeated', 'That additional detail is included in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 2 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 3, 'What result in Deuteronomy 2 shows the consequence of obedience or disobedience?', '["Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land", "Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded"]'::jsonb, 'Israel received Sihon''s land east of the Jordan', 'That is the outcome emphasized in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 2 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 3, 'Who is especially in view in Deuteronomy 2?', '["Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant", "Reuben, Gad, and half Manasseh", "the covenant assembly"]'::jsonb, 'Israel passing by Edom, Moab, and Ammon', 'That group is directly addressed or involved in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 3, 'What place or setting frames the action in Deuteronomy 2?', '["the land of Sihon king of Heshbon", "Horeb", "Bashan", "the land they were about to enter"]'::jsonb, 'the land of Sihon king of Heshbon', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 4, 'In Deuteronomy 2, what concrete act shows how the covenant was being applied?', '["Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments", "Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt"]'::jsonb, 'Israel was told not to fight Edom, Moab, or Ammon', 'That specific detail appears in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 2, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 4, 'In Deuteronomy 2, what further act or fact supports the chapter''s message?', '["Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form", "the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice"]'::jsonb, 'Sihon refused passage and was defeated', 'That additional detail is included in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 2, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 4, 'What larger event in Deuteronomy 2 gives those details their meaning?', '["the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant", "the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments"]'::jsonb, 'the wilderness route around related nations and the defeat of Sihon', 'That is the main event or action described in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 2 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 4, 'What result in Deuteronomy 2 shaped Israel''s future action?', '["Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land", "Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded"]'::jsonb, 'Israel received Sihon''s land east of the Jordan', 'That is the outcome emphasized in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 2 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 4, 'Why did this matter according to Deuteronomy 2?', '["the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols", "the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant"]'::jsonb, 'the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 4, 'Who had to respond to these things in Deuteronomy 2?', '["Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant", "Reuben, Gad, and half Manasseh", "the covenant assembly"]'::jsonb, 'Israel passing by Edom, Moab, and Ammon', 'That group is directly addressed or involved in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 4, 'Where is the action or teaching set in Deuteronomy 2?', '["the land of Sihon king of Heshbon", "Horeb", "Bashan", "the land they were about to enter"]'::jsonb, 'the land of Sihon king of Heshbon', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 2?', '["the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the unseen God must not be represented by idols", "the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant"]'::jsonb, 'the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 5, 'What event in Deuteronomy 2 most clearly carries that message?', '["the wilderness route around related nations and the defeat of Sihon", "the warning against idolatry and forgetting the covenant", "the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments"]'::jsonb, 'the wilderness route around related nations and the defeat of Sihon', 'That is the main event or action described in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 2 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 5, 'What detail in Deuteronomy 2 makes that message concrete?', '["Israel was told not to fight Edom, Moab, or Ammon", "Israel was told not to add to or subtract from God''s commandments", "Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt"]'::jsonb, 'Israel was told not to fight Edom, Moab, or Ammon', 'That specific detail appears in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 2 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 5, 'What additional detail in Deuteronomy 2 sharpens that message?', '["Sihon refused passage and was defeated", "the people heard a voice at Horeb but saw no form", "the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice"]'::jsonb, 'Sihon refused passage and was defeated', 'That additional detail is included in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 2 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 5, 'What outcome in Deuteronomy 2 gives the chapter lasting force?', '["Israel received Sihon''s land east of the Jordan", "obedience was tied to life and remaining in the land", "Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded"]'::jsonb, 'Israel received Sihon''s land east of the Jordan', 'That is the outcome emphasized in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 2 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 5, 'Who stands under that message in Deuteronomy 2?', '["Israel passing by Edom, Moab, and Ammon", "Israel hearing the statutes of the covenant", "Reuben, Gad, and half Manasseh", "the covenant assembly"]'::jsonb, 'Israel passing by Edom, Moab, and Ammon', 'That group is directly addressed or involved in the chapter. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 2, 5, 'What setting in Deuteronomy 2 helps anchor the message?', '["the land of Sihon king of Heshbon", "Horeb", "Bashan", "the land they were about to enter"]'::jsonb, 'the land of Sihon king of Heshbon', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 2:4-5, 9, 19, 24-36)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 2 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 1, 'Who is the main speaker or figure in Deuteronomy 3?', '["Og king of Bashan", "the LORD", "Moses", "false prophets and tempters to idolatry"]'::jsonb, 'Og king of Bashan', 'Og king of Bashan is central in this chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 1, 'Which group is most directly addressed or involved in Deuteronomy 3?', '["Reuben, Gad, and half Manasseh", "the covenant assembly", "Israel hearing the statutes of the covenant", "Israelite households"]'::jsonb, 'Reuben, Gad, and half Manasseh', 'That group is directly addressed or involved in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 1, 'What place is central in Deuteronomy 3?', '["Bashan", "the land they were about to enter", "Horeb", "Canaan"]'::jsonb, 'Bashan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 1, 'What event is described in Deuteronomy 3?', '["the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments", "the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart"]'::jsonb, 'the defeat of Og and the distribution of Transjordan land', 'That is the main event or action described in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 1, 'Which detail appears in Deuteronomy 3?', '["Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt", "Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one"]'::jsonb, 'Og and his cities were defeated', 'That specific detail appears in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 1, 'What other detail is included in Deuteronomy 3?', '["the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice", "the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children"]'::jsonb, 'the eastern tribes received land east of the Jordan', 'That additional detail is included in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 1, 'What outcome is emphasized in Deuteronomy 3?', '["Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded", "obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity"]'::jsonb, 'Joshua was encouraged for the coming conquest', 'That is the outcome emphasized in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 2, 'What was one reason given in Deuteronomy 3?', '["the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant", "the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness"]'::jsonb, 'the LORD had already given powerful kings into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 2, 'In Deuteronomy 3, what happened as a result of the chapter''s events or commands?', '["Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded", "obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity"]'::jsonb, 'Joshua was encouraged for the coming conquest', 'That is the outcome emphasized in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 3, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 2, 'In Deuteronomy 3, what was the people''s situation or setting?', '["Reuben, Gad, and half Manasseh", "the covenant assembly", "Israel hearing the statutes of the covenant", "Israelite households"]'::jsonb, 'Reuben, Gad, and half Manasseh', 'That group is directly addressed or involved in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 3, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 2, 'In Deuteronomy 3, which action or event took place?', '["the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments", "the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart"]'::jsonb, 'the defeat of Og and the distribution of Transjordan land', 'That is the main event or action described in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 3, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 2, 'In Deuteronomy 3, which concrete instruction or fact is mentioned?', '["Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt", "Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one"]'::jsonb, 'Og and his cities were defeated', 'That specific detail appears in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 3, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 2, 'In Deuteronomy 3, which additional fact is stated?', '["the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice", "the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children"]'::jsonb, 'the eastern tribes received land east of the Jordan', 'That additional detail is included in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 3, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 2, 'In Deuteronomy 3, what location or setting matters to the chapter?', '["Bashan", "the land they were about to enter", "Horeb", "Canaan"]'::jsonb, 'Bashan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 3, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 3, 'What does Deuteronomy 3 say that Og king of Bashan did or declared?', '["the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments", "the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart"]'::jsonb, 'the defeat of Og and the distribution of Transjordan land', 'That is the main event or action described in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 3 say that Og king of Bashan did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 3, 'Why was this emphasized in Deuteronomy 3?', '["the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant", "the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness"]'::jsonb, 'the LORD had already given powerful kings into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 3, 'What fact in Deuteronomy 3 helps explain the chapter''s message?', '["Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt", "Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one"]'::jsonb, 'Og and his cities were defeated', 'That specific detail appears in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 3 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 3, 'What second fact in Deuteronomy 3 develops the chapter''s message?', '["the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice", "the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children"]'::jsonb, 'the eastern tribes received land east of the Jordan', 'That additional detail is included in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 3 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 3, 'What result in Deuteronomy 3 shows the consequence of obedience or disobedience?', '["Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded", "obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity"]'::jsonb, 'Joshua was encouraged for the coming conquest', 'That is the outcome emphasized in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 3 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 3, 'Who is especially in view in Deuteronomy 3?', '["Reuben, Gad, and half Manasseh", "the covenant assembly", "Israel hearing the statutes of the covenant", "Israelite households"]'::jsonb, 'Reuben, Gad, and half Manasseh', 'That group is directly addressed or involved in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 3, 'What place or setting frames the action in Deuteronomy 3?', '["Bashan", "the land they were about to enter", "Horeb", "Canaan"]'::jsonb, 'Bashan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 4, 'In Deuteronomy 3, what concrete act shows how the covenant was being applied?', '["Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt", "Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one"]'::jsonb, 'Og and his cities were defeated', 'That specific detail appears in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 3, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 4, 'In Deuteronomy 3, what further act or fact supports the chapter''s message?', '["the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice", "the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children"]'::jsonb, 'the eastern tribes received land east of the Jordan', 'That additional detail is included in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 3, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 4, 'What larger event in Deuteronomy 3 gives those details their meaning?', '["the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments", "the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart"]'::jsonb, 'the defeat of Og and the distribution of Transjordan land', 'That is the main event or action described in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 3 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 4, 'What result in Deuteronomy 3 shaped Israel''s future action?', '["Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded", "obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity"]'::jsonb, 'Joshua was encouraged for the coming conquest', 'That is the outcome emphasized in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 3 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 4, 'Why did this matter according to Deuteronomy 3?', '["the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant", "the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness"]'::jsonb, 'the LORD had already given powerful kings into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 4, 'Who had to respond to these things in Deuteronomy 3?', '["Reuben, Gad, and half Manasseh", "the covenant assembly", "Israel hearing the statutes of the covenant", "Israelite households"]'::jsonb, 'Reuben, Gad, and half Manasseh', 'That group is directly addressed or involved in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 4, 'Where is the action or teaching set in Deuteronomy 3?', '["Bashan", "the land they were about to enter", "Horeb", "Canaan"]'::jsonb, 'Bashan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 3?', '["the LORD had already given powerful kings into Israel''s hand", "God had redeemed them and bound them to His covenant", "the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness"]'::jsonb, 'the LORD had already given powerful kings into Israel''s hand', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 5, 'What event in Deuteronomy 3 most clearly carries that message?', '["the defeat of Og and the distribution of Transjordan land", "the repetition of the Ten Commandments", "the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart"]'::jsonb, 'the defeat of Og and the distribution of Transjordan land', 'That is the main event or action described in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 3 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 5, 'What detail in Deuteronomy 3 makes that message concrete?', '["Og and his cities were defeated", "the Sabbath command includes remembering deliverance from Egypt", "Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one"]'::jsonb, 'Og and his cities were defeated', 'That specific detail appears in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 3 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 5, 'What additional detail in Deuteronomy 3 sharpens that message?', '["the eastern tribes received land east of the Jordan", "the people asked for a mediator because they feared God''s voice", "the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children"]'::jsonb, 'the eastern tribes received land east of the Jordan', 'That additional detail is included in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 3 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 5, 'What outcome in Deuteronomy 3 gives the chapter lasting force?', '["Joshua was encouraged for the coming conquest", "Israel was charged to walk in all the way the LORD commanded", "obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity"]'::jsonb, 'Joshua was encouraged for the coming conquest', 'That is the outcome emphasized in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 3 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 5, 'Who stands under that message in Deuteronomy 3?', '["Reuben, Gad, and half Manasseh", "the covenant assembly", "Israel hearing the statutes of the covenant", "Israelite households"]'::jsonb, 'Reuben, Gad, and half Manasseh', 'That group is directly addressed or involved in the chapter. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 3, 5, 'What setting in Deuteronomy 3 helps anchor the message?', '["Bashan", "the land they were about to enter", "Horeb", "Canaan"]'::jsonb, 'Bashan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 3:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 3 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 1, 'Who is the main speaker or figure in Deuteronomy 4?', '["Moses", "false prophets and tempters to idolatry", "the LORD", "the king and the judges"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 1, 'Which group is most directly addressed or involved in Deuteronomy 4?', '["Israel hearing the statutes of the covenant", "Israelite households", "the covenant assembly", "Israel facing the nations of Canaan"]'::jsonb, 'Israel hearing the statutes of the covenant', 'That group is directly addressed or involved in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 1, 'What place is central in Deuteronomy 4?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 1, 'What event is described in Deuteronomy 4?', '["the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart", "the repetition of the Ten Commandments", "the command to remain separate from the nations"]'::jsonb, 'the warning against idolatry and forgetting the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 1, 'Which detail appears in Deuteronomy 4?', '["Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one", "the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations"]'::jsonb, 'Israel was told not to add to or subtract from God''s commandments', 'That specific detail appears in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 1, 'What other detail is included in Deuteronomy 4?', '["the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children", "the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned"]'::jsonb, 'the people heard a voice at Horeb but saw no form', 'That additional detail is included in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 1, 'What outcome is emphasized in Deuteronomy 4?', '["obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity", "Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath"]'::jsonb, 'obedience was tied to life and remaining in the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 2, 'What was one reason given in Deuteronomy 4?', '["the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness", "God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD"]'::jsonb, 'the unseen God must not be represented by idols', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 2, 'In Deuteronomy 4, what happened as a result of the chapter''s events or commands?', '["obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity", "Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath"]'::jsonb, 'obedience was tied to life and remaining in the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 4, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 2, 'In Deuteronomy 4, what was the people''s situation or setting?', '["Israel hearing the statutes of the covenant", "Israelite households", "the covenant assembly", "Israel facing the nations of Canaan"]'::jsonb, 'Israel hearing the statutes of the covenant', 'That group is directly addressed or involved in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 4, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 2, 'In Deuteronomy 4, which action or event took place?', '["the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart", "the repetition of the Ten Commandments", "the command to remain separate from the nations"]'::jsonb, 'the warning against idolatry and forgetting the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 4, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 2, 'In Deuteronomy 4, which concrete instruction or fact is mentioned?', '["Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one", "the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations"]'::jsonb, 'Israel was told not to add to or subtract from God''s commandments', 'That specific detail appears in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 4, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 2, 'In Deuteronomy 4, which additional fact is stated?', '["the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children", "the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned"]'::jsonb, 'the people heard a voice at Horeb but saw no form', 'That additional detail is included in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 4, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 2, 'In Deuteronomy 4, what location or setting matters to the chapter?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 4, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 3, 'What does Deuteronomy 4 say that Moses did or declared?', '["the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart", "the repetition of the Ten Commandments", "the command to remain separate from the nations"]'::jsonb, 'the warning against idolatry and forgetting the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 4 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 3, 'Why was this emphasized in Deuteronomy 4?', '["the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness", "God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD"]'::jsonb, 'the unseen God must not be represented by idols', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 3, 'What fact in Deuteronomy 4 helps explain the chapter''s message?', '["Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one", "the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations"]'::jsonb, 'Israel was told not to add to or subtract from God''s commandments', 'That specific detail appears in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 4 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 3, 'What second fact in Deuteronomy 4 develops the chapter''s message?', '["the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children", "the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned"]'::jsonb, 'the people heard a voice at Horeb but saw no form', 'That additional detail is included in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 4 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 3, 'What result in Deuteronomy 4 shows the consequence of obedience or disobedience?', '["obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity", "Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath"]'::jsonb, 'obedience was tied to life and remaining in the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 4 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 3, 'Who is especially in view in Deuteronomy 4?', '["Israel hearing the statutes of the covenant", "Israelite households", "the covenant assembly", "Israel facing the nations of Canaan"]'::jsonb, 'Israel hearing the statutes of the covenant', 'That group is directly addressed or involved in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 3, 'What place or setting frames the action in Deuteronomy 4?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 4, 'In Deuteronomy 4, what concrete act shows how the covenant was being applied?', '["Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one", "the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations"]'::jsonb, 'Israel was told not to add to or subtract from God''s commandments', 'That specific detail appears in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 4, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 4, 'In Deuteronomy 4, what further act or fact supports the chapter''s message?', '["the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children", "the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned"]'::jsonb, 'the people heard a voice at Horeb but saw no form', 'That additional detail is included in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 4, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 4, 'What larger event in Deuteronomy 4 gives those details their meaning?', '["the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart", "the repetition of the Ten Commandments", "the command to remain separate from the nations"]'::jsonb, 'the warning against idolatry and forgetting the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 4 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 4, 'What result in Deuteronomy 4 shaped Israel''s future action?', '["obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity", "Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath"]'::jsonb, 'obedience was tied to life and remaining in the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 4 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 4, 'Why did this matter according to Deuteronomy 4?', '["the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness", "God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD"]'::jsonb, 'the unseen God must not be represented by idols', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 4, 'Who had to respond to these things in Deuteronomy 4?', '["Israel hearing the statutes of the covenant", "Israelite households", "the covenant assembly", "Israel facing the nations of Canaan"]'::jsonb, 'Israel hearing the statutes of the covenant', 'That group is directly addressed or involved in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 4, 'Where is the action or teaching set in Deuteronomy 4?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 4?', '["the unseen God must not be represented by idols", "whole-life devotion guards against covenant forgetfulness", "God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD"]'::jsonb, 'the unseen God must not be represented by idols', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 5, 'What event in Deuteronomy 4 most clearly carries that message?', '["the warning against idolatry and forgetting the covenant", "the command to love the LORD with all the heart", "the repetition of the Ten Commandments", "the command to remain separate from the nations"]'::jsonb, 'the warning against idolatry and forgetting the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 4 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 5, 'What detail in Deuteronomy 4 makes that message concrete?', '["Israel was told not to add to or subtract from God''s commandments", "the Shema declares that the LORD is one", "the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations"]'::jsonb, 'Israel was told not to add to or subtract from God''s commandments', 'That specific detail appears in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 4 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 5, 'What additional detail in Deuteronomy 4 sharpens that message?', '["the people heard a voice at Horeb but saw no form", "God''s words were to be taught diligently to children", "the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned"]'::jsonb, 'the people heard a voice at Horeb but saw no form', 'That additional detail is included in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 4 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 5, 'What outcome in Deuteronomy 4 gives the chapter lasting force?', '["obedience was tied to life and remaining in the land", "Israel was warned not to forget the LORD in prosperity", "Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath"]'::jsonb, 'obedience was tied to life and remaining in the land', 'That is the outcome emphasized in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 4 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 5, 'Who stands under that message in Deuteronomy 4?', '["Israel hearing the statutes of the covenant", "Israelite households", "the covenant assembly", "Israel facing the nations of Canaan"]'::jsonb, 'Israel hearing the statutes of the covenant', 'That group is directly addressed or involved in the chapter. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 4, 5, 'What setting in Deuteronomy 4 helps anchor the message?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 4:2, 12-19, 39-40)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 4 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 1, 'Who is the main speaker or figure in Deuteronomy 5?', '["Moses", "false prophets and tempters to idolatry", "the LORD", "the king and the judges"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 1, 'Which group is most directly addressed or involved in Deuteronomy 5?', '["the covenant assembly", "Israel facing the nations of Canaan", "Israelite households", "Israel in the wilderness and in the good land"]'::jsonb, 'the covenant assembly', 'That group is directly addressed or involved in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 1, 'What place is central in Deuteronomy 5?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 1, 'What event is described in Deuteronomy 5?', '["the repetition of the Ten Commandments", "the command to remain separate from the nations", "the command to love the LORD with all the heart", "the warning not to forget God in prosperity"]'::jsonb, 'the repetition of the Ten Commandments', 'That is the main event or action described in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 1, 'Which detail appears in Deuteronomy 5?', '["the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations", "the Shema declares that the LORD is one", "God fed Israel with manna"]'::jsonb, 'the Sabbath command includes remembering deliverance from Egypt', 'That specific detail appears in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 1, 'What other detail is included in Deuteronomy 5?', '["the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned", "God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth"]'::jsonb, 'the people asked for a mediator because they feared God''s voice', 'That additional detail is included in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 1, 'What outcome is emphasized in Deuteronomy 5?', '["Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath", "Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing"]'::jsonb, 'Israel was charged to walk in all the way the LORD commanded', 'That is the outcome emphasized in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 2, 'What was one reason given in Deuteronomy 5?', '["God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD", "whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God"]'::jsonb, 'God had redeemed them and bound them to His covenant', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 2, 'In Deuteronomy 5, what happened as a result of the chapter''s events or commands?', '["Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath", "Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing"]'::jsonb, 'Israel was charged to walk in all the way the LORD commanded', 'That is the outcome emphasized in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 5, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 2, 'In Deuteronomy 5, what was the people''s situation or setting?', '["the covenant assembly", "Israel facing the nations of Canaan", "Israelite households", "Israel in the wilderness and in the good land"]'::jsonb, 'the covenant assembly', 'That group is directly addressed or involved in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 5, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 2, 'In Deuteronomy 5, which action or event took place?', '["the repetition of the Ten Commandments", "the command to remain separate from the nations", "the command to love the LORD with all the heart", "the warning not to forget God in prosperity"]'::jsonb, 'the repetition of the Ten Commandments', 'That is the main event or action described in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 5, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 2, 'In Deuteronomy 5, which concrete instruction or fact is mentioned?', '["the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations", "the Shema declares that the LORD is one", "God fed Israel with manna"]'::jsonb, 'the Sabbath command includes remembering deliverance from Egypt', 'That specific detail appears in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 5, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 2, 'In Deuteronomy 5, which additional fact is stated?', '["the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned", "God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth"]'::jsonb, 'the people asked for a mediator because they feared God''s voice', 'That additional detail is included in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 5, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 2, 'In Deuteronomy 5, what location or setting matters to the chapter?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 5, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 3, 'What does Deuteronomy 5 say that Moses did or declared?', '["the repetition of the Ten Commandments", "the command to remain separate from the nations", "the command to love the LORD with all the heart", "the warning not to forget God in prosperity"]'::jsonb, 'the repetition of the Ten Commandments', 'That is the main event or action described in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 5 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 3, 'Why was this emphasized in Deuteronomy 5?', '["God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD", "whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God"]'::jsonb, 'God had redeemed them and bound them to His covenant', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 3, 'What fact in Deuteronomy 5 helps explain the chapter''s message?', '["the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations", "the Shema declares that the LORD is one", "God fed Israel with manna"]'::jsonb, 'the Sabbath command includes remembering deliverance from Egypt', 'That specific detail appears in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 5 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 3, 'What second fact in Deuteronomy 5 develops the chapter''s message?', '["the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned", "God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth"]'::jsonb, 'the people asked for a mediator because they feared God''s voice', 'That additional detail is included in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 5 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 3, 'What result in Deuteronomy 5 shows the consequence of obedience or disobedience?', '["Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath", "Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing"]'::jsonb, 'Israel was charged to walk in all the way the LORD commanded', 'That is the outcome emphasized in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 5 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 3, 'Who is especially in view in Deuteronomy 5?', '["the covenant assembly", "Israel facing the nations of Canaan", "Israelite households", "Israel in the wilderness and in the good land"]'::jsonb, 'the covenant assembly', 'That group is directly addressed or involved in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 3, 'What place or setting frames the action in Deuteronomy 5?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 4, 'In Deuteronomy 5, what concrete act shows how the covenant was being applied?', '["the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations", "the Shema declares that the LORD is one", "God fed Israel with manna"]'::jsonb, 'the Sabbath command includes remembering deliverance from Egypt', 'That specific detail appears in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 5, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 4, 'In Deuteronomy 5, what further act or fact supports the chapter''s message?', '["the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned", "God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth"]'::jsonb, 'the people asked for a mediator because they feared God''s voice', 'That additional detail is included in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 5, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 4, 'What larger event in Deuteronomy 5 gives those details their meaning?', '["the repetition of the Ten Commandments", "the command to remain separate from the nations", "the command to love the LORD with all the heart", "the warning not to forget God in prosperity"]'::jsonb, 'the repetition of the Ten Commandments', 'That is the main event or action described in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 5 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 4, 'What result in Deuteronomy 5 shaped Israel''s future action?', '["Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath", "Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing"]'::jsonb, 'Israel was charged to walk in all the way the LORD commanded', 'That is the outcome emphasized in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 5 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 4, 'Why did this matter according to Deuteronomy 5?', '["God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD", "whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God"]'::jsonb, 'God had redeemed them and bound them to His covenant', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 4, 'Who had to respond to these things in Deuteronomy 5?', '["the covenant assembly", "Israel facing the nations of Canaan", "Israelite households", "Israel in the wilderness and in the good land"]'::jsonb, 'the covenant assembly', 'That group is directly addressed or involved in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 4, 'Where is the action or teaching set in Deuteronomy 5?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 5?', '["God had redeemed them and bound them to His covenant", "foreign worship would turn hearts away from the LORD", "whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God"]'::jsonb, 'God had redeemed them and bound them to His covenant', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 5, 'What event in Deuteronomy 5 most clearly carries that message?', '["the repetition of the Ten Commandments", "the command to remain separate from the nations", "the command to love the LORD with all the heart", "the warning not to forget God in prosperity"]'::jsonb, 'the repetition of the Ten Commandments', 'That is the main event or action described in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 5 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 5, 'What detail in Deuteronomy 5 makes that message concrete?', '["the Sabbath command includes remembering deliverance from Egypt", "Israel was forbidden to intermarry with the nations", "the Shema declares that the LORD is one", "God fed Israel with manna"]'::jsonb, 'the Sabbath command includes remembering deliverance from Egypt', 'That specific detail appears in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 5 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 5, 'What additional detail in Deuteronomy 5 sharpens that message?', '["the people asked for a mediator because they feared God''s voice", "the graven images of the nations were to be burned", "God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth"]'::jsonb, 'the people asked for a mediator because they feared God''s voice', 'That additional detail is included in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 5 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 5, 'What outcome in Deuteronomy 5 gives the chapter lasting force?', '["Israel was charged to walk in all the way the LORD commanded", "Israel was reminded that God chose them because of His love and oath", "Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing"]'::jsonb, 'Israel was charged to walk in all the way the LORD commanded', 'That is the outcome emphasized in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 5 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 5, 'Who stands under that message in Deuteronomy 5?', '["the covenant assembly", "Israel facing the nations of Canaan", "Israelite households", "Israel in the wilderness and in the good land"]'::jsonb, 'the covenant assembly', 'That group is directly addressed or involved in the chapter. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 5, 5, 'What setting in Deuteronomy 5 helps anchor the message?', '["Horeb", "Canaan", "the land they were about to enter", "the wilderness"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 5:6-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 5 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 1, 'Who is the main speaker or figure in Deuteronomy 6?', '["the LORD", "false prophets and tempters to idolatry", "Moses", "the king and the judges"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 1, 'Which group is most directly addressed or involved in Deuteronomy 6?', '["Israelite households", "Israel in the wilderness and in the good land", "Israel facing the nations of Canaan", "Israel described as stubborn before the LORD"]'::jsonb, 'Israelite households', 'That group is directly addressed or involved in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 1, 'What place is central in Deuteronomy 6?', '["the land they were about to enter", "the wilderness", "Canaan", "Horeb"]'::jsonb, 'the land they were about to enter', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 1, 'What event is described in Deuteronomy 6?', '["the command to love the LORD with all the heart", "the warning not to forget God in prosperity", "the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf"]'::jsonb, 'the command to love the LORD with all the heart', 'That is the main event or action described in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 1, 'Which detail appears in Deuteronomy 6?', '["the Shema declares that the LORD is one", "God fed Israel with manna", "Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion"]'::jsonb, 'the Shema declares that the LORD is one', 'That specific detail appears in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 1, 'What other detail is included in Deuteronomy 6?', '["God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth", "the graven images of the nations were to be burned", "Moses interceded after breaking the tablets"]'::jsonb, 'God''s words were to be taught diligently to children', 'That additional detail is included in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 1, 'What outcome is emphasized in Deuteronomy 6?', '["Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing", "Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness"]'::jsonb, 'Israel was warned not to forget the LORD in prosperity', 'That is the outcome emphasized in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 2, 'What was one reason given in Deuteronomy 6?', '["whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God", "foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness"]'::jsonb, 'whole-life devotion guards against covenant forgetfulness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 2, 'In Deuteronomy 6, what happened as a result of the chapter''s events or commands?', '["Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing", "Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness"]'::jsonb, 'Israel was warned not to forget the LORD in prosperity', 'That is the outcome emphasized in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 6, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 2, 'In Deuteronomy 6, what was the people''s situation or setting?', '["Israelite households", "Israel in the wilderness and in the good land", "Israel facing the nations of Canaan", "Israel described as stubborn before the LORD"]'::jsonb, 'Israelite households', 'That group is directly addressed or involved in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 6, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 2, 'In Deuteronomy 6, which action or event took place?', '["the command to love the LORD with all the heart", "the warning not to forget God in prosperity", "the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf"]'::jsonb, 'the command to love the LORD with all the heart', 'That is the main event or action described in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 6, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 2, 'In Deuteronomy 6, which concrete instruction or fact is mentioned?', '["the Shema declares that the LORD is one", "God fed Israel with manna", "Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion"]'::jsonb, 'the Shema declares that the LORD is one', 'That specific detail appears in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 6, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 2, 'In Deuteronomy 6, which additional fact is stated?', '["God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth", "the graven images of the nations were to be burned", "Moses interceded after breaking the tablets"]'::jsonb, 'God''s words were to be taught diligently to children', 'That additional detail is included in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 6, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 2, 'In Deuteronomy 6, what location or setting matters to the chapter?', '["the land they were about to enter", "the wilderness", "Canaan", "Horeb"]'::jsonb, 'the land they were about to enter', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 6, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 3, 'What does Deuteronomy 6 say that the LORD did or declared?', '["the command to love the LORD with all the heart", "the warning not to forget God in prosperity", "the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf"]'::jsonb, 'the command to love the LORD with all the heart', 'That is the main event or action described in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 6 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 3, 'Why was this emphasized in Deuteronomy 6?', '["whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God", "foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness"]'::jsonb, 'whole-life devotion guards against covenant forgetfulness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 3, 'What fact in Deuteronomy 6 helps explain the chapter''s message?', '["the Shema declares that the LORD is one", "God fed Israel with manna", "Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion"]'::jsonb, 'the Shema declares that the LORD is one', 'That specific detail appears in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 6 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 3, 'What second fact in Deuteronomy 6 develops the chapter''s message?', '["God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth", "the graven images of the nations were to be burned", "Moses interceded after breaking the tablets"]'::jsonb, 'God''s words were to be taught diligently to children', 'That additional detail is included in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 6 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 3, 'What result in Deuteronomy 6 shows the consequence of obedience or disobedience?', '["Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing", "Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness"]'::jsonb, 'Israel was warned not to forget the LORD in prosperity', 'That is the outcome emphasized in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 6 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 3, 'Who is especially in view in Deuteronomy 6?', '["Israelite households", "Israel in the wilderness and in the good land", "Israel facing the nations of Canaan", "Israel described as stubborn before the LORD"]'::jsonb, 'Israelite households', 'That group is directly addressed or involved in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 3, 'What place or setting frames the action in Deuteronomy 6?', '["the land they were about to enter", "the wilderness", "Canaan", "Horeb"]'::jsonb, 'the land they were about to enter', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 4, 'In Deuteronomy 6, what concrete act shows how the covenant was being applied?', '["the Shema declares that the LORD is one", "God fed Israel with manna", "Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion"]'::jsonb, 'the Shema declares that the LORD is one', 'That specific detail appears in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 6, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 4, 'In Deuteronomy 6, what further act or fact supports the chapter''s message?', '["God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth", "the graven images of the nations were to be burned", "Moses interceded after breaking the tablets"]'::jsonb, 'God''s words were to be taught diligently to children', 'That additional detail is included in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 6, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 4, 'What larger event in Deuteronomy 6 gives those details their meaning?', '["the command to love the LORD with all the heart", "the warning not to forget God in prosperity", "the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf"]'::jsonb, 'the command to love the LORD with all the heart', 'That is the main event or action described in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 6 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 4, 'What result in Deuteronomy 6 shaped Israel''s future action?', '["Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing", "Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness"]'::jsonb, 'Israel was warned not to forget the LORD in prosperity', 'That is the outcome emphasized in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 6 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 4, 'Why did this matter according to Deuteronomy 6?', '["whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God", "foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness"]'::jsonb, 'whole-life devotion guards against covenant forgetfulness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 4, 'Who had to respond to these things in Deuteronomy 6?', '["Israelite households", "Israel in the wilderness and in the good land", "Israel facing the nations of Canaan", "Israel described as stubborn before the LORD"]'::jsonb, 'Israelite households', 'That group is directly addressed or involved in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 4, 'Where is the action or teaching set in Deuteronomy 6?', '["the land they were about to enter", "the wilderness", "Canaan", "Horeb"]'::jsonb, 'the land they were about to enter', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 6?', '["whole-life devotion guards against covenant forgetfulness", "man does not live by bread alone but by every word from God", "foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness"]'::jsonb, 'whole-life devotion guards against covenant forgetfulness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 5, 'What event in Deuteronomy 6 most clearly carries that message?', '["the command to love the LORD with all the heart", "the warning not to forget God in prosperity", "the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf"]'::jsonb, 'the command to love the LORD with all the heart', 'That is the main event or action described in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 6 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 5, 'What detail in Deuteronomy 6 makes that message concrete?', '["the Shema declares that the LORD is one", "God fed Israel with manna", "Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion"]'::jsonb, 'the Shema declares that the LORD is one', 'That specific detail appears in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 6 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 5, 'What additional detail in Deuteronomy 6 sharpens that message?', '["God''s words were to be taught diligently to children", "Israel was warned not to say that its own power gained wealth", "the graven images of the nations were to be burned", "Moses interceded after breaking the tablets"]'::jsonb, 'God''s words were to be taught diligently to children', 'That additional detail is included in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 6 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 5, 'What outcome in Deuteronomy 6 gives the chapter lasting force?', '["Israel was warned not to forget the LORD in prosperity", "remembering the LORD would preserve covenant blessing", "Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness"]'::jsonb, 'Israel was warned not to forget the LORD in prosperity', 'That is the outcome emphasized in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 6 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 5, 'Who stands under that message in Deuteronomy 6?', '["Israelite households", "Israel in the wilderness and in the good land", "Israel facing the nations of Canaan", "Israel described as stubborn before the LORD"]'::jsonb, 'Israelite households', 'That group is directly addressed or involved in the chapter. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 6, 5, 'What setting in Deuteronomy 6 helps anchor the message?', '["the land they were about to enter", "the wilderness", "Canaan", "Horeb"]'::jsonb, 'the land they were about to enter', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 6:4-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 6 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 1, 'Who is the main speaker or figure in Deuteronomy 7?', '["the LORD", "false prophets and tempters to idolatry", "Moses", "the king and the judges"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 1, 'Which group is most directly addressed or involved in Deuteronomy 7?', '["Israel facing the nations of Canaan", "Israel described as stubborn before the LORD", "Israel in the wilderness and in the good land", "Israel under a renewed covenant charge"]'::jsonb, 'Israel facing the nations of Canaan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 1, 'What place is central in Deuteronomy 7?', '["Canaan", "Horeb", "the wilderness", "the ark"]'::jsonb, 'Canaan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 1, 'What event is described in Deuteronomy 7?', '["the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf", "the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD"]'::jsonb, 'the command to remain separate from the nations', 'That is the main event or action described in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 1, 'Which detail appears in Deuteronomy 7?', '["Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion", "God fed Israel with manna", "new stone tablets were placed in the ark"]'::jsonb, 'Israel was forbidden to intermarry with the nations', 'That specific detail appears in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 1, 'What other detail is included in Deuteronomy 7?', '["the graven images of the nations were to be burned", "Moses interceded after breaking the tablets", "Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner"]'::jsonb, 'the graven images of the nations were to be burned', 'That additional detail is included in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 1, 'What outcome is emphasized in Deuteronomy 7?', '["Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness", "remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel"]'::jsonb, 'Israel was reminded that God chose them because of His love and oath', 'That is the outcome emphasized in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 2, 'What was one reason given in Deuteronomy 7?', '["foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness", "man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality"]'::jsonb, 'foreign worship would turn hearts away from the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 2, 'In Deuteronomy 7, what happened as a result of the chapter''s events or commands?', '["Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness", "remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel"]'::jsonb, 'Israel was reminded that God chose them because of His love and oath', 'That is the outcome emphasized in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 7, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 2, 'In Deuteronomy 7, what was the people''s situation or setting?', '["Israel facing the nations of Canaan", "Israel described as stubborn before the LORD", "Israel in the wilderness and in the good land", "Israel under a renewed covenant charge"]'::jsonb, 'Israel facing the nations of Canaan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 7, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 2, 'In Deuteronomy 7, which action or event took place?', '["the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf", "the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD"]'::jsonb, 'the command to remain separate from the nations', 'That is the main event or action described in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 7, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 2, 'In Deuteronomy 7, which concrete instruction or fact is mentioned?', '["Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion", "God fed Israel with manna", "new stone tablets were placed in the ark"]'::jsonb, 'Israel was forbidden to intermarry with the nations', 'That specific detail appears in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 7, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 2, 'In Deuteronomy 7, which additional fact is stated?', '["the graven images of the nations were to be burned", "Moses interceded after breaking the tablets", "Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner"]'::jsonb, 'the graven images of the nations were to be burned', 'That additional detail is included in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 7, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 2, 'In Deuteronomy 7, what location or setting matters to the chapter?', '["Canaan", "Horeb", "the wilderness", "the ark"]'::jsonb, 'Canaan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 7, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 3, 'What does Deuteronomy 7 say that the LORD did or declared?', '["the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf", "the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD"]'::jsonb, 'the command to remain separate from the nations', 'That is the main event or action described in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 7 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 3, 'Why was this emphasized in Deuteronomy 7?', '["foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness", "man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality"]'::jsonb, 'foreign worship would turn hearts away from the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 3, 'What fact in Deuteronomy 7 helps explain the chapter''s message?', '["Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion", "God fed Israel with manna", "new stone tablets were placed in the ark"]'::jsonb, 'Israel was forbidden to intermarry with the nations', 'That specific detail appears in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 7 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 3, 'What second fact in Deuteronomy 7 develops the chapter''s message?', '["the graven images of the nations were to be burned", "Moses interceded after breaking the tablets", "Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner"]'::jsonb, 'the graven images of the nations were to be burned', 'That additional detail is included in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 7 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 3, 'What result in Deuteronomy 7 shows the consequence of obedience or disobedience?', '["Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness", "remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel"]'::jsonb, 'Israel was reminded that God chose them because of His love and oath', 'That is the outcome emphasized in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 7 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 3, 'Who is especially in view in Deuteronomy 7?', '["Israel facing the nations of Canaan", "Israel described as stubborn before the LORD", "Israel in the wilderness and in the good land", "Israel under a renewed covenant charge"]'::jsonb, 'Israel facing the nations of Canaan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 3, 'What place or setting frames the action in Deuteronomy 7?', '["Canaan", "Horeb", "the wilderness", "the ark"]'::jsonb, 'Canaan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 4, 'In Deuteronomy 7, what concrete act shows how the covenant was being applied?', '["Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion", "God fed Israel with manna", "new stone tablets were placed in the ark"]'::jsonb, 'Israel was forbidden to intermarry with the nations', 'That specific detail appears in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 7, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 4, 'In Deuteronomy 7, what further act or fact supports the chapter''s message?', '["the graven images of the nations were to be burned", "Moses interceded after breaking the tablets", "Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner"]'::jsonb, 'the graven images of the nations were to be burned', 'That additional detail is included in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 7, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 4, 'What larger event in Deuteronomy 7 gives those details their meaning?', '["the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf", "the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD"]'::jsonb, 'the command to remain separate from the nations', 'That is the main event or action described in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 7 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 4, 'What result in Deuteronomy 7 shaped Israel''s future action?', '["Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness", "remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel"]'::jsonb, 'Israel was reminded that God chose them because of His love and oath', 'That is the outcome emphasized in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 7 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 4, 'Why did this matter according to Deuteronomy 7?', '["foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness", "man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality"]'::jsonb, 'foreign worship would turn hearts away from the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 4, 'Who had to respond to these things in Deuteronomy 7?', '["Israel facing the nations of Canaan", "Israel described as stubborn before the LORD", "Israel in the wilderness and in the good land", "Israel under a renewed covenant charge"]'::jsonb, 'Israel facing the nations of Canaan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 4, 'Where is the action or teaching set in Deuteronomy 7?', '["Canaan", "Horeb", "the wilderness", "the ark"]'::jsonb, 'Canaan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 7?', '["foreign worship would turn hearts away from the LORD", "God remained faithful to His promise despite Israel''s stubbornness", "man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality"]'::jsonb, 'foreign worship would turn hearts away from the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 5, 'What event in Deuteronomy 7 most clearly carries that message?', '["the command to remain separate from the nations", "the warning against self-righteousness and the recounting of the golden calf", "the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD"]'::jsonb, 'the command to remain separate from the nations', 'That is the main event or action described in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 7 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 5, 'What detail in Deuteronomy 7 makes that message concrete?', '["Israel was forbidden to intermarry with the nations", "the golden calf proved Israel''s rebellion", "God fed Israel with manna", "new stone tablets were placed in the ark"]'::jsonb, 'Israel was forbidden to intermarry with the nations', 'That specific detail appears in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 7 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 5, 'What additional detail in Deuteronomy 7 sharpens that message?', '["the graven images of the nations were to be burned", "Moses interceded after breaking the tablets", "Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner"]'::jsonb, 'the graven images of the nations were to be burned', 'That additional detail is included in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 7 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 5, 'What outcome in Deuteronomy 7 gives the chapter lasting force?', '["Israel was reminded that God chose them because of His love and oath", "the land was not given because of Israel''s righteousness", "remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel"]'::jsonb, 'Israel was reminded that God chose them because of His love and oath', 'That is the outcome emphasized in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 7 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 5, 'Who stands under that message in Deuteronomy 7?', '["Israel facing the nations of Canaan", "Israel described as stubborn before the LORD", "Israel in the wilderness and in the good land", "Israel under a renewed covenant charge"]'::jsonb, 'Israel facing the nations of Canaan', 'That group is directly addressed or involved in the chapter. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 7, 5, 'What setting in Deuteronomy 7 helps anchor the message?', '["Canaan", "Horeb", "the wilderness", "the ark"]'::jsonb, 'Canaan', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 7:1-11, 25-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 7 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 1, 'Who is the main speaker or figure in Deuteronomy 8?', '["the LORD", "false prophets and tempters to idolatry", "Moses", "the king and the judges"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 1, 'Which group is most directly addressed or involved in Deuteronomy 8?', '["Israel in the wilderness and in the good land", "Israel under a renewed covenant charge", "Israel described as stubborn before the LORD", "Israel entering a rain-watered land"]'::jsonb, 'Israel in the wilderness and in the good land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 1, 'What place is central in Deuteronomy 8?', '["the wilderness", "the ark", "Horeb", "Mount Gerizim and Mount Ebal"]'::jsonb, 'the wilderness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 1, 'What event is described in Deuteronomy 8?', '["the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD", "the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people"]'::jsonb, 'the warning not to forget God in prosperity', 'That is the main event or action described in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 1, 'Which detail appears in Deuteronomy 8?', '["God fed Israel with manna", "new stone tablets were placed in the ark", "the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven"]'::jsonb, 'God fed Israel with manna', 'That specific detail appears in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 1, 'What other detail is included in Deuteronomy 8?', '["Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner", "Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children"]'::jsonb, 'Israel was warned not to say that its own power gained wealth', 'That additional detail is included in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 1, 'What outcome is emphasized in Deuteronomy 8?', '["remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel", "the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal"]'::jsonb, 'remembering the LORD would preserve covenant blessing', 'That is the outcome emphasized in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 2, 'What was one reason given in Deuteronomy 8?', '["man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality", "God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience"]'::jsonb, 'man does not live by bread alone but by every word from God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 2, 'In Deuteronomy 8, what happened as a result of the chapter''s events or commands?', '["remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel", "the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal"]'::jsonb, 'remembering the LORD would preserve covenant blessing', 'That is the outcome emphasized in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 8, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 2, 'In Deuteronomy 8, what was the people''s situation or setting?', '["Israel in the wilderness and in the good land", "Israel under a renewed covenant charge", "Israel described as stubborn before the LORD", "Israel entering a rain-watered land"]'::jsonb, 'Israel in the wilderness and in the good land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 8, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 2, 'In Deuteronomy 8, which action or event took place?', '["the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD", "the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people"]'::jsonb, 'the warning not to forget God in prosperity', 'That is the main event or action described in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 8, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 2, 'In Deuteronomy 8, which concrete instruction or fact is mentioned?', '["God fed Israel with manna", "new stone tablets were placed in the ark", "the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven"]'::jsonb, 'God fed Israel with manna', 'That specific detail appears in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 8, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 2, 'In Deuteronomy 8, which additional fact is stated?', '["Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner", "Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children"]'::jsonb, 'Israel was warned not to say that its own power gained wealth', 'That additional detail is included in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 8, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 2, 'In Deuteronomy 8, what location or setting matters to the chapter?', '["the wilderness", "the ark", "Horeb", "Mount Gerizim and Mount Ebal"]'::jsonb, 'the wilderness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 8, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 3, 'What does Deuteronomy 8 say that the LORD did or declared?', '["the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD", "the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people"]'::jsonb, 'the warning not to forget God in prosperity', 'That is the main event or action described in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 8 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 3, 'Why was this emphasized in Deuteronomy 8?', '["man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality", "God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience"]'::jsonb, 'man does not live by bread alone but by every word from God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 3, 'What fact in Deuteronomy 8 helps explain the chapter''s message?', '["God fed Israel with manna", "new stone tablets were placed in the ark", "the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven"]'::jsonb, 'God fed Israel with manna', 'That specific detail appears in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 8 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 3, 'What second fact in Deuteronomy 8 develops the chapter''s message?', '["Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner", "Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children"]'::jsonb, 'Israel was warned not to say that its own power gained wealth', 'That additional detail is included in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 8 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 3, 'What result in Deuteronomy 8 shows the consequence of obedience or disobedience?', '["remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel", "the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal"]'::jsonb, 'remembering the LORD would preserve covenant blessing', 'That is the outcome emphasized in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 8 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 3, 'Who is especially in view in Deuteronomy 8?', '["Israel in the wilderness and in the good land", "Israel under a renewed covenant charge", "Israel described as stubborn before the LORD", "Israel entering a rain-watered land"]'::jsonb, 'Israel in the wilderness and in the good land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 3, 'What place or setting frames the action in Deuteronomy 8?', '["the wilderness", "the ark", "Horeb", "Mount Gerizim and Mount Ebal"]'::jsonb, 'the wilderness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 4, 'In Deuteronomy 8, what concrete act shows how the covenant was being applied?', '["God fed Israel with manna", "new stone tablets were placed in the ark", "the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven"]'::jsonb, 'God fed Israel with manna', 'That specific detail appears in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 8, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 4, 'In Deuteronomy 8, what further act or fact supports the chapter''s message?', '["Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner", "Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children"]'::jsonb, 'Israel was warned not to say that its own power gained wealth', 'That additional detail is included in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 8, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 4, 'What larger event in Deuteronomy 8 gives those details their meaning?', '["the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD", "the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people"]'::jsonb, 'the warning not to forget God in prosperity', 'That is the main event or action described in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 8 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 4, 'What result in Deuteronomy 8 shaped Israel''s future action?', '["remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel", "the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal"]'::jsonb, 'remembering the LORD would preserve covenant blessing', 'That is the outcome emphasized in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 8 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 4, 'Why did this matter according to Deuteronomy 8?', '["man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality", "God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience"]'::jsonb, 'man does not live by bread alone but by every word from God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 4, 'Who had to respond to these things in Deuteronomy 8?', '["Israel in the wilderness and in the good land", "Israel under a renewed covenant charge", "Israel described as stubborn before the LORD", "Israel entering a rain-watered land"]'::jsonb, 'Israel in the wilderness and in the good land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 4, 'Where is the action or teaching set in Deuteronomy 8?', '["the wilderness", "the ark", "Horeb", "Mount Gerizim and Mount Ebal"]'::jsonb, 'the wilderness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 8?', '["man does not live by bread alone but by every word from God", "the great God shows justice and love without partiality", "God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience"]'::jsonb, 'man does not live by bread alone but by every word from God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 5, 'What event in Deuteronomy 8 most clearly carries that message?', '["the warning not to forget God in prosperity", "the renewal of the tablets and the call to fear and love the LORD", "the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people"]'::jsonb, 'the warning not to forget God in prosperity', 'That is the main event or action described in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 8 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 5, 'What detail in Deuteronomy 8 makes that message concrete?', '["God fed Israel with manna", "new stone tablets were placed in the ark", "the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven"]'::jsonb, 'God fed Israel with manna', 'That specific detail appears in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 8 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 5, 'What additional detail in Deuteronomy 8 sharpens that message?', '["Israel was warned not to say that its own power gained wealth", "Israel was told to circumcise the heart and love the sojourner", "Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children"]'::jsonb, 'Israel was warned not to say that its own power gained wealth', 'That additional detail is included in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 8 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 5, 'What outcome in Deuteronomy 8 gives the chapter lasting force?', '["remembering the LORD would preserve covenant blessing", "fear, love, service, and loyalty were set before Israel", "the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal"]'::jsonb, 'remembering the LORD would preserve covenant blessing', 'That is the outcome emphasized in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 8 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 5, 'Who stands under that message in Deuteronomy 8?', '["Israel in the wilderness and in the good land", "Israel under a renewed covenant charge", "Israel described as stubborn before the LORD", "Israel entering a rain-watered land"]'::jsonb, 'Israel in the wilderness and in the good land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 8, 5, 'What setting in Deuteronomy 8 helps anchor the message?', '["the wilderness", "the ark", "Horeb", "Mount Gerizim and Mount Ebal"]'::jsonb, 'the wilderness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 8:2-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 8 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 1, 'Who is the main speaker or figure in Deuteronomy 9?', '["Moses", "false prophets and tempters to idolatry", "the LORD", "the king and the judges"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 1, 'Which group is most directly addressed or involved in Deuteronomy 9?', '["Israel described as stubborn before the LORD", "Israel entering a rain-watered land", "Israel under a renewed covenant charge", "Israel entering a land of rival shrines"]'::jsonb, 'Israel described as stubborn before the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 1, 'What place is central in Deuteronomy 9?', '["Horeb", "Mount Gerizim and Mount Ebal", "the ark", "the place the LORD would choose"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 1, 'What event is described in Deuteronomy 9?', '["the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people", "the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship"]'::jsonb, 'the warning against self-righteousness and the recounting of the golden calf', 'That is the main event or action described in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 1, 'Which detail appears in Deuteronomy 9?', '["the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven", "new stone tablets were placed in the ark", "the high places of the nations were to be destroyed"]'::jsonb, 'the golden calf proved Israel''s rebellion', 'That specific detail appears in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 1, 'What other detail is included in Deuteronomy 9?', '["Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children", "Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place"]'::jsonb, 'Moses interceded after breaking the tablets', 'That additional detail is included in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 1, 'What outcome is emphasized in Deuteronomy 9?', '["the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal", "fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity"]'::jsonb, 'the land was not given because of Israel''s righteousness', 'That is the outcome emphasized in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 2, 'What was one reason given in Deuteronomy 9?', '["God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience", "the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods"]'::jsonb, 'God remained faithful to His promise despite Israel''s stubbornness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 2, 'In Deuteronomy 9, what happened as a result of the chapter''s events or commands?', '["the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal", "fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity"]'::jsonb, 'the land was not given because of Israel''s righteousness', 'That is the outcome emphasized in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 9, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 2, 'In Deuteronomy 9, what was the people''s situation or setting?', '["Israel described as stubborn before the LORD", "Israel entering a rain-watered land", "Israel under a renewed covenant charge", "Israel entering a land of rival shrines"]'::jsonb, 'Israel described as stubborn before the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 9, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 2, 'In Deuteronomy 9, which action or event took place?', '["the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people", "the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship"]'::jsonb, 'the warning against self-righteousness and the recounting of the golden calf', 'That is the main event or action described in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 9, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 2, 'In Deuteronomy 9, which concrete instruction or fact is mentioned?', '["the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven", "new stone tablets were placed in the ark", "the high places of the nations were to be destroyed"]'::jsonb, 'the golden calf proved Israel''s rebellion', 'That specific detail appears in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 9, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 2, 'In Deuteronomy 9, which additional fact is stated?', '["Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children", "Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place"]'::jsonb, 'Moses interceded after breaking the tablets', 'That additional detail is included in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 9, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 2, 'In Deuteronomy 9, what location or setting matters to the chapter?', '["Horeb", "Mount Gerizim and Mount Ebal", "the ark", "the place the LORD would choose"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 9, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 3, 'What does Deuteronomy 9 say that Moses did or declared?', '["the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people", "the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship"]'::jsonb, 'the warning against self-righteousness and the recounting of the golden calf', 'That is the main event or action described in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 9 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 3, 'Why was this emphasized in Deuteronomy 9?', '["God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience", "the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods"]'::jsonb, 'God remained faithful to His promise despite Israel''s stubbornness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 3, 'What fact in Deuteronomy 9 helps explain the chapter''s message?', '["the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven", "new stone tablets were placed in the ark", "the high places of the nations were to be destroyed"]'::jsonb, 'the golden calf proved Israel''s rebellion', 'That specific detail appears in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 9 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 3, 'What second fact in Deuteronomy 9 develops the chapter''s message?', '["Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children", "Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place"]'::jsonb, 'Moses interceded after breaking the tablets', 'That additional detail is included in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 9 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 3, 'What result in Deuteronomy 9 shows the consequence of obedience or disobedience?', '["the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal", "fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity"]'::jsonb, 'the land was not given because of Israel''s righteousness', 'That is the outcome emphasized in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 9 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 3, 'Who is especially in view in Deuteronomy 9?', '["Israel described as stubborn before the LORD", "Israel entering a rain-watered land", "Israel under a renewed covenant charge", "Israel entering a land of rival shrines"]'::jsonb, 'Israel described as stubborn before the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 3, 'What place or setting frames the action in Deuteronomy 9?', '["Horeb", "Mount Gerizim and Mount Ebal", "the ark", "the place the LORD would choose"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 4, 'In Deuteronomy 9, what concrete act shows how the covenant was being applied?', '["the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven", "new stone tablets were placed in the ark", "the high places of the nations were to be destroyed"]'::jsonb, 'the golden calf proved Israel''s rebellion', 'That specific detail appears in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 9, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 4, 'In Deuteronomy 9, what further act or fact supports the chapter''s message?', '["Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children", "Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place"]'::jsonb, 'Moses interceded after breaking the tablets', 'That additional detail is included in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 9, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 4, 'What larger event in Deuteronomy 9 gives those details their meaning?', '["the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people", "the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship"]'::jsonb, 'the warning against self-righteousness and the recounting of the golden calf', 'That is the main event or action described in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 9 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 4, 'What result in Deuteronomy 9 shaped Israel''s future action?', '["the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal", "fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity"]'::jsonb, 'the land was not given because of Israel''s righteousness', 'That is the outcome emphasized in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 9 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 4, 'Why did this matter according to Deuteronomy 9?', '["God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience", "the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods"]'::jsonb, 'God remained faithful to His promise despite Israel''s stubbornness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 4, 'Who had to respond to these things in Deuteronomy 9?', '["Israel described as stubborn before the LORD", "Israel entering a rain-watered land", "Israel under a renewed covenant charge", "Israel entering a land of rival shrines"]'::jsonb, 'Israel described as stubborn before the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 4, 'Where is the action or teaching set in Deuteronomy 9?', '["Horeb", "Mount Gerizim and Mount Ebal", "the ark", "the place the LORD would choose"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 9?', '["God remained faithful to His promise despite Israel''s stubbornness", "life in the land depended on covenant obedience", "the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods"]'::jsonb, 'God remained faithful to His promise despite Israel''s stubbornness', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 5, 'What event in Deuteronomy 9 most clearly carries that message?', '["the warning against self-righteousness and the recounting of the golden calf", "the setting of blessing and curse before the people", "the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship"]'::jsonb, 'the warning against self-righteousness and the recounting of the golden calf', 'That is the main event or action described in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 9 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 5, 'What detail in Deuteronomy 9 makes that message concrete?', '["the golden calf proved Israel''s rebellion", "Canaan drinks water from the rain of heaven", "new stone tablets were placed in the ark", "the high places of the nations were to be destroyed"]'::jsonb, 'the golden calf proved Israel''s rebellion', 'That specific detail appears in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 9 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 5, 'What additional detail in Deuteronomy 9 sharpens that message?', '["Moses interceded after breaking the tablets", "God''s words were to be laid up in the heart and taught to children", "Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place"]'::jsonb, 'Moses interceded after breaking the tablets', 'That additional detail is included in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 9 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 5, 'What outcome in Deuteronomy 9 gives the chapter lasting force?', '["the land was not given because of Israel''s righteousness", "Israel was to place blessing on Gerizim and curse on Ebal", "fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity"]'::jsonb, 'the land was not given because of Israel''s righteousness', 'That is the outcome emphasized in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 9 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 5, 'Who stands under that message in Deuteronomy 9?', '["Israel described as stubborn before the LORD", "Israel entering a rain-watered land", "Israel under a renewed covenant charge", "Israel entering a land of rival shrines"]'::jsonb, 'Israel described as stubborn before the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 9, 5, 'What setting in Deuteronomy 9 helps anchor the message?', '["Horeb", "Mount Gerizim and Mount Ebal", "the ark", "the place the LORD would choose"]'::jsonb, 'Horeb', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 9:4-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 9 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 1, 'Who is the main speaker or figure in Deuteronomy 10?', '["the LORD", "false prophets and tempters to idolatry", "Moses", "the king and the judges"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 1, 'Which group is most directly addressed or involved in Deuteronomy 10?', '["Israel under a renewed covenant charge", "Israel entering a land of rival shrines", "Israel entering a rain-watered land", "Israel tested in loyalty to the LORD"]'::jsonb, 'Israel under a renewed covenant charge', 'That group is directly addressed or involved in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 1, 'What place is central in Deuteronomy 10?', '["the ark", "the place the LORD would choose", "Mount Gerizim and Mount Ebal", "an apostate city in Israel"]'::jsonb, 'the ark', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 1, 'What event is described in Deuteronomy 10?', '["the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship", "the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods"]'::jsonb, 'the renewal of the tablets and the call to fear and love the LORD', 'That is the main event or action described in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 1, 'Which detail appears in Deuteronomy 10?', '["new stone tablets were placed in the ark", "the high places of the nations were to be destroyed", "Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods"]'::jsonb, 'new stone tablets were placed in the ark', 'That specific detail appears in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 1, 'What other detail is included in Deuteronomy 10?', '["Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place", "God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared"]'::jsonb, 'Israel was told to circumcise the heart and love the sojourner', 'That additional detail is included in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 1, 'What outcome is emphasized in Deuteronomy 10?', '["fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity", "Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel"]'::jsonb, 'fear, love, service, and loyalty were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 2, 'What was one reason given in Deuteronomy 10?', '["the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods", "life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance"]'::jsonb, 'the great God shows justice and love without partiality', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 2, 'In Deuteronomy 10, what happened as a result of the chapter''s events or commands?', '["fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity", "Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel"]'::jsonb, 'fear, love, service, and loyalty were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 10, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 2, 'In Deuteronomy 10, what was the people''s situation or setting?', '["Israel under a renewed covenant charge", "Israel entering a land of rival shrines", "Israel entering a rain-watered land", "Israel tested in loyalty to the LORD"]'::jsonb, 'Israel under a renewed covenant charge', 'That group is directly addressed or involved in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 10, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 2, 'In Deuteronomy 10, which action or event took place?', '["the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship", "the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods"]'::jsonb, 'the renewal of the tablets and the call to fear and love the LORD', 'That is the main event or action described in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 10, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 2, 'In Deuteronomy 10, which concrete instruction or fact is mentioned?', '["new stone tablets were placed in the ark", "the high places of the nations were to be destroyed", "Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods"]'::jsonb, 'new stone tablets were placed in the ark', 'That specific detail appears in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 10, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 2, 'In Deuteronomy 10, which additional fact is stated?', '["Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place", "God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared"]'::jsonb, 'Israel was told to circumcise the heart and love the sojourner', 'That additional detail is included in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 10, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 2, 'In Deuteronomy 10, what location or setting matters to the chapter?', '["the ark", "the place the LORD would choose", "Mount Gerizim and Mount Ebal", "an apostate city in Israel"]'::jsonb, 'the ark', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 10, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 3, 'What does Deuteronomy 10 say that the LORD did or declared?', '["the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship", "the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods"]'::jsonb, 'the renewal of the tablets and the call to fear and love the LORD', 'That is the main event or action described in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 10 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 3, 'Why was this emphasized in Deuteronomy 10?', '["the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods", "life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance"]'::jsonb, 'the great God shows justice and love without partiality', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 3, 'What fact in Deuteronomy 10 helps explain the chapter''s message?', '["new stone tablets were placed in the ark", "the high places of the nations were to be destroyed", "Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods"]'::jsonb, 'new stone tablets were placed in the ark', 'That specific detail appears in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 10 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 3, 'What second fact in Deuteronomy 10 develops the chapter''s message?', '["Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place", "God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared"]'::jsonb, 'Israel was told to circumcise the heart and love the sojourner', 'That additional detail is included in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 10 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 3, 'What result in Deuteronomy 10 shows the consequence of obedience or disobedience?', '["fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity", "Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel"]'::jsonb, 'fear, love, service, and loyalty were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 10 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 3, 'Who is especially in view in Deuteronomy 10?', '["Israel under a renewed covenant charge", "Israel entering a land of rival shrines", "Israel entering a rain-watered land", "Israel tested in loyalty to the LORD"]'::jsonb, 'Israel under a renewed covenant charge', 'That group is directly addressed or involved in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 3, 'What place or setting frames the action in Deuteronomy 10?', '["the ark", "the place the LORD would choose", "Mount Gerizim and Mount Ebal", "an apostate city in Israel"]'::jsonb, 'the ark', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 4, 'In Deuteronomy 10, what concrete act shows how the covenant was being applied?', '["new stone tablets were placed in the ark", "the high places of the nations were to be destroyed", "Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods"]'::jsonb, 'new stone tablets were placed in the ark', 'That specific detail appears in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 10, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 4, 'In Deuteronomy 10, what further act or fact supports the chapter''s message?', '["Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place", "God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared"]'::jsonb, 'Israel was told to circumcise the heart and love the sojourner', 'That additional detail is included in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 10, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 4, 'What larger event in Deuteronomy 10 gives those details their meaning?', '["the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship", "the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods"]'::jsonb, 'the renewal of the tablets and the call to fear and love the LORD', 'That is the main event or action described in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 10 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 4, 'What result in Deuteronomy 10 shaped Israel''s future action?', '["fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity", "Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel"]'::jsonb, 'fear, love, service, and loyalty were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 10 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 4, 'Why did this matter according to Deuteronomy 10?', '["the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods", "life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance"]'::jsonb, 'the great God shows justice and love without partiality', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 4, 'Who had to respond to these things in Deuteronomy 10?', '["Israel under a renewed covenant charge", "Israel entering a land of rival shrines", "Israel entering a rain-watered land", "Israel tested in loyalty to the LORD"]'::jsonb, 'Israel under a renewed covenant charge', 'That group is directly addressed or involved in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 4, 'Where is the action or teaching set in Deuteronomy 10?', '["the ark", "the place the LORD would choose", "Mount Gerizim and Mount Ebal", "an apostate city in Israel"]'::jsonb, 'the ark', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 10?', '["the great God shows justice and love without partiality", "Israel must not worship the LORD in the way the nations served their gods", "life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance"]'::jsonb, 'the great God shows justice and love without partiality', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 5, 'What event in Deuteronomy 10 most clearly carries that message?', '["the renewal of the tablets and the call to fear and love the LORD", "the command to centralize worship", "the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods"]'::jsonb, 'the renewal of the tablets and the call to fear and love the LORD', 'That is the main event or action described in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 10 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 5, 'What detail in Deuteronomy 10 makes that message concrete?', '["new stone tablets were placed in the ark", "the high places of the nations were to be destroyed", "Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods"]'::jsonb, 'new stone tablets were placed in the ark', 'That specific detail appears in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 10 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 5, 'What additional detail in Deuteronomy 10 sharpens that message?', '["Israel was told to circumcise the heart and love the sojourner", "sacrifices were to be brought only to the chosen place", "God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared"]'::jsonb, 'Israel was told to circumcise the heart and love the sojourner', 'That additional detail is included in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 10 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 5, 'What outcome in Deuteronomy 10 gives the chapter lasting force?', '["fear, love, service, and loyalty were set before Israel", "worship was centralized for covenant purity", "Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel"]'::jsonb, 'fear, love, service, and loyalty were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 10 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 5, 'Who stands under that message in Deuteronomy 10?', '["Israel under a renewed covenant charge", "Israel entering a land of rival shrines", "Israel entering a rain-watered land", "Israel tested in loyalty to the LORD"]'::jsonb, 'Israel under a renewed covenant charge', 'That group is directly addressed or involved in the chapter. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 10, 5, 'What setting in Deuteronomy 10 helps anchor the message?', '["the ark", "the place the LORD would choose", "Mount Gerizim and Mount Ebal", "an apostate city in Israel"]'::jsonb, 'the ark', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 10:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 10 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 1, 'Who is the main speaker or figure in Deuteronomy 11?', '["Moses", "false prophets and tempters to idolatry", "the LORD", "the king and the judges"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 1, 'Which group is most directly addressed or involved in Deuteronomy 11?', '["Israel entering a rain-watered land", "Israel tested in loyalty to the LORD", "Israel entering a land of rival shrines", "Israel as a holy people"]'::jsonb, 'Israel entering a rain-watered land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 1, 'What place is central in Deuteronomy 11?', '["Mount Gerizim and Mount Ebal", "an apostate city in Israel", "the place the LORD would choose", "the seventh year of release"]'::jsonb, 'Mount Gerizim and Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 1, 'What event is described in Deuteronomy 11?', '["the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods", "the command to centralize worship", "laws about clean foods and the tithe"]'::jsonb, 'the setting of blessing and curse before the people', 'That is the main event or action described in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 1, 'Which detail appears in Deuteronomy 11?', '["Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods", "the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices"]'::jsonb, 'Canaan drinks water from the rain of heaven', 'That specific detail appears in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 1, 'What other detail is included in Deuteronomy 11?', '["God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared", "sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy"]'::jsonb, 'God''s words were to be laid up in the heart and taught to children', 'That additional detail is included in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 1, 'What outcome is emphasized in Deuteronomy 11?', '["Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel", "worship was centralized for covenant purity", "holiness shaped both eating and generosity"]'::jsonb, 'Israel was to place blessing on Gerizim and curse on Ebal', 'That is the outcome emphasized in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 2, 'What was one reason given in Deuteronomy 11?', '["life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance", "Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession"]'::jsonb, 'life in the land depended on covenant obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 2, 'In Deuteronomy 11, what happened as a result of the chapter''s events or commands?', '["Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel", "worship was centralized for covenant purity", "holiness shaped both eating and generosity"]'::jsonb, 'Israel was to place blessing on Gerizim and curse on Ebal', 'That is the outcome emphasized in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 11, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 2, 'In Deuteronomy 11, what was the people''s situation or setting?', '["Israel entering a rain-watered land", "Israel tested in loyalty to the LORD", "Israel entering a land of rival shrines", "Israel as a holy people"]'::jsonb, 'Israel entering a rain-watered land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 11, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 2, 'In Deuteronomy 11, which action or event took place?', '["the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods", "the command to centralize worship", "laws about clean foods and the tithe"]'::jsonb, 'the setting of blessing and curse before the people', 'That is the main event or action described in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 11, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 2, 'In Deuteronomy 11, which concrete instruction or fact is mentioned?', '["Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods", "the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices"]'::jsonb, 'Canaan drinks water from the rain of heaven', 'That specific detail appears in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 11, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 2, 'In Deuteronomy 11, which additional fact is stated?', '["God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared", "sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy"]'::jsonb, 'God''s words were to be laid up in the heart and taught to children', 'That additional detail is included in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 11, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 2, 'In Deuteronomy 11, what location or setting matters to the chapter?', '["Mount Gerizim and Mount Ebal", "an apostate city in Israel", "the place the LORD would choose", "the seventh year of release"]'::jsonb, 'Mount Gerizim and Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 11, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 3, 'What does Deuteronomy 11 say that Moses did or declared?', '["the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods", "the command to centralize worship", "laws about clean foods and the tithe"]'::jsonb, 'the setting of blessing and curse before the people', 'That is the main event or action described in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 11 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 3, 'Why was this emphasized in Deuteronomy 11?', '["life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance", "Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession"]'::jsonb, 'life in the land depended on covenant obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 3, 'What fact in Deuteronomy 11 helps explain the chapter''s message?', '["Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods", "the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices"]'::jsonb, 'Canaan drinks water from the rain of heaven', 'That specific detail appears in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 11 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 3, 'What second fact in Deuteronomy 11 develops the chapter''s message?', '["God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared", "sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy"]'::jsonb, 'God''s words were to be laid up in the heart and taught to children', 'That additional detail is included in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 11 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 3, 'What result in Deuteronomy 11 shows the consequence of obedience or disobedience?', '["Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel", "worship was centralized for covenant purity", "holiness shaped both eating and generosity"]'::jsonb, 'Israel was to place blessing on Gerizim and curse on Ebal', 'That is the outcome emphasized in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 11 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 3, 'Who is especially in view in Deuteronomy 11?', '["Israel entering a rain-watered land", "Israel tested in loyalty to the LORD", "Israel entering a land of rival shrines", "Israel as a holy people"]'::jsonb, 'Israel entering a rain-watered land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 3, 'What place or setting frames the action in Deuteronomy 11?', '["Mount Gerizim and Mount Ebal", "an apostate city in Israel", "the place the LORD would choose", "the seventh year of release"]'::jsonb, 'Mount Gerizim and Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 4, 'In Deuteronomy 11, what concrete act shows how the covenant was being applied?', '["Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods", "the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices"]'::jsonb, 'Canaan drinks water from the rain of heaven', 'That specific detail appears in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 11, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 4, 'In Deuteronomy 11, what further act or fact supports the chapter''s message?', '["God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared", "sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy"]'::jsonb, 'God''s words were to be laid up in the heart and taught to children', 'That additional detail is included in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 11, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 4, 'What larger event in Deuteronomy 11 gives those details their meaning?', '["the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods", "the command to centralize worship", "laws about clean foods and the tithe"]'::jsonb, 'the setting of blessing and curse before the people', 'That is the main event or action described in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 11 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 4, 'What result in Deuteronomy 11 shaped Israel''s future action?', '["Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel", "worship was centralized for covenant purity", "holiness shaped both eating and generosity"]'::jsonb, 'Israel was to place blessing on Gerizim and curse on Ebal', 'That is the outcome emphasized in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 11 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 4, 'Why did this matter according to Deuteronomy 11?', '["life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance", "Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession"]'::jsonb, 'life in the land depended on covenant obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 4, 'Who had to respond to these things in Deuteronomy 11?', '["Israel entering a rain-watered land", "Israel tested in loyalty to the LORD", "Israel entering a land of rival shrines", "Israel as a holy people"]'::jsonb, 'Israel entering a rain-watered land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 4, 'Where is the action or teaching set in Deuteronomy 11?', '["Mount Gerizim and Mount Ebal", "an apostate city in Israel", "the place the LORD would choose", "the seventh year of release"]'::jsonb, 'Mount Gerizim and Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 11?', '["life in the land depended on covenant obedience", "love for the LORD outranks every other allegiance", "Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession"]'::jsonb, 'life in the land depended on covenant obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 5, 'What event in Deuteronomy 11 most clearly carries that message?', '["the setting of blessing and curse before the people", "the testing of covenant loyalty by enticement to other gods", "the command to centralize worship", "laws about clean foods and the tithe"]'::jsonb, 'the setting of blessing and curse before the people', 'That is the main event or action described in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 11 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 5, 'What detail in Deuteronomy 11 makes that message concrete?', '["Canaan drinks water from the rain of heaven", "even a sign or wonder did not justify following other gods", "the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices"]'::jsonb, 'Canaan drinks water from the rain of heaven', 'That specific detail appears in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 11 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 5, 'What additional detail in Deuteronomy 11 sharpens that message?', '["God''s words were to be laid up in the heart and taught to children", "a close relative enticing to idolatry was not to be spared", "sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy"]'::jsonb, 'God''s words were to be laid up in the heart and taught to children', 'That additional detail is included in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 11 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 5, 'What outcome in Deuteronomy 11 gives the chapter lasting force?', '["Israel was to place blessing on Gerizim and curse on Ebal", "evil was to be purged from Israel", "worship was centralized for covenant purity", "holiness shaped both eating and generosity"]'::jsonb, 'Israel was to place blessing on Gerizim and curse on Ebal', 'That is the outcome emphasized in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 11 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 5, 'Who stands under that message in Deuteronomy 11?', '["Israel entering a rain-watered land", "Israel tested in loyalty to the LORD", "Israel entering a land of rival shrines", "Israel as a holy people"]'::jsonb, 'Israel entering a rain-watered land', 'That group is directly addressed or involved in the chapter. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 11, 5, 'What setting in Deuteronomy 11 helps anchor the message?', '["Mount Gerizim and Mount Ebal", "an apostate city in Israel", "the place the LORD would choose", "the seventh year of release"]'::jsonb, 'Mount Gerizim and Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 11:10-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 11 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 1, 'Who is the main speaker or figure in Deuteronomy 12?', '["the LORD", "Moses", "false prophets and tempters to idolatry", "the king and the judges"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 1, 'Which group is most directly addressed or involved in Deuteronomy 12?', '["Israel entering a land of rival shrines", "Israel as a holy people", "Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel"]'::jsonb, 'Israel entering a land of rival shrines', 'That group is directly addressed or involved in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 1, 'What place is central in Deuteronomy 12?', '["the place the LORD would choose", "the seventh year of release", "an apostate city in Israel", "among Israel"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 1, 'What event is described in Deuteronomy 12?', '["the command to centralize worship", "laws about clean foods and the tithe", "the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor"]'::jsonb, 'the command to centralize worship', 'That is the main event or action described in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 1, 'Which detail appears in Deuteronomy 12?', '["the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices", "even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year"]'::jsonb, 'the high places of the nations were to be destroyed', 'That specific detail appears in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 1, 'What other detail is included in Deuteronomy 12?', '["sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy", "a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously"]'::jsonb, 'sacrifices were to be brought only to the chosen place', 'That additional detail is included in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 1, 'What outcome is emphasized in Deuteronomy 12?', '["worship was centralized for covenant purity", "holiness shaped both eating and generosity", "evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor"]'::jsonb, 'worship was centralized for covenant purity', 'That is the outcome emphasized in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 2, 'What was one reason given in Deuteronomy 12?', '["Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession", "love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery"]'::jsonb, 'Israel must not worship the LORD in the way the nations served their gods', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 2, 'In Deuteronomy 12, what happened as a result of the chapter''s events or commands?', '["worship was centralized for covenant purity", "holiness shaped both eating and generosity", "evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor"]'::jsonb, 'worship was centralized for covenant purity', 'That is the outcome emphasized in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 12, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 2, 'In Deuteronomy 12, what was the people''s situation or setting?', '["Israel entering a land of rival shrines", "Israel as a holy people", "Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel"]'::jsonb, 'Israel entering a land of rival shrines', 'That group is directly addressed or involved in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 12, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 2, 'In Deuteronomy 12, which action or event took place?', '["the command to centralize worship", "laws about clean foods and the tithe", "the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor"]'::jsonb, 'the command to centralize worship', 'That is the main event or action described in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 12, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 2, 'In Deuteronomy 12, which concrete instruction or fact is mentioned?', '["the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices", "even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year"]'::jsonb, 'the high places of the nations were to be destroyed', 'That specific detail appears in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 12, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 2, 'In Deuteronomy 12, which additional fact is stated?', '["sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy", "a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously"]'::jsonb, 'sacrifices were to be brought only to the chosen place', 'That additional detail is included in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 12, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 2, 'In Deuteronomy 12, what location or setting matters to the chapter?', '["the place the LORD would choose", "the seventh year of release", "an apostate city in Israel", "among Israel"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 12, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 3, 'What does Deuteronomy 12 say that the LORD did or declared?', '["the command to centralize worship", "laws about clean foods and the tithe", "the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor"]'::jsonb, 'the command to centralize worship', 'That is the main event or action described in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 12 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 3, 'Why was this emphasized in Deuteronomy 12?', '["Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession", "love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery"]'::jsonb, 'Israel must not worship the LORD in the way the nations served their gods', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 3, 'What fact in Deuteronomy 12 helps explain the chapter''s message?', '["the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices", "even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year"]'::jsonb, 'the high places of the nations were to be destroyed', 'That specific detail appears in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 12 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 3, 'What second fact in Deuteronomy 12 develops the chapter''s message?', '["sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy", "a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously"]'::jsonb, 'sacrifices were to be brought only to the chosen place', 'That additional detail is included in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 12 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 3, 'What result in Deuteronomy 12 shows the consequence of obedience or disobedience?', '["worship was centralized for covenant purity", "holiness shaped both eating and generosity", "evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor"]'::jsonb, 'worship was centralized for covenant purity', 'That is the outcome emphasized in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 12 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 3, 'Who is especially in view in Deuteronomy 12?', '["Israel entering a land of rival shrines", "Israel as a holy people", "Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel"]'::jsonb, 'Israel entering a land of rival shrines', 'That group is directly addressed or involved in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 3, 'What place or setting frames the action in Deuteronomy 12?', '["the place the LORD would choose", "the seventh year of release", "an apostate city in Israel", "among Israel"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 4, 'In Deuteronomy 12, what concrete act shows how the covenant was being applied?', '["the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices", "even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year"]'::jsonb, 'the high places of the nations were to be destroyed', 'That specific detail appears in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 12, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 4, 'In Deuteronomy 12, what further act or fact supports the chapter''s message?', '["sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy", "a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously"]'::jsonb, 'sacrifices were to be brought only to the chosen place', 'That additional detail is included in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 12, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 4, 'What larger event in Deuteronomy 12 gives those details their meaning?', '["the command to centralize worship", "laws about clean foods and the tithe", "the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor"]'::jsonb, 'the command to centralize worship', 'That is the main event or action described in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 12 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 4, 'What result in Deuteronomy 12 shaped Israel''s future action?', '["worship was centralized for covenant purity", "holiness shaped both eating and generosity", "evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor"]'::jsonb, 'worship was centralized for covenant purity', 'That is the outcome emphasized in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 12 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 4, 'Why did this matter according to Deuteronomy 12?', '["Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession", "love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery"]'::jsonb, 'Israel must not worship the LORD in the way the nations served their gods', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 4, 'Who had to respond to these things in Deuteronomy 12?', '["Israel entering a land of rival shrines", "Israel as a holy people", "Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel"]'::jsonb, 'Israel entering a land of rival shrines', 'That group is directly addressed or involved in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 4, 'Where is the action or teaching set in Deuteronomy 12?', '["the place the LORD would choose", "the seventh year of release", "an apostate city in Israel", "among Israel"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 12?', '["Israel must not worship the LORD in the way the nations served their gods", "Israel belonged to the LORD as His treasured possession", "love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery"]'::jsonb, 'Israel must not worship the LORD in the way the nations served their gods', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 5, 'What event in Deuteronomy 12 most clearly carries that message?', '["the command to centralize worship", "laws about clean foods and the tithe", "the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor"]'::jsonb, 'the command to centralize worship', 'That is the main event or action described in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 12 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 5, 'What detail in Deuteronomy 12 makes that message concrete?', '["the high places of the nations were to be destroyed", "Israel was forbidden to imitate pagan mourning practices", "even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year"]'::jsonb, 'the high places of the nations were to be destroyed', 'That specific detail appears in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 12 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 5, 'What additional detail in Deuteronomy 12 sharpens that message?', '["sacrifices were to be brought only to the chosen place", "the tithe supported worship and the needy", "a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously"]'::jsonb, 'sacrifices were to be brought only to the chosen place', 'That additional detail is included in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 12 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 5, 'What outcome in Deuteronomy 12 gives the chapter lasting force?', '["worship was centralized for covenant purity", "holiness shaped both eating and generosity", "evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor"]'::jsonb, 'worship was centralized for covenant purity', 'That is the outcome emphasized in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 12 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 5, 'Who stands under that message in Deuteronomy 12?', '["Israel entering a land of rival shrines", "Israel as a holy people", "Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel"]'::jsonb, 'Israel entering a land of rival shrines', 'That group is directly addressed or involved in the chapter. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 12, 5, 'What setting in Deuteronomy 12 helps anchor the message?', '["the place the LORD would choose", "the seventh year of release", "an apostate city in Israel", "among Israel"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 12:2-32)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 12 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 1, 'Who is the main speaker or figure in Deuteronomy 13?', '["false prophets and tempters to idolatry", "Moses", "the LORD", "the king and the judges"]'::jsonb, 'false prophets and tempters to idolatry', 'false prophets and tempters to idolatry is central in this chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 1, 'Which group is most directly addressed or involved in Deuteronomy 13?', '["Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel", "Israel as a holy people", "Israel gathering for feasts and appointing judges"]'::jsonb, 'Israel tested in loyalty to the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 1, 'What place is central in Deuteronomy 13?', '["an apostate city in Israel", "the seventh year of release", "the place the LORD would choose", "among Israel"]'::jsonb, 'an apostate city in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 1, 'What event is described in Deuteronomy 13?', '["the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor", "laws about clean foods and the tithe", "the annual feasts and the command for just judgment"]'::jsonb, 'the testing of covenant loyalty by enticement to other gods', 'That is the main event or action described in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 1, 'Which detail appears in Deuteronomy 13?', '["even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year", "Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing"]'::jsonb, 'even a sign or wonder did not justify following other gods', 'That specific detail appears in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 1, 'What other detail is included in Deuteronomy 13?', '["a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously", "the tithe supported worship and the needy", "judges were forbidden to take bribes"]'::jsonb, 'a close relative enticing to idolatry was not to be spared', 'That additional detail is included in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 1, 'What outcome is emphasized in Deuteronomy 13?', '["evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor", "holiness shaped both eating and generosity", "public worship and public justice were both regulated"]'::jsonb, 'evil was to be purged from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 2, 'What was one reason given in Deuteronomy 13?', '["love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery", "Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God"]'::jsonb, 'love for the LORD outranks every other allegiance', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 2, 'In Deuteronomy 13, what happened as a result of the chapter''s events or commands?', '["evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor", "holiness shaped both eating and generosity", "public worship and public justice were both regulated"]'::jsonb, 'evil was to be purged from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 13, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 2, 'In Deuteronomy 13, what was the people''s situation or setting?', '["Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel", "Israel as a holy people", "Israel gathering for feasts and appointing judges"]'::jsonb, 'Israel tested in loyalty to the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 13, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 2, 'In Deuteronomy 13, which action or event took place?', '["the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor", "laws about clean foods and the tithe", "the annual feasts and the command for just judgment"]'::jsonb, 'the testing of covenant loyalty by enticement to other gods', 'That is the main event or action described in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 13, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 2, 'In Deuteronomy 13, which concrete instruction or fact is mentioned?', '["even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year", "Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing"]'::jsonb, 'even a sign or wonder did not justify following other gods', 'That specific detail appears in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 13, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 2, 'In Deuteronomy 13, which additional fact is stated?', '["a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously", "the tithe supported worship and the needy", "judges were forbidden to take bribes"]'::jsonb, 'a close relative enticing to idolatry was not to be spared', 'That additional detail is included in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 13, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 2, 'In Deuteronomy 13, what location or setting matters to the chapter?', '["an apostate city in Israel", "the seventh year of release", "the place the LORD would choose", "among Israel"]'::jsonb, 'an apostate city in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 13, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 3, 'What does Deuteronomy 13 say that false prophets and tempters to idolatry did or declared?', '["the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor", "laws about clean foods and the tithe", "the annual feasts and the command for just judgment"]'::jsonb, 'the testing of covenant loyalty by enticement to other gods', 'That is the main event or action described in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 13 say that false prophets and tempters to idolatry did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 3, 'Why was this emphasized in Deuteronomy 13?', '["love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery", "Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God"]'::jsonb, 'love for the LORD outranks every other allegiance', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 3, 'What fact in Deuteronomy 13 helps explain the chapter''s message?', '["even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year", "Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing"]'::jsonb, 'even a sign or wonder did not justify following other gods', 'That specific detail appears in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 13 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 3, 'What second fact in Deuteronomy 13 develops the chapter''s message?', '["a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously", "the tithe supported worship and the needy", "judges were forbidden to take bribes"]'::jsonb, 'a close relative enticing to idolatry was not to be spared', 'That additional detail is included in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 13 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 3, 'What result in Deuteronomy 13 shows the consequence of obedience or disobedience?', '["evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor", "holiness shaped both eating and generosity", "public worship and public justice were both regulated"]'::jsonb, 'evil was to be purged from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 13 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 3, 'Who is especially in view in Deuteronomy 13?', '["Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel", "Israel as a holy people", "Israel gathering for feasts and appointing judges"]'::jsonb, 'Israel tested in loyalty to the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 3, 'What place or setting frames the action in Deuteronomy 13?', '["an apostate city in Israel", "the seventh year of release", "the place the LORD would choose", "among Israel"]'::jsonb, 'an apostate city in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 4, 'In Deuteronomy 13, what concrete act shows how the covenant was being applied?', '["even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year", "Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing"]'::jsonb, 'even a sign or wonder did not justify following other gods', 'That specific detail appears in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 13, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 4, 'In Deuteronomy 13, what further act or fact supports the chapter''s message?', '["a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously", "the tithe supported worship and the needy", "judges were forbidden to take bribes"]'::jsonb, 'a close relative enticing to idolatry was not to be spared', 'That additional detail is included in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 13, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 4, 'What larger event in Deuteronomy 13 gives those details their meaning?', '["the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor", "laws about clean foods and the tithe", "the annual feasts and the command for just judgment"]'::jsonb, 'the testing of covenant loyalty by enticement to other gods', 'That is the main event or action described in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 13 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 4, 'What result in Deuteronomy 13 shaped Israel''s future action?', '["evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor", "holiness shaped both eating and generosity", "public worship and public justice were both regulated"]'::jsonb, 'evil was to be purged from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 13 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 4, 'Why did this matter according to Deuteronomy 13?', '["love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery", "Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God"]'::jsonb, 'love for the LORD outranks every other allegiance', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 4, 'Who had to respond to these things in Deuteronomy 13?', '["Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel", "Israel as a holy people", "Israel gathering for feasts and appointing judges"]'::jsonb, 'Israel tested in loyalty to the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 4, 'Where is the action or teaching set in Deuteronomy 13?', '["an apostate city in Israel", "the seventh year of release", "the place the LORD would choose", "among Israel"]'::jsonb, 'an apostate city in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 13?', '["love for the LORD outranks every other allegiance", "the LORD had redeemed Israel from slavery", "Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God"]'::jsonb, 'love for the LORD outranks every other allegiance', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 5, 'What event in Deuteronomy 13 most clearly carries that message?', '["the testing of covenant loyalty by enticement to other gods", "the release of debts and generous treatment of the poor", "laws about clean foods and the tithe", "the annual feasts and the command for just judgment"]'::jsonb, 'the testing of covenant loyalty by enticement to other gods', 'That is the main event or action described in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 13 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 5, 'What detail in Deuteronomy 13 makes that message concrete?', '["even a sign or wonder did not justify following other gods", "debts were to be released among Israelites every seventh year", "Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing"]'::jsonb, 'even a sign or wonder did not justify following other gods', 'That specific detail appears in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 13 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 5, 'What additional detail in Deuteronomy 13 sharpens that message?', '["a close relative enticing to idolatry was not to be spared", "Hebrew servants were to be released generously", "the tithe supported worship and the needy", "judges were forbidden to take bribes"]'::jsonb, 'a close relative enticing to idolatry was not to be spared', 'That additional detail is included in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 13 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 5, 'What outcome in Deuteronomy 13 gives the chapter lasting force?', '["evil was to be purged from Israel", "Israel was commanded to open the hand wide to the poor", "holiness shaped both eating and generosity", "public worship and public justice were both regulated"]'::jsonb, 'evil was to be purged from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 13 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 5, 'Who stands under that message in Deuteronomy 13?', '["Israel tested in loyalty to the LORD", "debtors, servants, and needy brothers in Israel", "Israel as a holy people", "Israel gathering for feasts and appointing judges"]'::jsonb, 'Israel tested in loyalty to the LORD', 'That group is directly addressed or involved in the chapter. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 13, 5, 'What setting in Deuteronomy 13 helps anchor the message?', '["an apostate city in Israel", "the seventh year of release", "the place the LORD would choose", "among Israel"]'::jsonb, 'an apostate city in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 13:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 13 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 1, 'Who is the main speaker or figure in Deuteronomy 14?', '["the LORD", "the king and the judges", "Moses", "the elders and judges"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 1, 'Which group is most directly addressed or involved in Deuteronomy 14?', '["Israel as a holy people", "Israel gathering for feasts and appointing judges", "debtors, servants, and needy brothers in Israel", "leaders under the written law of God"]'::jsonb, 'Israel as a holy people', 'That group is directly addressed or involved in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 1, 'What place is central in Deuteronomy 14?', '["the place the LORD would choose", "among Israel", "the seventh year of release", "the cities of refuge"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 1, 'What event is described in Deuteronomy 14?', '["laws about clean foods and the tithe", "the annual feasts and the command for just judgment", "the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king"]'::jsonb, 'laws about clean foods and the tithe', 'That is the main event or action described in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 1, 'Which detail appears in Deuteronomy 14?', '["Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing", "debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place"]'::jsonb, 'Israel was forbidden to imitate pagan mourning practices', 'That specific detail appears in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 1, 'What other detail is included in Deuteronomy 14?', '["the tithe supported worship and the needy", "judges were forbidden to take bribes", "Hebrew servants were to be released generously", "the king was to write for himself a copy of the law"]'::jsonb, 'the tithe supported worship and the needy', 'That additional detail is included in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 1, 'What outcome is emphasized in Deuteronomy 14?', '["holiness shaped both eating and generosity", "public worship and public justice were both regulated", "Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word"]'::jsonb, 'holiness shaped both eating and generosity', 'That is the outcome emphasized in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 2, 'What was one reason given in Deuteronomy 14?', '["Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God", "the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers"]'::jsonb, 'Israel belonged to the LORD as His treasured possession', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 2, 'In Deuteronomy 14, what happened as a result of the chapter''s events or commands?', '["holiness shaped both eating and generosity", "public worship and public justice were both regulated", "Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word"]'::jsonb, 'holiness shaped both eating and generosity', 'That is the outcome emphasized in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 14, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 2, 'In Deuteronomy 14, what was the people''s situation or setting?', '["Israel as a holy people", "Israel gathering for feasts and appointing judges", "debtors, servants, and needy brothers in Israel", "leaders under the written law of God"]'::jsonb, 'Israel as a holy people', 'That group is directly addressed or involved in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 14, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 2, 'In Deuteronomy 14, which action or event took place?', '["laws about clean foods and the tithe", "the annual feasts and the command for just judgment", "the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king"]'::jsonb, 'laws about clean foods and the tithe', 'That is the main event or action described in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 14, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 2, 'In Deuteronomy 14, which concrete instruction or fact is mentioned?', '["Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing", "debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place"]'::jsonb, 'Israel was forbidden to imitate pagan mourning practices', 'That specific detail appears in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 14, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 2, 'In Deuteronomy 14, which additional fact is stated?', '["the tithe supported worship and the needy", "judges were forbidden to take bribes", "Hebrew servants were to be released generously", "the king was to write for himself a copy of the law"]'::jsonb, 'the tithe supported worship and the needy', 'That additional detail is included in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 14, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 2, 'In Deuteronomy 14, what location or setting matters to the chapter?', '["the place the LORD would choose", "among Israel", "the seventh year of release", "the cities of refuge"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 14, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 3, 'What does Deuteronomy 14 say that the LORD did or declared?', '["laws about clean foods and the tithe", "the annual feasts and the command for just judgment", "the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king"]'::jsonb, 'laws about clean foods and the tithe', 'That is the main event or action described in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 14 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 3, 'Why was this emphasized in Deuteronomy 14?', '["Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God", "the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers"]'::jsonb, 'Israel belonged to the LORD as His treasured possession', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 3, 'What fact in Deuteronomy 14 helps explain the chapter''s message?', '["Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing", "debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place"]'::jsonb, 'Israel was forbidden to imitate pagan mourning practices', 'That specific detail appears in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 14 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 3, 'What second fact in Deuteronomy 14 develops the chapter''s message?', '["the tithe supported worship and the needy", "judges were forbidden to take bribes", "Hebrew servants were to be released generously", "the king was to write for himself a copy of the law"]'::jsonb, 'the tithe supported worship and the needy', 'That additional detail is included in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 14 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 3, 'What result in Deuteronomy 14 shows the consequence of obedience or disobedience?', '["holiness shaped both eating and generosity", "public worship and public justice were both regulated", "Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word"]'::jsonb, 'holiness shaped both eating and generosity', 'That is the outcome emphasized in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 14 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 3, 'Who is especially in view in Deuteronomy 14?', '["Israel as a holy people", "Israel gathering for feasts and appointing judges", "debtors, servants, and needy brothers in Israel", "leaders under the written law of God"]'::jsonb, 'Israel as a holy people', 'That group is directly addressed or involved in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 3, 'What place or setting frames the action in Deuteronomy 14?', '["the place the LORD would choose", "among Israel", "the seventh year of release", "the cities of refuge"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 4, 'In Deuteronomy 14, what concrete act shows how the covenant was being applied?', '["Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing", "debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place"]'::jsonb, 'Israel was forbidden to imitate pagan mourning practices', 'That specific detail appears in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 14, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 4, 'In Deuteronomy 14, what further act or fact supports the chapter''s message?', '["the tithe supported worship and the needy", "judges were forbidden to take bribes", "Hebrew servants were to be released generously", "the king was to write for himself a copy of the law"]'::jsonb, 'the tithe supported worship and the needy', 'That additional detail is included in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 14, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 4, 'What larger event in Deuteronomy 14 gives those details their meaning?', '["laws about clean foods and the tithe", "the annual feasts and the command for just judgment", "the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king"]'::jsonb, 'laws about clean foods and the tithe', 'That is the main event or action described in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 14 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 4, 'What result in Deuteronomy 14 shaped Israel''s future action?', '["holiness shaped both eating and generosity", "public worship and public justice were both regulated", "Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word"]'::jsonb, 'holiness shaped both eating and generosity', 'That is the outcome emphasized in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 14 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 4, 'Why did this matter according to Deuteronomy 14?', '["Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God", "the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers"]'::jsonb, 'Israel belonged to the LORD as His treasured possession', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 4, 'Who had to respond to these things in Deuteronomy 14?', '["Israel as a holy people", "Israel gathering for feasts and appointing judges", "debtors, servants, and needy brothers in Israel", "leaders under the written law of God"]'::jsonb, 'Israel as a holy people', 'That group is directly addressed or involved in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 4, 'Where is the action or teaching set in Deuteronomy 14?', '["the place the LORD would choose", "among Israel", "the seventh year of release", "the cities of refuge"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 14?', '["Israel belonged to the LORD as His treasured possession", "a holy nation must celebrate and judge rightly before God", "the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers"]'::jsonb, 'Israel belonged to the LORD as His treasured possession', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 5, 'What event in Deuteronomy 14 most clearly carries that message?', '["laws about clean foods and the tithe", "the annual feasts and the command for just judgment", "the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king"]'::jsonb, 'laws about clean foods and the tithe', 'That is the main event or action described in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 14 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 5, 'What detail in Deuteronomy 14 makes that message concrete?', '["Israel was forbidden to imitate pagan mourning practices", "Passover, Weeks, and Booths were to be observed with rejoicing", "debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place"]'::jsonb, 'Israel was forbidden to imitate pagan mourning practices', 'That specific detail appears in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 14 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 5, 'What additional detail in Deuteronomy 14 sharpens that message?', '["the tithe supported worship and the needy", "judges were forbidden to take bribes", "Hebrew servants were to be released generously", "the king was to write for himself a copy of the law"]'::jsonb, 'the tithe supported worship and the needy', 'That additional detail is included in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 14 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 5, 'What outcome in Deuteronomy 14 gives the chapter lasting force?', '["holiness shaped both eating and generosity", "public worship and public justice were both regulated", "Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word"]'::jsonb, 'holiness shaped both eating and generosity', 'That is the outcome emphasized in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 14 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 5, 'Who stands under that message in Deuteronomy 14?', '["Israel as a holy people", "Israel gathering for feasts and appointing judges", "debtors, servants, and needy brothers in Israel", "leaders under the written law of God"]'::jsonb, 'Israel as a holy people', 'That group is directly addressed or involved in the chapter. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 14, 5, 'What setting in Deuteronomy 14 helps anchor the message?', '["the place the LORD would choose", "among Israel", "the seventh year of release", "the cities of refuge"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 14:1-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 14 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 1, 'Who is the main speaker or figure in Deuteronomy 15?', '["the LORD", "the king and the judges", "Moses", "the elders and judges"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 1, 'Which group is most directly addressed or involved in Deuteronomy 15?', '["debtors, servants, and needy brothers in Israel", "leaders under the written law of God", "Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance"]'::jsonb, 'debtors, servants, and needy brothers in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 1, 'What place is central in Deuteronomy 15?', '["the seventh year of release", "among Israel", "the place the LORD would choose", "the cities of refuge"]'::jsonb, 'the seventh year of release', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 1, 'What event is described in Deuteronomy 15?', '["the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king", "the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses"]'::jsonb, 'the release of debts and generous treatment of the poor', 'That is the main event or action described in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 1, 'Which detail appears in Deuteronomy 15?', '["debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place", "Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others"]'::jsonb, 'debts were to be released among Israelites every seventh year', 'That specific detail appears in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 1, 'What other detail is included in Deuteronomy 15?', '["Hebrew servants were to be released generously", "the king was to write for himself a copy of the law", "judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people"]'::jsonb, 'Hebrew servants were to be released generously', 'That additional detail is included in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 1, 'What outcome is emphasized in Deuteronomy 15?', '["Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word", "public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination"]'::jsonb, 'Israel was commanded to open the hand wide to the poor', 'That is the outcome emphasized in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 2, 'What was one reason given in Deuteronomy 15?', '["the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers", "a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people"]'::jsonb, 'the LORD had redeemed Israel from slavery', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 2, 'In Deuteronomy 15, what happened as a result of the chapter''s events or commands?', '["Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word", "public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination"]'::jsonb, 'Israel was commanded to open the hand wide to the poor', 'That is the outcome emphasized in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 15, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 2, 'In Deuteronomy 15, what was the people''s situation or setting?', '["debtors, servants, and needy brothers in Israel", "leaders under the written law of God", "Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance"]'::jsonb, 'debtors, servants, and needy brothers in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 15, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 2, 'In Deuteronomy 15, which action or event took place?', '["the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king", "the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses"]'::jsonb, 'the release of debts and generous treatment of the poor', 'That is the main event or action described in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 15, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 2, 'In Deuteronomy 15, which concrete instruction or fact is mentioned?', '["debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place", "Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others"]'::jsonb, 'debts were to be released among Israelites every seventh year', 'That specific detail appears in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 15, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 2, 'In Deuteronomy 15, which additional fact is stated?', '["Hebrew servants were to be released generously", "the king was to write for himself a copy of the law", "judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people"]'::jsonb, 'Hebrew servants were to be released generously', 'That additional detail is included in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 15, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 2, 'In Deuteronomy 15, what location or setting matters to the chapter?', '["the seventh year of release", "among Israel", "the place the LORD would choose", "the cities of refuge"]'::jsonb, 'the seventh year of release', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 15, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 3, 'What does Deuteronomy 15 say that the LORD did or declared?', '["the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king", "the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses"]'::jsonb, 'the release of debts and generous treatment of the poor', 'That is the main event or action described in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 15 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 3, 'Why was this emphasized in Deuteronomy 15?', '["the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers", "a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people"]'::jsonb, 'the LORD had redeemed Israel from slavery', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 3, 'What fact in Deuteronomy 15 helps explain the chapter''s message?', '["debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place", "Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others"]'::jsonb, 'debts were to be released among Israelites every seventh year', 'That specific detail appears in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 15 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 3, 'What second fact in Deuteronomy 15 develops the chapter''s message?', '["Hebrew servants were to be released generously", "the king was to write for himself a copy of the law", "judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people"]'::jsonb, 'Hebrew servants were to be released generously', 'That additional detail is included in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 15 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 3, 'What result in Deuteronomy 15 shows the consequence of obedience or disobedience?', '["Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word", "public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination"]'::jsonb, 'Israel was commanded to open the hand wide to the poor', 'That is the outcome emphasized in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 15 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 3, 'Who is especially in view in Deuteronomy 15?', '["debtors, servants, and needy brothers in Israel", "leaders under the written law of God", "Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance"]'::jsonb, 'debtors, servants, and needy brothers in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 3, 'What place or setting frames the action in Deuteronomy 15?', '["the seventh year of release", "among Israel", "the place the LORD would choose", "the cities of refuge"]'::jsonb, 'the seventh year of release', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 4, 'In Deuteronomy 15, what concrete act shows how the covenant was being applied?', '["debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place", "Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others"]'::jsonb, 'debts were to be released among Israelites every seventh year', 'That specific detail appears in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 15, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 4, 'In Deuteronomy 15, what further act or fact supports the chapter''s message?', '["Hebrew servants were to be released generously", "the king was to write for himself a copy of the law", "judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people"]'::jsonb, 'Hebrew servants were to be released generously', 'That additional detail is included in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 15, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 4, 'What larger event in Deuteronomy 15 gives those details their meaning?', '["the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king", "the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses"]'::jsonb, 'the release of debts and generous treatment of the poor', 'That is the main event or action described in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 15 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 4, 'What result in Deuteronomy 15 shaped Israel''s future action?', '["Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word", "public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination"]'::jsonb, 'Israel was commanded to open the hand wide to the poor', 'That is the outcome emphasized in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 15 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 4, 'Why did this matter according to Deuteronomy 15?', '["the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers", "a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people"]'::jsonb, 'the LORD had redeemed Israel from slavery', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 4, 'Who had to respond to these things in Deuteronomy 15?', '["debtors, servants, and needy brothers in Israel", "leaders under the written law of God", "Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance"]'::jsonb, 'debtors, servants, and needy brothers in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 4, 'Where is the action or teaching set in Deuteronomy 15?', '["the seventh year of release", "among Israel", "the place the LORD would choose", "the cities of refuge"]'::jsonb, 'the seventh year of release', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 15?', '["the LORD had redeemed Israel from slavery", "leaders were not to exalt themselves above their brothers", "a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people"]'::jsonb, 'the LORD had redeemed Israel from slavery', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 5, 'What event in Deuteronomy 15 most clearly carries that message?', '["the release of debts and generous treatment of the poor", "rules for difficult legal cases and for any future king", "the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses"]'::jsonb, 'the release of debts and generous treatment of the poor', 'That is the main event or action described in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 15 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 5, 'What detail in Deuteronomy 15 makes that message concrete?', '["debts were to be released among Israelites every seventh year", "hard cases were to be brought to the priests and judge at the chosen place", "Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others"]'::jsonb, 'debts were to be released among Israelites every seventh year', 'That specific detail appears in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 15 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 5, 'What additional detail in Deuteronomy 15 sharpens that message?', '["Hebrew servants were to be released generously", "the king was to write for himself a copy of the law", "judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people"]'::jsonb, 'Hebrew servants were to be released generously', 'That additional detail is included in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 15 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 5, 'What outcome in Deuteronomy 15 gives the chapter lasting force?', '["Israel was commanded to open the hand wide to the poor", "authority in Israel was placed under God''s word", "public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination"]'::jsonb, 'Israel was commanded to open the hand wide to the poor', 'That is the outcome emphasized in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 15 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 5, 'Who stands under that message in Deuteronomy 15?', '["debtors, servants, and needy brothers in Israel", "leaders under the written law of God", "Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance"]'::jsonb, 'debtors, servants, and needy brothers in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 15, 5, 'What setting in Deuteronomy 15 helps anchor the message?', '["the seventh year of release", "among Israel", "the place the LORD would choose", "the cities of refuge"]'::jsonb, 'the seventh year of release', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 15:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 15 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 1, 'Who is the main speaker or figure in Deuteronomy 16?', '["Moses", "the LORD", "the king and the judges", "the elders and judges"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 1, 'Which group is most directly addressed or involved in Deuteronomy 16?', '["Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance", "leaders under the written law of God", "manslayers, witnesses, and courts in Israel"]'::jsonb, 'Israel gathering for feasts and appointing judges', 'That group is directly addressed or involved in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 1, 'What place is central in Deuteronomy 16?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 1, 'What event is described in Deuteronomy 16?', '["the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses", "rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony"]'::jsonb, 'the annual feasts and the command for just judgment', 'That is the main event or action described in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 1, 'Which detail appears in Deuteronomy 16?', '["Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others", "hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city"]'::jsonb, 'Passover, Weeks, and Booths were to be observed with rejoicing', 'That specific detail appears in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 1, 'What other detail is included in Deuteronomy 16?', '["judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people", "the king was to write for himself a copy of the law", "a single witness was not enough in serious cases"]'::jsonb, 'judges were forbidden to take bribes', 'That additional detail is included in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 1, 'What outcome is emphasized in Deuteronomy 16?', '["public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination", "authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel"]'::jsonb, 'public worship and public justice were both regulated', 'That is the outcome emphasized in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 2, 'What was one reason given in Deuteronomy 16?', '["a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people", "leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process"]'::jsonb, 'a holy nation must celebrate and judge rightly before God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 2, 'In Deuteronomy 16, what happened as a result of the chapter''s events or commands?', '["public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination", "authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel"]'::jsonb, 'public worship and public justice were both regulated', 'That is the outcome emphasized in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 16, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 2, 'In Deuteronomy 16, what was the people''s situation or setting?', '["Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance", "leaders under the written law of God", "manslayers, witnesses, and courts in Israel"]'::jsonb, 'Israel gathering for feasts and appointing judges', 'That group is directly addressed or involved in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 16, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 2, 'In Deuteronomy 16, which action or event took place?', '["the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses", "rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony"]'::jsonb, 'the annual feasts and the command for just judgment', 'That is the main event or action described in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 16, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 2, 'In Deuteronomy 16, which concrete instruction or fact is mentioned?', '["Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others", "hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city"]'::jsonb, 'Passover, Weeks, and Booths were to be observed with rejoicing', 'That specific detail appears in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 16, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 2, 'In Deuteronomy 16, which additional fact is stated?', '["judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people", "the king was to write for himself a copy of the law", "a single witness was not enough in serious cases"]'::jsonb, 'judges were forbidden to take bribes', 'That additional detail is included in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 16, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 2, 'In Deuteronomy 16, what location or setting matters to the chapter?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 16, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 3, 'What does Deuteronomy 16 say that Moses did or declared?', '["the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses", "rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony"]'::jsonb, 'the annual feasts and the command for just judgment', 'That is the main event or action described in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 16 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 3, 'Why was this emphasized in Deuteronomy 16?', '["a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people", "leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process"]'::jsonb, 'a holy nation must celebrate and judge rightly before God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 3, 'What fact in Deuteronomy 16 helps explain the chapter''s message?', '["Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others", "hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city"]'::jsonb, 'Passover, Weeks, and Booths were to be observed with rejoicing', 'That specific detail appears in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 16 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 3, 'What second fact in Deuteronomy 16 develops the chapter''s message?', '["judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people", "the king was to write for himself a copy of the law", "a single witness was not enough in serious cases"]'::jsonb, 'judges were forbidden to take bribes', 'That additional detail is included in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 16 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 3, 'What result in Deuteronomy 16 shows the consequence of obedience or disobedience?', '["public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination", "authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel"]'::jsonb, 'public worship and public justice were both regulated', 'That is the outcome emphasized in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 16 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 3, 'Who is especially in view in Deuteronomy 16?', '["Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance", "leaders under the written law of God", "manslayers, witnesses, and courts in Israel"]'::jsonb, 'Israel gathering for feasts and appointing judges', 'That group is directly addressed or involved in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 3, 'What place or setting frames the action in Deuteronomy 16?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 4, 'In Deuteronomy 16, what concrete act shows how the covenant was being applied?', '["Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others", "hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city"]'::jsonb, 'Passover, Weeks, and Booths were to be observed with rejoicing', 'That specific detail appears in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 16, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 4, 'In Deuteronomy 16, what further act or fact supports the chapter''s message?', '["judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people", "the king was to write for himself a copy of the law", "a single witness was not enough in serious cases"]'::jsonb, 'judges were forbidden to take bribes', 'That additional detail is included in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 16, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 4, 'What larger event in Deuteronomy 16 gives those details their meaning?', '["the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses", "rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony"]'::jsonb, 'the annual feasts and the command for just judgment', 'That is the main event or action described in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 16 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 4, 'What result in Deuteronomy 16 shaped Israel''s future action?', '["public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination", "authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel"]'::jsonb, 'public worship and public justice were both regulated', 'That is the outcome emphasized in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 16 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 4, 'Why did this matter according to Deuteronomy 16?', '["a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people", "leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process"]'::jsonb, 'a holy nation must celebrate and judge rightly before God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 4, 'Who had to respond to these things in Deuteronomy 16?', '["Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance", "leaders under the written law of God", "manslayers, witnesses, and courts in Israel"]'::jsonb, 'Israel gathering for feasts and appointing judges', 'That group is directly addressed or involved in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 4, 'Where is the action or teaching set in Deuteronomy 16?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 16?', '["a holy nation must celebrate and judge rightly before God", "God Himself would provide true revelation for His people", "leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process"]'::jsonb, 'a holy nation must celebrate and judge rightly before God', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 5, 'What event in Deuteronomy 16 most clearly carries that message?', '["the annual feasts and the command for just judgment", "support for priests and the promise of a prophet like Moses", "rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony"]'::jsonb, 'the annual feasts and the command for just judgment', 'That is the main event or action described in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 16 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 5, 'What detail in Deuteronomy 16 makes that message concrete?', '["Passover, Weeks, and Booths were to be observed with rejoicing", "priests and Levites had no tribal inheritance like the others", "hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city"]'::jsonb, 'Passover, Weeks, and Booths were to be observed with rejoicing', 'That specific detail appears in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 16 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 5, 'What additional detail in Deuteronomy 16 sharpens that message?', '["judges were forbidden to take bribes", "a prophet like Moses would be raised up from among the people", "the king was to write for himself a copy of the law", "a single witness was not enough in serious cases"]'::jsonb, 'judges were forbidden to take bribes', 'That additional detail is included in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 16 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 5, 'What outcome in Deuteronomy 16 gives the chapter lasting force?', '["public worship and public justice were both regulated", "Israel was forbidden to imitate pagan divination", "authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel"]'::jsonb, 'public worship and public justice were both regulated', 'That is the outcome emphasized in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 16 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 5, 'Who stands under that message in Deuteronomy 16?', '["Israel gathering for feasts and appointing judges", "priests, Levites, prophets, and Israel seeking guidance", "leaders under the written law of God", "manslayers, witnesses, and courts in Israel"]'::jsonb, 'Israel gathering for feasts and appointing judges', 'That group is directly addressed or involved in the chapter. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 16, 5, 'What setting in Deuteronomy 16 helps anchor the message?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 16:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 16 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 1, 'Who is the main speaker or figure in Deuteronomy 17?', '["the king and the judges", "the elders and judges", "the LORD", "the priest"]'::jsonb, 'the king and the judges', 'the king and the judges is central in this chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 1, 'Which group is most directly addressed or involved in Deuteronomy 17?', '["leaders under the written law of God", "manslayers, witnesses, and courts in Israel", "priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle"]'::jsonb, 'leaders under the written law of God', 'That group is directly addressed or involved in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 1, 'What place is central in Deuteronomy 17?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 1, 'What event is described in Deuteronomy 17?', '["rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony", "support for priests and the promise of a prophet like Moses", "laws regulating warfare"]'::jsonb, 'rules for difficult legal cases and for any future king', 'That is the main event or action described in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 1, 'Which detail appears in Deuteronomy 17?', '["hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city", "priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them"]'::jsonb, 'hard cases were to be brought to the priests and judge at the chosen place', 'That specific detail appears in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 1, 'What other detail is included in Deuteronomy 17?', '["the king was to write for himself a copy of the law", "a single witness was not enough in serious cases", "a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear"]'::jsonb, 'the king was to write for himself a copy of the law', 'That additional detail is included in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 1, 'What outcome is emphasized in Deuteronomy 17?', '["authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel", "Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint"]'::jsonb, 'authority in Israel was placed under God''s word', 'That is the outcome emphasized in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 2, 'What was one reason given in Deuteronomy 17?', '["leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process", "God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them"]'::jsonb, 'leaders were not to exalt themselves above their brothers', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 2, 'In Deuteronomy 17, what happened as a result of the chapter''s events or commands?', '["authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel", "Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint"]'::jsonb, 'authority in Israel was placed under God''s word', 'That is the outcome emphasized in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 17, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 2, 'In Deuteronomy 17, what was the people''s situation or setting?', '["leaders under the written law of God", "manslayers, witnesses, and courts in Israel", "priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle"]'::jsonb, 'leaders under the written law of God', 'That group is directly addressed or involved in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 17, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 2, 'In Deuteronomy 17, which action or event took place?', '["rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony", "support for priests and the promise of a prophet like Moses", "laws regulating warfare"]'::jsonb, 'rules for difficult legal cases and for any future king', 'That is the main event or action described in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 17, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 2, 'In Deuteronomy 17, which concrete instruction or fact is mentioned?', '["hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city", "priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them"]'::jsonb, 'hard cases were to be brought to the priests and judge at the chosen place', 'That specific detail appears in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 17, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 2, 'In Deuteronomy 17, which additional fact is stated?', '["the king was to write for himself a copy of the law", "a single witness was not enough in serious cases", "a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear"]'::jsonb, 'the king was to write for himself a copy of the law', 'That additional detail is included in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 17, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 2, 'In Deuteronomy 17, what location or setting matters to the chapter?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 17, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 3, 'What does Deuteronomy 17 say that the king and the judges did or declared?', '["rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony", "support for priests and the promise of a prophet like Moses", "laws regulating warfare"]'::jsonb, 'rules for difficult legal cases and for any future king', 'That is the main event or action described in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 17 say that the king and the judges did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 3, 'Why was this emphasized in Deuteronomy 17?', '["leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process", "God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them"]'::jsonb, 'leaders were not to exalt themselves above their brothers', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 3, 'What fact in Deuteronomy 17 helps explain the chapter''s message?', '["hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city", "priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them"]'::jsonb, 'hard cases were to be brought to the priests and judge at the chosen place', 'That specific detail appears in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 17 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 3, 'What second fact in Deuteronomy 17 develops the chapter''s message?', '["the king was to write for himself a copy of the law", "a single witness was not enough in serious cases", "a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear"]'::jsonb, 'the king was to write for himself a copy of the law', 'That additional detail is included in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 17 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 3, 'What result in Deuteronomy 17 shows the consequence of obedience or disobedience?', '["authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel", "Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint"]'::jsonb, 'authority in Israel was placed under God''s word', 'That is the outcome emphasized in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 17 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 3, 'Who is especially in view in Deuteronomy 17?', '["leaders under the written law of God", "manslayers, witnesses, and courts in Israel", "priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle"]'::jsonb, 'leaders under the written law of God', 'That group is directly addressed or involved in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 3, 'What place or setting frames the action in Deuteronomy 17?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 4, 'In Deuteronomy 17, what concrete act shows how the covenant was being applied?', '["hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city", "priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them"]'::jsonb, 'hard cases were to be brought to the priests and judge at the chosen place', 'That specific detail appears in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 17, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 4, 'In Deuteronomy 17, what further act or fact supports the chapter''s message?', '["the king was to write for himself a copy of the law", "a single witness was not enough in serious cases", "a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear"]'::jsonb, 'the king was to write for himself a copy of the law', 'That additional detail is included in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 17, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 4, 'What larger event in Deuteronomy 17 gives those details their meaning?', '["rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony", "support for priests and the promise of a prophet like Moses", "laws regulating warfare"]'::jsonb, 'rules for difficult legal cases and for any future king', 'That is the main event or action described in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 17 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 4, 'What result in Deuteronomy 17 shaped Israel''s future action?', '["authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel", "Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint"]'::jsonb, 'authority in Israel was placed under God''s word', 'That is the outcome emphasized in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 17 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 4, 'Why did this matter according to Deuteronomy 17?', '["leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process", "God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them"]'::jsonb, 'leaders were not to exalt themselves above their brothers', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 4, 'Who had to respond to these things in Deuteronomy 17?', '["leaders under the written law of God", "manslayers, witnesses, and courts in Israel", "priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle"]'::jsonb, 'leaders under the written law of God', 'That group is directly addressed or involved in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 4, 'Where is the action or teaching set in Deuteronomy 17?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 17?', '["leaders were not to exalt themselves above their brothers", "justice required both mercy and truthful process", "God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them"]'::jsonb, 'leaders were not to exalt themselves above their brothers', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 5, 'What event in Deuteronomy 17 most clearly carries that message?', '["rules for difficult legal cases and for any future king", "laws about refuge cities and reliable testimony", "support for priests and the promise of a prophet like Moses", "laws regulating warfare"]'::jsonb, 'rules for difficult legal cases and for any future king', 'That is the main event or action described in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 17 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 5, 'What detail in Deuteronomy 17 makes that message concrete?', '["hard cases were to be brought to the priests and judge at the chosen place", "one who killed unintentionally could flee to a refuge city", "priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them"]'::jsonb, 'hard cases were to be brought to the priests and judge at the chosen place', 'That specific detail appears in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 17 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 5, 'What additional detail in Deuteronomy 17 sharpens that message?', '["the king was to write for himself a copy of the law", "a single witness was not enough in serious cases", "a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear"]'::jsonb, 'the king was to write for himself a copy of the law', 'That additional detail is included in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 17 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 5, 'What outcome in Deuteronomy 17 gives the chapter lasting force?', '["authority in Israel was placed under God''s word", "innocent blood was to be kept away from Israel", "Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint"]'::jsonb, 'authority in Israel was placed under God''s word', 'That is the outcome emphasized in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 17 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 5, 'Who stands under that message in Deuteronomy 17?', '["leaders under the written law of God", "manslayers, witnesses, and courts in Israel", "priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle"]'::jsonb, 'leaders under the written law of God', 'That group is directly addressed or involved in the chapter. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 17, 5, 'What setting in Deuteronomy 17 helps anchor the message?', '["the place the LORD would choose", "the cities of refuge", "among Israel", "the battlefield"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 17:8-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 17 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 1, 'Who is the main speaker or figure in Deuteronomy 18?', '["the LORD", "the priest", "the elders and judges", "the elders"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 1, 'Which group is most directly addressed or involved in Deuteronomy 18?', '["priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle", "manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases"]'::jsonb, 'priests, Levites, prophets, and Israel seeking guidance', 'That group is directly addressed or involved in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 1, 'What place is central in Deuteronomy 18?', '["among Israel", "the battlefield", "the cities of refuge", "an uncultivated valley"]'::jsonb, 'among Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 1, 'What event is described in Deuteronomy 18?', '["support for priests and the promise of a prophet like Moses", "laws regulating warfare", "laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws"]'::jsonb, 'support for priests and the promise of a prophet like Moses', 'That is the main event or action described in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 1, 'Which detail appears in Deuteronomy 18?', '["priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them", "one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony"]'::jsonb, 'priests and Levites had no tribal inheritance like the others', 'That specific detail appears in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 1, 'What other detail is included in Deuteronomy 18?', '["a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear", "a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son"]'::jsonb, 'a prophet like Moses would be raised up from among the people', 'That additional detail is included in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 1, 'What outcome is emphasized in Deuteronomy 18?', '["Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint", "innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order"]'::jsonb, 'Israel was forbidden to imitate pagan divination', 'That is the outcome emphasized in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 2, 'What was one reason given in Deuteronomy 18?', '["God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them", "justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD"]'::jsonb, 'God Himself would provide true revelation for His people', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 2, 'In Deuteronomy 18, what happened as a result of the chapter''s events or commands?', '["Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint", "innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order"]'::jsonb, 'Israel was forbidden to imitate pagan divination', 'That is the outcome emphasized in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 18, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 2, 'In Deuteronomy 18, what was the people''s situation or setting?', '["priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle", "manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases"]'::jsonb, 'priests, Levites, prophets, and Israel seeking guidance', 'That group is directly addressed or involved in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 18, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 2, 'In Deuteronomy 18, which action or event took place?', '["support for priests and the promise of a prophet like Moses", "laws regulating warfare", "laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws"]'::jsonb, 'support for priests and the promise of a prophet like Moses', 'That is the main event or action described in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 18, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 2, 'In Deuteronomy 18, which concrete instruction or fact is mentioned?', '["priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them", "one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony"]'::jsonb, 'priests and Levites had no tribal inheritance like the others', 'That specific detail appears in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 18, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 2, 'In Deuteronomy 18, which additional fact is stated?', '["a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear", "a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son"]'::jsonb, 'a prophet like Moses would be raised up from among the people', 'That additional detail is included in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 18, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 2, 'In Deuteronomy 18, what location or setting matters to the chapter?', '["among Israel", "the battlefield", "the cities of refuge", "an uncultivated valley"]'::jsonb, 'among Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 18, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 3, 'What does Deuteronomy 18 say that the LORD did or declared?', '["support for priests and the promise of a prophet like Moses", "laws regulating warfare", "laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws"]'::jsonb, 'support for priests and the promise of a prophet like Moses', 'That is the main event or action described in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 18 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 3, 'Why was this emphasized in Deuteronomy 18?', '["God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them", "justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD"]'::jsonb, 'God Himself would provide true revelation for His people', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 3, 'What fact in Deuteronomy 18 helps explain the chapter''s message?', '["priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them", "one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony"]'::jsonb, 'priests and Levites had no tribal inheritance like the others', 'That specific detail appears in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 18 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 3, 'What second fact in Deuteronomy 18 develops the chapter''s message?', '["a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear", "a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son"]'::jsonb, 'a prophet like Moses would be raised up from among the people', 'That additional detail is included in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 18 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 3, 'What result in Deuteronomy 18 shows the consequence of obedience or disobedience?', '["Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint", "innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order"]'::jsonb, 'Israel was forbidden to imitate pagan divination', 'That is the outcome emphasized in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 18 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 3, 'Who is especially in view in Deuteronomy 18?', '["priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle", "manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases"]'::jsonb, 'priests, Levites, prophets, and Israel seeking guidance', 'That group is directly addressed or involved in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 3, 'What place or setting frames the action in Deuteronomy 18?', '["among Israel", "the battlefield", "the cities of refuge", "an uncultivated valley"]'::jsonb, 'among Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 4, 'In Deuteronomy 18, what concrete act shows how the covenant was being applied?', '["priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them", "one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony"]'::jsonb, 'priests and Levites had no tribal inheritance like the others', 'That specific detail appears in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 18, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 4, 'In Deuteronomy 18, what further act or fact supports the chapter''s message?', '["a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear", "a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son"]'::jsonb, 'a prophet like Moses would be raised up from among the people', 'That additional detail is included in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 18, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 4, 'What larger event in Deuteronomy 18 gives those details their meaning?', '["support for priests and the promise of a prophet like Moses", "laws regulating warfare", "laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws"]'::jsonb, 'support for priests and the promise of a prophet like Moses', 'That is the main event or action described in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 18 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 4, 'What result in Deuteronomy 18 shaped Israel''s future action?', '["Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint", "innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order"]'::jsonb, 'Israel was forbidden to imitate pagan divination', 'That is the outcome emphasized in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 18 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 4, 'Why did this matter according to Deuteronomy 18?', '["God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them", "justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD"]'::jsonb, 'God Himself would provide true revelation for His people', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 4, 'Who had to respond to these things in Deuteronomy 18?', '["priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle", "manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases"]'::jsonb, 'priests, Levites, prophets, and Israel seeking guidance', 'That group is directly addressed or involved in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 4, 'Where is the action or teaching set in Deuteronomy 18?', '["among Israel", "the battlefield", "the cities of refuge", "an uncultivated valley"]'::jsonb, 'among Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 18?', '["God Himself would provide true revelation for His people", "the LORD went with Israel to fight for them", "justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD"]'::jsonb, 'God Himself would provide true revelation for His people', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 5, 'What event in Deuteronomy 18 most clearly carries that message?', '["support for priests and the promise of a prophet like Moses", "laws regulating warfare", "laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws"]'::jsonb, 'support for priests and the promise of a prophet like Moses', 'That is the main event or action described in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 18 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 5, 'What detail in Deuteronomy 18 makes that message concrete?', '["priests and Levites had no tribal inheritance like the others", "the priest told the people not to fear because the LORD fought for them", "one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony"]'::jsonb, 'priests and Levites had no tribal inheritance like the others', 'That specific detail appears in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 18 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 5, 'What additional detail in Deuteronomy 18 sharpens that message?', '["a prophet like Moses would be raised up from among the people", "certain men were excused from battle because of new commitments or fear", "a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son"]'::jsonb, 'a prophet like Moses would be raised up from among the people', 'That additional detail is included in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 18 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 5, 'What outcome in Deuteronomy 18 gives the chapter lasting force?', '["Israel was forbidden to imitate pagan divination", "warfare was regulated by trust in God and ordered restraint", "innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order"]'::jsonb, 'Israel was forbidden to imitate pagan divination', 'That is the outcome emphasized in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 18 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 5, 'Who stands under that message in Deuteronomy 18?', '["priests, Levites, prophets, and Israel seeking guidance", "Israelite soldiers going into battle", "manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases"]'::jsonb, 'priests, Levites, prophets, and Israel seeking guidance', 'That group is directly addressed or involved in the chapter. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 18, 5, 'What setting in Deuteronomy 18 helps anchor the message?', '["among Israel", "the battlefield", "the cities of refuge", "an uncultivated valley"]'::jsonb, 'among Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 18:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 18 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 1, 'Who is the main speaker or figure in Deuteronomy 19?', '["the elders and judges", "the elders", "the priest", "Israelites"]'::jsonb, 'the elders and judges', 'the elders and judges is central in this chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 1, 'Which group is most directly addressed or involved in Deuteronomy 19?', '["manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases", "Israelite soldiers going into battle", "neighbors, households, and engaged persons"]'::jsonb, 'manslayers, witnesses, and courts in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 1, 'What place is central in Deuteronomy 19?', '["the cities of refuge", "an uncultivated valley", "the battlefield", "ordinary life in Israel"]'::jsonb, 'the cities of refuge', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 1, 'What event is described in Deuteronomy 19?', '["laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws", "laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions"]'::jsonb, 'laws about refuge cities and reliable testimony', 'That is the main event or action described in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 1, 'Which detail appears in Deuteronomy 19?', '["one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony", "the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned"]'::jsonb, 'one who killed unintentionally could flee to a refuge city', 'That specific detail appears in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 1, 'What other detail is included in Deuteronomy 19?', '["a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son", "certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated"]'::jsonb, 'a single witness was not enough in serious cases', 'That additional detail is included in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 1, 'What outcome is emphasized in Deuteronomy 19?', '["innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order", "warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care"]'::jsonb, 'innocent blood was to be kept away from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 2, 'What was one reason given in Deuteronomy 19?', '["justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD", "the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations"]'::jsonb, 'justice required both mercy and truthful process', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 2, 'In Deuteronomy 19, what happened as a result of the chapter''s events or commands?', '["innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order", "warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care"]'::jsonb, 'innocent blood was to be kept away from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 19, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 2, 'In Deuteronomy 19, what was the people''s situation or setting?', '["manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases", "Israelite soldiers going into battle", "neighbors, households, and engaged persons"]'::jsonb, 'manslayers, witnesses, and courts in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 19, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 2, 'In Deuteronomy 19, which action or event took place?', '["laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws", "laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions"]'::jsonb, 'laws about refuge cities and reliable testimony', 'That is the main event or action described in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 19, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 2, 'In Deuteronomy 19, which concrete instruction or fact is mentioned?', '["one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony", "the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned"]'::jsonb, 'one who killed unintentionally could flee to a refuge city', 'That specific detail appears in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 19, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 2, 'In Deuteronomy 19, which additional fact is stated?', '["a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son", "certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated"]'::jsonb, 'a single witness was not enough in serious cases', 'That additional detail is included in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 19, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 2, 'In Deuteronomy 19, what location or setting matters to the chapter?', '["the cities of refuge", "an uncultivated valley", "the battlefield", "ordinary life in Israel"]'::jsonb, 'the cities of refuge', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 19, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 3, 'What does Deuteronomy 19 say that the elders and judges did or declared?', '["laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws", "laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions"]'::jsonb, 'laws about refuge cities and reliable testimony', 'That is the main event or action described in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 19 say that the elders and judges did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 3, 'Why was this emphasized in Deuteronomy 19?', '["justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD", "the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations"]'::jsonb, 'justice required both mercy and truthful process', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 3, 'What fact in Deuteronomy 19 helps explain the chapter''s message?', '["one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony", "the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned"]'::jsonb, 'one who killed unintentionally could flee to a refuge city', 'That specific detail appears in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 19 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 3, 'What second fact in Deuteronomy 19 develops the chapter''s message?', '["a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son", "certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated"]'::jsonb, 'a single witness was not enough in serious cases', 'That additional detail is included in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 19 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 3, 'What result in Deuteronomy 19 shows the consequence of obedience or disobedience?', '["innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order", "warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care"]'::jsonb, 'innocent blood was to be kept away from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 19 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 3, 'Who is especially in view in Deuteronomy 19?', '["manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases", "Israelite soldiers going into battle", "neighbors, households, and engaged persons"]'::jsonb, 'manslayers, witnesses, and courts in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 3, 'What place or setting frames the action in Deuteronomy 19?', '["the cities of refuge", "an uncultivated valley", "the battlefield", "ordinary life in Israel"]'::jsonb, 'the cities of refuge', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 4, 'In Deuteronomy 19, what concrete act shows how the covenant was being applied?', '["one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony", "the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned"]'::jsonb, 'one who killed unintentionally could flee to a refuge city', 'That specific detail appears in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 19, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 4, 'In Deuteronomy 19, what further act or fact supports the chapter''s message?', '["a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son", "certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated"]'::jsonb, 'a single witness was not enough in serious cases', 'That additional detail is included in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 19, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 4, 'What larger event in Deuteronomy 19 gives those details their meaning?', '["laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws", "laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions"]'::jsonb, 'laws about refuge cities and reliable testimony', 'That is the main event or action described in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 19 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 4, 'What result in Deuteronomy 19 shaped Israel''s future action?', '["innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order", "warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care"]'::jsonb, 'innocent blood was to be kept away from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 19 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 4, 'Why did this matter according to Deuteronomy 19?', '["justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD", "the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations"]'::jsonb, 'justice required both mercy and truthful process', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 4, 'Who had to respond to these things in Deuteronomy 19?', '["manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases", "Israelite soldiers going into battle", "neighbors, households, and engaged persons"]'::jsonb, 'manslayers, witnesses, and courts in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 4, 'Where is the action or teaching set in Deuteronomy 19?', '["the cities of refuge", "an uncultivated valley", "the battlefield", "ordinary life in Israel"]'::jsonb, 'the cities of refuge', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 19?', '["justice required both mercy and truthful process", "evil and bloodguilt had to be dealt with before the LORD", "the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations"]'::jsonb, 'justice required both mercy and truthful process', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 5, 'What event in Deuteronomy 19 most clearly carries that message?', '["laws about refuge cities and reliable testimony", "atonement for unsolved murder and family justice laws", "laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions"]'::jsonb, 'laws about refuge cities and reliable testimony', 'That is the main event or action described in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 19 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 5, 'What detail in Deuteronomy 19 makes that message concrete?', '["one who killed unintentionally could flee to a refuge city", "an unsolved murder required a heifer ceremony", "the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned"]'::jsonb, 'one who killed unintentionally could flee to a refuge city', 'That specific detail appears in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 19 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 5, 'What additional detail in Deuteronomy 19 sharpens that message?', '["a single witness was not enough in serious cases", "laws addressed captive wives, inheritance rights, and a stubborn son", "certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated"]'::jsonb, 'a single witness was not enough in serious cases', 'That additional detail is included in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 19 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 5, 'What outcome in Deuteronomy 19 gives the chapter lasting force?', '["innocent blood was to be kept away from Israel", "communal and household wrongs were brought under covenant order", "warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care"]'::jsonb, 'innocent blood was to be kept away from Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 19 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 5, 'Who stands under that message in Deuteronomy 19?', '["manslayers, witnesses, and courts in Israel", "households and officials handling bloodguilt and family cases", "Israelite soldiers going into battle", "neighbors, households, and engaged persons"]'::jsonb, 'manslayers, witnesses, and courts in Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 19, 5, 'What setting in Deuteronomy 19 helps anchor the message?', '["the cities of refuge", "an uncultivated valley", "the battlefield", "ordinary life in Israel"]'::jsonb, 'the cities of refuge', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 19:1-21)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 19 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 1, 'Who is the main speaker or figure in Deuteronomy 20?', '["the priest", "Israelites", "the elders", "the LORD"]'::jsonb, 'the priest', 'the priest is central in this chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 1, 'Which group is most directly addressed or involved in Deuteronomy 20?', '["Israelite soldiers going into battle", "neighbors, households, and engaged persons", "households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor"]'::jsonb, 'Israelite soldiers going into battle', 'That group is directly addressed or involved in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 1, 'What place is central in Deuteronomy 20?', '["the battlefield", "ordinary life in Israel", "an uncultivated valley", "the camp of Israel"]'::jsonb, 'the battlefield', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 1, 'What event is described in Deuteronomy 20?', '["laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions", "atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy"]'::jsonb, 'laws regulating warfare', 'That is the main event or action described in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 1, 'Which detail appears in Deuteronomy 20?', '["the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned", "an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst"]'::jsonb, 'the priest told the people not to fear because the LORD fought for them', 'That specific detail appears in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 1, 'What other detail is included in Deuteronomy 20?', '["certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated", "laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters"]'::jsonb, 'certain men were excused from battle because of new commitments or fear', 'That additional detail is included in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 1, 'What outcome is emphasized in Deuteronomy 20?', '["warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care", "communal and household wrongs were brought under covenant order", "purity and compassion marked the community"]'::jsonb, 'warfare was regulated by trust in God and ordered restraint', 'That is the outcome emphasized in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 2, 'What was one reason given in Deuteronomy 20?', '["the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations", "evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct"]'::jsonb, 'the LORD went with Israel to fight for them', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 2, 'In Deuteronomy 20, what happened as a result of the chapter''s events or commands?', '["warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care", "communal and household wrongs were brought under covenant order", "purity and compassion marked the community"]'::jsonb, 'warfare was regulated by trust in God and ordered restraint', 'That is the outcome emphasized in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 20, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 2, 'In Deuteronomy 20, what was the people''s situation or setting?', '["Israelite soldiers going into battle", "neighbors, households, and engaged persons", "households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor"]'::jsonb, 'Israelite soldiers going into battle', 'That group is directly addressed or involved in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 20, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 2, 'In Deuteronomy 20, which action or event took place?', '["laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions", "atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy"]'::jsonb, 'laws regulating warfare', 'That is the main event or action described in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 20, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 2, 'In Deuteronomy 20, which concrete instruction or fact is mentioned?', '["the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned", "an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst"]'::jsonb, 'the priest told the people not to fear because the LORD fought for them', 'That specific detail appears in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 20, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 2, 'In Deuteronomy 20, which additional fact is stated?', '["certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated", "laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters"]'::jsonb, 'certain men were excused from battle because of new commitments or fear', 'That additional detail is included in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 20, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 2, 'In Deuteronomy 20, what location or setting matters to the chapter?', '["the battlefield", "ordinary life in Israel", "an uncultivated valley", "the camp of Israel"]'::jsonb, 'the battlefield', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 20, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 3, 'What does Deuteronomy 20 say that the priest did or declared?', '["laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions", "atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy"]'::jsonb, 'laws regulating warfare', 'That is the main event or action described in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 20 say that the priest did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 3, 'Why was this emphasized in Deuteronomy 20?', '["the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations", "evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct"]'::jsonb, 'the LORD went with Israel to fight for them', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 3, 'What fact in Deuteronomy 20 helps explain the chapter''s message?', '["the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned", "an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst"]'::jsonb, 'the priest told the people not to fear because the LORD fought for them', 'That specific detail appears in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 20 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 3, 'What second fact in Deuteronomy 20 develops the chapter''s message?', '["certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated", "laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters"]'::jsonb, 'certain men were excused from battle because of new commitments or fear', 'That additional detail is included in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 20 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 3, 'What result in Deuteronomy 20 shows the consequence of obedience or disobedience?', '["warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care", "communal and household wrongs were brought under covenant order", "purity and compassion marked the community"]'::jsonb, 'warfare was regulated by trust in God and ordered restraint', 'That is the outcome emphasized in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 20 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 3, 'Who is especially in view in Deuteronomy 20?', '["Israelite soldiers going into battle", "neighbors, households, and engaged persons", "households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor"]'::jsonb, 'Israelite soldiers going into battle', 'That group is directly addressed or involved in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 3, 'What place or setting frames the action in Deuteronomy 20?', '["the battlefield", "ordinary life in Israel", "an uncultivated valley", "the camp of Israel"]'::jsonb, 'the battlefield', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 4, 'In Deuteronomy 20, what concrete act shows how the covenant was being applied?', '["the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned", "an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst"]'::jsonb, 'the priest told the people not to fear because the LORD fought for them', 'That specific detail appears in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 20, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 4, 'In Deuteronomy 20, what further act or fact supports the chapter''s message?', '["certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated", "laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters"]'::jsonb, 'certain men were excused from battle because of new commitments or fear', 'That additional detail is included in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 20, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 4, 'What larger event in Deuteronomy 20 gives those details their meaning?', '["laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions", "atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy"]'::jsonb, 'laws regulating warfare', 'That is the main event or action described in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 20 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 4, 'What result in Deuteronomy 20 shaped Israel''s future action?', '["warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care", "communal and household wrongs were brought under covenant order", "purity and compassion marked the community"]'::jsonb, 'warfare was regulated by trust in God and ordered restraint', 'That is the outcome emphasized in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 20 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 4, 'Why did this matter according to Deuteronomy 20?', '["the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations", "evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct"]'::jsonb, 'the LORD went with Israel to fight for them', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 4, 'Who had to respond to these things in Deuteronomy 20?', '["Israelite soldiers going into battle", "neighbors, households, and engaged persons", "households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor"]'::jsonb, 'Israelite soldiers going into battle', 'That group is directly addressed or involved in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 4, 'Where is the action or teaching set in Deuteronomy 20?', '["the battlefield", "ordinary life in Israel", "an uncultivated valley", "the camp of Israel"]'::jsonb, 'the battlefield', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 20?', '["the LORD went with Israel to fight for them", "holiness reaches into practical neighbor relations", "evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct"]'::jsonb, 'the LORD went with Israel to fight for them', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 5, 'What event in Deuteronomy 20 most clearly carries that message?', '["laws regulating warfare", "laws about neighbor care, sexual purity, and everyday distinctions", "atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy"]'::jsonb, 'laws regulating warfare', 'That is the main event or action described in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 20 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 5, 'What detail in Deuteronomy 20 makes that message concrete?', '["the priest told the people not to fear because the LORD fought for them", "lost property and fallen animals had to be helped and returned", "an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst"]'::jsonb, 'the priest told the people not to fear because the LORD fought for them', 'That specific detail appears in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 20 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 5, 'What additional detail in Deuteronomy 20 sharpens that message?', '["certain men were excused from battle because of new commitments or fear", "roof parapets, clothing distinctions, and sexual conduct were regulated", "laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters"]'::jsonb, 'certain men were excused from battle because of new commitments or fear', 'That additional detail is included in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 20 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 5, 'What outcome in Deuteronomy 20 gives the chapter lasting force?', '["warfare was regulated by trust in God and ordered restraint", "daily life was shaped by responsibility, purity, and care", "communal and household wrongs were brought under covenant order", "purity and compassion marked the community"]'::jsonb, 'warfare was regulated by trust in God and ordered restraint', 'That is the outcome emphasized in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 20 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 5, 'Who stands under that message in Deuteronomy 20?', '["Israelite soldiers going into battle", "neighbors, households, and engaged persons", "households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor"]'::jsonb, 'Israelite soldiers going into battle', 'That group is directly addressed or involved in the chapter. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 20, 5, 'What setting in Deuteronomy 20 helps anchor the message?', '["the battlefield", "ordinary life in Israel", "an uncultivated valley", "the camp of Israel"]'::jsonb, 'the battlefield', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 20:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 20 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 1, 'Who is the main speaker or figure in Deuteronomy 21?', '["the elders", "the LORD", "Israelites", "the worshiper"]'::jsonb, 'the elders', 'the elders is central in this chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 1, 'Which group is most directly addressed or involved in Deuteronomy 21?', '["households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor", "neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable"]'::jsonb, 'households and officials handling bloodguilt and family cases', 'That group is directly addressed or involved in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 1, 'What place is central in Deuteronomy 21?', '["an uncultivated valley", "the camp of Israel", "ordinary life in Israel", "Israelite daily life"]'::jsonb, 'an uncultivated valley', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 1, 'What event is described in Deuteronomy 21?', '["atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy", "laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy"]'::jsonb, 'atonement for unsolved murder and family justice laws', 'That is the main event or action described in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 1, 'Which detail appears in Deuteronomy 21?', '["an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst", "lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another"]'::jsonb, 'an unsolved murder required a heifer ceremony', 'That specific detail appears in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 1, 'What other detail is included in Deuteronomy 21?', '["laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters", "roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly"]'::jsonb, 'laws addressed captive wives, inheritance rights, and a stubborn son', 'That additional detail is included in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 1, 'What outcome is emphasized in Deuteronomy 21?', '["communal and household wrongs were brought under covenant order", "purity and compassion marked the community", "daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy"]'::jsonb, 'communal and household wrongs were brought under covenant order', 'That is the outcome emphasized in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 2, 'What was one reason given in Deuteronomy 21?', '["evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct", "holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others"]'::jsonb, 'evil and bloodguilt had to be dealt with before the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 2, 'In Deuteronomy 21, what happened as a result of the chapter''s events or commands?', '["communal and household wrongs were brought under covenant order", "purity and compassion marked the community", "daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy"]'::jsonb, 'communal and household wrongs were brought under covenant order', 'That is the outcome emphasized in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 21, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 2, 'In Deuteronomy 21, what was the people''s situation or setting?', '["households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor", "neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable"]'::jsonb, 'households and officials handling bloodguilt and family cases', 'That group is directly addressed or involved in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 21, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 2, 'In Deuteronomy 21, which action or event took place?', '["atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy", "laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy"]'::jsonb, 'atonement for unsolved murder and family justice laws', 'That is the main event or action described in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 21, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 2, 'In Deuteronomy 21, which concrete instruction or fact is mentioned?', '["an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst", "lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another"]'::jsonb, 'an unsolved murder required a heifer ceremony', 'That specific detail appears in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 21, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 2, 'In Deuteronomy 21, which additional fact is stated?', '["laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters", "roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly"]'::jsonb, 'laws addressed captive wives, inheritance rights, and a stubborn son', 'That additional detail is included in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 21, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 2, 'In Deuteronomy 21, what location or setting matters to the chapter?', '["an uncultivated valley", "the camp of Israel", "ordinary life in Israel", "Israelite daily life"]'::jsonb, 'an uncultivated valley', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 21, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 3, 'What does Deuteronomy 21 say that the elders did or declared?', '["atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy", "laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy"]'::jsonb, 'atonement for unsolved murder and family justice laws', 'That is the main event or action described in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 21 say that the elders did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 3, 'Why was this emphasized in Deuteronomy 21?', '["evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct", "holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others"]'::jsonb, 'evil and bloodguilt had to be dealt with before the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 3, 'What fact in Deuteronomy 21 helps explain the chapter''s message?', '["an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst", "lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another"]'::jsonb, 'an unsolved murder required a heifer ceremony', 'That specific detail appears in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 21 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 3, 'What second fact in Deuteronomy 21 develops the chapter''s message?', '["laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters", "roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly"]'::jsonb, 'laws addressed captive wives, inheritance rights, and a stubborn son', 'That additional detail is included in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 21 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 3, 'What result in Deuteronomy 21 shows the consequence of obedience or disobedience?', '["communal and household wrongs were brought under covenant order", "purity and compassion marked the community", "daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy"]'::jsonb, 'communal and household wrongs were brought under covenant order', 'That is the outcome emphasized in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 21 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 3, 'Who is especially in view in Deuteronomy 21?', '["households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor", "neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable"]'::jsonb, 'households and officials handling bloodguilt and family cases', 'That group is directly addressed or involved in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 3, 'What place or setting frames the action in Deuteronomy 21?', '["an uncultivated valley", "the camp of Israel", "ordinary life in Israel", "Israelite daily life"]'::jsonb, 'an uncultivated valley', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 4, 'In Deuteronomy 21, what concrete act shows how the covenant was being applied?', '["an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst", "lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another"]'::jsonb, 'an unsolved murder required a heifer ceremony', 'That specific detail appears in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 21, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 4, 'In Deuteronomy 21, what further act or fact supports the chapter''s message?', '["laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters", "roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly"]'::jsonb, 'laws addressed captive wives, inheritance rights, and a stubborn son', 'That additional detail is included in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 21, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 4, 'What larger event in Deuteronomy 21 gives those details their meaning?', '["atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy", "laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy"]'::jsonb, 'atonement for unsolved murder and family justice laws', 'That is the main event or action described in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 21 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 4, 'What result in Deuteronomy 21 shaped Israel''s future action?', '["communal and household wrongs were brought under covenant order", "purity and compassion marked the community", "daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy"]'::jsonb, 'communal and household wrongs were brought under covenant order', 'That is the outcome emphasized in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 21 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 4, 'Why did this matter according to Deuteronomy 21?', '["evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct", "holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others"]'::jsonb, 'evil and bloodguilt had to be dealt with before the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 4, 'Who had to respond to these things in Deuteronomy 21?', '["households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor", "neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable"]'::jsonb, 'households and officials handling bloodguilt and family cases', 'That group is directly addressed or involved in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 4, 'Where is the action or teaching set in Deuteronomy 21?', '["an uncultivated valley", "the camp of Israel", "ordinary life in Israel", "Israelite daily life"]'::jsonb, 'an uncultivated valley', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 21?', '["evil and bloodguilt had to be dealt with before the LORD", "God''s presence sanctified both worship and social conduct", "holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others"]'::jsonb, 'evil and bloodguilt had to be dealt with before the LORD', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 5, 'What event in Deuteronomy 21 most clearly carries that message?', '["atonement for unsolved murder and family justice laws", "rules for assembly membership, camp holiness, and social mercy", "laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy"]'::jsonb, 'atonement for unsolved murder and family justice laws', 'That is the main event or action described in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 21 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 5, 'What detail in Deuteronomy 21 makes that message concrete?', '["an unsolved murder required a heifer ceremony", "the camp had to remain clean because the LORD walked in its midst", "lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another"]'::jsonb, 'an unsolved murder required a heifer ceremony', 'That specific detail appears in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 21 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 5, 'What additional detail in Deuteronomy 21 sharpens that message?', '["laws addressed captive wives, inheritance rights, and a stubborn son", "runaway slaves were not to be returned to oppressive masters", "roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly"]'::jsonb, 'laws addressed captive wives, inheritance rights, and a stubborn son', 'That additional detail is included in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 21 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 5, 'What outcome in Deuteronomy 21 gives the chapter lasting force?', '["communal and household wrongs were brought under covenant order", "purity and compassion marked the community", "daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy"]'::jsonb, 'communal and household wrongs were brought under covenant order', 'That is the outcome emphasized in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 21 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 5, 'Who stands under that message in Deuteronomy 21?', '["households and officials handling bloodguilt and family cases", "the covenant assembly, soldiers, servants, and the poor", "neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable"]'::jsonb, 'households and officials handling bloodguilt and family cases', 'That group is directly addressed or involved in the chapter. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 21, 5, 'What setting in Deuteronomy 21 helps anchor the message?', '["an uncultivated valley", "the camp of Israel", "ordinary life in Israel", "Israelite daily life"]'::jsonb, 'an uncultivated valley', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 21:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 21 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 1, 'Who is the main speaker or figure in Deuteronomy 22?', '["Israelites", "the worshiper", "the LORD", "Moses and the priests"]'::jsonb, 'Israelites', 'Israelites is central in this chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 1, 'Which group is most directly addressed or involved in Deuteronomy 22?', '["neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable", "the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel"]'::jsonb, 'neighbors, households, and engaged persons', 'That group is directly addressed or involved in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 1, 'What place is central in Deuteronomy 22?', '["ordinary life in Israel", "Israelite daily life", "the camp of Israel", "Israel"]'::jsonb, 'ordinary life in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 1, 'What event is described in Deuteronomy 22?', '["laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy", "rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures"]'::jsonb, 'laws about neighbor care, sexual purity, and everyday distinctions', 'That is the main event or action described in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 1, 'Which detail appears in Deuteronomy 22?', '["lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another", "the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name"]'::jsonb, 'lost property and fallen animals had to be helped and returned', 'That specific detail appears in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 1, 'What other detail is included in Deuteronomy 22?', '["roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly", "runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination"]'::jsonb, 'roof parapets, clothing distinctions, and sexual conduct were regulated', 'That additional detail is included in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 1, 'What outcome is emphasized in Deuteronomy 22?', '["daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy", "purity and compassion marked the community", "Amalek was to be remembered and blotted out"]'::jsonb, 'daily life was shaped by responsibility, purity, and care', 'That is the outcome emphasized in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 2, 'What was one reason given in Deuteronomy 22?', '["holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others", "God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil"]'::jsonb, 'holiness reaches into practical neighbor relations', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 2, 'In Deuteronomy 22, what happened as a result of the chapter''s events or commands?', '["daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy", "purity and compassion marked the community", "Amalek was to be remembered and blotted out"]'::jsonb, 'daily life was shaped by responsibility, purity, and care', 'That is the outcome emphasized in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 22, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 2, 'In Deuteronomy 22, what was the people''s situation or setting?', '["neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable", "the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel"]'::jsonb, 'neighbors, households, and engaged persons', 'That group is directly addressed or involved in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 22, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 2, 'In Deuteronomy 22, which action or event took place?', '["laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy", "rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures"]'::jsonb, 'laws about neighbor care, sexual purity, and everyday distinctions', 'That is the main event or action described in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 22, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 2, 'In Deuteronomy 22, which concrete instruction or fact is mentioned?', '["lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another", "the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name"]'::jsonb, 'lost property and fallen animals had to be helped and returned', 'That specific detail appears in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 22, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 2, 'In Deuteronomy 22, which additional fact is stated?', '["roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly", "runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination"]'::jsonb, 'roof parapets, clothing distinctions, and sexual conduct were regulated', 'That additional detail is included in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 22, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 2, 'In Deuteronomy 22, what location or setting matters to the chapter?', '["ordinary life in Israel", "Israelite daily life", "the camp of Israel", "Israel"]'::jsonb, 'ordinary life in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 22, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 3, 'What does Deuteronomy 22 say that Israelites did or declared?', '["laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy", "rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures"]'::jsonb, 'laws about neighbor care, sexual purity, and everyday distinctions', 'That is the main event or action described in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 22 say that Israelites did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 3, 'Why was this emphasized in Deuteronomy 22?', '["holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others", "God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil"]'::jsonb, 'holiness reaches into practical neighbor relations', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 3, 'What fact in Deuteronomy 22 helps explain the chapter''s message?', '["lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another", "the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name"]'::jsonb, 'lost property and fallen animals had to be helped and returned', 'That specific detail appears in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 22 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 3, 'What second fact in Deuteronomy 22 develops the chapter''s message?', '["roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly", "runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination"]'::jsonb, 'roof parapets, clothing distinctions, and sexual conduct were regulated', 'That additional detail is included in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 22 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 3, 'What result in Deuteronomy 22 shows the consequence of obedience or disobedience?', '["daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy", "purity and compassion marked the community", "Amalek was to be remembered and blotted out"]'::jsonb, 'daily life was shaped by responsibility, purity, and care', 'That is the outcome emphasized in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 22 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 3, 'Who is especially in view in Deuteronomy 22?', '["neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable", "the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel"]'::jsonb, 'neighbors, households, and engaged persons', 'That group is directly addressed or involved in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 3, 'What place or setting frames the action in Deuteronomy 22?', '["ordinary life in Israel", "Israelite daily life", "the camp of Israel", "Israel"]'::jsonb, 'ordinary life in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 4, 'In Deuteronomy 22, what concrete act shows how the covenant was being applied?', '["lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another", "the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name"]'::jsonb, 'lost property and fallen animals had to be helped and returned', 'That specific detail appears in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 22, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 4, 'In Deuteronomy 22, what further act or fact supports the chapter''s message?', '["roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly", "runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination"]'::jsonb, 'roof parapets, clothing distinctions, and sexual conduct were regulated', 'That additional detail is included in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 22, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 4, 'What larger event in Deuteronomy 22 gives those details their meaning?', '["laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy", "rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures"]'::jsonb, 'laws about neighbor care, sexual purity, and everyday distinctions', 'That is the main event or action described in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 22 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 4, 'What result in Deuteronomy 22 shaped Israel''s future action?', '["daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy", "purity and compassion marked the community", "Amalek was to be remembered and blotted out"]'::jsonb, 'daily life was shaped by responsibility, purity, and care', 'That is the outcome emphasized in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 22 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 4, 'Why did this matter according to Deuteronomy 22?', '["holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others", "God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil"]'::jsonb, 'holiness reaches into practical neighbor relations', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 4, 'Who had to respond to these things in Deuteronomy 22?', '["neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable", "the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel"]'::jsonb, 'neighbors, households, and engaged persons', 'That group is directly addressed or involved in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 4, 'Where is the action or teaching set in Deuteronomy 22?', '["ordinary life in Israel", "Israelite daily life", "the camp of Israel", "Israel"]'::jsonb, 'ordinary life in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 22?', '["holiness reaches into practical neighbor relations", "memory of bondage was to shape humane treatment of others", "God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil"]'::jsonb, 'holiness reaches into practical neighbor relations', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 5, 'What event in Deuteronomy 22 most clearly carries that message?', '["laws about neighbor care, sexual purity, and everyday distinctions", "laws about divorce, pledges, wages, and mercy", "rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures"]'::jsonb, 'laws about neighbor care, sexual purity, and everyday distinctions', 'That is the main event or action described in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 22 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 5, 'What detail in Deuteronomy 22 makes that message concrete?', '["lost property and fallen animals had to be helped and returned", "a man could not remarry a former wife after she had married another", "the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name"]'::jsonb, 'lost property and fallen animals had to be helped and returned', 'That specific detail appears in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 22 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 5, 'What additional detail in Deuteronomy 22 sharpens that message?', '["roof parapets, clothing distinctions, and sexual conduct were regulated", "workers and the vulnerable were to be treated justly", "runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination"]'::jsonb, 'roof parapets, clothing distinctions, and sexual conduct were regulated', 'That additional detail is included in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 22 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 5, 'What outcome in Deuteronomy 22 gives the chapter lasting force?', '["daily life was shaped by responsibility, purity, and care", "Israel was repeatedly told to remember Egypt as the motive for mercy", "purity and compassion marked the community", "Amalek was to be remembered and blotted out"]'::jsonb, 'daily life was shaped by responsibility, purity, and care', 'That is the outcome emphasized in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 22 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 5, 'Who stands under that message in Deuteronomy 22?', '["neighbors, households, and engaged persons", "married households, laborers, debtors, and the vulnerable", "the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel"]'::jsonb, 'neighbors, households, and engaged persons', 'That group is directly addressed or involved in the chapter. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 22, 5, 'What setting in Deuteronomy 22 helps anchor the message?', '["ordinary life in Israel", "Israelite daily life", "the camp of Israel", "Israel"]'::jsonb, 'ordinary life in Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 22:1-30)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 22 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 1, 'Who is the main speaker or figure in Deuteronomy 23?', '["the LORD", "Moses and the priests", "the worshiper", "Moses"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 1, 'Which group is most directly addressed or involved in Deuteronomy 23?', '["the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel", "married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes"]'::jsonb, 'the covenant assembly, soldiers, servants, and the poor', 'That group is directly addressed or involved in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 1, 'What place is central in Deuteronomy 23?', '["the camp of Israel", "Israel", "Israelite daily life", "the place the LORD would choose"]'::jsonb, 'the camp of Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 1, 'What event is described in Deuteronomy 23?', '["rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures", "laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession"]'::jsonb, 'rules for assembly membership, camp holiness, and social mercy', 'That is the main event or action described in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 1, 'Which detail appears in Deuteronomy 23?', '["the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name", "a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father"]'::jsonb, 'the camp had to remain clean because the LORD walked in its midst', 'That specific detail appears in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 1, 'What other detail is included in Deuteronomy 23?', '["runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination", "workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy"]'::jsonb, 'runaway slaves were not to be returned to oppressive masters', 'That additional detail is included in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 1, 'What outcome is emphasized in Deuteronomy 23?', '["purity and compassion marked the community", "Amalek was to be remembered and blotted out", "Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption"]'::jsonb, 'purity and compassion marked the community', 'That is the outcome emphasized in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 2, 'What was one reason given in Deuteronomy 23?', '["God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil", "memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory"]'::jsonb, 'God''s presence sanctified both worship and social conduct', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 2, 'In Deuteronomy 23, what happened as a result of the chapter''s events or commands?', '["purity and compassion marked the community", "Amalek was to be remembered and blotted out", "Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption"]'::jsonb, 'purity and compassion marked the community', 'That is the outcome emphasized in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 23, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 2, 'In Deuteronomy 23, what was the people''s situation or setting?', '["the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel", "married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes"]'::jsonb, 'the covenant assembly, soldiers, servants, and the poor', 'That group is directly addressed or involved in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 23, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 2, 'In Deuteronomy 23, which action or event took place?', '["rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures", "laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession"]'::jsonb, 'rules for assembly membership, camp holiness, and social mercy', 'That is the main event or action described in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 23, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 2, 'In Deuteronomy 23, which concrete instruction or fact is mentioned?', '["the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name", "a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father"]'::jsonb, 'the camp had to remain clean because the LORD walked in its midst', 'That specific detail appears in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 23, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 2, 'In Deuteronomy 23, which additional fact is stated?', '["runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination", "workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy"]'::jsonb, 'runaway slaves were not to be returned to oppressive masters', 'That additional detail is included in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 23, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 2, 'In Deuteronomy 23, what location or setting matters to the chapter?', '["the camp of Israel", "Israel", "Israelite daily life", "the place the LORD would choose"]'::jsonb, 'the camp of Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 23, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 3, 'What does Deuteronomy 23 say that the LORD did or declared?', '["rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures", "laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession"]'::jsonb, 'rules for assembly membership, camp holiness, and social mercy', 'That is the main event or action described in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 23 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 3, 'Why was this emphasized in Deuteronomy 23?', '["God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil", "memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory"]'::jsonb, 'God''s presence sanctified both worship and social conduct', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 3, 'What fact in Deuteronomy 23 helps explain the chapter''s message?', '["the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name", "a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father"]'::jsonb, 'the camp had to remain clean because the LORD walked in its midst', 'That specific detail appears in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 23 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 3, 'What second fact in Deuteronomy 23 develops the chapter''s message?', '["runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination", "workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy"]'::jsonb, 'runaway slaves were not to be returned to oppressive masters', 'That additional detail is included in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 23 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 3, 'What result in Deuteronomy 23 shows the consequence of obedience or disobedience?', '["purity and compassion marked the community", "Amalek was to be remembered and blotted out", "Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption"]'::jsonb, 'purity and compassion marked the community', 'That is the outcome emphasized in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 23 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 3, 'Who is especially in view in Deuteronomy 23?', '["the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel", "married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes"]'::jsonb, 'the covenant assembly, soldiers, servants, and the poor', 'That group is directly addressed or involved in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 3, 'What place or setting frames the action in Deuteronomy 23?', '["the camp of Israel", "Israel", "Israelite daily life", "the place the LORD would choose"]'::jsonb, 'the camp of Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 4, 'In Deuteronomy 23, what concrete act shows how the covenant was being applied?', '["the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name", "a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father"]'::jsonb, 'the camp had to remain clean because the LORD walked in its midst', 'That specific detail appears in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 23, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 4, 'In Deuteronomy 23, what further act or fact supports the chapter''s message?', '["runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination", "workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy"]'::jsonb, 'runaway slaves were not to be returned to oppressive masters', 'That additional detail is included in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 23, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 4, 'What larger event in Deuteronomy 23 gives those details their meaning?', '["rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures", "laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession"]'::jsonb, 'rules for assembly membership, camp holiness, and social mercy', 'That is the main event or action described in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 23 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 4, 'What result in Deuteronomy 23 shaped Israel''s future action?', '["purity and compassion marked the community", "Amalek was to be remembered and blotted out", "Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption"]'::jsonb, 'purity and compassion marked the community', 'That is the outcome emphasized in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 23 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 4, 'Why did this matter according to Deuteronomy 23?', '["God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil", "memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory"]'::jsonb, 'God''s presence sanctified both worship and social conduct', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 4, 'Who had to respond to these things in Deuteronomy 23?', '["the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel", "married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes"]'::jsonb, 'the covenant assembly, soldiers, servants, and the poor', 'That group is directly addressed or involved in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 4, 'Where is the action or teaching set in Deuteronomy 23?', '["the camp of Israel", "Israel", "Israelite daily life", "the place the LORD would choose"]'::jsonb, 'the camp of Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 23?', '["God''s presence sanctified both worship and social conduct", "covenant faithfulness opposes fraud and public evil", "memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory"]'::jsonb, 'God''s presence sanctified both worship and social conduct', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 5, 'What event in Deuteronomy 23 most clearly carries that message?', '["rules for assembly membership, camp holiness, and social mercy", "laws about fairness, levirate duty, and honest measures", "laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession"]'::jsonb, 'rules for assembly membership, camp holiness, and social mercy', 'That is the main event or action described in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 23 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 5, 'What detail in Deuteronomy 23 makes that message concrete?', '["the camp had to remain clean because the LORD walked in its midst", "the levirate duty preserved a dead brother''s name", "a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father"]'::jsonb, 'the camp had to remain clean because the LORD walked in its midst', 'That specific detail appears in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 23 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 5, 'What additional detail in Deuteronomy 23 sharpens that message?', '["runaway slaves were not to be returned to oppressive masters", "unequal weights and measures were an abomination", "workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy"]'::jsonb, 'runaway slaves were not to be returned to oppressive masters', 'That additional detail is included in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 23 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 5, 'What outcome in Deuteronomy 23 gives the chapter lasting force?', '["purity and compassion marked the community", "Amalek was to be remembered and blotted out", "Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption"]'::jsonb, 'purity and compassion marked the community', 'That is the outcome emphasized in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 23 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 5, 'Who stands under that message in Deuteronomy 23?', '["the covenant assembly, soldiers, servants, and the poor", "brothers, judges, merchants, and Israel", "married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes"]'::jsonb, 'the covenant assembly, soldiers, servants, and the poor', 'That group is directly addressed or involved in the chapter. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 23, 5, 'What setting in Deuteronomy 23 helps anchor the message?', '["the camp of Israel", "Israel", "Israelite daily life", "the place the LORD would choose"]'::jsonb, 'the camp of Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 23:1-25)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 23 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 1, 'Who is the main speaker or figure in Deuteronomy 24?', '["the LORD", "Moses and the priests", "the worshiper", "Moses"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 1, 'Which group is most directly addressed or involved in Deuteronomy 24?', '["married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes", "brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony"]'::jsonb, 'married households, laborers, debtors, and the vulnerable', 'That group is directly addressed or involved in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 1, 'What place is central in Deuteronomy 24?', '["Israelite daily life", "the place the LORD would choose", "Israel", "Mount Ebal"]'::jsonb, 'Israelite daily life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 1, 'What event is described in Deuteronomy 24?', '["laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession", "laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses"]'::jsonb, 'laws about divorce, pledges, wages, and mercy', 'That is the main event or action described in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 1, 'Which detail appears in Deuteronomy 24?', '["a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father", "the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law"]'::jsonb, 'a man could not remarry a former wife after she had married another', 'That specific detail appears in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 1, 'What other detail is included in Deuteronomy 24?', '["workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy", "unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen"]'::jsonb, 'workers and the vulnerable were to be treated justly', 'That additional detail is included in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 1, 'What outcome is emphasized in Deuteronomy 24?', '["Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption", "Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed"]'::jsonb, 'Israel was repeatedly told to remember Egypt as the motive for mercy', 'That is the outcome emphasized in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 2, 'What was one reason given in Deuteronomy 24?', '["memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory", "covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal"]'::jsonb, 'memory of bondage was to shape humane treatment of others', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 2, 'In Deuteronomy 24, what happened as a result of the chapter''s events or commands?', '["Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption", "Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed"]'::jsonb, 'Israel was repeatedly told to remember Egypt as the motive for mercy', 'That is the outcome emphasized in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 24, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 2, 'In Deuteronomy 24, what was the people''s situation or setting?', '["married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes", "brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony"]'::jsonb, 'married households, laborers, debtors, and the vulnerable', 'That group is directly addressed or involved in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 24, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 2, 'In Deuteronomy 24, which action or event took place?', '["laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession", "laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses"]'::jsonb, 'laws about divorce, pledges, wages, and mercy', 'That is the main event or action described in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 24, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 2, 'In Deuteronomy 24, which concrete instruction or fact is mentioned?', '["a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father", "the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law"]'::jsonb, 'a man could not remarry a former wife after she had married another', 'That specific detail appears in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 24, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 2, 'In Deuteronomy 24, which additional fact is stated?', '["workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy", "unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen"]'::jsonb, 'workers and the vulnerable were to be treated justly', 'That additional detail is included in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 24, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 2, 'In Deuteronomy 24, what location or setting matters to the chapter?', '["Israelite daily life", "the place the LORD would choose", "Israel", "Mount Ebal"]'::jsonb, 'Israelite daily life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 24, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 3, 'What does Deuteronomy 24 say that the LORD did or declared?', '["laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession", "laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses"]'::jsonb, 'laws about divorce, pledges, wages, and mercy', 'That is the main event or action described in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 24 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 3, 'Why was this emphasized in Deuteronomy 24?', '["memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory", "covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal"]'::jsonb, 'memory of bondage was to shape humane treatment of others', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 3, 'What fact in Deuteronomy 24 helps explain the chapter''s message?', '["a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father", "the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law"]'::jsonb, 'a man could not remarry a former wife after she had married another', 'That specific detail appears in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 24 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 3, 'What second fact in Deuteronomy 24 develops the chapter''s message?', '["workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy", "unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen"]'::jsonb, 'workers and the vulnerable were to be treated justly', 'That additional detail is included in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 24 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 3, 'What result in Deuteronomy 24 shows the consequence of obedience or disobedience?', '["Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption", "Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed"]'::jsonb, 'Israel was repeatedly told to remember Egypt as the motive for mercy', 'That is the outcome emphasized in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 24 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 3, 'Who is especially in view in Deuteronomy 24?', '["married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes", "brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony"]'::jsonb, 'married households, laborers, debtors, and the vulnerable', 'That group is directly addressed or involved in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 3, 'What place or setting frames the action in Deuteronomy 24?', '["Israelite daily life", "the place the LORD would choose", "Israel", "Mount Ebal"]'::jsonb, 'Israelite daily life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 4, 'In Deuteronomy 24, what concrete act shows how the covenant was being applied?', '["a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father", "the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law"]'::jsonb, 'a man could not remarry a former wife after she had married another', 'That specific detail appears in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 24, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 4, 'In Deuteronomy 24, what further act or fact supports the chapter''s message?', '["workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy", "unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen"]'::jsonb, 'workers and the vulnerable were to be treated justly', 'That additional detail is included in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 24, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 4, 'What larger event in Deuteronomy 24 gives those details their meaning?', '["laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession", "laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses"]'::jsonb, 'laws about divorce, pledges, wages, and mercy', 'That is the main event or action described in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 24 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 4, 'What result in Deuteronomy 24 shaped Israel''s future action?', '["Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption", "Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed"]'::jsonb, 'Israel was repeatedly told to remember Egypt as the motive for mercy', 'That is the outcome emphasized in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 24 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 4, 'Why did this matter according to Deuteronomy 24?', '["memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory", "covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal"]'::jsonb, 'memory of bondage was to shape humane treatment of others', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 4, 'Who had to respond to these things in Deuteronomy 24?', '["married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes", "brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony"]'::jsonb, 'married households, laborers, debtors, and the vulnerable', 'That group is directly addressed or involved in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 4, 'Where is the action or teaching set in Deuteronomy 24?', '["Israelite daily life", "the place the LORD would choose", "Israel", "Mount Ebal"]'::jsonb, 'Israelite daily life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 24?', '["memory of bondage was to shape humane treatment of others", "gratitude in worship was tied to covenant memory", "covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal"]'::jsonb, 'memory of bondage was to shape humane treatment of others', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 5, 'What event in Deuteronomy 24 most clearly carries that message?', '["laws about divorce, pledges, wages, and mercy", "firstfruits, tithes, and covenant confession", "laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses"]'::jsonb, 'laws about divorce, pledges, wages, and mercy', 'That is the main event or action described in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 24 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 5, 'What detail in Deuteronomy 24 makes that message concrete?', '["a man could not remarry a former wife after she had married another", "the worshiper confessed that an Aramean ready to perish was his father", "the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law"]'::jsonb, 'a man could not remarry a former wife after she had married another', 'That specific detail appears in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 24 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 5, 'What additional detail in Deuteronomy 24 sharpens that message?', '["workers and the vulnerable were to be treated justly", "the third-year tithe included Levites and the needy", "unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen"]'::jsonb, 'workers and the vulnerable were to be treated justly', 'That additional detail is included in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 24 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 5, 'What outcome in Deuteronomy 24 gives the chapter lasting force?', '["Israel was repeatedly told to remember Egypt as the motive for mercy", "offering and confession rehearsed Israel''s story of redemption", "Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed"]'::jsonb, 'Israel was repeatedly told to remember Egypt as the motive for mercy', 'That is the outcome emphasized in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 24 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 5, 'Who stands under that message in Deuteronomy 24?', '["married households, laborers, debtors, and the vulnerable", "Israel bringing firstfruits and tithes", "brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony"]'::jsonb, 'married households, laborers, debtors, and the vulnerable', 'That group is directly addressed or involved in the chapter. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 24, 5, 'What setting in Deuteronomy 24 helps anchor the message?', '["Israelite daily life", "the place the LORD would choose", "Israel", "Mount Ebal"]'::jsonb, 'Israelite daily life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 24:1-22)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 24 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 1, 'Who is the main speaker or figure in Deuteronomy 25?', '["the LORD", "Moses and the priests", "the worshiper", "Moses"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 1, 'Which group is most directly addressed or involved in Deuteronomy 25?', '["brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony", "Israel bringing firstfruits and tithes", "Israel facing blessing or curse"]'::jsonb, 'brothers, judges, merchants, and Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 1, 'What place is central in Deuteronomy 25?', '["Israel", "Mount Ebal", "the place the LORD would choose", "the land of covenant life"]'::jsonb, 'Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 1, 'What event is described in Deuteronomy 25?', '["laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses", "firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant"]'::jsonb, 'laws about fairness, levirate duty, and honest measures', 'That is the main event or action described in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 1, 'Which detail appears in Deuteronomy 25?', '["the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law", "the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation"]'::jsonb, 'the levirate duty preserved a dead brother''s name', 'That specific detail appears in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 1, 'What other detail is included in Deuteronomy 25?', '["unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen", "the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile"]'::jsonb, 'unequal weights and measures were an abomination', 'That additional detail is included in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 1, 'What outcome is emphasized in Deuteronomy 25?', '["Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed", "offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences"]'::jsonb, 'Amalek was to be remembered and blotted out', 'That is the outcome emphasized in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 2, 'What was one reason given in Deuteronomy 25?', '["covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal", "gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments"]'::jsonb, 'covenant faithfulness opposes fraud and public evil', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 2, 'In Deuteronomy 25, what happened as a result of the chapter''s events or commands?', '["Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed", "offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences"]'::jsonb, 'Amalek was to be remembered and blotted out', 'That is the outcome emphasized in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 25, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 2, 'In Deuteronomy 25, what was the people''s situation or setting?', '["brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony", "Israel bringing firstfruits and tithes", "Israel facing blessing or curse"]'::jsonb, 'brothers, judges, merchants, and Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 25, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 2, 'In Deuteronomy 25, which action or event took place?', '["laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses", "firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant"]'::jsonb, 'laws about fairness, levirate duty, and honest measures', 'That is the main event or action described in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 25, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 2, 'In Deuteronomy 25, which concrete instruction or fact is mentioned?', '["the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law", "the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation"]'::jsonb, 'the levirate duty preserved a dead brother''s name', 'That specific detail appears in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 25, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 2, 'In Deuteronomy 25, which additional fact is stated?', '["unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen", "the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile"]'::jsonb, 'unequal weights and measures were an abomination', 'That additional detail is included in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 25, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 2, 'In Deuteronomy 25, what location or setting matters to the chapter?', '["Israel", "Mount Ebal", "the place the LORD would choose", "the land of covenant life"]'::jsonb, 'Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 25, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 3, 'What does Deuteronomy 25 say that the LORD did or declared?', '["laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses", "firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant"]'::jsonb, 'laws about fairness, levirate duty, and honest measures', 'That is the main event or action described in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 25 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 3, 'Why was this emphasized in Deuteronomy 25?', '["covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal", "gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments"]'::jsonb, 'covenant faithfulness opposes fraud and public evil', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 3, 'What fact in Deuteronomy 25 helps explain the chapter''s message?', '["the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law", "the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation"]'::jsonb, 'the levirate duty preserved a dead brother''s name', 'That specific detail appears in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 25 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 3, 'What second fact in Deuteronomy 25 develops the chapter''s message?', '["unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen", "the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile"]'::jsonb, 'unequal weights and measures were an abomination', 'That additional detail is included in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 25 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 3, 'What result in Deuteronomy 25 shows the consequence of obedience or disobedience?', '["Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed", "offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences"]'::jsonb, 'Amalek was to be remembered and blotted out', 'That is the outcome emphasized in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 25 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 3, 'Who is especially in view in Deuteronomy 25?', '["brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony", "Israel bringing firstfruits and tithes", "Israel facing blessing or curse"]'::jsonb, 'brothers, judges, merchants, and Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 3, 'What place or setting frames the action in Deuteronomy 25?', '["Israel", "Mount Ebal", "the place the LORD would choose", "the land of covenant life"]'::jsonb, 'Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 4, 'In Deuteronomy 25, what concrete act shows how the covenant was being applied?', '["the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law", "the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation"]'::jsonb, 'the levirate duty preserved a dead brother''s name', 'That specific detail appears in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 25, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 4, 'In Deuteronomy 25, what further act or fact supports the chapter''s message?', '["unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen", "the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile"]'::jsonb, 'unequal weights and measures were an abomination', 'That additional detail is included in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 25, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 4, 'What larger event in Deuteronomy 25 gives those details their meaning?', '["laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses", "firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant"]'::jsonb, 'laws about fairness, levirate duty, and honest measures', 'That is the main event or action described in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 25 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 4, 'What result in Deuteronomy 25 shaped Israel''s future action?', '["Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed", "offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences"]'::jsonb, 'Amalek was to be remembered and blotted out', 'That is the outcome emphasized in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 25 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 4, 'Why did this matter according to Deuteronomy 25?', '["covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal", "gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments"]'::jsonb, 'covenant faithfulness opposes fraud and public evil', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 4, 'Who had to respond to these things in Deuteronomy 25?', '["brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony", "Israel bringing firstfruits and tithes", "Israel facing blessing or curse"]'::jsonb, 'brothers, judges, merchants, and Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 4, 'Where is the action or teaching set in Deuteronomy 25?', '["Israel", "Mount Ebal", "the place the LORD would choose", "the land of covenant life"]'::jsonb, 'Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 25?', '["covenant faithfulness opposes fraud and public evil", "covenant accountability had to be explicit and communal", "gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments"]'::jsonb, 'covenant faithfulness opposes fraud and public evil', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 5, 'What event in Deuteronomy 25 most clearly carries that message?', '["laws about fairness, levirate duty, and honest measures", "the inscribed stones and the covenant curses", "firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant"]'::jsonb, 'laws about fairness, levirate duty, and honest measures', 'That is the main event or action described in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 25 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 5, 'What detail in Deuteronomy 25 makes that message concrete?', '["the levirate duty preserved a dead brother''s name", "great stones coated with plaster were to bear the words of the law", "the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation"]'::jsonb, 'the levirate duty preserved a dead brother''s name', 'That specific detail appears in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 25 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 5, 'What additional detail in Deuteronomy 25 sharpens that message?', '["unequal weights and measures were an abomination", "the Levites announced curses and the people answered Amen", "the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile"]'::jsonb, 'unequal weights and measures were an abomination', 'That additional detail is included in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 25 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 5, 'What outcome in Deuteronomy 25 gives the chapter lasting force?', '["Amalek was to be remembered and blotted out", "the law was publicly inscribed and publicly affirmed", "offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences"]'::jsonb, 'Amalek was to be remembered and blotted out', 'That is the outcome emphasized in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 25 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 5, 'Who stands under that message in Deuteronomy 25?', '["brothers, judges, merchants, and Israel", "Israel assembled for covenant ceremony", "Israel bringing firstfruits and tithes", "Israel facing blessing or curse"]'::jsonb, 'brothers, judges, merchants, and Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 25, 5, 'What setting in Deuteronomy 25 helps anchor the message?', '["Israel", "Mount Ebal", "the place the LORD would choose", "the land of covenant life"]'::jsonb, 'Israel', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 25:5-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 25 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 1, 'Who is the main speaker or figure in Deuteronomy 26?', '["the worshiper", "the LORD", "Moses and the priests", "Moses"]'::jsonb, 'the worshiper', 'the worshiper is central in this chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 1, 'Which group is most directly addressed or involved in Deuteronomy 26?', '["Israel bringing firstfruits and tithes", "Israel facing blessing or curse", "Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab"]'::jsonb, 'Israel bringing firstfruits and tithes', 'That group is directly addressed or involved in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 1, 'What place is central in Deuteronomy 26?', '["the place the LORD would choose", "the land of covenant life", "Mount Ebal", "the land of Moab"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 1, 'What event is described in Deuteronomy 26?', '["firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant", "the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land"]'::jsonb, 'firstfruits, tithes, and covenant confession', 'That is the main event or action described in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 1, 'Which detail appears in Deuteronomy 26?', '["the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation", "great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations"]'::jsonb, 'the worshiper confessed that an Aramean ready to perish was his father', 'That specific detail appears in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 1, 'What other detail is included in Deuteronomy 26?', '["the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile", "the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel"]'::jsonb, 'the third-year tithe included Levites and the needy', 'That additional detail is included in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 1, 'What outcome is emphasized in Deuteronomy 26?', '["offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences", "the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry"]'::jsonb, 'offering and confession rehearsed Israel''s story of redemption', 'That is the outcome emphasized in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 2, 'What was one reason given in Deuteronomy 26?', '["gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments", "covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience"]'::jsonb, 'gratitude in worship was tied to covenant memory', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 2, 'In Deuteronomy 26, what happened as a result of the chapter''s events or commands?', '["offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences", "the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry"]'::jsonb, 'offering and confession rehearsed Israel''s story of redemption', 'That is the outcome emphasized in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 26, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 2, 'In Deuteronomy 26, what was the people''s situation or setting?', '["Israel bringing firstfruits and tithes", "Israel facing blessing or curse", "Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab"]'::jsonb, 'Israel bringing firstfruits and tithes', 'That group is directly addressed or involved in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 26, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 2, 'In Deuteronomy 26, which action or event took place?', '["firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant", "the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land"]'::jsonb, 'firstfruits, tithes, and covenant confession', 'That is the main event or action described in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 26, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 2, 'In Deuteronomy 26, which concrete instruction or fact is mentioned?', '["the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation", "great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations"]'::jsonb, 'the worshiper confessed that an Aramean ready to perish was his father', 'That specific detail appears in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 26, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 2, 'In Deuteronomy 26, which additional fact is stated?', '["the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile", "the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel"]'::jsonb, 'the third-year tithe included Levites and the needy', 'That additional detail is included in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 26, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 2, 'In Deuteronomy 26, what location or setting matters to the chapter?', '["the place the LORD would choose", "the land of covenant life", "Mount Ebal", "the land of Moab"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 26, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 3, 'What does Deuteronomy 26 say that the worshiper did or declared?', '["firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant", "the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land"]'::jsonb, 'firstfruits, tithes, and covenant confession', 'That is the main event or action described in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 26 say that the worshiper did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 3, 'Why was this emphasized in Deuteronomy 26?', '["gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments", "covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience"]'::jsonb, 'gratitude in worship was tied to covenant memory', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 3, 'What fact in Deuteronomy 26 helps explain the chapter''s message?', '["the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation", "great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations"]'::jsonb, 'the worshiper confessed that an Aramean ready to perish was his father', 'That specific detail appears in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 26 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 3, 'What second fact in Deuteronomy 26 develops the chapter''s message?', '["the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile", "the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel"]'::jsonb, 'the third-year tithe included Levites and the needy', 'That additional detail is included in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 26 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 3, 'What result in Deuteronomy 26 shows the consequence of obedience or disobedience?', '["offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences", "the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry"]'::jsonb, 'offering and confession rehearsed Israel''s story of redemption', 'That is the outcome emphasized in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 26 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 3, 'Who is especially in view in Deuteronomy 26?', '["Israel bringing firstfruits and tithes", "Israel facing blessing or curse", "Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab"]'::jsonb, 'Israel bringing firstfruits and tithes', 'That group is directly addressed or involved in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 3, 'What place or setting frames the action in Deuteronomy 26?', '["the place the LORD would choose", "the land of covenant life", "Mount Ebal", "the land of Moab"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 4, 'In Deuteronomy 26, what concrete act shows how the covenant was being applied?', '["the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation", "great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations"]'::jsonb, 'the worshiper confessed that an Aramean ready to perish was his father', 'That specific detail appears in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 26, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 4, 'In Deuteronomy 26, what further act or fact supports the chapter''s message?', '["the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile", "the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel"]'::jsonb, 'the third-year tithe included Levites and the needy', 'That additional detail is included in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 26, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 4, 'What larger event in Deuteronomy 26 gives those details their meaning?', '["firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant", "the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land"]'::jsonb, 'firstfruits, tithes, and covenant confession', 'That is the main event or action described in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 26 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 4, 'What result in Deuteronomy 26 shaped Israel''s future action?', '["offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences", "the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry"]'::jsonb, 'offering and confession rehearsed Israel''s story of redemption', 'That is the outcome emphasized in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 26 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 4, 'Why did this matter according to Deuteronomy 26?', '["gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments", "covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience"]'::jsonb, 'gratitude in worship was tied to covenant memory', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 4, 'Who had to respond to these things in Deuteronomy 26?', '["Israel bringing firstfruits and tithes", "Israel facing blessing or curse", "Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab"]'::jsonb, 'Israel bringing firstfruits and tithes', 'That group is directly addressed or involved in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 4, 'Where is the action or teaching set in Deuteronomy 26?', '["the place the LORD would choose", "the land of covenant life", "Mount Ebal", "the land of Moab"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 26?', '["gratitude in worship was tied to covenant memory", "covenant life carries real historical blessings and judgments", "covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience"]'::jsonb, 'gratitude in worship was tied to covenant memory', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 5, 'What event in Deuteronomy 26 most clearly carries that message?', '["firstfruits, tithes, and covenant confession", "the blessings and curses of the covenant", "the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land"]'::jsonb, 'firstfruits, tithes, and covenant confession', 'That is the main event or action described in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 26 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 5, 'What detail in Deuteronomy 26 makes that message concrete?', '["the worshiper confessed that an Aramean ready to perish was his father", "obedience promised fruitfulness, victory, and exaltation", "great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations"]'::jsonb, 'the worshiper confessed that an Aramean ready to perish was his father', 'That specific detail appears in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 26 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 5, 'What additional detail in Deuteronomy 26 sharpens that message?', '["the third-year tithe included Levites and the needy", "disobedience threatened disease, defeat, siege, and exile", "the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel"]'::jsonb, 'the third-year tithe included Levites and the needy', 'That additional detail is included in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 26 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 5, 'What outcome in Deuteronomy 26 gives the chapter lasting force?', '["offering and confession rehearsed Israel''s story of redemption", "the chapter set before Israel the full gravity of covenant consequences", "the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry"]'::jsonb, 'offering and confession rehearsed Israel''s story of redemption', 'That is the outcome emphasized in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 26 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 5, 'Who stands under that message in Deuteronomy 26?', '["Israel bringing firstfruits and tithes", "Israel facing blessing or curse", "Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab"]'::jsonb, 'Israel bringing firstfruits and tithes', 'That group is directly addressed or involved in the chapter. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 26, 5, 'What setting in Deuteronomy 26 helps anchor the message?', '["the place the LORD would choose", "the land of covenant life", "Mount Ebal", "the land of Moab"]'::jsonb, 'the place the LORD would choose', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 26:1-19)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 26 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 1, 'Who is the main speaker or figure in Deuteronomy 27?', '["Moses and the priests", "Moses", "the LORD", "Og king of Bashan"]'::jsonb, 'Moses and the priests', 'Moses and the priests is central in this chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 1, 'Which group is most directly addressed or involved in Deuteronomy 27?', '["Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab", "Israel facing blessing or curse", "Israel called to return with heart and soul"]'::jsonb, 'Israel assembled for covenant ceremony', 'That group is directly addressed or involved in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 1, 'What place is central in Deuteronomy 27?', '["Mount Ebal", "the land of Moab", "the land of covenant life", "the land and the places of exile"]'::jsonb, 'Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 1, 'What event is described in Deuteronomy 27?', '["the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land", "the blessings and curses of the covenant", "the promise of restoration and the choice between life and death"]'::jsonb, 'the inscribed stones and the covenant curses', 'That is the main event or action described in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 1, 'Which detail appears in Deuteronomy 27?', '["great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations", "obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him"]'::jsonb, 'great stones coated with plaster were to bear the words of the law', 'That specific detail appears in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 1, 'What other detail is included in Deuteronomy 27?', '["the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel", "disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart"]'::jsonb, 'the Levites announced curses and the people answered Amen', 'That additional detail is included in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 1, 'What outcome is emphasized in Deuteronomy 27?', '["the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry", "the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel"]'::jsonb, 'the law was publicly inscribed and publicly affirmed', 'That is the outcome emphasized in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 2, 'What was one reason given in Deuteronomy 27?', '["covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience", "covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice"]'::jsonb, 'covenant accountability had to be explicit and communal', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 2, 'In Deuteronomy 27, what happened as a result of the chapter''s events or commands?', '["the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry", "the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel"]'::jsonb, 'the law was publicly inscribed and publicly affirmed', 'That is the outcome emphasized in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 27, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 2, 'In Deuteronomy 27, what was the people''s situation or setting?', '["Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab", "Israel facing blessing or curse", "Israel called to return with heart and soul"]'::jsonb, 'Israel assembled for covenant ceremony', 'That group is directly addressed or involved in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 27, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 2, 'In Deuteronomy 27, which action or event took place?', '["the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land", "the blessings and curses of the covenant", "the promise of restoration and the choice between life and death"]'::jsonb, 'the inscribed stones and the covenant curses', 'That is the main event or action described in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 27, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 2, 'In Deuteronomy 27, which concrete instruction or fact is mentioned?', '["great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations", "obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him"]'::jsonb, 'great stones coated with plaster were to bear the words of the law', 'That specific detail appears in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 27, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 2, 'In Deuteronomy 27, which additional fact is stated?', '["the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel", "disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart"]'::jsonb, 'the Levites announced curses and the people answered Amen', 'That additional detail is included in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 27, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 2, 'In Deuteronomy 27, what location or setting matters to the chapter?', '["Mount Ebal", "the land of Moab", "the land of covenant life", "the land and the places of exile"]'::jsonb, 'Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 27, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 3, 'What does Deuteronomy 27 say that Moses and the priests did or declared?', '["the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land", "the blessings and curses of the covenant", "the promise of restoration and the choice between life and death"]'::jsonb, 'the inscribed stones and the covenant curses', 'That is the main event or action described in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 27 say that Moses and the priests did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 3, 'Why was this emphasized in Deuteronomy 27?', '["covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience", "covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice"]'::jsonb, 'covenant accountability had to be explicit and communal', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 3, 'What fact in Deuteronomy 27 helps explain the chapter''s message?', '["great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations", "obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him"]'::jsonb, 'great stones coated with plaster were to bear the words of the law', 'That specific detail appears in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 27 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 3, 'What second fact in Deuteronomy 27 develops the chapter''s message?', '["the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel", "disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart"]'::jsonb, 'the Levites announced curses and the people answered Amen', 'That additional detail is included in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 27 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 3, 'What result in Deuteronomy 27 shows the consequence of obedience or disobedience?', '["the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry", "the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel"]'::jsonb, 'the law was publicly inscribed and publicly affirmed', 'That is the outcome emphasized in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 27 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 3, 'Who is especially in view in Deuteronomy 27?', '["Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab", "Israel facing blessing or curse", "Israel called to return with heart and soul"]'::jsonb, 'Israel assembled for covenant ceremony', 'That group is directly addressed or involved in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 3, 'What place or setting frames the action in Deuteronomy 27?', '["Mount Ebal", "the land of Moab", "the land of covenant life", "the land and the places of exile"]'::jsonb, 'Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 4, 'In Deuteronomy 27, what concrete act shows how the covenant was being applied?', '["great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations", "obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him"]'::jsonb, 'great stones coated with plaster were to bear the words of the law', 'That specific detail appears in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 27, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 4, 'In Deuteronomy 27, what further act or fact supports the chapter''s message?', '["the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel", "disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart"]'::jsonb, 'the Levites announced curses and the people answered Amen', 'That additional detail is included in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 27, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 4, 'What larger event in Deuteronomy 27 gives those details their meaning?', '["the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land", "the blessings and curses of the covenant", "the promise of restoration and the choice between life and death"]'::jsonb, 'the inscribed stones and the covenant curses', 'That is the main event or action described in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 27 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 4, 'What result in Deuteronomy 27 shaped Israel''s future action?', '["the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry", "the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel"]'::jsonb, 'the law was publicly inscribed and publicly affirmed', 'That is the outcome emphasized in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 27 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 4, 'Why did this matter according to Deuteronomy 27?', '["covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience", "covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice"]'::jsonb, 'covenant accountability had to be explicit and communal', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 4, 'Who had to respond to these things in Deuteronomy 27?', '["Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab", "Israel facing blessing or curse", "Israel called to return with heart and soul"]'::jsonb, 'Israel assembled for covenant ceremony', 'That group is directly addressed or involved in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 4, 'Where is the action or teaching set in Deuteronomy 27?', '["Mount Ebal", "the land of Moab", "the land of covenant life", "the land and the places of exile"]'::jsonb, 'Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 27?', '["covenant accountability had to be explicit and communal", "renewed covenant demanded seriousness and obedience", "covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice"]'::jsonb, 'covenant accountability had to be explicit and communal', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 5, 'What event in Deuteronomy 27 most clearly carries that message?', '["the inscribed stones and the covenant curses", "the renewal of the covenant before entering the land", "the blessings and curses of the covenant", "the promise of restoration and the choice between life and death"]'::jsonb, 'the inscribed stones and the covenant curses', 'That is the main event or action described in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 27 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 5, 'What detail in Deuteronomy 27 makes that message concrete?', '["great stones coated with plaster were to bear the words of the law", "the covenant included leaders, families, sojourners, and future generations", "obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him"]'::jsonb, 'great stones coated with plaster were to bear the words of the law', 'That specific detail appears in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 27 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 5, 'What additional detail in Deuteronomy 27 sharpens that message?', '["the Levites announced curses and the people answered Amen", "the secret things belong to the LORD but the revealed things belong to Israel", "disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart"]'::jsonb, 'the Levites announced curses and the people answered Amen', 'That additional detail is included in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 27 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 5, 'What outcome in Deuteronomy 27 gives the chapter lasting force?', '["the law was publicly inscribed and publicly affirmed", "the people were warned not to presume on peace while persisting in idolatry", "the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel"]'::jsonb, 'the law was publicly inscribed and publicly affirmed', 'That is the outcome emphasized in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 27 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 5, 'Who stands under that message in Deuteronomy 27?', '["Israel assembled for covenant ceremony", "all Israel standing before the LORD in Moab", "Israel facing blessing or curse", "Israel called to return with heart and soul"]'::jsonb, 'Israel assembled for covenant ceremony', 'That group is directly addressed or involved in the chapter. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 27, 5, 'What setting in Deuteronomy 27 helps anchor the message?', '["Mount Ebal", "the land of Moab", "the land of covenant life", "the land and the places of exile"]'::jsonb, 'Mount Ebal', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 27:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 27 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 1, 'Who is the main speaker or figure in Deuteronomy 28?', '["the LORD", "Og king of Bashan", "Moses", "false prophets and tempters to idolatry"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 1, 'Which group is most directly addressed or involved in Deuteronomy 28?', '["Israel facing blessing or curse", "Israel called to return with heart and soul", "all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations"]'::jsonb, 'Israel facing blessing or curse', 'That group is directly addressed or involved in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 1, 'What place is central in Deuteronomy 28?', '["the land of covenant life", "the land and the places of exile", "the land of Moab", "the Feast of Booths"]'::jsonb, 'the land of covenant life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 1, 'What event is described in Deuteronomy 28?', '["the blessings and curses of the covenant", "the promise of restoration and the choice between life and death", "the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness"]'::jsonb, 'the blessings and curses of the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 1, 'Which detail appears in Deuteronomy 28?', '["obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him", "the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years"]'::jsonb, 'obedience promised fruitfulness, victory, and exaltation', 'That specific detail appears in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 1, 'What other detail is included in Deuteronomy 28?', '["disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart", "the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant"]'::jsonb, 'disobedience threatened disease, defeat, siege, and exile', 'That additional detail is included in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 1, 'What outcome is emphasized in Deuteronomy 28?', '["the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel", "the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness"]'::jsonb, 'the chapter set before Israel the full gravity of covenant consequences', 'That is the outcome emphasized in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 2, 'What was one reason given in Deuteronomy 28?', '["covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice", "renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing"]'::jsonb, 'covenant life carries real historical blessings and judgments', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 2, 'In Deuteronomy 28, what happened as a result of the chapter''s events or commands?', '["the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel", "the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness"]'::jsonb, 'the chapter set before Israel the full gravity of covenant consequences', 'That is the outcome emphasized in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 28, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 2, 'In Deuteronomy 28, what was the people''s situation or setting?', '["Israel facing blessing or curse", "Israel called to return with heart and soul", "all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations"]'::jsonb, 'Israel facing blessing or curse', 'That group is directly addressed or involved in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 28, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 2, 'In Deuteronomy 28, which action or event took place?', '["the blessings and curses of the covenant", "the promise of restoration and the choice between life and death", "the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness"]'::jsonb, 'the blessings and curses of the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 28, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 2, 'In Deuteronomy 28, which concrete instruction or fact is mentioned?', '["obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him", "the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years"]'::jsonb, 'obedience promised fruitfulness, victory, and exaltation', 'That specific detail appears in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 28, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 2, 'In Deuteronomy 28, which additional fact is stated?', '["disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart", "the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant"]'::jsonb, 'disobedience threatened disease, defeat, siege, and exile', 'That additional detail is included in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 28, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 2, 'In Deuteronomy 28, what location or setting matters to the chapter?', '["the land of covenant life", "the land and the places of exile", "the land of Moab", "the Feast of Booths"]'::jsonb, 'the land of covenant life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 28, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 3, 'What does Deuteronomy 28 say that the LORD did or declared?', '["the blessings and curses of the covenant", "the promise of restoration and the choice between life and death", "the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness"]'::jsonb, 'the blessings and curses of the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 28 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 3, 'Why was this emphasized in Deuteronomy 28?', '["covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice", "renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing"]'::jsonb, 'covenant life carries real historical blessings and judgments', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 3, 'What fact in Deuteronomy 28 helps explain the chapter''s message?', '["obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him", "the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years"]'::jsonb, 'obedience promised fruitfulness, victory, and exaltation', 'That specific detail appears in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 28 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 3, 'What second fact in Deuteronomy 28 develops the chapter''s message?', '["disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart", "the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant"]'::jsonb, 'disobedience threatened disease, defeat, siege, and exile', 'That additional detail is included in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 28 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 3, 'What result in Deuteronomy 28 shows the consequence of obedience or disobedience?', '["the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel", "the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness"]'::jsonb, 'the chapter set before Israel the full gravity of covenant consequences', 'That is the outcome emphasized in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 28 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 3, 'Who is especially in view in Deuteronomy 28?', '["Israel facing blessing or curse", "Israel called to return with heart and soul", "all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations"]'::jsonb, 'Israel facing blessing or curse', 'That group is directly addressed or involved in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 3, 'What place or setting frames the action in Deuteronomy 28?', '["the land of covenant life", "the land and the places of exile", "the land of Moab", "the Feast of Booths"]'::jsonb, 'the land of covenant life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 4, 'In Deuteronomy 28, what concrete act shows how the covenant was being applied?', '["obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him", "the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years"]'::jsonb, 'obedience promised fruitfulness, victory, and exaltation', 'That specific detail appears in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 28, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 4, 'In Deuteronomy 28, what further act or fact supports the chapter''s message?', '["disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart", "the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant"]'::jsonb, 'disobedience threatened disease, defeat, siege, and exile', 'That additional detail is included in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 28, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 4, 'What larger event in Deuteronomy 28 gives those details their meaning?', '["the blessings and curses of the covenant", "the promise of restoration and the choice between life and death", "the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness"]'::jsonb, 'the blessings and curses of the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 28 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 4, 'What result in Deuteronomy 28 shaped Israel''s future action?', '["the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel", "the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness"]'::jsonb, 'the chapter set before Israel the full gravity of covenant consequences', 'That is the outcome emphasized in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 28 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 4, 'Why did this matter according to Deuteronomy 28?', '["covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice", "renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing"]'::jsonb, 'covenant life carries real historical blessings and judgments', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 4, 'Who had to respond to these things in Deuteronomy 28?', '["Israel facing blessing or curse", "Israel called to return with heart and soul", "all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations"]'::jsonb, 'Israel facing blessing or curse', 'That group is directly addressed or involved in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 4, 'Where is the action or teaching set in Deuteronomy 28?', '["the land of covenant life", "the land and the places of exile", "the land of Moab", "the Feast of Booths"]'::jsonb, 'the land of covenant life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 28?', '["covenant life carries real historical blessings and judgments", "repentance and obedience were presented as a real covenant choice", "renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing"]'::jsonb, 'covenant life carries real historical blessings and judgments', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 5, 'What event in Deuteronomy 28 most clearly carries that message?', '["the blessings and curses of the covenant", "the promise of restoration and the choice between life and death", "the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness"]'::jsonb, 'the blessings and curses of the covenant', 'That is the main event or action described in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 28 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 5, 'What detail in Deuteronomy 28 makes that message concrete?', '["obedience promised fruitfulness, victory, and exaltation", "God promised to gather His people when they returned to Him", "the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years"]'::jsonb, 'obedience promised fruitfulness, victory, and exaltation', 'That specific detail appears in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 28 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 5, 'What additional detail in Deuteronomy 28 sharpens that message?', '["disobedience threatened disease, defeat, siege, and exile", "the commandment was near, in the mouth and in the heart", "the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant"]'::jsonb, 'disobedience threatened disease, defeat, siege, and exile', 'That additional detail is included in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 28 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 5, 'What outcome in Deuteronomy 28 gives the chapter lasting force?', '["the chapter set before Israel the full gravity of covenant consequences", "life and death, blessing and curse were set before Israel", "the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness"]'::jsonb, 'the chapter set before Israel the full gravity of covenant consequences', 'That is the outcome emphasized in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 28 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 5, 'Who stands under that message in Deuteronomy 28?', '["Israel facing blessing or curse", "Israel called to return with heart and soul", "all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations"]'::jsonb, 'Israel facing blessing or curse', 'That group is directly addressed or involved in the chapter. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 28, 5, 'What setting in Deuteronomy 28 helps anchor the message?', '["the land of covenant life", "the land and the places of exile", "the land of Moab", "the Feast of Booths"]'::jsonb, 'the land of covenant life', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 28:1-68)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 28 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 1, 'Who is the main speaker or figure in Deuteronomy 29?', '["Moses", "Og king of Bashan", "the LORD", "false prophets and tempters to idolatry"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 1, 'Which group is most directly addressed or involved in Deuteronomy 29?', '["all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations", "Israel called to return with heart and soul", "heaven and earth hearing the song against Israel"]'::jsonb, 'all Israel standing before the LORD in Moab', 'That group is directly addressed or involved in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 1, 'What place is central in Deuteronomy 29?', '["the land of Moab", "the Feast of Booths", "the land and the places of exile", "the song of witness"]'::jsonb, 'the land of Moab', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 1, 'What event is described in Deuteronomy 29?', '["the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness", "the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice"]'::jsonb, 'the renewal of the covenant before entering the land', 'That is the main event or action described in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 1, 'Which detail appears in Deuteronomy 29?', '["the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years", "God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption"]'::jsonb, 'the covenant included leaders, families, sojourners, and future generations', 'That specific detail appears in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 1, 'What other detail is included in Deuteronomy 29?', '["the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant", "the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication"]'::jsonb, 'the secret things belong to the LORD but the revealed things belong to Israel', 'That additional detail is included in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 1, 'What outcome is emphasized in Deuteronomy 29?', '["the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness", "life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations"]'::jsonb, 'the people were warned not to presume on peace while persisting in idolatry', 'That is the outcome emphasized in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 2, 'What was one reason given in Deuteronomy 29?', '["renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing", "repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history"]'::jsonb, 'renewed covenant demanded seriousness and obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 2, 'In Deuteronomy 29, what happened as a result of the chapter''s events or commands?', '["the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness", "life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations"]'::jsonb, 'the people were warned not to presume on peace while persisting in idolatry', 'That is the outcome emphasized in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 29, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 2, 'In Deuteronomy 29, what was the people''s situation or setting?', '["all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations", "Israel called to return with heart and soul", "heaven and earth hearing the song against Israel"]'::jsonb, 'all Israel standing before the LORD in Moab', 'That group is directly addressed or involved in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 29, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 2, 'In Deuteronomy 29, which action or event took place?', '["the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness", "the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice"]'::jsonb, 'the renewal of the covenant before entering the land', 'That is the main event or action described in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 29, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 2, 'In Deuteronomy 29, which concrete instruction or fact is mentioned?', '["the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years", "God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption"]'::jsonb, 'the covenant included leaders, families, sojourners, and future generations', 'That specific detail appears in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 29, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 2, 'In Deuteronomy 29, which additional fact is stated?', '["the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant", "the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication"]'::jsonb, 'the secret things belong to the LORD but the revealed things belong to Israel', 'That additional detail is included in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 29, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 2, 'In Deuteronomy 29, what location or setting matters to the chapter?', '["the land of Moab", "the Feast of Booths", "the land and the places of exile", "the song of witness"]'::jsonb, 'the land of Moab', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 29, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 3, 'What does Deuteronomy 29 say that Moses did or declared?', '["the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness", "the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice"]'::jsonb, 'the renewal of the covenant before entering the land', 'That is the main event or action described in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 29 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 3, 'Why was this emphasized in Deuteronomy 29?', '["renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing", "repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history"]'::jsonb, 'renewed covenant demanded seriousness and obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 3, 'What fact in Deuteronomy 29 helps explain the chapter''s message?', '["the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years", "God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption"]'::jsonb, 'the covenant included leaders, families, sojourners, and future generations', 'That specific detail appears in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 29 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 3, 'What second fact in Deuteronomy 29 develops the chapter''s message?', '["the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant", "the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication"]'::jsonb, 'the secret things belong to the LORD but the revealed things belong to Israel', 'That additional detail is included in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 29 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 3, 'What result in Deuteronomy 29 shows the consequence of obedience or disobedience?', '["the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness", "life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations"]'::jsonb, 'the people were warned not to presume on peace while persisting in idolatry', 'That is the outcome emphasized in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 29 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 3, 'Who is especially in view in Deuteronomy 29?', '["all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations", "Israel called to return with heart and soul", "heaven and earth hearing the song against Israel"]'::jsonb, 'all Israel standing before the LORD in Moab', 'That group is directly addressed or involved in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 3, 'What place or setting frames the action in Deuteronomy 29?', '["the land of Moab", "the Feast of Booths", "the land and the places of exile", "the song of witness"]'::jsonb, 'the land of Moab', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 4, 'In Deuteronomy 29, what concrete act shows how the covenant was being applied?', '["the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years", "God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption"]'::jsonb, 'the covenant included leaders, families, sojourners, and future generations', 'That specific detail appears in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 29, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 4, 'In Deuteronomy 29, what further act or fact supports the chapter''s message?', '["the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant", "the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication"]'::jsonb, 'the secret things belong to the LORD but the revealed things belong to Israel', 'That additional detail is included in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 29, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 4, 'What larger event in Deuteronomy 29 gives those details their meaning?', '["the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness", "the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice"]'::jsonb, 'the renewal of the covenant before entering the land', 'That is the main event or action described in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 29 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 4, 'What result in Deuteronomy 29 shaped Israel''s future action?', '["the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness", "life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations"]'::jsonb, 'the people were warned not to presume on peace while persisting in idolatry', 'That is the outcome emphasized in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 29 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 4, 'Why did this matter according to Deuteronomy 29?', '["renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing", "repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history"]'::jsonb, 'renewed covenant demanded seriousness and obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 4, 'Who had to respond to these things in Deuteronomy 29?', '["all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations", "Israel called to return with heart and soul", "heaven and earth hearing the song against Israel"]'::jsonb, 'all Israel standing before the LORD in Moab', 'That group is directly addressed or involved in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 4, 'Where is the action or teaching set in Deuteronomy 29?', '["the land of Moab", "the Feast of Booths", "the land and the places of exile", "the song of witness"]'::jsonb, 'the land of Moab', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 29?', '["renewed covenant demanded seriousness and obedience", "future generations needed repeated covenant hearing", "repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history"]'::jsonb, 'renewed covenant demanded seriousness and obedience', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 5, 'What event in Deuteronomy 29 most clearly carries that message?', '["the renewal of the covenant before entering the land", "Joshua''s commissioning and the preparation of the song as witness", "the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice"]'::jsonb, 'the renewal of the covenant before entering the land', 'That is the main event or action described in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 29 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 5, 'What detail in Deuteronomy 29 makes that message concrete?', '["the covenant included leaders, families, sojourners, and future generations", "the law was to be read publicly every seven years", "God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption"]'::jsonb, 'the covenant included leaders, families, sojourners, and future generations', 'That specific detail appears in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 29 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 5, 'What additional detail in Deuteronomy 29 sharpens that message?', '["the secret things belong to the LORD but the revealed things belong to Israel", "the song would testify against Israel when they later broke covenant", "the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication"]'::jsonb, 'the secret things belong to the LORD but the revealed things belong to Israel', 'That additional detail is included in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 29 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 5, 'What outcome in Deuteronomy 29 gives the chapter lasting force?', '["the people were warned not to presume on peace while persisting in idolatry", "leadership passed to Joshua while the law remained as witness", "life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations"]'::jsonb, 'the people were warned not to presume on peace while persisting in idolatry', 'That is the outcome emphasized in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 29 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 5, 'Who stands under that message in Deuteronomy 29?', '["all Israel standing before the LORD in Moab", "Joshua, the priests, and future generations", "Israel called to return with heart and soul", "heaven and earth hearing the song against Israel"]'::jsonb, 'all Israel standing before the LORD in Moab', 'That group is directly addressed or involved in the chapter. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 29, 5, 'What setting in Deuteronomy 29 helps anchor the message?', '["the land of Moab", "the Feast of Booths", "the land and the places of exile", "the song of witness"]'::jsonb, 'the land of Moab', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 29:10-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 29
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 29 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 1, 'Who is the main speaker or figure in Deuteronomy 30?', '["the LORD", "Og king of Bashan", "Moses", "false prophets and tempters to idolatry"]'::jsonb, 'the LORD', 'the LORD is central in this chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 1, 'Which group is most directly addressed or involved in Deuteronomy 30?', '["Israel called to return with heart and soul", "heaven and earth hearing the song against Israel", "Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing"]'::jsonb, 'Israel called to return with heart and soul', 'That group is directly addressed or involved in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 1, 'What place is central in Deuteronomy 30?', '["the land and the places of exile", "the song of witness", "the Feast of Booths", "the final blessing before Moses'' death"]'::jsonb, 'the land and the places of exile', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 1, 'What event is described in Deuteronomy 30?', '["the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice", "Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes"]'::jsonb, 'the promise of restoration and the choice between life and death', 'That is the main event or action described in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 1, 'Which detail appears in Deuteronomy 30?', '["God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption", "the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people"]'::jsonb, 'God promised to gather His people when they returned to Him', 'That specific detail appears in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 1, 'What other detail is included in Deuteronomy 30?', '["the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication", "the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection"]'::jsonb, 'the commandment was near, in the mouth and in the heart', 'That additional detail is included in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 1, 'What outcome is emphasized in Deuteronomy 30?', '["life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations", "leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God"]'::jsonb, 'life and death, blessing and curse were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 2, 'What was one reason given in Deuteronomy 30?', '["repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history", "future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence"]'::jsonb, 'repentance and obedience were presented as a real covenant choice', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 2, 'In Deuteronomy 30, what happened as a result of the chapter''s events or commands?', '["life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations", "leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God"]'::jsonb, 'life and death, blessing and curse were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 30, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 2, 'In Deuteronomy 30, what was the people''s situation or setting?', '["Israel called to return with heart and soul", "heaven and earth hearing the song against Israel", "Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing"]'::jsonb, 'Israel called to return with heart and soul', 'That group is directly addressed or involved in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 30, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 2, 'In Deuteronomy 30, which action or event took place?', '["the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice", "Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes"]'::jsonb, 'the promise of restoration and the choice between life and death', 'That is the main event or action described in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 30, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 2, 'In Deuteronomy 30, which concrete instruction or fact is mentioned?', '["God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption", "the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people"]'::jsonb, 'God promised to gather His people when they returned to Him', 'That specific detail appears in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 30, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 2, 'In Deuteronomy 30, which additional fact is stated?', '["the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication", "the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection"]'::jsonb, 'the commandment was near, in the mouth and in the heart', 'That additional detail is included in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 30, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 2, 'In Deuteronomy 30, what location or setting matters to the chapter?', '["the land and the places of exile", "the song of witness", "the Feast of Booths", "the final blessing before Moses'' death"]'::jsonb, 'the land and the places of exile', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 30, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 3, 'What does Deuteronomy 30 say that the LORD did or declared?', '["the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice", "Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes"]'::jsonb, 'the promise of restoration and the choice between life and death', 'That is the main event or action described in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 30 say that the LORD did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 3, 'Why was this emphasized in Deuteronomy 30?', '["repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history", "future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence"]'::jsonb, 'repentance and obedience were presented as a real covenant choice', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 3, 'What fact in Deuteronomy 30 helps explain the chapter''s message?', '["God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption", "the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people"]'::jsonb, 'God promised to gather His people when they returned to Him', 'That specific detail appears in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 30 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 3, 'What second fact in Deuteronomy 30 develops the chapter''s message?', '["the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication", "the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection"]'::jsonb, 'the commandment was near, in the mouth and in the heart', 'That additional detail is included in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 30 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 3, 'What result in Deuteronomy 30 shows the consequence of obedience or disobedience?', '["life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations", "leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God"]'::jsonb, 'life and death, blessing and curse were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 30 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 3, 'Who is especially in view in Deuteronomy 30?', '["Israel called to return with heart and soul", "heaven and earth hearing the song against Israel", "Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing"]'::jsonb, 'Israel called to return with heart and soul', 'That group is directly addressed or involved in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 3, 'What place or setting frames the action in Deuteronomy 30?', '["the land and the places of exile", "the song of witness", "the Feast of Booths", "the final blessing before Moses'' death"]'::jsonb, 'the land and the places of exile', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 4, 'In Deuteronomy 30, what concrete act shows how the covenant was being applied?', '["God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption", "the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people"]'::jsonb, 'God promised to gather His people when they returned to Him', 'That specific detail appears in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 30, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 4, 'In Deuteronomy 30, what further act or fact supports the chapter''s message?', '["the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication", "the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection"]'::jsonb, 'the commandment was near, in the mouth and in the heart', 'That additional detail is included in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 30, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 4, 'What larger event in Deuteronomy 30 gives those details their meaning?', '["the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice", "Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes"]'::jsonb, 'the promise of restoration and the choice between life and death', 'That is the main event or action described in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 30 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 4, 'What result in Deuteronomy 30 shaped Israel''s future action?', '["life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations", "leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God"]'::jsonb, 'life and death, blessing and curse were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 30 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 4, 'Why did this matter according to Deuteronomy 30?', '["repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history", "future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence"]'::jsonb, 'repentance and obedience were presented as a real covenant choice', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 4, 'Who had to respond to these things in Deuteronomy 30?', '["Israel called to return with heart and soul", "heaven and earth hearing the song against Israel", "Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing"]'::jsonb, 'Israel called to return with heart and soul', 'That group is directly addressed or involved in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 4, 'Where is the action or teaching set in Deuteronomy 30?', '["the land and the places of exile", "the song of witness", "the Feast of Booths", "the final blessing before Moses'' death"]'::jsonb, 'the land and the places of exile', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 30?', '["repentance and obedience were presented as a real covenant choice", "divine justice and mercy frame Israel''s history", "future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence"]'::jsonb, 'repentance and obedience were presented as a real covenant choice', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 5, 'What event in Deuteronomy 30 most clearly carries that message?', '["the promise of restoration and the choice between life and death", "the Song of Moses recounting Israel''s corruption and God''s justice", "Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes"]'::jsonb, 'the promise of restoration and the choice between life and death', 'That is the main event or action described in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 30 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 5, 'What detail in Deuteronomy 30 makes that message concrete?', '["God promised to gather His people when they returned to Him", "the song calls God the Rock and exposes Israel''s corruption", "the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people"]'::jsonb, 'God promised to gather His people when they returned to Him', 'That specific detail appears in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 30 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 5, 'What additional detail in Deuteronomy 30 sharpens that message?', '["the commandment was near, in the mouth and in the heart", "God promised both judgment and vindication", "the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection"]'::jsonb, 'the commandment was near, in the mouth and in the heart', 'That additional detail is included in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 30 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 5, 'What outcome in Deuteronomy 30 gives the chapter lasting force?', '["life and death, blessing and curse were set before Israel", "the song served as a lasting witness for future generations", "leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God"]'::jsonb, 'life and death, blessing and curse were set before Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 30 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 5, 'Who stands under that message in Deuteronomy 30?', '["Israel called to return with heart and soul", "heaven and earth hearing the song against Israel", "Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing"]'::jsonb, 'Israel called to return with heart and soul', 'That group is directly addressed or involved in the chapter. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 30?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 30, 5, 'What setting in Deuteronomy 30 helps anchor the message?', '["the land and the places of exile", "the song of witness", "the Feast of Booths", "the final blessing before Moses'' death"]'::jsonb, 'the land and the places of exile', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 30:1-20)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 30
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 30 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 1, 'Who is the main speaker or figure in Deuteronomy 31?', '["Moses", "Og king of Bashan", "the LORD", "false prophets and tempters to idolatry"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 1, 'Which group is most directly addressed or involved in Deuteronomy 31?', '["Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing", "heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death"]'::jsonb, 'Joshua, the priests, and future generations', 'That group is directly addressed or involved in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 1, 'What place is central in Deuteronomy 31?', '["the Feast of Booths", "the final blessing before Moses'' death", "the song of witness", "Mount Nebo"]'::jsonb, 'the Feast of Booths', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 1, 'What event is described in Deuteronomy 31?', '["Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes", "the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua"]'::jsonb, 'Joshua''s commissioning and the preparation of the song as witness', 'That is the main event or action described in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 1, 'Which detail appears in Deuteronomy 31?', '["the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people", "the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it"]'::jsonb, 'the law was to be read publicly every seven years', 'That specific detail appears in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 1, 'What other detail is included in Deuteronomy 31?', '["the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection", "God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him"]'::jsonb, 'the song would testify against Israel when they later broke covenant', 'That additional detail is included in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 1, 'What outcome is emphasized in Deuteronomy 31?', '["leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God", "the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel"]'::jsonb, 'leadership passed to Joshua while the law remained as witness', 'That is the outcome emphasized in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 2, 'What was one reason given in Deuteronomy 31?', '["future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence", "divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died"]'::jsonb, 'future generations needed repeated covenant hearing', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 2, 'In Deuteronomy 31, what happened as a result of the chapter''s events or commands?', '["leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God", "the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel"]'::jsonb, 'leadership passed to Joshua while the law remained as witness', 'That is the outcome emphasized in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 31, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 2, 'In Deuteronomy 31, what was the people''s situation or setting?', '["Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing", "heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death"]'::jsonb, 'Joshua, the priests, and future generations', 'That group is directly addressed or involved in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 31, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 2, 'In Deuteronomy 31, which action or event took place?', '["Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes", "the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua"]'::jsonb, 'Joshua''s commissioning and the preparation of the song as witness', 'That is the main event or action described in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 31, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 2, 'In Deuteronomy 31, which concrete instruction or fact is mentioned?', '["the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people", "the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it"]'::jsonb, 'the law was to be read publicly every seven years', 'That specific detail appears in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 31, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 2, 'In Deuteronomy 31, which additional fact is stated?', '["the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection", "God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him"]'::jsonb, 'the song would testify against Israel when they later broke covenant', 'That additional detail is included in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 31, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 2, 'In Deuteronomy 31, what location or setting matters to the chapter?', '["the Feast of Booths", "the final blessing before Moses'' death", "the song of witness", "Mount Nebo"]'::jsonb, 'the Feast of Booths', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 31, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 3, 'What does Deuteronomy 31 say that Moses did or declared?', '["Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes", "the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua"]'::jsonb, 'Joshua''s commissioning and the preparation of the song as witness', 'That is the main event or action described in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 31 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 3, 'Why was this emphasized in Deuteronomy 31?', '["future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence", "divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died"]'::jsonb, 'future generations needed repeated covenant hearing', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 3, 'What fact in Deuteronomy 31 helps explain the chapter''s message?', '["the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people", "the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it"]'::jsonb, 'the law was to be read publicly every seven years', 'That specific detail appears in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 31 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 3, 'What second fact in Deuteronomy 31 develops the chapter''s message?', '["the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection", "God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him"]'::jsonb, 'the song would testify against Israel when they later broke covenant', 'That additional detail is included in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 31 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 3, 'What result in Deuteronomy 31 shows the consequence of obedience or disobedience?', '["leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God", "the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel"]'::jsonb, 'leadership passed to Joshua while the law remained as witness', 'That is the outcome emphasized in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 31 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 3, 'Who is especially in view in Deuteronomy 31?', '["Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing", "heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death"]'::jsonb, 'Joshua, the priests, and future generations', 'That group is directly addressed or involved in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 3, 'What place or setting frames the action in Deuteronomy 31?', '["the Feast of Booths", "the final blessing before Moses'' death", "the song of witness", "Mount Nebo"]'::jsonb, 'the Feast of Booths', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 4, 'In Deuteronomy 31, what concrete act shows how the covenant was being applied?', '["the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people", "the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it"]'::jsonb, 'the law was to be read publicly every seven years', 'That specific detail appears in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 31, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 4, 'In Deuteronomy 31, what further act or fact supports the chapter''s message?', '["the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection", "God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him"]'::jsonb, 'the song would testify against Israel when they later broke covenant', 'That additional detail is included in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 31, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 4, 'What larger event in Deuteronomy 31 gives those details their meaning?', '["Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes", "the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua"]'::jsonb, 'Joshua''s commissioning and the preparation of the song as witness', 'That is the main event or action described in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 31 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 4, 'What result in Deuteronomy 31 shaped Israel''s future action?', '["leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God", "the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel"]'::jsonb, 'leadership passed to Joshua while the law remained as witness', 'That is the outcome emphasized in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 31 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 4, 'Why did this matter according to Deuteronomy 31?', '["future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence", "divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died"]'::jsonb, 'future generations needed repeated covenant hearing', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 4, 'Who had to respond to these things in Deuteronomy 31?', '["Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing", "heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death"]'::jsonb, 'Joshua, the priests, and future generations', 'That group is directly addressed or involved in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 4, 'Where is the action or teaching set in Deuteronomy 31?', '["the Feast of Booths", "the final blessing before Moses'' death", "the song of witness", "Mount Nebo"]'::jsonb, 'the Feast of Booths', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 31?', '["future generations needed repeated covenant hearing", "the covenant story ends in praise of God''s protecting presence", "divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died"]'::jsonb, 'future generations needed repeated covenant hearing', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 5, 'What event in Deuteronomy 31 most clearly carries that message?', '["Joshua''s commissioning and the preparation of the song as witness", "the blessing of the tribes", "the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua"]'::jsonb, 'Joshua''s commissioning and the preparation of the song as witness', 'That is the main event or action described in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 31 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 5, 'What detail in Deuteronomy 31 makes that message concrete?', '["the law was to be read publicly every seven years", "the blessing celebrates the LORD coming from Sinai to help His people", "the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it"]'::jsonb, 'the law was to be read publicly every seven years', 'That specific detail appears in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 31 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 5, 'What additional detail in Deuteronomy 31 sharpens that message?', '["the song would testify against Israel when they later broke covenant", "the tribes receive distinct words of strength, fruitfulness, or protection", "God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him"]'::jsonb, 'the song would testify against Israel when they later broke covenant', 'That additional detail is included in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 31 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 5, 'What outcome in Deuteronomy 31 gives the chapter lasting force?', '["leadership passed to Joshua while the law remained as witness", "Israel is declared blessed because no one is like its God", "the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel"]'::jsonb, 'leadership passed to Joshua while the law remained as witness', 'That is the outcome emphasized in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 31 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 5, 'Who stands under that message in Deuteronomy 31?', '["Joshua, the priests, and future generations", "the tribes of Israel receiving final blessing", "heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death"]'::jsonb, 'Joshua, the priests, and future generations', 'That group is directly addressed or involved in the chapter. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 31?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 31, 5, 'What setting in Deuteronomy 31 helps anchor the message?', '["the Feast of Booths", "the final blessing before Moses'' death", "the song of witness", "Mount Nebo"]'::jsonb, 'the Feast of Booths', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 31:7-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 31
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 31 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 1, 'Who is the main speaker or figure in Deuteronomy 32?', '["Moses", "Og king of Bashan", "the LORD", "false prophets and tempters to idolatry"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 1, 'Which group is most directly addressed or involved in Deuteronomy 32?', '["heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death", "the tribes of Israel receiving final blessing", "Israel east of the Jordan"]'::jsonb, 'heaven and earth hearing the song against Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 1, 'What place is central in Deuteronomy 32?', '["the song of witness", "Mount Nebo", "the final blessing before Moses'' death", "Horeb"]'::jsonb, 'the song of witness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 1, 'What event is described in Deuteronomy 32?', '["the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua", "the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea"]'::jsonb, 'the Song of Moses recounting Israel''s corruption and God''s justice', 'That is the main event or action described in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 1, 'Which detail appears in Deuteronomy 32?', '["the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it", "the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership"]'::jsonb, 'the song calls God the Rock and exposes Israel''s corruption', 'That specific detail appears in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 1, 'What other detail is included in Deuteronomy 32?', '["God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report"]'::jsonb, 'God promised both judgment and vindication', 'That additional detail is included in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 1, 'What outcome is emphasized in Deuteronomy 32?', '["the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel", "Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land"]'::jsonb, 'the song served as a lasting witness for future generations', 'That is the outcome emphasized in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 2, 'What was one reason given in Deuteronomy 32?', '["divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died", "the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD"]'::jsonb, 'divine justice and mercy frame Israel''s history', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 2, 'In Deuteronomy 32, what happened as a result of the chapter''s events or commands?', '["the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel", "Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land"]'::jsonb, 'the song served as a lasting witness for future generations', 'That is the outcome emphasized in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 32, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 2, 'In Deuteronomy 32, what was the people''s situation or setting?', '["heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death", "the tribes of Israel receiving final blessing", "Israel east of the Jordan"]'::jsonb, 'heaven and earth hearing the song against Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 32, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 2, 'In Deuteronomy 32, which action or event took place?', '["the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua", "the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea"]'::jsonb, 'the Song of Moses recounting Israel''s corruption and God''s justice', 'That is the main event or action described in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 32, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 2, 'In Deuteronomy 32, which concrete instruction or fact is mentioned?', '["the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it", "the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership"]'::jsonb, 'the song calls God the Rock and exposes Israel''s corruption', 'That specific detail appears in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 32, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 2, 'In Deuteronomy 32, which additional fact is stated?', '["God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report"]'::jsonb, 'God promised both judgment and vindication', 'That additional detail is included in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 32, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 2, 'In Deuteronomy 32, what location or setting matters to the chapter?', '["the song of witness", "Mount Nebo", "the final blessing before Moses'' death", "Horeb"]'::jsonb, 'the song of witness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 32, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 3, 'What does Deuteronomy 32 say that Moses did or declared?', '["the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua", "the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea"]'::jsonb, 'the Song of Moses recounting Israel''s corruption and God''s justice', 'That is the main event or action described in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 32 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 3, 'Why was this emphasized in Deuteronomy 32?', '["divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died", "the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD"]'::jsonb, 'divine justice and mercy frame Israel''s history', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 3, 'What fact in Deuteronomy 32 helps explain the chapter''s message?', '["the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it", "the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership"]'::jsonb, 'the song calls God the Rock and exposes Israel''s corruption', 'That specific detail appears in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 32 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 3, 'What second fact in Deuteronomy 32 develops the chapter''s message?', '["God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report"]'::jsonb, 'God promised both judgment and vindication', 'That additional detail is included in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 32 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 3, 'What result in Deuteronomy 32 shows the consequence of obedience or disobedience?', '["the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel", "Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land"]'::jsonb, 'the song served as a lasting witness for future generations', 'That is the outcome emphasized in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 32 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 3, 'Who is especially in view in Deuteronomy 32?', '["heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death", "the tribes of Israel receiving final blessing", "Israel east of the Jordan"]'::jsonb, 'heaven and earth hearing the song against Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 3, 'What place or setting frames the action in Deuteronomy 32?', '["the song of witness", "Mount Nebo", "the final blessing before Moses'' death", "Horeb"]'::jsonb, 'the song of witness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 4, 'In Deuteronomy 32, what concrete act shows how the covenant was being applied?', '["the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it", "the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership"]'::jsonb, 'the song calls God the Rock and exposes Israel''s corruption', 'That specific detail appears in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 32, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 4, 'In Deuteronomy 32, what further act or fact supports the chapter''s message?', '["God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report"]'::jsonb, 'God promised both judgment and vindication', 'That additional detail is included in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 32, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 4, 'What larger event in Deuteronomy 32 gives those details their meaning?', '["the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua", "the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea"]'::jsonb, 'the Song of Moses recounting Israel''s corruption and God''s justice', 'That is the main event or action described in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 32 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 4, 'What result in Deuteronomy 32 shaped Israel''s future action?', '["the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel", "Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land"]'::jsonb, 'the song served as a lasting witness for future generations', 'That is the outcome emphasized in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 32 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 4, 'Why did this matter according to Deuteronomy 32?', '["divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died", "the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD"]'::jsonb, 'divine justice and mercy frame Israel''s history', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 4, 'Who had to respond to these things in Deuteronomy 32?', '["heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death", "the tribes of Israel receiving final blessing", "Israel east of the Jordan"]'::jsonb, 'heaven and earth hearing the song against Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 4, 'Where is the action or teaching set in Deuteronomy 32?', '["the song of witness", "Mount Nebo", "the final blessing before Moses'' death", "Horeb"]'::jsonb, 'the song of witness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 32?', '["divine justice and mercy frame Israel''s history", "God''s purpose continued even after Moses died", "the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD"]'::jsonb, 'divine justice and mercy frame Israel''s history', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 5, 'What event in Deuteronomy 32 most clearly carries that message?', '["the Song of Moses recounting Israel''s corruption and God''s justice", "the death of Moses and the transition to Joshua", "the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea"]'::jsonb, 'the Song of Moses recounting Israel''s corruption and God''s justice', 'That is the main event or action described in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 32 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 5, 'What detail in Deuteronomy 32 makes that message concrete?', '["the song calls God the Rock and exposes Israel''s corruption", "Moses saw the land from Nebo but did not enter it", "the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership"]'::jsonb, 'the song calls God the Rock and exposes Israel''s corruption', 'That specific detail appears in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 32 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 5, 'What additional detail in Deuteronomy 32 sharpens that message?', '["God promised both judgment and vindication", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report"]'::jsonb, 'God promised both judgment and vindication', 'That additional detail is included in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 32 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 5, 'What outcome in Deuteronomy 32 gives the chapter lasting force?', '["the song served as a lasting witness for future generations", "Israel mourned Moses and no prophet arose like him in Israel", "Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land"]'::jsonb, 'the song served as a lasting witness for future generations', 'That is the outcome emphasized in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 32 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 5, 'Who stands under that message in Deuteronomy 32?', '["heaven and earth hearing the song against Israel", "Joshua and Israel after Moses'' death", "the tribes of Israel receiving final blessing", "Israel east of the Jordan"]'::jsonb, 'heaven and earth hearing the song against Israel', 'That group is directly addressed or involved in the chapter. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 32?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 32, 5, 'What setting in Deuteronomy 32 helps anchor the message?', '["the song of witness", "Mount Nebo", "the final blessing before Moses'' death", "Horeb"]'::jsonb, 'the song of witness', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 32:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 32
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 32 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 1, 'Who is the main speaker or figure in Deuteronomy 33?', '["Moses", "Og king of Bashan", "the LORD", "false prophets and tempters to idolatry"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 1, 'Which group is most directly addressed or involved in Deuteronomy 33?', '["the tribes of Israel receiving final blessing", "Israel east of the Jordan", "Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon"]'::jsonb, 'the tribes of Israel receiving final blessing', 'That group is directly addressed or involved in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 1, 'What place is central in Deuteronomy 33?', '["the final blessing before Moses'' death", "Horeb", "Mount Nebo", "the land of Sihon king of Heshbon"]'::jsonb, 'the final blessing before Moses'' death', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 1, 'What event is described in Deuteronomy 33?', '["the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon"]'::jsonb, 'the blessing of the tribes', 'That is the main event or action described in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 1, 'Which detail appears in Deuteronomy 33?', '["the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership", "Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon"]'::jsonb, 'the blessing celebrates the LORD coming from Sinai to help His people', 'That specific detail appears in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 1, 'What other detail is included in Deuteronomy 33?', '["the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated"]'::jsonb, 'the tribes receive distinct words of strength, fruitfulness, or protection', 'That additional detail is included in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 1, 'What outcome is emphasized in Deuteronomy 33?', '["Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land", "Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan"]'::jsonb, 'Israel is declared blessed because no one is like its God', 'That is the outcome emphasized in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 2, 'What was one reason given in Deuteronomy 33?', '["the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD", "God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand"]'::jsonb, 'the covenant story ends in praise of God''s protecting presence', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 2, 'In Deuteronomy 33, what happened as a result of the chapter''s events or commands?', '["Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land", "Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan"]'::jsonb, 'Israel is declared blessed because no one is like its God', 'That is the outcome emphasized in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 33, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 2, 'In Deuteronomy 33, what was the people''s situation or setting?', '["the tribes of Israel receiving final blessing", "Israel east of the Jordan", "Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon"]'::jsonb, 'the tribes of Israel receiving final blessing', 'That group is directly addressed or involved in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 33, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 2, 'In Deuteronomy 33, which action or event took place?', '["the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon"]'::jsonb, 'the blessing of the tribes', 'That is the main event or action described in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 33, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 2, 'In Deuteronomy 33, which concrete instruction or fact is mentioned?', '["the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership", "Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon"]'::jsonb, 'the blessing celebrates the LORD coming from Sinai to help His people', 'That specific detail appears in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 33, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 2, 'In Deuteronomy 33, which additional fact is stated?', '["the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated"]'::jsonb, 'the tribes receive distinct words of strength, fruitfulness, or protection', 'That additional detail is included in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 33, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 2, 'In Deuteronomy 33, what location or setting matters to the chapter?', '["the final blessing before Moses'' death", "Horeb", "Mount Nebo", "the land of Sihon king of Heshbon"]'::jsonb, 'the final blessing before Moses'' death', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 33, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 3, 'What does Deuteronomy 33 say that Moses did or declared?', '["the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon"]'::jsonb, 'the blessing of the tribes', 'That is the main event or action described in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 33 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 3, 'Why was this emphasized in Deuteronomy 33?', '["the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD", "God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand"]'::jsonb, 'the covenant story ends in praise of God''s protecting presence', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 3, 'What fact in Deuteronomy 33 helps explain the chapter''s message?', '["the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership", "Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon"]'::jsonb, 'the blessing celebrates the LORD coming from Sinai to help His people', 'That specific detail appears in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 33 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 3, 'What second fact in Deuteronomy 33 develops the chapter''s message?', '["the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated"]'::jsonb, 'the tribes receive distinct words of strength, fruitfulness, or protection', 'That additional detail is included in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 33 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 3, 'What result in Deuteronomy 33 shows the consequence of obedience or disobedience?', '["Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land", "Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan"]'::jsonb, 'Israel is declared blessed because no one is like its God', 'That is the outcome emphasized in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 33 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 3, 'Who is especially in view in Deuteronomy 33?', '["the tribes of Israel receiving final blessing", "Israel east of the Jordan", "Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon"]'::jsonb, 'the tribes of Israel receiving final blessing', 'That group is directly addressed or involved in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 3, 'What place or setting frames the action in Deuteronomy 33?', '["the final blessing before Moses'' death", "Horeb", "Mount Nebo", "the land of Sihon king of Heshbon"]'::jsonb, 'the final blessing before Moses'' death', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 4, 'In Deuteronomy 33, what concrete act shows how the covenant was being applied?', '["the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership", "Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon"]'::jsonb, 'the blessing celebrates the LORD coming from Sinai to help His people', 'That specific detail appears in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 33, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 4, 'In Deuteronomy 33, what further act or fact supports the chapter''s message?', '["the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated"]'::jsonb, 'the tribes receive distinct words of strength, fruitfulness, or protection', 'That additional detail is included in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 33, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 4, 'What larger event in Deuteronomy 33 gives those details their meaning?', '["the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon"]'::jsonb, 'the blessing of the tribes', 'That is the main event or action described in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 33 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 4, 'What result in Deuteronomy 33 shaped Israel''s future action?', '["Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land", "Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan"]'::jsonb, 'Israel is declared blessed because no one is like its God', 'That is the outcome emphasized in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 33 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 4, 'Why did this matter according to Deuteronomy 33?', '["the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD", "God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand"]'::jsonb, 'the covenant story ends in praise of God''s protecting presence', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 4, 'Who had to respond to these things in Deuteronomy 33?', '["the tribes of Israel receiving final blessing", "Israel east of the Jordan", "Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon"]'::jsonb, 'the tribes of Israel receiving final blessing', 'That group is directly addressed or involved in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 4, 'Where is the action or teaching set in Deuteronomy 33?', '["the final blessing before Moses'' death", "Horeb", "Mount Nebo", "the land of Sihon king of Heshbon"]'::jsonb, 'the final blessing before Moses'' death', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 33?', '["the covenant story ends in praise of God''s protecting presence", "the people rebelled against the command of the LORD", "God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand"]'::jsonb, 'the covenant story ends in praise of God''s protecting presence', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 5, 'What event in Deuteronomy 33 most clearly carries that message?', '["the blessing of the tribes", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon"]'::jsonb, 'the blessing of the tribes', 'That is the main event or action described in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 33 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 5, 'What detail in Deuteronomy 33 makes that message concrete?', '["the blessing celebrates the LORD coming from Sinai to help His people", "judges were appointed to help bear the burden of leadership", "Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon"]'::jsonb, 'the blessing celebrates the LORD coming from Sinai to help His people', 'That specific detail appears in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 33 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 5, 'What additional detail in Deuteronomy 33 sharpens that message?', '["the tribes receive distinct words of strength, fruitfulness, or protection", "the people refused to enter the land after the spies'' report", "Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated"]'::jsonb, 'the tribes receive distinct words of strength, fruitfulness, or protection', 'That additional detail is included in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 33 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 5, 'What outcome in Deuteronomy 33 gives the chapter lasting force?', '["Israel is declared blessed because no one is like its God", "the wilderness generation was sentenced to die outside the land", "Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan"]'::jsonb, 'Israel is declared blessed because no one is like its God', 'That is the outcome emphasized in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 33 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 5, 'Who stands under that message in Deuteronomy 33?', '["the tribes of Israel receiving final blessing", "Israel east of the Jordan", "Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon"]'::jsonb, 'the tribes of Israel receiving final blessing', 'That group is directly addressed or involved in the chapter. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 33, 5, 'What setting in Deuteronomy 33 helps anchor the message?', '["the final blessing before Moses'' death", "Horeb", "Mount Nebo", "the land of Sihon king of Heshbon"]'::jsonb, 'the final blessing before Moses'' death', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 33:2-29)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 33
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 33 helps anchor the message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 1, 'Who is the main speaker or figure in Deuteronomy 34?', '["Moses", "Og king of Bashan", "the LORD", "false prophets and tempters to idolatry"]'::jsonb, 'Moses', 'Moses is central in this chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the main speaker or figure in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 1, 'Which group is most directly addressed or involved in Deuteronomy 34?', '["Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon", "Israel east of the Jordan", "Reuben, Gad, and half Manasseh"]'::jsonb, 'Joshua and Israel after Moses'' death', 'That group is directly addressed or involved in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group is most directly addressed or involved in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 1, 'What place is central in Deuteronomy 34?', '["Mount Nebo", "the land of Sihon king of Heshbon", "Horeb", "Bashan"]'::jsonb, 'Mount Nebo', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 1
    AND q.prompt = 'What place is central in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 1, 'What event is described in Deuteronomy 34?', '["the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land"]'::jsonb, 'the death of Moses and the transition to Joshua', 'That is the main event or action described in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 1
    AND q.prompt = 'What event is described in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 1, 'Which detail appears in Deuteronomy 34?', '["Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon", "judges were appointed to help bear the burden of leadership", "Og and his cities were defeated"]'::jsonb, 'Moses saw the land from Nebo but did not enter it', 'That specific detail appears in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which detail appears in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 1, 'What other detail is included in Deuteronomy 34?', '["Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated", "the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan"]'::jsonb, 'Joshua was filled with the spirit of wisdom because Moses laid hands on him', 'That additional detail is included in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 1
    AND q.prompt = 'What other detail is included in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 1, 'What outcome is emphasized in Deuteronomy 34?', '["Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan", "the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest"]'::jsonb, 'Israel mourned Moses and no prophet arose like him in Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 1
    AND q.prompt = 'What outcome is emphasized in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 2, 'What was one reason given in Deuteronomy 34?', '["God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand"]'::jsonb, 'God''s purpose continued even after Moses died', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was one reason given in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 2, 'In Deuteronomy 34, what happened as a result of the chapter''s events or commands?', '["Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan", "the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest"]'::jsonb, 'Israel mourned Moses and no prophet arose like him in Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 34, what happened as a result of the chapter''s events or commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 2, 'In Deuteronomy 34, what was the people''s situation or setting?', '["Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon", "Israel east of the Jordan", "Reuben, Gad, and half Manasseh"]'::jsonb, 'Joshua and Israel after Moses'' death', 'That group is directly addressed or involved in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 34, what was the people''s situation or setting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 2, 'In Deuteronomy 34, which action or event took place?', '["the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land"]'::jsonb, 'the death of Moses and the transition to Joshua', 'That is the main event or action described in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 34, which action or event took place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 2, 'In Deuteronomy 34, which concrete instruction or fact is mentioned?', '["Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon", "judges were appointed to help bear the burden of leadership", "Og and his cities were defeated"]'::jsonb, 'Moses saw the land from Nebo but did not enter it', 'That specific detail appears in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 34, which concrete instruction or fact is mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 2, 'In Deuteronomy 34, which additional fact is stated?', '["Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated", "the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan"]'::jsonb, 'Joshua was filled with the spirit of wisdom because Moses laid hands on him', 'That additional detail is included in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 34, which additional fact is stated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 2, 'In Deuteronomy 34, what location or setting matters to the chapter?', '["Mount Nebo", "the land of Sihon king of Heshbon", "Horeb", "Bashan"]'::jsonb, 'Mount Nebo', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Deuteronomy 34, what location or setting matters to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 3, 'What does Deuteronomy 34 say that Moses did or declared?', '["the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land"]'::jsonb, 'the death of Moses and the transition to Joshua', 'That is the main event or action described in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Deuteronomy 34 say that Moses did or declared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 3, 'Why was this emphasized in Deuteronomy 34?', '["God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand"]'::jsonb, 'God''s purpose continued even after Moses died', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why was this emphasized in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 3, 'What fact in Deuteronomy 34 helps explain the chapter''s message?', '["Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon", "judges were appointed to help bear the burden of leadership", "Og and his cities were defeated"]'::jsonb, 'Moses saw the land from Nebo but did not enter it', 'That specific detail appears in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fact in Deuteronomy 34 helps explain the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 3, 'What second fact in Deuteronomy 34 develops the chapter''s message?', '["Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated", "the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan"]'::jsonb, 'Joshua was filled with the spirit of wisdom because Moses laid hands on him', 'That additional detail is included in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 3
    AND q.prompt = 'What second fact in Deuteronomy 34 develops the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 3, 'What result in Deuteronomy 34 shows the consequence of obedience or disobedience?', '["Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan", "the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest"]'::jsonb, 'Israel mourned Moses and no prophet arose like him in Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 3
    AND q.prompt = 'What result in Deuteronomy 34 shows the consequence of obedience or disobedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 3, 'Who is especially in view in Deuteronomy 34?', '["Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon", "Israel east of the Jordan", "Reuben, Gad, and half Manasseh"]'::jsonb, 'Joshua and Israel after Moses'' death', 'That group is directly addressed or involved in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is especially in view in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 3, 'What place or setting frames the action in Deuteronomy 34?', '["Mount Nebo", "the land of Sihon king of Heshbon", "Horeb", "Bashan"]'::jsonb, 'Mount Nebo', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 3
    AND q.prompt = 'What place or setting frames the action in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 4, 'In Deuteronomy 34, what concrete act shows how the covenant was being applied?', '["Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon", "judges were appointed to help bear the burden of leadership", "Og and his cities were defeated"]'::jsonb, 'Moses saw the land from Nebo but did not enter it', 'That specific detail appears in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 34, what concrete act shows how the covenant was being applied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 4, 'In Deuteronomy 34, what further act or fact supports the chapter''s message?', '["Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated", "the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan"]'::jsonb, 'Joshua was filled with the spirit of wisdom because Moses laid hands on him', 'That additional detail is included in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 4
    AND q.prompt = 'In Deuteronomy 34, what further act or fact supports the chapter''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 4, 'What larger event in Deuteronomy 34 gives those details their meaning?', '["the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land"]'::jsonb, 'the death of Moses and the transition to Joshua', 'That is the main event or action described in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger event in Deuteronomy 34 gives those details their meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 4, 'What result in Deuteronomy 34 shaped Israel''s future action?', '["Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan", "the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest"]'::jsonb, 'Israel mourned Moses and no prophet arose like him in Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 4
    AND q.prompt = 'What result in Deuteronomy 34 shaped Israel''s future action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 4, 'Why did this matter according to Deuteronomy 34?', '["God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand"]'::jsonb, 'God''s purpose continued even after Moses died', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did this matter according to Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 4, 'Who had to respond to these things in Deuteronomy 34?', '["Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon", "Israel east of the Jordan", "Reuben, Gad, and half Manasseh"]'::jsonb, 'Joshua and Israel after Moses'' death', 'That group is directly addressed or involved in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who had to respond to these things in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 4, 'Where is the action or teaching set in Deuteronomy 34?', '["Mount Nebo", "the land of Sihon king of Heshbon", "Horeb", "Bashan"]'::jsonb, 'Mount Nebo', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 4
    AND q.prompt = 'Where is the action or teaching set in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 5, 'What truth about God or covenant life is highlighted by the events of Deuteronomy 34?', '["God''s purpose continued even after Moses died", "the LORD had given certain lands to other peoples but gave Sihon into Israel''s hand", "the people rebelled against the command of the LORD", "the LORD had already given powerful kings into Israel''s hand"]'::jsonb, 'God''s purpose continued even after Moses died', 'That is one of the reasons or lessons given in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 5
    AND q.prompt = 'What truth about God or covenant life is highlighted by the events of Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 5, 'What event in Deuteronomy 34 most clearly carries that message?', '["the death of Moses and the transition to Joshua", "the wilderness route around related nations and the defeat of Sihon", "the appointment of judges and the recounting of the rebellion at Kadesh Barnea", "the defeat of Og and the distribution of Transjordan land"]'::jsonb, 'the death of Moses and the transition to Joshua', 'That is the main event or action described in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 5
    AND q.prompt = 'What event in Deuteronomy 34 most clearly carries that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 5, 'What detail in Deuteronomy 34 makes that message concrete?', '["Moses saw the land from Nebo but did not enter it", "Israel was told not to fight Edom, Moab, or Ammon", "judges were appointed to help bear the burden of leadership", "Og and his cities were defeated"]'::jsonb, 'Moses saw the land from Nebo but did not enter it', 'That specific detail appears in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 5
    AND q.prompt = 'What detail in Deuteronomy 34 makes that message concrete?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 5, 'What additional detail in Deuteronomy 34 sharpens that message?', '["Joshua was filled with the spirit of wisdom because Moses laid hands on him", "Sihon refused passage and was defeated", "the people refused to enter the land after the spies'' report", "the eastern tribes received land east of the Jordan"]'::jsonb, 'Joshua was filled with the spirit of wisdom because Moses laid hands on him', 'That additional detail is included in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 5
    AND q.prompt = 'What additional detail in Deuteronomy 34 sharpens that message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 5, 'What outcome in Deuteronomy 34 gives the chapter lasting force?', '["Israel mourned Moses and no prophet arose like him in Israel", "Israel received Sihon''s land east of the Jordan", "the wilderness generation was sentenced to die outside the land", "Joshua was encouraged for the coming conquest"]'::jsonb, 'Israel mourned Moses and no prophet arose like him in Israel', 'That is the outcome emphasized in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 5
    AND q.prompt = 'What outcome in Deuteronomy 34 gives the chapter lasting force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 5, 'Who stands under that message in Deuteronomy 34?', '["Joshua and Israel after Moses'' death", "Israel passing by Edom, Moab, and Ammon", "Israel east of the Jordan", "Reuben, Gad, and half Manasseh"]'::jsonb, 'Joshua and Israel after Moses'' death', 'That group is directly addressed or involved in the chapter. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who stands under that message in Deuteronomy 34?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 5, 34, 5, 'What setting in Deuteronomy 34 helps anchor the message?', '["Mount Nebo", "the land of Sihon king of Heshbon", "Horeb", "Bashan"]'::jsonb, 'Mount Nebo', 'That setting is central to the chapter''s events or teaching. (Deuteronomy 34:1-12)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 5
    AND q.chapter = 34
    AND q.difficulty_stage = 5
    AND q.prompt = 'What setting in Deuteronomy 34 helps anchor the message?'
);
