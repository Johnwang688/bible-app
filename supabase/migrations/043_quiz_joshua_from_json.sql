-- ============================================================================
-- LOGOS LIGHT - Joshua (book 6) quiz questions from quiz-questions/joshua.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 1, 'According to Joshua 1, what is the main subject of the chapter?', '["Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River", "Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan"]'::jsonb, 'Joshua commissioned to lead Israel after Moses', 'This chapter centers on Joshua commissioned to lead Israel after Moses. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 1, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 1, 'According to Joshua 1, which group or people are most directly involved?', '["Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel", "the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel"]'::jsonb, 'Joshua and Israel at the Jordan', 'The chapter repeatedly focuses on Joshua and Israel at the Jordan. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 1, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 1, 'According to Joshua 1, which detail belongs in this chapter?', '["Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off", "Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal"]'::jsonb, 'Joshua was told to be strong and courageous because the LORD would be with him', 'That detail belongs in this chapter. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 1, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 1, 'According to Joshua 1, what additional detail is specifically included?', '["the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river"]'::jsonb, 'the Book of the Law was to remain in Joshua''s mouth and guide his actions', 'This second detail is part of the chapter''s material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 1, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 1, 'According to Joshua 1, what result or outcome is emphasized?', '["the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho", "the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty"]'::jsonb, 'the officers prepared the people to cross the Jordan in three days', 'That is the chapter''s stated outcome or practical effect. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 1, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 1, 'According to Joshua 1, which theme best fits the chapter?', '["leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence", "faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts"]'::jsonb, 'leadership succeeds when it is anchored in God''s presence and word', 'That theme best summarizes the chapter''s message. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 1, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 1, 'According to Joshua 1, which verse reference matches the chapter''s core material?', '["Joshua 1:1-9, 10-18", "Joshua 3:5-17", "Joshua 2:1-24", "Joshua 4:1-24"]'::jsonb, 'Joshua 1:1-9, 10-18', 'Those verses anchor the chapter''s central material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 1, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 2, 'In Joshua 1, what purpose is served by the chapter''s main command or event?', '["leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence", "faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts"]'::jsonb, 'leadership succeeds when it is anchored in God''s presence and word', 'That theme best summarizes the chapter''s message. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 1, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 2, 'In Joshua 1, which group carries the chapter''s central responsibility?', '["Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel", "the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel"]'::jsonb, 'Joshua and Israel at the Jordan', 'The chapter repeatedly focuses on Joshua and Israel at the Jordan. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 1, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 2, 'In Joshua 1, which detail shows how the chapter''s message works out?', '["Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off", "Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal"]'::jsonb, 'Joshua was told to be strong and courageous because the LORD would be with him', 'That detail belongs in this chapter. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 1, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 2, 'In Joshua 1, which second detail clarifies the instruction or event?', '["the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river"]'::jsonb, 'the Book of the Law was to remain in Joshua''s mouth and guide his actions', 'This second detail is part of the chapter''s material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 1, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 2, 'In Joshua 1, which outcome follows from the chapter''s teaching or narrative?', '["the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho", "the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty"]'::jsonb, 'the officers prepared the people to cross the Jordan in three days', 'That is the chapter''s stated outcome or practical effect. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 1, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 2, 'In Joshua 1, what larger issue is being addressed?', '["Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River", "Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan"]'::jsonb, 'Joshua commissioned to lead Israel after Moses', 'This chapter centers on Joshua commissioned to lead Israel after Moses. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 1, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 2, 'In Joshua 1, which verse reference best anchors the chapter''s key point?', '["Joshua 1:1-9, 10-18", "Joshua 3:5-17", "Joshua 2:1-24", "Joshua 4:1-24"]'::jsonb, 'Joshua 1:1-9, 10-18', 'Those verses anchor the chapter''s central material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 1, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 3, 'What does Joshua 1 show about the meaning of the chapter''s central concern?', '["leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence", "faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts"]'::jsonb, 'leadership succeeds when it is anchored in God''s presence and word', 'That theme best summarizes the chapter''s message. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 1 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 3, 'What does Joshua 1 suggest about the role of Joshua and Israel at the Jordan?', '["Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel", "the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel"]'::jsonb, 'Joshua and Israel at the Jordan', 'The chapter repeatedly focuses on Joshua and Israel at the Jordan. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 1 suggest about the role of Joshua and Israel at the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 3, 'How does Joshua 1 use this detail to shape its message: Joshua was told to be strong and courageous because the LORD would be with him?', '["Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off", "Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal"]'::jsonb, 'Joshua was told to be strong and courageous because the LORD would be with him', 'That detail belongs in this chapter. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 1 use this detail to shape its message: Joshua was told to be strong and courageous because the LORD would be with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 3, 'How does Joshua 1 deepen its message through this added detail: the Book of the Law was to remain in Joshua''s mouth and guide his actions?', '["the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river"]'::jsonb, 'the Book of the Law was to remain in Joshua''s mouth and guide his actions', 'This second detail is part of the chapter''s material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 1 deepen its message through this added detail: the Book of the Law was to remain in Joshua''s mouth and guide his actions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 3, 'What larger lesson is reinforced by the outcome in Joshua 1?', '["the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho", "the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty"]'::jsonb, 'the officers prepared the people to cross the Jordan in three days', 'That is the chapter''s stated outcome or practical effect. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 3, 'Which summary best captures the focus of Joshua 1?', '["Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River", "Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan"]'::jsonb, 'Joshua commissioned to lead Israel after Moses', 'This chapter centers on Joshua commissioned to lead Israel after Moses. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 3, 'Which verse reference most directly supports the central teaching of Joshua 1?', '["Joshua 1:1-9, 10-18", "Joshua 3:5-17", "Joshua 2:1-24", "Joshua 4:1-24"]'::jsonb, 'Joshua 1:1-9, 10-18', 'Those verses anchor the chapter''s central material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 4, 'How does Joshua 1 connect its main subject to Israel''s covenant life?', '["leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence", "faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts"]'::jsonb, 'leadership succeeds when it is anchored in God''s presence and word', 'That theme best summarizes the chapter''s message. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 1 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 4, 'How does Joshua 1 position Joshua and Israel at the Jordan within the covenant community?', '["Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel", "the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel"]'::jsonb, 'Joshua and Israel at the Jordan', 'The chapter repeatedly focuses on Joshua and Israel at the Jordan. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 1 position Joshua and Israel at the Jordan within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 4, 'Why is this detail structurally important in Joshua 1: Joshua was told to be strong and courageous because the LORD would be with him?', '["Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off", "Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal"]'::jsonb, 'Joshua was told to be strong and courageous because the LORD would be with him', 'That detail belongs in this chapter. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 1: Joshua was told to be strong and courageous because the LORD would be with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 1: the Book of the Law was to remain in Joshua''s mouth and guide his actions?', '["the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river"]'::jsonb, 'the Book of the Law was to remain in Joshua''s mouth and guide his actions', 'This second detail is part of the chapter''s material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 1: the Book of the Law was to remain in Joshua''s mouth and guide his actions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 4, 'How does the outcome of Joshua 1 guide later action in Israel?', '["the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho", "the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty"]'::jsonb, 'the officers prepared the people to cross the Jordan in three days', 'That is the chapter''s stated outcome or practical effect. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 1 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 1?', '["Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River", "Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan"]'::jsonb, 'Joshua commissioned to lead Israel after Moses', 'This chapter centers on Joshua commissioned to lead Israel after Moses. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 4, 'Which verse reference best supports a synthesis reading of Joshua 1?', '["Joshua 1:1-9, 10-18", "Joshua 3:5-17", "Joshua 2:1-24", "Joshua 4:1-24"]'::jsonb, 'Joshua 1:1-9, 10-18', 'Those verses anchor the chapter''s central material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 5, 'What theological truth is emphasized by Joshua 1?', '["leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence", "faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts"]'::jsonb, 'leadership succeeds when it is anchored in God''s presence and word', 'That theme best summarizes the chapter''s message. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 5, 'What does Joshua 1 reveal about the covenant role of Joshua and Israel at the Jordan?', '["Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel", "the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel"]'::jsonb, 'Joshua and Israel at the Jordan', 'The chapter repeatedly focuses on Joshua and Israel at the Jordan. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 1 reveal about the covenant role of Joshua and Israel at the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 5, 'Why does this detail matter theologically in Joshua 1: Joshua was told to be strong and courageous because the LORD would be with him?', '["Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off", "Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal"]'::jsonb, 'Joshua was told to be strong and courageous because the LORD would be with him', 'That detail belongs in this chapter. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 1: Joshua was told to be strong and courageous because the LORD would be with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 5, 'How does this second detail sharpen the theological meaning of Joshua 1: the Book of the Law was to remain in Joshua''s mouth and guide his actions?', '["the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river"]'::jsonb, 'the Book of the Law was to remain in Joshua''s mouth and guide his actions', 'This second detail is part of the chapter''s material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 1: the Book of the Law was to remain in Joshua''s mouth and guide his actions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 5, 'What enduring implication comes from the outcome in Joshua 1?', '["the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho", "the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty"]'::jsonb, 'the officers prepared the people to cross the Jordan in three days', 'That is the chapter''s stated outcome or practical effect. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 5, 'Which statement best expresses the theological burden of Joshua 1?', '["Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River", "Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan"]'::jsonb, 'Joshua commissioned to lead Israel after Moses', 'This chapter centers on Joshua commissioned to lead Israel after Moses. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 1, 5, 'Which verse reference best anchors the theological center of Joshua 1?', '["Joshua 1:1-9, 10-18", "Joshua 3:5-17", "Joshua 2:1-24", "Joshua 4:1-24"]'::jsonb, 'Joshua 1:1-9, 10-18', 'Those verses anchor the chapter''s central material. (Joshua 1:1-9, 10-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 1, 'According to Joshua 2, what is the main subject of the chapter?', '["Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan", "Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army"]'::jsonb, 'Rahab hiding the spies in Jericho', 'This chapter centers on Rahab hiding the spies in Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 2, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 1, 'According to Joshua 2, which group or people are most directly involved?', '["the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho"]'::jsonb, 'the two spies, Rahab, and the king of Jericho', 'The chapter repeatedly focuses on the two spies, Rahab, and the king of Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 2, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 1, 'According to Joshua 2, which detail belongs in this chapter?', '["Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised"]'::jsonb, 'Rahab hid the spies on her roof under stalks of flax', 'That detail belongs in this chapter. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 2, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 1, 'According to Joshua 2, what additional detail is specifically included?', '["a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river", "the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land"]'::jsonb, 'a scarlet cord was agreed upon as the sign for Rahab''s household to be spared', 'This second detail is part of the chapter''s material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 2, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 1, 'According to Joshua 2, what result or outcome is emphasized?', '["the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty", "Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy"]'::jsonb, 'the spies returned convinced that the LORD had given the land into Israel''s hand', 'That is the chapter''s stated outcome or practical effect. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 2, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 1, 'According to Joshua 2, which theme best fits the chapter?', '["faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts", "God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest"]'::jsonb, 'faith recognizes God''s rule even among the nations', 'That theme best summarizes the chapter''s message. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 2, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 1, 'According to Joshua 2, which verse reference matches the chapter''s core material?', '["Joshua 2:1-24", "Joshua 4:1-24", "Joshua 3:5-17", "Joshua 5:2-15"]'::jsonb, 'Joshua 2:1-24', 'Those verses anchor the chapter''s central material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 2, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 2, 'In Joshua 2, what purpose is served by the chapter''s main command or event?', '["faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts", "God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest"]'::jsonb, 'faith recognizes God''s rule even among the nations', 'That theme best summarizes the chapter''s message. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 2, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 2, 'In Joshua 2, which group carries the chapter''s central responsibility?', '["the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho"]'::jsonb, 'the two spies, Rahab, and the king of Jericho', 'The chapter repeatedly focuses on the two spies, Rahab, and the king of Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 2, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 2, 'In Joshua 2, which detail shows how the chapter''s message works out?', '["Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised"]'::jsonb, 'Rahab hid the spies on her roof under stalks of flax', 'That detail belongs in this chapter. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 2, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 2, 'In Joshua 2, which second detail clarifies the instruction or event?', '["a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river", "the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land"]'::jsonb, 'a scarlet cord was agreed upon as the sign for Rahab''s household to be spared', 'This second detail is part of the chapter''s material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 2, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 2, 'In Joshua 2, which outcome follows from the chapter''s teaching or narrative?', '["the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty", "Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy"]'::jsonb, 'the spies returned convinced that the LORD had given the land into Israel''s hand', 'That is the chapter''s stated outcome or practical effect. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 2, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 2, 'In Joshua 2, what larger issue is being addressed?', '["Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan", "Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army"]'::jsonb, 'Rahab hiding the spies in Jericho', 'This chapter centers on Rahab hiding the spies in Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 2, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 2, 'In Joshua 2, which verse reference best anchors the chapter''s key point?', '["Joshua 2:1-24", "Joshua 4:1-24", "Joshua 3:5-17", "Joshua 5:2-15"]'::jsonb, 'Joshua 2:1-24', 'Those verses anchor the chapter''s central material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 2, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 3, 'What does Joshua 2 show about the meaning of the chapter''s central concern?', '["faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts", "God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest"]'::jsonb, 'faith recognizes God''s rule even among the nations', 'That theme best summarizes the chapter''s message. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 2 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 3, 'What does Joshua 2 suggest about the role of the two spies, Rahab, and the king of Jericho?', '["the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho"]'::jsonb, 'the two spies, Rahab, and the king of Jericho', 'The chapter repeatedly focuses on the two spies, Rahab, and the king of Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 2 suggest about the role of the two spies, Rahab, and the king of Jericho?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 3, 'How does Joshua 2 use this detail to shape its message: Rahab hid the spies on her roof under stalks of flax?', '["Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised"]'::jsonb, 'Rahab hid the spies on her roof under stalks of flax', 'That detail belongs in this chapter. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 2 use this detail to shape its message: Rahab hid the spies on her roof under stalks of flax?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 3, 'How does Joshua 2 deepen its message through this added detail: a scarlet cord was agreed upon as the sign for Rahab''s household to be spared?', '["a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river", "the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land"]'::jsonb, 'a scarlet cord was agreed upon as the sign for Rahab''s household to be spared', 'This second detail is part of the chapter''s material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 2 deepen its message through this added detail: a scarlet cord was agreed upon as the sign for Rahab''s household to be spared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 3, 'What larger lesson is reinforced by the outcome in Joshua 2?', '["the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty", "Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy"]'::jsonb, 'the spies returned convinced that the LORD had given the land into Israel''s hand', 'That is the chapter''s stated outcome or practical effect. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 3, 'Which summary best captures the focus of Joshua 2?', '["Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan", "Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army"]'::jsonb, 'Rahab hiding the spies in Jericho', 'This chapter centers on Rahab hiding the spies in Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 3, 'Which verse reference most directly supports the central teaching of Joshua 2?', '["Joshua 2:1-24", "Joshua 4:1-24", "Joshua 3:5-17", "Joshua 5:2-15"]'::jsonb, 'Joshua 2:1-24', 'Those verses anchor the chapter''s central material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 4, 'How does Joshua 2 connect its main subject to Israel''s covenant life?', '["faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts", "God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest"]'::jsonb, 'faith recognizes God''s rule even among the nations', 'That theme best summarizes the chapter''s message. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 2 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 4, 'How does Joshua 2 position the two spies, Rahab, and the king of Jericho within the covenant community?', '["the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho"]'::jsonb, 'the two spies, Rahab, and the king of Jericho', 'The chapter repeatedly focuses on the two spies, Rahab, and the king of Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 2 position the two spies, Rahab, and the king of Jericho within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 4, 'Why is this detail structurally important in Joshua 2: Rahab hid the spies on her roof under stalks of flax?', '["Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised"]'::jsonb, 'Rahab hid the spies on her roof under stalks of flax', 'That detail belongs in this chapter. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 2: Rahab hid the spies on her roof under stalks of flax?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 2: a scarlet cord was agreed upon as the sign for Rahab''s household to be spared?', '["a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river", "the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land"]'::jsonb, 'a scarlet cord was agreed upon as the sign for Rahab''s household to be spared', 'This second detail is part of the chapter''s material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 2: a scarlet cord was agreed upon as the sign for Rahab''s household to be spared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 4, 'How does the outcome of Joshua 2 guide later action in Israel?', '["the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty", "Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy"]'::jsonb, 'the spies returned convinced that the LORD had given the land into Israel''s hand', 'That is the chapter''s stated outcome or practical effect. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 2 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 2?', '["Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan", "Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army"]'::jsonb, 'Rahab hiding the spies in Jericho', 'This chapter centers on Rahab hiding the spies in Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 4, 'Which verse reference best supports a synthesis reading of Joshua 2?', '["Joshua 2:1-24", "Joshua 4:1-24", "Joshua 3:5-17", "Joshua 5:2-15"]'::jsonb, 'Joshua 2:1-24', 'Those verses anchor the chapter''s central material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 5, 'What theological truth is emphasized by Joshua 2?', '["faith recognizes God''s rule even among the nations", "covenant memory preserves the meaning of mighty acts", "God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest"]'::jsonb, 'faith recognizes God''s rule even among the nations', 'That theme best summarizes the chapter''s message. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 5, 'What does Joshua 2 reveal about the covenant role of the two spies, Rahab, and the king of Jericho?', '["the two spies, Rahab, and the king of Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho"]'::jsonb, 'the two spies, Rahab, and the king of Jericho', 'The chapter repeatedly focuses on the two spies, Rahab, and the king of Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 2 reveal about the covenant role of the two spies, Rahab, and the king of Jericho?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 5, 'Why does this detail matter theologically in Joshua 2: Rahab hid the spies on her roof under stalks of flax?', '["Rahab hid the spies on her roof under stalks of flax", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised"]'::jsonb, 'Rahab hid the spies on her roof under stalks of flax', 'That detail belongs in this chapter. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 2: Rahab hid the spies on her roof under stalks of flax?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 5, 'How does this second detail sharpen the theological meaning of Joshua 2: a scarlet cord was agreed upon as the sign for Rahab''s household to be spared?', '["a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the memorial was meant to teach children what the LORD had done at the river", "the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land"]'::jsonb, 'a scarlet cord was agreed upon as the sign for Rahab''s household to be spared', 'This second detail is part of the chapter''s material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 2: a scarlet cord was agreed upon as the sign for Rahab''s household to be spared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 5, 'What enduring implication comes from the outcome in Joshua 2?', '["the spies returned convinced that the LORD had given the land into Israel''s hand", "all the peoples of the earth were to know that the LORD''s hand is mighty", "Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy"]'::jsonb, 'the spies returned convinced that the LORD had given the land into Israel''s hand', 'That is the chapter''s stated outcome or practical effect. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 5, 'Which statement best expresses the theological burden of Joshua 2?', '["Rahab hiding the spies in Jericho", "memorial stones taken from the Jordan", "Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army"]'::jsonb, 'Rahab hiding the spies in Jericho', 'This chapter centers on Rahab hiding the spies in Jericho. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 2, 5, 'Which verse reference best anchors the theological center of Joshua 2?', '["Joshua 2:1-24", "Joshua 4:1-24", "Joshua 3:5-17", "Joshua 5:2-15"]'::jsonb, 'Joshua 2:1-24', 'Those verses anchor the chapter''s central material. (Joshua 2:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 1, 'According to Joshua 3, what is the main subject of the chapter?', '["Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army", "memorial stones taken from the Jordan", "the fall of Jericho"]'::jsonb, 'Israel crossing the Jordan River', 'This chapter centers on Israel crossing the Jordan River. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 3, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 1, 'According to Joshua 3, which group or people are most directly involved?', '["Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho"]'::jsonb, 'Joshua, the priests, and all Israel', 'The chapter repeatedly focuses on Joshua, the priests, and all Israel. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 3, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 1, 'According to Joshua 3, which detail belongs in this chapter?', '["the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark"]'::jsonb, 'the priests carrying the ark stood in the Jordan while the waters were cut off', 'That detail belongs in this chapter. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 3, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 1, 'According to Joshua 3, what additional detail is specifically included?', '["the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land", "the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction"]'::jsonb, 'the people were told to sanctify themselves before the LORD worked wonders', 'This second detail is part of the chapter''s material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 3, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 1, 'According to Joshua 3, what result or outcome is emphasized?', '["Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded"]'::jsonb, 'Israel crossed on dry ground opposite Jericho', 'That is the chapter''s stated outcome or practical effect. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 3, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 1, 'According to Joshua 3, which theme best fits the chapter?', '["God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest", "covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride"]'::jsonb, 'God opens the way for His people through His holy presence', 'That theme best summarizes the chapter''s message. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 3, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 1, 'According to Joshua 3, which verse reference matches the chapter''s core material?', '["Joshua 3:5-17", "Joshua 5:2-15", "Joshua 4:1-24", "Joshua 6:1-27"]'::jsonb, 'Joshua 3:5-17', 'Those verses anchor the chapter''s central material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 3, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 2, 'In Joshua 3, what purpose is served by the chapter''s main command or event?', '["God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest", "covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride"]'::jsonb, 'God opens the way for His people through His holy presence', 'That theme best summarizes the chapter''s message. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 3, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 2, 'In Joshua 3, which group carries the chapter''s central responsibility?', '["Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho"]'::jsonb, 'Joshua, the priests, and all Israel', 'The chapter repeatedly focuses on Joshua, the priests, and all Israel. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 3, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 2, 'In Joshua 3, which detail shows how the chapter''s message works out?', '["the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark"]'::jsonb, 'the priests carrying the ark stood in the Jordan while the waters were cut off', 'That detail belongs in this chapter. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 3, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 2, 'In Joshua 3, which second detail clarifies the instruction or event?', '["the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land", "the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction"]'::jsonb, 'the people were told to sanctify themselves before the LORD worked wonders', 'This second detail is part of the chapter''s material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 3, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 2, 'In Joshua 3, which outcome follows from the chapter''s teaching or narrative?', '["Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded"]'::jsonb, 'Israel crossed on dry ground opposite Jericho', 'That is the chapter''s stated outcome or practical effect. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 3, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 2, 'In Joshua 3, what larger issue is being addressed?', '["Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army", "memorial stones taken from the Jordan", "the fall of Jericho"]'::jsonb, 'Israel crossing the Jordan River', 'This chapter centers on Israel crossing the Jordan River. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 3, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 2, 'In Joshua 3, which verse reference best anchors the chapter''s key point?', '["Joshua 3:5-17", "Joshua 5:2-15", "Joshua 4:1-24", "Joshua 6:1-27"]'::jsonb, 'Joshua 3:5-17', 'Those verses anchor the chapter''s central material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 3, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 3, 'What does Joshua 3 show about the meaning of the chapter''s central concern?', '["God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest", "covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride"]'::jsonb, 'God opens the way for His people through His holy presence', 'That theme best summarizes the chapter''s message. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 3 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 3, 'What does Joshua 3 suggest about the role of Joshua, the priests, and all Israel?', '["Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho"]'::jsonb, 'Joshua, the priests, and all Israel', 'The chapter repeatedly focuses on Joshua, the priests, and all Israel. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 3 suggest about the role of Joshua, the priests, and all Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 3, 'How does Joshua 3 use this detail to shape its message: the priests carrying the ark stood in the Jordan while the waters were cut off?', '["the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark"]'::jsonb, 'the priests carrying the ark stood in the Jordan while the waters were cut off', 'That detail belongs in this chapter. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 3 use this detail to shape its message: the priests carrying the ark stood in the Jordan while the waters were cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 3, 'How does Joshua 3 deepen its message through this added detail: the people were told to sanctify themselves before the LORD worked wonders?', '["the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land", "the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction"]'::jsonb, 'the people were told to sanctify themselves before the LORD worked wonders', 'This second detail is part of the chapter''s material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 3 deepen its message through this added detail: the people were told to sanctify themselves before the LORD worked wonders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 3, 'What larger lesson is reinforced by the outcome in Joshua 3?', '["Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded"]'::jsonb, 'Israel crossed on dry ground opposite Jericho', 'That is the chapter''s stated outcome or practical effect. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 3, 'Which summary best captures the focus of Joshua 3?', '["Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army", "memorial stones taken from the Jordan", "the fall of Jericho"]'::jsonb, 'Israel crossing the Jordan River', 'This chapter centers on Israel crossing the Jordan River. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 3, 'Which verse reference most directly supports the central teaching of Joshua 3?', '["Joshua 3:5-17", "Joshua 5:2-15", "Joshua 4:1-24", "Joshua 6:1-27"]'::jsonb, 'Joshua 3:5-17', 'Those verses anchor the chapter''s central material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 4, 'How does Joshua 3 connect its main subject to Israel''s covenant life?', '["God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest", "covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride"]'::jsonb, 'God opens the way for His people through His holy presence', 'That theme best summarizes the chapter''s message. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 3 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 4, 'How does Joshua 3 position Joshua, the priests, and all Israel within the covenant community?', '["Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho"]'::jsonb, 'Joshua, the priests, and all Israel', 'The chapter repeatedly focuses on Joshua, the priests, and all Israel. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 3 position Joshua, the priests, and all Israel within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 4, 'Why is this detail structurally important in Joshua 3: the priests carrying the ark stood in the Jordan while the waters were cut off?', '["the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark"]'::jsonb, 'the priests carrying the ark stood in the Jordan while the waters were cut off', 'That detail belongs in this chapter. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 3: the priests carrying the ark stood in the Jordan while the waters were cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 3: the people were told to sanctify themselves before the LORD worked wonders?', '["the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land", "the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction"]'::jsonb, 'the people were told to sanctify themselves before the LORD worked wonders', 'This second detail is part of the chapter''s material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 3: the people were told to sanctify themselves before the LORD worked wonders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 4, 'How does the outcome of Joshua 3 guide later action in Israel?', '["Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded"]'::jsonb, 'Israel crossed on dry ground opposite Jericho', 'That is the chapter''s stated outcome or practical effect. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 3 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 3?', '["Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army", "memorial stones taken from the Jordan", "the fall of Jericho"]'::jsonb, 'Israel crossing the Jordan River', 'This chapter centers on Israel crossing the Jordan River. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 4, 'Which verse reference best supports a synthesis reading of Joshua 3?', '["Joshua 3:5-17", "Joshua 5:2-15", "Joshua 4:1-24", "Joshua 6:1-27"]'::jsonb, 'Joshua 3:5-17', 'Those verses anchor the chapter''s central material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 5, 'What theological truth is emphasized by Joshua 3?', '["God opens the way for His people through His holy presence", "renewal and worship prepare God''s people for conquest", "covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride"]'::jsonb, 'God opens the way for His people through His holy presence', 'That theme best summarizes the chapter''s message. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 5, 'What does Joshua 3 reveal about the covenant role of Joshua, the priests, and all Israel?', '["Joshua, the priests, and all Israel", "Israel encamped at Gilgal and Joshua near Jericho", "Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho"]'::jsonb, 'Joshua, the priests, and all Israel', 'The chapter repeatedly focuses on Joshua, the priests, and all Israel. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 3 reveal about the covenant role of Joshua, the priests, and all Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 5, 'Why does this detail matter theologically in Joshua 3: the priests carrying the ark stood in the Jordan while the waters were cut off?', '["the priests carrying the ark stood in the Jordan while the waters were cut off", "the new generation was circumcised because those born in the wilderness had not been circumcised", "twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark"]'::jsonb, 'the priests carrying the ark stood in the Jordan while the waters were cut off', 'That detail belongs in this chapter. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 3: the priests carrying the ark stood in the Jordan while the waters were cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 5, 'How does this second detail sharpen the theological meaning of Joshua 3: the people were told to sanctify themselves before the LORD worked wonders?', '["the people were told to sanctify themselves before the LORD worked wonders", "the manna ceased after Israel ate the produce of the land", "the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction"]'::jsonb, 'the people were told to sanctify themselves before the LORD worked wonders', 'This second detail is part of the chapter''s material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 3: the people were told to sanctify themselves before the LORD worked wonders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 5, 'What enduring implication comes from the outcome in Joshua 3?', '["Israel crossed on dry ground opposite Jericho", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded"]'::jsonb, 'Israel crossed on dry ground opposite Jericho', 'That is the chapter''s stated outcome or practical effect. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 5, 'Which statement best expresses the theological burden of Joshua 3?', '["Israel crossing the Jordan River", "circumcision, Passover, and the commander of the LORD''s army", "memorial stones taken from the Jordan", "the fall of Jericho"]'::jsonb, 'Israel crossing the Jordan River', 'This chapter centers on Israel crossing the Jordan River. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 3, 5, 'Which verse reference best anchors the theological center of Joshua 3?', '["Joshua 3:5-17", "Joshua 5:2-15", "Joshua 4:1-24", "Joshua 6:1-27"]'::jsonb, 'Joshua 3:5-17', 'Those verses anchor the chapter''s central material. (Joshua 3:5-17)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 1, 'According to Joshua 4, what is the main subject of the chapter?', '["memorial stones taken from the Jordan", "the fall of Jericho", "circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai"]'::jsonb, 'memorial stones taken from the Jordan', 'This chapter centers on memorial stones taken from the Jordan. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 4, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 1, 'According to Joshua 4, which group or people are most directly involved?', '["Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho", "Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation"]'::jsonb, 'Joshua, the twelve men, and future generations of Israel', 'The chapter repeatedly focuses on Joshua, the twelve men, and future generations of Israel. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 4, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 1, 'According to Joshua 4, which detail belongs in this chapter?', '["twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel"]'::jsonb, 'twelve stones were carried from the Jordan to the lodging place at Gilgal', 'That detail belongs in this chapter. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 4, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 1, 'According to Joshua 4, what additional detail is specifically included?', '["the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction", "the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai"]'::jsonb, 'the memorial was meant to teach children what the LORD had done at the river', 'This second detail is part of the chapter''s material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 4, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 1, 'According to Joshua 4, what result or outcome is emphasized?', '["all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor"]'::jsonb, 'all the peoples of the earth were to know that the LORD''s hand is mighty', 'That is the chapter''s stated outcome or practical effect. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 4, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 1, 'According to Joshua 4, which theme best fits the chapter?', '["covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride", "renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble"]'::jsonb, 'covenant memory preserves the meaning of mighty acts', 'That theme best summarizes the chapter''s message. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 4, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 1, 'According to Joshua 4, which verse reference matches the chapter''s core material?', '["Joshua 4:1-24", "Joshua 6:1-27", "Joshua 5:2-15", "Joshua 7:1-26"]'::jsonb, 'Joshua 4:1-24', 'Those verses anchor the chapter''s central material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 4, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 2, 'In Joshua 4, what purpose is served by the chapter''s main command or event?', '["covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride", "renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble"]'::jsonb, 'covenant memory preserves the meaning of mighty acts', 'That theme best summarizes the chapter''s message. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 4, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 2, 'In Joshua 4, which group carries the chapter''s central responsibility?', '["Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho", "Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation"]'::jsonb, 'Joshua, the twelve men, and future generations of Israel', 'The chapter repeatedly focuses on Joshua, the twelve men, and future generations of Israel. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 4, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 2, 'In Joshua 4, which detail shows how the chapter''s message works out?', '["twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel"]'::jsonb, 'twelve stones were carried from the Jordan to the lodging place at Gilgal', 'That detail belongs in this chapter. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 4, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 2, 'In Joshua 4, which second detail clarifies the instruction or event?', '["the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction", "the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai"]'::jsonb, 'the memorial was meant to teach children what the LORD had done at the river', 'This second detail is part of the chapter''s material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 4, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 2, 'In Joshua 4, which outcome follows from the chapter''s teaching or narrative?', '["all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor"]'::jsonb, 'all the peoples of the earth were to know that the LORD''s hand is mighty', 'That is the chapter''s stated outcome or practical effect. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 4, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 2, 'In Joshua 4, what larger issue is being addressed?', '["memorial stones taken from the Jordan", "the fall of Jericho", "circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai"]'::jsonb, 'memorial stones taken from the Jordan', 'This chapter centers on memorial stones taken from the Jordan. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 4, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 2, 'In Joshua 4, which verse reference best anchors the chapter''s key point?', '["Joshua 4:1-24", "Joshua 6:1-27", "Joshua 5:2-15", "Joshua 7:1-26"]'::jsonb, 'Joshua 4:1-24', 'Those verses anchor the chapter''s central material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 4, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 3, 'What does Joshua 4 show about the meaning of the chapter''s central concern?', '["covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride", "renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble"]'::jsonb, 'covenant memory preserves the meaning of mighty acts', 'That theme best summarizes the chapter''s message. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 4 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 3, 'What does Joshua 4 suggest about the role of Joshua, the twelve men, and future generations of Israel?', '["Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho", "Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation"]'::jsonb, 'Joshua, the twelve men, and future generations of Israel', 'The chapter repeatedly focuses on Joshua, the twelve men, and future generations of Israel. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 4 suggest about the role of Joshua, the twelve men, and future generations of Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 3, 'How does Joshua 4 use this detail to shape its message: twelve stones were carried from the Jordan to the lodging place at Gilgal?', '["twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel"]'::jsonb, 'twelve stones were carried from the Jordan to the lodging place at Gilgal', 'That detail belongs in this chapter. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 4 use this detail to shape its message: twelve stones were carried from the Jordan to the lodging place at Gilgal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 3, 'How does Joshua 4 deepen its message through this added detail: the memorial was meant to teach children what the LORD had done at the river?', '["the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction", "the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai"]'::jsonb, 'the memorial was meant to teach children what the LORD had done at the river', 'This second detail is part of the chapter''s material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 4 deepen its message through this added detail: the memorial was meant to teach children what the LORD had done at the river?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 3, 'What larger lesson is reinforced by the outcome in Joshua 4?', '["all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor"]'::jsonb, 'all the peoples of the earth were to know that the LORD''s hand is mighty', 'That is the chapter''s stated outcome or practical effect. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 3, 'Which summary best captures the focus of Joshua 4?', '["memorial stones taken from the Jordan", "the fall of Jericho", "circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai"]'::jsonb, 'memorial stones taken from the Jordan', 'This chapter centers on memorial stones taken from the Jordan. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 3, 'Which verse reference most directly supports the central teaching of Joshua 4?', '["Joshua 4:1-24", "Joshua 6:1-27", "Joshua 5:2-15", "Joshua 7:1-26"]'::jsonb, 'Joshua 4:1-24', 'Those verses anchor the chapter''s central material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 4, 'How does Joshua 4 connect its main subject to Israel''s covenant life?', '["covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride", "renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble"]'::jsonb, 'covenant memory preserves the meaning of mighty acts', 'That theme best summarizes the chapter''s message. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 4 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 4, 'How does Joshua 4 position Joshua, the twelve men, and future generations of Israel within the covenant community?', '["Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho", "Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation"]'::jsonb, 'Joshua, the twelve men, and future generations of Israel', 'The chapter repeatedly focuses on Joshua, the twelve men, and future generations of Israel. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 4 position Joshua, the twelve men, and future generations of Israel within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 4, 'Why is this detail structurally important in Joshua 4: twelve stones were carried from the Jordan to the lodging place at Gilgal?', '["twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel"]'::jsonb, 'twelve stones were carried from the Jordan to the lodging place at Gilgal', 'That detail belongs in this chapter. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 4: twelve stones were carried from the Jordan to the lodging place at Gilgal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 4: the memorial was meant to teach children what the LORD had done at the river?', '["the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction", "the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai"]'::jsonb, 'the memorial was meant to teach children what the LORD had done at the river', 'This second detail is part of the chapter''s material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 4: the memorial was meant to teach children what the LORD had done at the river?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 4, 'How does the outcome of Joshua 4 guide later action in Israel?', '["all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor"]'::jsonb, 'all the peoples of the earth were to know that the LORD''s hand is mighty', 'That is the chapter''s stated outcome or practical effect. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 4 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 4?', '["memorial stones taken from the Jordan", "the fall of Jericho", "circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai"]'::jsonb, 'memorial stones taken from the Jordan', 'This chapter centers on memorial stones taken from the Jordan. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 4, 'Which verse reference best supports a synthesis reading of Joshua 4?', '["Joshua 4:1-24", "Joshua 6:1-27", "Joshua 5:2-15", "Joshua 7:1-26"]'::jsonb, 'Joshua 4:1-24', 'Those verses anchor the chapter''s central material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 5, 'What theological truth is emphasized by Joshua 4?', '["covenant memory preserves the meaning of mighty acts", "victory comes through obedient trust rather than military pride", "renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble"]'::jsonb, 'covenant memory preserves the meaning of mighty acts', 'That theme best summarizes the chapter''s message. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 5, 'What does Joshua 4 reveal about the covenant role of Joshua, the twelve men, and future generations of Israel?', '["Joshua, the twelve men, and future generations of Israel", "Joshua, the priests, Israel, and the people of Jericho", "Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation"]'::jsonb, 'Joshua, the twelve men, and future generations of Israel', 'The chapter repeatedly focuses on Joshua, the twelve men, and future generations of Israel. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 4 reveal about the covenant role of Joshua, the twelve men, and future generations of Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 5, 'Why does this detail matter theologically in Joshua 4: twelve stones were carried from the Jordan to the lodging place at Gilgal?', '["twelve stones were carried from the Jordan to the lodging place at Gilgal", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel"]'::jsonb, 'twelve stones were carried from the Jordan to the lodging place at Gilgal', 'That detail belongs in this chapter. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 4: twelve stones were carried from the Jordan to the lodging place at Gilgal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 5, 'How does this second detail sharpen the theological meaning of Joshua 4: the memorial was meant to teach children what the LORD had done at the river?', '["the memorial was meant to teach children what the LORD had done at the river", "Rahab and her household were spared when the city was devoted to destruction", "the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai"]'::jsonb, 'the memorial was meant to teach children what the LORD had done at the river', 'This second detail is part of the chapter''s material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 4: the memorial was meant to teach children what the LORD had done at the river?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 5, 'What enduring implication comes from the outcome in Joshua 4?', '["all the peoples of the earth were to know that the LORD''s hand is mighty", "the wall fell flat and Israel took the city as the LORD commanded", "Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor"]'::jsonb, 'all the peoples of the earth were to know that the LORD''s hand is mighty', 'That is the chapter''s stated outcome or practical effect. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 5, 'Which statement best expresses the theological burden of Joshua 4?', '["memorial stones taken from the Jordan", "the fall of Jericho", "circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai"]'::jsonb, 'memorial stones taken from the Jordan', 'This chapter centers on memorial stones taken from the Jordan. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 4, 5, 'Which verse reference best anchors the theological center of Joshua 4?', '["Joshua 4:1-24", "Joshua 6:1-27", "Joshua 5:2-15", "Joshua 7:1-26"]'::jsonb, 'Joshua 4:1-24', 'Those verses anchor the chapter''s central material. (Joshua 4:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 1, 'According to Joshua 5, what is the main subject of the chapter?', '["circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai", "the fall of Jericho", "the capture of Ai and covenant renewal at Ebal"]'::jsonb, 'circumcision, Passover, and the commander of the LORD''s army', 'This chapter centers on circumcision, Passover, and the commander of the LORD''s army. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 5, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 1, 'According to Joshua 5, which group or people are most directly involved?', '["Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation", "Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai"]'::jsonb, 'Israel encamped at Gilgal and Joshua near Jericho', 'The chapter repeatedly focuses on Israel encamped at Gilgal and Joshua near Jericho. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 5, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 1, 'According to Joshua 5, which detail belongs in this chapter?', '["the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken"]'::jsonb, 'the new generation was circumcised because those born in the wilderness had not been circumcised', 'That detail belongs in this chapter. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 5, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 1, 'According to Joshua 5, what additional detail is specifically included?', '["the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai", "Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel"]'::jsonb, 'the manna ceased after Israel ate the produce of the land', 'This second detail is part of the chapter''s material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 5, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 1, 'According to Joshua 5, what result or outcome is emphasized?', '["Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor", "the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed"]'::jsonb, 'Joshua was confronted by the commander of the LORD''s army and told the place was holy', 'That is the chapter''s stated outcome or practical effect. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 5, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 1, 'According to Joshua 5, which theme best fits the chapter?', '["renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble", "victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing"]'::jsonb, 'renewal and worship prepare God''s people for conquest', 'That theme best summarizes the chapter''s message. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 5, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 1, 'According to Joshua 5, which verse reference matches the chapter''s core material?', '["Joshua 5:2-15", "Joshua 7:1-26", "Joshua 6:1-27", "Joshua 8:1-35"]'::jsonb, 'Joshua 5:2-15', 'Those verses anchor the chapter''s central material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 5, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 2, 'In Joshua 5, what purpose is served by the chapter''s main command or event?', '["renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble", "victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing"]'::jsonb, 'renewal and worship prepare God''s people for conquest', 'That theme best summarizes the chapter''s message. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 5, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 2, 'In Joshua 5, which group carries the chapter''s central responsibility?', '["Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation", "Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai"]'::jsonb, 'Israel encamped at Gilgal and Joshua near Jericho', 'The chapter repeatedly focuses on Israel encamped at Gilgal and Joshua near Jericho. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 5, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 2, 'In Joshua 5, which detail shows how the chapter''s message works out?', '["the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken"]'::jsonb, 'the new generation was circumcised because those born in the wilderness had not been circumcised', 'That detail belongs in this chapter. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 5, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 2, 'In Joshua 5, which second detail clarifies the instruction or event?', '["the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai", "Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel"]'::jsonb, 'the manna ceased after Israel ate the produce of the land', 'This second detail is part of the chapter''s material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 5, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 2, 'In Joshua 5, which outcome follows from the chapter''s teaching or narrative?', '["Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor", "the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed"]'::jsonb, 'Joshua was confronted by the commander of the LORD''s army and told the place was holy', 'That is the chapter''s stated outcome or practical effect. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 5, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 2, 'In Joshua 5, what larger issue is being addressed?', '["circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai", "the fall of Jericho", "the capture of Ai and covenant renewal at Ebal"]'::jsonb, 'circumcision, Passover, and the commander of the LORD''s army', 'This chapter centers on circumcision, Passover, and the commander of the LORD''s army. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 5, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 2, 'In Joshua 5, which verse reference best anchors the chapter''s key point?', '["Joshua 5:2-15", "Joshua 7:1-26", "Joshua 6:1-27", "Joshua 8:1-35"]'::jsonb, 'Joshua 5:2-15', 'Those verses anchor the chapter''s central material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 5, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 3, 'What does Joshua 5 show about the meaning of the chapter''s central concern?', '["renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble", "victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing"]'::jsonb, 'renewal and worship prepare God''s people for conquest', 'That theme best summarizes the chapter''s message. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 5 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 3, 'What does Joshua 5 suggest about the role of Israel encamped at Gilgal and Joshua near Jericho?', '["Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation", "Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai"]'::jsonb, 'Israel encamped at Gilgal and Joshua near Jericho', 'The chapter repeatedly focuses on Israel encamped at Gilgal and Joshua near Jericho. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 5 suggest about the role of Israel encamped at Gilgal and Joshua near Jericho?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 3, 'How does Joshua 5 use this detail to shape its message: the new generation was circumcised because those born in the wilderness had not been circumcised?', '["the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken"]'::jsonb, 'the new generation was circumcised because those born in the wilderness had not been circumcised', 'That detail belongs in this chapter. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 5 use this detail to shape its message: the new generation was circumcised because those born in the wilderness had not been circumcised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 3, 'How does Joshua 5 deepen its message through this added detail: the manna ceased after Israel ate the produce of the land?', '["the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai", "Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel"]'::jsonb, 'the manna ceased after Israel ate the produce of the land', 'This second detail is part of the chapter''s material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 5 deepen its message through this added detail: the manna ceased after Israel ate the produce of the land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 3, 'What larger lesson is reinforced by the outcome in Joshua 5?', '["Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor", "the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed"]'::jsonb, 'Joshua was confronted by the commander of the LORD''s army and told the place was holy', 'That is the chapter''s stated outcome or practical effect. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 3, 'Which summary best captures the focus of Joshua 5?', '["circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai", "the fall of Jericho", "the capture of Ai and covenant renewal at Ebal"]'::jsonb, 'circumcision, Passover, and the commander of the LORD''s army', 'This chapter centers on circumcision, Passover, and the commander of the LORD''s army. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 3, 'Which verse reference most directly supports the central teaching of Joshua 5?', '["Joshua 5:2-15", "Joshua 7:1-26", "Joshua 6:1-27", "Joshua 8:1-35"]'::jsonb, 'Joshua 5:2-15', 'Those verses anchor the chapter''s central material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 4, 'How does Joshua 5 connect its main subject to Israel''s covenant life?', '["renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble", "victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing"]'::jsonb, 'renewal and worship prepare God''s people for conquest', 'That theme best summarizes the chapter''s message. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 5 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 4, 'How does Joshua 5 position Israel encamped at Gilgal and Joshua near Jericho within the covenant community?', '["Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation", "Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai"]'::jsonb, 'Israel encamped at Gilgal and Joshua near Jericho', 'The chapter repeatedly focuses on Israel encamped at Gilgal and Joshua near Jericho. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 5 position Israel encamped at Gilgal and Joshua near Jericho within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 4, 'Why is this detail structurally important in Joshua 5: the new generation was circumcised because those born in the wilderness had not been circumcised?', '["the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken"]'::jsonb, 'the new generation was circumcised because those born in the wilderness had not been circumcised', 'That detail belongs in this chapter. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 5: the new generation was circumcised because those born in the wilderness had not been circumcised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 5: the manna ceased after Israel ate the produce of the land?', '["the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai", "Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel"]'::jsonb, 'the manna ceased after Israel ate the produce of the land', 'This second detail is part of the chapter''s material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 5: the manna ceased after Israel ate the produce of the land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 4, 'How does the outcome of Joshua 5 guide later action in Israel?', '["Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor", "the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed"]'::jsonb, 'Joshua was confronted by the commander of the LORD''s army and told the place was holy', 'That is the chapter''s stated outcome or practical effect. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 5 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 5?', '["circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai", "the fall of Jericho", "the capture of Ai and covenant renewal at Ebal"]'::jsonb, 'circumcision, Passover, and the commander of the LORD''s army', 'This chapter centers on circumcision, Passover, and the commander of the LORD''s army. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 4, 'Which verse reference best supports a synthesis reading of Joshua 5?', '["Joshua 5:2-15", "Joshua 7:1-26", "Joshua 6:1-27", "Joshua 8:1-35"]'::jsonb, 'Joshua 5:2-15', 'Those verses anchor the chapter''s central material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 5, 'What theological truth is emphasized by Joshua 5?', '["renewal and worship prepare God''s people for conquest", "hidden covenant violation can bring communal trouble", "victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing"]'::jsonb, 'renewal and worship prepare God''s people for conquest', 'That theme best summarizes the chapter''s message. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 5, 'What does Joshua 5 reveal about the covenant role of Israel encamped at Gilgal and Joshua near Jericho?', '["Israel encamped at Gilgal and Joshua near Jericho", "Achan, Joshua, and the troubled nation", "Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai"]'::jsonb, 'Israel encamped at Gilgal and Joshua near Jericho', 'The chapter repeatedly focuses on Israel encamped at Gilgal and Joshua near Jericho. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 5 reveal about the covenant role of Israel encamped at Gilgal and Joshua near Jericho?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 5, 'Why does this detail matter theologically in Joshua 5: the new generation was circumcised because those born in the wilderness had not been circumcised?', '["the new generation was circumcised because those born in the wilderness had not been circumcised", "Achan took devoted things from Jericho and brought guilt on Israel", "Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken"]'::jsonb, 'the new generation was circumcised because those born in the wilderness had not been circumcised', 'That detail belongs in this chapter. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 5: the new generation was circumcised because those born in the wilderness had not been circumcised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 5, 'How does this second detail sharpen the theological meaning of Joshua 5: the manna ceased after Israel ate the produce of the land?', '["the manna ceased after Israel ate the produce of the land", "Joshua and the elders fell before the LORD after the defeat at Ai", "Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel"]'::jsonb, 'the manna ceased after Israel ate the produce of the land', 'This second detail is part of the chapter''s material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 5: the manna ceased after Israel ate the produce of the land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 5, 'What enduring implication comes from the outcome in Joshua 5?', '["Joshua was confronted by the commander of the LORD''s army and told the place was holy", "Achan and all connected to his sin were judged in the Valley of Achor", "the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed"]'::jsonb, 'Joshua was confronted by the commander of the LORD''s army and told the place was holy', 'That is the chapter''s stated outcome or practical effect. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 5, 'Which statement best expresses the theological burden of Joshua 5?', '["circumcision, Passover, and the commander of the LORD''s army", "Achan''s sin and Israel''s defeat at Ai", "the fall of Jericho", "the capture of Ai and covenant renewal at Ebal"]'::jsonb, 'circumcision, Passover, and the commander of the LORD''s army', 'This chapter centers on circumcision, Passover, and the commander of the LORD''s army. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 5, 5, 'Which verse reference best anchors the theological center of Joshua 5?', '["Joshua 5:2-15", "Joshua 7:1-26", "Joshua 6:1-27", "Joshua 8:1-35"]'::jsonb, 'Joshua 5:2-15', 'Those verses anchor the chapter''s central material. (Joshua 5:2-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 1, 'According to Joshua 6, what is the main subject of the chapter?', '["the fall of Jericho", "the capture of Ai and covenant renewal at Ebal", "Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception"]'::jsonb, 'the fall of Jericho', 'This chapter centers on the fall of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 6, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 1, 'According to Joshua 6, which group or people are most directly involved?', '["Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai", "Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders"]'::jsonb, 'Joshua, the priests, Israel, and the people of Jericho', 'The chapter repeatedly focuses on Joshua, the priests, Israel, and the people of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 6, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 1, 'According to Joshua 6, which detail belongs in this chapter?', '["Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace"]'::jsonb, 'Israel marched around the city for seven days with priests blowing trumpets before the ark', 'That detail belongs in this chapter. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 6, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 1, 'According to Joshua 6, what additional detail is specifically included?', '["Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar"]'::jsonb, 'Rahab and her household were spared when the city was devoted to destruction', 'This second detail is part of the chapter''s material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 6, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 1, 'According to Joshua 6, what result or outcome is emphasized?', '["the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed", "Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception"]'::jsonb, 'the wall fell flat and Israel took the city as the LORD commanded', 'That is the chapter''s stated outcome or practical effect. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 6, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 1, 'According to Joshua 6, which theme best fits the chapter?', '["victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing", "hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God"]'::jsonb, 'victory comes through obedient trust rather than military pride', 'That theme best summarizes the chapter''s message. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 6, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 1, 'According to Joshua 6, which verse reference matches the chapter''s core material?', '["Joshua 6:1-27", "Joshua 8:1-35", "Joshua 7:1-26", "Joshua 9:3-27"]'::jsonb, 'Joshua 6:1-27', 'Those verses anchor the chapter''s central material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 6, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 2, 'In Joshua 6, what purpose is served by the chapter''s main command or event?', '["victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing", "hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God"]'::jsonb, 'victory comes through obedient trust rather than military pride', 'That theme best summarizes the chapter''s message. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 6, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 2, 'In Joshua 6, which group carries the chapter''s central responsibility?', '["Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai", "Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders"]'::jsonb, 'Joshua, the priests, Israel, and the people of Jericho', 'The chapter repeatedly focuses on Joshua, the priests, Israel, and the people of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 6, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 2, 'In Joshua 6, which detail shows how the chapter''s message works out?', '["Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace"]'::jsonb, 'Israel marched around the city for seven days with priests blowing trumpets before the ark', 'That detail belongs in this chapter. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 6, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 2, 'In Joshua 6, which second detail clarifies the instruction or event?', '["Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar"]'::jsonb, 'Rahab and her household were spared when the city was devoted to destruction', 'This second detail is part of the chapter''s material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 6, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 2, 'In Joshua 6, which outcome follows from the chapter''s teaching or narrative?', '["the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed", "Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception"]'::jsonb, 'the wall fell flat and Israel took the city as the LORD commanded', 'That is the chapter''s stated outcome or practical effect. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 6, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 2, 'In Joshua 6, what larger issue is being addressed?', '["the fall of Jericho", "the capture of Ai and covenant renewal at Ebal", "Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception"]'::jsonb, 'the fall of Jericho', 'This chapter centers on the fall of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 6, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 2, 'In Joshua 6, which verse reference best anchors the chapter''s key point?', '["Joshua 6:1-27", "Joshua 8:1-35", "Joshua 7:1-26", "Joshua 9:3-27"]'::jsonb, 'Joshua 6:1-27', 'Those verses anchor the chapter''s central material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 6, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 3, 'What does Joshua 6 show about the meaning of the chapter''s central concern?', '["victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing", "hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God"]'::jsonb, 'victory comes through obedient trust rather than military pride', 'That theme best summarizes the chapter''s message. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 6 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 3, 'What does Joshua 6 suggest about the role of Joshua, the priests, Israel, and the people of Jericho?', '["Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai", "Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders"]'::jsonb, 'Joshua, the priests, Israel, and the people of Jericho', 'The chapter repeatedly focuses on Joshua, the priests, Israel, and the people of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 6 suggest about the role of Joshua, the priests, Israel, and the people of Jericho?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 3, 'How does Joshua 6 use this detail to shape its message: Israel marched around the city for seven days with priests blowing trumpets before the ark?', '["Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace"]'::jsonb, 'Israel marched around the city for seven days with priests blowing trumpets before the ark', 'That detail belongs in this chapter. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 6 use this detail to shape its message: Israel marched around the city for seven days with priests blowing trumpets before the ark?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 3, 'How does Joshua 6 deepen its message through this added detail: Rahab and her household were spared when the city was devoted to destruction?', '["Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar"]'::jsonb, 'Rahab and her household were spared when the city was devoted to destruction', 'This second detail is part of the chapter''s material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 6 deepen its message through this added detail: Rahab and her household were spared when the city was devoted to destruction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 3, 'What larger lesson is reinforced by the outcome in Joshua 6?', '["the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed", "Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception"]'::jsonb, 'the wall fell flat and Israel took the city as the LORD commanded', 'That is the chapter''s stated outcome or practical effect. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 3, 'Which summary best captures the focus of Joshua 6?', '["the fall of Jericho", "the capture of Ai and covenant renewal at Ebal", "Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception"]'::jsonb, 'the fall of Jericho', 'This chapter centers on the fall of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 3, 'Which verse reference most directly supports the central teaching of Joshua 6?', '["Joshua 6:1-27", "Joshua 8:1-35", "Joshua 7:1-26", "Joshua 9:3-27"]'::jsonb, 'Joshua 6:1-27', 'Those verses anchor the chapter''s central material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 4, 'How does Joshua 6 connect its main subject to Israel''s covenant life?', '["victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing", "hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God"]'::jsonb, 'victory comes through obedient trust rather than military pride', 'That theme best summarizes the chapter''s message. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 6 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 4, 'How does Joshua 6 position Joshua, the priests, Israel, and the people of Jericho within the covenant community?', '["Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai", "Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders"]'::jsonb, 'Joshua, the priests, Israel, and the people of Jericho', 'The chapter repeatedly focuses on Joshua, the priests, Israel, and the people of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 6 position Joshua, the priests, Israel, and the people of Jericho within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 4, 'Why is this detail structurally important in Joshua 6: Israel marched around the city for seven days with priests blowing trumpets before the ark?', '["Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace"]'::jsonb, 'Israel marched around the city for seven days with priests blowing trumpets before the ark', 'That detail belongs in this chapter. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 6: Israel marched around the city for seven days with priests blowing trumpets before the ark?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 6: Rahab and her household were spared when the city was devoted to destruction?', '["Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar"]'::jsonb, 'Rahab and her household were spared when the city was devoted to destruction', 'This second detail is part of the chapter''s material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 6: Rahab and her household were spared when the city was devoted to destruction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 4, 'How does the outcome of Joshua 6 guide later action in Israel?', '["the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed", "Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception"]'::jsonb, 'the wall fell flat and Israel took the city as the LORD commanded', 'That is the chapter''s stated outcome or practical effect. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 6 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 6?', '["the fall of Jericho", "the capture of Ai and covenant renewal at Ebal", "Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception"]'::jsonb, 'the fall of Jericho', 'This chapter centers on the fall of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 4, 'Which verse reference best supports a synthesis reading of Joshua 6?', '["Joshua 6:1-27", "Joshua 8:1-35", "Joshua 7:1-26", "Joshua 9:3-27"]'::jsonb, 'Joshua 6:1-27', 'Those verses anchor the chapter''s central material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 5, 'What theological truth is emphasized by Joshua 6?', '["victory comes through obedient trust rather than military pride", "restored obedience leads again to conquest and covenant hearing", "hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God"]'::jsonb, 'victory comes through obedient trust rather than military pride', 'That theme best summarizes the chapter''s message. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 5, 'What does Joshua 6 reveal about the covenant role of Joshua, the priests, Israel, and the people of Jericho?', '["Joshua, the priests, Israel, and the people of Jericho", "Joshua, Israel, and the king of Ai", "Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders"]'::jsonb, 'Joshua, the priests, Israel, and the people of Jericho', 'The chapter repeatedly focuses on Joshua, the priests, Israel, and the people of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 6 reveal about the covenant role of Joshua, the priests, Israel, and the people of Jericho?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 5, 'Why does this detail matter theologically in Joshua 6: Israel marched around the city for seven days with priests blowing trumpets before the ark?', '["Israel marched around the city for seven days with priests blowing trumpets before the ark", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace"]'::jsonb, 'Israel marched around the city for seven days with priests blowing trumpets before the ark', 'That detail belongs in this chapter. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 6: Israel marched around the city for seven days with priests blowing trumpets before the ark?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 5, 'How does this second detail sharpen the theological meaning of Joshua 6: Rahab and her household were spared when the city was devoted to destruction?', '["Rahab and her household were spared when the city was devoted to destruction", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar"]'::jsonb, 'Rahab and her household were spared when the city was devoted to destruction', 'This second detail is part of the chapter''s material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 6: Rahab and her household were spared when the city was devoted to destruction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 5, 'What enduring implication comes from the outcome in Joshua 6?', '["the wall fell flat and Israel took the city as the LORD commanded", "Ai was destroyed and the covenant words were publicly rehearsed", "Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception"]'::jsonb, 'the wall fell flat and Israel took the city as the LORD commanded', 'That is the chapter''s stated outcome or practical effect. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 5, 'Which statement best expresses the theological burden of Joshua 6?', '["the fall of Jericho", "the capture of Ai and covenant renewal at Ebal", "Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception"]'::jsonb, 'the fall of Jericho', 'This chapter centers on the fall of Jericho. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 6, 5, 'Which verse reference best anchors the theological center of Joshua 6?', '["Joshua 6:1-27", "Joshua 8:1-35", "Joshua 7:1-26", "Joshua 9:3-27"]'::jsonb, 'Joshua 6:1-27', 'Those verses anchor the chapter''s central material. (Joshua 6:1-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 1, 'According to Joshua 7, what is the main subject of the chapter?', '["Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception", "the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day"]'::jsonb, 'Achan''s sin and Israel''s defeat at Ai', 'This chapter centers on Achan''s sin and Israel''s defeat at Ai. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 7, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 1, 'According to Joshua 7, which group or people are most directly involved?', '["Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army"]'::jsonb, 'Achan, Joshua, and the troubled nation', 'The chapter repeatedly focuses on Achan, Joshua, and the troubled nation. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 7, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 1, 'According to Joshua 7, which detail belongs in this chapter?', '["Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them"]'::jsonb, 'Achan took devoted things from Jericho and brought guilt on Israel', 'That detail belongs in this chapter. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 7, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 1, 'According to Joshua 7, what additional detail is specifically included?', '["Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon"]'::jsonb, 'Joshua and the elders fell before the LORD after the defeat at Ai', 'This second detail is part of the chapter''s material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 7, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 1, 'According to Joshua 7, what result or outcome is emphasized?', '["Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception", "Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel"]'::jsonb, 'Achan and all connected to his sin were judged in the Valley of Achor', 'That is the chapter''s stated outcome or practical effect. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 7, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 1, 'According to Joshua 7, which theme best fits the chapter?', '["hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God", "restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory"]'::jsonb, 'hidden covenant violation can bring communal trouble', 'That theme best summarizes the chapter''s message. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 7, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 1, 'According to Joshua 7, which verse reference matches the chapter''s core material?', '["Joshua 7:1-26", "Joshua 9:3-27", "Joshua 8:1-35", "Joshua 10:1-43"]'::jsonb, 'Joshua 7:1-26', 'Those verses anchor the chapter''s central material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 7, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 2, 'In Joshua 7, what purpose is served by the chapter''s main command or event?', '["hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God", "restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory"]'::jsonb, 'hidden covenant violation can bring communal trouble', 'That theme best summarizes the chapter''s message. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 7, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 2, 'In Joshua 7, which group carries the chapter''s central responsibility?', '["Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army"]'::jsonb, 'Achan, Joshua, and the troubled nation', 'The chapter repeatedly focuses on Achan, Joshua, and the troubled nation. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 7, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 2, 'In Joshua 7, which detail shows how the chapter''s message works out?', '["Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them"]'::jsonb, 'Achan took devoted things from Jericho and brought guilt on Israel', 'That detail belongs in this chapter. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 7, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 2, 'In Joshua 7, which second detail clarifies the instruction or event?', '["Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon"]'::jsonb, 'Joshua and the elders fell before the LORD after the defeat at Ai', 'This second detail is part of the chapter''s material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 7, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 2, 'In Joshua 7, which outcome follows from the chapter''s teaching or narrative?', '["Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception", "Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel"]'::jsonb, 'Achan and all connected to his sin were judged in the Valley of Achor', 'That is the chapter''s stated outcome or practical effect. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 7, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 2, 'In Joshua 7, what larger issue is being addressed?', '["Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception", "the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day"]'::jsonb, 'Achan''s sin and Israel''s defeat at Ai', 'This chapter centers on Achan''s sin and Israel''s defeat at Ai. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 7, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 2, 'In Joshua 7, which verse reference best anchors the chapter''s key point?', '["Joshua 7:1-26", "Joshua 9:3-27", "Joshua 8:1-35", "Joshua 10:1-43"]'::jsonb, 'Joshua 7:1-26', 'Those verses anchor the chapter''s central material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 7, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 3, 'What does Joshua 7 show about the meaning of the chapter''s central concern?', '["hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God", "restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory"]'::jsonb, 'hidden covenant violation can bring communal trouble', 'That theme best summarizes the chapter''s message. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 7 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 3, 'What does Joshua 7 suggest about the role of Achan, Joshua, and the troubled nation?', '["Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army"]'::jsonb, 'Achan, Joshua, and the troubled nation', 'The chapter repeatedly focuses on Achan, Joshua, and the troubled nation. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 7 suggest about the role of Achan, Joshua, and the troubled nation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 3, 'How does Joshua 7 use this detail to shape its message: Achan took devoted things from Jericho and brought guilt on Israel?', '["Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them"]'::jsonb, 'Achan took devoted things from Jericho and brought guilt on Israel', 'That detail belongs in this chapter. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 7 use this detail to shape its message: Achan took devoted things from Jericho and brought guilt on Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 3, 'How does Joshua 7 deepen its message through this added detail: Joshua and the elders fell before the LORD after the defeat at Ai?', '["Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon"]'::jsonb, 'Joshua and the elders fell before the LORD after the defeat at Ai', 'This second detail is part of the chapter''s material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 7 deepen its message through this added detail: Joshua and the elders fell before the LORD after the defeat at Ai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 3, 'What larger lesson is reinforced by the outcome in Joshua 7?', '["Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception", "Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel"]'::jsonb, 'Achan and all connected to his sin were judged in the Valley of Achor', 'That is the chapter''s stated outcome or practical effect. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 3, 'Which summary best captures the focus of Joshua 7?', '["Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception", "the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day"]'::jsonb, 'Achan''s sin and Israel''s defeat at Ai', 'This chapter centers on Achan''s sin and Israel''s defeat at Ai. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 3, 'Which verse reference most directly supports the central teaching of Joshua 7?', '["Joshua 7:1-26", "Joshua 9:3-27", "Joshua 8:1-35", "Joshua 10:1-43"]'::jsonb, 'Joshua 7:1-26', 'Those verses anchor the chapter''s central material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 4, 'How does Joshua 7 connect its main subject to Israel''s covenant life?', '["hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God", "restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory"]'::jsonb, 'hidden covenant violation can bring communal trouble', 'That theme best summarizes the chapter''s message. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 7 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 4, 'How does Joshua 7 position Achan, Joshua, and the troubled nation within the covenant community?', '["Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army"]'::jsonb, 'Achan, Joshua, and the troubled nation', 'The chapter repeatedly focuses on Achan, Joshua, and the troubled nation. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 7 position Achan, Joshua, and the troubled nation within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 4, 'Why is this detail structurally important in Joshua 7: Achan took devoted things from Jericho and brought guilt on Israel?', '["Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them"]'::jsonb, 'Achan took devoted things from Jericho and brought guilt on Israel', 'That detail belongs in this chapter. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 7: Achan took devoted things from Jericho and brought guilt on Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 7: Joshua and the elders fell before the LORD after the defeat at Ai?', '["Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon"]'::jsonb, 'Joshua and the elders fell before the LORD after the defeat at Ai', 'This second detail is part of the chapter''s material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 7: Joshua and the elders fell before the LORD after the defeat at Ai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 4, 'How does the outcome of Joshua 7 guide later action in Israel?', '["Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception", "Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel"]'::jsonb, 'Achan and all connected to his sin were judged in the Valley of Achor', 'That is the chapter''s stated outcome or practical effect. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 7 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 7?', '["Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception", "the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day"]'::jsonb, 'Achan''s sin and Israel''s defeat at Ai', 'This chapter centers on Achan''s sin and Israel''s defeat at Ai. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 4, 'Which verse reference best supports a synthesis reading of Joshua 7?', '["Joshua 7:1-26", "Joshua 9:3-27", "Joshua 8:1-35", "Joshua 10:1-43"]'::jsonb, 'Joshua 7:1-26', 'Those verses anchor the chapter''s central material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 5, 'What theological truth is emphasized by Joshua 7?', '["hidden covenant violation can bring communal trouble", "rash decisions show the cost of failing to seek God", "restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory"]'::jsonb, 'hidden covenant violation can bring communal trouble', 'That theme best summarizes the chapter''s message. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 5, 'What does Joshua 7 reveal about the covenant role of Achan, Joshua, and the troubled nation?', '["Achan, Joshua, and the troubled nation", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army"]'::jsonb, 'Achan, Joshua, and the troubled nation', 'The chapter repeatedly focuses on Achan, Joshua, and the troubled nation. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 7 reveal about the covenant role of Achan, Joshua, and the troubled nation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 5, 'Why does this detail matter theologically in Joshua 7: Achan took devoted things from Jericho and brought guilt on Israel?', '["Achan took devoted things from Jericho and brought guilt on Israel", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them"]'::jsonb, 'Achan took devoted things from Jericho and brought guilt on Israel', 'That detail belongs in this chapter. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 7: Achan took devoted things from Jericho and brought guilt on Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 5, 'How does this second detail sharpen the theological meaning of Joshua 7: Joshua and the elders fell before the LORD after the defeat at Ai?', '["Joshua and the elders fell before the LORD after the defeat at Ai", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon"]'::jsonb, 'Joshua and the elders fell before the LORD after the defeat at Ai', 'This second detail is part of the chapter''s material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 7: Joshua and the elders fell before the LORD after the defeat at Ai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 5, 'What enduring implication comes from the outcome in Joshua 7?', '["Achan and all connected to his sin were judged in the Valley of Achor", "a binding covenant was kept even though it had been made through deception", "Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel"]'::jsonb, 'Achan and all connected to his sin were judged in the Valley of Achor', 'That is the chapter''s stated outcome or practical effect. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 5, 'Which statement best expresses the theological burden of Joshua 7?', '["Achan''s sin and Israel''s defeat at Ai", "the Gibeonite deception", "the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day"]'::jsonb, 'Achan''s sin and Israel''s defeat at Ai', 'This chapter centers on Achan''s sin and Israel''s defeat at Ai. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 7, 5, 'Which verse reference best anchors the theological center of Joshua 7?', '["Joshua 7:1-26", "Joshua 9:3-27", "Joshua 8:1-35", "Joshua 10:1-43"]'::jsonb, 'Joshua 7:1-26', 'Those verses anchor the chapter''s central material. (Joshua 7:1-26)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 1, 'According to Joshua 8, what is the main subject of the chapter?', '["the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day", "the Gibeonite deception", "the northern campaign and summary of conquests"]'::jsonb, 'the capture of Ai and covenant renewal at Ebal', 'This chapter centers on the capture of Ai and covenant renewal at Ebal. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 8, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 1, 'According to Joshua 8, which group or people are most directly involved?', '["Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings"]'::jsonb, 'Joshua, Israel, and the king of Ai', 'The chapter repeatedly focuses on Joshua, Israel, and the king of Ai. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 8, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 1, 'According to Joshua 8, which detail belongs in this chapter?', '["Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them"]'::jsonb, 'Joshua set an ambush behind Ai and stretched out the javelin until the city was taken', 'That detail belongs in this chapter. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 8, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 1, 'According to Joshua 8, what additional detail is specifically included?', '["Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded"]'::jsonb, 'Joshua built an altar on Mount Ebal and read the law before all Israel', 'This second detail is part of the chapter''s material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 8, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 1, 'According to Joshua 8, what result or outcome is emphasized?', '["Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel", "a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle"]'::jsonb, 'Ai was destroyed and the covenant words were publicly rehearsed', 'That is the chapter''s stated outcome or practical effect. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 8, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 1, 'According to Joshua 8, which theme best fits the chapter?', '["restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory", "rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises"]'::jsonb, 'restored obedience leads again to conquest and covenant hearing', 'That theme best summarizes the chapter''s message. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 8, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 1, 'According to Joshua 8, which verse reference matches the chapter''s core material?', '["Joshua 8:1-35", "Joshua 10:1-43", "Joshua 9:3-27", "Joshua 11:1-23"]'::jsonb, 'Joshua 8:1-35', 'Those verses anchor the chapter''s central material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 8, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 2, 'In Joshua 8, what purpose is served by the chapter''s main command or event?', '["restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory", "rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises"]'::jsonb, 'restored obedience leads again to conquest and covenant hearing', 'That theme best summarizes the chapter''s message. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 8, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 2, 'In Joshua 8, which group carries the chapter''s central responsibility?', '["Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings"]'::jsonb, 'Joshua, Israel, and the king of Ai', 'The chapter repeatedly focuses on Joshua, Israel, and the king of Ai. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 8, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 2, 'In Joshua 8, which detail shows how the chapter''s message works out?', '["Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them"]'::jsonb, 'Joshua set an ambush behind Ai and stretched out the javelin until the city was taken', 'That detail belongs in this chapter. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 8, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 2, 'In Joshua 8, which second detail clarifies the instruction or event?', '["Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded"]'::jsonb, 'Joshua built an altar on Mount Ebal and read the law before all Israel', 'This second detail is part of the chapter''s material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 8, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 2, 'In Joshua 8, which outcome follows from the chapter''s teaching or narrative?', '["Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel", "a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle"]'::jsonb, 'Ai was destroyed and the covenant words were publicly rehearsed', 'That is the chapter''s stated outcome or practical effect. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 8, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 2, 'In Joshua 8, what larger issue is being addressed?', '["the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day", "the Gibeonite deception", "the northern campaign and summary of conquests"]'::jsonb, 'the capture of Ai and covenant renewal at Ebal', 'This chapter centers on the capture of Ai and covenant renewal at Ebal. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 8, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 2, 'In Joshua 8, which verse reference best anchors the chapter''s key point?', '["Joshua 8:1-35", "Joshua 10:1-43", "Joshua 9:3-27", "Joshua 11:1-23"]'::jsonb, 'Joshua 8:1-35', 'Those verses anchor the chapter''s central material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 8, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 3, 'What does Joshua 8 show about the meaning of the chapter''s central concern?', '["restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory", "rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises"]'::jsonb, 'restored obedience leads again to conquest and covenant hearing', 'That theme best summarizes the chapter''s message. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 8 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 3, 'What does Joshua 8 suggest about the role of Joshua, Israel, and the king of Ai?', '["Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings"]'::jsonb, 'Joshua, Israel, and the king of Ai', 'The chapter repeatedly focuses on Joshua, Israel, and the king of Ai. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 8 suggest about the role of Joshua, Israel, and the king of Ai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 3, 'How does Joshua 8 use this detail to shape its message: Joshua set an ambush behind Ai and stretched out the javelin until the city was taken?', '["Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them"]'::jsonb, 'Joshua set an ambush behind Ai and stretched out the javelin until the city was taken', 'That detail belongs in this chapter. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 8 use this detail to shape its message: Joshua set an ambush behind Ai and stretched out the javelin until the city was taken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 3, 'How does Joshua 8 deepen its message through this added detail: Joshua built an altar on Mount Ebal and read the law before all Israel?', '["Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded"]'::jsonb, 'Joshua built an altar on Mount Ebal and read the law before all Israel', 'This second detail is part of the chapter''s material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 8 deepen its message through this added detail: Joshua built an altar on Mount Ebal and read the law before all Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 3, 'What larger lesson is reinforced by the outcome in Joshua 8?', '["Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel", "a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle"]'::jsonb, 'Ai was destroyed and the covenant words were publicly rehearsed', 'That is the chapter''s stated outcome or practical effect. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 3, 'Which summary best captures the focus of Joshua 8?', '["the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day", "the Gibeonite deception", "the northern campaign and summary of conquests"]'::jsonb, 'the capture of Ai and covenant renewal at Ebal', 'This chapter centers on the capture of Ai and covenant renewal at Ebal. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 3, 'Which verse reference most directly supports the central teaching of Joshua 8?', '["Joshua 8:1-35", "Joshua 10:1-43", "Joshua 9:3-27", "Joshua 11:1-23"]'::jsonb, 'Joshua 8:1-35', 'Those verses anchor the chapter''s central material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 4, 'How does Joshua 8 connect its main subject to Israel''s covenant life?', '["restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory", "rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises"]'::jsonb, 'restored obedience leads again to conquest and covenant hearing', 'That theme best summarizes the chapter''s message. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 8 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 4, 'How does Joshua 8 position Joshua, Israel, and the king of Ai within the covenant community?', '["Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings"]'::jsonb, 'Joshua, Israel, and the king of Ai', 'The chapter repeatedly focuses on Joshua, Israel, and the king of Ai. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 8 position Joshua, Israel, and the king of Ai within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 4, 'Why is this detail structurally important in Joshua 8: Joshua set an ambush behind Ai and stretched out the javelin until the city was taken?', '["Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them"]'::jsonb, 'Joshua set an ambush behind Ai and stretched out the javelin until the city was taken', 'That detail belongs in this chapter. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 8: Joshua set an ambush behind Ai and stretched out the javelin until the city was taken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 8: Joshua built an altar on Mount Ebal and read the law before all Israel?', '["Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded"]'::jsonb, 'Joshua built an altar on Mount Ebal and read the law before all Israel', 'This second detail is part of the chapter''s material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 8: Joshua built an altar on Mount Ebal and read the law before all Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 4, 'How does the outcome of Joshua 8 guide later action in Israel?', '["Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel", "a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle"]'::jsonb, 'Ai was destroyed and the covenant words were publicly rehearsed', 'That is the chapter''s stated outcome or practical effect. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 8 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 8?', '["the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day", "the Gibeonite deception", "the northern campaign and summary of conquests"]'::jsonb, 'the capture of Ai and covenant renewal at Ebal', 'This chapter centers on the capture of Ai and covenant renewal at Ebal. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 4, 'Which verse reference best supports a synthesis reading of Joshua 8?', '["Joshua 8:1-35", "Joshua 10:1-43", "Joshua 9:3-27", "Joshua 11:1-23"]'::jsonb, 'Joshua 8:1-35', 'Those verses anchor the chapter''s central material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 5, 'What theological truth is emphasized by Joshua 8?', '["restored obedience leads again to conquest and covenant hearing", "God''s sovereign intervention secures covenant victory", "rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises"]'::jsonb, 'restored obedience leads again to conquest and covenant hearing', 'That theme best summarizes the chapter''s message. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 5, 'What does Joshua 8 reveal about the covenant role of Joshua, Israel, and the king of Ai?', '["Joshua, Israel, and the king of Ai", "Joshua, the Amorite kings, and Israel''s army", "the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings"]'::jsonb, 'Joshua, Israel, and the king of Ai', 'The chapter repeatedly focuses on Joshua, Israel, and the king of Ai. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 8 reveal about the covenant role of Joshua, Israel, and the king of Ai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 5, 'Why does this detail matter theologically in Joshua 8: Joshua set an ambush behind Ai and stretched out the javelin until the city was taken?', '["Joshua set an ambush behind Ai and stretched out the javelin until the city was taken", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them"]'::jsonb, 'Joshua set an ambush behind Ai and stretched out the javelin until the city was taken', 'That detail belongs in this chapter. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 8: Joshua set an ambush behind Ai and stretched out the javelin until the city was taken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 5, 'How does this second detail sharpen the theological meaning of Joshua 8: Joshua built an altar on Mount Ebal and read the law before all Israel?', '["Joshua built an altar on Mount Ebal and read the law before all Israel", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded"]'::jsonb, 'Joshua built an altar on Mount Ebal and read the law before all Israel', 'This second detail is part of the chapter''s material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 8: Joshua built an altar on Mount Ebal and read the law before all Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 5, 'What enduring implication comes from the outcome in Joshua 8?', '["Ai was destroyed and the covenant words were publicly rehearsed", "Joshua defeated the southern kings because the LORD fought for Israel", "a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle"]'::jsonb, 'Ai was destroyed and the covenant words were publicly rehearsed', 'That is the chapter''s stated outcome or practical effect. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 5, 'Which statement best expresses the theological burden of Joshua 8?', '["the capture of Ai and covenant renewal at Ebal", "the southern campaign and the long day", "the Gibeonite deception", "the northern campaign and summary of conquests"]'::jsonb, 'the capture of Ai and covenant renewal at Ebal', 'This chapter centers on the capture of Ai and covenant renewal at Ebal. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 8, 5, 'Which verse reference best anchors the theological center of Joshua 8?', '["Joshua 8:1-35", "Joshua 10:1-43", "Joshua 9:3-27", "Joshua 11:1-23"]'::jsonb, 'Joshua 8:1-35', 'Those verses anchor the chapter''s central material. (Joshua 8:1-35)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 1, 'According to Joshua 9, what is the main subject of the chapter?', '["the Gibeonite deception", "the northern campaign and summary of conquests", "the southern campaign and the long day", "the list of defeated kings"]'::jsonb, 'the Gibeonite deception', 'This chapter centers on the Gibeonite deception. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 9, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 1, 'According to Joshua 9, which group or people are most directly involved?', '["the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings", "Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua"]'::jsonb, 'the Gibeonites, Joshua, and Israel''s leaders', 'The chapter repeatedly focuses on the Gibeonites, Joshua, and Israel''s leaders. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 9, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 1, 'According to Joshua 9, which detail belongs in this chapter?', '["the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan"]'::jsonb, 'the men of Israel did not ask counsel at the mouth of the LORD before making peace', 'That detail belongs in this chapter. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 9, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 1, 'According to Joshua 9, what additional detail is specifically included?', '["the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua"]'::jsonb, 'the Gibeonites became woodcutters and water carriers for the congregation and altar', 'This second detail is part of the chapter''s material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 9, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 1, 'According to Joshua 9, what result or outcome is emphasized?', '["a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle", "Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle"]'::jsonb, 'a binding covenant was kept even though it had been made through deception', 'That is the chapter''s stated outcome or practical effect. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 9, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 1, 'According to Joshua 9, which theme best fits the chapter?', '["rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises", "God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence"]'::jsonb, 'rash decisions show the cost of failing to seek God', 'That theme best summarizes the chapter''s message. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 9, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 1, 'According to Joshua 9, which verse reference matches the chapter''s core material?', '["Joshua 9:3-27", "Joshua 11:1-23", "Joshua 10:1-43", "Joshua 12:1-24"]'::jsonb, 'Joshua 9:3-27', 'Those verses anchor the chapter''s central material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 9, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 2, 'In Joshua 9, what purpose is served by the chapter''s main command or event?', '["rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises", "God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence"]'::jsonb, 'rash decisions show the cost of failing to seek God', 'That theme best summarizes the chapter''s message. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 9, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 2, 'In Joshua 9, which group carries the chapter''s central responsibility?', '["the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings", "Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua"]'::jsonb, 'the Gibeonites, Joshua, and Israel''s leaders', 'The chapter repeatedly focuses on the Gibeonites, Joshua, and Israel''s leaders. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 9, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 2, 'In Joshua 9, which detail shows how the chapter''s message works out?', '["the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan"]'::jsonb, 'the men of Israel did not ask counsel at the mouth of the LORD before making peace', 'That detail belongs in this chapter. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 9, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 2, 'In Joshua 9, which second detail clarifies the instruction or event?', '["the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua"]'::jsonb, 'the Gibeonites became woodcutters and water carriers for the congregation and altar', 'This second detail is part of the chapter''s material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 9, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 2, 'In Joshua 9, which outcome follows from the chapter''s teaching or narrative?', '["a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle", "Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle"]'::jsonb, 'a binding covenant was kept even though it had been made through deception', 'That is the chapter''s stated outcome or practical effect. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 9, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 2, 'In Joshua 9, what larger issue is being addressed?', '["the Gibeonite deception", "the northern campaign and summary of conquests", "the southern campaign and the long day", "the list of defeated kings"]'::jsonb, 'the Gibeonite deception', 'This chapter centers on the Gibeonite deception. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 9, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 2, 'In Joshua 9, which verse reference best anchors the chapter''s key point?', '["Joshua 9:3-27", "Joshua 11:1-23", "Joshua 10:1-43", "Joshua 12:1-24"]'::jsonb, 'Joshua 9:3-27', 'Those verses anchor the chapter''s central material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 9, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 3, 'What does Joshua 9 show about the meaning of the chapter''s central concern?', '["rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises", "God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence"]'::jsonb, 'rash decisions show the cost of failing to seek God', 'That theme best summarizes the chapter''s message. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 9 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 3, 'What does Joshua 9 suggest about the role of the Gibeonites, Joshua, and Israel''s leaders?', '["the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings", "Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua"]'::jsonb, 'the Gibeonites, Joshua, and Israel''s leaders', 'The chapter repeatedly focuses on the Gibeonites, Joshua, and Israel''s leaders. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 9 suggest about the role of the Gibeonites, Joshua, and Israel''s leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 3, 'How does Joshua 9 use this detail to shape its message: the men of Israel did not ask counsel at the mouth of the LORD before making peace?', '["the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan"]'::jsonb, 'the men of Israel did not ask counsel at the mouth of the LORD before making peace', 'That detail belongs in this chapter. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 9 use this detail to shape its message: the men of Israel did not ask counsel at the mouth of the LORD before making peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 3, 'How does Joshua 9 deepen its message through this added detail: the Gibeonites became woodcutters and water carriers for the congregation and altar?', '["the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua"]'::jsonb, 'the Gibeonites became woodcutters and water carriers for the congregation and altar', 'This second detail is part of the chapter''s material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 9 deepen its message through this added detail: the Gibeonites became woodcutters and water carriers for the congregation and altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 3, 'What larger lesson is reinforced by the outcome in Joshua 9?', '["a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle", "Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle"]'::jsonb, 'a binding covenant was kept even though it had been made through deception', 'That is the chapter''s stated outcome or practical effect. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 3, 'Which summary best captures the focus of Joshua 9?', '["the Gibeonite deception", "the northern campaign and summary of conquests", "the southern campaign and the long day", "the list of defeated kings"]'::jsonb, 'the Gibeonite deception', 'This chapter centers on the Gibeonite deception. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 3, 'Which verse reference most directly supports the central teaching of Joshua 9?', '["Joshua 9:3-27", "Joshua 11:1-23", "Joshua 10:1-43", "Joshua 12:1-24"]'::jsonb, 'Joshua 9:3-27', 'Those verses anchor the chapter''s central material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 4, 'How does Joshua 9 connect its main subject to Israel''s covenant life?', '["rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises", "God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence"]'::jsonb, 'rash decisions show the cost of failing to seek God', 'That theme best summarizes the chapter''s message. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 9 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 4, 'How does Joshua 9 position the Gibeonites, Joshua, and Israel''s leaders within the covenant community?', '["the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings", "Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua"]'::jsonb, 'the Gibeonites, Joshua, and Israel''s leaders', 'The chapter repeatedly focuses on the Gibeonites, Joshua, and Israel''s leaders. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 9 position the Gibeonites, Joshua, and Israel''s leaders within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 4, 'Why is this detail structurally important in Joshua 9: the men of Israel did not ask counsel at the mouth of the LORD before making peace?', '["the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan"]'::jsonb, 'the men of Israel did not ask counsel at the mouth of the LORD before making peace', 'That detail belongs in this chapter. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 9: the men of Israel did not ask counsel at the mouth of the LORD before making peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 9: the Gibeonites became woodcutters and water carriers for the congregation and altar?', '["the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua"]'::jsonb, 'the Gibeonites became woodcutters and water carriers for the congregation and altar', 'This second detail is part of the chapter''s material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 9: the Gibeonites became woodcutters and water carriers for the congregation and altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 4, 'How does the outcome of Joshua 9 guide later action in Israel?', '["a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle", "Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle"]'::jsonb, 'a binding covenant was kept even though it had been made through deception', 'That is the chapter''s stated outcome or practical effect. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 9 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 9?', '["the Gibeonite deception", "the northern campaign and summary of conquests", "the southern campaign and the long day", "the list of defeated kings"]'::jsonb, 'the Gibeonite deception', 'This chapter centers on the Gibeonite deception. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 4, 'Which verse reference best supports a synthesis reading of Joshua 9?', '["Joshua 9:3-27", "Joshua 11:1-23", "Joshua 10:1-43", "Joshua 12:1-24"]'::jsonb, 'Joshua 9:3-27', 'Those verses anchor the chapter''s central material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 5, 'What theological truth is emphasized by Joshua 9?', '["rash decisions show the cost of failing to seek God", "obedience and endurance complete what God promises", "God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence"]'::jsonb, 'rash decisions show the cost of failing to seek God', 'That theme best summarizes the chapter''s message. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 5, 'What does Joshua 9 reveal about the covenant role of the Gibeonites, Joshua, and Israel''s leaders?', '["the Gibeonites, Joshua, and Israel''s leaders", "Joshua against Jabin and the northern kings", "Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua"]'::jsonb, 'the Gibeonites, Joshua, and Israel''s leaders', 'The chapter repeatedly focuses on the Gibeonites, Joshua, and Israel''s leaders. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 9 reveal about the covenant role of the Gibeonites, Joshua, and Israel''s leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 5, 'Why does this detail matter theologically in Joshua 9: the men of Israel did not ask counsel at the mouth of the LORD before making peace?', '["the men of Israel did not ask counsel at the mouth of the LORD before making peace", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan"]'::jsonb, 'the men of Israel did not ask counsel at the mouth of the LORD before making peace', 'That detail belongs in this chapter. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 9: the men of Israel did not ask counsel at the mouth of the LORD before making peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 5, 'How does this second detail sharpen the theological meaning of Joshua 9: the Gibeonites became woodcutters and water carriers for the congregation and altar?', '["the Gibeonites became woodcutters and water carriers for the congregation and altar", "Joshua hamstrung the horses and burned the chariots as commanded", "Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua"]'::jsonb, 'the Gibeonites became woodcutters and water carriers for the congregation and altar', 'This second detail is part of the chapter''s material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 9: the Gibeonites became woodcutters and water carriers for the congregation and altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 5, 'What enduring implication comes from the outcome in Joshua 9?', '["a binding covenant was kept even though it had been made through deception", "Joshua took much of the land after long war and gave the people rest from battle", "Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle"]'::jsonb, 'a binding covenant was kept even though it had been made through deception', 'That is the chapter''s stated outcome or practical effect. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 5, 'Which statement best expresses the theological burden of Joshua 9?', '["the Gibeonite deception", "the northern campaign and summary of conquests", "the southern campaign and the long day", "the list of defeated kings"]'::jsonb, 'the Gibeonite deception', 'This chapter centers on the Gibeonite deception. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 9, 5, 'Which verse reference best anchors the theological center of Joshua 9?', '["Joshua 9:3-27", "Joshua 11:1-23", "Joshua 10:1-43", "Joshua 12:1-24"]'::jsonb, 'Joshua 9:3-27', 'Those verses anchor the chapter''s central material. (Joshua 9:3-27)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 1, 'According to Joshua 10, what is the main subject of the chapter?', '["the southern campaign and the long day", "the list of defeated kings", "the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances"]'::jsonb, 'the southern campaign and the long day', 'This chapter centers on the southern campaign and the long day. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 10, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 1, 'According to Joshua 10, which group or people are most directly involved?', '["Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua", "Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites"]'::jsonb, 'Joshua, the Amorite kings, and Israel''s army', 'The chapter repeatedly focuses on Joshua, the Amorite kings, and Israel''s army. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 10, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 1, 'According to Joshua 10, which detail belongs in this chapter?', '["the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old"]'::jsonb, 'the LORD threw enemy armies into confusion with hailstones as Israel pursued them', 'That detail belongs in this chapter. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 10, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 1, 'According to Joshua 10, what additional detail is specifically included?', '["Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance"]'::jsonb, 'Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon', 'This second detail is part of the chapter''s material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 10, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 1, 'According to Joshua 10, what result or outcome is emphasized?', '["Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there"]'::jsonb, 'Joshua defeated the southern kings because the LORD fought for Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 10, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 1, 'According to Joshua 10, which theme best fits the chapter?', '["God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence", "obedience and endurance complete what God promises", "partial possession still calls for faithful completion"]'::jsonb, 'God''s sovereign intervention secures covenant victory', 'That theme best summarizes the chapter''s message. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 10, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 1, 'According to Joshua 10, which verse reference matches the chapter''s core material?', '["Joshua 10:1-43", "Joshua 12:1-24", "Joshua 11:1-23", "Joshua 13:1-33"]'::jsonb, 'Joshua 10:1-43', 'Those verses anchor the chapter''s central material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 10, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 2, 'In Joshua 10, what purpose is served by the chapter''s main command or event?', '["God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence", "obedience and endurance complete what God promises", "partial possession still calls for faithful completion"]'::jsonb, 'God''s sovereign intervention secures covenant victory', 'That theme best summarizes the chapter''s message. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 10, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 2, 'In Joshua 10, which group carries the chapter''s central responsibility?', '["Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua", "Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites"]'::jsonb, 'Joshua, the Amorite kings, and Israel''s army', 'The chapter repeatedly focuses on Joshua, the Amorite kings, and Israel''s army. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 10, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 2, 'In Joshua 10, which detail shows how the chapter''s message works out?', '["the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old"]'::jsonb, 'the LORD threw enemy armies into confusion with hailstones as Israel pursued them', 'That detail belongs in this chapter. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 10, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 2, 'In Joshua 10, which second detail clarifies the instruction or event?', '["Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance"]'::jsonb, 'Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon', 'This second detail is part of the chapter''s material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 10, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 2, 'In Joshua 10, which outcome follows from the chapter''s teaching or narrative?', '["Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there"]'::jsonb, 'Joshua defeated the southern kings because the LORD fought for Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 10, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 2, 'In Joshua 10, what larger issue is being addressed?', '["the southern campaign and the long day", "the list of defeated kings", "the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances"]'::jsonb, 'the southern campaign and the long day', 'This chapter centers on the southern campaign and the long day. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 10, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 2, 'In Joshua 10, which verse reference best anchors the chapter''s key point?', '["Joshua 10:1-43", "Joshua 12:1-24", "Joshua 11:1-23", "Joshua 13:1-33"]'::jsonb, 'Joshua 10:1-43', 'Those verses anchor the chapter''s central material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 10, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 3, 'What does Joshua 10 show about the meaning of the chapter''s central concern?', '["God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence", "obedience and endurance complete what God promises", "partial possession still calls for faithful completion"]'::jsonb, 'God''s sovereign intervention secures covenant victory', 'That theme best summarizes the chapter''s message. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 10 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 3, 'What does Joshua 10 suggest about the role of Joshua, the Amorite kings, and Israel''s army?', '["Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua", "Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites"]'::jsonb, 'Joshua, the Amorite kings, and Israel''s army', 'The chapter repeatedly focuses on Joshua, the Amorite kings, and Israel''s army. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 10 suggest about the role of Joshua, the Amorite kings, and Israel''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 3, 'How does Joshua 10 use this detail to shape its message: the LORD threw enemy armies into confusion with hailstones as Israel pursued them?', '["the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old"]'::jsonb, 'the LORD threw enemy armies into confusion with hailstones as Israel pursued them', 'That detail belongs in this chapter. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 10 use this detail to shape its message: the LORD threw enemy armies into confusion with hailstones as Israel pursued them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 3, 'How does Joshua 10 deepen its message through this added detail: Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon?', '["Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance"]'::jsonb, 'Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon', 'This second detail is part of the chapter''s material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 10 deepen its message through this added detail: Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 3, 'What larger lesson is reinforced by the outcome in Joshua 10?', '["Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there"]'::jsonb, 'Joshua defeated the southern kings because the LORD fought for Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 3, 'Which summary best captures the focus of Joshua 10?', '["the southern campaign and the long day", "the list of defeated kings", "the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances"]'::jsonb, 'the southern campaign and the long day', 'This chapter centers on the southern campaign and the long day. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 3, 'Which verse reference most directly supports the central teaching of Joshua 10?', '["Joshua 10:1-43", "Joshua 12:1-24", "Joshua 11:1-23", "Joshua 13:1-33"]'::jsonb, 'Joshua 10:1-43', 'Those verses anchor the chapter''s central material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 4, 'How does Joshua 10 connect its main subject to Israel''s covenant life?', '["God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence", "obedience and endurance complete what God promises", "partial possession still calls for faithful completion"]'::jsonb, 'God''s sovereign intervention secures covenant victory', 'That theme best summarizes the chapter''s message. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 10 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 4, 'How does Joshua 10 position Joshua, the Amorite kings, and Israel''s army within the covenant community?', '["Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua", "Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites"]'::jsonb, 'Joshua, the Amorite kings, and Israel''s army', 'The chapter repeatedly focuses on Joshua, the Amorite kings, and Israel''s army. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 10 position Joshua, the Amorite kings, and Israel''s army within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 4, 'Why is this detail structurally important in Joshua 10: the LORD threw enemy armies into confusion with hailstones as Israel pursued them?', '["the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old"]'::jsonb, 'the LORD threw enemy armies into confusion with hailstones as Israel pursued them', 'That detail belongs in this chapter. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 10: the LORD threw enemy armies into confusion with hailstones as Israel pursued them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 10: Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon?', '["Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance"]'::jsonb, 'Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon', 'This second detail is part of the chapter''s material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 10: Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 4, 'How does the outcome of Joshua 10 guide later action in Israel?', '["Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there"]'::jsonb, 'Joshua defeated the southern kings because the LORD fought for Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 10 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 10?', '["the southern campaign and the long day", "the list of defeated kings", "the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances"]'::jsonb, 'the southern campaign and the long day', 'This chapter centers on the southern campaign and the long day. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 4, 'Which verse reference best supports a synthesis reading of Joshua 10?', '["Joshua 10:1-43", "Joshua 12:1-24", "Joshua 11:1-23", "Joshua 13:1-33"]'::jsonb, 'Joshua 10:1-43', 'Those verses anchor the chapter''s central material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 5, 'What theological truth is emphasized by Joshua 10?', '["God''s sovereign intervention secures covenant victory", "remembered victories strengthen covenant confidence", "obedience and endurance complete what God promises", "partial possession still calls for faithful completion"]'::jsonb, 'God''s sovereign intervention secures covenant victory', 'That theme best summarizes the chapter''s message. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 5, 'What does Joshua 10 reveal about the covenant role of Joshua, the Amorite kings, and Israel''s army?', '["Joshua, the Amorite kings, and Israel''s army", "the kings defeated by Moses and Joshua", "Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites"]'::jsonb, 'Joshua, the Amorite kings, and Israel''s army', 'The chapter repeatedly focuses on Joshua, the Amorite kings, and Israel''s army. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 10 reveal about the covenant role of Joshua, the Amorite kings, and Israel''s army?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 5, 'Why does this detail matter theologically in Joshua 10: the LORD threw enemy armies into confusion with hailstones as Israel pursued them?', '["the LORD threw enemy armies into confusion with hailstones as Israel pursued them", "the chapter recounts victories on both sides of the Jordan", "Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old"]'::jsonb, 'the LORD threw enemy armies into confusion with hailstones as Israel pursued them', 'That detail belongs in this chapter. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 10: the LORD threw enemy armies into confusion with hailstones as Israel pursued them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 5, 'How does this second detail sharpen the theological meaning of Joshua 10: Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon?', '["Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance"]'::jsonb, 'Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon', 'This second detail is part of the chapter''s material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 10: Joshua asked for the sun to stand still over Gibeon and the moon over Aijalon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 5, 'What enduring implication comes from the outcome in Joshua 10?', '["Joshua defeated the southern kings because the LORD fought for Israel", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there"]'::jsonb, 'Joshua defeated the southern kings because the LORD fought for Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 5, 'Which statement best expresses the theological burden of Joshua 10?', '["the southern campaign and the long day", "the list of defeated kings", "the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances"]'::jsonb, 'the southern campaign and the long day', 'This chapter centers on the southern campaign and the long day. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 10, 5, 'Which verse reference best anchors the theological center of Joshua 10?', '["Joshua 10:1-43", "Joshua 12:1-24", "Joshua 11:1-23", "Joshua 13:1-33"]'::jsonb, 'Joshua 10:1-43', 'Those verses anchor the chapter''s central material. (Joshua 10:1-43)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 1, 'According to Joshua 11, what is the main subject of the chapter?', '["the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances", "the list of defeated kings", "Caleb receiving Hebron"]'::jsonb, 'the northern campaign and summary of conquests', 'This chapter centers on the northern campaign and summary of conquests. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 11, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 1, 'According to Joshua 11, which group or people are most directly involved?', '["Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites", "the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment"]'::jsonb, 'Joshua against Jabin and the northern kings', 'The chapter repeatedly focuses on Joshua against Jabin and the northern kings. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 11, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 1, 'According to Joshua 11, which detail belongs in this chapter?', '["Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old", "the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies"]'::jsonb, 'Joshua was told not to fear the large northern coalition because the LORD would deliver them', 'That detail belongs in this chapter. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 11, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 1, 'According to Joshua 11, what additional detail is specifically included?', '["Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it"]'::jsonb, 'Joshua hamstrung the horses and burned the chariots as commanded', 'This second detail is part of the chapter''s material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 11, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 1, 'According to Joshua 11, what result or outcome is emphasized?', '["Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD"]'::jsonb, 'Joshua took much of the land after long war and gave the people rest from battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 11, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 1, 'According to Joshua 11, which theme best fits the chapter?', '["obedience and endurance complete what God promises", "partial possession still calls for faithful completion", "remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance"]'::jsonb, 'obedience and endurance complete what God promises', 'That theme best summarizes the chapter''s message. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 11, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 1, 'According to Joshua 11, which verse reference matches the chapter''s core material?', '["Joshua 11:1-23", "Joshua 13:1-33", "Joshua 12:1-24", "Joshua 14:6-15"]'::jsonb, 'Joshua 11:1-23', 'Those verses anchor the chapter''s central material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 11, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 2, 'In Joshua 11, what purpose is served by the chapter''s main command or event?', '["obedience and endurance complete what God promises", "partial possession still calls for faithful completion", "remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance"]'::jsonb, 'obedience and endurance complete what God promises', 'That theme best summarizes the chapter''s message. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 11, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 2, 'In Joshua 11, which group carries the chapter''s central responsibility?', '["Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites", "the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment"]'::jsonb, 'Joshua against Jabin and the northern kings', 'The chapter repeatedly focuses on Joshua against Jabin and the northern kings. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 11, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 2, 'In Joshua 11, which detail shows how the chapter''s message works out?', '["Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old", "the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies"]'::jsonb, 'Joshua was told not to fear the large northern coalition because the LORD would deliver them', 'That detail belongs in this chapter. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 11, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 2, 'In Joshua 11, which second detail clarifies the instruction or event?', '["Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it"]'::jsonb, 'Joshua hamstrung the horses and burned the chariots as commanded', 'This second detail is part of the chapter''s material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 11, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 2, 'In Joshua 11, which outcome follows from the chapter''s teaching or narrative?', '["Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD"]'::jsonb, 'Joshua took much of the land after long war and gave the people rest from battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 11, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 2, 'In Joshua 11, what larger issue is being addressed?', '["the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances", "the list of defeated kings", "Caleb receiving Hebron"]'::jsonb, 'the northern campaign and summary of conquests', 'This chapter centers on the northern campaign and summary of conquests. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 11, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 2, 'In Joshua 11, which verse reference best anchors the chapter''s key point?', '["Joshua 11:1-23", "Joshua 13:1-33", "Joshua 12:1-24", "Joshua 14:6-15"]'::jsonb, 'Joshua 11:1-23', 'Those verses anchor the chapter''s central material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 11, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 3, 'What does Joshua 11 show about the meaning of the chapter''s central concern?', '["obedience and endurance complete what God promises", "partial possession still calls for faithful completion", "remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance"]'::jsonb, 'obedience and endurance complete what God promises', 'That theme best summarizes the chapter''s message. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 11 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 3, 'What does Joshua 11 suggest about the role of Joshua against Jabin and the northern kings?', '["Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites", "the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment"]'::jsonb, 'Joshua against Jabin and the northern kings', 'The chapter repeatedly focuses on Joshua against Jabin and the northern kings. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 11 suggest about the role of Joshua against Jabin and the northern kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 3, 'How does Joshua 11 use this detail to shape its message: Joshua was told not to fear the large northern coalition because the LORD would deliver them?', '["Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old", "the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies"]'::jsonb, 'Joshua was told not to fear the large northern coalition because the LORD would deliver them', 'That detail belongs in this chapter. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 11 use this detail to shape its message: Joshua was told not to fear the large northern coalition because the LORD would deliver them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 3, 'How does Joshua 11 deepen its message through this added detail: Joshua hamstrung the horses and burned the chariots as commanded?', '["Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it"]'::jsonb, 'Joshua hamstrung the horses and burned the chariots as commanded', 'This second detail is part of the chapter''s material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 11 deepen its message through this added detail: Joshua hamstrung the horses and burned the chariots as commanded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 3, 'What larger lesson is reinforced by the outcome in Joshua 11?', '["Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD"]'::jsonb, 'Joshua took much of the land after long war and gave the people rest from battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 3, 'Which summary best captures the focus of Joshua 11?', '["the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances", "the list of defeated kings", "Caleb receiving Hebron"]'::jsonb, 'the northern campaign and summary of conquests', 'This chapter centers on the northern campaign and summary of conquests. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 3, 'Which verse reference most directly supports the central teaching of Joshua 11?', '["Joshua 11:1-23", "Joshua 13:1-33", "Joshua 12:1-24", "Joshua 14:6-15"]'::jsonb, 'Joshua 11:1-23', 'Those verses anchor the chapter''s central material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 4, 'How does Joshua 11 connect its main subject to Israel''s covenant life?', '["obedience and endurance complete what God promises", "partial possession still calls for faithful completion", "remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance"]'::jsonb, 'obedience and endurance complete what God promises', 'That theme best summarizes the chapter''s message. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 11 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 4, 'How does Joshua 11 position Joshua against Jabin and the northern kings within the covenant community?', '["Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites", "the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment"]'::jsonb, 'Joshua against Jabin and the northern kings', 'The chapter repeatedly focuses on Joshua against Jabin and the northern kings. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 11 position Joshua against Jabin and the northern kings within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 4, 'Why is this detail structurally important in Joshua 11: Joshua was told not to fear the large northern coalition because the LORD would deliver them?', '["Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old", "the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies"]'::jsonb, 'Joshua was told not to fear the large northern coalition because the LORD would deliver them', 'That detail belongs in this chapter. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 11: Joshua was told not to fear the large northern coalition because the LORD would deliver them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 11: Joshua hamstrung the horses and burned the chariots as commanded?', '["Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it"]'::jsonb, 'Joshua hamstrung the horses and burned the chariots as commanded', 'This second detail is part of the chapter''s material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 11: Joshua hamstrung the horses and burned the chariots as commanded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 4, 'How does the outcome of Joshua 11 guide later action in Israel?', '["Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD"]'::jsonb, 'Joshua took much of the land after long war and gave the people rest from battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 11 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 11?', '["the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances", "the list of defeated kings", "Caleb receiving Hebron"]'::jsonb, 'the northern campaign and summary of conquests', 'This chapter centers on the northern campaign and summary of conquests. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 4, 'Which verse reference best supports a synthesis reading of Joshua 11?', '["Joshua 11:1-23", "Joshua 13:1-33", "Joshua 12:1-24", "Joshua 14:6-15"]'::jsonb, 'Joshua 11:1-23', 'Those verses anchor the chapter''s central material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 5, 'What theological truth is emphasized by Joshua 11?', '["obedience and endurance complete what God promises", "partial possession still calls for faithful completion", "remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance"]'::jsonb, 'obedience and endurance complete what God promises', 'That theme best summarizes the chapter''s message. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 5, 'What does Joshua 11 reveal about the covenant role of Joshua against Jabin and the northern kings?', '["Joshua against Jabin and the northern kings", "Joshua, the eastern tribes, and the Levites", "the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment"]'::jsonb, 'Joshua against Jabin and the northern kings', 'The chapter repeatedly focuses on Joshua against Jabin and the northern kings. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 11 reveal about the covenant role of Joshua against Jabin and the northern kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 5, 'Why does this detail matter theologically in Joshua 11: Joshua was told not to fear the large northern coalition because the LORD would deliver them?', '["Joshua was told not to fear the large northern coalition because the LORD would deliver them", "much land still remained to be possessed even though Joshua was old", "the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies"]'::jsonb, 'Joshua was told not to fear the large northern coalition because the LORD would deliver them', 'That detail belongs in this chapter. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 11: Joshua was told not to fear the large northern coalition because the LORD would deliver them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 5, 'How does this second detail sharpen the theological meaning of Joshua 11: Joshua hamstrung the horses and burned the chariots as commanded?', '["Joshua hamstrung the horses and burned the chariots as commanded", "the Levites received no territorial inheritance because the LORD was their inheritance", "thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it"]'::jsonb, 'Joshua hamstrung the horses and burned the chariots as commanded', 'This second detail is part of the chapter''s material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 11: Joshua hamstrung the horses and burned the chariots as commanded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 5, 'What enduring implication comes from the outcome in Joshua 11?', '["Joshua took much of the land after long war and gave the people rest from battle", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD"]'::jsonb, 'Joshua took much of the land after long war and gave the people rest from battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 5, 'Which statement best expresses the theological burden of Joshua 11?', '["the northern campaign and summary of conquests", "the land remaining and eastern tribal inheritances", "the list of defeated kings", "Caleb receiving Hebron"]'::jsonb, 'the northern campaign and summary of conquests', 'This chapter centers on the northern campaign and summary of conquests. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 11, 5, 'Which verse reference best anchors the theological center of Joshua 11?', '["Joshua 11:1-23", "Joshua 13:1-33", "Joshua 12:1-24", "Joshua 14:6-15"]'::jsonb, 'Joshua 11:1-23', 'Those verses anchor the chapter''s central material. (Joshua 11:1-23)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 1, 'According to Joshua 12, what is the main subject of the chapter?', '["the list of defeated kings", "Caleb receiving Hebron", "the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories"]'::jsonb, 'the list of defeated kings', 'This chapter centers on the list of defeated kings. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 12, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 1, 'According to Joshua 12, which group or people are most directly involved?', '["the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment", "Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah"]'::jsonb, 'the kings defeated by Moses and Joshua', 'The chapter repeatedly focuses on the kings defeated by Moses and Joshua. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 12, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 1, 'According to Joshua 12, which detail belongs in this chapter?', '["the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies", "much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment"]'::jsonb, 'the chapter recounts victories on both sides of the Jordan', 'That detail belongs in this chapter. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 12, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 1, 'According to Joshua 12, what additional detail is specifically included?', '["thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her"]'::jsonb, 'thirty-one kings west of the Jordan are specifically listed as defeated by Joshua', 'This second detail is part of the chapter''s material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 12, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 1, 'According to Joshua 12, what result or outcome is emphasized?', '["the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained"]'::jsonb, 'the catalogue testifies that the LORD fulfilled His promise in battle after battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 12, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 1, 'According to Joshua 12, which theme best fits the chapter?', '["remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance", "partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility"]'::jsonb, 'remembered victories strengthen covenant confidence', 'That theme best summarizes the chapter''s message. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 12, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 1, 'According to Joshua 12, which verse reference matches the chapter''s core material?', '["Joshua 12:1-24", "Joshua 14:6-15", "Joshua 13:1-33", "Joshua 15:1-63"]'::jsonb, 'Joshua 12:1-24', 'Those verses anchor the chapter''s central material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 12, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 2, 'In Joshua 12, what purpose is served by the chapter''s main command or event?', '["remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance", "partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility"]'::jsonb, 'remembered victories strengthen covenant confidence', 'That theme best summarizes the chapter''s message. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 12, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 2, 'In Joshua 12, which group carries the chapter''s central responsibility?', '["the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment", "Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah"]'::jsonb, 'the kings defeated by Moses and Joshua', 'The chapter repeatedly focuses on the kings defeated by Moses and Joshua. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 12, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 2, 'In Joshua 12, which detail shows how the chapter''s message works out?', '["the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies", "much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment"]'::jsonb, 'the chapter recounts victories on both sides of the Jordan', 'That detail belongs in this chapter. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 12, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 2, 'In Joshua 12, which second detail clarifies the instruction or event?', '["thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her"]'::jsonb, 'thirty-one kings west of the Jordan are specifically listed as defeated by Joshua', 'This second detail is part of the chapter''s material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 12, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 2, 'In Joshua 12, which outcome follows from the chapter''s teaching or narrative?', '["the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained"]'::jsonb, 'the catalogue testifies that the LORD fulfilled His promise in battle after battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 12, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 2, 'In Joshua 12, what larger issue is being addressed?', '["the list of defeated kings", "Caleb receiving Hebron", "the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories"]'::jsonb, 'the list of defeated kings', 'This chapter centers on the list of defeated kings. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 12, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 2, 'In Joshua 12, which verse reference best anchors the chapter''s key point?', '["Joshua 12:1-24", "Joshua 14:6-15", "Joshua 13:1-33", "Joshua 15:1-63"]'::jsonb, 'Joshua 12:1-24', 'Those verses anchor the chapter''s central material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 12, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 3, 'What does Joshua 12 show about the meaning of the chapter''s central concern?', '["remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance", "partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility"]'::jsonb, 'remembered victories strengthen covenant confidence', 'That theme best summarizes the chapter''s message. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 12 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 3, 'What does Joshua 12 suggest about the role of the kings defeated by Moses and Joshua?', '["the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment", "Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah"]'::jsonb, 'the kings defeated by Moses and Joshua', 'The chapter repeatedly focuses on the kings defeated by Moses and Joshua. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 12 suggest about the role of the kings defeated by Moses and Joshua?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 3, 'How does Joshua 12 use this detail to shape its message: the chapter recounts victories on both sides of the Jordan?', '["the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies", "much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment"]'::jsonb, 'the chapter recounts victories on both sides of the Jordan', 'That detail belongs in this chapter. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 12 use this detail to shape its message: the chapter recounts victories on both sides of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 3, 'How does Joshua 12 deepen its message through this added detail: thirty-one kings west of the Jordan are specifically listed as defeated by Joshua?', '["thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her"]'::jsonb, 'thirty-one kings west of the Jordan are specifically listed as defeated by Joshua', 'This second detail is part of the chapter''s material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 12 deepen its message through this added detail: thirty-one kings west of the Jordan are specifically listed as defeated by Joshua?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 3, 'What larger lesson is reinforced by the outcome in Joshua 12?', '["the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained"]'::jsonb, 'the catalogue testifies that the LORD fulfilled His promise in battle after battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 3, 'Which summary best captures the focus of Joshua 12?', '["the list of defeated kings", "Caleb receiving Hebron", "the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories"]'::jsonb, 'the list of defeated kings', 'This chapter centers on the list of defeated kings. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 3, 'Which verse reference most directly supports the central teaching of Joshua 12?', '["Joshua 12:1-24", "Joshua 14:6-15", "Joshua 13:1-33", "Joshua 15:1-63"]'::jsonb, 'Joshua 12:1-24', 'Those verses anchor the chapter''s central material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 4, 'How does Joshua 12 connect its main subject to Israel''s covenant life?', '["remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance", "partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility"]'::jsonb, 'remembered victories strengthen covenant confidence', 'That theme best summarizes the chapter''s message. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 12 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 4, 'How does Joshua 12 position the kings defeated by Moses and Joshua within the covenant community?', '["the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment", "Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah"]'::jsonb, 'the kings defeated by Moses and Joshua', 'The chapter repeatedly focuses on the kings defeated by Moses and Joshua. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 12 position the kings defeated by Moses and Joshua within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 4, 'Why is this detail structurally important in Joshua 12: the chapter recounts victories on both sides of the Jordan?', '["the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies", "much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment"]'::jsonb, 'the chapter recounts victories on both sides of the Jordan', 'That detail belongs in this chapter. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 12: the chapter recounts victories on both sides of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 12: thirty-one kings west of the Jordan are specifically listed as defeated by Joshua?', '["thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her"]'::jsonb, 'thirty-one kings west of the Jordan are specifically listed as defeated by Joshua', 'This second detail is part of the chapter''s material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 12: thirty-one kings west of the Jordan are specifically listed as defeated by Joshua?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 4, 'How does the outcome of Joshua 12 guide later action in Israel?', '["the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained"]'::jsonb, 'the catalogue testifies that the LORD fulfilled His promise in battle after battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 12 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 12?', '["the list of defeated kings", "Caleb receiving Hebron", "the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories"]'::jsonb, 'the list of defeated kings', 'This chapter centers on the list of defeated kings. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 4, 'Which verse reference best supports a synthesis reading of Joshua 12?', '["Joshua 12:1-24", "Joshua 14:6-15", "Joshua 13:1-33", "Joshua 15:1-63"]'::jsonb, 'Joshua 12:1-24', 'Those verses anchor the chapter''s central material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 5, 'What theological truth is emphasized by Joshua 12?', '["remembered victories strengthen covenant confidence", "long faithfulness lays hold of promised inheritance", "partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility"]'::jsonb, 'remembered victories strengthen covenant confidence', 'That theme best summarizes the chapter''s message. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 5, 'What does Joshua 12 reveal about the covenant role of the kings defeated by Moses and Joshua?', '["the kings defeated by Moses and Joshua", "Caleb, Joshua, and the tribes in allotment", "Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah"]'::jsonb, 'the kings defeated by Moses and Joshua', 'The chapter repeatedly focuses on the kings defeated by Moses and Joshua. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 12 reveal about the covenant role of the kings defeated by Moses and Joshua?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 5, 'Why does this detail matter theologically in Joshua 12: the chapter recounts victories on both sides of the Jordan?', '["the chapter recounts victories on both sides of the Jordan", "Caleb testified that he wholly followed the LORD from the days of the spies", "much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment"]'::jsonb, 'the chapter recounts victories on both sides of the Jordan', 'That detail belongs in this chapter. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 12: the chapter recounts victories on both sides of the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 5, 'How does this second detail sharpen the theological meaning of Joshua 12: thirty-one kings west of the Jordan are specifically listed as defeated by Joshua?', '["thirty-one kings west of the Jordan are specifically listed as defeated by Joshua", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her"]'::jsonb, 'thirty-one kings west of the Jordan are specifically listed as defeated by Joshua', 'This second detail is part of the chapter''s material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 12: thirty-one kings west of the Jordan are specifically listed as defeated by Joshua?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 5, 'What enduring implication comes from the outcome in Joshua 12?', '["the catalogue testifies that the LORD fulfilled His promise in battle after battle", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained"]'::jsonb, 'the catalogue testifies that the LORD fulfilled His promise in battle after battle', 'That is the chapter''s stated outcome or practical effect. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 5, 'Which statement best expresses the theological burden of Joshua 12?', '["the list of defeated kings", "Caleb receiving Hebron", "the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories"]'::jsonb, 'the list of defeated kings', 'This chapter centers on the list of defeated kings. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 12, 5, 'Which verse reference best anchors the theological center of Joshua 12?', '["Joshua 12:1-24", "Joshua 14:6-15", "Joshua 13:1-33", "Joshua 15:1-63"]'::jsonb, 'Joshua 12:1-24', 'Those verses anchor the chapter''s central material. (Joshua 12:1-24)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 1, 'According to Joshua 13, what is the main subject of the chapter?', '["the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories", "Caleb receiving Hebron", "the allotment for Joseph through Ephraim"]'::jsonb, 'the land remaining and eastern tribal inheritances', 'This chapter centers on the land remaining and eastern tribal inheritances. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 13, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 1, 'According to Joshua 13, which group or people are most directly involved?', '["Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah", "Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim"]'::jsonb, 'Joshua, the eastern tribes, and the Levites', 'The chapter repeatedly focuses on Joshua, the eastern tribes, and the Levites. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 13, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 1, 'According to Joshua 13, which detail belongs in this chapter?', '["much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment", "Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions"]'::jsonb, 'much land still remained to be possessed even though Joshua was old', 'That detail belongs in this chapter. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 13, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 1, 'According to Joshua 13, what additional detail is specifically included?', '["the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor"]'::jsonb, 'the Levites received no territorial inheritance because the LORD was their inheritance', 'This second detail is part of the chapter''s material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 13, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 1, 'According to Joshua 13, what result or outcome is emphasized?', '["the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted"]'::jsonb, 'the lands east of the Jordan were described and confirmed to the tribes already settled there', 'That is the chapter''s stated outcome or practical effect. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 13, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 1, 'According to Joshua 13, which theme best fits the chapter?', '["partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility", "long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance"]'::jsonb, 'partial possession still calls for faithful completion', 'That theme best summarizes the chapter''s message. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 13, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 1, 'According to Joshua 13, which verse reference matches the chapter''s core material?', '["Joshua 13:1-33", "Joshua 15:1-63", "Joshua 14:6-15", "Joshua 16:1-10"]'::jsonb, 'Joshua 13:1-33', 'Those verses anchor the chapter''s central material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 13, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 2, 'In Joshua 13, what purpose is served by the chapter''s main command or event?', '["partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility", "long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance"]'::jsonb, 'partial possession still calls for faithful completion', 'That theme best summarizes the chapter''s message. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 13, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 2, 'In Joshua 13, which group carries the chapter''s central responsibility?', '["Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah", "Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim"]'::jsonb, 'Joshua, the eastern tribes, and the Levites', 'The chapter repeatedly focuses on Joshua, the eastern tribes, and the Levites. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 13, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 2, 'In Joshua 13, which detail shows how the chapter''s message works out?', '["much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment", "Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions"]'::jsonb, 'much land still remained to be possessed even though Joshua was old', 'That detail belongs in this chapter. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 13, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 2, 'In Joshua 13, which second detail clarifies the instruction or event?', '["the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor"]'::jsonb, 'the Levites received no territorial inheritance because the LORD was their inheritance', 'This second detail is part of the chapter''s material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 13, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 2, 'In Joshua 13, which outcome follows from the chapter''s teaching or narrative?', '["the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted"]'::jsonb, 'the lands east of the Jordan were described and confirmed to the tribes already settled there', 'That is the chapter''s stated outcome or practical effect. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 13, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 2, 'In Joshua 13, what larger issue is being addressed?', '["the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories", "Caleb receiving Hebron", "the allotment for Joseph through Ephraim"]'::jsonb, 'the land remaining and eastern tribal inheritances', 'This chapter centers on the land remaining and eastern tribal inheritances. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 13, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 2, 'In Joshua 13, which verse reference best anchors the chapter''s key point?', '["Joshua 13:1-33", "Joshua 15:1-63", "Joshua 14:6-15", "Joshua 16:1-10"]'::jsonb, 'Joshua 13:1-33', 'Those verses anchor the chapter''s central material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 13, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 3, 'What does Joshua 13 show about the meaning of the chapter''s central concern?', '["partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility", "long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance"]'::jsonb, 'partial possession still calls for faithful completion', 'That theme best summarizes the chapter''s message. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 13 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 3, 'What does Joshua 13 suggest about the role of Joshua, the eastern tribes, and the Levites?', '["Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah", "Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim"]'::jsonb, 'Joshua, the eastern tribes, and the Levites', 'The chapter repeatedly focuses on Joshua, the eastern tribes, and the Levites. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 13 suggest about the role of Joshua, the eastern tribes, and the Levites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 3, 'How does Joshua 13 use this detail to shape its message: much land still remained to be possessed even though Joshua was old?', '["much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment", "Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions"]'::jsonb, 'much land still remained to be possessed even though Joshua was old', 'That detail belongs in this chapter. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 13 use this detail to shape its message: much land still remained to be possessed even though Joshua was old?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 3, 'How does Joshua 13 deepen its message through this added detail: the Levites received no territorial inheritance because the LORD was their inheritance?', '["the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor"]'::jsonb, 'the Levites received no territorial inheritance because the LORD was their inheritance', 'This second detail is part of the chapter''s material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 13 deepen its message through this added detail: the Levites received no territorial inheritance because the LORD was their inheritance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 3, 'What larger lesson is reinforced by the outcome in Joshua 13?', '["the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted"]'::jsonb, 'the lands east of the Jordan were described and confirmed to the tribes already settled there', 'That is the chapter''s stated outcome or practical effect. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 3, 'Which summary best captures the focus of Joshua 13?', '["the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories", "Caleb receiving Hebron", "the allotment for Joseph through Ephraim"]'::jsonb, 'the land remaining and eastern tribal inheritances', 'This chapter centers on the land remaining and eastern tribal inheritances. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 3, 'Which verse reference most directly supports the central teaching of Joshua 13?', '["Joshua 13:1-33", "Joshua 15:1-63", "Joshua 14:6-15", "Joshua 16:1-10"]'::jsonb, 'Joshua 13:1-33', 'Those verses anchor the chapter''s central material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 4, 'How does Joshua 13 connect its main subject to Israel''s covenant life?', '["partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility", "long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance"]'::jsonb, 'partial possession still calls for faithful completion', 'That theme best summarizes the chapter''s message. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 13 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 4, 'How does Joshua 13 position Joshua, the eastern tribes, and the Levites within the covenant community?', '["Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah", "Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim"]'::jsonb, 'Joshua, the eastern tribes, and the Levites', 'The chapter repeatedly focuses on Joshua, the eastern tribes, and the Levites. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 13 position Joshua, the eastern tribes, and the Levites within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 4, 'Why is this detail structurally important in Joshua 13: much land still remained to be possessed even though Joshua was old?', '["much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment", "Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions"]'::jsonb, 'much land still remained to be possessed even though Joshua was old', 'That detail belongs in this chapter. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 13: much land still remained to be possessed even though Joshua was old?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 13: the Levites received no territorial inheritance because the LORD was their inheritance?', '["the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor"]'::jsonb, 'the Levites received no territorial inheritance because the LORD was their inheritance', 'This second detail is part of the chapter''s material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 13: the Levites received no territorial inheritance because the LORD was their inheritance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 4, 'How does the outcome of Joshua 13 guide later action in Israel?', '["the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted"]'::jsonb, 'the lands east of the Jordan were described and confirmed to the tribes already settled there', 'That is the chapter''s stated outcome or practical effect. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 13 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 13?', '["the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories", "Caleb receiving Hebron", "the allotment for Joseph through Ephraim"]'::jsonb, 'the land remaining and eastern tribal inheritances', 'This chapter centers on the land remaining and eastern tribal inheritances. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 4, 'Which verse reference best supports a synthesis reading of Joshua 13?', '["Joshua 13:1-33", "Joshua 15:1-63", "Joshua 14:6-15", "Joshua 16:1-10"]'::jsonb, 'Joshua 13:1-33', 'Those verses anchor the chapter''s central material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 5, 'What theological truth is emphasized by Joshua 13?', '["partial possession still calls for faithful completion", "inheritance includes both gift and ongoing responsibility", "long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance"]'::jsonb, 'partial possession still calls for faithful completion', 'That theme best summarizes the chapter''s message. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 5, 'What does Joshua 13 reveal about the covenant role of Joshua, the eastern tribes, and the Levites?', '["Joshua, the eastern tribes, and the Levites", "the tribe of Judah, Caleb, Othniel, and Achsah", "Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim"]'::jsonb, 'Joshua, the eastern tribes, and the Levites', 'The chapter repeatedly focuses on Joshua, the eastern tribes, and the Levites. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 13 reveal about the covenant role of Joshua, the eastern tribes, and the Levites?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 5, 'Why does this detail matter theologically in Joshua 13: much land still remained to be possessed even though Joshua was old?', '["much land still remained to be possessed even though Joshua was old", "the borders and cities of Judah are carefully described as part of the allotment", "Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions"]'::jsonb, 'much land still remained to be possessed even though Joshua was old', 'That detail belongs in this chapter. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 13: much land still remained to be possessed even though Joshua was old?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 5, 'How does this second detail sharpen the theological meaning of Joshua 13: the Levites received no territorial inheritance because the LORD was their inheritance?', '["the Levites received no territorial inheritance because the LORD was their inheritance", "Achsah requested springs of water in addition to the south land given to her", "at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor"]'::jsonb, 'the Levites received no territorial inheritance because the LORD was their inheritance', 'This second detail is part of the chapter''s material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 13: the Levites received no territorial inheritance because the LORD was their inheritance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 5, 'What enduring implication comes from the outcome in Joshua 13?', '["the lands east of the Jordan were described and confirmed to the tribes already settled there", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted"]'::jsonb, 'the lands east of the Jordan were described and confirmed to the tribes already settled there', 'That is the chapter''s stated outcome or practical effect. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 5, 'Which statement best expresses the theological burden of Joshua 13?', '["the land remaining and eastern tribal inheritances", "Judah''s inheritance and Caleb''s family victories", "Caleb receiving Hebron", "the allotment for Joseph through Ephraim"]'::jsonb, 'the land remaining and eastern tribal inheritances', 'This chapter centers on the land remaining and eastern tribal inheritances. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 13, 5, 'Which verse reference best anchors the theological center of Joshua 13?', '["Joshua 13:1-33", "Joshua 15:1-63", "Joshua 14:6-15", "Joshua 16:1-10"]'::jsonb, 'Joshua 13:1-33', 'Those verses anchor the chapter''s central material. (Joshua 13:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 1, 'According to Joshua 14, what is the main subject of the chapter?', '["Caleb receiving Hebron", "the allotment for Joseph through Ephraim", "Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph"]'::jsonb, 'Caleb receiving Hebron', 'This chapter centers on Caleb receiving Hebron. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 14, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 1, 'According to Joshua 14, which group or people are most directly involved?', '["Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim", "the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph"]'::jsonb, 'Caleb, Joshua, and the tribes in allotment', 'The chapter repeatedly focuses on Caleb, Joshua, and the tribes in allotment. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 14, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 1, 'According to Joshua 14, which detail belongs in this chapter?', '["Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions", "the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives"]'::jsonb, 'Caleb testified that he wholly followed the LORD from the days of the spies', 'That detail belongs in this chapter. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 14, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 1, 'According to Joshua 14, what additional detail is specifically included?', '["at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room"]'::jsonb, 'at eighty-five Caleb still asked for the hill country with the Anakim in it', 'This second detail is part of the chapter''s material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 14, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 1, 'According to Joshua 14, what result or outcome is emphasized?', '["Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots"]'::jsonb, 'Hebron became Caleb''s inheritance because he wholly followed the LORD', 'That is the chapter''s stated outcome or practical effect. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 14, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 1, 'According to Joshua 14, which theme best fits the chapter?', '["long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance", "inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance"]'::jsonb, 'long faithfulness lays hold of promised inheritance', 'That theme best summarizes the chapter''s message. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 14, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 1, 'According to Joshua 14, which verse reference matches the chapter''s core material?', '["Joshua 14:6-15", "Joshua 16:1-10", "Joshua 15:1-63", "Joshua 17:1-18"]'::jsonb, 'Joshua 14:6-15', 'Those verses anchor the chapter''s central material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 14, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 2, 'In Joshua 14, what purpose is served by the chapter''s main command or event?', '["long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance", "inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance"]'::jsonb, 'long faithfulness lays hold of promised inheritance', 'That theme best summarizes the chapter''s message. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 14, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 2, 'In Joshua 14, which group carries the chapter''s central responsibility?', '["Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim", "the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph"]'::jsonb, 'Caleb, Joshua, and the tribes in allotment', 'The chapter repeatedly focuses on Caleb, Joshua, and the tribes in allotment. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 14, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 2, 'In Joshua 14, which detail shows how the chapter''s message works out?', '["Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions", "the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives"]'::jsonb, 'Caleb testified that he wholly followed the LORD from the days of the spies', 'That detail belongs in this chapter. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 14, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 2, 'In Joshua 14, which second detail clarifies the instruction or event?', '["at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room"]'::jsonb, 'at eighty-five Caleb still asked for the hill country with the Anakim in it', 'This second detail is part of the chapter''s material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 14, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 2, 'In Joshua 14, which outcome follows from the chapter''s teaching or narrative?', '["Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots"]'::jsonb, 'Hebron became Caleb''s inheritance because he wholly followed the LORD', 'That is the chapter''s stated outcome or practical effect. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 14, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 2, 'In Joshua 14, what larger issue is being addressed?', '["Caleb receiving Hebron", "the allotment for Joseph through Ephraim", "Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph"]'::jsonb, 'Caleb receiving Hebron', 'This chapter centers on Caleb receiving Hebron. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 14, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 2, 'In Joshua 14, which verse reference best anchors the chapter''s key point?', '["Joshua 14:6-15", "Joshua 16:1-10", "Joshua 15:1-63", "Joshua 17:1-18"]'::jsonb, 'Joshua 14:6-15', 'Those verses anchor the chapter''s central material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 14, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 3, 'What does Joshua 14 show about the meaning of the chapter''s central concern?', '["long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance", "inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance"]'::jsonb, 'long faithfulness lays hold of promised inheritance', 'That theme best summarizes the chapter''s message. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 14 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 3, 'What does Joshua 14 suggest about the role of Caleb, Joshua, and the tribes in allotment?', '["Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim", "the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph"]'::jsonb, 'Caleb, Joshua, and the tribes in allotment', 'The chapter repeatedly focuses on Caleb, Joshua, and the tribes in allotment. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 14 suggest about the role of Caleb, Joshua, and the tribes in allotment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 3, 'How does Joshua 14 use this detail to shape its message: Caleb testified that he wholly followed the LORD from the days of the spies?', '["Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions", "the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives"]'::jsonb, 'Caleb testified that he wholly followed the LORD from the days of the spies', 'That detail belongs in this chapter. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 14 use this detail to shape its message: Caleb testified that he wholly followed the LORD from the days of the spies?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 3, 'How does Joshua 14 deepen its message through this added detail: at eighty-five Caleb still asked for the hill country with the Anakim in it?', '["at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room"]'::jsonb, 'at eighty-five Caleb still asked for the hill country with the Anakim in it', 'This second detail is part of the chapter''s material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 14 deepen its message through this added detail: at eighty-five Caleb still asked for the hill country with the Anakim in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 3, 'What larger lesson is reinforced by the outcome in Joshua 14?', '["Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots"]'::jsonb, 'Hebron became Caleb''s inheritance because he wholly followed the LORD', 'That is the chapter''s stated outcome or practical effect. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 3, 'Which summary best captures the focus of Joshua 14?', '["Caleb receiving Hebron", "the allotment for Joseph through Ephraim", "Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph"]'::jsonb, 'Caleb receiving Hebron', 'This chapter centers on Caleb receiving Hebron. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 3, 'Which verse reference most directly supports the central teaching of Joshua 14?', '["Joshua 14:6-15", "Joshua 16:1-10", "Joshua 15:1-63", "Joshua 17:1-18"]'::jsonb, 'Joshua 14:6-15', 'Those verses anchor the chapter''s central material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 4, 'How does Joshua 14 connect its main subject to Israel''s covenant life?', '["long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance", "inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance"]'::jsonb, 'long faithfulness lays hold of promised inheritance', 'That theme best summarizes the chapter''s message. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 14 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 4, 'How does Joshua 14 position Caleb, Joshua, and the tribes in allotment within the covenant community?', '["Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim", "the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph"]'::jsonb, 'Caleb, Joshua, and the tribes in allotment', 'The chapter repeatedly focuses on Caleb, Joshua, and the tribes in allotment. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 14 position Caleb, Joshua, and the tribes in allotment within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 4, 'Why is this detail structurally important in Joshua 14: Caleb testified that he wholly followed the LORD from the days of the spies?', '["Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions", "the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives"]'::jsonb, 'Caleb testified that he wholly followed the LORD from the days of the spies', 'That detail belongs in this chapter. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 14: Caleb testified that he wholly followed the LORD from the days of the spies?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 14: at eighty-five Caleb still asked for the hill country with the Anakim in it?', '["at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room"]'::jsonb, 'at eighty-five Caleb still asked for the hill country with the Anakim in it', 'This second detail is part of the chapter''s material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 14: at eighty-five Caleb still asked for the hill country with the Anakim in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 4, 'How does the outcome of Joshua 14 guide later action in Israel?', '["Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots"]'::jsonb, 'Hebron became Caleb''s inheritance because he wholly followed the LORD', 'That is the chapter''s stated outcome or practical effect. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 14 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 14?', '["Caleb receiving Hebron", "the allotment for Joseph through Ephraim", "Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph"]'::jsonb, 'Caleb receiving Hebron', 'This chapter centers on Caleb receiving Hebron. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 4, 'Which verse reference best supports a synthesis reading of Joshua 14?', '["Joshua 14:6-15", "Joshua 16:1-10", "Joshua 15:1-63", "Joshua 17:1-18"]'::jsonb, 'Joshua 14:6-15', 'Those verses anchor the chapter''s central material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 5, 'What theological truth is emphasized by Joshua 14?', '["long faithfulness lays hold of promised inheritance", "compromise can linger inside a granted inheritance", "inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance"]'::jsonb, 'long faithfulness lays hold of promised inheritance', 'That theme best summarizes the chapter''s message. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 5, 'What does Joshua 14 reveal about the covenant role of Caleb, Joshua, and the tribes in allotment?', '["Caleb, Joshua, and the tribes in allotment", "the children of Joseph and the tribe of Ephraim", "the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph"]'::jsonb, 'Caleb, Joshua, and the tribes in allotment', 'The chapter repeatedly focuses on Caleb, Joshua, and the tribes in allotment. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 14 reveal about the covenant role of Caleb, Joshua, and the tribes in allotment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 5, 'Why does this detail matter theologically in Joshua 14: Caleb testified that he wholly followed the LORD from the days of the spies?', '["Caleb testified that he wholly followed the LORD from the days of the spies", "the lot for Joseph was traced by borders through central hill country regions", "the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives"]'::jsonb, 'Caleb testified that he wholly followed the LORD from the days of the spies', 'That detail belongs in this chapter. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 14: Caleb testified that he wholly followed the LORD from the days of the spies?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 5, 'How does this second detail sharpen the theological meaning of Joshua 14: at eighty-five Caleb still asked for the hill country with the Anakim in it?', '["at eighty-five Caleb still asked for the hill country with the Anakim in it", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room"]'::jsonb, 'at eighty-five Caleb still asked for the hill country with the Anakim in it', 'This second detail is part of the chapter''s material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 14: at eighty-five Caleb still asked for the hill country with the Anakim in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 5, 'What enduring implication comes from the outcome in Joshua 14?', '["Hebron became Caleb''s inheritance because he wholly followed the LORD", "Ephraim received its allotted territory with incomplete conquest noted", "Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots"]'::jsonb, 'Hebron became Caleb''s inheritance because he wholly followed the LORD', 'That is the chapter''s stated outcome or practical effect. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 5, 'Which statement best expresses the theological burden of Joshua 14?', '["Caleb receiving Hebron", "the allotment for Joseph through Ephraim", "Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph"]'::jsonb, 'Caleb receiving Hebron', 'This chapter centers on Caleb receiving Hebron. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 14, 5, 'Which verse reference best anchors the theological center of Joshua 14?', '["Joshua 14:6-15", "Joshua 16:1-10", "Joshua 15:1-63", "Joshua 17:1-18"]'::jsonb, 'Joshua 14:6-15', 'Those verses anchor the chapter''s central material. (Joshua 14:6-15)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 1, 'According to Joshua 15, what is the main subject of the chapter?', '["Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph", "the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land"]'::jsonb, 'Judah''s inheritance and Caleb''s family victories', 'This chapter centers on Judah''s inheritance and Caleb''s family victories. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 15, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 1, 'According to Joshua 15, which group or people are most directly involved?', '["the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph", "the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men"]'::jsonb, 'the tribe of Judah, Caleb, Othniel, and Achsah', 'The chapter repeatedly focuses on the tribe of Judah, Caleb, Othniel, and Achsah. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 15, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 1, 'According to Joshua 15, which detail belongs in this chapter?', '["the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives", "the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned"]'::jsonb, 'the borders and cities of Judah are carefully described as part of the allotment', 'That detail belongs in this chapter. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 15, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 1, 'According to Joshua 15, what additional detail is specifically included?', '["Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD"]'::jsonb, 'Achsah requested springs of water in addition to the south land given to her', 'This second detail is part of the chapter''s material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 15, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 1, 'According to Joshua 15, what result or outcome is emphasized?', '["Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots", "Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots"]'::jsonb, 'Judah received a large inheritance though some inhabitants such as the Jebusites remained', 'That is the chapter''s stated outcome or practical effect. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 15, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 1, 'According to Joshua 15, which theme best fits the chapter?', '["inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance", "compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise"]'::jsonb, 'inheritance includes both gift and ongoing responsibility', 'That theme best summarizes the chapter''s message. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 15, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 1, 'According to Joshua 15, which verse reference matches the chapter''s core material?', '["Joshua 15:1-63", "Joshua 17:1-18", "Joshua 16:1-10", "Joshua 18:1-28"]'::jsonb, 'Joshua 15:1-63', 'Those verses anchor the chapter''s central material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 15, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 2, 'In Joshua 15, what purpose is served by the chapter''s main command or event?', '["inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance", "compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise"]'::jsonb, 'inheritance includes both gift and ongoing responsibility', 'That theme best summarizes the chapter''s message. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 15, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 2, 'In Joshua 15, which group carries the chapter''s central responsibility?', '["the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph", "the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men"]'::jsonb, 'the tribe of Judah, Caleb, Othniel, and Achsah', 'The chapter repeatedly focuses on the tribe of Judah, Caleb, Othniel, and Achsah. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 15, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 2, 'In Joshua 15, which detail shows how the chapter''s message works out?', '["the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives", "the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned"]'::jsonb, 'the borders and cities of Judah are carefully described as part of the allotment', 'That detail belongs in this chapter. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 15, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 2, 'In Joshua 15, which second detail clarifies the instruction or event?', '["Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD"]'::jsonb, 'Achsah requested springs of water in addition to the south land given to her', 'This second detail is part of the chapter''s material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 15, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 2, 'In Joshua 15, which outcome follows from the chapter''s teaching or narrative?', '["Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots", "Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots"]'::jsonb, 'Judah received a large inheritance though some inhabitants such as the Jebusites remained', 'That is the chapter''s stated outcome or practical effect. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 15, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 2, 'In Joshua 15, what larger issue is being addressed?', '["Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph", "the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land"]'::jsonb, 'Judah''s inheritance and Caleb''s family victories', 'This chapter centers on Judah''s inheritance and Caleb''s family victories. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 15, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 2, 'In Joshua 15, which verse reference best anchors the chapter''s key point?', '["Joshua 15:1-63", "Joshua 17:1-18", "Joshua 16:1-10", "Joshua 18:1-28"]'::jsonb, 'Joshua 15:1-63', 'Those verses anchor the chapter''s central material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 15, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 3, 'What does Joshua 15 show about the meaning of the chapter''s central concern?', '["inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance", "compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise"]'::jsonb, 'inheritance includes both gift and ongoing responsibility', 'That theme best summarizes the chapter''s message. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 15 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 3, 'What does Joshua 15 suggest about the role of the tribe of Judah, Caleb, Othniel, and Achsah?', '["the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph", "the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men"]'::jsonb, 'the tribe of Judah, Caleb, Othniel, and Achsah', 'The chapter repeatedly focuses on the tribe of Judah, Caleb, Othniel, and Achsah. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 15 suggest about the role of the tribe of Judah, Caleb, Othniel, and Achsah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 3, 'How does Joshua 15 use this detail to shape its message: the borders and cities of Judah are carefully described as part of the allotment?', '["the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives", "the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned"]'::jsonb, 'the borders and cities of Judah are carefully described as part of the allotment', 'That detail belongs in this chapter. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 15 use this detail to shape its message: the borders and cities of Judah are carefully described as part of the allotment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 3, 'How does Joshua 15 deepen its message through this added detail: Achsah requested springs of water in addition to the south land given to her?', '["Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD"]'::jsonb, 'Achsah requested springs of water in addition to the south land given to her', 'This second detail is part of the chapter''s material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 15 deepen its message through this added detail: Achsah requested springs of water in addition to the south land given to her?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 3, 'What larger lesson is reinforced by the outcome in Joshua 15?', '["Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots", "Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots"]'::jsonb, 'Judah received a large inheritance though some inhabitants such as the Jebusites remained', 'That is the chapter''s stated outcome or practical effect. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 3, 'Which summary best captures the focus of Joshua 15?', '["Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph", "the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land"]'::jsonb, 'Judah''s inheritance and Caleb''s family victories', 'This chapter centers on Judah''s inheritance and Caleb''s family victories. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 3, 'Which verse reference most directly supports the central teaching of Joshua 15?', '["Joshua 15:1-63", "Joshua 17:1-18", "Joshua 16:1-10", "Joshua 18:1-28"]'::jsonb, 'Joshua 15:1-63', 'Those verses anchor the chapter''s central material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 4, 'How does Joshua 15 connect its main subject to Israel''s covenant life?', '["inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance", "compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise"]'::jsonb, 'inheritance includes both gift and ongoing responsibility', 'That theme best summarizes the chapter''s message. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 15 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 4, 'How does Joshua 15 position the tribe of Judah, Caleb, Othniel, and Achsah within the covenant community?', '["the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph", "the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men"]'::jsonb, 'the tribe of Judah, Caleb, Othniel, and Achsah', 'The chapter repeatedly focuses on the tribe of Judah, Caleb, Othniel, and Achsah. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 15 position the tribe of Judah, Caleb, Othniel, and Achsah within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 4, 'Why is this detail structurally important in Joshua 15: the borders and cities of Judah are carefully described as part of the allotment?', '["the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives", "the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned"]'::jsonb, 'the borders and cities of Judah are carefully described as part of the allotment', 'That detail belongs in this chapter. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 15: the borders and cities of Judah are carefully described as part of the allotment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 15: Achsah requested springs of water in addition to the south land given to her?', '["Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD"]'::jsonb, 'Achsah requested springs of water in addition to the south land given to her', 'This second detail is part of the chapter''s material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 15: Achsah requested springs of water in addition to the south land given to her?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 4, 'How does the outcome of Joshua 15 guide later action in Israel?', '["Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots", "Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots"]'::jsonb, 'Judah received a large inheritance though some inhabitants such as the Jebusites remained', 'That is the chapter''s stated outcome or practical effect. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 15 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 15?', '["Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph", "the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land"]'::jsonb, 'Judah''s inheritance and Caleb''s family victories', 'This chapter centers on Judah''s inheritance and Caleb''s family victories. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 4, 'Which verse reference best supports a synthesis reading of Joshua 15?', '["Joshua 15:1-63", "Joshua 17:1-18", "Joshua 16:1-10", "Joshua 18:1-28"]'::jsonb, 'Joshua 15:1-63', 'Those verses anchor the chapter''s central material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 5, 'What theological truth is emphasized by Joshua 15?', '["inheritance includes both gift and ongoing responsibility", "God''s people must exercise faith within their inheritance", "compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise"]'::jsonb, 'inheritance includes both gift and ongoing responsibility', 'That theme best summarizes the chapter''s message. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 5, 'What does Joshua 15 reveal about the covenant role of the tribe of Judah, Caleb, Othniel, and Achsah?', '["the tribe of Judah, Caleb, Othniel, and Achsah", "half Manasseh west of the Jordan and the children of Joseph", "the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men"]'::jsonb, 'the tribe of Judah, Caleb, Othniel, and Achsah', 'The chapter repeatedly focuses on the tribe of Judah, Caleb, Othniel, and Achsah. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 15 reveal about the covenant role of the tribe of Judah, Caleb, Othniel, and Achsah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 5, 'Why does this detail matter theologically in Joshua 15: the borders and cities of Judah are carefully described as part of the allotment?', '["the borders and cities of Judah are carefully described as part of the allotment", "the daughters of Zelophehad received inheritance among their father''s relatives", "the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned"]'::jsonb, 'the borders and cities of Judah are carefully described as part of the allotment', 'That detail belongs in this chapter. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 15: the borders and cities of Judah are carefully described as part of the allotment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 5, 'How does this second detail sharpen the theological meaning of Joshua 15: Achsah requested springs of water in addition to the south land given to her?', '["Achsah requested springs of water in addition to the south land given to her", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD"]'::jsonb, 'Achsah requested springs of water in addition to the south land given to her', 'This second detail is part of the chapter''s material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 15: Achsah requested springs of water in addition to the south land given to her?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 5, 'What enduring implication comes from the outcome in Joshua 15?', '["Judah received a large inheritance though some inhabitants such as the Jebusites remained", "Joseph was challenged to act courageously despite Canaanite iron chariots", "Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots"]'::jsonb, 'Judah received a large inheritance though some inhabitants such as the Jebusites remained', 'That is the chapter''s stated outcome or practical effect. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 5, 'Which statement best expresses the theological burden of Joshua 15?', '["Judah''s inheritance and Caleb''s family victories", "Manasseh''s inheritance and the complaint of Joseph", "the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land"]'::jsonb, 'Judah''s inheritance and Caleb''s family victories', 'This chapter centers on Judah''s inheritance and Caleb''s family victories. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 15, 5, 'Which verse reference best anchors the theological center of Joshua 15?', '["Joshua 15:1-63", "Joshua 17:1-18", "Joshua 16:1-10", "Joshua 18:1-28"]'::jsonb, 'Joshua 15:1-63', 'Those verses anchor the chapter''s central material. (Joshua 15:1-63)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 1, 'According to Joshua 16, what is the main subject of the chapter?', '["the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land", "Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance"]'::jsonb, 'the allotment for Joseph through Ephraim', 'This chapter centers on the allotment for Joseph through Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 16, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 1, 'According to Joshua 16, which group or people are most directly involved?', '["the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men", "half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself"]'::jsonb, 'the children of Joseph and the tribe of Ephraim', 'The chapter repeatedly focuses on the children of Joseph and the tribe of Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 16, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 1, 'According to Joshua 16, which detail belongs in this chapter?', '["the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot"]'::jsonb, 'the lot for Joseph was traced by borders through central hill country regions', 'That detail belongs in this chapter. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 16, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 1, 'According to Joshua 16, what additional detail is specifically included?', '["the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed"]'::jsonb, 'the Canaanites in Gezer were not fully driven out but were made subject to forced labor', 'This second detail is part of the chapter''s material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 16, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 1, 'According to Joshua 16, what result or outcome is emphasized?', '["Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots", "Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion"]'::jsonb, 'Ephraim received its allotted territory with incomplete conquest noted', 'That is the chapter''s stated outcome or practical effect. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 16, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 1, 'According to Joshua 16, which theme best fits the chapter?', '["compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise", "God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance"]'::jsonb, 'compromise can linger inside a granted inheritance', 'That theme best summarizes the chapter''s message. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 16, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 1, 'According to Joshua 16, which verse reference matches the chapter''s core material?', '["Joshua 16:1-10", "Joshua 18:1-28", "Joshua 17:1-18", "Joshua 19:1-51"]'::jsonb, 'Joshua 16:1-10', 'Those verses anchor the chapter''s central material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 16, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 2, 'In Joshua 16, what purpose is served by the chapter''s main command or event?', '["compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise", "God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance"]'::jsonb, 'compromise can linger inside a granted inheritance', 'That theme best summarizes the chapter''s message. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 16, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 2, 'In Joshua 16, which group carries the chapter''s central responsibility?', '["the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men", "half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself"]'::jsonb, 'the children of Joseph and the tribe of Ephraim', 'The chapter repeatedly focuses on the children of Joseph and the tribe of Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 16, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 2, 'In Joshua 16, which detail shows how the chapter''s message works out?', '["the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot"]'::jsonb, 'the lot for Joseph was traced by borders through central hill country regions', 'That detail belongs in this chapter. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 16, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 2, 'In Joshua 16, which second detail clarifies the instruction or event?', '["the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed"]'::jsonb, 'the Canaanites in Gezer were not fully driven out but were made subject to forced labor', 'This second detail is part of the chapter''s material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 16, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 2, 'In Joshua 16, which outcome follows from the chapter''s teaching or narrative?', '["Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots", "Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion"]'::jsonb, 'Ephraim received its allotted territory with incomplete conquest noted', 'That is the chapter''s stated outcome or practical effect. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 16, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 2, 'In Joshua 16, what larger issue is being addressed?', '["the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land", "Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance"]'::jsonb, 'the allotment for Joseph through Ephraim', 'This chapter centers on the allotment for Joseph through Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 16, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 2, 'In Joshua 16, which verse reference best anchors the chapter''s key point?', '["Joshua 16:1-10", "Joshua 18:1-28", "Joshua 17:1-18", "Joshua 19:1-51"]'::jsonb, 'Joshua 16:1-10', 'Those verses anchor the chapter''s central material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 16, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 3, 'What does Joshua 16 show about the meaning of the chapter''s central concern?', '["compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise", "God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance"]'::jsonb, 'compromise can linger inside a granted inheritance', 'That theme best summarizes the chapter''s message. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 16 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 3, 'What does Joshua 16 suggest about the role of the children of Joseph and the tribe of Ephraim?', '["the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men", "half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself"]'::jsonb, 'the children of Joseph and the tribe of Ephraim', 'The chapter repeatedly focuses on the children of Joseph and the tribe of Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 16 suggest about the role of the children of Joseph and the tribe of Ephraim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 3, 'How does Joshua 16 use this detail to shape its message: the lot for Joseph was traced by borders through central hill country regions?', '["the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot"]'::jsonb, 'the lot for Joseph was traced by borders through central hill country regions', 'That detail belongs in this chapter. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 16 use this detail to shape its message: the lot for Joseph was traced by borders through central hill country regions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 3, 'How does Joshua 16 deepen its message through this added detail: the Canaanites in Gezer were not fully driven out but were made subject to forced labor?', '["the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed"]'::jsonb, 'the Canaanites in Gezer were not fully driven out but were made subject to forced labor', 'This second detail is part of the chapter''s material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 16 deepen its message through this added detail: the Canaanites in Gezer were not fully driven out but were made subject to forced labor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 3, 'What larger lesson is reinforced by the outcome in Joshua 16?', '["Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots", "Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion"]'::jsonb, 'Ephraim received its allotted territory with incomplete conquest noted', 'That is the chapter''s stated outcome or practical effect. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 3, 'Which summary best captures the focus of Joshua 16?', '["the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land", "Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance"]'::jsonb, 'the allotment for Joseph through Ephraim', 'This chapter centers on the allotment for Joseph through Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 3, 'Which verse reference most directly supports the central teaching of Joshua 16?', '["Joshua 16:1-10", "Joshua 18:1-28", "Joshua 17:1-18", "Joshua 19:1-51"]'::jsonb, 'Joshua 16:1-10', 'Those verses anchor the chapter''s central material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 4, 'How does Joshua 16 connect its main subject to Israel''s covenant life?', '["compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise", "God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance"]'::jsonb, 'compromise can linger inside a granted inheritance', 'That theme best summarizes the chapter''s message. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 16 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 4, 'How does Joshua 16 position the children of Joseph and the tribe of Ephraim within the covenant community?', '["the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men", "half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself"]'::jsonb, 'the children of Joseph and the tribe of Ephraim', 'The chapter repeatedly focuses on the children of Joseph and the tribe of Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 16 position the children of Joseph and the tribe of Ephraim within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 4, 'Why is this detail structurally important in Joshua 16: the lot for Joseph was traced by borders through central hill country regions?', '["the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot"]'::jsonb, 'the lot for Joseph was traced by borders through central hill country regions', 'That detail belongs in this chapter. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 16: the lot for Joseph was traced by borders through central hill country regions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 16: the Canaanites in Gezer were not fully driven out but were made subject to forced labor?', '["the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed"]'::jsonb, 'the Canaanites in Gezer were not fully driven out but were made subject to forced labor', 'This second detail is part of the chapter''s material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 16: the Canaanites in Gezer were not fully driven out but were made subject to forced labor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 4, 'How does the outcome of Joshua 16 guide later action in Israel?', '["Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots", "Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion"]'::jsonb, 'Ephraim received its allotted territory with incomplete conquest noted', 'That is the chapter''s stated outcome or practical effect. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 16 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 16?', '["the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land", "Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance"]'::jsonb, 'the allotment for Joseph through Ephraim', 'This chapter centers on the allotment for Joseph through Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 4, 'Which verse reference best supports a synthesis reading of Joshua 16?', '["Joshua 16:1-10", "Joshua 18:1-28", "Joshua 17:1-18", "Joshua 19:1-51"]'::jsonb, 'Joshua 16:1-10', 'Those verses anchor the chapter''s central material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 5, 'What theological truth is emphasized by Joshua 16?', '["compromise can linger inside a granted inheritance", "worship and ordered process govern the distribution of promise", "God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance"]'::jsonb, 'compromise can linger inside a granted inheritance', 'That theme best summarizes the chapter''s message. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 5, 'What does Joshua 16 reveal about the covenant role of the children of Joseph and the tribe of Ephraim?', '["the children of Joseph and the tribe of Ephraim", "Joshua, the congregation at Shiloh, and surveying men", "half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself"]'::jsonb, 'the children of Joseph and the tribe of Ephraim', 'The chapter repeatedly focuses on the children of Joseph and the tribe of Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 16 reveal about the covenant role of the children of Joseph and the tribe of Ephraim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 5, 'Why does this detail matter theologically in Joshua 16: the lot for Joseph was traced by borders through central hill country regions?', '["the lot for Joseph was traced by borders through central hill country regions", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot"]'::jsonb, 'the lot for Joseph was traced by borders through central hill country regions', 'That detail belongs in this chapter. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 16: the lot for Joseph was traced by borders through central hill country regions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 5, 'How does this second detail sharpen the theological meaning of Joshua 16: the Canaanites in Gezer were not fully driven out but were made subject to forced labor?', '["the Canaanites in Gezer were not fully driven out but were made subject to forced labor", "Joshua sent men to survey the remaining land and cast lots before the LORD", "Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed"]'::jsonb, 'the Canaanites in Gezer were not fully driven out but were made subject to forced labor', 'This second detail is part of the chapter''s material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 16: the Canaanites in Gezer were not fully driven out but were made subject to forced labor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 5, 'What enduring implication comes from the outcome in Joshua 16?', '["Ephraim received its allotted territory with incomplete conquest noted", "Benjamin received its inheritance after the survey and casting of lots", "Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion"]'::jsonb, 'Ephraim received its allotted territory with incomplete conquest noted', 'That is the chapter''s stated outcome or practical effect. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 5, 'Which statement best expresses the theological burden of Joshua 16?', '["the allotment for Joseph through Ephraim", "the tabernacle at Shiloh and distribution of the remaining land", "Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance"]'::jsonb, 'the allotment for Joseph through Ephraim', 'This chapter centers on the allotment for Joseph through Ephraim. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 16, 5, 'Which verse reference best anchors the theological center of Joshua 16?', '["Joshua 16:1-10", "Joshua 18:1-28", "Joshua 17:1-18", "Joshua 19:1-51"]'::jsonb, 'Joshua 16:1-10', 'Those verses anchor the chapter''s central material. (Joshua 16:1-10)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 1, 'According to Joshua 17, what is the main subject of the chapter?', '["Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance", "the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge"]'::jsonb, 'Manasseh''s inheritance and the complaint of Joseph', 'This chapter centers on Manasseh''s inheritance and the complaint of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 17, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 1, 'According to Joshua 17, which group or people are most directly involved?', '["half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself", "Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities"]'::jsonb, 'half Manasseh west of the Jordan and the children of Joseph', 'The chapter repeatedly focuses on half Manasseh west of the Jordan and the children of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 17, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 1, 'According to Joshua 17, which detail belongs in this chapter?', '["the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate"]'::jsonb, 'the daughters of Zelophehad received inheritance among their father''s relatives', 'That detail belongs in this chapter. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 17, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 1, 'According to Joshua 17, what additional detail is specifically included?', '["Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed", "Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest"]'::jsonb, 'Joshua told Joseph to clear the forested hill country rather than complain about limited room', 'This second detail is part of the chapter''s material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 17, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 1, 'According to Joshua 17, what result or outcome is emphasized?', '["Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion", "Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance"]'::jsonb, 'Joseph was challenged to act courageously despite Canaanite iron chariots', 'That is the chapter''s stated outcome or practical effect. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 17, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 1, 'According to Joshua 17, which theme best fits the chapter?', '["God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance", "worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection"]'::jsonb, 'God''s people must exercise faith within their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 17, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 1, 'According to Joshua 17, which verse reference matches the chapter''s core material?', '["Joshua 17:1-18", "Joshua 19:1-51", "Joshua 18:1-28", "Joshua 20:1-9"]'::jsonb, 'Joshua 17:1-18', 'Those verses anchor the chapter''s central material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 17, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 2, 'In Joshua 17, what purpose is served by the chapter''s main command or event?', '["God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance", "worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection"]'::jsonb, 'God''s people must exercise faith within their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 17, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 2, 'In Joshua 17, which group carries the chapter''s central responsibility?', '["half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself", "Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities"]'::jsonb, 'half Manasseh west of the Jordan and the children of Joseph', 'The chapter repeatedly focuses on half Manasseh west of the Jordan and the children of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 17, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 2, 'In Joshua 17, which detail shows how the chapter''s message works out?', '["the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate"]'::jsonb, 'the daughters of Zelophehad received inheritance among their father''s relatives', 'That detail belongs in this chapter. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 17, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 2, 'In Joshua 17, which second detail clarifies the instruction or event?', '["Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed", "Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest"]'::jsonb, 'Joshua told Joseph to clear the forested hill country rather than complain about limited room', 'This second detail is part of the chapter''s material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 17, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 2, 'In Joshua 17, which outcome follows from the chapter''s teaching or narrative?', '["Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion", "Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance"]'::jsonb, 'Joseph was challenged to act courageously despite Canaanite iron chariots', 'That is the chapter''s stated outcome or practical effect. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 17, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 2, 'In Joshua 17, what larger issue is being addressed?', '["Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance", "the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge"]'::jsonb, 'Manasseh''s inheritance and the complaint of Joseph', 'This chapter centers on Manasseh''s inheritance and the complaint of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 17, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 2, 'In Joshua 17, which verse reference best anchors the chapter''s key point?', '["Joshua 17:1-18", "Joshua 19:1-51", "Joshua 18:1-28", "Joshua 20:1-9"]'::jsonb, 'Joshua 17:1-18', 'Those verses anchor the chapter''s central material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 17, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 3, 'What does Joshua 17 show about the meaning of the chapter''s central concern?', '["God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance", "worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection"]'::jsonb, 'God''s people must exercise faith within their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 17 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 3, 'What does Joshua 17 suggest about the role of half Manasseh west of the Jordan and the children of Joseph?', '["half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself", "Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities"]'::jsonb, 'half Manasseh west of the Jordan and the children of Joseph', 'The chapter repeatedly focuses on half Manasseh west of the Jordan and the children of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 17 suggest about the role of half Manasseh west of the Jordan and the children of Joseph?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 3, 'How does Joshua 17 use this detail to shape its message: the daughters of Zelophehad received inheritance among their father''s relatives?', '["the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate"]'::jsonb, 'the daughters of Zelophehad received inheritance among their father''s relatives', 'That detail belongs in this chapter. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 17 use this detail to shape its message: the daughters of Zelophehad received inheritance among their father''s relatives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 3, 'How does Joshua 17 deepen its message through this added detail: Joshua told Joseph to clear the forested hill country rather than complain about limited room?', '["Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed", "Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest"]'::jsonb, 'Joshua told Joseph to clear the forested hill country rather than complain about limited room', 'This second detail is part of the chapter''s material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 17 deepen its message through this added detail: Joshua told Joseph to clear the forested hill country rather than complain about limited room?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 3, 'What larger lesson is reinforced by the outcome in Joshua 17?', '["Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion", "Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance"]'::jsonb, 'Joseph was challenged to act courageously despite Canaanite iron chariots', 'That is the chapter''s stated outcome or practical effect. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 3, 'Which summary best captures the focus of Joshua 17?', '["Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance", "the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge"]'::jsonb, 'Manasseh''s inheritance and the complaint of Joseph', 'This chapter centers on Manasseh''s inheritance and the complaint of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 3, 'Which verse reference most directly supports the central teaching of Joshua 17?', '["Joshua 17:1-18", "Joshua 19:1-51", "Joshua 18:1-28", "Joshua 20:1-9"]'::jsonb, 'Joshua 17:1-18', 'Those verses anchor the chapter''s central material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 4, 'How does Joshua 17 connect its main subject to Israel''s covenant life?', '["God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance", "worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection"]'::jsonb, 'God''s people must exercise faith within their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 17 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 4, 'How does Joshua 17 position half Manasseh west of the Jordan and the children of Joseph within the covenant community?', '["half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself", "Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities"]'::jsonb, 'half Manasseh west of the Jordan and the children of Joseph', 'The chapter repeatedly focuses on half Manasseh west of the Jordan and the children of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 17 position half Manasseh west of the Jordan and the children of Joseph within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 4, 'Why is this detail structurally important in Joshua 17: the daughters of Zelophehad received inheritance among their father''s relatives?', '["the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate"]'::jsonb, 'the daughters of Zelophehad received inheritance among their father''s relatives', 'That detail belongs in this chapter. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 17: the daughters of Zelophehad received inheritance among their father''s relatives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 17: Joshua told Joseph to clear the forested hill country rather than complain about limited room?', '["Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed", "Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest"]'::jsonb, 'Joshua told Joseph to clear the forested hill country rather than complain about limited room', 'This second detail is part of the chapter''s material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 17: Joshua told Joseph to clear the forested hill country rather than complain about limited room?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 4, 'How does the outcome of Joshua 17 guide later action in Israel?', '["Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion", "Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance"]'::jsonb, 'Joseph was challenged to act courageously despite Canaanite iron chariots', 'That is the chapter''s stated outcome or practical effect. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 17 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 17?', '["Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance", "the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge"]'::jsonb, 'Manasseh''s inheritance and the complaint of Joseph', 'This chapter centers on Manasseh''s inheritance and the complaint of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 4, 'Which verse reference best supports a synthesis reading of Joshua 17?', '["Joshua 17:1-18", "Joshua 19:1-51", "Joshua 18:1-28", "Joshua 20:1-9"]'::jsonb, 'Joshua 17:1-18', 'Those verses anchor the chapter''s central material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 5, 'What theological truth is emphasized by Joshua 17?', '["God''s people must exercise faith within their inheritance", "the leader waits while the people first receive their inheritance", "worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection"]'::jsonb, 'God''s people must exercise faith within their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 5, 'What does Joshua 17 reveal about the covenant role of half Manasseh west of the Jordan and the children of Joseph?', '["half Manasseh west of the Jordan and the children of Joseph", "the remaining tribes and Joshua himself", "Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities"]'::jsonb, 'half Manasseh west of the Jordan and the children of Joseph', 'The chapter repeatedly focuses on half Manasseh west of the Jordan and the children of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 17 reveal about the covenant role of half Manasseh west of the Jordan and the children of Joseph?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 5, 'Why does this detail matter theologically in Joshua 17: the daughters of Zelophehad received inheritance among their father''s relatives?', '["the daughters of Zelophehad received inheritance among their father''s relatives", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate"]'::jsonb, 'the daughters of Zelophehad received inheritance among their father''s relatives', 'That detail belongs in this chapter. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 17: the daughters of Zelophehad received inheritance among their father''s relatives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 5, 'How does this second detail sharpen the theological meaning of Joshua 17: Joshua told Joseph to clear the forested hill country rather than complain about limited room?', '["Joshua told Joseph to clear the forested hill country rather than complain about limited room", "Joshua received Timnath Serah after the tribal allotments were completed", "Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest"]'::jsonb, 'Joshua told Joseph to clear the forested hill country rather than complain about limited room', 'This second detail is part of the chapter''s material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 17: Joshua told Joseph to clear the forested hill country rather than complain about limited room?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 5, 'What enduring implication comes from the outcome in Joshua 17?', '["Joseph was challenged to act courageously despite Canaanite iron chariots", "the division of the land was completed tribe by tribe before Joshua received his portion", "Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance"]'::jsonb, 'Joseph was challenged to act courageously despite Canaanite iron chariots', 'That is the chapter''s stated outcome or practical effect. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 5, 'Which statement best expresses the theological burden of Joshua 17?', '["Manasseh''s inheritance and the complaint of Joseph", "the final tribal allotments and Joshua''s inheritance", "the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge"]'::jsonb, 'Manasseh''s inheritance and the complaint of Joseph', 'This chapter centers on Manasseh''s inheritance and the complaint of Joseph. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 17, 5, 'Which verse reference best anchors the theological center of Joshua 17?', '["Joshua 17:1-18", "Joshua 19:1-51", "Joshua 18:1-28", "Joshua 20:1-9"]'::jsonb, 'Joshua 17:1-18', 'Those verses anchor the chapter''s central material. (Joshua 17:1-18)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 1, 'According to Joshua 18, what is the main subject of the chapter?', '["the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge", "the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises"]'::jsonb, 'the tabernacle at Shiloh and distribution of the remaining land', 'This chapter centers on the tabernacle at Shiloh and distribution of the remaining land. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 18, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 1, 'According to Joshua 18, which group or people are most directly involved?', '["Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities", "the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities"]'::jsonb, 'Joshua, the congregation at Shiloh, and surveying men', 'The chapter repeatedly focuses on Joshua, the congregation at Shiloh, and surveying men. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 18, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 1, 'According to Joshua 18, which detail belongs in this chapter?', '["the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances"]'::jsonb, 'the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned', 'That detail belongs in this chapter. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 18, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 1, 'According to Joshua 18, what additional detail is specifically included?', '["Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest", "Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans"]'::jsonb, 'Joshua sent men to survey the remaining land and cast lots before the LORD', 'This second detail is part of the chapter''s material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 18, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 1, 'According to Joshua 18, what result or outcome is emphasized?', '["Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance", "the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel"]'::jsonb, 'Benjamin received its inheritance after the survey and casting of lots', 'That is the chapter''s stated outcome or practical effect. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 18, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 1, 'According to Joshua 18, which theme best fits the chapter?', '["worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection", "the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise"]'::jsonb, 'worship and ordered process govern the distribution of promise', 'That theme best summarizes the chapter''s message. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 18, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 1, 'According to Joshua 18, which verse reference matches the chapter''s core material?', '["Joshua 18:1-28", "Joshua 20:1-9", "Joshua 19:1-51", "Joshua 21:1-45"]'::jsonb, 'Joshua 18:1-28', 'Those verses anchor the chapter''s central material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 18, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 2, 'In Joshua 18, what purpose is served by the chapter''s main command or event?', '["worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection", "the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise"]'::jsonb, 'worship and ordered process govern the distribution of promise', 'That theme best summarizes the chapter''s message. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 18, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 2, 'In Joshua 18, which group carries the chapter''s central responsibility?', '["Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities", "the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities"]'::jsonb, 'Joshua, the congregation at Shiloh, and surveying men', 'The chapter repeatedly focuses on Joshua, the congregation at Shiloh, and surveying men. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 18, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 2, 'In Joshua 18, which detail shows how the chapter''s message works out?', '["the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances"]'::jsonb, 'the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned', 'That detail belongs in this chapter. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 18, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 2, 'In Joshua 18, which second detail clarifies the instruction or event?', '["Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest", "Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans"]'::jsonb, 'Joshua sent men to survey the remaining land and cast lots before the LORD', 'This second detail is part of the chapter''s material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 18, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 2, 'In Joshua 18, which outcome follows from the chapter''s teaching or narrative?', '["Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance", "the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel"]'::jsonb, 'Benjamin received its inheritance after the survey and casting of lots', 'That is the chapter''s stated outcome or practical effect. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 18, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 2, 'In Joshua 18, what larger issue is being addressed?', '["the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge", "the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises"]'::jsonb, 'the tabernacle at Shiloh and distribution of the remaining land', 'This chapter centers on the tabernacle at Shiloh and distribution of the remaining land. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 18, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 2, 'In Joshua 18, which verse reference best anchors the chapter''s key point?', '["Joshua 18:1-28", "Joshua 20:1-9", "Joshua 19:1-51", "Joshua 21:1-45"]'::jsonb, 'Joshua 18:1-28', 'Those verses anchor the chapter''s central material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 18, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 3, 'What does Joshua 18 show about the meaning of the chapter''s central concern?', '["worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection", "the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise"]'::jsonb, 'worship and ordered process govern the distribution of promise', 'That theme best summarizes the chapter''s message. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 18 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 3, 'What does Joshua 18 suggest about the role of Joshua, the congregation at Shiloh, and surveying men?', '["Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities", "the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities"]'::jsonb, 'Joshua, the congregation at Shiloh, and surveying men', 'The chapter repeatedly focuses on Joshua, the congregation at Shiloh, and surveying men. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 18 suggest about the role of Joshua, the congregation at Shiloh, and surveying men?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 3, 'How does Joshua 18 use this detail to shape its message: the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned?', '["the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances"]'::jsonb, 'the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned', 'That detail belongs in this chapter. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 18 use this detail to shape its message: the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 3, 'How does Joshua 18 deepen its message through this added detail: Joshua sent men to survey the remaining land and cast lots before the LORD?', '["Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest", "Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans"]'::jsonb, 'Joshua sent men to survey the remaining land and cast lots before the LORD', 'This second detail is part of the chapter''s material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 18 deepen its message through this added detail: Joshua sent men to survey the remaining land and cast lots before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 3, 'What larger lesson is reinforced by the outcome in Joshua 18?', '["Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance", "the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel"]'::jsonb, 'Benjamin received its inheritance after the survey and casting of lots', 'That is the chapter''s stated outcome or practical effect. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 3, 'Which summary best captures the focus of Joshua 18?', '["the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge", "the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises"]'::jsonb, 'the tabernacle at Shiloh and distribution of the remaining land', 'This chapter centers on the tabernacle at Shiloh and distribution of the remaining land. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 3, 'Which verse reference most directly supports the central teaching of Joshua 18?', '["Joshua 18:1-28", "Joshua 20:1-9", "Joshua 19:1-51", "Joshua 21:1-45"]'::jsonb, 'Joshua 18:1-28', 'Those verses anchor the chapter''s central material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 4, 'How does Joshua 18 connect its main subject to Israel''s covenant life?', '["worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection", "the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise"]'::jsonb, 'worship and ordered process govern the distribution of promise', 'That theme best summarizes the chapter''s message. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 18 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 4, 'How does Joshua 18 position Joshua, the congregation at Shiloh, and surveying men within the covenant community?', '["Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities", "the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities"]'::jsonb, 'Joshua, the congregation at Shiloh, and surveying men', 'The chapter repeatedly focuses on Joshua, the congregation at Shiloh, and surveying men. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 18 position Joshua, the congregation at Shiloh, and surveying men within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 4, 'Why is this detail structurally important in Joshua 18: the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned?', '["the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances"]'::jsonb, 'the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned', 'That detail belongs in this chapter. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 18: the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 18: Joshua sent men to survey the remaining land and cast lots before the LORD?', '["Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest", "Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans"]'::jsonb, 'Joshua sent men to survey the remaining land and cast lots before the LORD', 'This second detail is part of the chapter''s material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 18: Joshua sent men to survey the remaining land and cast lots before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 4, 'How does the outcome of Joshua 18 guide later action in Israel?', '["Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance", "the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel"]'::jsonb, 'Benjamin received its inheritance after the survey and casting of lots', 'That is the chapter''s stated outcome or practical effect. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 18 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 18?', '["the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge", "the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises"]'::jsonb, 'the tabernacle at Shiloh and distribution of the remaining land', 'This chapter centers on the tabernacle at Shiloh and distribution of the remaining land. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 4, 'Which verse reference best supports a synthesis reading of Joshua 18?', '["Joshua 18:1-28", "Joshua 20:1-9", "Joshua 19:1-51", "Joshua 21:1-45"]'::jsonb, 'Joshua 18:1-28', 'Those verses anchor the chapter''s central material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 5, 'What theological truth is emphasized by Joshua 18?', '["worship and ordered process govern the distribution of promise", "God''s order balances mercy, process, and protection", "the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise"]'::jsonb, 'worship and ordered process govern the distribution of promise', 'That theme best summarizes the chapter''s message. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 5, 'What does Joshua 18 reveal about the covenant role of Joshua, the congregation at Shiloh, and surveying men?', '["Joshua, the congregation at Shiloh, and surveying men", "manslayers, elders, and the designated refuge cities", "the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities"]'::jsonb, 'Joshua, the congregation at Shiloh, and surveying men', 'The chapter repeatedly focuses on Joshua, the congregation at Shiloh, and surveying men. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 18 reveal about the covenant role of Joshua, the congregation at Shiloh, and surveying men?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 5, 'Why does this detail matter theologically in Joshua 18: the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned?', '["the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned", "one who killed unintentionally could flee and state the case at a city gate", "Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances"]'::jsonb, 'the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned', 'That detail belongs in this chapter. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 18: the tabernacle of meeting was set up at Shiloh before the remaining allotments were assigned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 5, 'How does this second detail sharpen the theological meaning of Joshua 18: Joshua sent men to survey the remaining land and cast lots before the LORD?', '["Joshua sent men to survey the remaining land and cast lots before the LORD", "the manslayer remained until standing before the congregation and until the death of the high priest", "Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans"]'::jsonb, 'Joshua sent men to survey the remaining land and cast lots before the LORD', 'This second detail is part of the chapter''s material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 18: Joshua sent men to survey the remaining land and cast lots before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 5, 'What enduring implication comes from the outcome in Joshua 18?', '["Benjamin received its inheritance after the survey and casting of lots", "refuge cities provided justice without surrendering the innocent to vengeance", "the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel"]'::jsonb, 'Benjamin received its inheritance after the survey and casting of lots', 'That is the chapter''s stated outcome or practical effect. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 5, 'Which statement best expresses the theological burden of Joshua 18?', '["the tabernacle at Shiloh and distribution of the remaining land", "the cities of refuge", "the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises"]'::jsonb, 'the tabernacle at Shiloh and distribution of the remaining land', 'This chapter centers on the tabernacle at Shiloh and distribution of the remaining land. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 18, 5, 'Which verse reference best anchors the theological center of Joshua 18?', '["Joshua 18:1-28", "Joshua 20:1-9", "Joshua 19:1-51", "Joshua 21:1-45"]'::jsonb, 'Joshua 18:1-28', 'Those verses anchor the chapter''s central material. (Joshua 18:1-28)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 1, 'According to Joshua 19, what is the main subject of the chapter?', '["the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises", "the cities of refuge", "the eastern altar controversy"]'::jsonb, 'the final tribal allotments and Joshua''s inheritance', 'This chapter centers on the final tribal allotments and Joshua''s inheritance. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 19, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 1, 'According to Joshua 19, which group or people are most directly involved?', '["the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities", "manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes"]'::jsonb, 'the remaining tribes and Joshua himself', 'The chapter repeatedly focuses on the remaining tribes and Joshua himself. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 19, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 1, 'According to Joshua 19, which detail belongs in this chapter?', '["Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home"]'::jsonb, 'Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot', 'That detail belongs in this chapter. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 19, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 1, 'According to Joshua 19, what additional detail is specifically included?', '["Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site"]'::jsonb, 'Joshua received Timnath Serah after the tribal allotments were completed', 'This second detail is part of the chapter''s material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 19, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 1, 'According to Joshua 19, what result or outcome is emphasized?', '["the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel", "refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly"]'::jsonb, 'the division of the land was completed tribe by tribe before Joshua received his portion', 'That is the chapter''s stated outcome or practical effect. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 19, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 1, 'According to Joshua 19, which theme best fits the chapter?', '["the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise", "God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing"]'::jsonb, 'the leader waits while the people first receive their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 19, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 1, 'According to Joshua 19, which verse reference matches the chapter''s core material?', '["Joshua 19:1-51", "Joshua 21:1-45", "Joshua 20:1-9", "Joshua 22:1-34"]'::jsonb, 'Joshua 19:1-51', 'Those verses anchor the chapter''s central material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 19, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 2, 'In Joshua 19, what purpose is served by the chapter''s main command or event?', '["the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise", "God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing"]'::jsonb, 'the leader waits while the people first receive their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 19, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 2, 'In Joshua 19, which group carries the chapter''s central responsibility?', '["the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities", "manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes"]'::jsonb, 'the remaining tribes and Joshua himself', 'The chapter repeatedly focuses on the remaining tribes and Joshua himself. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 19, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 2, 'In Joshua 19, which detail shows how the chapter''s message works out?', '["Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home"]'::jsonb, 'Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot', 'That detail belongs in this chapter. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 19, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 2, 'In Joshua 19, which second detail clarifies the instruction or event?', '["Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site"]'::jsonb, 'Joshua received Timnath Serah after the tribal allotments were completed', 'This second detail is part of the chapter''s material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 19, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 2, 'In Joshua 19, which outcome follows from the chapter''s teaching or narrative?', '["the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel", "refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly"]'::jsonb, 'the division of the land was completed tribe by tribe before Joshua received his portion', 'That is the chapter''s stated outcome or practical effect. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 19, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 2, 'In Joshua 19, what larger issue is being addressed?', '["the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises", "the cities of refuge", "the eastern altar controversy"]'::jsonb, 'the final tribal allotments and Joshua''s inheritance', 'This chapter centers on the final tribal allotments and Joshua''s inheritance. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 19, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 2, 'In Joshua 19, which verse reference best anchors the chapter''s key point?', '["Joshua 19:1-51", "Joshua 21:1-45", "Joshua 20:1-9", "Joshua 22:1-34"]'::jsonb, 'Joshua 19:1-51', 'Those verses anchor the chapter''s central material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 19, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 3, 'What does Joshua 19 show about the meaning of the chapter''s central concern?', '["the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise", "God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing"]'::jsonb, 'the leader waits while the people first receive their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 19 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 3, 'What does Joshua 19 suggest about the role of the remaining tribes and Joshua himself?', '["the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities", "manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes"]'::jsonb, 'the remaining tribes and Joshua himself', 'The chapter repeatedly focuses on the remaining tribes and Joshua himself. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 19 suggest about the role of the remaining tribes and Joshua himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 3, 'How does Joshua 19 use this detail to shape its message: Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot?', '["Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home"]'::jsonb, 'Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot', 'That detail belongs in this chapter. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 19 use this detail to shape its message: Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 3, 'How does Joshua 19 deepen its message through this added detail: Joshua received Timnath Serah after the tribal allotments were completed?', '["Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site"]'::jsonb, 'Joshua received Timnath Serah after the tribal allotments were completed', 'This second detail is part of the chapter''s material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 19 deepen its message through this added detail: Joshua received Timnath Serah after the tribal allotments were completed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 3, 'What larger lesson is reinforced by the outcome in Joshua 19?', '["the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel", "refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly"]'::jsonb, 'the division of the land was completed tribe by tribe before Joshua received his portion', 'That is the chapter''s stated outcome or practical effect. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 3, 'Which summary best captures the focus of Joshua 19?', '["the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises", "the cities of refuge", "the eastern altar controversy"]'::jsonb, 'the final tribal allotments and Joshua''s inheritance', 'This chapter centers on the final tribal allotments and Joshua''s inheritance. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 3, 'Which verse reference most directly supports the central teaching of Joshua 19?', '["Joshua 19:1-51", "Joshua 21:1-45", "Joshua 20:1-9", "Joshua 22:1-34"]'::jsonb, 'Joshua 19:1-51', 'Those verses anchor the chapter''s central material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 4, 'How does Joshua 19 connect its main subject to Israel''s covenant life?', '["the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise", "God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing"]'::jsonb, 'the leader waits while the people first receive their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 19 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 4, 'How does Joshua 19 position the remaining tribes and Joshua himself within the covenant community?', '["the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities", "manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes"]'::jsonb, 'the remaining tribes and Joshua himself', 'The chapter repeatedly focuses on the remaining tribes and Joshua himself. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 19 position the remaining tribes and Joshua himself within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 4, 'Why is this detail structurally important in Joshua 19: Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot?', '["Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home"]'::jsonb, 'Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot', 'That detail belongs in this chapter. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 19: Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 19: Joshua received Timnath Serah after the tribal allotments were completed?', '["Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site"]'::jsonb, 'Joshua received Timnath Serah after the tribal allotments were completed', 'This second detail is part of the chapter''s material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 19: Joshua received Timnath Serah after the tribal allotments were completed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 4, 'How does the outcome of Joshua 19 guide later action in Israel?', '["the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel", "refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly"]'::jsonb, 'the division of the land was completed tribe by tribe before Joshua received his portion', 'That is the chapter''s stated outcome or practical effect. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 19 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 19?', '["the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises", "the cities of refuge", "the eastern altar controversy"]'::jsonb, 'the final tribal allotments and Joshua''s inheritance', 'This chapter centers on the final tribal allotments and Joshua''s inheritance. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 4, 'Which verse reference best supports a synthesis reading of Joshua 19?', '["Joshua 19:1-51", "Joshua 21:1-45", "Joshua 20:1-9", "Joshua 22:1-34"]'::jsonb, 'Joshua 19:1-51', 'Those verses anchor the chapter''s central material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 5, 'What theological truth is emphasized by Joshua 19?', '["the leader waits while the people first receive their inheritance", "God faithfully gives rest and keeps every promise", "God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing"]'::jsonb, 'the leader waits while the people first receive their inheritance', 'That theme best summarizes the chapter''s message. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 5, 'What does Joshua 19 reveal about the covenant role of the remaining tribes and Joshua himself?', '["the remaining tribes and Joshua himself", "the Levites and the tribes assigning cities", "manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes"]'::jsonb, 'the remaining tribes and Joshua himself', 'The chapter repeatedly focuses on the remaining tribes and Joshua himself. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 19 reveal about the covenant role of the remaining tribes and Joshua himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 5, 'Why does this detail matter theologically in Joshua 19: Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot?', '["Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home"]'::jsonb, 'Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot', 'That detail belongs in this chapter. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 19: Simeon, Zebulun, Issachar, Asher, Naphtali, and Dan received inheritances by lot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 5, 'How does this second detail sharpen the theological meaning of Joshua 19: Joshua received Timnath Serah after the tribal allotments were completed?', '["Joshua received Timnath Serah after the tribal allotments were completed", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site"]'::jsonb, 'Joshua received Timnath Serah after the tribal allotments were completed', 'This second detail is part of the chapter''s material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 19: Joshua received Timnath Serah after the tribal allotments were completed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 5, 'What enduring implication comes from the outcome in Joshua 19?', '["the division of the land was completed tribe by tribe before Joshua received his portion", "not one word failed of all the good things the LORD had spoken to Israel", "refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly"]'::jsonb, 'the division of the land was completed tribe by tribe before Joshua received his portion', 'That is the chapter''s stated outcome or practical effect. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 5, 'Which statement best expresses the theological burden of Joshua 19?', '["the final tribal allotments and Joshua''s inheritance", "the Levitical cities and the LORD''s fulfilled promises", "the cities of refuge", "the eastern altar controversy"]'::jsonb, 'the final tribal allotments and Joshua''s inheritance', 'This chapter centers on the final tribal allotments and Joshua''s inheritance. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 19, 5, 'Which verse reference best anchors the theological center of Joshua 19?', '["Joshua 19:1-51", "Joshua 21:1-45", "Joshua 20:1-9", "Joshua 22:1-34"]'::jsonb, 'Joshua 19:1-51', 'Those verses anchor the chapter''s central material. (Joshua 19:1-51)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 1, 'According to Joshua 20, what is the main subject of the chapter?', '["the cities of refuge", "the eastern altar controversy", "the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders"]'::jsonb, 'the cities of refuge', 'This chapter centers on the cities of refuge. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 20, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 1, 'According to Joshua 20, which group or people are most directly involved?', '["manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes", "the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers"]'::jsonb, 'manslayers, elders, and the designated refuge cities', 'The chapter repeatedly focuses on manslayers, elders, and the designated refuge cities. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 20, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 1, 'According to Joshua 20, which detail belongs in this chapter?', '["one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations"]'::jsonb, 'one who killed unintentionally could flee and state the case at a city gate', 'That detail belongs in this chapter. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 20, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 1, 'According to Joshua 20, what additional detail is specifically included?', '["the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them"]'::jsonb, 'the manslayer remained until standing before the congregation and until the death of the high priest', 'This second detail is part of the chapter''s material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 20, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 1, 'According to Joshua 20, what result or outcome is emphasized?', '["refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly", "not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy"]'::jsonb, 'refuge cities provided justice without surrendering the innocent to vengeance', 'That is the chapter''s stated outcome or practical effect. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 20, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 1, 'According to Joshua 20, which theme best fits the chapter?', '["God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing", "God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience"]'::jsonb, 'God''s order balances mercy, process, and protection', 'That theme best summarizes the chapter''s message. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 20, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 1, 'According to Joshua 20, which verse reference matches the chapter''s core material?', '["Joshua 20:1-9", "Joshua 22:1-34", "Joshua 21:1-45", "Joshua 23:1-16"]'::jsonb, 'Joshua 20:1-9', 'Those verses anchor the chapter''s central material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 20, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 2, 'In Joshua 20, what purpose is served by the chapter''s main command or event?', '["God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing", "God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience"]'::jsonb, 'God''s order balances mercy, process, and protection', 'That theme best summarizes the chapter''s message. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 20, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 2, 'In Joshua 20, which group carries the chapter''s central responsibility?', '["manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes", "the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers"]'::jsonb, 'manslayers, elders, and the designated refuge cities', 'The chapter repeatedly focuses on manslayers, elders, and the designated refuge cities. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 20, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 2, 'In Joshua 20, which detail shows how the chapter''s message works out?', '["one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations"]'::jsonb, 'one who killed unintentionally could flee and state the case at a city gate', 'That detail belongs in this chapter. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 20, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 2, 'In Joshua 20, which second detail clarifies the instruction or event?', '["the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them"]'::jsonb, 'the manslayer remained until standing before the congregation and until the death of the high priest', 'This second detail is part of the chapter''s material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 20, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 2, 'In Joshua 20, which outcome follows from the chapter''s teaching or narrative?', '["refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly", "not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy"]'::jsonb, 'refuge cities provided justice without surrendering the innocent to vengeance', 'That is the chapter''s stated outcome or practical effect. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 20, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 2, 'In Joshua 20, what larger issue is being addressed?', '["the cities of refuge", "the eastern altar controversy", "the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders"]'::jsonb, 'the cities of refuge', 'This chapter centers on the cities of refuge. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 20, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 2, 'In Joshua 20, which verse reference best anchors the chapter''s key point?', '["Joshua 20:1-9", "Joshua 22:1-34", "Joshua 21:1-45", "Joshua 23:1-16"]'::jsonb, 'Joshua 20:1-9', 'Those verses anchor the chapter''s central material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 20, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 3, 'What does Joshua 20 show about the meaning of the chapter''s central concern?', '["God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing", "God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience"]'::jsonb, 'God''s order balances mercy, process, and protection', 'That theme best summarizes the chapter''s message. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 20 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 3, 'What does Joshua 20 suggest about the role of manslayers, elders, and the designated refuge cities?', '["manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes", "the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers"]'::jsonb, 'manslayers, elders, and the designated refuge cities', 'The chapter repeatedly focuses on manslayers, elders, and the designated refuge cities. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 20 suggest about the role of manslayers, elders, and the designated refuge cities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 3, 'How does Joshua 20 use this detail to shape its message: one who killed unintentionally could flee and state the case at a city gate?', '["one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations"]'::jsonb, 'one who killed unintentionally could flee and state the case at a city gate', 'That detail belongs in this chapter. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 20 use this detail to shape its message: one who killed unintentionally could flee and state the case at a city gate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 3, 'How does Joshua 20 deepen its message through this added detail: the manslayer remained until standing before the congregation and until the death of the high priest?', '["the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them"]'::jsonb, 'the manslayer remained until standing before the congregation and until the death of the high priest', 'This second detail is part of the chapter''s material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 20 deepen its message through this added detail: the manslayer remained until standing before the congregation and until the death of the high priest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 3, 'What larger lesson is reinforced by the outcome in Joshua 20?', '["refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly", "not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy"]'::jsonb, 'refuge cities provided justice without surrendering the innocent to vengeance', 'That is the chapter''s stated outcome or practical effect. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 3, 'Which summary best captures the focus of Joshua 20?', '["the cities of refuge", "the eastern altar controversy", "the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders"]'::jsonb, 'the cities of refuge', 'This chapter centers on the cities of refuge. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 3, 'Which verse reference most directly supports the central teaching of Joshua 20?', '["Joshua 20:1-9", "Joshua 22:1-34", "Joshua 21:1-45", "Joshua 23:1-16"]'::jsonb, 'Joshua 20:1-9', 'Those verses anchor the chapter''s central material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 4, 'How does Joshua 20 connect its main subject to Israel''s covenant life?', '["God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing", "God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience"]'::jsonb, 'God''s order balances mercy, process, and protection', 'That theme best summarizes the chapter''s message. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 20 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 4, 'How does Joshua 20 position manslayers, elders, and the designated refuge cities within the covenant community?', '["manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes", "the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers"]'::jsonb, 'manslayers, elders, and the designated refuge cities', 'The chapter repeatedly focuses on manslayers, elders, and the designated refuge cities. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 20 position manslayers, elders, and the designated refuge cities within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 4, 'Why is this detail structurally important in Joshua 20: one who killed unintentionally could flee and state the case at a city gate?', '["one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations"]'::jsonb, 'one who killed unintentionally could flee and state the case at a city gate', 'That detail belongs in this chapter. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 20: one who killed unintentionally could flee and state the case at a city gate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 20: the manslayer remained until standing before the congregation and until the death of the high priest?', '["the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them"]'::jsonb, 'the manslayer remained until standing before the congregation and until the death of the high priest', 'This second detail is part of the chapter''s material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 20: the manslayer remained until standing before the congregation and until the death of the high priest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 4, 'How does the outcome of Joshua 20 guide later action in Israel?', '["refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly", "not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy"]'::jsonb, 'refuge cities provided justice without surrendering the innocent to vengeance', 'That is the chapter''s stated outcome or practical effect. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 20 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 20?', '["the cities of refuge", "the eastern altar controversy", "the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders"]'::jsonb, 'the cities of refuge', 'This chapter centers on the cities of refuge. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 4, 'Which verse reference best supports a synthesis reading of Joshua 20?', '["Joshua 20:1-9", "Joshua 22:1-34", "Joshua 21:1-45", "Joshua 23:1-16"]'::jsonb, 'Joshua 20:1-9', 'Those verses anchor the chapter''s central material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 5, 'What theological truth is emphasized by Joshua 20?', '["God''s order balances mercy, process, and protection", "zeal for true worship must be joined with careful hearing", "God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience"]'::jsonb, 'God''s order balances mercy, process, and protection', 'That theme best summarizes the chapter''s message. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 5, 'What does Joshua 20 reveal about the covenant role of manslayers, elders, and the designated refuge cities?', '["manslayers, elders, and the designated refuge cities", "the eastern tribes, Phinehas, and the western tribes", "the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers"]'::jsonb, 'manslayers, elders, and the designated refuge cities', 'The chapter repeatedly focuses on manslayers, elders, and the designated refuge cities. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 20 reveal about the covenant role of manslayers, elders, and the designated refuge cities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 5, 'Why does this detail matter theologically in Joshua 20: one who killed unintentionally could flee and state the case at a city gate?', '["one who killed unintentionally could flee and state the case at a city gate", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations"]'::jsonb, 'one who killed unintentionally could flee and state the case at a city gate', 'That detail belongs in this chapter. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 20: one who killed unintentionally could flee and state the case at a city gate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 5, 'How does this second detail sharpen the theological meaning of Joshua 20: the manslayer remained until standing before the congregation and until the death of the high priest?', '["the manslayer remained until standing before the congregation and until the death of the high priest", "the altar was explained as a witness rather than a rival sacrificial site", "the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them"]'::jsonb, 'the manslayer remained until standing before the congregation and until the death of the high priest', 'This second detail is part of the chapter''s material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 20: the manslayer remained until standing before the congregation and until the death of the high priest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 5, 'What enduring implication comes from the outcome in Joshua 20?', '["refuge cities provided justice without surrendering the innocent to vengeance", "civil war was avoided when the altar was understood rightly", "not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy"]'::jsonb, 'refuge cities provided justice without surrendering the innocent to vengeance', 'That is the chapter''s stated outcome or practical effect. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 5, 'Which statement best expresses the theological burden of Joshua 20?', '["the cities of refuge", "the eastern altar controversy", "the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders"]'::jsonb, 'the cities of refuge', 'This chapter centers on the cities of refuge. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 20, 5, 'Which verse reference best anchors the theological center of Joshua 20?', '["Joshua 20:1-9", "Joshua 22:1-34", "Joshua 21:1-45", "Joshua 23:1-16"]'::jsonb, 'Joshua 20:1-9', 'Those verses anchor the chapter''s central material. (Joshua 20:1-9)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 1, 'According to Joshua 21, what is the main subject of the chapter?', '["the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders", "the eastern altar controversy", "the covenant renewal at Shechem"]'::jsonb, 'the Levitical cities and the LORD''s fulfilled promises', 'This chapter centers on the Levitical cities and the LORD''s fulfilled promises. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 21, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 1, 'According to Joshua 21, which group or people are most directly involved?', '["the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers", "the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God"]'::jsonb, 'the Levites and the tribes assigning cities', 'The chapter repeatedly focuses on the Levites and the tribes assigning cities. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 21, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 1, 'According to Joshua 21, which detail belongs in this chapter?', '["forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest"]'::jsonb, 'forty-eight cities with pasture lands were given to the Levites from tribal inheritances', 'That detail belongs in this chapter. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 21, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 1, 'According to Joshua 21, what additional detail is specifically included?', '["the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them", "the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone"]'::jsonb, 'the Kohathites, Gershonites, and Merarites received cities according to their clans', 'This second detail is part of the chapter''s material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 21, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 1, 'According to Joshua 21, what result or outcome is emphasized?', '["not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal"]'::jsonb, 'not one word failed of all the good things the LORD had spoken to Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 21, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 1, 'According to Joshua 21, which theme best fits the chapter?', '["God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience", "zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness"]'::jsonb, 'God faithfully gives rest and keeps every promise', 'That theme best summarizes the chapter''s message. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 21, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 1, 'According to Joshua 21, which verse reference matches the chapter''s core material?', '["Joshua 21:1-45", "Joshua 23:1-16", "Joshua 22:1-34", "Joshua 24:1-33"]'::jsonb, 'Joshua 21:1-45', 'Those verses anchor the chapter''s central material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 21, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 2, 'In Joshua 21, what purpose is served by the chapter''s main command or event?', '["God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience", "zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness"]'::jsonb, 'God faithfully gives rest and keeps every promise', 'That theme best summarizes the chapter''s message. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 21, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 2, 'In Joshua 21, which group carries the chapter''s central responsibility?', '["the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers", "the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God"]'::jsonb, 'the Levites and the tribes assigning cities', 'The chapter repeatedly focuses on the Levites and the tribes assigning cities. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 21, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 2, 'In Joshua 21, which detail shows how the chapter''s message works out?', '["forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest"]'::jsonb, 'forty-eight cities with pasture lands were given to the Levites from tribal inheritances', 'That detail belongs in this chapter. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 21, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 2, 'In Joshua 21, which second detail clarifies the instruction or event?', '["the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them", "the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone"]'::jsonb, 'the Kohathites, Gershonites, and Merarites received cities according to their clans', 'This second detail is part of the chapter''s material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 21, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 2, 'In Joshua 21, which outcome follows from the chapter''s teaching or narrative?', '["not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal"]'::jsonb, 'not one word failed of all the good things the LORD had spoken to Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 21, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 2, 'In Joshua 21, what larger issue is being addressed?', '["the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders", "the eastern altar controversy", "the covenant renewal at Shechem"]'::jsonb, 'the Levitical cities and the LORD''s fulfilled promises', 'This chapter centers on the Levitical cities and the LORD''s fulfilled promises. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 21, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 2, 'In Joshua 21, which verse reference best anchors the chapter''s key point?', '["Joshua 21:1-45", "Joshua 23:1-16", "Joshua 22:1-34", "Joshua 24:1-33"]'::jsonb, 'Joshua 21:1-45', 'Those verses anchor the chapter''s central material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 21, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 3, 'What does Joshua 21 show about the meaning of the chapter''s central concern?', '["God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience", "zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness"]'::jsonb, 'God faithfully gives rest and keeps every promise', 'That theme best summarizes the chapter''s message. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 21 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 3, 'What does Joshua 21 suggest about the role of the Levites and the tribes assigning cities?', '["the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers", "the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God"]'::jsonb, 'the Levites and the tribes assigning cities', 'The chapter repeatedly focuses on the Levites and the tribes assigning cities. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 21 suggest about the role of the Levites and the tribes assigning cities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 3, 'How does Joshua 21 use this detail to shape its message: forty-eight cities with pasture lands were given to the Levites from tribal inheritances?', '["forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest"]'::jsonb, 'forty-eight cities with pasture lands were given to the Levites from tribal inheritances', 'That detail belongs in this chapter. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 21 use this detail to shape its message: forty-eight cities with pasture lands were given to the Levites from tribal inheritances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 3, 'How does Joshua 21 deepen its message through this added detail: the Kohathites, Gershonites, and Merarites received cities according to their clans?', '["the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them", "the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone"]'::jsonb, 'the Kohathites, Gershonites, and Merarites received cities according to their clans', 'This second detail is part of the chapter''s material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 21 deepen its message through this added detail: the Kohathites, Gershonites, and Merarites received cities according to their clans?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 3, 'What larger lesson is reinforced by the outcome in Joshua 21?', '["not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal"]'::jsonb, 'not one word failed of all the good things the LORD had spoken to Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 3, 'Which summary best captures the focus of Joshua 21?', '["the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders", "the eastern altar controversy", "the covenant renewal at Shechem"]'::jsonb, 'the Levitical cities and the LORD''s fulfilled promises', 'This chapter centers on the Levitical cities and the LORD''s fulfilled promises. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 3, 'Which verse reference most directly supports the central teaching of Joshua 21?', '["Joshua 21:1-45", "Joshua 23:1-16", "Joshua 22:1-34", "Joshua 24:1-33"]'::jsonb, 'Joshua 21:1-45', 'Those verses anchor the chapter''s central material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 4, 'How does Joshua 21 connect its main subject to Israel''s covenant life?', '["God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience", "zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness"]'::jsonb, 'God faithfully gives rest and keeps every promise', 'That theme best summarizes the chapter''s message. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 21 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 4, 'How does Joshua 21 position the Levites and the tribes assigning cities within the covenant community?', '["the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers", "the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God"]'::jsonb, 'the Levites and the tribes assigning cities', 'The chapter repeatedly focuses on the Levites and the tribes assigning cities. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 21 position the Levites and the tribes assigning cities within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 4, 'Why is this detail structurally important in Joshua 21: forty-eight cities with pasture lands were given to the Levites from tribal inheritances?', '["forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest"]'::jsonb, 'forty-eight cities with pasture lands were given to the Levites from tribal inheritances', 'That detail belongs in this chapter. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 21: forty-eight cities with pasture lands were given to the Levites from tribal inheritances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 21: the Kohathites, Gershonites, and Merarites received cities according to their clans?', '["the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them", "the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone"]'::jsonb, 'the Kohathites, Gershonites, and Merarites received cities according to their clans', 'This second detail is part of the chapter''s material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 21: the Kohathites, Gershonites, and Merarites received cities according to their clans?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 4, 'How does the outcome of Joshua 21 guide later action in Israel?', '["not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal"]'::jsonb, 'not one word failed of all the good things the LORD had spoken to Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 21 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 21?', '["the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders", "the eastern altar controversy", "the covenant renewal at Shechem"]'::jsonb, 'the Levitical cities and the LORD''s fulfilled promises', 'This chapter centers on the Levitical cities and the LORD''s fulfilled promises. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 4, 'Which verse reference best supports a synthesis reading of Joshua 21?', '["Joshua 21:1-45", "Joshua 23:1-16", "Joshua 22:1-34", "Joshua 24:1-33"]'::jsonb, 'Joshua 21:1-45', 'Those verses anchor the chapter''s central material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 5, 'What theological truth is emphasized by Joshua 21?', '["God faithfully gives rest and keeps every promise", "past faithfulness of God heightens the seriousness of future obedience", "zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness"]'::jsonb, 'God faithfully gives rest and keeps every promise', 'That theme best summarizes the chapter''s message. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 5, 'What does Joshua 21 reveal about the covenant role of the Levites and the tribes assigning cities?', '["the Levites and the tribes assigning cities", "Joshua addressing Israel''s elders, heads, judges, and officers", "the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God"]'::jsonb, 'the Levites and the tribes assigning cities', 'The chapter repeatedly focuses on the Levites and the tribes assigning cities. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 21 reveal about the covenant role of the Levites and the tribes assigning cities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 5, 'Why does this detail matter theologically in Joshua 21: forty-eight cities with pasture lands were given to the Levites from tribal inheritances?', '["forty-eight cities with pasture lands were given to the Levites from tribal inheritances", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest"]'::jsonb, 'forty-eight cities with pasture lands were given to the Levites from tribal inheritances', 'That detail belongs in this chapter. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 21: forty-eight cities with pasture lands were given to the Levites from tribal inheritances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 5, 'How does this second detail sharpen the theological meaning of Joshua 21: the Kohathites, Gershonites, and Merarites received cities according to their clans?', '["the Kohathites, Gershonites, and Merarites received cities according to their clans", "he warned that if they turned back, the nations would become snares and thorns to them", "the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone"]'::jsonb, 'the Kohathites, Gershonites, and Merarites received cities according to their clans', 'This second detail is part of the chapter''s material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 21: the Kohathites, Gershonites, and Merarites received cities according to their clans?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 5, 'What enduring implication comes from the outcome in Joshua 21?', '["not one word failed of all the good things the LORD had spoken to Israel", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal"]'::jsonb, 'not one word failed of all the good things the LORD had spoken to Israel', 'That is the chapter''s stated outcome or practical effect. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 5, 'Which statement best expresses the theological burden of Joshua 21?', '["the Levitical cities and the LORD''s fulfilled promises", "Joshua''s farewell warning to the leaders", "the eastern altar controversy", "the covenant renewal at Shechem"]'::jsonb, 'the Levitical cities and the LORD''s fulfilled promises', 'This chapter centers on the Levitical cities and the LORD''s fulfilled promises. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 21, 5, 'Which verse reference best anchors the theological center of Joshua 21?', '["Joshua 21:1-45", "Joshua 23:1-16", "Joshua 22:1-34", "Joshua 24:1-33"]'::jsonb, 'Joshua 21:1-45', 'Those verses anchor the chapter''s central material. (Joshua 21:1-45)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 1, 'According to Joshua 22, what is the main subject of the chapter?', '["the eastern altar controversy", "the covenant renewal at Shechem", "Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses"]'::jsonb, 'the eastern altar controversy', 'This chapter centers on the eastern altar controversy. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 22, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 1, 'According to Joshua 22, which group or people are most directly involved?', '["the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God", "Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan"]'::jsonb, 'the eastern tribes, Phinehas, and the western tribes', 'The chapter repeatedly focuses on the eastern tribes, Phinehas, and the western tribes. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 22, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 1, 'According to Joshua 22, which detail belongs in this chapter?', '["Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him"]'::jsonb, 'Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home', 'That detail belongs in this chapter. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 22, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 1, 'According to Joshua 22, what additional detail is specifically included?', '["the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone", "he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions"]'::jsonb, 'the altar was explained as a witness rather than a rival sacrificial site', 'This second detail is part of the chapter''s material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 22, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 1, 'According to Joshua 22, what result or outcome is emphasized?', '["civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days"]'::jsonb, 'civil war was avoided when the altar was understood rightly', 'That is the chapter''s stated outcome or practical effect. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 22, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 1, 'According to Joshua 22, which theme best fits the chapter?', '["zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness", "past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word"]'::jsonb, 'zeal for true worship must be joined with careful hearing', 'That theme best summarizes the chapter''s message. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 22, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 1, 'According to Joshua 22, which verse reference matches the chapter''s core material?', '["Joshua 22:1-34", "Joshua 24:1-33", "Joshua 23:1-16", "Joshua 1:1-9, 10-18"]'::jsonb, 'Joshua 22:1-34', 'Those verses anchor the chapter''s central material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 22, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 2, 'In Joshua 22, what purpose is served by the chapter''s main command or event?', '["zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness", "past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word"]'::jsonb, 'zeal for true worship must be joined with careful hearing', 'That theme best summarizes the chapter''s message. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 22, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 2, 'In Joshua 22, which group carries the chapter''s central responsibility?', '["the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God", "Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan"]'::jsonb, 'the eastern tribes, Phinehas, and the western tribes', 'The chapter repeatedly focuses on the eastern tribes, Phinehas, and the western tribes. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 22, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 2, 'In Joshua 22, which detail shows how the chapter''s message works out?', '["Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him"]'::jsonb, 'Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home', 'That detail belongs in this chapter. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 22, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 2, 'In Joshua 22, which second detail clarifies the instruction or event?', '["the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone", "he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions"]'::jsonb, 'the altar was explained as a witness rather than a rival sacrificial site', 'This second detail is part of the chapter''s material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 22, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 2, 'In Joshua 22, which outcome follows from the chapter''s teaching or narrative?', '["civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days"]'::jsonb, 'civil war was avoided when the altar was understood rightly', 'That is the chapter''s stated outcome or practical effect. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 22, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 2, 'In Joshua 22, what larger issue is being addressed?', '["the eastern altar controversy", "the covenant renewal at Shechem", "Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses"]'::jsonb, 'the eastern altar controversy', 'This chapter centers on the eastern altar controversy. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 22, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 2, 'In Joshua 22, which verse reference best anchors the chapter''s key point?', '["Joshua 22:1-34", "Joshua 24:1-33", "Joshua 23:1-16", "Joshua 1:1-9, 10-18"]'::jsonb, 'Joshua 22:1-34', 'Those verses anchor the chapter''s central material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 22, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 3, 'What does Joshua 22 show about the meaning of the chapter''s central concern?', '["zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness", "past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word"]'::jsonb, 'zeal for true worship must be joined with careful hearing', 'That theme best summarizes the chapter''s message. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 22 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 3, 'What does Joshua 22 suggest about the role of the eastern tribes, Phinehas, and the western tribes?', '["the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God", "Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan"]'::jsonb, 'the eastern tribes, Phinehas, and the western tribes', 'The chapter repeatedly focuses on the eastern tribes, Phinehas, and the western tribes. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 22 suggest about the role of the eastern tribes, Phinehas, and the western tribes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 3, 'How does Joshua 22 use this detail to shape its message: Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home?', '["Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him"]'::jsonb, 'Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home', 'That detail belongs in this chapter. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 22 use this detail to shape its message: Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 3, 'How does Joshua 22 deepen its message through this added detail: the altar was explained as a witness rather than a rival sacrificial site?', '["the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone", "he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions"]'::jsonb, 'the altar was explained as a witness rather than a rival sacrificial site', 'This second detail is part of the chapter''s material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 22 deepen its message through this added detail: the altar was explained as a witness rather than a rival sacrificial site?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 3, 'What larger lesson is reinforced by the outcome in Joshua 22?', '["civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days"]'::jsonb, 'civil war was avoided when the altar was understood rightly', 'That is the chapter''s stated outcome or practical effect. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 3, 'Which summary best captures the focus of Joshua 22?', '["the eastern altar controversy", "the covenant renewal at Shechem", "Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses"]'::jsonb, 'the eastern altar controversy', 'This chapter centers on the eastern altar controversy. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 3, 'Which verse reference most directly supports the central teaching of Joshua 22?', '["Joshua 22:1-34", "Joshua 24:1-33", "Joshua 23:1-16", "Joshua 1:1-9, 10-18"]'::jsonb, 'Joshua 22:1-34', 'Those verses anchor the chapter''s central material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 4, 'How does Joshua 22 connect its main subject to Israel''s covenant life?', '["zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness", "past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word"]'::jsonb, 'zeal for true worship must be joined with careful hearing', 'That theme best summarizes the chapter''s message. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 22 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 4, 'How does Joshua 22 position the eastern tribes, Phinehas, and the western tribes within the covenant community?', '["the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God", "Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan"]'::jsonb, 'the eastern tribes, Phinehas, and the western tribes', 'The chapter repeatedly focuses on the eastern tribes, Phinehas, and the western tribes. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 22 position the eastern tribes, Phinehas, and the western tribes within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 4, 'Why is this detail structurally important in Joshua 22: Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home?', '["Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him"]'::jsonb, 'Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home', 'That detail belongs in this chapter. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 22: Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 22: the altar was explained as a witness rather than a rival sacrificial site?', '["the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone", "he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions"]'::jsonb, 'the altar was explained as a witness rather than a rival sacrificial site', 'This second detail is part of the chapter''s material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 22: the altar was explained as a witness rather than a rival sacrificial site?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 4, 'How does the outcome of Joshua 22 guide later action in Israel?', '["civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days"]'::jsonb, 'civil war was avoided when the altar was understood rightly', 'That is the chapter''s stated outcome or practical effect. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 22 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 22?', '["the eastern altar controversy", "the covenant renewal at Shechem", "Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses"]'::jsonb, 'the eastern altar controversy', 'This chapter centers on the eastern altar controversy. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 4, 'Which verse reference best supports a synthesis reading of Joshua 22?', '["Joshua 22:1-34", "Joshua 24:1-33", "Joshua 23:1-16", "Joshua 1:1-9, 10-18"]'::jsonb, 'Joshua 22:1-34', 'Those verses anchor the chapter''s central material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 5, 'What theological truth is emphasized by Joshua 22?', '["zeal for true worship must be joined with careful hearing", "covenant history calls for decisive allegiance and memorial witness", "past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word"]'::jsonb, 'zeal for true worship must be joined with careful hearing', 'That theme best summarizes the chapter''s message. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 5, 'What does Joshua 22 reveal about the covenant role of the eastern tribes, Phinehas, and the western tribes?', '["the eastern tribes, Phinehas, and the western tribes", "Joshua, all Israel, and the witnesses assembled before God", "Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan"]'::jsonb, 'the eastern tribes, Phinehas, and the western tribes', 'The chapter repeatedly focuses on the eastern tribes, Phinehas, and the western tribes. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 22 reveal about the covenant role of the eastern tribes, Phinehas, and the western tribes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 5, 'Why does this detail matter theologically in Joshua 22: Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home?', '["Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him"]'::jsonb, 'Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home', 'That detail belongs in this chapter. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 22: Reuben, Gad, and half Manasseh built a large altar by the Jordan after returning home?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 5, 'How does this second detail sharpen the theological meaning of Joshua 22: the altar was explained as a witness rather than a rival sacrificial site?', '["the altar was explained as a witness rather than a rival sacrificial site", "the people declared that they would serve the LORD and Joshua set up a witness stone", "he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions"]'::jsonb, 'the altar was explained as a witness rather than a rival sacrificial site', 'This second detail is part of the chapter''s material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 22: the altar was explained as a witness rather than a rival sacrificial site?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 5, 'What enduring implication comes from the outcome in Joshua 22?', '["civil war was avoided when the altar was understood rightly", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days"]'::jsonb, 'civil war was avoided when the altar was understood rightly', 'That is the chapter''s stated outcome or practical effect. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 5, 'Which statement best expresses the theological burden of Joshua 22?', '["the eastern altar controversy", "the covenant renewal at Shechem", "Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses"]'::jsonb, 'the eastern altar controversy', 'This chapter centers on the eastern altar controversy. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 22, 5, 'Which verse reference best anchors the theological center of Joshua 22?', '["Joshua 22:1-34", "Joshua 24:1-33", "Joshua 23:1-16", "Joshua 1:1-9, 10-18"]'::jsonb, 'Joshua 22:1-34', 'Those verses anchor the chapter''s central material. (Joshua 22:1-34)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 1, 'According to Joshua 23, what is the main subject of the chapter?', '["Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses", "the covenant renewal at Shechem", "Rahab hiding the spies in Jericho"]'::jsonb, 'Joshua''s farewell warning to the leaders', 'This chapter centers on Joshua''s farewell warning to the leaders. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 23, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 1, 'According to Joshua 23, which group or people are most directly involved?', '["Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan", "Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho"]'::jsonb, 'Joshua addressing Israel''s elders, heads, judges, and officers', 'The chapter repeatedly focuses on Joshua addressing Israel''s elders, heads, judges, and officers. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 23, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 1, 'According to Joshua 23, which detail belongs in this chapter?', '["Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax"]'::jsonb, 'Joshua urged the people to cling to the LORD and not mix with the remaining nations', 'That detail belongs in this chapter. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 23, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 1, 'According to Joshua 23, what additional detail is specifically included?', '["he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared"]'::jsonb, 'he warned that if they turned back, the nations would become snares and thorns to them', 'This second detail is part of the chapter''s material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 23, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 1, 'According to Joshua 23, what result or outcome is emphasized?', '["Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand"]'::jsonb, 'Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy', 'That is the chapter''s stated outcome or practical effect. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 23, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 1, 'According to Joshua 23, which theme best fits the chapter?', '["past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word", "covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations"]'::jsonb, 'past faithfulness of God heightens the seriousness of future obedience', 'That theme best summarizes the chapter''s message. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 23, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 1, 'According to Joshua 23, which verse reference matches the chapter''s core material?', '["Joshua 23:1-16", "Joshua 1:1-9, 10-18", "Joshua 24:1-33", "Joshua 2:1-24"]'::jsonb, 'Joshua 23:1-16', 'Those verses anchor the chapter''s central material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 23, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 2, 'In Joshua 23, what purpose is served by the chapter''s main command or event?', '["past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word", "covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations"]'::jsonb, 'past faithfulness of God heightens the seriousness of future obedience', 'That theme best summarizes the chapter''s message. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 23, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 2, 'In Joshua 23, which group carries the chapter''s central responsibility?', '["Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan", "Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho"]'::jsonb, 'Joshua addressing Israel''s elders, heads, judges, and officers', 'The chapter repeatedly focuses on Joshua addressing Israel''s elders, heads, judges, and officers. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 23, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 2, 'In Joshua 23, which detail shows how the chapter''s message works out?', '["Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax"]'::jsonb, 'Joshua urged the people to cling to the LORD and not mix with the remaining nations', 'That detail belongs in this chapter. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 23, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 2, 'In Joshua 23, which second detail clarifies the instruction or event?', '["he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared"]'::jsonb, 'he warned that if they turned back, the nations would become snares and thorns to them', 'This second detail is part of the chapter''s material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 23, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 2, 'In Joshua 23, which outcome follows from the chapter''s teaching or narrative?', '["Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand"]'::jsonb, 'Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy', 'That is the chapter''s stated outcome or practical effect. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 23, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 2, 'In Joshua 23, what larger issue is being addressed?', '["Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses", "the covenant renewal at Shechem", "Rahab hiding the spies in Jericho"]'::jsonb, 'Joshua''s farewell warning to the leaders', 'This chapter centers on Joshua''s farewell warning to the leaders. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 23, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 2, 'In Joshua 23, which verse reference best anchors the chapter''s key point?', '["Joshua 23:1-16", "Joshua 1:1-9, 10-18", "Joshua 24:1-33", "Joshua 2:1-24"]'::jsonb, 'Joshua 23:1-16', 'Those verses anchor the chapter''s central material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 23, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 3, 'What does Joshua 23 show about the meaning of the chapter''s central concern?', '["past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word", "covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations"]'::jsonb, 'past faithfulness of God heightens the seriousness of future obedience', 'That theme best summarizes the chapter''s message. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 23 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 3, 'What does Joshua 23 suggest about the role of Joshua addressing Israel''s elders, heads, judges, and officers?', '["Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan", "Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho"]'::jsonb, 'Joshua addressing Israel''s elders, heads, judges, and officers', 'The chapter repeatedly focuses on Joshua addressing Israel''s elders, heads, judges, and officers. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 23 suggest about the role of Joshua addressing Israel''s elders, heads, judges, and officers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 3, 'How does Joshua 23 use this detail to shape its message: Joshua urged the people to cling to the LORD and not mix with the remaining nations?', '["Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax"]'::jsonb, 'Joshua urged the people to cling to the LORD and not mix with the remaining nations', 'That detail belongs in this chapter. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 23 use this detail to shape its message: Joshua urged the people to cling to the LORD and not mix with the remaining nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 3, 'How does Joshua 23 deepen its message through this added detail: he warned that if they turned back, the nations would become snares and thorns to them?', '["he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared"]'::jsonb, 'he warned that if they turned back, the nations would become snares and thorns to them', 'This second detail is part of the chapter''s material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 23 deepen its message through this added detail: he warned that if they turned back, the nations would become snares and thorns to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 3, 'What larger lesson is reinforced by the outcome in Joshua 23?', '["Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand"]'::jsonb, 'Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy', 'That is the chapter''s stated outcome or practical effect. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 3, 'Which summary best captures the focus of Joshua 23?', '["Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses", "the covenant renewal at Shechem", "Rahab hiding the spies in Jericho"]'::jsonb, 'Joshua''s farewell warning to the leaders', 'This chapter centers on Joshua''s farewell warning to the leaders. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 3, 'Which verse reference most directly supports the central teaching of Joshua 23?', '["Joshua 23:1-16", "Joshua 1:1-9, 10-18", "Joshua 24:1-33", "Joshua 2:1-24"]'::jsonb, 'Joshua 23:1-16', 'Those verses anchor the chapter''s central material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 4, 'How does Joshua 23 connect its main subject to Israel''s covenant life?', '["past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word", "covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations"]'::jsonb, 'past faithfulness of God heightens the seriousness of future obedience', 'That theme best summarizes the chapter''s message. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 23 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 4, 'How does Joshua 23 position Joshua addressing Israel''s elders, heads, judges, and officers within the covenant community?', '["Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan", "Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho"]'::jsonb, 'Joshua addressing Israel''s elders, heads, judges, and officers', 'The chapter repeatedly focuses on Joshua addressing Israel''s elders, heads, judges, and officers. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 23 position Joshua addressing Israel''s elders, heads, judges, and officers within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 4, 'Why is this detail structurally important in Joshua 23: Joshua urged the people to cling to the LORD and not mix with the remaining nations?', '["Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax"]'::jsonb, 'Joshua urged the people to cling to the LORD and not mix with the remaining nations', 'That detail belongs in this chapter. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 23: Joshua urged the people to cling to the LORD and not mix with the remaining nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 23: he warned that if they turned back, the nations would become snares and thorns to them?', '["he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared"]'::jsonb, 'he warned that if they turned back, the nations would become snares and thorns to them', 'This second detail is part of the chapter''s material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 23: he warned that if they turned back, the nations would become snares and thorns to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 4, 'How does the outcome of Joshua 23 guide later action in Israel?', '["Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand"]'::jsonb, 'Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy', 'That is the chapter''s stated outcome or practical effect. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 23 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 23?', '["Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses", "the covenant renewal at Shechem", "Rahab hiding the spies in Jericho"]'::jsonb, 'Joshua''s farewell warning to the leaders', 'This chapter centers on Joshua''s farewell warning to the leaders. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 4, 'Which verse reference best supports a synthesis reading of Joshua 23?', '["Joshua 23:1-16", "Joshua 1:1-9, 10-18", "Joshua 24:1-33", "Joshua 2:1-24"]'::jsonb, 'Joshua 23:1-16', 'Those verses anchor the chapter''s central material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 5, 'What theological truth is emphasized by Joshua 23?', '["past faithfulness of God heightens the seriousness of future obedience", "leadership succeeds when it is anchored in God''s presence and word", "covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations"]'::jsonb, 'past faithfulness of God heightens the seriousness of future obedience', 'That theme best summarizes the chapter''s message. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 5, 'What does Joshua 23 reveal about the covenant role of Joshua addressing Israel''s elders, heads, judges, and officers?', '["Joshua addressing Israel''s elders, heads, judges, and officers", "Joshua and Israel at the Jordan", "Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho"]'::jsonb, 'Joshua addressing Israel''s elders, heads, judges, and officers', 'The chapter repeatedly focuses on Joshua addressing Israel''s elders, heads, judges, and officers. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 23 reveal about the covenant role of Joshua addressing Israel''s elders, heads, judges, and officers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 5, 'Why does this detail matter theologically in Joshua 23: Joshua urged the people to cling to the LORD and not mix with the remaining nations?', '["Joshua urged the people to cling to the LORD and not mix with the remaining nations", "Joshua was told to be strong and courageous because the LORD would be with him", "Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax"]'::jsonb, 'Joshua urged the people to cling to the LORD and not mix with the remaining nations', 'That detail belongs in this chapter. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 23: Joshua urged the people to cling to the LORD and not mix with the remaining nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 5, 'How does this second detail sharpen the theological meaning of Joshua 23: he warned that if they turned back, the nations would become snares and thorns to them?', '["he warned that if they turned back, the nations would become snares and thorns to them", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared"]'::jsonb, 'he warned that if they turned back, the nations would become snares and thorns to them', 'This second detail is part of the chapter''s material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 23: he warned that if they turned back, the nations would become snares and thorns to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 5, 'What enduring implication comes from the outcome in Joshua 23?', '["Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy", "the officers prepared the people to cross the Jordan in three days", "Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand"]'::jsonb, 'Joshua set before the leaders the certainty of both fulfilled promises and coming judgment for apostasy', 'That is the chapter''s stated outcome or practical effect. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 5, 'Which statement best expresses the theological burden of Joshua 23?', '["Joshua''s farewell warning to the leaders", "Joshua commissioned to lead Israel after Moses", "the covenant renewal at Shechem", "Rahab hiding the spies in Jericho"]'::jsonb, 'Joshua''s farewell warning to the leaders', 'This chapter centers on Joshua''s farewell warning to the leaders. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 23, 5, 'Which verse reference best anchors the theological center of Joshua 23?', '["Joshua 23:1-16", "Joshua 1:1-9, 10-18", "Joshua 24:1-33", "Joshua 2:1-24"]'::jsonb, 'Joshua 23:1-16', 'Those verses anchor the chapter''s central material. (Joshua 23:1-16)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 1, 'According to Joshua 24, what is the main subject of the chapter?', '["the covenant renewal at Shechem", "Rahab hiding the spies in Jericho", "Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River"]'::jsonb, 'the covenant renewal at Shechem', 'This chapter centers on the covenant renewal at Shechem. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 24, what is the main subject of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 1, 'According to Joshua 24, which group or people are most directly involved?', '["Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho", "Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel"]'::jsonb, 'Joshua, all Israel, and the witnesses assembled before God', 'The chapter repeatedly focuses on Joshua, all Israel, and the witnesses assembled before God. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 24, which group or people are most directly involved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 1, 'According to Joshua 24, which detail belongs in this chapter?', '["Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax", "Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off"]'::jsonb, 'Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest', 'That detail belongs in this chapter. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 24, which detail belongs in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 1, 'According to Joshua 24, what additional detail is specifically included?', '["the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders"]'::jsonb, 'the people declared that they would serve the LORD and Joshua set up a witness stone', 'This second detail is part of the chapter''s material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 24, what additional detail is specifically included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 1, 'According to Joshua 24, what result or outcome is emphasized?', '["Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand", "the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho"]'::jsonb, 'Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal', 'That is the chapter''s stated outcome or practical effect. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 24, what result or outcome is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 1, 'According to Joshua 24, which theme best fits the chapter?', '["covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations", "leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence"]'::jsonb, 'covenant history calls for decisive allegiance and memorial witness', 'That theme best summarizes the chapter''s message. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 24, which theme best fits the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 1, 'According to Joshua 24, which verse reference matches the chapter''s core material?', '["Joshua 24:1-33", "Joshua 2:1-24", "Joshua 1:1-9, 10-18", "Joshua 3:5-17"]'::jsonb, 'Joshua 24:1-33', 'Those verses anchor the chapter''s central material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Joshua 24, which verse reference matches the chapter''s core material?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 2, 'In Joshua 24, what purpose is served by the chapter''s main command or event?', '["covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations", "leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence"]'::jsonb, 'covenant history calls for decisive allegiance and memorial witness', 'That theme best summarizes the chapter''s message. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 24, what purpose is served by the chapter''s main command or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 2, 'In Joshua 24, which group carries the chapter''s central responsibility?', '["Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho", "Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel"]'::jsonb, 'Joshua, all Israel, and the witnesses assembled before God', 'The chapter repeatedly focuses on Joshua, all Israel, and the witnesses assembled before God. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 24, which group carries the chapter''s central responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 2, 'In Joshua 24, which detail shows how the chapter''s message works out?', '["Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax", "Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off"]'::jsonb, 'Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest', 'That detail belongs in this chapter. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 24, which detail shows how the chapter''s message works out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 2, 'In Joshua 24, which second detail clarifies the instruction or event?', '["the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders"]'::jsonb, 'the people declared that they would serve the LORD and Joshua set up a witness stone', 'This second detail is part of the chapter''s material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 24, which second detail clarifies the instruction or event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 2, 'In Joshua 24, which outcome follows from the chapter''s teaching or narrative?', '["Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand", "the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho"]'::jsonb, 'Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal', 'That is the chapter''s stated outcome or practical effect. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 24, which outcome follows from the chapter''s teaching or narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 2, 'In Joshua 24, what larger issue is being addressed?', '["the covenant renewal at Shechem", "Rahab hiding the spies in Jericho", "Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River"]'::jsonb, 'the covenant renewal at Shechem', 'This chapter centers on the covenant renewal at Shechem. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 24, what larger issue is being addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 2, 'In Joshua 24, which verse reference best anchors the chapter''s key point?', '["Joshua 24:1-33", "Joshua 2:1-24", "Joshua 1:1-9, 10-18", "Joshua 3:5-17"]'::jsonb, 'Joshua 24:1-33', 'Those verses anchor the chapter''s central material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Joshua 24, which verse reference best anchors the chapter''s key point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 3, 'What does Joshua 24 show about the meaning of the chapter''s central concern?', '["covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations", "leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence"]'::jsonb, 'covenant history calls for decisive allegiance and memorial witness', 'That theme best summarizes the chapter''s message. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 24 show about the meaning of the chapter''s central concern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 3, 'What does Joshua 24 suggest about the role of Joshua, all Israel, and the witnesses assembled before God?', '["Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho", "Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel"]'::jsonb, 'Joshua, all Israel, and the witnesses assembled before God', 'The chapter repeatedly focuses on Joshua, all Israel, and the witnesses assembled before God. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Joshua 24 suggest about the role of Joshua, all Israel, and the witnesses assembled before God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 3, 'How does Joshua 24 use this detail to shape its message: Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest?', '["Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax", "Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off"]'::jsonb, 'Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest', 'That detail belongs in this chapter. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 24 use this detail to shape its message: Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 3, 'How does Joshua 24 deepen its message through this added detail: the people declared that they would serve the LORD and Joshua set up a witness stone?', '["the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders"]'::jsonb, 'the people declared that they would serve the LORD and Joshua set up a witness stone', 'This second detail is part of the chapter''s material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Joshua 24 deepen its message through this added detail: the people declared that they would serve the LORD and Joshua set up a witness stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 3, 'What larger lesson is reinforced by the outcome in Joshua 24?', '["Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand", "the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho"]'::jsonb, 'Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal', 'That is the chapter''s stated outcome or practical effect. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What larger lesson is reinforced by the outcome in Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 3, 'Which summary best captures the focus of Joshua 24?', '["the covenant renewal at Shechem", "Rahab hiding the spies in Jericho", "Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River"]'::jsonb, 'the covenant renewal at Shechem', 'This chapter centers on the covenant renewal at Shechem. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which summary best captures the focus of Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 3, 'Which verse reference most directly supports the central teaching of Joshua 24?', '["Joshua 24:1-33", "Joshua 2:1-24", "Joshua 1:1-9, 10-18", "Joshua 3:5-17"]'::jsonb, 'Joshua 24:1-33', 'Those verses anchor the chapter''s central material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which verse reference most directly supports the central teaching of Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 4, 'How does Joshua 24 connect its main subject to Israel''s covenant life?', '["covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations", "leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence"]'::jsonb, 'covenant history calls for decisive allegiance and memorial witness', 'That theme best summarizes the chapter''s message. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 24 connect its main subject to Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 4, 'How does Joshua 24 position Joshua, all Israel, and the witnesses assembled before God within the covenant community?', '["Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho", "Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel"]'::jsonb, 'Joshua, all Israel, and the witnesses assembled before God', 'The chapter repeatedly focuses on Joshua, all Israel, and the witnesses assembled before God. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joshua 24 position Joshua, all Israel, and the witnesses assembled before God within the covenant community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 4, 'Why is this detail structurally important in Joshua 24: Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest?', '["Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax", "Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off"]'::jsonb, 'Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest', 'That detail belongs in this chapter. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is this detail structurally important in Joshua 24: Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 4, 'How does this added detail shape the chapter''s covenant logic in Joshua 24: the people declared that they would serve the LORD and Joshua set up a witness stone?', '["the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders"]'::jsonb, 'the people declared that they would serve the LORD and Joshua set up a witness stone', 'This second detail is part of the chapter''s material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this added detail shape the chapter''s covenant logic in Joshua 24: the people declared that they would serve the LORD and Joshua set up a witness stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 4, 'How does the outcome of Joshua 24 guide later action in Israel?', '["Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand", "the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho"]'::jsonb, 'Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal', 'That is the chapter''s stated outcome or practical effect. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the outcome of Joshua 24 guide later action in Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 4, 'Which statement best synthesizes the chapter''s main concern in Joshua 24?', '["the covenant renewal at Shechem", "Rahab hiding the spies in Jericho", "Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River"]'::jsonb, 'the covenant renewal at Shechem', 'This chapter centers on the covenant renewal at Shechem. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which statement best synthesizes the chapter''s main concern in Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 4, 'Which verse reference best supports a synthesis reading of Joshua 24?', '["Joshua 24:1-33", "Joshua 2:1-24", "Joshua 1:1-9, 10-18", "Joshua 3:5-17"]'::jsonb, 'Joshua 24:1-33', 'Those verses anchor the chapter''s central material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Which verse reference best supports a synthesis reading of Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 5, 'What theological truth is emphasized by Joshua 24?', '["covenant history calls for decisive allegiance and memorial witness", "faith recognizes God''s rule even among the nations", "leadership succeeds when it is anchored in God''s presence and word", "God opens the way for His people through His holy presence"]'::jsonb, 'covenant history calls for decisive allegiance and memorial witness', 'That theme best summarizes the chapter''s message. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological truth is emphasized by Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 5, 'What does Joshua 24 reveal about the covenant role of Joshua, all Israel, and the witnesses assembled before God?', '["Joshua, all Israel, and the witnesses assembled before God", "the two spies, Rahab, and the king of Jericho", "Joshua and Israel at the Jordan", "Joshua, the priests, and all Israel"]'::jsonb, 'Joshua, all Israel, and the witnesses assembled before God', 'The chapter repeatedly focuses on Joshua, all Israel, and the witnesses assembled before God. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Joshua 24 reveal about the covenant role of Joshua, all Israel, and the witnesses assembled before God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 5, 'Why does this detail matter theologically in Joshua 24: Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest?', '["Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest", "Rahab hid the spies on her roof under stalks of flax", "Joshua was told to be strong and courageous because the LORD would be with him", "the priests carrying the ark stood in the Jordan while the waters were cut off"]'::jsonb, 'Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest', 'That detail belongs in this chapter. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does this detail matter theologically in Joshua 24: Joshua rehearsed the LORD''s acts from Abraham through the exodus and conquest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 5, 'How does this second detail sharpen the theological meaning of Joshua 24: the people declared that they would serve the LORD and Joshua set up a witness stone?', '["the people declared that they would serve the LORD and Joshua set up a witness stone", "a scarlet cord was agreed upon as the sign for Rahab''s household to be spared", "the Book of the Law was to remain in Joshua''s mouth and guide his actions", "the people were told to sanctify themselves before the LORD worked wonders"]'::jsonb, 'the people declared that they would serve the LORD and Joshua set up a witness stone', 'This second detail is part of the chapter''s material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this second detail sharpen the theological meaning of Joshua 24: the people declared that they would serve the LORD and Joshua set up a witness stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 5, 'What enduring implication comes from the outcome in Joshua 24?', '["Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal", "the spies returned convinced that the LORD had given the land into Israel''s hand", "the officers prepared the people to cross the Jordan in three days", "Israel crossed on dry ground opposite Jericho"]'::jsonb, 'Joshua died, Joseph''s bones were buried, and Eleazar also died after covenant renewal', 'That is the chapter''s stated outcome or practical effect. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What enduring implication comes from the outcome in Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 5, 'Which statement best expresses the theological burden of Joshua 24?', '["the covenant renewal at Shechem", "Rahab hiding the spies in Jericho", "Joshua commissioned to lead Israel after Moses", "Israel crossing the Jordan River"]'::jsonb, 'the covenant renewal at Shechem', 'This chapter centers on the covenant renewal at Shechem. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which statement best expresses the theological burden of Joshua 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 6, 24, 5, 'Which verse reference best anchors the theological center of Joshua 24?', '["Joshua 24:1-33", "Joshua 2:1-24", "Joshua 1:1-9, 10-18", "Joshua 3:5-17"]'::jsonb, 'Joshua 24:1-33', 'Those verses anchor the chapter''s central material. (Joshua 24:1-33)'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 6
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which verse reference best anchors the theological center of Joshua 24?'
);
