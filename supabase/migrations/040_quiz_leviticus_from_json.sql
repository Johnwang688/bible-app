-- ============================================================================
-- LOGOS LIGHT - Leviticus (book 3) quiz questions from quiz-questions/leviticus.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 1, 'From where did the LORD call to Moses in Leviticus 1?', '["Mount Sinai", "The tent of meeting", "Aaron''s house", "The court of the tabernacle"]'::jsonb, 'The tent of meeting', 'The chapter begins with God directing sacrifice from the tent of meeting. (Leviticus 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'From where did the LORD call to Moses in Leviticus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 1, 'How much of the burnt offering was burned on the altar?', '["Only the fat", "Only the blood and kidneys", "The whole animal", "Everything except the head"]'::jsonb, 'The whole animal', 'The burnt offering ascended wholly to God as a sweet savor. (Leviticus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'How much of the burnt offering was burned on the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 1, 'What kind of animal could be brought from the herd for a burnt offering?', '["A female with young", "Any firstborn animal", "A male without blemish", "A lame male"]'::jsonb, 'A male without blemish', 'The worshiper had to bring an acceptable animal without defect. (Leviticus 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of animal could be brought from the herd for a burnt offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 1, 'What parts of the burnt offering were washed with water?', '["The head and the fat", "The inwards and the legs", "The hide and the horns", "The kidneys and the liver"]'::jsonb, 'The inwards and the legs', 'These parts were washed before the whole offering was burned. (Leviticus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What parts of the burnt offering were washed with water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 1, 'What was the worshiper to do with his hand on the burnt offering?', '["Wash it in the laver", "Raise it toward heaven", "Place it on the altar wood", "Lay it on the head of the offering"]'::jsonb, 'Lay it on the head of the offering', 'The laying on of the hand identified the worshiper with the sacrifice for atonement. (Leviticus 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the worshiper to do with his hand on the burnt offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 1, 'When a bird was offered for a burnt offering, what was not to be done to it?', '["It was not to be washed with water", "It was not to be salted", "It was not to be burned on wood", "It was not to be divided apart"]'::jsonb, 'It was not to be divided apart', 'The priest was to rend the bird by the wings but not sever it completely. (Leviticus 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'When a bird was offered for a burnt offering, what was not to be done to it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 1, 'Where was the bull''s blood sprinkled in the burnt offering ritual?', '["Around the altar that is at the door of the tent of meeting", "On the mercy seat inside the veil", "On the horns of the incense altar", "On the priest''s right ear"]'::jsonb, 'Around the altar that is at the door of the tent of meeting', 'The blood was applied at the altar of burnt offering in the sanctuary court. (Leviticus 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was the bull''s blood sprinkled in the burnt offering ritual?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 2, 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:1)', '["Mount Sinai", "The tent of meeting", "Aaron''s house", "The court of the tabernacle"]'::jsonb, 'The tent of meeting', 'The chapter begins with God directing sacrifice from the tent of meeting. That detail is part of the burnt offering instructions in Leviticus 1:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 2, 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:17)', '["It was not to be washed with water", "It was not to be salted", "It was not to be burned on wood", "It was not to be divided apart"]'::jsonb, 'It was not to be divided apart', 'The priest was to rend the bird by the wings but not sever it completely. That detail is part of the burnt offering instructions in Leviticus 1:17.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:17)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 2, 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:3)', '["A female with young", "Any firstborn animal", "A male without blemish", "A lame male"]'::jsonb, 'A male without blemish', 'The worshiper had to bring an acceptable animal without defect. That detail is part of the burnt offering instructions in Leviticus 1:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 2, 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:4)', '["Wash it in the laver", "Raise it toward heaven", "Place it on the altar wood", "Lay it on the head of the offering"]'::jsonb, 'Lay it on the head of the offering', 'The laying on of the hand identified the worshiper with the sacrifice for atonement. That detail is part of the burnt offering instructions in Leviticus 1:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 2, 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:5)', '["Around the altar that is at the door of the tent of meeting", "On the mercy seat inside the veil", "On the horns of the incense altar", "On the priest''s right ear"]'::jsonb, 'Around the altar that is at the door of the tent of meeting', 'The blood was applied at the altar of burnt offering in the sanctuary court. That detail is part of the burnt offering instructions in Leviticus 1:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 2, 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:9)', '["The head and the fat", "The inwards and the legs", "The hide and the horns", "The kidneys and the liver"]'::jsonb, 'The inwards and the legs', 'These parts were washed before the whole offering was burned. That detail is part of the burnt offering instructions in Leviticus 1:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:9)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 2, 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:9)', '["Only the fat", "Only the blood and kidneys", "The whole animal", "Everything except the head"]'::jsonb, 'The whole animal', 'The burnt offering ascended wholly to God as a sweet savor. That detail is part of the burnt offering instructions in Leviticus 1:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 1, which detail fits the burnt offering instructions? (Leviticus 1:9)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 3, 'In Leviticus 1, what does this detail chiefly emphasize: a male without blemish?', '["That ritual details were optional once the offering began", "The requirement stresses that what is offered to God must be whole.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The requirement stresses that what is offered to God must be whole.', 'The requirement stresses that what is offered to God must be whole. The worshiper had to bring an acceptable animal without defect. (Leviticus 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 1, what does this detail chiefly emphasize: a male without blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 3, 'In Leviticus 1, what does this detail chiefly emphasize: around the altar that is at the door of the tent of meeting?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Blood marks sacrificial approach to God."]'::jsonb, 'Blood marks sacrificial approach to God.', 'Blood marks sacrificial approach to God. The blood was applied at the altar of burnt offering in the sanctuary court. (Leviticus 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 1, what does this detail chiefly emphasize: around the altar that is at the door of the tent of meeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 3, 'In Leviticus 1, what does this detail chiefly emphasize: it was not to be divided apart?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Even the poorer worshiper''s offering followed precise holy procedure.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Even the poorer worshiper''s offering followed precise holy procedure.', 'Even the poorer worshiper''s offering followed precise holy procedure. The priest was to rend the bird by the wings but not sever it completely. (Leviticus 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 1, what does this detail chiefly emphasize: it was not to be divided apart?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 3, 'In Leviticus 1, what does this detail chiefly emphasize: lay it on the head of the offering?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Atonement involves a substitute standing in the worshiper''s place.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Atonement involves a substitute standing in the worshiper''s place.', 'Atonement involves a substitute standing in the worshiper''s place. The laying on of the hand identified the worshiper with the sacrifice for atonement. (Leviticus 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 1, what does this detail chiefly emphasize: lay it on the head of the offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 3, 'In Leviticus 1, what does this detail chiefly emphasize: the inwards and the legs?', '["The rite emphasizes purity even in the details of sacrifice.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The rite emphasizes purity even in the details of sacrifice.', 'The rite emphasizes purity even in the details of sacrifice. These parts were washed before the whole offering was burned. (Leviticus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 1, what does this detail chiefly emphasize: the inwards and the legs?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 3, 'In Leviticus 1, what does this detail chiefly emphasize: the tent of meeting?', '["Access to God begins with his own summons and instruction.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Access to God begins with his own summons and instruction.', 'Access to God begins with his own summons and instruction. The chapter begins with God directing sacrifice from the tent of meeting. (Leviticus 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 1, what does this detail chiefly emphasize: the tent of meeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 3, 'In Leviticus 1, what does this detail chiefly emphasize: the whole animal?', '["That ritual details were optional once the offering began", "The offering symbolizes total consecration to the LORD.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The offering symbolizes total consecration to the LORD.', 'The offering symbolizes total consecration to the LORD. The burnt offering ascended wholly to God as a sweet savor. (Leviticus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 1, what does this detail chiefly emphasize: the whole animal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 4, 'How does Leviticus 1 use the detail ''A male without blemish'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter ties acceptable worship to an unblemished substitute."]'::jsonb, 'The chapter ties acceptable worship to an unblemished substitute.', 'The chapter ties acceptable worship to an unblemished substitute. The detail appears in Leviticus 1:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 1 use the detail ''A male without blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 4, 'How does Leviticus 1 use the detail ''Around the altar that is at the door of the tent of meeting'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter locates atoning blood at the altar where approach is made.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter locates atoning blood at the altar where approach is made.', 'The chapter locates atoning blood at the altar where approach is made. The detail appears in Leviticus 1:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 1 use the detail ''Around the altar that is at the door of the tent of meeting'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 4, 'How does Leviticus 1 use the detail ''It was not to be divided apart'' within the chapter as a whole?', '["The chapter extends regulated access to rich and poor alike through distinct but valid offerings.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter extends regulated access to rich and poor alike through distinct but valid offerings.', 'The chapter extends regulated access to rich and poor alike through distinct but valid offerings. The detail appears in Leviticus 1:17.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 1 use the detail ''It was not to be divided apart'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 4, 'How does Leviticus 1 use the detail ''Lay it on the head of the offering'' within the chapter as a whole?', '["The chapter presents atonement through identification with the offering.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter presents atonement through identification with the offering.', 'The chapter presents atonement through identification with the offering. The detail appears in Leviticus 1:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 1 use the detail ''Lay it on the head of the offering'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 4, 'How does Leviticus 1 use the detail ''The inwards and the legs'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter shows that the offering presented to God was prepared carefully and cleanly.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that the offering presented to God was prepared carefully and cleanly.', 'The chapter shows that the offering presented to God was prepared carefully and cleanly. The detail appears in Leviticus 1:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 1 use the detail ''The inwards and the legs'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 4, 'How does Leviticus 1 use the detail ''The tent of meeting'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter frames worship as regulated by the LORD''s word from the sanctuary.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter frames worship as regulated by the LORD''s word from the sanctuary.', 'The chapter frames worship as regulated by the LORD''s word from the sanctuary. The detail appears in Leviticus 1:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 1 use the detail ''The tent of meeting'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 4, 'How does Leviticus 1 use the detail ''The whole animal'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter portrays complete surrender in the whole burnt offering."]'::jsonb, 'The chapter portrays complete surrender in the whole burnt offering.', 'The chapter portrays complete surrender in the whole burnt offering. The detail appears in Leviticus 1:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 1 use the detail ''The whole animal'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 5, 'What larger theological point in Leviticus 1 is reinforced by the detail ''A male without blemish''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The requirement stresses that what is offered to God must be whole."]'::jsonb, 'The requirement stresses that what is offered to God must be whole.', 'The requirement stresses that what is offered to God must be whole. In context, the chapter uses this detail as part of that wider point (Leviticus 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 1 is reinforced by the detail ''A male without blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 5, 'What larger theological point in Leviticus 1 is reinforced by the detail ''Around the altar that is at the door of the tent of meeting''?', '["That worship can be detached from covenant obedience", "Blood marks sacrificial approach to God.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Blood marks sacrificial approach to God.', 'Blood marks sacrificial approach to God. In context, the chapter uses this detail as part of that wider point (Leviticus 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 1 is reinforced by the detail ''Around the altar that is at the door of the tent of meeting''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 5, 'What larger theological point in Leviticus 1 is reinforced by the detail ''It was not to be divided apart''?', '["Even the poorer worshiper''s offering followed precise holy procedure.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Even the poorer worshiper''s offering followed precise holy procedure.', 'Even the poorer worshiper''s offering followed precise holy procedure. In context, the chapter uses this detail as part of that wider point (Leviticus 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 1 is reinforced by the detail ''It was not to be divided apart''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 5, 'What larger theological point in Leviticus 1 is reinforced by the detail ''Lay it on the head of the offering''?', '["Atonement involves a substitute standing in the worshiper''s place.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Atonement involves a substitute standing in the worshiper''s place.', 'Atonement involves a substitute standing in the worshiper''s place. In context, the chapter uses this detail as part of that wider point (Leviticus 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 1 is reinforced by the detail ''Lay it on the head of the offering''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 5, 'What larger theological point in Leviticus 1 is reinforced by the detail ''The inwards and the legs''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The rite emphasizes purity even in the details of sacrifice.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The rite emphasizes purity even in the details of sacrifice.', 'The rite emphasizes purity even in the details of sacrifice. In context, the chapter uses this detail as part of that wider point (Leviticus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 1 is reinforced by the detail ''The inwards and the legs''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 5, 'What larger theological point in Leviticus 1 is reinforced by the detail ''The tent of meeting''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Access to God begins with his own summons and instruction.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Access to God begins with his own summons and instruction.', 'Access to God begins with his own summons and instruction. In context, the chapter uses this detail as part of that wider point (Leviticus 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 1 is reinforced by the detail ''The tent of meeting''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 1, 5, 'What larger theological point in Leviticus 1 is reinforced by the detail ''The whole animal''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The offering symbolizes total consecration to the LORD."]'::jsonb, 'The offering symbolizes total consecration to the LORD.', 'The offering symbolizes total consecration to the LORD. In context, the chapter uses this detail as part of that wider point (Leviticus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 1 is reinforced by the detail ''The whole animal''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 1, 'How were firstfruits of green ears to be prepared for the offering?', '["Parched with fire and bruised out of fresh ears", "Boiled in milk and sweetened", "Ground with leaven and honey", "Hung to dry without oil"]'::jsonb, 'Parched with fire and bruised out of fresh ears', 'The firstfruits grain offering used roasted and crushed grain. (Leviticus 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'How were firstfruits of green ears to be prepared for the offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 1, 'What basic ingredient began the meal offering in Leviticus 2?', '["Barley loaves", "Crushed grapes", "Fine flour", "Boiled lentils"]'::jsonb, 'Fine flour', 'The grain offering began with fine flour along with oil and frankincense. (Leviticus 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What basic ingredient began the meal offering in Leviticus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 1, 'What else, along with leaven, was not to be burned in the meal offering?', '["Wine", "Milk", "Honey", "Olive fruit"]'::jsonb, 'Honey', 'Honey was excluded from offerings made by fire. (Leviticus 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What else, along with leaven, was not to be burned in the meal offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 1, 'What had to be added to every meal offering?', '["Cedars of Lebanon", "Water from the laver", "Incense from Egypt", "Salt of the covenant"]'::jsonb, 'Salt of the covenant', 'Every offering had to be seasoned with salt and not lack the salt of the covenant. (Leviticus 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What had to be added to every meal offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 1, 'What substance was forbidden in meal offerings made by fire?', '["Salt", "Leaven", "Oil", "Fine flour"]'::jsonb, 'Leaven', 'No meal offering burned to the LORD was to include leaven. (Leviticus 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What substance was forbidden in meal offerings made by fire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 1, 'What was put on the meal offering besides oil?', '["Myrrh", "Hyssop", "Ashes", "Frankincense"]'::jsonb, 'Frankincense', 'Frankincense accompanied the fine flour and oil as part of the offering. (Leviticus 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was put on the meal offering besides oil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 1, 'Who received what was left of the meal offering?', '["Aaron and his sons", "The tribal elders", "The offerer''s family", "The Levites only"]'::jsonb, 'Aaron and his sons', 'The remainder belonged to the priests as a most holy portion. (Leviticus 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who received what was left of the meal offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 2, 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:1)', '["Barley loaves", "Crushed grapes", "Fine flour", "Boiled lentils"]'::jsonb, 'Fine flour', 'The grain offering began with fine flour along with oil and frankincense. That detail is part of the meal offering instructions in Leviticus 2:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 2, 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:1)', '["Myrrh", "Hyssop", "Ashes", "Frankincense"]'::jsonb, 'Frankincense', 'Frankincense accompanied the fine flour and oil as part of the offering. That detail is part of the meal offering instructions in Leviticus 2:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 2, 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:11)', '["Salt", "Leaven", "Oil", "Fine flour"]'::jsonb, 'Leaven', 'No meal offering burned to the LORD was to include leaven. That detail is part of the meal offering instructions in Leviticus 2:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 2, 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:11)', '["Wine", "Milk", "Honey", "Olive fruit"]'::jsonb, 'Honey', 'Honey was excluded from offerings made by fire. That detail is part of the meal offering instructions in Leviticus 2:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 2, 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:13)', '["Cedars of Lebanon", "Water from the laver", "Incense from Egypt", "Salt of the covenant"]'::jsonb, 'Salt of the covenant', 'Every offering had to be seasoned with salt and not lack the salt of the covenant. That detail is part of the meal offering instructions in Leviticus 2:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:13)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 2, 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:14)', '["Parched with fire and bruised out of fresh ears", "Boiled in milk and sweetened", "Ground with leaven and honey", "Hung to dry without oil"]'::jsonb, 'Parched with fire and bruised out of fresh ears', 'The firstfruits grain offering used roasted and crushed grain. That detail is part of the meal offering instructions in Leviticus 2:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:14)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 2, 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:3)', '["Aaron and his sons", "The tribal elders", "The offerer''s family", "The Levites only"]'::jsonb, 'Aaron and his sons', 'The remainder belonged to the priests as a most holy portion. That detail is part of the meal offering instructions in Leviticus 2:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 2, which detail fits the meal offering instructions? (Leviticus 2:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 3, 'In Leviticus 2, what does this detail chiefly emphasize: aaron and his sons?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Holy gifts also sustained the priesthood that served the sanctuary."]'::jsonb, 'Holy gifts also sustained the priesthood that served the sanctuary.', 'Holy gifts also sustained the priesthood that served the sanctuary. The remainder belonged to the priests as a most holy portion. (Leviticus 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 2, what does this detail chiefly emphasize: aaron and his sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 3, 'In Leviticus 2, what does this detail chiefly emphasize: fine flour?', '["That ritual details were optional once the offering began", "The chapter presents a gift of cultivated produce to the LORD.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter presents a gift of cultivated produce to the LORD.', 'The chapter presents a gift of cultivated produce to the LORD. The grain offering began with fine flour along with oil and frankincense. (Leviticus 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 2, what does this detail chiefly emphasize: fine flour?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 3, 'In Leviticus 2, what does this detail chiefly emphasize: frankincense?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The offering was marked by fragrance and memorial before God.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The offering was marked by fragrance and memorial before God.', 'The offering was marked by fragrance and memorial before God. Frankincense accompanied the fine flour and oil as part of the offering. (Leviticus 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 2, what does this detail chiefly emphasize: frankincense?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 3, 'In Leviticus 2, what does this detail chiefly emphasize: honey?', '["That ritual details were optional once the offering began", "God set the terms for what counted as acceptable worship.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'God set the terms for what counted as acceptable worship.', 'God set the terms for what counted as acceptable worship. Honey was excluded from offerings made by fire. (Leviticus 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 2, what does this detail chiefly emphasize: honey?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 3, 'In Leviticus 2, what does this detail chiefly emphasize: leaven?', '["The chapter distinguishes holy offerings from ordinary food preparation.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter distinguishes holy offerings from ordinary food preparation.', 'The chapter distinguishes holy offerings from ordinary food preparation. No meal offering burned to the LORD was to include leaven. (Leviticus 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 2, what does this detail chiefly emphasize: leaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 3, 'In Leviticus 2, what does this detail chiefly emphasize: parched with fire and bruised out of fresh ears?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The chapter sanctifies the first produce of the land to God."]'::jsonb, 'The chapter sanctifies the first produce of the land to God.', 'The chapter sanctifies the first produce of the land to God. The firstfruits grain offering used roasted and crushed grain. (Leviticus 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 2, what does this detail chiefly emphasize: parched with fire and bruised out of fresh ears?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 3, 'In Leviticus 2, what does this detail chiefly emphasize: salt of the covenant?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The offering is linked to covenant fidelity.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The offering is linked to covenant fidelity.', 'The offering is linked to covenant fidelity. Every offering had to be seasoned with salt and not lack the salt of the covenant. (Leviticus 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 2, what does this detail chiefly emphasize: salt of the covenant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 4, 'How does Leviticus 2 use the detail ''Aaron and his sons'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter connects worship offerings with priestly provision.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter connects worship offerings with priestly provision.', 'The chapter connects worship offerings with priestly provision. The detail appears in Leviticus 2:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 2 use the detail ''Aaron and his sons'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 4, 'How does Leviticus 2 use the detail ''Fine flour'' within the chapter as a whole?', '["The chapter shows worship through a carefully prepared tribute rather than blood sacrifice.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows worship through a carefully prepared tribute rather than blood sacrifice.', 'The chapter shows worship through a carefully prepared tribute rather than blood sacrifice. The detail appears in Leviticus 2:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 2 use the detail ''Fine flour'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 4, 'How does Leviticus 2 use the detail ''Frankincense'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter frames the meal offering as a pleasing memorial gift.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter frames the meal offering as a pleasing memorial gift.', 'The chapter frames the meal offering as a pleasing memorial gift. The detail appears in Leviticus 2:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 2 use the detail ''Frankincense'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 4, 'How does Leviticus 2 use the detail ''Honey'' within the chapter as a whole?', '["The chapter teaches that pleasant taste alone does not determine acceptability.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter teaches that pleasant taste alone does not determine acceptability.', 'The chapter teaches that pleasant taste alone does not determine acceptability. The detail appears in Leviticus 2:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 2 use the detail ''Honey'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 4, 'How does Leviticus 2 use the detail ''Leaven'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter regulates even common ingredients when food becomes holy tribute."]'::jsonb, 'The chapter regulates even common ingredients when food becomes holy tribute.', 'The chapter regulates even common ingredients when food becomes holy tribute. The detail appears in Leviticus 2:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 2 use the detail ''Leaven'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 4, 'How does Leviticus 2 use the detail ''Parched with fire and bruised out of fresh ears'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter turns harvest beginnings into covenant worship.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter turns harvest beginnings into covenant worship.', 'The chapter turns harvest beginnings into covenant worship. The detail appears in Leviticus 2:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 2 use the detail ''Parched with fire and bruised out of fresh ears'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 4, 'How does Leviticus 2 use the detail ''Salt of the covenant'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter joins worship, covenant, and daily provision through the symbol of salt.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter joins worship, covenant, and daily provision through the symbol of salt.', 'The chapter joins worship, covenant, and daily provision through the symbol of salt. The detail appears in Leviticus 2:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 2 use the detail ''Salt of the covenant'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 5, 'What larger theological point in Leviticus 2 is reinforced by the detail ''Aaron and his sons''?', '["That worship can be detached from covenant obedience", "Holy gifts also sustained the priesthood that served the sanctuary.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holy gifts also sustained the priesthood that served the sanctuary.', 'Holy gifts also sustained the priesthood that served the sanctuary. In context, the chapter uses this detail as part of that wider point (Leviticus 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 2 is reinforced by the detail ''Aaron and his sons''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 5, 'What larger theological point in Leviticus 2 is reinforced by the detail ''Fine flour''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The chapter presents a gift of cultivated produce to the LORD."]'::jsonb, 'The chapter presents a gift of cultivated produce to the LORD.', 'The chapter presents a gift of cultivated produce to the LORD. In context, the chapter uses this detail as part of that wider point (Leviticus 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 2 is reinforced by the detail ''Fine flour''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 5, 'What larger theological point in Leviticus 2 is reinforced by the detail ''Frankincense''?', '["The offering was marked by fragrance and memorial before God.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The offering was marked by fragrance and memorial before God.', 'The offering was marked by fragrance and memorial before God. In context, the chapter uses this detail as part of that wider point (Leviticus 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 2 is reinforced by the detail ''Frankincense''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 5, 'What larger theological point in Leviticus 2 is reinforced by the detail ''Honey''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "God set the terms for what counted as acceptable worship."]'::jsonb, 'God set the terms for what counted as acceptable worship.', 'God set the terms for what counted as acceptable worship. In context, the chapter uses this detail as part of that wider point (Leviticus 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 2 is reinforced by the detail ''Honey''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 5, 'What larger theological point in Leviticus 2 is reinforced by the detail ''Leaven''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The chapter distinguishes holy offerings from ordinary food preparation.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter distinguishes holy offerings from ordinary food preparation.', 'The chapter distinguishes holy offerings from ordinary food preparation. In context, the chapter uses this detail as part of that wider point (Leviticus 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 2 is reinforced by the detail ''Leaven''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 5, 'What larger theological point in Leviticus 2 is reinforced by the detail ''Parched with fire and bruised out of fresh ears''?', '["That worship can be detached from covenant obedience", "The chapter sanctifies the first produce of the land to God.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter sanctifies the first produce of the land to God.', 'The chapter sanctifies the first produce of the land to God. In context, the chapter uses this detail as part of that wider point (Leviticus 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 2 is reinforced by the detail ''Parched with fire and bruised out of fresh ears''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 2, 5, 'What larger theological point in Leviticus 2 is reinforced by the detail ''Salt of the covenant''?', '["The offering is linked to covenant fidelity.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The offering is linked to covenant fidelity.', 'The offering is linked to covenant fidelity. In context, the chapter uses this detail as part of that wider point (Leviticus 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 2 is reinforced by the detail ''Salt of the covenant''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 1, 'How is the peace offering described when burned on the altar?', '["A memorial of sin before the veil", "Food of the offering made by fire for a sweet savor", "A purification rite for uncleanness", "A ransom silver before the LORD"]'::jsonb, 'Food of the offering made by fire for a sweet savor', 'The peace offering was presented as a pleasing food offering to the LORD. (Leviticus 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'How is the peace offering described when burned on the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 1, 'In the peace offering from the flock, what part of a sheep was singled out for removal?', '["The left shoulder", "The fleece on the neck", "The whole fat tail close by the backbone", "The front hoofs"]'::jsonb, 'The whole fat tail close by the backbone', 'The fat tail of the sheep was specifically removed and offered. (Leviticus 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'In the peace offering from the flock, what part of a sheep was singled out for removal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 1, 'What kind of animals could be offered as peace offerings from the herd?', '["Male only with horns", "Female only after first birth", "Any animal that was clean", "Male or female without blemish"]'::jsonb, 'Male or female without blemish', 'Peace offerings from the herd could be male or female so long as they were without blemish. (Leviticus 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of animals could be offered as peace offerings from the herd?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 1, 'What lasting prohibition closes Leviticus 3?', '["Do not eat fat or blood", "Do not eat grain on Sabbaths", "Do not drink wine in the sanctuary", "Do not boil a kid in milk"]'::jsonb, 'Do not eat fat or blood', 'A perpetual statute forbade eating fat or blood. (Leviticus 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What lasting prohibition closes Leviticus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 1, 'What organ was removed with the kidneys in the peace offering ritual?', '["The heart membrane", "The spleen", "The lungs", "The lobe on the liver"]'::jsonb, 'The lobe on the liver', 'The fat, kidneys, and the lobe of the liver were burned on the altar. (Leviticus 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What organ was removed with the kidneys in the peace offering ritual?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 1, 'What was done with the blood of the peace offering?', '["Sprinkled around the altar", "Taken inside the veil", "Poured on the mercy seat", "Placed on the right thumb"]'::jsonb, 'Sprinkled around the altar', 'The priests splashed the blood around the altar. (Leviticus 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was done with the blood of the peace offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 1, 'Which portions of the peace offering were especially the LORD''s?', '["The hide and the horns", "All the fat", "The right shoulder only", "The grain and the drink"]'::jsonb, 'All the fat', 'The fat portions were burned to the LORD as his food offering. (Leviticus 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which portions of the peace offering were especially the LORD''s?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 2, 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:1)', '["Male only with horns", "Female only after first birth", "Any animal that was clean", "Male or female without blemish"]'::jsonb, 'Male or female without blemish', 'Peace offerings from the herd could be male or female so long as they were without blemish. That detail is part of the peace offering instructions in Leviticus 3:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 2, 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:16)', '["The hide and the horns", "All the fat", "The right shoulder only", "The grain and the drink"]'::jsonb, 'All the fat', 'The fat portions were burned to the LORD as his food offering. That detail is part of the peace offering instructions in Leviticus 3:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:16)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 2, 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:16)', '["A memorial of sin before the veil", "Food of the offering made by fire for a sweet savor", "A purification rite for uncleanness", "A ransom silver before the LORD"]'::jsonb, 'Food of the offering made by fire for a sweet savor', 'The peace offering was presented as a pleasing food offering to the LORD. That detail is part of the peace offering instructions in Leviticus 3:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:16)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 2, 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:17)', '["Do not eat fat or blood", "Do not eat grain on Sabbaths", "Do not drink wine in the sanctuary", "Do not boil a kid in milk"]'::jsonb, 'Do not eat fat or blood', 'A perpetual statute forbade eating fat or blood. That detail is part of the peace offering instructions in Leviticus 3:17.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:17)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 2, 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:2)', '["Sprinkled around the altar", "Taken inside the veil", "Poured on the mercy seat", "Placed on the right thumb"]'::jsonb, 'Sprinkled around the altar', 'The priests splashed the blood around the altar. That detail is part of the peace offering instructions in Leviticus 3:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 2, 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:4)', '["The heart membrane", "The spleen", "The lungs", "The lobe on the liver"]'::jsonb, 'The lobe on the liver', 'The fat, kidneys, and the lobe of the liver were burned on the altar. That detail is part of the peace offering instructions in Leviticus 3:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 2, 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:9)', '["The left shoulder", "The fleece on the neck", "The whole fat tail close by the backbone", "The front hoofs"]'::jsonb, 'The whole fat tail close by the backbone', 'The fat tail of the sheep was specifically removed and offered. That detail is part of the peace offering instructions in Leviticus 3:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 3, which detail fits the peace offering instructions? (Leviticus 3:9)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 3, 'In Leviticus 3, what does this detail chiefly emphasize: all the fat?', '["The best and richest portions belonged to God.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The best and richest portions belonged to God.', 'The best and richest portions belonged to God. The fat portions were burned to the LORD as his food offering. (Leviticus 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 3, what does this detail chiefly emphasize: all the fat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 3, 'In Leviticus 3, what does this detail chiefly emphasize: do not eat fat or blood?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Sacred portions and life-blood were not for common use."]'::jsonb, 'Sacred portions and life-blood were not for common use.', 'Sacred portions and life-blood were not for common use. A perpetual statute forbade eating fat or blood. (Leviticus 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 3, what does this detail chiefly emphasize: do not eat fat or blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 3, 'In Leviticus 3, what does this detail chiefly emphasize: food of the offering made by fire for a sweet savor?', '["The chapter presents fellowship in the language of pleasing communion.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter presents fellowship in the language of pleasing communion.', 'The chapter presents fellowship in the language of pleasing communion. The peace offering was presented as a pleasing food offering to the LORD. (Leviticus 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 3, what does this detail chiefly emphasize: food of the offering made by fire for a sweet savor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 3, 'In Leviticus 3, what does this detail chiefly emphasize: male or female without blemish?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The chapter emphasizes fellowship offerings that are still holy and whole.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter emphasizes fellowship offerings that are still holy and whole.', 'The chapter emphasizes fellowship offerings that are still holy and whole. Peace offerings from the herd could be male or female so long as they were without blemish. (Leviticus 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 3, what does this detail chiefly emphasize: male or female without blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 3, 'In Leviticus 3, what does this detail chiefly emphasize: sprinkled around the altar?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Even celebratory fellowship rests on sacrificial blood."]'::jsonb, 'Even celebratory fellowship rests on sacrificial blood.', 'Even celebratory fellowship rests on sacrificial blood. The priests splashed the blood around the altar. (Leviticus 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 3, what does this detail chiefly emphasize: sprinkled around the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 3, 'In Leviticus 3, what does this detail chiefly emphasize: the lobe on the liver?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The ritual carefully designated what belonged on the altar.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The ritual carefully designated what belonged on the altar.', 'The ritual carefully designated what belonged on the altar. The fat, kidneys, and the lobe of the liver were burned on the altar. (Leviticus 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 3, what does this detail chiefly emphasize: the lobe on the liver?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 3, 'In Leviticus 3, what does this detail chiefly emphasize: the whole fat tail close by the backbone?', '["That ritual details were optional once the offering began", "Detailed obedience marked sacrificial fellowship.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Detailed obedience marked sacrificial fellowship.', 'Detailed obedience marked sacrificial fellowship. The fat tail of the sheep was specifically removed and offered. (Leviticus 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 3, what does this detail chiefly emphasize: the whole fat tail close by the backbone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 4, 'How does Leviticus 3 use the detail ''All the fat'' within the chapter as a whole?', '["The chapter reserves the choicest part of fellowship sacrifice for the LORD.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter reserves the choicest part of fellowship sacrifice for the LORD.', 'The chapter reserves the choicest part of fellowship sacrifice for the LORD. The detail appears in Leviticus 3:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 3 use the detail ''All the fat'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 4, 'How does Leviticus 3 use the detail ''Do not eat fat or blood'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter ends by guarding holy symbols from ordinary consumption."]'::jsonb, 'The chapter ends by guarding holy symbols from ordinary consumption.', 'The chapter ends by guarding holy symbols from ordinary consumption. The detail appears in Leviticus 3:17.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 3 use the detail ''Do not eat fat or blood'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 4, 'How does Leviticus 3 use the detail ''Food of the offering made by fire for a sweet savor'' within the chapter as a whole?', '["The chapter portrays shared peace under God''s holy claim.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter portrays shared peace under God''s holy claim.', 'The chapter portrays shared peace under God''s holy claim. The detail appears in Leviticus 3:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 3 use the detail ''Food of the offering made by fire for a sweet savor'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 4, 'How does Leviticus 3 use the detail ''Male or female without blemish'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter combines peace with sacrificial integrity.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter combines peace with sacrificial integrity.', 'The chapter combines peace with sacrificial integrity. The detail appears in Leviticus 3:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 3 use the detail ''Male or female without blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 4, 'How does Leviticus 3 use the detail ''Sprinkled around the altar'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter shows that peace with God is mediated at the altar."]'::jsonb, 'The chapter shows that peace with God is mediated at the altar.', 'The chapter shows that peace with God is mediated at the altar. The detail appears in Leviticus 3:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 3 use the detail ''Sprinkled around the altar'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 4, 'How does Leviticus 3 use the detail ''The lobe on the liver'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter orders fellowship by exact sacrificial boundaries.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter orders fellowship by exact sacrificial boundaries.', 'The chapter orders fellowship by exact sacrificial boundaries. The detail appears in Leviticus 3:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 3 use the detail ''The lobe on the liver'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 4, 'How does Leviticus 3 use the detail ''The whole fat tail close by the backbone'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter treats peace offerings with the same precision as other holy rites.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter treats peace offerings with the same precision as other holy rites.', 'The chapter treats peace offerings with the same precision as other holy rites. The detail appears in Leviticus 3:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 3 use the detail ''The whole fat tail close by the backbone'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 5, 'What larger theological point in Leviticus 3 is reinforced by the detail ''All the fat''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The best and richest portions belonged to God.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The best and richest portions belonged to God.', 'The best and richest portions belonged to God. In context, the chapter uses this detail as part of that wider point (Leviticus 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 3 is reinforced by the detail ''All the fat''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 5, 'What larger theological point in Leviticus 3 is reinforced by the detail ''Do not eat fat or blood''?', '["That worship can be detached from covenant obedience", "Sacred portions and life-blood were not for common use.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Sacred portions and life-blood were not for common use.', 'Sacred portions and life-blood were not for common use. In context, the chapter uses this detail as part of that wider point (Leviticus 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 3 is reinforced by the detail ''Do not eat fat or blood''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 5, 'What larger theological point in Leviticus 3 is reinforced by the detail ''Food of the offering made by fire for a sweet savor''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The chapter presents fellowship in the language of pleasing communion.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter presents fellowship in the language of pleasing communion.', 'The chapter presents fellowship in the language of pleasing communion. In context, the chapter uses this detail as part of that wider point (Leviticus 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 3 is reinforced by the detail ''Food of the offering made by fire for a sweet savor''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 5, 'What larger theological point in Leviticus 3 is reinforced by the detail ''Male or female without blemish''?', '["The chapter emphasizes fellowship offerings that are still holy and whole.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter emphasizes fellowship offerings that are still holy and whole.', 'The chapter emphasizes fellowship offerings that are still holy and whole. In context, the chapter uses this detail as part of that wider point (Leviticus 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 3 is reinforced by the detail ''Male or female without blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 5, 'What larger theological point in Leviticus 3 is reinforced by the detail ''Sprinkled around the altar''?', '["That worship can be detached from covenant obedience", "Even celebratory fellowship rests on sacrificial blood.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Even celebratory fellowship rests on sacrificial blood.', 'Even celebratory fellowship rests on sacrificial blood. In context, the chapter uses this detail as part of that wider point (Leviticus 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 3 is reinforced by the detail ''Sprinkled around the altar''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 5, 'What larger theological point in Leviticus 3 is reinforced by the detail ''The lobe on the liver''?', '["The ritual carefully designated what belonged on the altar.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The ritual carefully designated what belonged on the altar.', 'The ritual carefully designated what belonged on the altar. In context, the chapter uses this detail as part of that wider point (Leviticus 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 3 is reinforced by the detail ''The lobe on the liver''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 3, 5, 'What larger theological point in Leviticus 3 is reinforced by the detail ''The whole fat tail close by the backbone''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Detailed obedience marked sacrificial fellowship."]'::jsonb, 'Detailed obedience marked sacrificial fellowship.', 'Detailed obedience marked sacrificial fellowship. In context, the chapter uses this detail as part of that wider point (Leviticus 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 3 is reinforced by the detail ''The whole fat tail close by the backbone''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 1, 'What animal could one of the common people bring for a sin offering?', '["A female goat without blemish", "A male bull", "A male sheep only", "Fine flour without oil"]'::jsonb, 'A female goat without blemish', 'An ordinary Israelite could bring a female goat for a sin offering. (Leviticus 4:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal could one of the common people bring for a sin offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 1, 'What animal did a ruler offer for a sin offering?', '["A young bull", "A female lamb", "A pair of pigeons", "A male goat without blemish"]'::jsonb, 'A male goat without blemish', 'A ruler brought a male goat for his sin offering. (Leviticus 4:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal did a ruler offer for a sin offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 1, 'What did the anointed priest bring if he sinned?', '["A male goat", "A young bull without blemish", "Two turtledoves", "A ram of the flock"]'::jsonb, 'A young bull without blemish', 'The anointed priest offered a young bull as a sin offering. (Leviticus 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the anointed priest bring if he sinned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 1, 'What happened after the priest made atonement in Leviticus 4?', '["The offender became a Nazirite", "The offender was forgiven", "The offender was exiled for seven days", "The offender had to fast until evening"]'::jsonb, 'The offender was forgiven', 'Again and again the chapter says atonement results in forgiveness. (Leviticus 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened after the priest made atonement in Leviticus 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 1, 'What kind of sin does Leviticus 4 address first?', '["A sin committed unwittingly", "A sin committed on the Day of Atonement", "A sin committed in war", "A sin committed during a vow"]'::jsonb, 'A sin committed unwittingly', 'The chapter deals with sins done unintentionally in the LORD''s commandments. (Leviticus 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of sin does Leviticus 4 address first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 1, 'Where did the priest put the blood for the priest''s or whole congregation''s sin offering?', '["On the horns of the bronze sea", "On the veil only", "On the horns of the altar of sweet incense before the LORD", "On the priest''s garments"]'::jsonb, 'On the horns of the altar of sweet incense before the LORD', 'For these cases, blood was applied to the incense altar in the tent of meeting. (Leviticus 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did the priest put the blood for the priest''s or whole congregation''s sin offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 1, 'Where was the remainder of the blood poured out?', '["At the laver by the entrance", "Outside the camp by the ashes", "At the base of the altar of burnt offering", "On the north side of the altar only"]'::jsonb, 'At the base of the altar of burnt offering', 'After the blood rites, the rest of the blood was poured at the altar''s base. (Leviticus 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was the remainder of the blood poured out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 2, 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:2)', '["A sin committed unwittingly", "A sin committed on the Day of Atonement", "A sin committed in war", "A sin committed during a vow"]'::jsonb, 'A sin committed unwittingly', 'The chapter deals with sins done unintentionally in the LORD''s commandments. That detail is part of the sin offering instructions in Leviticus 4:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 2, 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:20)', '["The offender became a Nazirite", "The offender was forgiven", "The offender was exiled for seven days", "The offender had to fast until evening"]'::jsonb, 'The offender was forgiven', 'Again and again the chapter says atonement results in forgiveness. That detail is part of the sin offering instructions in Leviticus 4:20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:20)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 2, 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:23)', '["A young bull", "A female lamb", "A pair of pigeons", "A male goat without blemish"]'::jsonb, 'A male goat without blemish', 'A ruler brought a male goat for his sin offering. That detail is part of the sin offering instructions in Leviticus 4:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:23)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 2, 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:28)', '["A female goat without blemish", "A male bull", "A male sheep only", "Fine flour without oil"]'::jsonb, 'A female goat without blemish', 'An ordinary Israelite could bring a female goat for a sin offering. That detail is part of the sin offering instructions in Leviticus 4:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:28)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 2, 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:3)', '["A male goat", "A young bull without blemish", "Two turtledoves", "A ram of the flock"]'::jsonb, 'A young bull without blemish', 'The anointed priest offered a young bull as a sin offering. That detail is part of the sin offering instructions in Leviticus 4:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 2, 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:7)', '["On the horns of the bronze sea", "On the veil only", "On the horns of the altar of sweet incense before the LORD", "On the priest''s garments"]'::jsonb, 'On the horns of the altar of sweet incense before the LORD', 'For these cases, blood was applied to the incense altar in the tent of meeting. That detail is part of the sin offering instructions in Leviticus 4:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:7)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 2, 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:7)', '["At the laver by the entrance", "Outside the camp by the ashes", "At the base of the altar of burnt offering", "On the north side of the altar only"]'::jsonb, 'At the base of the altar of burnt offering', 'After the blood rites, the rest of the blood was poured at the altar''s base. That detail is part of the sin offering instructions in Leviticus 4:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 4, which detail fits the sin offering instructions? (Leviticus 4:7)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 3, 'In Leviticus 4, what does this detail chiefly emphasize: a female goat without blemish?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Atonement was accessible to common Israelites."]'::jsonb, 'Atonement was accessible to common Israelites.', 'Atonement was accessible to common Israelites. An ordinary Israelite could bring a female goat for a sin offering. (Leviticus 4:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 4, what does this detail chiefly emphasize: a female goat without blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 3, 'In Leviticus 4, what does this detail chiefly emphasize: a male goat without blemish?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The chapter distinguishes guilt offerings by role and status.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter distinguishes guilt offerings by role and status.', 'The chapter distinguishes guilt offerings by role and status. A ruler brought a male goat for his sin offering. (Leviticus 4:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 4, what does this detail chiefly emphasize: a male goat without blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 3, 'In Leviticus 4, what does this detail chiefly emphasize: a sin committed unwittingly?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Even unintentional sin still requires atonement."]'::jsonb, 'Even unintentional sin still requires atonement.', 'Even unintentional sin still requires atonement. The chapter deals with sins done unintentionally in the LORD''s commandments. (Leviticus 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 4, what does this detail chiefly emphasize: a sin committed unwittingly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 3, 'In Leviticus 4, what does this detail chiefly emphasize: a young bull without blemish?', '["Greater office carried greater sacrificial responsibility.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Greater office carried greater sacrificial responsibility.', 'Greater office carried greater sacrificial responsibility. The anointed priest offered a young bull as a sin offering. (Leviticus 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 4, what does this detail chiefly emphasize: a young bull without blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 3, 'In Leviticus 4, what does this detail chiefly emphasize: at the base of the altar of burnt offering?', '["That ritual details were optional once the offering began", "The altar remained the focal point of purification.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The altar remained the focal point of purification.', 'The altar remained the focal point of purification. After the blood rites, the rest of the blood was poured at the altar''s base. (Leviticus 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 4, what does this detail chiefly emphasize: at the base of the altar of burnt offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 3, 'In Leviticus 4, what does this detail chiefly emphasize: on the horns of the altar of sweet incense before the lord?', '["That ritual details were optional once the offering began", "Corporate sin affected the sanctuary itself.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Corporate sin affected the sanctuary itself.', 'Corporate sin affected the sanctuary itself. For these cases, blood was applied to the incense altar in the tent of meeting. (Leviticus 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 4, what does this detail chiefly emphasize: on the horns of the altar of sweet incense before the lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 3, 'In Leviticus 4, what does this detail chiefly emphasize: the offender was forgiven?', '["Sacrifice aims at restored standing before God.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Sacrifice aims at restored standing before God.', 'Sacrifice aims at restored standing before God. Again and again the chapter says atonement results in forgiveness. (Leviticus 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 4, what does this detail chiefly emphasize: the offender was forgiven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 4, 'How does Leviticus 4 use the detail ''A female goat without blemish'' within the chapter as a whole?', '["The chapter provides graded but real access to forgiveness for all.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter provides graded but real access to forgiveness for all.', 'The chapter provides graded but real access to forgiveness for all. The detail appears in Leviticus 4:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 4 use the detail ''A female goat without blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 4, 'How does Leviticus 4 use the detail ''A male goat without blemish'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter orders atonement without erasing leadership accountability."]'::jsonb, 'The chapter orders atonement without erasing leadership accountability.', 'The chapter orders atonement without erasing leadership accountability. The detail appears in Leviticus 4:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 4 use the detail ''A male goat without blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 4, 'How does Leviticus 4 use the detail ''A sin committed unwittingly'' within the chapter as a whole?', '["The chapter widens guilt beyond deliberate rebellion to inadvertent defilement.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter widens guilt beyond deliberate rebellion to inadvertent defilement.', 'The chapter widens guilt beyond deliberate rebellion to inadvertent defilement. The detail appears in Leviticus 4:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 4 use the detail ''A sin committed unwittingly'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 4, 'How does Leviticus 4 use the detail ''A young bull without blemish'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter calibrates offerings by the impact of the sinner''s position.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter calibrates offerings by the impact of the sinner''s position.', 'The chapter calibrates offerings by the impact of the sinner''s position. The detail appears in Leviticus 4:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 4 use the detail ''A young bull without blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 4, 'How does Leviticus 4 use the detail ''At the base of the altar of burnt offering'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter keeps the whole ritual oriented around sacrificial cleansing at the altar.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter keeps the whole ritual oriented around sacrificial cleansing at the altar.', 'The chapter keeps the whole ritual oriented around sacrificial cleansing at the altar. The detail appears in Leviticus 4:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 4 use the detail ''At the base of the altar of burnt offering'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 4, 'How does Leviticus 4 use the detail ''On the horns of the altar of sweet incense before the LORD'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter shows that sin reaches inward toward God''s dwelling.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that sin reaches inward toward God''s dwelling.', 'The chapter shows that sin reaches inward toward God''s dwelling. The detail appears in Leviticus 4:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 4 use the detail ''On the horns of the altar of sweet incense before the LORD'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 4, 'How does Leviticus 4 use the detail ''The offender was forgiven'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter ties priestly atonement directly to divine forgiveness.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ties priestly atonement directly to divine forgiveness.', 'The chapter ties priestly atonement directly to divine forgiveness. The detail appears in Leviticus 4:20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 4 use the detail ''The offender was forgiven'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 5, 'What larger theological point in Leviticus 4 is reinforced by the detail ''A female goat without blemish''?', '["That worship can be detached from covenant obedience", "Atonement was accessible to common Israelites.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Atonement was accessible to common Israelites.', 'Atonement was accessible to common Israelites. In context, the chapter uses this detail as part of that wider point (Leviticus 4:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 4 is reinforced by the detail ''A female goat without blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 5, 'What larger theological point in Leviticus 4 is reinforced by the detail ''A male goat without blemish''?', '["The chapter distinguishes guilt offerings by role and status.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter distinguishes guilt offerings by role and status.', 'The chapter distinguishes guilt offerings by role and status. In context, the chapter uses this detail as part of that wider point (Leviticus 4:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 4 is reinforced by the detail ''A male goat without blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 5, 'What larger theological point in Leviticus 4 is reinforced by the detail ''A sin committed unwittingly''?', '["That worship can be detached from covenant obedience", "Even unintentional sin still requires atonement.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Even unintentional sin still requires atonement.', 'Even unintentional sin still requires atonement. In context, the chapter uses this detail as part of that wider point (Leviticus 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 4 is reinforced by the detail ''A sin committed unwittingly''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 5, 'What larger theological point in Leviticus 4 is reinforced by the detail ''A young bull without blemish''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Greater office carried greater sacrificial responsibility.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Greater office carried greater sacrificial responsibility.', 'Greater office carried greater sacrificial responsibility. In context, the chapter uses this detail as part of that wider point (Leviticus 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 4 is reinforced by the detail ''A young bull without blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 5, 'What larger theological point in Leviticus 4 is reinforced by the detail ''At the base of the altar of burnt offering''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The altar remained the focal point of purification."]'::jsonb, 'The altar remained the focal point of purification.', 'The altar remained the focal point of purification. In context, the chapter uses this detail as part of that wider point (Leviticus 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 4 is reinforced by the detail ''At the base of the altar of burnt offering''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 5, 'What larger theological point in Leviticus 4 is reinforced by the detail ''On the horns of the altar of sweet incense before the LORD''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Corporate sin affected the sanctuary itself."]'::jsonb, 'Corporate sin affected the sanctuary itself.', 'Corporate sin affected the sanctuary itself. In context, the chapter uses this detail as part of that wider point (Leviticus 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 4 is reinforced by the detail ''On the horns of the altar of sweet incense before the LORD''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 4, 5, 'What larger theological point in Leviticus 4 is reinforced by the detail ''The offender was forgiven''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Sacrifice aims at restored standing before God.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Sacrifice aims at restored standing before God.', 'Sacrifice aims at restored standing before God. In context, the chapter uses this detail as part of that wider point (Leviticus 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 4 is reinforced by the detail ''The offender was forgiven''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 1, 'If someone could not afford birds, what offering could be brought?', '["A tenth of an ephah of fine flour for a sin offering", "A handful of barley with honey", "A ram with oil only", "A sheaf of firstfruits grain"]'::jsonb, 'A tenth of an ephah of fine flour for a sin offering', 'Even the poorest worshiper could bring fine flour, though without oil or frankincense. (Leviticus 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'If someone could not afford birds, what offering could be brought?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 1, 'What animal was required for the trespass offering in holy things?', '["A female goat", "A pair of doves", "A ram without blemish", "A young bull"]'::jsonb, 'A ram without blemish', 'A ram without blemish was brought for the trespass offering. (Leviticus 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal was required for the trespass offering in holy things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 1, 'What did a witness have to do if he had seen or known a matter under oath?', '["Bring incense at once", "Utter it or bear his iniquity", "Wash in water and wait", "Tell only the priest in secret"]'::jsonb, 'Utter it or bear his iniquity', 'Failing to testify when under obligation brought guilt. (Leviticus 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did a witness have to do if he had seen or known a matter under oath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 1, 'What had to be added when someone trespassed in the holy things of the LORD?', '["Double repayment", "A fifth part in restitution", "Seven lambs", "A year of service"]'::jsonb, 'A fifth part in restitution', 'Restitution included repaying the loss plus an added fifth. (Leviticus 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What had to be added when someone trespassed in the holy things of the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 1, 'What is said of the person after the priest makes atonement in these cases?', '["He shall remain unclean until morning", "He shall serve at the sanctuary", "He shall present another offering in a week", "He shall be forgiven"]'::jsonb, 'He shall be forgiven', 'The goal of the offering is explicit forgiveness. (Leviticus 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is said of the person after the priest makes atonement in these cases?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 1, 'What lower-cost offering could a poor person bring if unable to bring a lamb?', '["A basket of leavened bread", "A male calf", "A drink offering of wine", "Two turtledoves or two young pigeons"]'::jsonb, 'Two turtledoves or two young pigeons', 'The law provided a less expensive option for the poor. (Leviticus 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What lower-cost offering could a poor person bring if unable to bring a lamb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 1, 'What was required when a person realized guilt in these matters?', '["Vow lifelong abstinence", "Leave the camp for a month", "Confess the sin he has sinned", "Repeat the law aloud"]'::jsonb, 'Confess the sin he has sinned', 'Confession accompanied the offering when guilt was known. (Leviticus 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was required when a person realized guilt in these matters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 2, 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:1)', '["Bring incense at once", "Utter it or bear his iniquity", "Wash in water and wait", "Tell only the priest in secret"]'::jsonb, 'Utter it or bear his iniquity', 'Failing to testify when under obligation brought guilt. That detail is part of the confession, sin offering, and trespass offering instructions in Leviticus 5:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 2, 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:10)', '["He shall remain unclean until morning", "He shall serve at the sanctuary", "He shall present another offering in a week", "He shall be forgiven"]'::jsonb, 'He shall be forgiven', 'The goal of the offering is explicit forgiveness. That detail is part of the confession, sin offering, and trespass offering instructions in Leviticus 5:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:10)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 2, 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:11)', '["A tenth of an ephah of fine flour for a sin offering", "A handful of barley with honey", "A ram with oil only", "A sheaf of firstfruits grain"]'::jsonb, 'A tenth of an ephah of fine flour for a sin offering', 'Even the poorest worshiper could bring fine flour, though without oil or frankincense. That detail is part of the confession, sin offering, and trespass offering instructions in Leviticus 5:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 2, 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:15)', '["A female goat", "A pair of doves", "A ram without blemish", "A young bull"]'::jsonb, 'A ram without blemish', 'A ram without blemish was brought for the trespass offering. That detail is part of the confession, sin offering, and trespass offering instructions in Leviticus 5:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:15)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 2, 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:16)', '["Double repayment", "A fifth part in restitution", "Seven lambs", "A year of service"]'::jsonb, 'A fifth part in restitution', 'Restitution included repaying the loss plus an added fifth. That detail is part of the confession, sin offering, and trespass offering instructions in Leviticus 5:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:16)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 2, 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:5)', '["Vow lifelong abstinence", "Leave the camp for a month", "Confess the sin he has sinned", "Repeat the law aloud"]'::jsonb, 'Confess the sin he has sinned', 'Confession accompanied the offering when guilt was known. That detail is part of the confession, sin offering, and trespass offering instructions in Leviticus 5:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 2, 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:7)', '["A basket of leavened bread", "A male calf", "A drink offering of wine", "Two turtledoves or two young pigeons"]'::jsonb, 'Two turtledoves or two young pigeons', 'The law provided a less expensive option for the poor. That detail is part of the confession, sin offering, and trespass offering instructions in Leviticus 5:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 5, which detail fits the confession, sin offering, and trespass offering instructions? (Leviticus 5:7)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 3, 'In Leviticus 5, what does this detail chiefly emphasize: a fifth part in restitution?', '["Guilt before God could involve material repair as well as sacrifice.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Guilt before God could involve material repair as well as sacrifice.', 'Guilt before God could involve material repair as well as sacrifice. Restitution included repaying the loss plus an added fifth. (Leviticus 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 5, what does this detail chiefly emphasize: a fifth part in restitution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 3, 'In Leviticus 5, what does this detail chiefly emphasize: a ram without blemish?', '["That ritual details were optional once the offering began", "Certain offenses demanded a distinct sacrificial response.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Certain offenses demanded a distinct sacrificial response.', 'Certain offenses demanded a distinct sacrificial response. A ram without blemish was brought for the trespass offering. (Leviticus 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 5, what does this detail chiefly emphasize: a ram without blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 3, 'In Leviticus 5, what does this detail chiefly emphasize: a tenth of an ephah of fine flour for a sin offering?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The chapter makes room for poverty without lowering the seriousness of sin."]'::jsonb, 'The chapter makes room for poverty without lowering the seriousness of sin.', 'The chapter makes room for poverty without lowering the seriousness of sin. Even the poorest worshiper could bring fine flour, though without oil or frankincense. (Leviticus 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 5, what does this detail chiefly emphasize: a tenth of an ephah of fine flour for a sin offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 3, 'In Leviticus 5, what does this detail chiefly emphasize: confess the sin he has sinned?', '["That ritual details were optional once the offering began", "Atonement involved honest acknowledgment before God.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Atonement involved honest acknowledgment before God.', 'Atonement involved honest acknowledgment before God. Confession accompanied the offering when guilt was known. (Leviticus 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 5, what does this detail chiefly emphasize: confess the sin he has sinned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 3, 'In Leviticus 5, what does this detail chiefly emphasize: he shall be forgiven?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The chapter holds out real pardon through priestly atonement.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter holds out real pardon through priestly atonement.', 'The chapter holds out real pardon through priestly atonement. The goal of the offering is explicit forgiveness. (Leviticus 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 5, what does this detail chiefly emphasize: he shall be forgiven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 3, 'In Leviticus 5, what does this detail chiefly emphasize: two turtledoves or two young pigeons?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "God provided access to atonement for those of limited means.", "That the chapter dismisses priestly mediation"]'::jsonb, 'God provided access to atonement for those of limited means.', 'God provided access to atonement for those of limited means. The law provided a less expensive option for the poor. (Leviticus 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 5, what does this detail chiefly emphasize: two turtledoves or two young pigeons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 3, 'In Leviticus 5, what does this detail chiefly emphasize: utter it or bear his iniquity?', '["Sin included neglected responsibility, not only forbidden acts.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Sin included neglected responsibility, not only forbidden acts.', 'Sin included neglected responsibility, not only forbidden acts. Failing to testify when under obligation brought guilt. (Leviticus 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 5, what does this detail chiefly emphasize: utter it or bear his iniquity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 4, 'How does Leviticus 5 use the detail ''A fifth part in restitution'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter pairs reconciliation with restitution.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter pairs reconciliation with restitution.', 'The chapter pairs reconciliation with restitution. The detail appears in Leviticus 5:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 5 use the detail ''A fifth part in restitution'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 4, 'How does Leviticus 5 use the detail ''A ram without blemish'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter differentiates trespass from general sin by both restitution and sacrifice."]'::jsonb, 'The chapter differentiates trespass from general sin by both restitution and sacrifice.', 'The chapter differentiates trespass from general sin by both restitution and sacrifice. The detail appears in Leviticus 5:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 5 use the detail ''A ram without blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 4, 'How does Leviticus 5 use the detail ''A tenth of an ephah of fine flour for a sin offering'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter preserves access to cleansing without collapsing distinct offerings into one another.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter preserves access to cleansing without collapsing distinct offerings into one another.', 'The chapter preserves access to cleansing without collapsing distinct offerings into one another. The detail appears in Leviticus 5:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 5 use the detail ''A tenth of an ephah of fine flour for a sin offering'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 4, 'How does Leviticus 5 use the detail ''Confess the sin he has sinned'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter joins sacrifice with confession rather than ritual alone."]'::jsonb, 'The chapter joins sacrifice with confession rather than ritual alone.', 'The chapter joins sacrifice with confession rather than ritual alone. The detail appears in Leviticus 5:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 5 use the detail ''Confess the sin he has sinned'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 4, 'How does Leviticus 5 use the detail ''He shall be forgiven'' within the chapter as a whole?', '["The chapter ends guilt not with uncertainty but with forgiveness.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ends guilt not with uncertainty but with forgiveness.', 'The chapter ends guilt not with uncertainty but with forgiveness. The detail appears in Leviticus 5:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 5 use the detail ''He shall be forgiven'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 4, 'How does Leviticus 5 use the detail ''Two turtledoves or two young pigeons'' within the chapter as a whole?', '["The chapter protects both holiness and mercy through graded offerings.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter protects both holiness and mercy through graded offerings.', 'The chapter protects both holiness and mercy through graded offerings. The detail appears in Leviticus 5:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 5 use the detail ''Two turtledoves or two young pigeons'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 4, 'How does Leviticus 5 use the detail ''Utter it or bear his iniquity'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter broadens guilt to include silence where truth is owed.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter broadens guilt to include silence where truth is owed.', 'The chapter broadens guilt to include silence where truth is owed. The detail appears in Leviticus 5:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 5 use the detail ''Utter it or bear his iniquity'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 5, 'What larger theological point in Leviticus 5 is reinforced by the detail ''A fifth part in restitution''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Guilt before God could involve material repair as well as sacrifice.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Guilt before God could involve material repair as well as sacrifice.', 'Guilt before God could involve material repair as well as sacrifice. In context, the chapter uses this detail as part of that wider point (Leviticus 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 5 is reinforced by the detail ''A fifth part in restitution''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 5, 'What larger theological point in Leviticus 5 is reinforced by the detail ''A ram without blemish''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Certain offenses demanded a distinct sacrificial response."]'::jsonb, 'Certain offenses demanded a distinct sacrificial response.', 'Certain offenses demanded a distinct sacrificial response. In context, the chapter uses this detail as part of that wider point (Leviticus 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 5 is reinforced by the detail ''A ram without blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 5, 'What larger theological point in Leviticus 5 is reinforced by the detail ''A tenth of an ephah of fine flour for a sin offering''?', '["That worship can be detached from covenant obedience", "The chapter makes room for poverty without lowering the seriousness of sin.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter makes room for poverty without lowering the seriousness of sin.', 'The chapter makes room for poverty without lowering the seriousness of sin. In context, the chapter uses this detail as part of that wider point (Leviticus 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 5 is reinforced by the detail ''A tenth of an ephah of fine flour for a sin offering''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 5, 'What larger theological point in Leviticus 5 is reinforced by the detail ''Confess the sin he has sinned''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Atonement involved honest acknowledgment before God."]'::jsonb, 'Atonement involved honest acknowledgment before God.', 'Atonement involved honest acknowledgment before God. In context, the chapter uses this detail as part of that wider point (Leviticus 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 5 is reinforced by the detail ''Confess the sin he has sinned''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 5, 'What larger theological point in Leviticus 5 is reinforced by the detail ''He shall be forgiven''?', '["The chapter holds out real pardon through priestly atonement.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter holds out real pardon through priestly atonement.', 'The chapter holds out real pardon through priestly atonement. In context, the chapter uses this detail as part of that wider point (Leviticus 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 5 is reinforced by the detail ''He shall be forgiven''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 5, 'What larger theological point in Leviticus 5 is reinforced by the detail ''Two turtledoves or two young pigeons''?', '["God provided access to atonement for those of limited means.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'God provided access to atonement for those of limited means.', 'God provided access to atonement for those of limited means. In context, the chapter uses this detail as part of that wider point (Leviticus 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 5 is reinforced by the detail ''Two turtledoves or two young pigeons''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 5, 5, 'What larger theological point in Leviticus 5 is reinforced by the detail ''Utter it or bear his iniquity''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Sin included neglected responsibility, not only forbidden acts.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Sin included neglected responsibility, not only forbidden acts.', 'Sin included neglected responsibility, not only forbidden acts. In context, the chapter uses this detail as part of that wider point (Leviticus 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 5 is reinforced by the detail ''Utter it or bear his iniquity''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 1, 'How was Aaron''s daily meal offering to be offered?', '["All at sunrise", "Only on Sabbaths", "Half in the morning and half at night", "Once a week before the veil"]'::jsonb, 'Half in the morning and half at night', 'The anointing day offering of the priests was divided between morning and evening. (Leviticus 6:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'How was Aaron''s daily meal offering to be offered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 1, 'What had to be added when stolen or entrusted goods were restored?', '["A tenth part", "Nothing if confessed", "Twofold repayment only", "A fifth part"]'::jsonb, 'A fifth part', 'Restitution required the principal plus one-fifth. (Leviticus 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What had to be added when stolen or entrusted goods were restored?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 1, 'What sin against a neighbor is described at the start of Leviticus 6?', '["Taking his ox to war", "Failing to invite him to a feast", "Deceiving him about a deposit or pledge", "Refusing to lend him seed"]'::jsonb, 'Deceiving him about a deposit or pledge', 'The chapter begins with offenses involving deception and misappropriation. (Leviticus 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What sin against a neighbor is described at the start of Leviticus 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 1, 'What was to remain burning continually on the altar?', '["The fire on the altar", "The lamp in the holy place", "Incense before the veil", "The hearth in the camp"]'::jsonb, 'The fire on the altar', 'The altar fire was never to go out. (Leviticus 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was to remain burning continually on the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 1, 'What was unique about the priest''s own meal offering?', '["It included leaven and honey", "It could be offered by a ruler instead", "It required no oil", "It was wholly burned and not eaten"]'::jsonb, 'It was wholly burned and not eaten', 'Unlike ordinary meal offerings, every priestly meal offering was entirely burned. (Leviticus 6:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was unique about the priest''s own meal offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 1, 'Where was the sin offering to be killed?', '["In the place where the burnt offering is killed, before the LORD", "At the laver by the entrance", "Outside the camp only", "Inside the holy place"]'::jsonb, 'In the place where the burnt offering is killed, before the LORD', 'The sin offering was slaughtered in the same holy place as the burnt offering. (Leviticus 6:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was the sin offering to be killed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 1, 'Where were the ashes from the burnt offering first placed after removal?', '["Inside the holy place", "Beside the altar", "At the camp gate", "Before the ark"]'::jsonb, 'Beside the altar', 'The priest first set the ashes beside the altar before taking them to a clean place outside the camp. (Leviticus 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where were the ashes from the burnt offering first placed after removal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 2, 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:10)', '["Inside the holy place", "Beside the altar", "At the camp gate", "Before the ark"]'::jsonb, 'Beside the altar', 'The priest first set the ashes beside the altar before taking them to a clean place outside the camp. That detail is part of the laws of offerings and perpetual fire instructions in Leviticus 6:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:10)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 2, 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:13)', '["The fire on the altar", "The lamp in the holy place", "Incense before the veil", "The hearth in the camp"]'::jsonb, 'The fire on the altar', 'The altar fire was never to go out. That detail is part of the laws of offerings and perpetual fire instructions in Leviticus 6:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:13)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 2, 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:2)', '["Taking his ox to war", "Failing to invite him to a feast", "Deceiving him about a deposit or pledge", "Refusing to lend him seed"]'::jsonb, 'Deceiving him about a deposit or pledge', 'The chapter begins with offenses involving deception and misappropriation. That detail is part of the laws of offerings and perpetual fire instructions in Leviticus 6:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 2, 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:20)', '["All at sunrise", "Only on Sabbaths", "Half in the morning and half at night", "Once a week before the veil"]'::jsonb, 'Half in the morning and half at night', 'The anointing day offering of the priests was divided between morning and evening. That detail is part of the laws of offerings and perpetual fire instructions in Leviticus 6:20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:20)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 2, 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:23)', '["It included leaven and honey", "It could be offered by a ruler instead", "It required no oil", "It was wholly burned and not eaten"]'::jsonb, 'It was wholly burned and not eaten', 'Unlike ordinary meal offerings, every priestly meal offering was entirely burned. That detail is part of the laws of offerings and perpetual fire instructions in Leviticus 6:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:23)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 2, 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:25)', '["In the place where the burnt offering is killed, before the LORD", "At the laver by the entrance", "Outside the camp only", "Inside the holy place"]'::jsonb, 'In the place where the burnt offering is killed, before the LORD', 'The sin offering was slaughtered in the same holy place as the burnt offering. That detail is part of the laws of offerings and perpetual fire instructions in Leviticus 6:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:25)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 2, 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:5)', '["A tenth part", "Nothing if confessed", "Twofold repayment only", "A fifth part"]'::jsonb, 'A fifth part', 'Restitution required the principal plus one-fifth. That detail is part of the laws of offerings and perpetual fire instructions in Leviticus 6:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 6, which detail fits the laws of offerings and perpetual fire instructions? (Leviticus 6:5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 3, 'In Leviticus 6, what does this detail chiefly emphasize: a fifth part?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Repentance included repair of tangible loss.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Repentance included repair of tangible loss.', 'Repentance included repair of tangible loss. Restitution required the principal plus one-fifth. (Leviticus 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 6, what does this detail chiefly emphasize: a fifth part?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 3, 'In Leviticus 6, what does this detail chiefly emphasize: beside the altar?', '["Even what remained from sacrifice was handled reverently.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Even what remained from sacrifice was handled reverently.', 'Even what remained from sacrifice was handled reverently. The priest first set the ashes beside the altar before taking them to a clean place outside the camp. (Leviticus 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 6, what does this detail chiefly emphasize: beside the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 3, 'In Leviticus 6, what does this detail chiefly emphasize: deceiving him about a deposit or pledge?', '["That ritual details were optional once the offering began", "Wronging a neighbor is also called unfaithfulness against the LORD.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Wronging a neighbor is also called unfaithfulness against the LORD.', 'Wronging a neighbor is also called unfaithfulness against the LORD. The chapter begins with offenses involving deception and misappropriation. (Leviticus 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 6, what does this detail chiefly emphasize: deceiving him about a deposit or pledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 3, 'In Leviticus 6, what does this detail chiefly emphasize: half in the morning and half at night?', '["That ritual details were optional once the offering began", "Priestly service itself was marked by regular consecration.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly service itself was marked by regular consecration.', 'Priestly service itself was marked by regular consecration. The anointing day offering of the priests was divided between morning and evening. (Leviticus 6:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 6, what does this detail chiefly emphasize: half in the morning and half at night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 3, 'In Leviticus 6, what does this detail chiefly emphasize: in the place where the burnt offering is killed, before the lord?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The chapter organizes offerings within the same sacred sphere."]'::jsonb, 'The chapter organizes offerings within the same sacred sphere.', 'The chapter organizes offerings within the same sacred sphere. The sin offering was slaughtered in the same holy place as the burnt offering. (Leviticus 6:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 6, what does this detail chiefly emphasize: in the place where the burnt offering is killed, before the lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 3, 'In Leviticus 6, what does this detail chiefly emphasize: it was wholly burned and not eaten?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Those who serve at the altar are fully given in holy service.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Those who serve at the altar are fully given in holy service.', 'Those who serve at the altar are fully given in holy service. Unlike ordinary meal offerings, every priestly meal offering was entirely burned. (Leviticus 6:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 6, what does this detail chiefly emphasize: it was wholly burned and not eaten?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 3, 'In Leviticus 6, what does this detail chiefly emphasize: the fire on the altar?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Ongoing worship required ongoing holy vigilance."]'::jsonb, 'Ongoing worship required ongoing holy vigilance.', 'Ongoing worship required ongoing holy vigilance. The altar fire was never to go out. (Leviticus 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 6, what does this detail chiefly emphasize: the fire on the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 4, 'How does Leviticus 6 use the detail ''A fifth part'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter treats atonement and restitution as coordinated acts.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter treats atonement and restitution as coordinated acts.', 'The chapter treats atonement and restitution as coordinated acts. The detail appears in Leviticus 6:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 6 use the detail ''A fifth part'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 4, 'How does Leviticus 6 use the detail ''Beside the altar'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter extends holiness to the disposal of sacrificial remains."]'::jsonb, 'The chapter extends holiness to the disposal of sacrificial remains.', 'The chapter extends holiness to the disposal of sacrificial remains. The detail appears in Leviticus 6:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 6 use the detail ''Beside the altar'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 4, 'How does Leviticus 6 use the detail ''Deceiving him about a deposit or pledge'' within the chapter as a whole?', '["The chapter links social deceit with covenant guilt before God.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter links social deceit with covenant guilt before God.', 'The chapter links social deceit with covenant guilt before God. The detail appears in Leviticus 6:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 6 use the detail ''Deceiving him about a deposit or pledge'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 4, 'How does Leviticus 6 use the detail ''Half in the morning and half at night'' within the chapter as a whole?', '["The chapter shows that priests also lived under sacrificial obligation.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that priests also lived under sacrificial obligation.', 'The chapter shows that priests also lived under sacrificial obligation. The detail appears in Leviticus 6:20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 6 use the detail ''Half in the morning and half at night'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 4, 'How does Leviticus 6 use the detail ''In the place where the burnt offering is killed, before the LORD'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter underlines how closely the sacrificial rites are ordered around the LORD''s presence.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter underlines how closely the sacrificial rites are ordered around the LORD''s presence.', 'The chapter underlines how closely the sacrificial rites are ordered around the LORD''s presence. The detail appears in Leviticus 6:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 6 use the detail ''In the place where the burnt offering is killed, before the LORD'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 4, 'How does Leviticus 6 use the detail ''It was wholly burned and not eaten'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter distinguishes priestly self-offering from priestly portions.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter distinguishes priestly self-offering from priestly portions.', 'The chapter distinguishes priestly self-offering from priestly portions. The detail appears in Leviticus 6:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 6 use the detail ''It was wholly burned and not eaten'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 4, 'How does Leviticus 6 use the detail ''The fire on the altar'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter presents the altar as a place of perpetual sacrificial service.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter presents the altar as a place of perpetual sacrificial service.', 'The chapter presents the altar as a place of perpetual sacrificial service. The detail appears in Leviticus 6:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 6 use the detail ''The fire on the altar'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 5, 'What larger theological point in Leviticus 6 is reinforced by the detail ''A fifth part''?', '["Repentance included repair of tangible loss.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Repentance included repair of tangible loss.', 'Repentance included repair of tangible loss. In context, the chapter uses this detail as part of that wider point (Leviticus 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 6 is reinforced by the detail ''A fifth part''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 5, 'What larger theological point in Leviticus 6 is reinforced by the detail ''Beside the altar''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Even what remained from sacrifice was handled reverently.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Even what remained from sacrifice was handled reverently.', 'Even what remained from sacrifice was handled reverently. In context, the chapter uses this detail as part of that wider point (Leviticus 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 6 is reinforced by the detail ''Beside the altar''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 5, 'What larger theological point in Leviticus 6 is reinforced by the detail ''Deceiving him about a deposit or pledge''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Wronging a neighbor is also called unfaithfulness against the LORD."]'::jsonb, 'Wronging a neighbor is also called unfaithfulness against the LORD.', 'Wronging a neighbor is also called unfaithfulness against the LORD. In context, the chapter uses this detail as part of that wider point (Leviticus 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 6 is reinforced by the detail ''Deceiving him about a deposit or pledge''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 5, 'What larger theological point in Leviticus 6 is reinforced by the detail ''Half in the morning and half at night''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Priestly service itself was marked by regular consecration."]'::jsonb, 'Priestly service itself was marked by regular consecration.', 'Priestly service itself was marked by regular consecration. In context, the chapter uses this detail as part of that wider point (Leviticus 6:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 6 is reinforced by the detail ''Half in the morning and half at night''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 5, 'What larger theological point in Leviticus 6 is reinforced by the detail ''In the place where the burnt offering is killed, before the LORD''?', '["That worship can be detached from covenant obedience", "The chapter organizes offerings within the same sacred sphere.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter organizes offerings within the same sacred sphere.', 'The chapter organizes offerings within the same sacred sphere. In context, the chapter uses this detail as part of that wider point (Leviticus 6:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 6 is reinforced by the detail ''In the place where the burnt offering is killed, before the LORD''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 5, 'What larger theological point in Leviticus 6 is reinforced by the detail ''It was wholly burned and not eaten''?', '["Those who serve at the altar are fully given in holy service.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Those who serve at the altar are fully given in holy service.', 'Those who serve at the altar are fully given in holy service. In context, the chapter uses this detail as part of that wider point (Leviticus 6:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 6 is reinforced by the detail ''It was wholly burned and not eaten''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 6, 5, 'What larger theological point in Leviticus 6 is reinforced by the detail ''The fire on the altar''?', '["That worship can be detached from covenant obedience", "Ongoing worship required ongoing holy vigilance.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Ongoing worship required ongoing holy vigilance.', 'Ongoing worship required ongoing holy vigilance. In context, the chapter uses this detail as part of that wider point (Leviticus 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 6 is reinforced by the detail ''The fire on the altar''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 1, 'What does Leviticus 7 say about the guilt offering?', '["It may be eaten by any clean Israelite", "It must be burned whole", "It is only for rulers", "It is most holy"]'::jsonb, 'It is most holy', 'The chapter explicitly calls the guilt offering most holy. (Leviticus 7:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Leviticus 7 say about the guilt offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 1, 'What happened if peace offering flesh was eaten on the third day?', '["It became a burnt offering", "It had to be given to foreigners", "It counted double as thanksgiving", "It would not be accepted"]'::jsonb, 'It would not be accepted', 'Eating it on the third day made the offering unacceptable. (Leviticus 7:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened if peace offering flesh was eaten on the third day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 1, 'What offering accompanied a thanksgiving peace offering?', '["Only bitter herbs and wine", "Unleavened cakes mixed with oil and unleavened wafers", "Leavened bread without oil", "Raw grain and incense only"]'::jsonb, 'Unleavened cakes mixed with oil and unleavened wafers', 'Thanksgiving peace offerings were accompanied by several kinds of cakes. (Leviticus 7:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What offering accompanied a thanksgiving peace offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 1, 'What penalty faced a person who ate fat belonging to the LORD?', '["He would be cut off from his people", "He had to wash his clothes only", "He became unclean for one day", "He had to bring two doves"]'::jsonb, 'He would be cut off from his people', 'Eating prohibited fat brought the sanction of being cut off. (Leviticus 7:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What penalty faced a person who ate fat belonging to the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 1, 'When had the flesh of a thanksgiving peace offering to be eaten?', '["Within three days", "Only after sunset", "On the day it was offered", "On the next Sabbath"]'::jsonb, 'On the day it was offered', 'Thanksgiving offering meat could not be left until morning. (Leviticus 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'When had the flesh of a thanksgiving peace offering to be eaten?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 1, 'Which portions of the peace offerings belonged to the priests?', '["The head and the hide", "The breast and the right thigh", "The liver and the kidneys", "The tail and the blood"]'::jsonb, 'The breast and the right thigh', 'The waved breast and heaved thigh were assigned to the priests. (Leviticus 7:31-34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which portions of the peace offerings belonged to the priests?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 1, 'Who was allowed to eat the flesh of the guilt offering?', '["Every male among the priests", "Any Levite", "The offerer and his family", "Every clean person in the camp"]'::jsonb, 'Every male among the priests', 'The priests were given the guilt offering as a holy portion. (Leviticus 7:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was allowed to eat the flesh of the guilt offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 2, 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:1)', '["It may be eaten by any clean Israelite", "It must be burned whole", "It is only for rulers", "It is most holy"]'::jsonb, 'It is most holy', 'The chapter explicitly calls the guilt offering most holy. That detail is part of the laws of guilt and peace offerings instructions in Leviticus 7:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 2, 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:12)', '["Only bitter herbs and wine", "Unleavened cakes mixed with oil and unleavened wafers", "Leavened bread without oil", "Raw grain and incense only"]'::jsonb, 'Unleavened cakes mixed with oil and unleavened wafers', 'Thanksgiving peace offerings were accompanied by several kinds of cakes. That detail is part of the laws of guilt and peace offerings instructions in Leviticus 7:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:12)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 2, 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:15)', '["Within three days", "Only after sunset", "On the day it was offered", "On the next Sabbath"]'::jsonb, 'On the day it was offered', 'Thanksgiving offering meat could not be left until morning. That detail is part of the laws of guilt and peace offerings instructions in Leviticus 7:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:15)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 2, 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:18)', '["It became a burnt offering", "It had to be given to foreigners", "It counted double as thanksgiving", "It would not be accepted"]'::jsonb, 'It would not be accepted', 'Eating it on the third day made the offering unacceptable. That detail is part of the laws of guilt and peace offerings instructions in Leviticus 7:18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:18)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 2, 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:25)', '["He would be cut off from his people", "He had to wash his clothes only", "He became unclean for one day", "He had to bring two doves"]'::jsonb, 'He would be cut off from his people', 'Eating prohibited fat brought the sanction of being cut off. That detail is part of the laws of guilt and peace offerings instructions in Leviticus 7:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:25)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 2, 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:31-34)', '["The head and the hide", "The breast and the right thigh", "The liver and the kidneys", "The tail and the blood"]'::jsonb, 'The breast and the right thigh', 'The waved breast and heaved thigh were assigned to the priests. That detail is part of the laws of guilt and peace offerings instructions in Leviticus 7:31-34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:31-34)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 2, 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:6)', '["Every male among the priests", "Any Levite", "The offerer and his family", "Every clean person in the camp"]'::jsonb, 'Every male among the priests', 'The priests were given the guilt offering as a holy portion. That detail is part of the laws of guilt and peace offerings instructions in Leviticus 7:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 7, which detail fits the laws of guilt and peace offerings instructions? (Leviticus 7:6)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 3, 'In Leviticus 7, what does this detail chiefly emphasize: every male among the priests?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Certain holy food was restricted to priestly service."]'::jsonb, 'Certain holy food was restricted to priestly service.', 'Certain holy food was restricted to priestly service. The priests were given the guilt offering as a holy portion. (Leviticus 7:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 7, what does this detail chiefly emphasize: every male among the priests?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 3, 'In Leviticus 7, what does this detail chiefly emphasize: he would be cut off from his people?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Holy portions were protected by serious covenant penalties."]'::jsonb, 'Holy portions were protected by serious covenant penalties.', 'Holy portions were protected by serious covenant penalties. Eating prohibited fat brought the sanction of being cut off. (Leviticus 7:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 7, what does this detail chiefly emphasize: he would be cut off from his people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 3, 'In Leviticus 7, what does this detail chiefly emphasize: it is most holy?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Restitution offerings still belong to the sphere of highest sanctity.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Restitution offerings still belong to the sphere of highest sanctity.', 'Restitution offerings still belong to the sphere of highest sanctity. The chapter explicitly calls the guilt offering most holy. (Leviticus 7:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 7, what does this detail chiefly emphasize: it is most holy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 3, 'In Leviticus 7, what does this detail chiefly emphasize: it would not be accepted?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Delayed obedience can profane what was meant to be holy.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Delayed obedience can profane what was meant to be holy.', 'Delayed obedience can profane what was meant to be holy. Eating it on the third day made the offering unacceptable. (Leviticus 7:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 7, what does this detail chiefly emphasize: it would not be accepted?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 3, 'In Leviticus 7, what does this detail chiefly emphasize: on the day it was offered?', '["That ritual details were optional once the offering began", "Holy fellowship had time limits set by God.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holy fellowship had time limits set by God.', 'Holy fellowship had time limits set by God. Thanksgiving offering meat could not be left until morning. (Leviticus 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 7, what does this detail chiefly emphasize: on the day it was offered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 3, 'In Leviticus 7, what does this detail chiefly emphasize: the breast and the right thigh?', '["The sacrificial system provided ordered support for priestly ministry.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The sacrificial system provided ordered support for priestly ministry.', 'The sacrificial system provided ordered support for priestly ministry. The waved breast and heaved thigh were assigned to the priests. (Leviticus 7:31-34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 7, what does this detail chiefly emphasize: the breast and the right thigh?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 3, 'In Leviticus 7, what does this detail chiefly emphasize: unleavened cakes mixed with oil and unleavened wafers?', '["Gratitude before God involved a full festive presentation.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Gratitude before God involved a full festive presentation.', 'Gratitude before God involved a full festive presentation. Thanksgiving peace offerings were accompanied by several kinds of cakes. (Leviticus 7:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 7, what does this detail chiefly emphasize: unleavened cakes mixed with oil and unleavened wafers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 4, 'How does Leviticus 7 use the detail ''Every male among the priests'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter differentiates between priestly portions and shared meals."]'::jsonb, 'The chapter differentiates between priestly portions and shared meals.', 'The chapter differentiates between priestly portions and shared meals. The detail appears in Leviticus 7:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 7 use the detail ''Every male among the priests'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 4, 'How does Leviticus 7 use the detail ''He would be cut off from his people'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter enforces boundaries around what belongs to God."]'::jsonb, 'The chapter enforces boundaries around what belongs to God.', 'The chapter enforces boundaries around what belongs to God. The detail appears in Leviticus 7:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 7 use the detail ''He would be cut off from his people'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 4, 'How does Leviticus 7 use the detail ''It is most holy'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter keeps reparation and holiness tightly linked.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter keeps reparation and holiness tightly linked.', 'The chapter keeps reparation and holiness tightly linked. The detail appears in Leviticus 7:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 7 use the detail ''It is most holy'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 4, 'How does Leviticus 7 use the detail ''It would not be accepted'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter shows that sacred meals remain under divine timing.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that sacred meals remain under divine timing.', 'The chapter shows that sacred meals remain under divine timing. The detail appears in Leviticus 7:18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 7 use the detail ''It would not be accepted'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 4, 'How does Leviticus 7 use the detail ''On the day it was offered'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter regulates communion meals to preserve holiness.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter regulates communion meals to preserve holiness.', 'The chapter regulates communion meals to preserve holiness. The detail appears in Leviticus 7:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 7 use the detail ''On the day it was offered'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 4, 'How does Leviticus 7 use the detail ''The breast and the right thigh'' within the chapter as a whole?', '["The chapter turns fellowship offerings into a shared but structured distribution.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter turns fellowship offerings into a shared but structured distribution.', 'The chapter turns fellowship offerings into a shared but structured distribution. The detail appears in Leviticus 7:31-34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 7 use the detail ''The breast and the right thigh'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 4, 'How does Leviticus 7 use the detail ''Unleavened cakes mixed with oil and unleavened wafers'' within the chapter as a whole?', '["The chapter joins thankfulness, sacrifice, and shared provision.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter joins thankfulness, sacrifice, and shared provision.', 'The chapter joins thankfulness, sacrifice, and shared provision. The detail appears in Leviticus 7:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 7 use the detail ''Unleavened cakes mixed with oil and unleavened wafers'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 5, 'What larger theological point in Leviticus 7 is reinforced by the detail ''Every male among the priests''?', '["That worship can be detached from covenant obedience", "Certain holy food was restricted to priestly service.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Certain holy food was restricted to priestly service.', 'Certain holy food was restricted to priestly service. In context, the chapter uses this detail as part of that wider point (Leviticus 7:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 7 is reinforced by the detail ''Every male among the priests''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 5, 'What larger theological point in Leviticus 7 is reinforced by the detail ''He would be cut off from his people''?', '["That worship can be detached from covenant obedience", "Holy portions were protected by serious covenant penalties.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holy portions were protected by serious covenant penalties.', 'Holy portions were protected by serious covenant penalties. In context, the chapter uses this detail as part of that wider point (Leviticus 7:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 7 is reinforced by the detail ''He would be cut off from his people''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 5, 'What larger theological point in Leviticus 7 is reinforced by the detail ''It is most holy''?', '["Restitution offerings still belong to the sphere of highest sanctity.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Restitution offerings still belong to the sphere of highest sanctity.', 'Restitution offerings still belong to the sphere of highest sanctity. In context, the chapter uses this detail as part of that wider point (Leviticus 7:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 7 is reinforced by the detail ''It is most holy''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 5, 'What larger theological point in Leviticus 7 is reinforced by the detail ''It would not be accepted''?', '["Delayed obedience can profane what was meant to be holy.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Delayed obedience can profane what was meant to be holy.', 'Delayed obedience can profane what was meant to be holy. In context, the chapter uses this detail as part of that wider point (Leviticus 7:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 7 is reinforced by the detail ''It would not be accepted''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 5, 'What larger theological point in Leviticus 7 is reinforced by the detail ''On the day it was offered''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Holy fellowship had time limits set by God."]'::jsonb, 'Holy fellowship had time limits set by God.', 'Holy fellowship had time limits set by God. In context, the chapter uses this detail as part of that wider point (Leviticus 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 7 is reinforced by the detail ''On the day it was offered''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 5, 'What larger theological point in Leviticus 7 is reinforced by the detail ''The breast and the right thigh''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The sacrificial system provided ordered support for priestly ministry.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The sacrificial system provided ordered support for priestly ministry.', 'The sacrificial system provided ordered support for priestly ministry. In context, the chapter uses this detail as part of that wider point (Leviticus 7:31-34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 7 is reinforced by the detail ''The breast and the right thigh''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 7, 5, 'What larger theological point in Leviticus 7 is reinforced by the detail ''Unleavened cakes mixed with oil and unleavened wafers''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Gratitude before God involved a full festive presentation.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Gratitude before God involved a full festive presentation.', 'Gratitude before God involved a full festive presentation. In context, the chapter uses this detail as part of that wider point (Leviticus 7:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 7 is reinforced by the detail ''Unleavened cakes mixed with oil and unleavened wafers''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 1, 'How long were Aaron and his sons to remain at the entrance of the tent of meeting?', '["Seven days", "Three days", "Twelve days", "Forty days"]'::jsonb, 'Seven days', 'They remained there for the days of consecration, seven days. (Leviticus 8:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long were Aaron and his sons to remain at the entrance of the tent of meeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 1, 'On which three body parts was the blood of the ram of consecration placed for Aaron and his sons?', '["Forehead, left hand, and chest", "Both ears, both thumbs, and both knees", "Nose, right hand, and left foot", "Right ear, right thumb, and right big toe"]'::jsonb, 'Right ear, right thumb, and right big toe', 'Blood marked hearing, action, and walk in priestly service. (Leviticus 8:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'On which three body parts was the blood of the ram of consecration placed for Aaron and his sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 1, 'What did Moses first do to Aaron and his sons in their consecration?', '["He anointed their hands with oil", "He washed them with water", "He gave them the breastpiece", "He sent them outside the camp"]'::jsonb, 'He washed them with water', 'Washing began the consecration rite. (Leviticus 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Moses first do to Aaron and his sons in their consecration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 1, 'What was poured on Aaron''s head?', '["Blood from the ram", "Water from the laver", "Anointing oil", "Fine flour mixed with oil"]'::jsonb, 'Anointing oil', 'Moses poured the anointing oil on Aaron''s head to sanctify him. (Leviticus 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was poured on Aaron''s head?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 1, 'What were Aaron and his sons not to do during the days of consecration?', '["Eat any sacrificial meat", "Go out from the entrance of the tent of meeting", "Speak to the congregation", "Wash their garments"]'::jsonb, 'Go out from the entrance of the tent of meeting', 'They had to remain at the entrance until the consecration days were fulfilled. (Leviticus 8:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What were Aaron and his sons not to do during the days of consecration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 1, 'Whom did Moses gather at the door of the tent of meeting in Leviticus 8?', '["The whole congregation", "Only the elders of Judah", "Only Aaron''s family", "The tribal princes alone"]'::jsonb, 'The whole congregation', 'The consecration occurred before the assembled congregation. (Leviticus 8:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Moses gather at the door of the tent of meeting in Leviticus 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 1, 'Why did Moses say these rites were being done?', '["Because Aaron requested public honor", "Because the elders selected a new leader", "Because the LORD commanded it to be done", "Because the people feared judgment"]'::jsonb, 'Because the LORD commanded it to be done', 'Moses repeatedly grounds the ordination in divine command. (Leviticus 8:5, 34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did Moses say these rites were being done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 2, 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:12)', '["Blood from the ram", "Water from the laver", "Anointing oil", "Fine flour mixed with oil"]'::jsonb, 'Anointing oil', 'Moses poured the anointing oil on Aaron''s head to sanctify him. That detail is part of the consecration of Aaron and his sons instructions in Leviticus 8:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:12)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 2, 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:23-24)', '["Forehead, left hand, and chest", "Both ears, both thumbs, and both knees", "Nose, right hand, and left foot", "Right ear, right thumb, and right big toe"]'::jsonb, 'Right ear, right thumb, and right big toe', 'Blood marked hearing, action, and walk in priestly service. That detail is part of the consecration of Aaron and his sons instructions in Leviticus 8:23-24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:23-24)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 2, 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:3-4)', '["The whole congregation", "Only the elders of Judah", "Only Aaron''s family", "The tribal princes alone"]'::jsonb, 'The whole congregation', 'The consecration occurred before the assembled congregation. That detail is part of the consecration of Aaron and his sons instructions in Leviticus 8:3-4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:3-4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 2, 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:33)', '["Seven days", "Three days", "Twelve days", "Forty days"]'::jsonb, 'Seven days', 'They remained there for the days of consecration, seven days. That detail is part of the consecration of Aaron and his sons instructions in Leviticus 8:33.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:33)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 2, 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:33)', '["Eat any sacrificial meat", "Go out from the entrance of the tent of meeting", "Speak to the congregation", "Wash their garments"]'::jsonb, 'Go out from the entrance of the tent of meeting', 'They had to remain at the entrance until the consecration days were fulfilled. That detail is part of the consecration of Aaron and his sons instructions in Leviticus 8:33.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:33)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 2, 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:5, 34)', '["Because Aaron requested public honor", "Because the elders selected a new leader", "Because the LORD commanded it to be done", "Because the people feared judgment"]'::jsonb, 'Because the LORD commanded it to be done', 'Moses repeatedly grounds the ordination in divine command. That detail is part of the consecration of Aaron and his sons instructions in Leviticus 8:5, 34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:5, 34)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 2, 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:6)', '["He anointed their hands with oil", "He washed them with water", "He gave them the breastpiece", "He sent them outside the camp"]'::jsonb, 'He washed them with water', 'Washing began the consecration rite. That detail is part of the consecration of Aaron and his sons instructions in Leviticus 8:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 8, which detail fits the consecration of Aaron and his sons instructions? (Leviticus 8:6)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 3, 'In Leviticus 8, what does this detail chiefly emphasize: anointing oil?', '["That ritual details were optional once the offering began", "Priestly office is set apart by divine appointment.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly office is set apart by divine appointment.', 'Priestly office is set apart by divine appointment. Moses poured the anointing oil on Aaron''s head to sanctify him. (Leviticus 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 8, what does this detail chiefly emphasize: anointing oil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 3, 'In Leviticus 8, what does this detail chiefly emphasize: because the lord commanded it to be done?', '["That ritual details were optional once the offering began", "Priesthood is instituted by God, not invented by Israel.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priesthood is instituted by God, not invented by Israel.', 'Priesthood is instituted by God, not invented by Israel. Moses repeatedly grounds the ordination in divine command. (Leviticus 8:5, 34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 8, what does this detail chiefly emphasize: because the lord commanded it to be done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 3, 'In Leviticus 8, what does this detail chiefly emphasize: go out from the entrance of the tent of meeting?', '["The priesthood was entered by obedient waiting under divine command.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The priesthood was entered by obedient waiting under divine command.', 'The priesthood was entered by obedient waiting under divine command. They had to remain at the entrance until the consecration days were fulfilled. (Leviticus 8:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 8, what does this detail chiefly emphasize: go out from the entrance of the tent of meeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 3, 'In Leviticus 8, what does this detail chiefly emphasize: he washed them with water?', '["Priestly service begins with cleansing.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly service begins with cleansing.', 'Priestly service begins with cleansing. Washing began the consecration rite. (Leviticus 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 8, what does this detail chiefly emphasize: he washed them with water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 3, 'In Leviticus 8, what does this detail chiefly emphasize: right ear, right thumb, and right big toe?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Consecration claimed the whole life of the priest.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Consecration claimed the whole life of the priest.', 'Consecration claimed the whole life of the priest. Blood marked hearing, action, and walk in priestly service. (Leviticus 8:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 8, what does this detail chiefly emphasize: right ear, right thumb, and right big toe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 3, 'In Leviticus 8, what does this detail chiefly emphasize: seven days?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Ordination required a full, completed period under God''s command."]'::jsonb, 'Ordination required a full, completed period under God''s command.', 'Ordination required a full, completed period under God''s command. They remained there for the days of consecration, seven days. (Leviticus 8:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 8, what does this detail chiefly emphasize: seven days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 3, 'In Leviticus 8, what does this detail chiefly emphasize: the whole congregation?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Priestly ordination was a public act for the whole covenant community."]'::jsonb, 'Priestly ordination was a public act for the whole covenant community.', 'Priestly ordination was a public act for the whole covenant community. The consecration occurred before the assembled congregation. (Leviticus 8:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 8, what does this detail chiefly emphasize: the whole congregation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 4, 'How does Leviticus 8 use the detail ''Anointing oil'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter marks Aaron as holy for a representative role.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter marks Aaron as holy for a representative role.', 'The chapter marks Aaron as holy for a representative role. The detail appears in Leviticus 8:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 8 use the detail ''Anointing oil'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 4, 'How does Leviticus 8 use the detail ''Because the LORD commanded it to be done'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter frames every consecration detail as obedience to the LORD''s command.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter frames every consecration detail as obedience to the LORD''s command.', 'The chapter frames every consecration detail as obedience to the LORD''s command. The detail appears in Leviticus 8:5, 34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 8 use the detail ''Because the LORD commanded it to be done'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 4, 'How does Leviticus 8 use the detail ''Go out from the entrance of the tent of meeting'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter ties priestly legitimacy to strict obedience.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ties priestly legitimacy to strict obedience.', 'The chapter ties priestly legitimacy to strict obedience. The detail appears in Leviticus 8:33.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 8 use the detail ''Go out from the entrance of the tent of meeting'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 4, 'How does Leviticus 8 use the detail ''He washed them with water'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter presents ordination as purification before service.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter presents ordination as purification before service.', 'The chapter presents ordination as purification before service. The detail appears in Leviticus 8:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 8 use the detail ''He washed them with water'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 4, 'How does Leviticus 8 use the detail ''Right ear, right thumb, and right big toe'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter portrays priesthood as total dedication in hearing, working, and walking."]'::jsonb, 'The chapter portrays priesthood as total dedication in hearing, working, and walking.', 'The chapter portrays priesthood as total dedication in hearing, working, and walking. The detail appears in Leviticus 8:23-24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 8 use the detail ''Right ear, right thumb, and right big toe'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 4, 'How does Leviticus 8 use the detail ''Seven days'' within the chapter as a whole?', '["The chapter stresses patience and completeness in entering holy office.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter stresses patience and completeness in entering holy office.', 'The chapter stresses patience and completeness in entering holy office. The detail appears in Leviticus 8:33.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 8 use the detail ''Seven days'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 4, 'How does Leviticus 8 use the detail ''The whole congregation'' within the chapter as a whole?', '["The chapter establishes the priesthood before Israel as a corporate reality.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter establishes the priesthood before Israel as a corporate reality.', 'The chapter establishes the priesthood before Israel as a corporate reality. The detail appears in Leviticus 8:3-4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 8 use the detail ''The whole congregation'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 5, 'What larger theological point in Leviticus 8 is reinforced by the detail ''Anointing oil''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Priestly office is set apart by divine appointment."]'::jsonb, 'Priestly office is set apart by divine appointment.', 'Priestly office is set apart by divine appointment. In context, the chapter uses this detail as part of that wider point (Leviticus 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 8 is reinforced by the detail ''Anointing oil''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 5, 'What larger theological point in Leviticus 8 is reinforced by the detail ''Because the LORD commanded it to be done''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Priesthood is instituted by God, not invented by Israel."]'::jsonb, 'Priesthood is instituted by God, not invented by Israel.', 'Priesthood is instituted by God, not invented by Israel. In context, the chapter uses this detail as part of that wider point (Leviticus 8:5, 34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 8 is reinforced by the detail ''Because the LORD commanded it to be done''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 5, 'What larger theological point in Leviticus 8 is reinforced by the detail ''Go out from the entrance of the tent of meeting''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The priesthood was entered by obedient waiting under divine command.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The priesthood was entered by obedient waiting under divine command.', 'The priesthood was entered by obedient waiting under divine command. In context, the chapter uses this detail as part of that wider point (Leviticus 8:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 8 is reinforced by the detail ''Go out from the entrance of the tent of meeting''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 5, 'What larger theological point in Leviticus 8 is reinforced by the detail ''He washed them with water''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Priestly service begins with cleansing.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Priestly service begins with cleansing.', 'Priestly service begins with cleansing. In context, the chapter uses this detail as part of that wider point (Leviticus 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 8 is reinforced by the detail ''He washed them with water''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 5, 'What larger theological point in Leviticus 8 is reinforced by the detail ''Right ear, right thumb, and right big toe''?', '["Consecration claimed the whole life of the priest.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Consecration claimed the whole life of the priest.', 'Consecration claimed the whole life of the priest. In context, the chapter uses this detail as part of that wider point (Leviticus 8:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 8 is reinforced by the detail ''Right ear, right thumb, and right big toe''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 5, 'What larger theological point in Leviticus 8 is reinforced by the detail ''Seven days''?', '["That worship can be detached from covenant obedience", "Ordination required a full, completed period under God''s command.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Ordination required a full, completed period under God''s command.', 'Ordination required a full, completed period under God''s command. In context, the chapter uses this detail as part of that wider point (Leviticus 8:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 8 is reinforced by the detail ''Seven days''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 8, 5, 'What larger theological point in Leviticus 8 is reinforced by the detail ''The whole congregation''?', '["That worship can be detached from covenant obedience", "Priestly ordination was a public act for the whole covenant community.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Priestly ordination was a public act for the whole covenant community.', 'Priestly ordination was a public act for the whole covenant community. In context, the chapter uses this detail as part of that wider point (Leviticus 8:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 8 is reinforced by the detail ''The whole congregation''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 1, 'How did the people respond when fire came out from before the LORD?', '["They fled outside the camp", "They shouted and fell on their faces", "They sang and danced around the altar", "They remained silent until evening"]'::jsonb, 'They shouted and fell on their faces', 'The divine fire consumed the offering and the people fell in worship. (Leviticus 9:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did the people respond when fire came out from before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 1, 'On what day did Moses call Aaron and his sons for the first priestly offerings?', '["The first day of the month", "The eighth day", "The seventh day", "The Day of Atonement"]'::jsonb, 'The eighth day', 'The ministry began on the eighth day after the consecration period. (Leviticus 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'On what day did Moses call Aaron and his sons for the first priestly offerings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 1, 'What did Aaron do before coming down after the offerings?', '["He entered the Most Holy Place alone", "He sprinkled blood on the people", "He lifted up his hands toward the people and blessed them", "He crowned Eleazar before the elders"]'::jsonb, 'He lifted up his hands toward the people and blessed them', 'Aaron blessed the people after presenting the offerings. (Leviticus 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Aaron do before coming down after the offerings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 1, 'What did Aaron first offer for himself?', '["Two birds for purification", "A goat for the people only", "A calf for a sin offering and a ram for a burnt offering", "Fine flour with oil and incense"]'::jsonb, 'A calf for a sin offering and a ram for a burnt offering', 'Aaron had to offer first for his own sin before ministering for the people. (Leviticus 9:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Aaron first offer for himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 1, 'What did Moses say would appear if Israel obeyed these instructions?', '["The glory of the LORD", "The ark of the covenant", "A cloud of quail", "The priestly lots"]'::jsonb, 'The glory of the LORD', 'Moses promised that the glory of the LORD would appear that day. (Leviticus 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Moses say would appear if Israel obeyed these instructions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 1, 'What offering did the people bring for a sin offering?', '["A young bull", "A pair of doves", "A ewe lamb", "A male goat"]'::jsonb, 'A male goat', 'The people''s sin offering on this day was a male goat. (Leviticus 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What offering did the people bring for a sin offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 1, 'Who went into the tent of meeting and then came out to bless the people?', '["Aaron and Eleazar", "Moses and Joshua", "Nadab and Abihu", "Moses and Aaron"]'::jsonb, 'Moses and Aaron', 'Moses and Aaron entered together and came out to bless the congregation. (Leviticus 9:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who went into the tent of meeting and then came out to bless the people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 2, 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:1)', '["The first day of the month", "The eighth day", "The seventh day", "The Day of Atonement"]'::jsonb, 'The eighth day', 'The ministry began on the eighth day after the consecration period. That detail is part of the first priestly ministry and divine fire instructions in Leviticus 9:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 2, 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:2)', '["Two birds for purification", "A goat for the people only", "A calf for a sin offering and a ram for a burnt offering", "Fine flour with oil and incense"]'::jsonb, 'A calf for a sin offering and a ram for a burnt offering', 'Aaron had to offer first for his own sin before ministering for the people. That detail is part of the first priestly ministry and divine fire instructions in Leviticus 9:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 2, 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:22)', '["He entered the Most Holy Place alone", "He sprinkled blood on the people", "He lifted up his hands toward the people and blessed them", "He crowned Eleazar before the elders"]'::jsonb, 'He lifted up his hands toward the people and blessed them', 'Aaron blessed the people after presenting the offerings. That detail is part of the first priestly ministry and divine fire instructions in Leviticus 9:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:22)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 2, 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:23)', '["Aaron and Eleazar", "Moses and Joshua", "Nadab and Abihu", "Moses and Aaron"]'::jsonb, 'Moses and Aaron', 'Moses and Aaron entered together and came out to bless the congregation. That detail is part of the first priestly ministry and divine fire instructions in Leviticus 9:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:23)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 2, 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:24)', '["They fled outside the camp", "They shouted and fell on their faces", "They sang and danced around the altar", "They remained silent until evening"]'::jsonb, 'They shouted and fell on their faces', 'The divine fire consumed the offering and the people fell in worship. That detail is part of the first priestly ministry and divine fire instructions in Leviticus 9:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:24)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 2, 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:3)', '["A young bull", "A pair of doves", "A ewe lamb", "A male goat"]'::jsonb, 'A male goat', 'The people''s sin offering on this day was a male goat. That detail is part of the first priestly ministry and divine fire instructions in Leviticus 9:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 2, 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:6)', '["The glory of the LORD", "The ark of the covenant", "A cloud of quail", "The priestly lots"]'::jsonb, 'The glory of the LORD', 'Moses promised that the glory of the LORD would appear that day. That detail is part of the first priestly ministry and divine fire instructions in Leviticus 9:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 9, which detail fits the first priestly ministry and divine fire instructions? (Leviticus 9:6)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 3, 'In Leviticus 9, what does this detail chiefly emphasize: a calf for a sin offering and a ram for a burnt offering?', '["That ritual details were optional once the offering began", "Even the priest needed atonement before serving others.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Even the priest needed atonement before serving others.', 'Even the priest needed atonement before serving others. Aaron had to offer first for his own sin before ministering for the people. (Leviticus 9:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 9, what does this detail chiefly emphasize: a calf for a sin offering and a ram for a burnt offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 3, 'In Leviticus 9, what does this detail chiefly emphasize: a male goat?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The chapter combines priestly mediation with congregational sacrifice.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter combines priestly mediation with congregational sacrifice.', 'The chapter combines priestly mediation with congregational sacrifice. The people''s sin offering on this day was a male goat. (Leviticus 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 9, what does this detail chiefly emphasize: a male goat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 3, 'In Leviticus 9, what does this detail chiefly emphasize: he lifted up his hands toward the people and blessed them?', '["That ritual details were optional once the offering began", "Priestly mediation leads toward blessing for the people.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly mediation leads toward blessing for the people.', 'Priestly mediation leads toward blessing for the people. Aaron blessed the people after presenting the offerings. (Leviticus 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 9, what does this detail chiefly emphasize: he lifted up his hands toward the people and blessed them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 3, 'In Leviticus 9, what does this detail chiefly emphasize: moses and aaron?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The chapter combines Mosaic leadership with Aaronic priesthood.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter combines Mosaic leadership with Aaronic priesthood.', 'The chapter combines Mosaic leadership with Aaronic priesthood. Moses and Aaron entered together and came out to bless the congregation. (Leviticus 9:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 9, what does this detail chiefly emphasize: moses and aaron?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 3, 'In Leviticus 9, what does this detail chiefly emphasize: the eighth day?', '["The chapter moves from preparation to active priestly service.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter moves from preparation to active priestly service.', 'The chapter moves from preparation to active priestly service. The ministry began on the eighth day after the consecration period. (Leviticus 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 9, what does this detail chiefly emphasize: the eighth day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 3, 'In Leviticus 9, what does this detail chiefly emphasize: the glory of the lord?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Obedient worship prepared the way for manifested divine presence."]'::jsonb, 'Obedient worship prepared the way for manifested divine presence.', 'Obedient worship prepared the way for manifested divine presence. Moses promised that the glory of the LORD would appear that day. (Leviticus 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 9, what does this detail chiefly emphasize: the glory of the lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 3, 'In Leviticus 9, what does this detail chiefly emphasize: they shouted and fell on their faces?', '["God''s acceptance produced awe-filled worship.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'God''s acceptance produced awe-filled worship.', 'God''s acceptance produced awe-filled worship. The divine fire consumed the offering and the people fell in worship. (Leviticus 9:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 9, what does this detail chiefly emphasize: they shouted and fell on their faces?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 4, 'How does Leviticus 9 use the detail ''A calf for a sin offering and a ram for a burnt offering'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter orders mediation through the priest''s own cleansing first."]'::jsonb, 'The chapter orders mediation through the priest''s own cleansing first.', 'The chapter orders mediation through the priest''s own cleansing first. The detail appears in Leviticus 9:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 9 use the detail ''A calf for a sin offering and a ram for a burnt offering'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 4, 'How does Leviticus 9 use the detail ''A male goat'' within the chapter as a whole?', '["The chapter arranges a full communal approach to God through appointed offerings.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter arranges a full communal approach to God through appointed offerings.', 'The chapter arranges a full communal approach to God through appointed offerings. The detail appears in Leviticus 9:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 9 use the detail ''A male goat'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 4, 'How does Leviticus 9 use the detail ''He lifted up his hands toward the people and blessed them'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter presents accepted sacrifice as the path to covenant blessing."]'::jsonb, 'The chapter presents accepted sacrifice as the path to covenant blessing.', 'The chapter presents accepted sacrifice as the path to covenant blessing. The detail appears in Leviticus 9:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 9 use the detail ''He lifted up his hands toward the people and blessed them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 4, 'How does Leviticus 9 use the detail ''Moses and Aaron'' within the chapter as a whole?', '["The chapter shows leadership and priesthood acting together before God and the people.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows leadership and priesthood acting together before God and the people.', 'The chapter shows leadership and priesthood acting together before God and the people. The detail appears in Leviticus 9:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 9 use the detail ''Moses and Aaron'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 4, 'How does Leviticus 9 use the detail ''The eighth day'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter shows ordained priests entering their office at the appointed time.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows ordained priests entering their office at the appointed time.', 'The chapter shows ordained priests entering their office at the appointed time. The detail appears in Leviticus 9:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 9 use the detail ''The eighth day'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 4, 'How does Leviticus 9 use the detail ''The glory of the LORD'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter links commanded sacrifice with visible covenant confirmation.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter links commanded sacrifice with visible covenant confirmation.', 'The chapter links commanded sacrifice with visible covenant confirmation. The detail appears in Leviticus 9:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 9 use the detail ''The glory of the LORD'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 4, 'How does Leviticus 9 use the detail ''They shouted and fell on their faces'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter ends with divine approval that humbles the congregation.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ends with divine approval that humbles the congregation.', 'The chapter ends with divine approval that humbles the congregation. The detail appears in Leviticus 9:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 9 use the detail ''They shouted and fell on their faces'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 5, 'What larger theological point in Leviticus 9 is reinforced by the detail ''A calf for a sin offering and a ram for a burnt offering''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Even the priest needed atonement before serving others."]'::jsonb, 'Even the priest needed atonement before serving others.', 'Even the priest needed atonement before serving others. In context, the chapter uses this detail as part of that wider point (Leviticus 9:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 9 is reinforced by the detail ''A calf for a sin offering and a ram for a burnt offering''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 5, 'What larger theological point in Leviticus 9 is reinforced by the detail ''A male goat''?', '["The chapter combines priestly mediation with congregational sacrifice.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter combines priestly mediation with congregational sacrifice.', 'The chapter combines priestly mediation with congregational sacrifice. In context, the chapter uses this detail as part of that wider point (Leviticus 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 9 is reinforced by the detail ''A male goat''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 5, 'What larger theological point in Leviticus 9 is reinforced by the detail ''He lifted up his hands toward the people and blessed them''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Priestly mediation leads toward blessing for the people."]'::jsonb, 'Priestly mediation leads toward blessing for the people.', 'Priestly mediation leads toward blessing for the people. In context, the chapter uses this detail as part of that wider point (Leviticus 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 9 is reinforced by the detail ''He lifted up his hands toward the people and blessed them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 5, 'What larger theological point in Leviticus 9 is reinforced by the detail ''Moses and Aaron''?', '["The chapter combines Mosaic leadership with Aaronic priesthood.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter combines Mosaic leadership with Aaronic priesthood.', 'The chapter combines Mosaic leadership with Aaronic priesthood. In context, the chapter uses this detail as part of that wider point (Leviticus 9:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 9 is reinforced by the detail ''Moses and Aaron''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 5, 'What larger theological point in Leviticus 9 is reinforced by the detail ''The eighth day''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The chapter moves from preparation to active priestly service.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter moves from preparation to active priestly service.', 'The chapter moves from preparation to active priestly service. In context, the chapter uses this detail as part of that wider point (Leviticus 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 9 is reinforced by the detail ''The eighth day''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 5, 'What larger theological point in Leviticus 9 is reinforced by the detail ''The glory of the LORD''?', '["That worship can be detached from covenant obedience", "Obedient worship prepared the way for manifested divine presence.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Obedient worship prepared the way for manifested divine presence.', 'Obedient worship prepared the way for manifested divine presence. In context, the chapter uses this detail as part of that wider point (Leviticus 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 9 is reinforced by the detail ''The glory of the LORD''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 9, 5, 'What larger theological point in Leviticus 9 is reinforced by the detail ''They shouted and fell on their faces''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "God''s acceptance produced awe-filled worship.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'God''s acceptance produced awe-filled worship.', 'God''s acceptance produced awe-filled worship. In context, the chapter uses this detail as part of that wider point (Leviticus 9:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 9 is reinforced by the detail ''They shouted and fell on their faces''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 1, 'What did Nadab and Abihu offer before the LORD?', '["The evening burnt offering", "Fresh incense from the altar", "Strange fire which he had not commanded them", "A vow offering for the people"]'::jsonb, 'Strange fire which he had not commanded them', 'They offered unauthorized fire before the LORD. (Leviticus 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Nadab and Abihu offer before the LORD?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 1, 'What happened to Nadab and Abihu?', '["They were put outside the camp for seven days", "They were struck with leprosy", "They collapsed from drunkenness", "Fire came out from before the LORD and devoured them"]'::jsonb, 'Fire came out from before the LORD and devoured them', 'Divine fire judged them immediately. (Leviticus 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to Nadab and Abihu?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 1, 'What principle did Moses quote after their death?', '["I will be sanctified in them that come near me", "Mercy triumphs over judgment", "The priest shall bear the iniquity of the people", "The LORD looks on the heart only"]'::jsonb, 'I will be sanctified in them that come near me', 'God declared that those who draw near must treat him as holy. (Leviticus 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What principle did Moses quote after their death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 1, 'What were Aaron and his remaining sons forbidden to drink when going into the tent of meeting?', '["Milk or honey", "Wine or strong drink", "Water from the laver", "New wine only"]'::jsonb, 'Wine or strong drink', 'They were forbidden intoxicants in sanctuary service. (Leviticus 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What were Aaron and his remaining sons forbidden to drink when going into the tent of meeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 1, 'What were the priests to distinguish?', '["Between Judah and Israel, and between camp and city", "Between firstfruits and tithes, and between vows and oaths", "Between the holy and the common, and between the unclean and the clean", "Between summer and winter, and between seedtime and harvest"]'::jsonb, 'Between the holy and the common, and between the unclean and the clean', 'Their role included teaching careful distinctions. (Leviticus 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What were the priests to distinguish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 1, 'Who carried Nadab and Abihu outside the camp?', '["Mishael and Elzaphan", "Eleazar and Ithamar", "Joshua and Caleb", "Phinehas and Eleazar"]'::jsonb, 'Mishael and Elzaphan', 'Their cousins Mishael and Elzaphan carried them out. (Leviticus 10:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who carried Nadab and Abihu outside the camp?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 1, 'Why did Aaron say the sin offering had not been eaten that day?', '["Because the meat was unclean", "Because Moses forgot the law", "Because the people had already eaten it", "Because such things had befallen him"]'::jsonb, 'Because such things had befallen him', 'Aaron appealed to the day''s grief after the death of his sons. (Leviticus 10:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did Aaron say the sin offering had not been eaten that day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 2, 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:1)', '["The evening burnt offering", "Fresh incense from the altar", "Strange fire which he had not commanded them", "A vow offering for the people"]'::jsonb, 'Strange fire which he had not commanded them', 'They offered unauthorized fire before the LORD. That detail is part of the Nadab and Abihu and priestly discernment instructions in Leviticus 10:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 2, 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:10)', '["Between Judah and Israel, and between camp and city", "Between firstfruits and tithes, and between vows and oaths", "Between the holy and the common, and between the unclean and the clean", "Between summer and winter, and between seedtime and harvest"]'::jsonb, 'Between the holy and the common, and between the unclean and the clean', 'Their role included teaching careful distinctions. That detail is part of the Nadab and Abihu and priestly discernment instructions in Leviticus 10:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:10)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 2, 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:19)', '["Because the meat was unclean", "Because Moses forgot the law", "Because the people had already eaten it", "Because such things had befallen him"]'::jsonb, 'Because such things had befallen him', 'Aaron appealed to the day''s grief after the death of his sons. That detail is part of the Nadab and Abihu and priestly discernment instructions in Leviticus 10:19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:19)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 2, 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:2)', '["They were put outside the camp for seven days", "They were struck with leprosy", "They collapsed from drunkenness", "Fire came out from before the LORD and devoured them"]'::jsonb, 'Fire came out from before the LORD and devoured them', 'Divine fire judged them immediately. That detail is part of the Nadab and Abihu and priestly discernment instructions in Leviticus 10:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 2, 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:3)', '["I will be sanctified in them that come near me", "Mercy triumphs over judgment", "The priest shall bear the iniquity of the people", "The LORD looks on the heart only"]'::jsonb, 'I will be sanctified in them that come near me', 'God declared that those who draw near must treat him as holy. That detail is part of the Nadab and Abihu and priestly discernment instructions in Leviticus 10:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 2, 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:4-5)', '["Mishael and Elzaphan", "Eleazar and Ithamar", "Joshua and Caleb", "Phinehas and Eleazar"]'::jsonb, 'Mishael and Elzaphan', 'Their cousins Mishael and Elzaphan carried them out. That detail is part of the Nadab and Abihu and priestly discernment instructions in Leviticus 10:4-5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:4-5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 2, 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:9)', '["Milk or honey", "Wine or strong drink", "Water from the laver", "New wine only"]'::jsonb, 'Wine or strong drink', 'They were forbidden intoxicants in sanctuary service. That detail is part of the Nadab and Abihu and priestly discernment instructions in Leviticus 10:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 10, which detail fits the Nadab and Abihu and priestly discernment instructions? (Leviticus 10:9)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 3, 'In Leviticus 10, what does this detail chiefly emphasize: because such things had befallen him?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The chapter recognizes the strain between grief and priestly duty.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter recognizes the strain between grief and priestly duty.', 'The chapter recognizes the strain between grief and priestly duty. Aaron appealed to the day''s grief after the death of his sons. (Leviticus 10:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 10, what does this detail chiefly emphasize: because such things had befallen him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 3, 'In Leviticus 10, what does this detail chiefly emphasize: between the holy and the common, and between the unclean and the clean?', '["That ritual details were optional once the offering began", "Priesthood involved moral and ritual discernment, not merely ritual action.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priesthood involved moral and ritual discernment, not merely ritual action.', 'Priesthood involved moral and ritual discernment, not merely ritual action. Their role included teaching careful distinctions. (Leviticus 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 10, what does this detail chiefly emphasize: between the holy and the common, and between the unclean and the clean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 3, 'In Leviticus 10, what does this detail chiefly emphasize: fire came out from before the lord and devoured them?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The same presence that accepts true worship also judges profanation.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The same presence that accepts true worship also judges profanation.', 'The same presence that accepts true worship also judges profanation. Divine fire judged them immediately. (Leviticus 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 10, what does this detail chiefly emphasize: fire came out from before the lord and devoured them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 3, 'In Leviticus 10, what does this detail chiefly emphasize: i will be sanctified in them that come near me?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Nearness to God increases responsibility for reverence."]'::jsonb, 'Nearness to God increases responsibility for reverence.', 'Nearness to God increases responsibility for reverence. God declared that those who draw near must treat him as holy. (Leviticus 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 10, what does this detail chiefly emphasize: i will be sanctified in them that come near me?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 3, 'In Leviticus 10, what does this detail chiefly emphasize: mishael and elzaphan?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Judgment within the sanctuary still required ordered handling."]'::jsonb, 'Judgment within the sanctuary still required ordered handling.', 'Judgment within the sanctuary still required ordered handling. Their cousins Mishael and Elzaphan carried them out. (Leviticus 10:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 10, what does this detail chiefly emphasize: mishael and elzaphan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 3, 'In Leviticus 10, what does this detail chiefly emphasize: strange fire which he had not commanded them?', '["That ritual details were optional once the offering began", "Holy worship cannot be improvised against God''s command.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holy worship cannot be improvised against God''s command.', 'Holy worship cannot be improvised against God''s command. They offered unauthorized fire before the LORD. (Leviticus 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 10, what does this detail chiefly emphasize: strange fire which he had not commanded them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 3, 'In Leviticus 10, what does this detail chiefly emphasize: wine or strong drink?', '["Priestly clarity and self-control mattered in holy service.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly clarity and self-control mattered in holy service.', 'Priestly clarity and self-control mattered in holy service. They were forbidden intoxicants in sanctuary service. (Leviticus 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 10, what does this detail chiefly emphasize: wine or strong drink?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 4, 'How does Leviticus 10 use the detail ''Because such things had befallen him'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter ends with a careful pastoral judgment inside a holy crisis.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ends with a careful pastoral judgment inside a holy crisis.', 'The chapter ends with a careful pastoral judgment inside a holy crisis. The detail appears in Leviticus 10:19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 10 use the detail ''Because such things had befallen him'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 4, 'How does Leviticus 10 use the detail ''Between the holy and the common, and between the unclean and the clean'' within the chapter as a whole?', '["The chapter defines priestly leadership as preserving boundaries God set.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter defines priestly leadership as preserving boundaries God set.', 'The chapter defines priestly leadership as preserving boundaries God set. The detail appears in Leviticus 10:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 10 use the detail ''Between the holy and the common, and between the unclean and the clean'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 4, 'How does Leviticus 10 use the detail ''Fire came out from before the LORD and devoured them'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter contrasts accepted fire in chapter 9 with destructive fire in chapter 10.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter contrasts accepted fire in chapter 9 with destructive fire in chapter 10.', 'The chapter contrasts accepted fire in chapter 9 with destructive fire in chapter 10. The detail appears in Leviticus 10:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 10 use the detail ''Fire came out from before the LORD and devoured them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 4, 'How does Leviticus 10 use the detail ''I will be sanctified in them that come near me'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter interprets the judgment as a defense of divine holiness.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter interprets the judgment as a defense of divine holiness.', 'The chapter interprets the judgment as a defense of divine holiness. The detail appears in Leviticus 10:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 10 use the detail ''I will be sanctified in them that come near me'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 4, 'How does Leviticus 10 use the detail ''Mishael and Elzaphan'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter shows that even after divine judgment, holiness governed the aftermath.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that even after divine judgment, holiness governed the aftermath.', 'The chapter shows that even after divine judgment, holiness governed the aftermath. The detail appears in Leviticus 10:4-5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 10 use the detail ''Mishael and Elzaphan'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 4, 'How does Leviticus 10 use the detail ''Strange fire which he had not commanded them'' within the chapter as a whole?', '["The chapter begins with judgment on self-chosen worship.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter begins with judgment on self-chosen worship.', 'The chapter begins with judgment on self-chosen worship. The detail appears in Leviticus 10:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 10 use the detail ''Strange fire which he had not commanded them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 4, 'How does Leviticus 10 use the detail ''Wine or strong drink'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter connects sober discernment with guarding holiness."]'::jsonb, 'The chapter connects sober discernment with guarding holiness.', 'The chapter connects sober discernment with guarding holiness. The detail appears in Leviticus 10:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 10 use the detail ''Wine or strong drink'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 5, 'What larger theological point in Leviticus 10 is reinforced by the detail ''Because such things had befallen him''?', '["The chapter recognizes the strain between grief and priestly duty.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter recognizes the strain between grief and priestly duty.', 'The chapter recognizes the strain between grief and priestly duty. In context, the chapter uses this detail as part of that wider point (Leviticus 10:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 10 is reinforced by the detail ''Because such things had befallen him''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 5, 'What larger theological point in Leviticus 10 is reinforced by the detail ''Between the holy and the common, and between the unclean and the clean''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Priesthood involved moral and ritual discernment, not merely ritual action."]'::jsonb, 'Priesthood involved moral and ritual discernment, not merely ritual action.', 'Priesthood involved moral and ritual discernment, not merely ritual action. In context, the chapter uses this detail as part of that wider point (Leviticus 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 10 is reinforced by the detail ''Between the holy and the common, and between the unclean and the clean''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 5, 'What larger theological point in Leviticus 10 is reinforced by the detail ''Fire came out from before the LORD and devoured them''?', '["The same presence that accepts true worship also judges profanation.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The same presence that accepts true worship also judges profanation.', 'The same presence that accepts true worship also judges profanation. In context, the chapter uses this detail as part of that wider point (Leviticus 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 10 is reinforced by the detail ''Fire came out from before the LORD and devoured them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 5, 'What larger theological point in Leviticus 10 is reinforced by the detail ''I will be sanctified in them that come near me''?', '["That worship can be detached from covenant obedience", "Nearness to God increases responsibility for reverence.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Nearness to God increases responsibility for reverence.', 'Nearness to God increases responsibility for reverence. In context, the chapter uses this detail as part of that wider point (Leviticus 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 10 is reinforced by the detail ''I will be sanctified in them that come near me''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 5, 'What larger theological point in Leviticus 10 is reinforced by the detail ''Mishael and Elzaphan''?', '["That worship can be detached from covenant obedience", "Judgment within the sanctuary still required ordered handling.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Judgment within the sanctuary still required ordered handling.', 'Judgment within the sanctuary still required ordered handling. In context, the chapter uses this detail as part of that wider point (Leviticus 10:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 10 is reinforced by the detail ''Mishael and Elzaphan''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 5, 'What larger theological point in Leviticus 10 is reinforced by the detail ''Strange fire which he had not commanded them''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Holy worship cannot be improvised against God''s command."]'::jsonb, 'Holy worship cannot be improvised against God''s command.', 'Holy worship cannot be improvised against God''s command. In context, the chapter uses this detail as part of that wider point (Leviticus 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 10 is reinforced by the detail ''Strange fire which he had not commanded them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 10, 5, 'What larger theological point in Leviticus 10 is reinforced by the detail ''Wine or strong drink''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Priestly clarity and self-control mattered in holy service.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Priestly clarity and self-control mattered in holy service.', 'Priestly clarity and self-control mattered in holy service. In context, the chapter uses this detail as part of that wider point (Leviticus 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 10 is reinforced by the detail ''Wine or strong drink''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 1, 'What happened to a person who touched the carcass of an unclean animal?', '["He was cut off from the camp immediately", "He had to shave his head", "He became unclean for forty days", "He was unclean until the evening"]'::jsonb, 'He was unclean until the evening', 'Touching carcasses brought temporary uncleanness until evening. (Leviticus 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to a person who touched the carcass of an unclean animal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 1, 'What two features made a land animal clean in Leviticus 11?', '["It has horns and is domesticated", "It lives near the camp and has wool", "It is male and at least a year old", "It parts the hoof and chews the cud"]'::jsonb, 'It parts the hoof and chews the cud', 'Both characteristics were required for land animals. (Leviticus 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What two features made a land animal clean in Leviticus 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 1, 'What two features made creatures in the waters clean?', '["Fins and scales", "Gills and smooth skin", "Fresh water and white flesh", "Shell and claws"]'::jsonb, 'Fins and scales', 'Water creatures needed both fins and scales to be clean. (Leviticus 11:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What two features made creatures in the waters clean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 1, 'What was the purpose of this law of animals and birds?', '["To identify offerings for each feast", "To make a distinction between the unclean and the clean", "To increase the herds of Israel", "To prevent trade with foreigners"]'::jsonb, 'To make a distinction between the unclean and the clean', 'The chapter closes by stating that the law teaches distinction. (Leviticus 11:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the purpose of this law of animals and birds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 1, 'Which bird is specifically listed among the unclean?', '["The dove", "The eagle", "The quail", "The sparrow"]'::jsonb, 'The eagle', 'The eagle appears among the birds Israel was not to eat. (Leviticus 11:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which bird is specifically listed among the unclean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 1, 'Which winged creeping things were allowed?', '["All beetles that fly at night", "Only bees and moths", "Those with jumping legs above their feet, such as locusts", "Any insect with four wings"]'::jsonb, 'Those with jumping legs above their feet, such as locusts', 'Certain locust-like insects were permitted because of their jumping legs. (Leviticus 11:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which winged creeping things were allowed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 1, 'Why were the Israelites to sanctify themselves in these food laws?', '["Because the LORD is holy", "Because the nations feared them", "Because priests needed more food", "Because the land was too dry for all animals"]'::jsonb, 'Because the LORD is holy', 'The reason given is the holiness of the LORD who brought them out of Egypt. (Leviticus 11:44-45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were the Israelites to sanctify themselves in these food laws?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 2, 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:13)', '["The dove", "The eagle", "The quail", "The sparrow"]'::jsonb, 'The eagle', 'The eagle appears among the birds Israel was not to eat. That detail is part of the clean and unclean animals instructions in Leviticus 11:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:13)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 2, 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:21-22)', '["All beetles that fly at night", "Only bees and moths", "Those with jumping legs above their feet, such as locusts", "Any insect with four wings"]'::jsonb, 'Those with jumping legs above their feet, such as locusts', 'Certain locust-like insects were permitted because of their jumping legs. That detail is part of the clean and unclean animals instructions in Leviticus 11:21-22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:21-22)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 2, 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:24)', '["He was cut off from the camp immediately", "He had to shave his head", "He became unclean for forty days", "He was unclean until the evening"]'::jsonb, 'He was unclean until the evening', 'Touching carcasses brought temporary uncleanness until evening. That detail is part of the clean and unclean animals instructions in Leviticus 11:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:24)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 2, 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:3)', '["It has horns and is domesticated", "It lives near the camp and has wool", "It is male and at least a year old", "It parts the hoof and chews the cud"]'::jsonb, 'It parts the hoof and chews the cud', 'Both characteristics were required for land animals. That detail is part of the clean and unclean animals instructions in Leviticus 11:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 2, 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:44-45)', '["Because the LORD is holy", "Because the nations feared them", "Because priests needed more food", "Because the land was too dry for all animals"]'::jsonb, 'Because the LORD is holy', 'The reason given is the holiness of the LORD who brought them out of Egypt. That detail is part of the clean and unclean animals instructions in Leviticus 11:44-45.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:44-45)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 2, 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:47)', '["To identify offerings for each feast", "To make a distinction between the unclean and the clean", "To increase the herds of Israel", "To prevent trade with foreigners"]'::jsonb, 'To make a distinction between the unclean and the clean', 'The chapter closes by stating that the law teaches distinction. That detail is part of the clean and unclean animals instructions in Leviticus 11:47.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:47)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 2, 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:9)', '["Fins and scales", "Gills and smooth skin", "Fresh water and white flesh", "Shell and claws"]'::jsonb, 'Fins and scales', 'Water creatures needed both fins and scales to be clean. That detail is part of the clean and unclean animals instructions in Leviticus 11:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 11, which detail fits the clean and unclean animals instructions? (Leviticus 11:9)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 3, 'In Leviticus 11, what does this detail chiefly emphasize: because the lord is holy?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Dietary laws serve the deeper call to reflect God''s holiness."]'::jsonb, 'Dietary laws serve the deeper call to reflect God''s holiness.', 'Dietary laws serve the deeper call to reflect God''s holiness. The reason given is the holiness of the LORD who brought them out of Egypt. (Leviticus 11:44-45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 11, what does this detail chiefly emphasize: because the lord is holy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 3, 'In Leviticus 11, what does this detail chiefly emphasize: fins and scales?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The clean-unclean distinction extended across creation realms."]'::jsonb, 'The clean-unclean distinction extended across creation realms.', 'The clean-unclean distinction extended across creation realms. Water creatures needed both fins and scales to be clean. (Leviticus 11:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 11, what does this detail chiefly emphasize: fins and scales?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 3, 'In Leviticus 11, what does this detail chiefly emphasize: he was unclean until the evening?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Impurity could spread by contact and required temporary separation.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Impurity could spread by contact and required temporary separation.', 'Impurity could spread by contact and required temporary separation. Touching carcasses brought temporary uncleanness until evening. (Leviticus 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 11, what does this detail chiefly emphasize: he was unclean until the evening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 3, 'In Leviticus 11, what does this detail chiefly emphasize: it parts the hoof and chews the cud?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holiness shaped even Israel''s diet through divinely set distinctions.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness shaped even Israel''s diet through divinely set distinctions.', 'Holiness shaped even Israel''s diet through divinely set distinctions. Both characteristics were required for land animals. (Leviticus 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 11, what does this detail chiefly emphasize: it parts the hoof and chews the cud?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 3, 'In Leviticus 11, what does this detail chiefly emphasize: the eagle?', '["The chapter names specific exclusions rather than leaving holiness undefined.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter names specific exclusions rather than leaving holiness undefined.', 'The chapter names specific exclusions rather than leaving holiness undefined. The eagle appears among the birds Israel was not to eat. (Leviticus 11:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 11, what does this detail chiefly emphasize: the eagle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 3, 'In Leviticus 11, what does this detail chiefly emphasize: those with jumping legs above their feet, such as locusts?', '["That ritual details were optional once the offering began", "God''s distinctions included exceptions that still followed his stated rule.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'God''s distinctions included exceptions that still followed his stated rule.', 'God''s distinctions included exceptions that still followed his stated rule. Certain locust-like insects were permitted because of their jumping legs. (Leviticus 11:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 11, what does this detail chiefly emphasize: those with jumping legs above their feet, such as locusts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 3, 'In Leviticus 11, what does this detail chiefly emphasize: to make a distinction between the unclean and the clean?', '["Discernment itself is a covenant discipline.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Discernment itself is a covenant discipline.', 'Discernment itself is a covenant discipline. The chapter closes by stating that the law teaches distinction. (Leviticus 11:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 11, what does this detail chiefly emphasize: to make a distinction between the unclean and the clean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 4, 'How does Leviticus 11 use the detail ''Because the LORD is holy'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter grounds food distinctions in covenant identity, not mere hygiene."]'::jsonb, 'The chapter grounds food distinctions in covenant identity, not mere hygiene.', 'The chapter grounds food distinctions in covenant identity, not mere hygiene. The detail appears in Leviticus 11:44-45.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 11 use the detail ''Because the LORD is holy'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 4, 'How does Leviticus 11 use the detail ''Fins and scales'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter applies ordered discernment to sea life as well as land animals."]'::jsonb, 'The chapter applies ordered discernment to sea life as well as land animals.', 'The chapter applies ordered discernment to sea life as well as land animals. The detail appears in Leviticus 11:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 11 use the detail ''Fins and scales'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 4, 'How does Leviticus 11 use the detail ''He was unclean until the evening'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter teaches Israel to notice how defilement moves through contact.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter teaches Israel to notice how defilement moves through contact.', 'The chapter teaches Israel to notice how defilement moves through contact. The detail appears in Leviticus 11:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 11 use the detail ''He was unclean until the evening'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 4, 'How does Leviticus 11 use the detail ''It parts the hoof and chews the cud'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter trains Israel to live by God''s categories in ordinary eating.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter trains Israel to live by God''s categories in ordinary eating.', 'The chapter trains Israel to live by God''s categories in ordinary eating. The detail appears in Leviticus 11:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 11 use the detail ''It parts the hoof and chews the cud'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 4, 'How does Leviticus 11 use the detail ''The eagle'' within the chapter as a whole?', '["The chapter uses concrete examples to form habitual obedience.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter uses concrete examples to form habitual obedience.', 'The chapter uses concrete examples to form habitual obedience. The detail appears in Leviticus 11:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 11 use the detail ''The eagle'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 4, 'How does Leviticus 11 use the detail ''Those with jumping legs above their feet, such as locusts'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter teaches holiness by careful attention to the terms God gives.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter teaches holiness by careful attention to the terms God gives.', 'The chapter teaches holiness by careful attention to the terms God gives. The detail appears in Leviticus 11:21-22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 11 use the detail ''Those with jumping legs above their feet, such as locusts'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 4, 'How does Leviticus 11 use the detail ''To make a distinction between the unclean and the clean'' within the chapter as a whole?', '["The chapter ends by defining holiness as learned discrimination under God''s word.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ends by defining holiness as learned discrimination under God''s word.', 'The chapter ends by defining holiness as learned discrimination under God''s word. The detail appears in Leviticus 11:47.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 11 use the detail ''To make a distinction between the unclean and the clean'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 5, 'What larger theological point in Leviticus 11 is reinforced by the detail ''Because the LORD is holy''?', '["That worship can be detached from covenant obedience", "Dietary laws serve the deeper call to reflect God''s holiness.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Dietary laws serve the deeper call to reflect God''s holiness.', 'Dietary laws serve the deeper call to reflect God''s holiness. In context, the chapter uses this detail as part of that wider point (Leviticus 11:44-45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 11 is reinforced by the detail ''Because the LORD is holy''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 5, 'What larger theological point in Leviticus 11 is reinforced by the detail ''Fins and scales''?', '["That worship can be detached from covenant obedience", "The clean-unclean distinction extended across creation realms.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The clean-unclean distinction extended across creation realms.', 'The clean-unclean distinction extended across creation realms. In context, the chapter uses this detail as part of that wider point (Leviticus 11:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 11 is reinforced by the detail ''Fins and scales''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 5, 'What larger theological point in Leviticus 11 is reinforced by the detail ''He was unclean until the evening''?', '["Impurity could spread by contact and required temporary separation.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Impurity could spread by contact and required temporary separation.', 'Impurity could spread by contact and required temporary separation. In context, the chapter uses this detail as part of that wider point (Leviticus 11:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 11 is reinforced by the detail ''He was unclean until the evening''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 5, 'What larger theological point in Leviticus 11 is reinforced by the detail ''It parts the hoof and chews the cud''?', '["Holiness shaped even Israel''s diet through divinely set distinctions.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness shaped even Israel''s diet through divinely set distinctions.', 'Holiness shaped even Israel''s diet through divinely set distinctions. In context, the chapter uses this detail as part of that wider point (Leviticus 11:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 11 is reinforced by the detail ''It parts the hoof and chews the cud''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 5, 'What larger theological point in Leviticus 11 is reinforced by the detail ''The eagle''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The chapter names specific exclusions rather than leaving holiness undefined.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter names specific exclusions rather than leaving holiness undefined.', 'The chapter names specific exclusions rather than leaving holiness undefined. In context, the chapter uses this detail as part of that wider point (Leviticus 11:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 11 is reinforced by the detail ''The eagle''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 5, 'What larger theological point in Leviticus 11 is reinforced by the detail ''Those with jumping legs above their feet, such as locusts''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "God''s distinctions included exceptions that still followed his stated rule."]'::jsonb, 'God''s distinctions included exceptions that still followed his stated rule.', 'God''s distinctions included exceptions that still followed his stated rule. In context, the chapter uses this detail as part of that wider point (Leviticus 11:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 11 is reinforced by the detail ''Those with jumping legs above their feet, such as locusts''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 11, 5, 'What larger theological point in Leviticus 11 is reinforced by the detail ''To make a distinction between the unclean and the clean''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Discernment itself is a covenant discipline.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Discernment itself is a covenant discipline.', 'Discernment itself is a covenant discipline. In context, the chapter uses this detail as part of that wider point (Leviticus 11:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 11 is reinforced by the detail ''To make a distinction between the unclean and the clean''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 1, 'How long did the mother remain in the blood of purification after a male child?', '["Seven days", "Sixty-six days", "Thirty-three days", "Eighty days"]'::jsonb, 'Thirty-three days', 'After the initial seven days, thirty-three more days completed the period for a son. (Leviticus 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long did the mother remain in the blood of purification after a male child?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 1, 'How many days was a woman unclean after bearing a male child?', '["Seven days", "Fourteen days", "Thirty-three days", "Forty days"]'::jsonb, 'Seven days', 'A mother was unclean seven days after the birth of a son. (Leviticus 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many days was a woman unclean after bearing a male child?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 1, 'How many days was the purification period after a female child?', '["Forty days in all", "Sixty days in all", "Ninety days in all", "Eighty days in all"]'::jsonb, 'Eighty days in all', 'Fourteen days of uncleanness plus sixty-six days of purification made eighty days. (Leviticus 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many days was the purification period after a female child?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 1, 'On what day was a male child to be circumcised?', '["The seventh day", "The eighth day", "The fourteenth day", "The fortieth day"]'::jsonb, 'The eighth day', 'Circumcision took place on the eighth day. (Leviticus 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'On what day was a male child to be circumcised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 1, 'What provision was made if the woman could not afford a lamb?', '["She could bring a basket of meal only", "She could bring two turtledoves or two young pigeons", "She could bring a goat from the flock", "She needed no offering at all"]'::jsonb, 'She could bring two turtledoves or two young pigeons', 'The law included a provision for the poor. (Leviticus 12:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What provision was made if the woman could not afford a lamb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 1, 'What two offerings were normally brought at the end of the purification days?', '["A lamb for a burnt offering and a young pigeon or turtledove for a sin offering", "Two lambs for peace offerings", "A ram for guilt and a goat for sin", "Fine flour and frankincense only"]'::jsonb, 'A lamb for a burnt offering and a young pigeon or turtledove for a sin offering', 'These offerings completed the mother''s purification. (Leviticus 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What two offerings were normally brought at the end of the purification days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 1, 'What was the result after the priest made atonement for her?', '["She entered a Nazirite vow", "She remained outside the camp another week", "She was cleansed from the fountain of her blood", "She became free from all vows"]'::jsonb, 'She was cleansed from the fountain of her blood', 'Priestly atonement completed her cleansing. (Leviticus 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the result after the priest made atonement for her?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 2, 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:2)', '["Seven days", "Fourteen days", "Thirty-three days", "Forty days"]'::jsonb, 'Seven days', 'A mother was unclean seven days after the birth of a son. That detail is part of the purification after childbirth instructions in Leviticus 12:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 2, 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:3)', '["The seventh day", "The eighth day", "The fourteenth day", "The fortieth day"]'::jsonb, 'The eighth day', 'Circumcision took place on the eighth day. That detail is part of the purification after childbirth instructions in Leviticus 12:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 2, 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:4)', '["Seven days", "Sixty-six days", "Thirty-three days", "Eighty days"]'::jsonb, 'Thirty-three days', 'After the initial seven days, thirty-three more days completed the period for a son. That detail is part of the purification after childbirth instructions in Leviticus 12:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 2, 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:5)', '["Forty days in all", "Sixty days in all", "Ninety days in all", "Eighty days in all"]'::jsonb, 'Eighty days in all', 'Fourteen days of uncleanness plus sixty-six days of purification made eighty days. That detail is part of the purification after childbirth instructions in Leviticus 12:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 2, 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:6)', '["A lamb for a burnt offering and a young pigeon or turtledove for a sin offering", "Two lambs for peace offerings", "A ram for guilt and a goat for sin", "Fine flour and frankincense only"]'::jsonb, 'A lamb for a burnt offering and a young pigeon or turtledove for a sin offering', 'These offerings completed the mother''s purification. That detail is part of the purification after childbirth instructions in Leviticus 12:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:6)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 2, 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:7)', '["She entered a Nazirite vow", "She remained outside the camp another week", "She was cleansed from the fountain of her blood", "She became free from all vows"]'::jsonb, 'She was cleansed from the fountain of her blood', 'Priestly atonement completed her cleansing. That detail is part of the purification after childbirth instructions in Leviticus 12:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:7)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 2, 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:8)', '["She could bring a basket of meal only", "She could bring two turtledoves or two young pigeons", "She could bring a goat from the flock", "She needed no offering at all"]'::jsonb, 'She could bring two turtledoves or two young pigeons', 'The law included a provision for the poor. That detail is part of the purification after childbirth instructions in Leviticus 12:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 12, which detail fits the purification after childbirth instructions? (Leviticus 12:8)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 3, 'In Leviticus 12, what does this detail chiefly emphasize: a lamb for a burnt offering and a young pigeon or turtledove for a sin offering?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Purification culminated in priestly mediation and sacrifice."]'::jsonb, 'Purification culminated in priestly mediation and sacrifice.', 'Purification culminated in priestly mediation and sacrifice. These offerings completed the mother''s purification. (Leviticus 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 12, what does this detail chiefly emphasize: a lamb for a burnt offering and a young pigeon or turtledove for a sin offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 3, 'In Leviticus 12, what does this detail chiefly emphasize: eighty days in all?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The law prescribed different lengths while maintaining the same path to purification.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The law prescribed different lengths while maintaining the same path to purification.', 'The law prescribed different lengths while maintaining the same path to purification. Fourteen days of uncleanness plus sixty-six days of purification made eighty days. (Leviticus 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 12, what does this detail chiefly emphasize: eighty days in all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 3, 'In Leviticus 12, what does this detail chiefly emphasize: seven days?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Childbirth brought a period of ritual impurity requiring ordered purification."]'::jsonb, 'Childbirth brought a period of ritual impurity requiring ordered purification.', 'Childbirth brought a period of ritual impurity requiring ordered purification. A mother was unclean seven days after the birth of a son. (Leviticus 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 12, what does this detail chiefly emphasize: seven days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 3, 'In Leviticus 12, what does this detail chiefly emphasize: she could bring two turtledoves or two young pigeons?', '["Holiness did not exclude the poor from purification.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness did not exclude the poor from purification.', 'Holiness did not exclude the poor from purification. The law included a provision for the poor. (Leviticus 12:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 12, what does this detail chiefly emphasize: she could bring two turtledoves or two young pigeons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 3, 'In Leviticus 12, what does this detail chiefly emphasize: she was cleansed from the fountain of her blood?', '["That ritual details were optional once the offering began", "The chapter presents purification as restoration to covenant normality.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter presents purification as restoration to covenant normality.', 'The chapter presents purification as restoration to covenant normality. Priestly atonement completed her cleansing. (Leviticus 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 12, what does this detail chiefly emphasize: she was cleansed from the fountain of her blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 3, 'In Leviticus 12, what does this detail chiefly emphasize: the eighth day?', '["The birth law intersects with covenant sign and identity.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The birth law intersects with covenant sign and identity.', 'The birth law intersects with covenant sign and identity. Circumcision took place on the eighth day. (Leviticus 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 12, what does this detail chiefly emphasize: the eighth day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 3, 'In Leviticus 12, what does this detail chiefly emphasize: thirty-three days?', '["That ritual details were optional once the offering began", "The law set clear time boundaries for restored sanctuary access.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The law set clear time boundaries for restored sanctuary access.', 'The law set clear time boundaries for restored sanctuary access. After the initial seven days, thirty-three more days completed the period for a son. (Leviticus 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 12, what does this detail chiefly emphasize: thirty-three days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 4, 'How does Leviticus 12 use the detail ''A lamb for a burnt offering and a young pigeon or turtledove for a sin offering'' within the chapter as a whole?', '["The chapter shows that restored cleanness involved sacrificial approach to God.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that restored cleanness involved sacrificial approach to God.', 'The chapter shows that restored cleanness involved sacrificial approach to God. The detail appears in Leviticus 12:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 12 use the detail ''A lamb for a burnt offering and a young pigeon or turtledove for a sin offering'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 4, 'How does Leviticus 12 use the detail ''Eighty days in all'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter regulates family life with fixed covenant rhythms."]'::jsonb, 'The chapter regulates family life with fixed covenant rhythms.', 'The chapter regulates family life with fixed covenant rhythms. The detail appears in Leviticus 12:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 12 use the detail ''Eighty days in all'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 4, 'How does Leviticus 12 use the detail ''Seven days'' within the chapter as a whole?', '["The chapter applies holiness rules to one of life''s most basic experiences.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter applies holiness rules to one of life''s most basic experiences.', 'The chapter applies holiness rules to one of life''s most basic experiences. The detail appears in Leviticus 12:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 12 use the detail ''Seven days'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 4, 'How does Leviticus 12 use the detail ''She could bring two turtledoves or two young pigeons'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter balances costly worship with merciful accessibility.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter balances costly worship with merciful accessibility.', 'The chapter balances costly worship with merciful accessibility. The detail appears in Leviticus 12:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 12 use the detail ''She could bring two turtledoves or two young pigeons'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 4, 'How does Leviticus 12 use the detail ''She was cleansed from the fountain of her blood'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter ends with full reintegration through appointed sacrifice.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ends with full reintegration through appointed sacrifice.', 'The chapter ends with full reintegration through appointed sacrifice. The detail appears in Leviticus 12:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 12 use the detail ''She was cleansed from the fountain of her blood'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 4, 'How does Leviticus 12 use the detail ''The eighth day'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter links purification law with covenant belonging.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter links purification law with covenant belonging.', 'The chapter links purification law with covenant belonging. The detail appears in Leviticus 12:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 12 use the detail ''The eighth day'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 4, 'How does Leviticus 12 use the detail ''Thirty-three days'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter measures purification in ordered stages rather than vague custom.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter measures purification in ordered stages rather than vague custom.', 'The chapter measures purification in ordered stages rather than vague custom. The detail appears in Leviticus 12:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 12 use the detail ''Thirty-three days'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 5, 'What larger theological point in Leviticus 12 is reinforced by the detail ''A lamb for a burnt offering and a young pigeon or turtledove for a sin offering''?', '["That worship can be detached from covenant obedience", "Purification culminated in priestly mediation and sacrifice.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Purification culminated in priestly mediation and sacrifice.', 'Purification culminated in priestly mediation and sacrifice. In context, the chapter uses this detail as part of that wider point (Leviticus 12:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 12 is reinforced by the detail ''A lamb for a burnt offering and a young pigeon or turtledove for a sin offering''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 5, 'What larger theological point in Leviticus 12 is reinforced by the detail ''Eighty days in all''?', '["The law prescribed different lengths while maintaining the same path to purification.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The law prescribed different lengths while maintaining the same path to purification.', 'The law prescribed different lengths while maintaining the same path to purification. In context, the chapter uses this detail as part of that wider point (Leviticus 12:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 12 is reinforced by the detail ''Eighty days in all''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 5, 'What larger theological point in Leviticus 12 is reinforced by the detail ''Seven days''?', '["That worship can be detached from covenant obedience", "Childbirth brought a period of ritual impurity requiring ordered purification.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Childbirth brought a period of ritual impurity requiring ordered purification.', 'Childbirth brought a period of ritual impurity requiring ordered purification. In context, the chapter uses this detail as part of that wider point (Leviticus 12:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 12 is reinforced by the detail ''Seven days''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 5, 'What larger theological point in Leviticus 12 is reinforced by the detail ''She could bring two turtledoves or two young pigeons''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Holiness did not exclude the poor from purification.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness did not exclude the poor from purification.', 'Holiness did not exclude the poor from purification. In context, the chapter uses this detail as part of that wider point (Leviticus 12:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 12 is reinforced by the detail ''She could bring two turtledoves or two young pigeons''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 5, 'What larger theological point in Leviticus 12 is reinforced by the detail ''She was cleansed from the fountain of her blood''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The chapter presents purification as restoration to covenant normality."]'::jsonb, 'The chapter presents purification as restoration to covenant normality.', 'The chapter presents purification as restoration to covenant normality. In context, the chapter uses this detail as part of that wider point (Leviticus 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 12 is reinforced by the detail ''She was cleansed from the fountain of her blood''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 5, 'What larger theological point in Leviticus 12 is reinforced by the detail ''The eighth day''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The birth law intersects with covenant sign and identity.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The birth law intersects with covenant sign and identity.', 'The birth law intersects with covenant sign and identity. In context, the chapter uses this detail as part of that wider point (Leviticus 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 12 is reinforced by the detail ''The eighth day''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 12, 5, 'What larger theological point in Leviticus 12 is reinforced by the detail ''Thirty-three days''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The law set clear time boundaries for restored sanctuary access."]'::jsonb, 'The law set clear time boundaries for restored sanctuary access.', 'The law set clear time boundaries for restored sanctuary access. In context, the chapter uses this detail as part of that wider point (Leviticus 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 12 is reinforced by the detail ''Thirty-three days''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 1, 'How long was a person typically shut up for initial observation?', '["One day", "Fourteen days only", "Thirty days", "Seven days"]'::jsonb, 'Seven days', 'The priest isolated the person for a seven-day examination period. (Leviticus 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long was a person typically shut up for initial observation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 1, 'What kinds of items could also be examined for a plague?', '["Only wooden bowls", "Only silver vessels", "Garments of wool, linen, or leather", "Only sandals made of reed"]'::jsonb, 'Garments of wool, linen, or leather', 'The chapter also treats mildew-like plagues in garments and leather. (Leviticus 13:47-49).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kinds of items could also be examined for a plague?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 1, 'What sign in the sore suggested uncleanness?', '["It bled freely and smelled sweet", "It was warm but faded by evening", "The hair in it turned white and it appeared deeper than the skin", "It had black hair and stayed level"]'::jsonb, 'The hair in it turned white and it appeared deeper than the skin', 'These visible signs indicated a serious skin disease. (Leviticus 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What sign in the sore suggested uncleanness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 1, 'What was the diseased person to cry out if declared unclean?', '["Unclean, unclean", "Mercy, mercy", "Outside, outside", "Woe to me"]'::jsonb, 'Unclean, unclean', 'The person had to identify his condition publicly. (Leviticus 13:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the diseased person to cry out if declared unclean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 1, 'What was to be done with a garment if the plague spread in it?', '["It was to be washed three times and kept", "It was to be given to the poor", "It was to be stored outside the camp for a year", "It was to be burned with fire"]'::jsonb, 'It was to be burned with fire', 'A spreading plague in a garment required destruction by fire. (Leviticus 13:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was to be done with a garment if the plague spread in it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 1, 'Where was the unclean person to dwell?', '["In the priest''s court", "Alone outside the camp", "With other mourners inside the camp", "At the city gate during daytime only"]'::jsonb, 'Alone outside the camp', 'Exclusion from the camp marked the seriousness of the impurity. (Leviticus 13:46).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was the unclean person to dwell?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 1, 'Who examined a suspicious skin disease in Leviticus 13?', '["The tribal judge", "Aaron the priest or one of his sons", "The head of the household", "Moses alone"]'::jsonb, 'Aaron the priest or one of his sons', 'Priests determined whether a person was clean or unclean. (Leviticus 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who examined a suspicious skin disease in Leviticus 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 2, 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:2)', '["The tribal judge", "Aaron the priest or one of his sons", "The head of the household", "Moses alone"]'::jsonb, 'Aaron the priest or one of his sons', 'Priests determined whether a person was clean or unclean. That detail is part of the diagnosis of leprosy and mold-like plague instructions in Leviticus 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 2, 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:3)', '["It bled freely and smelled sweet", "It was warm but faded by evening", "The hair in it turned white and it appeared deeper than the skin", "It had black hair and stayed level"]'::jsonb, 'The hair in it turned white and it appeared deeper than the skin', 'These visible signs indicated a serious skin disease. That detail is part of the diagnosis of leprosy and mold-like plague instructions in Leviticus 13:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 2, 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:4)', '["One day", "Fourteen days only", "Thirty days", "Seven days"]'::jsonb, 'Seven days', 'The priest isolated the person for a seven-day examination period. That detail is part of the diagnosis of leprosy and mold-like plague instructions in Leviticus 13:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 2, 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:45)', '["Unclean, unclean", "Mercy, mercy", "Outside, outside", "Woe to me"]'::jsonb, 'Unclean, unclean', 'The person had to identify his condition publicly. That detail is part of the diagnosis of leprosy and mold-like plague instructions in Leviticus 13:45.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:45)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 2, 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:46)', '["In the priest''s court", "Alone outside the camp", "With other mourners inside the camp", "At the city gate during daytime only"]'::jsonb, 'Alone outside the camp', 'Exclusion from the camp marked the seriousness of the impurity. That detail is part of the diagnosis of leprosy and mold-like plague instructions in Leviticus 13:46.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:46)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 2, 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:47-49)', '["Only wooden bowls", "Only silver vessels", "Garments of wool, linen, or leather", "Only sandals made of reed"]'::jsonb, 'Garments of wool, linen, or leather', 'The chapter also treats mildew-like plagues in garments and leather. That detail is part of the diagnosis of leprosy and mold-like plague instructions in Leviticus 13:47-49.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:47-49)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 2, 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:52)', '["It was to be washed three times and kept", "It was to be given to the poor", "It was to be stored outside the camp for a year", "It was to be burned with fire"]'::jsonb, 'It was to be burned with fire', 'A spreading plague in a garment required destruction by fire. That detail is part of the diagnosis of leprosy and mold-like plague instructions in Leviticus 13:52.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 13, which detail fits the diagnosis of leprosy and mold-like plague instructions? (Leviticus 13:52)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 3, 'In Leviticus 13, what does this detail chiefly emphasize: aaron the priest or one of his sons?', '["Priestly ministry included diagnostic discernment, not just sacrifice.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly ministry included diagnostic discernment, not just sacrifice.', 'Priestly ministry included diagnostic discernment, not just sacrifice. Priests determined whether a person was clean or unclean. (Leviticus 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 13, what does this detail chiefly emphasize: aaron the priest or one of his sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 3, 'In Leviticus 13, what does this detail chiefly emphasize: alone outside the camp?', '["Uncleanness required separation from the holy community.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Uncleanness required separation from the holy community.', 'Uncleanness required separation from the holy community. Exclusion from the camp marked the seriousness of the impurity. (Leviticus 13:46).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 13, what does this detail chiefly emphasize: alone outside the camp?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 3, 'In Leviticus 13, what does this detail chiefly emphasize: garments of wool, linen, or leather?', '["That ritual details were optional once the offering began", "Defilement could affect objects as well as bodies.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Defilement could affect objects as well as bodies.', 'Defilement could affect objects as well as bodies. The chapter also treats mildew-like plagues in garments and leather. (Leviticus 13:47-49).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 13, what does this detail chiefly emphasize: garments of wool, linen, or leather?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 3, 'In Leviticus 13, what does this detail chiefly emphasize: it was to be burned with fire?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Persistent impurity had to be removed, not merely covered.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Persistent impurity had to be removed, not merely covered.', 'Persistent impurity had to be removed, not merely covered. A spreading plague in a garment required destruction by fire. (Leviticus 13:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 13, what does this detail chiefly emphasize: it was to be burned with fire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 3, 'In Leviticus 13, what does this detail chiefly emphasize: seven days?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Time and patient observation mattered in judgments of impurity.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Time and patient observation mattered in judgments of impurity.', 'Time and patient observation mattered in judgments of impurity. The priest isolated the person for a seven-day examination period. (Leviticus 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 13, what does this detail chiefly emphasize: seven days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 3, 'In Leviticus 13, what does this detail chiefly emphasize: the hair in it turned white and it appeared deeper than the skin?', '["That ritual details were optional once the offering began", "Impurity had observable marks that required careful assessment.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Impurity had observable marks that required careful assessment.', 'Impurity had observable marks that required careful assessment. These visible signs indicated a serious skin disease. (Leviticus 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 13, what does this detail chiefly emphasize: the hair in it turned white and it appeared deeper than the skin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 3, 'In Leviticus 13, what does this detail chiefly emphasize: unclean, unclean?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Impurity affected community life and could not be hidden."]'::jsonb, 'Impurity affected community life and could not be hidden.', 'Impurity affected community life and could not be hidden. The person had to identify his condition publicly. (Leviticus 13:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 13, what does this detail chiefly emphasize: unclean, unclean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 4, 'How does Leviticus 13 use the detail ''Aaron the priest or one of his sons'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter entrusts judgments of impurity to priestly authority.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter entrusts judgments of impurity to priestly authority.', 'The chapter entrusts judgments of impurity to priestly authority. The detail appears in Leviticus 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 13 use the detail ''Aaron the priest or one of his sons'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 4, 'How does Leviticus 13 use the detail ''Alone outside the camp'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter dramatizes impurity as incompatible with camp holiness.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter dramatizes impurity as incompatible with camp holiness.', 'The chapter dramatizes impurity as incompatible with camp holiness. The detail appears in Leviticus 13:46.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 13 use the detail ''Alone outside the camp'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 4, 'How does Leviticus 13 use the detail ''Garments of wool, linen, or leather'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter extends priestly discernment to the material environment of Israel."]'::jsonb, 'The chapter extends priestly discernment to the material environment of Israel.', 'The chapter extends priestly discernment to the material environment of Israel. The detail appears in Leviticus 13:47-49.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 13 use the detail ''Garments of wool, linen, or leather'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 4, 'How does Leviticus 13 use the detail ''It was to be burned with fire'' within the chapter as a whole?', '["The chapter treats unchecked defilement as something to eradicate completely.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter treats unchecked defilement as something to eradicate completely.', 'The chapter treats unchecked defilement as something to eradicate completely. The detail appears in Leviticus 13:52.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 13 use the detail ''It was to be burned with fire'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 4, 'How does Leviticus 13 use the detail ''Seven days'' within the chapter as a whole?', '["The chapter favors careful evaluation over rash verdicts.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter favors careful evaluation over rash verdicts.', 'The chapter favors careful evaluation over rash verdicts. The detail appears in Leviticus 13:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 13 use the detail ''Seven days'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 4, 'How does Leviticus 13 use the detail ''The hair in it turned white and it appeared deeper than the skin'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter trains Israel to submit visible ambiguity to priestly testing."]'::jsonb, 'The chapter trains Israel to submit visible ambiguity to priestly testing.', 'The chapter trains Israel to submit visible ambiguity to priestly testing. The detail appears in Leviticus 13:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 13 use the detail ''The hair in it turned white and it appeared deeper than the skin'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 4, 'How does Leviticus 13 use the detail ''Unclean, unclean'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter makes uncleanness a communal as well as personal matter.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter makes uncleanness a communal as well as personal matter.', 'The chapter makes uncleanness a communal as well as personal matter. The detail appears in Leviticus 13:45.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 13 use the detail ''Unclean, unclean'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 5, 'What larger theological point in Leviticus 13 is reinforced by the detail ''Aaron the priest or one of his sons''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Priestly ministry included diagnostic discernment, not just sacrifice.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Priestly ministry included diagnostic discernment, not just sacrifice.', 'Priestly ministry included diagnostic discernment, not just sacrifice. In context, the chapter uses this detail as part of that wider point (Leviticus 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 13 is reinforced by the detail ''Aaron the priest or one of his sons''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 5, 'What larger theological point in Leviticus 13 is reinforced by the detail ''Alone outside the camp''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Uncleanness required separation from the holy community.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Uncleanness required separation from the holy community.', 'Uncleanness required separation from the holy community. In context, the chapter uses this detail as part of that wider point (Leviticus 13:46).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 13 is reinforced by the detail ''Alone outside the camp''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 5, 'What larger theological point in Leviticus 13 is reinforced by the detail ''Garments of wool, linen, or leather''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Defilement could affect objects as well as bodies."]'::jsonb, 'Defilement could affect objects as well as bodies.', 'Defilement could affect objects as well as bodies. In context, the chapter uses this detail as part of that wider point (Leviticus 13:47-49).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 13 is reinforced by the detail ''Garments of wool, linen, or leather''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 5, 'What larger theological point in Leviticus 13 is reinforced by the detail ''It was to be burned with fire''?', '["Persistent impurity had to be removed, not merely covered.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Persistent impurity had to be removed, not merely covered.', 'Persistent impurity had to be removed, not merely covered. In context, the chapter uses this detail as part of that wider point (Leviticus 13:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 13 is reinforced by the detail ''It was to be burned with fire''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 5, 'What larger theological point in Leviticus 13 is reinforced by the detail ''Seven days''?', '["Time and patient observation mattered in judgments of impurity.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Time and patient observation mattered in judgments of impurity.', 'Time and patient observation mattered in judgments of impurity. In context, the chapter uses this detail as part of that wider point (Leviticus 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 13 is reinforced by the detail ''Seven days''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 5, 'What larger theological point in Leviticus 13 is reinforced by the detail ''The hair in it turned white and it appeared deeper than the skin''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Impurity had observable marks that required careful assessment."]'::jsonb, 'Impurity had observable marks that required careful assessment.', 'Impurity had observable marks that required careful assessment. In context, the chapter uses this detail as part of that wider point (Leviticus 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 13 is reinforced by the detail ''The hair in it turned white and it appeared deeper than the skin''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 13, 5, 'What larger theological point in Leviticus 13 is reinforced by the detail ''Unclean, unclean''?', '["That worship can be detached from covenant obedience", "Impurity affected community life and could not be hidden.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Impurity affected community life and could not be hidden.', 'Impurity affected community life and could not be hidden. In context, the chapter uses this detail as part of that wider point (Leviticus 13:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 13 is reinforced by the detail ''Unclean, unclean''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 1, 'How many times was the cleansed person sprinkled with the bird''s blood mixture?', '["Seven times", "Three times", "Twelve times", "Once"]'::jsonb, 'Seven times', 'The person was sprinkled seven times and then pronounced clean. (Leviticus 14:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many times was the cleansed person sprinkled with the bird''s blood mixture?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 1, 'What body parts received blood and oil in the restored person''s rite?', '["The forehead, palms, and soles", "The right ear, right thumb, and right big toe", "The left ear, left thumb, and left toe", "The lips, chest, and knees"]'::jsonb, 'The right ear, right thumb, and right big toe', 'The same pattern seen in priestly consecration marked restored life for the cleansed person. (Leviticus 14:14-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What body parts received blood and oil in the restored person''s rite?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 1, 'What concession was given for a poor person in this cleansing ritual?', '["No sacrifice was needed", "Only water washing was required", "Reduced animal requirements while keeping the same basic rite", "The ritual could be delayed indefinitely"]'::jsonb, 'Reduced animal requirements while keeping the same basic rite', 'A poor person could bring fewer or cheaper offerings, but the pattern of cleansing remained. (Leviticus 14:21-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What concession was given for a poor person in this cleansing ritual?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 1, 'What had to happen if the house plague kept spreading after stones were removed and the house replastered?', '["The house had to be broken down", "The family had to leave it for seven years", "The priest had to wash it with oil", "A peace offering had to be eaten inside it"]'::jsonb, 'The house had to be broken down', 'Persistent plague required demolishing the house and removing its materials. (Leviticus 14:43-45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What had to happen if the house plague kept spreading after stones were removed and the house replastered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 1, 'What might a homeowner report to the priest regarding his house?', '["My roof has collapsed in the rain", "The altar smoke entered my tent", "A thief has broken my door", "It seems to me there is a plague in the house"]'::jsonb, 'It seems to me there is a plague in the house', 'The owner reported a suspected plague in the house for priestly inspection. (Leviticus 14:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What might a homeowner report to the priest regarding his house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 1, 'What two birds were required in the initial cleansing rite?', '["Two young pigeons only", "A dove and a raven", "A quail and a partridge", "Two living clean birds"]'::jsonb, 'Two living clean birds', 'Two clean living birds were used, along with cedar, scarlet, and hyssop. (Leviticus 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What two birds were required in the initial cleansing rite?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 1, 'Where was the priest to go to examine a person healed of leprosy?', '["Into the Most Holy Place", "To the person''s family tent", "Outside the camp", "To the gate of Egypt"]'::jsonb, 'Outside the camp', 'The priest met the cleansed person outside the camp before restoration. (Leviticus 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was the priest to go to examine a person healed of leprosy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 2, 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:14-18)', '["The forehead, palms, and soles", "The right ear, right thumb, and right big toe", "The left ear, left thumb, and left toe", "The lips, chest, and knees"]'::jsonb, 'The right ear, right thumb, and right big toe', 'The same pattern seen in priestly consecration marked restored life for the cleansed person. That detail is part of the cleansing of leper and house plague instructions in Leviticus 14:14-18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:14-18)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 2, 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:21-32)', '["No sacrifice was needed", "Only water washing was required", "Reduced animal requirements while keeping the same basic rite", "The ritual could be delayed indefinitely"]'::jsonb, 'Reduced animal requirements while keeping the same basic rite', 'A poor person could bring fewer or cheaper offerings, but the pattern of cleansing remained. That detail is part of the cleansing of leper and house plague instructions in Leviticus 14:21-32.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:21-32)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 2, 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:3)', '["Into the Most Holy Place", "To the person''s family tent", "Outside the camp", "To the gate of Egypt"]'::jsonb, 'Outside the camp', 'The priest met the cleansed person outside the camp before restoration. That detail is part of the cleansing of leper and house plague instructions in Leviticus 14:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 2, 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:35)', '["My roof has collapsed in the rain", "The altar smoke entered my tent", "A thief has broken my door", "It seems to me there is a plague in the house"]'::jsonb, 'It seems to me there is a plague in the house', 'The owner reported a suspected plague in the house for priestly inspection. That detail is part of the cleansing of leper and house plague instructions in Leviticus 14:35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:35)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 2, 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:4)', '["Two young pigeons only", "A dove and a raven", "A quail and a partridge", "Two living clean birds"]'::jsonb, 'Two living clean birds', 'Two clean living birds were used, along with cedar, scarlet, and hyssop. That detail is part of the cleansing of leper and house plague instructions in Leviticus 14:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 2, 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:43-45)', '["The house had to be broken down", "The family had to leave it for seven years", "The priest had to wash it with oil", "A peace offering had to be eaten inside it"]'::jsonb, 'The house had to be broken down', 'Persistent plague required demolishing the house and removing its materials. That detail is part of the cleansing of leper and house plague instructions in Leviticus 14:43-45.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:43-45)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 2, 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:7)', '["Seven times", "Three times", "Twelve times", "Once"]'::jsonb, 'Seven times', 'The person was sprinkled seven times and then pronounced clean. That detail is part of the cleansing of leper and house plague instructions in Leviticus 14:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 14, which detail fits the cleansing of leper and house plague instructions? (Leviticus 14:7)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 3, 'In Leviticus 14, what does this detail chiefly emphasize: it seems to me there is a plague in the house?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holiness reaches into domestic spaces, not only persons.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness reaches into domestic spaces, not only persons.', 'Holiness reaches into domestic spaces, not only persons. The owner reported a suspected plague in the house for priestly inspection. (Leviticus 14:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 14, what does this detail chiefly emphasize: it seems to me there is a plague in the house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 3, 'In Leviticus 14, what does this detail chiefly emphasize: outside the camp?', '["That ritual details were optional once the offering began", "Restoration begins where exclusion had been enforced.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Restoration begins where exclusion had been enforced.', 'Restoration begins where exclusion had been enforced. The priest met the cleansed person outside the camp before restoration. (Leviticus 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 14, what does this detail chiefly emphasize: outside the camp?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 3, 'In Leviticus 14, what does this detail chiefly emphasize: reduced animal requirements while keeping the same basic rite?', '["That ritual details were optional once the offering began", "The law preserved access to restoration for the poor.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The law preserved access to restoration for the poor.', 'The law preserved access to restoration for the poor. A poor person could bring fewer or cheaper offerings, but the pattern of cleansing remained. (Leviticus 14:21-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 14, what does this detail chiefly emphasize: reduced animal requirements while keeping the same basic rite?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 3, 'In Leviticus 14, what does this detail chiefly emphasize: seven times?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Repeated action underscores complete cleansing."]'::jsonb, 'Repeated action underscores complete cleansing.', 'Repeated action underscores complete cleansing. The person was sprinkled seven times and then pronounced clean. (Leviticus 14:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 14, what does this detail chiefly emphasize: seven times?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 3, 'In Leviticus 14, what does this detail chiefly emphasize: the house had to be broken down?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Deep defilement in the land required decisive removal."]'::jsonb, 'Deep defilement in the land required decisive removal.', 'Deep defilement in the land required decisive removal. Persistent plague required demolishing the house and removing its materials. (Leviticus 14:43-45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 14, what does this detail chiefly emphasize: the house had to be broken down?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 3, 'In Leviticus 14, what does this detail chiefly emphasize: the right ear, right thumb, and right big toe?', '["Cleansing restores a person to holy life in hearing, action, and walk.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Cleansing restores a person to holy life in hearing, action, and walk.', 'Cleansing restores a person to holy life in hearing, action, and walk. The same pattern seen in priestly consecration marked restored life for the cleansed person. (Leviticus 14:14-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 14, what does this detail chiefly emphasize: the right ear, right thumb, and right big toe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 3, 'In Leviticus 14, what does this detail chiefly emphasize: two living clean birds?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The cleansing rite used symbolic actions to mark release from impurity.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The cleansing rite used symbolic actions to mark release from impurity.', 'The cleansing rite used symbolic actions to mark release from impurity. Two clean living birds were used, along with cedar, scarlet, and hyssop. (Leviticus 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 14, what does this detail chiefly emphasize: two living clean birds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 4, 'How does Leviticus 14 use the detail ''It seems to me there is a plague in the house'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter extends cleansing laws from bodies to houses in the land.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter extends cleansing laws from bodies to houses in the land.', 'The chapter extends cleansing laws from bodies to houses in the land. The detail appears in Leviticus 14:35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 14 use the detail ''It seems to me there is a plague in the house'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 4, 'How does Leviticus 14 use the detail ''Outside the camp'' within the chapter as a whole?', '["The chapter moves from separation toward reintegration under priestly oversight.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter moves from separation toward reintegration under priestly oversight.', 'The chapter moves from separation toward reintegration under priestly oversight. The detail appears in Leviticus 14:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 14 use the detail ''Outside the camp'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 4, 'How does Leviticus 14 use the detail ''Reduced animal requirements while keeping the same basic rite'' within the chapter as a whole?', '["The chapter balances ceremonial integrity with covenant mercy.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter balances ceremonial integrity with covenant mercy.', 'The chapter balances ceremonial integrity with covenant mercy. The detail appears in Leviticus 14:21-32.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 14 use the detail ''Reduced animal requirements while keeping the same basic rite'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 4, 'How does Leviticus 14 use the detail ''Seven times'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter uses sevenfold sprinkling to signal fullness of restoration.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter uses sevenfold sprinkling to signal fullness of restoration.', 'The chapter uses sevenfold sprinkling to signal fullness of restoration. The detail appears in Leviticus 14:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 14 use the detail ''Seven times'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 4, 'How does Leviticus 14 use the detail ''The house had to be broken down'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter shows that stubborn impurity cannot simply be patched over.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that stubborn impurity cannot simply be patched over.', 'The chapter shows that stubborn impurity cannot simply be patched over. The detail appears in Leviticus 14:43-45.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 14 use the detail ''The house had to be broken down'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 4, 'How does Leviticus 14 use the detail ''The right ear, right thumb, and right big toe'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter portrays restoration as a kind of re-consecration."]'::jsonb, 'The chapter portrays restoration as a kind of re-consecration.', 'The chapter portrays restoration as a kind of re-consecration. The detail appears in Leviticus 14:14-18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 14 use the detail ''The right ear, right thumb, and right big toe'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 4, 'How does Leviticus 14 use the detail ''Two living clean birds'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter presents restoration through a vivid ceremonial sequence.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter presents restoration through a vivid ceremonial sequence.', 'The chapter presents restoration through a vivid ceremonial sequence. The detail appears in Leviticus 14:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 14 use the detail ''Two living clean birds'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 5, 'What larger theological point in Leviticus 14 is reinforced by the detail ''It seems to me there is a plague in the house''?', '["Holiness reaches into domestic spaces, not only persons.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness reaches into domestic spaces, not only persons.', 'Holiness reaches into domestic spaces, not only persons. In context, the chapter uses this detail as part of that wider point (Leviticus 14:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 14 is reinforced by the detail ''It seems to me there is a plague in the house''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 5, 'What larger theological point in Leviticus 14 is reinforced by the detail ''Outside the camp''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Restoration begins where exclusion had been enforced."]'::jsonb, 'Restoration begins where exclusion had been enforced.', 'Restoration begins where exclusion had been enforced. In context, the chapter uses this detail as part of that wider point (Leviticus 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 14 is reinforced by the detail ''Outside the camp''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 5, 'What larger theological point in Leviticus 14 is reinforced by the detail ''Reduced animal requirements while keeping the same basic rite''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The law preserved access to restoration for the poor."]'::jsonb, 'The law preserved access to restoration for the poor.', 'The law preserved access to restoration for the poor. In context, the chapter uses this detail as part of that wider point (Leviticus 14:21-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 14 is reinforced by the detail ''Reduced animal requirements while keeping the same basic rite''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 5, 'What larger theological point in Leviticus 14 is reinforced by the detail ''Seven times''?', '["That worship can be detached from covenant obedience", "Repeated action underscores complete cleansing.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Repeated action underscores complete cleansing.', 'Repeated action underscores complete cleansing. In context, the chapter uses this detail as part of that wider point (Leviticus 14:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 14 is reinforced by the detail ''Seven times''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 5, 'What larger theological point in Leviticus 14 is reinforced by the detail ''The house had to be broken down''?', '["That worship can be detached from covenant obedience", "Deep defilement in the land required decisive removal.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Deep defilement in the land required decisive removal.', 'Deep defilement in the land required decisive removal. In context, the chapter uses this detail as part of that wider point (Leviticus 14:43-45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 14 is reinforced by the detail ''The house had to be broken down''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 5, 'What larger theological point in Leviticus 14 is reinforced by the detail ''The right ear, right thumb, and right big toe''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Cleansing restores a person to holy life in hearing, action, and walk.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Cleansing restores a person to holy life in hearing, action, and walk.', 'Cleansing restores a person to holy life in hearing, action, and walk. In context, the chapter uses this detail as part of that wider point (Leviticus 14:14-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 14 is reinforced by the detail ''The right ear, right thumb, and right big toe''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 14, 5, 'What larger theological point in Leviticus 14 is reinforced by the detail ''Two living clean birds''?', '["The cleansing rite used symbolic actions to mark release from impurity.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The cleansing rite used symbolic actions to mark release from impurity.', 'The cleansing rite used symbolic actions to mark release from impurity. In context, the chapter uses this detail as part of that wider point (Leviticus 14:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 14 is reinforced by the detail ''Two living clean birds''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 1, 'How long did one who was touched by such uncleanness remain unclean?', '["For three days", "Until the evening", "For forty days", "Until the next new moon"]'::jsonb, 'Until the evening', 'Many contact impurities lasted until evening after washing. (Leviticus 15:5-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long did one who was touched by such uncleanness remain unclean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 1, 'What did a healed man with a discharge do on the eighth day?', '["Bring a ram and a goat to the elders", "Wash only and return immediately", "Bring two turtledoves or two young pigeons to the priest", "Offer incense before the veil"]'::jsonb, 'Bring two turtledoves or two young pigeons to the priest', 'After washing and waiting, he brought bird offerings on the eighth day. (Leviticus 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did a healed man with a discharge do on the eighth day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 1, 'What did a man with an emission of semen have to do?', '["Leave the camp for seven days", "Offer a lamb immediately", "Shave his head and beard", "Wash all his flesh in water and be unclean until evening"]'::jsonb, 'Wash all his flesh in water and be unclean until evening', 'He washed and remained unclean until evening. (Leviticus 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did a man with an emission of semen have to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 1, 'What happened to a woman during her regular menstrual flow?', '["She was unclean seven days", "She was unclean until evening only", "She needed a guilt offering immediately", "She was counted as clean after washing"]'::jsonb, 'She was unclean seven days', 'A woman during her period was unclean seven days. (Leviticus 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to a woman during her regular menstrual flow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 1, 'What happened to anything on which a man with a discharge sat?', '["It became unclean", "It became holy to the LORD", "It had to be burned immediately", "It remained clean if wooden"]'::jsonb, 'It became unclean', 'Beds, seats, and touched objects became unclean through contact. (Leviticus 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to anything on which a man with a discharge sat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 1, 'What made a man unclean throughout Leviticus 15?', '["A rash from sunburn only", "A vow of fasting", "Touching a clean offering", "A bodily discharge from his flesh"]'::jsonb, 'A bodily discharge from his flesh', 'The chapter addresses uncleanness caused by various bodily discharges. (Leviticus 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What made a man unclean throughout Leviticus 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 1, 'Why were these laws given according to the end of the chapter?', '["So all illnesses would cease from the camp", "So Israel would not die in uncleanness by defiling the tabernacle", "So the priests would gain more food", "So the nations would fear Israel''s medicine"]'::jsonb, 'So Israel would not die in uncleanness by defiling the tabernacle', 'The aim was to protect the tabernacle from defilement and Israel from death. (Leviticus 15:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were these laws given according to the end of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 2, 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:14)', '["Bring a ram and a goat to the elders", "Wash only and return immediately", "Bring two turtledoves or two young pigeons to the priest", "Offer incense before the veil"]'::jsonb, 'Bring two turtledoves or two young pigeons to the priest', 'After washing and waiting, he brought bird offerings on the eighth day. That detail is part of the bodily discharges instructions in Leviticus 15:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:14)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 2, 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:16)', '["Leave the camp for seven days", "Offer a lamb immediately", "Shave his head and beard", "Wash all his flesh in water and be unclean until evening"]'::jsonb, 'Wash all his flesh in water and be unclean until evening', 'He washed and remained unclean until evening. That detail is part of the bodily discharges instructions in Leviticus 15:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:16)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 2, 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:19)', '["She was unclean seven days", "She was unclean until evening only", "She needed a guilt offering immediately", "She was counted as clean after washing"]'::jsonb, 'She was unclean seven days', 'A woman during her period was unclean seven days. That detail is part of the bodily discharges instructions in Leviticus 15:19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:19)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 2, 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:2)', '["A rash from sunburn only", "A vow of fasting", "Touching a clean offering", "A bodily discharge from his flesh"]'::jsonb, 'A bodily discharge from his flesh', 'The chapter addresses uncleanness caused by various bodily discharges. That detail is part of the bodily discharges instructions in Leviticus 15:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 2, 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:31)', '["So all illnesses would cease from the camp", "So Israel would not die in uncleanness by defiling the tabernacle", "So the priests would gain more food", "So the nations would fear Israel''s medicine"]'::jsonb, 'So Israel would not die in uncleanness by defiling the tabernacle', 'The aim was to protect the tabernacle from defilement and Israel from death. That detail is part of the bodily discharges instructions in Leviticus 15:31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:31)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 2, 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:4)', '["It became unclean", "It became holy to the LORD", "It had to be burned immediately", "It remained clean if wooden"]'::jsonb, 'It became unclean', 'Beds, seats, and touched objects became unclean through contact. That detail is part of the bodily discharges instructions in Leviticus 15:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 2, 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:5-11)', '["For three days", "Until the evening", "For forty days", "Until the next new moon"]'::jsonb, 'Until the evening', 'Many contact impurities lasted until evening after washing. That detail is part of the bodily discharges instructions in Leviticus 15:5-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 15, which detail fits the bodily discharges instructions? (Leviticus 15:5-11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 3, 'In Leviticus 15, what does this detail chiefly emphasize: a bodily discharge from his flesh?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Impurity could arise from conditions tied to bodily life itself.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Impurity could arise from conditions tied to bodily life itself.', 'Impurity could arise from conditions tied to bodily life itself. The chapter addresses uncleanness caused by various bodily discharges. (Leviticus 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 15, what does this detail chiefly emphasize: a bodily discharge from his flesh?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 3, 'In Leviticus 15, what does this detail chiefly emphasize: bring two turtledoves or two young pigeons to the priest?', '["That ritual details were optional once the offering began", "Recovery from impurity still required sacrificial completion.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Recovery from impurity still required sacrificial completion.', 'Recovery from impurity still required sacrificial completion. After washing and waiting, he brought bird offerings on the eighth day. (Leviticus 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 15, what does this detail chiefly emphasize: bring two turtledoves or two young pigeons to the priest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 3, 'In Leviticus 15, what does this detail chiefly emphasize: it became unclean?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Uncleanness spread through ordinary contact."]'::jsonb, 'Uncleanness spread through ordinary contact.', 'Uncleanness spread through ordinary contact. Beds, seats, and touched objects became unclean through contact. (Leviticus 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 15, what does this detail chiefly emphasize: it became unclean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 3, 'In Leviticus 15, what does this detail chiefly emphasize: she was unclean seven days?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The same holiness framework applied to women''s bodily discharges."]'::jsonb, 'The same holiness framework applied to women''s bodily discharges.', 'The same holiness framework applied to women''s bodily discharges. A woman during her period was unclean seven days. (Leviticus 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 15, what does this detail chiefly emphasize: she was unclean seven days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 3, 'In Leviticus 15, what does this detail chiefly emphasize: so israel would not die in uncleanness by defiling the tabernacle?', '["Impurity matters because God dwells among his people.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Impurity matters because God dwells among his people.', 'Impurity matters because God dwells among his people. The aim was to protect the tabernacle from defilement and Israel from death. (Leviticus 15:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 15, what does this detail chiefly emphasize: so israel would not die in uncleanness by defiling the tabernacle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 3, 'In Leviticus 15, what does this detail chiefly emphasize: until the evening?', '["The law set limited but real periods of separation.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The law set limited but real periods of separation.', 'The law set limited but real periods of separation. Many contact impurities lasted until evening after washing. (Leviticus 15:5-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 15, what does this detail chiefly emphasize: until the evening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 3, 'In Leviticus 15, what does this detail chiefly emphasize: wash all his flesh in water and be unclean until evening?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Not all impurity implied moral fault, but it still affected holiness.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Not all impurity implied moral fault, but it still affected holiness.', 'Not all impurity implied moral fault, but it still affected holiness. He washed and remained unclean until evening. (Leviticus 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 15, what does this detail chiefly emphasize: wash all his flesh in water and be unclean until evening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 4, 'How does Leviticus 15 use the detail ''A bodily discharge from his flesh'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter expands holiness concerns into the sphere of ordinary physical processes.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter expands holiness concerns into the sphere of ordinary physical processes.', 'The chapter expands holiness concerns into the sphere of ordinary physical processes. The detail appears in Leviticus 15:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 15 use the detail ''A bodily discharge from his flesh'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 4, 'How does Leviticus 15 use the detail ''Bring two turtledoves or two young pigeons to the priest'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter joins physical recovery with ritual restoration.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter joins physical recovery with ritual restoration.', 'The chapter joins physical recovery with ritual restoration. The detail appears in Leviticus 15:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 15 use the detail ''Bring two turtledoves or two young pigeons to the priest'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 4, 'How does Leviticus 15 use the detail ''It became unclean'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter teaches that impurity affects persons, objects, and shared spaces."]'::jsonb, 'The chapter teaches that impurity affects persons, objects, and shared spaces.', 'The chapter teaches that impurity affects persons, objects, and shared spaces. The detail appears in Leviticus 15:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 15 use the detail ''It became unclean'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 4, 'How does Leviticus 15 use the detail ''She was unclean seven days'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter gives parallel attention to male and female conditions."]'::jsonb, 'The chapter gives parallel attention to male and female conditions.', 'The chapter gives parallel attention to male and female conditions. The detail appears in Leviticus 15:19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 15 use the detail ''She was unclean seven days'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 4, 'How does Leviticus 15 use the detail ''So Israel would not die in uncleanness by defiling the tabernacle'' within the chapter as a whole?', '["The chapter grounds bodily purity laws in the holiness of God''s dwelling.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter grounds bodily purity laws in the holiness of God''s dwelling.', 'The chapter grounds bodily purity laws in the holiness of God''s dwelling. The detail appears in Leviticus 15:31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 15 use the detail ''So Israel would not die in uncleanness by defiling the tabernacle'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 4, 'How does Leviticus 15 use the detail ''Until the evening'' within the chapter as a whole?', '["The chapter balances seriousness of impurity with clearly bounded restoration.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter balances seriousness of impurity with clearly bounded restoration.', 'The chapter balances seriousness of impurity with clearly bounded restoration. The detail appears in Leviticus 15:5-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 15 use the detail ''Until the evening'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 4, 'How does Leviticus 15 use the detail ''Wash all his flesh in water and be unclean until evening'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter distinguishes ritual uncleanness from deliberate transgression while still regulating it.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter distinguishes ritual uncleanness from deliberate transgression while still regulating it.', 'The chapter distinguishes ritual uncleanness from deliberate transgression while still regulating it. The detail appears in Leviticus 15:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 15 use the detail ''Wash all his flesh in water and be unclean until evening'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 5, 'What larger theological point in Leviticus 15 is reinforced by the detail ''A bodily discharge from his flesh''?', '["Impurity could arise from conditions tied to bodily life itself.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Impurity could arise from conditions tied to bodily life itself.', 'Impurity could arise from conditions tied to bodily life itself. In context, the chapter uses this detail as part of that wider point (Leviticus 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 15 is reinforced by the detail ''A bodily discharge from his flesh''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 5, 'What larger theological point in Leviticus 15 is reinforced by the detail ''Bring two turtledoves or two young pigeons to the priest''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Recovery from impurity still required sacrificial completion."]'::jsonb, 'Recovery from impurity still required sacrificial completion.', 'Recovery from impurity still required sacrificial completion. In context, the chapter uses this detail as part of that wider point (Leviticus 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 15 is reinforced by the detail ''Bring two turtledoves or two young pigeons to the priest''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 5, 'What larger theological point in Leviticus 15 is reinforced by the detail ''It became unclean''?', '["That worship can be detached from covenant obedience", "Uncleanness spread through ordinary contact.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Uncleanness spread through ordinary contact.', 'Uncleanness spread through ordinary contact. In context, the chapter uses this detail as part of that wider point (Leviticus 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 15 is reinforced by the detail ''It became unclean''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 5, 'What larger theological point in Leviticus 15 is reinforced by the detail ''She was unclean seven days''?', '["That worship can be detached from covenant obedience", "The same holiness framework applied to women''s bodily discharges.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The same holiness framework applied to women''s bodily discharges.', 'The same holiness framework applied to women''s bodily discharges. In context, the chapter uses this detail as part of that wider point (Leviticus 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 15 is reinforced by the detail ''She was unclean seven days''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 5, 'What larger theological point in Leviticus 15 is reinforced by the detail ''So Israel would not die in uncleanness by defiling the tabernacle''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Impurity matters because God dwells among his people.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Impurity matters because God dwells among his people.', 'Impurity matters because God dwells among his people. In context, the chapter uses this detail as part of that wider point (Leviticus 15:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 15 is reinforced by the detail ''So Israel would not die in uncleanness by defiling the tabernacle''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 5, 'What larger theological point in Leviticus 15 is reinforced by the detail ''Until the evening''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The law set limited but real periods of separation.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The law set limited but real periods of separation.', 'The law set limited but real periods of separation. In context, the chapter uses this detail as part of that wider point (Leviticus 15:5-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 15 is reinforced by the detail ''Until the evening''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 15, 5, 'What larger theological point in Leviticus 15 is reinforced by the detail ''Wash all his flesh in water and be unclean until evening''?', '["Not all impurity implied moral fault, but it still affected holiness.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Not all impurity implied moral fault, but it still affected holiness.', 'Not all impurity implied moral fault, but it still affected holiness. In context, the chapter uses this detail as part of that wider point (Leviticus 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 15 is reinforced by the detail ''Wash all his flesh in water and be unclean until evening''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 1, 'After whose death did the LORD speak the instructions of Leviticus 16?', '["After the death of Aaron''s two sons", "After Miriam''s death", "After the death of Korah", "After the death of Moses'' father-in-law"]'::jsonb, 'After the death of Aaron''s two sons', 'The chapter is framed in the aftermath of Nadab and Abihu''s death. (Leviticus 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'After whose death did the LORD speak the instructions of Leviticus 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 1, 'For whom was the bull of the sin offering offered?', '["For the whole congregation", "For the Levites only", "For the stranger in the land", "For Aaron and his house"]'::jsonb, 'For Aaron and his house', 'Aaron first made atonement for himself and his household. (Leviticus 16:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'For whom was the bull of the sin offering offered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 1, 'How often could Aaron enter the holy place within the veil under this law?', '["Every morning and evening", "Not at all times, but on the appointed atonement rite", "Whenever Israel sinned publicly", "Only once in his lifetime"]'::jsonb, 'Not at all times, but on the appointed atonement rite', 'The holy place was not to be entered casually; the chapter gives the appointed yearly pattern. (Leviticus 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'How often could Aaron enter the holy place within the veil under this law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 1, 'What did the high priest do over the live goat?', '["Anoint it with oil and salt", "Confess over it all the iniquities of the children of Israel", "Sprinkle its head with meal offering", "Wave it before the people"]'::jsonb, 'Confess over it all the iniquities of the children of Israel', 'Aaron confessed Israel''s sins over the live goat before it was sent away. (Leviticus 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the high priest do over the live goat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 1, 'What happened to the goat on which the lot fell for Azazel?', '["It was presented alive and sent away into the wilderness", "It was burned on the altar as a burnt offering", "It was eaten by the priests in a holy place", "It was kept beside the ark for seven days"]'::jsonb, 'It was presented alive and sent away into the wilderness', 'The live goat symbolically carried Israel''s sins away into the wilderness. (Leviticus 16:10, 21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to the goat on which the lot fell for Azazel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 1, 'What two animals were taken from the congregation for the people''s sin offering?', '["Two rams", "A bull and a dove", "Two male goats", "Two ewe lambs"]'::jsonb, 'Two male goats', 'Two goats formed the people''s sin offering on the Day of Atonement. (Leviticus 16:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What two animals were taken from the congregation for the people''s sin offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 1, 'What was Israel commanded to do on the Day of Atonement?', '["Eat the peace offering with gladness", "March around the camp seven times", "Afflict their souls and do no work", "Offer incense in every tent"]'::jsonb, 'Afflict their souls and do no work', 'The people were to humble themselves and refrain from work on this solemn day. (Leviticus 16:29-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was Israel commanded to do on the Day of Atonement?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 2, 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:1)', '["After the death of Aaron''s two sons", "After Miriam''s death", "After the death of Korah", "After the death of Moses'' father-in-law"]'::jsonb, 'After the death of Aaron''s two sons', 'The chapter is framed in the aftermath of Nadab and Abihu''s death. That detail is part of the Day of Atonement instructions in Leviticus 16:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 2, 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:10, 21-22)', '["It was presented alive and sent away into the wilderness", "It was burned on the altar as a burnt offering", "It was eaten by the priests in a holy place", "It was kept beside the ark for seven days"]'::jsonb, 'It was presented alive and sent away into the wilderness', 'The live goat symbolically carried Israel''s sins away into the wilderness. That detail is part of the Day of Atonement instructions in Leviticus 16:10, 21-22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:10, 21-22)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 2, 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:2)', '["Every morning and evening", "Not at all times, but on the appointed atonement rite", "Whenever Israel sinned publicly", "Only once in his lifetime"]'::jsonb, 'Not at all times, but on the appointed atonement rite', 'The holy place was not to be entered casually; the chapter gives the appointed yearly pattern. That detail is part of the Day of Atonement instructions in Leviticus 16:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 2, 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:21)', '["Anoint it with oil and salt", "Confess over it all the iniquities of the children of Israel", "Sprinkle its head with meal offering", "Wave it before the people"]'::jsonb, 'Confess over it all the iniquities of the children of Israel', 'Aaron confessed Israel''s sins over the live goat before it was sent away. That detail is part of the Day of Atonement instructions in Leviticus 16:21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:21)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 2, 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:29-31)', '["Eat the peace offering with gladness", "March around the camp seven times", "Afflict their souls and do no work", "Offer incense in every tent"]'::jsonb, 'Afflict their souls and do no work', 'The people were to humble themselves and refrain from work on this solemn day. That detail is part of the Day of Atonement instructions in Leviticus 16:29-31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:29-31)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 2, 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:5)', '["Two rams", "A bull and a dove", "Two male goats", "Two ewe lambs"]'::jsonb, 'Two male goats', 'Two goats formed the people''s sin offering on the Day of Atonement. That detail is part of the Day of Atonement instructions in Leviticus 16:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 2, 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:6)', '["For the whole congregation", "For the Levites only", "For the stranger in the land", "For Aaron and his house"]'::jsonb, 'For Aaron and his house', 'Aaron first made atonement for himself and his household. That detail is part of the Day of Atonement instructions in Leviticus 16:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 16, which detail fits the Day of Atonement instructions? (Leviticus 16:6)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 3, 'In Leviticus 16, what does this detail chiefly emphasize: afflict their souls and do no work?', '["That ritual details were optional once the offering began", "Atonement called for communal humility under God''s provision.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Atonement called for communal humility under God''s provision.', 'Atonement called for communal humility under God''s provision. The people were to humble themselves and refrain from work on this solemn day. (Leviticus 16:29-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 16, what does this detail chiefly emphasize: afflict their souls and do no work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 3, 'In Leviticus 16, what does this detail chiefly emphasize: after the death of aaron''s two sons?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Approach to the holy presence must be carefully regulated."]'::jsonb, 'Approach to the holy presence must be carefully regulated.', 'Approach to the holy presence must be carefully regulated. The chapter is framed in the aftermath of Nadab and Abihu''s death. (Leviticus 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 16, what does this detail chiefly emphasize: after the death of aaron''s two sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 3, 'In Leviticus 16, what does this detail chiefly emphasize: confess over it all the iniquities of the children of israel?', '["The rite explicitly transfers the people''s sins away from them.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The rite explicitly transfers the people''s sins away from them.', 'The rite explicitly transfers the people''s sins away from them. Aaron confessed Israel''s sins over the live goat before it was sent away. (Leviticus 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 16, what does this detail chiefly emphasize: confess over it all the iniquities of the children of israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 3, 'In Leviticus 16, what does this detail chiefly emphasize: for aaron and his house?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The mediator requires cleansing before representing others.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The mediator requires cleansing before representing others.', 'The mediator requires cleansing before representing others. Aaron first made atonement for himself and his household. (Leviticus 16:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 16, what does this detail chiefly emphasize: for aaron and his house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 3, 'In Leviticus 16, what does this detail chiefly emphasize: it was presented alive and sent away into the wilderness?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Atonement includes both expiation and removal of sin."]'::jsonb, 'Atonement includes both expiation and removal of sin.', 'Atonement includes both expiation and removal of sin. The live goat symbolically carried Israel''s sins away into the wilderness. (Leviticus 16:10, 21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 16, what does this detail chiefly emphasize: it was presented alive and sent away into the wilderness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 3, 'In Leviticus 16, what does this detail chiefly emphasize: not at all times, but on the appointed atonement rite?', '["God''s presence is graciously accessible but never casual.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'God''s presence is graciously accessible but never casual.', 'God''s presence is graciously accessible but never casual. The holy place was not to be entered casually; the chapter gives the appointed yearly pattern. (Leviticus 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 16, what does this detail chiefly emphasize: not at all times, but on the appointed atonement rite?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 3, 'In Leviticus 16, what does this detail chiefly emphasize: two male goats?', '["That ritual details were optional once the offering began", "Atonement was made through paired actions of sacrifice and removal.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Atonement was made through paired actions of sacrifice and removal.', 'Atonement was made through paired actions of sacrifice and removal. Two goats formed the people''s sin offering on the Day of Atonement. (Leviticus 16:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 16, what does this detail chiefly emphasize: two male goats?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 4, 'How does Leviticus 16 use the detail ''Afflict their souls and do no work'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter joins priestly ritual with congregational self-abasement and rest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter joins priestly ritual with congregational self-abasement and rest.', 'The chapter joins priestly ritual with congregational self-abasement and rest. The detail appears in Leviticus 16:29-31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 16 use the detail ''Afflict their souls and do no work'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 4, 'How does Leviticus 16 use the detail ''After the death of Aaron''s two sons'' within the chapter as a whole?', '["The chapter answers the danger highlighted in chapter 10 with a yearly atonement rite.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter answers the danger highlighted in chapter 10 with a yearly atonement rite.', 'The chapter answers the danger highlighted in chapter 10 with a yearly atonement rite. The detail appears in Leviticus 16:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 16 use the detail ''After the death of Aaron''s two sons'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 4, 'How does Leviticus 16 use the detail ''Confess over it all the iniquities of the children of Israel'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter gives visible form to the removal of covenant guilt.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter gives visible form to the removal of covenant guilt.', 'The chapter gives visible form to the removal of covenant guilt. The detail appears in Leviticus 16:21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 16 use the detail ''Confess over it all the iniquities of the children of Israel'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 4, 'How does Leviticus 16 use the detail ''For Aaron and his house'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter preserves the pattern that priestly mediation begins with priestly atonement."]'::jsonb, 'The chapter preserves the pattern that priestly mediation begins with priestly atonement.', 'The chapter preserves the pattern that priestly mediation begins with priestly atonement. The detail appears in Leviticus 16:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 16 use the detail ''For Aaron and his house'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 4, 'How does Leviticus 16 use the detail ''It was presented alive and sent away into the wilderness'' within the chapter as a whole?', '["The chapter portrays forgiveness as cleansing God''s dwelling and banishing guilt from the camp.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter portrays forgiveness as cleansing God''s dwelling and banishing guilt from the camp.', 'The chapter portrays forgiveness as cleansing God''s dwelling and banishing guilt from the camp. The detail appears in Leviticus 16:10, 21-22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 16 use the detail ''It was presented alive and sent away into the wilderness'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 4, 'How does Leviticus 16 use the detail ''Not at all times, but on the appointed atonement rite'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter structures access to the Most Holy Place through strict mediation.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter structures access to the Most Holy Place through strict mediation.', 'The chapter structures access to the Most Holy Place through strict mediation. The detail appears in Leviticus 16:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 16 use the detail ''Not at all times, but on the appointed atonement rite'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 4, 'How does Leviticus 16 use the detail ''Two male goats'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter divides one sin offering into two complementary goat rites.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter divides one sin offering into two complementary goat rites.', 'The chapter divides one sin offering into two complementary goat rites. The detail appears in Leviticus 16:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 16 use the detail ''Two male goats'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 5, 'What larger theological point in Leviticus 16 is reinforced by the detail ''Afflict their souls and do no work''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Atonement called for communal humility under God''s provision."]'::jsonb, 'Atonement called for communal humility under God''s provision.', 'Atonement called for communal humility under God''s provision. In context, the chapter uses this detail as part of that wider point (Leviticus 16:29-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 16 is reinforced by the detail ''Afflict their souls and do no work''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 5, 'What larger theological point in Leviticus 16 is reinforced by the detail ''After the death of Aaron''s two sons''?', '["That worship can be detached from covenant obedience", "Approach to the holy presence must be carefully regulated.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Approach to the holy presence must be carefully regulated.', 'Approach to the holy presence must be carefully regulated. In context, the chapter uses this detail as part of that wider point (Leviticus 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 16 is reinforced by the detail ''After the death of Aaron''s two sons''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 5, 'What larger theological point in Leviticus 16 is reinforced by the detail ''Confess over it all the iniquities of the children of Israel''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The rite explicitly transfers the people''s sins away from them.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The rite explicitly transfers the people''s sins away from them.', 'The rite explicitly transfers the people''s sins away from them. In context, the chapter uses this detail as part of that wider point (Leviticus 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 16 is reinforced by the detail ''Confess over it all the iniquities of the children of Israel''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 5, 'What larger theological point in Leviticus 16 is reinforced by the detail ''For Aaron and his house''?', '["The mediator requires cleansing before representing others.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The mediator requires cleansing before representing others.', 'The mediator requires cleansing before representing others. In context, the chapter uses this detail as part of that wider point (Leviticus 16:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 16 is reinforced by the detail ''For Aaron and his house''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 5, 'What larger theological point in Leviticus 16 is reinforced by the detail ''It was presented alive and sent away into the wilderness''?', '["That worship can be detached from covenant obedience", "Atonement includes both expiation and removal of sin.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Atonement includes both expiation and removal of sin.', 'Atonement includes both expiation and removal of sin. In context, the chapter uses this detail as part of that wider point (Leviticus 16:10, 21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 16 is reinforced by the detail ''It was presented alive and sent away into the wilderness''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 5, 'What larger theological point in Leviticus 16 is reinforced by the detail ''Not at all times, but on the appointed atonement rite''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "God''s presence is graciously accessible but never casual.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'God''s presence is graciously accessible but never casual.', 'God''s presence is graciously accessible but never casual. In context, the chapter uses this detail as part of that wider point (Leviticus 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 16 is reinforced by the detail ''Not at all times, but on the appointed atonement rite''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 16, 5, 'What larger theological point in Leviticus 16 is reinforced by the detail ''Two male goats''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Atonement was made through paired actions of sacrifice and removal."]'::jsonb, 'Atonement was made through paired actions of sacrifice and removal.', 'Atonement was made through paired actions of sacrifice and removal. In context, the chapter uses this detail as part of that wider point (Leviticus 16:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 16 is reinforced by the detail ''Two male goats''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 1, 'For what had God given blood upon the altar?', '["To make atonement for souls", "To anoint kings in Israel", "To cleanse the camp roads", "To feed the priests"]'::jsonb, 'To make atonement for souls', 'Blood was assigned to the altar because it makes atonement by reason of the life. (Leviticus 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'For what had God given blood upon the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 1, 'What had to be done with blood from animals taken in hunting?', '["It had to be boiled before eating", "It had to be poured out and covered with dust", "It had to be sprinkled on a stone", "It had to be given to the priest"]'::jsonb, 'It had to be poured out and covered with dust', 'Even hunted game required respectful treatment of the blood. (Leviticus 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What had to be done with blood from animals taken in hunting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 1, 'What happened if someone ate an animal that died of itself or was torn by beasts?', '["He was cut off immediately without remedy", "He became clean if he was poor", "He had to wash and be unclean until evening", "He had to offer a goat the same day"]'::jsonb, 'He had to wash and be unclean until evening', 'The person became unclean and had to wash before evening. (Leviticus 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened if someone ate an animal that died of itself or was torn by beasts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 1, 'What were the Israelites no longer to sacrifice to according to this chapter?', '["The host of heaven", "Household ancestors", "River spirits", "Goat demons"]'::jsonb, 'Goat demons', 'Israel was forbidden to offer sacrifices to goat idols or demons. (Leviticus 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What were the Israelites no longer to sacrifice to according to this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 1, 'What would happen to the person who slaughtered and did not bring it to the sanctuary?', '["He would be unclean until evening only", "He would owe a grain offering", "Blood would be imputed to that man and he would be cut off", "He would serve the priests for a month"]'::jsonb, 'Blood would be imputed to that man and he would be cut off', 'Improper slaughter was treated as bloodguilt. (Leviticus 17:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What would happen to the person who slaughtered and did not bring it to the sanctuary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 1, 'Where was an Israelite to bring an ox, lamb, or goat that he slaughtered?', '["To the nearest tribal gate", "To the door of the tent of meeting", "To his family altar", "To the high place on the hill"]'::jsonb, 'To the door of the tent of meeting', 'Ordinary slaughter of these sacrificial animals had to be brought to the sanctuary. (Leviticus 17:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was an Israelite to bring an ox, lamb, or goat that he slaughtered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 1, 'Why were the Israelites forbidden to eat blood?', '["Because blood spoiled too quickly in the heat", "Because Egypt used blood in medicine", "Because only rulers could drink it", "Because the life of the flesh is in the blood"]'::jsonb, 'Because the life of the flesh is in the blood', 'Blood represents life and was given on the altar to make atonement. (Leviticus 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were the Israelites forbidden to eat blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 2, 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:11)', '["Because blood spoiled too quickly in the heat", "Because Egypt used blood in medicine", "Because only rulers could drink it", "Because the life of the flesh is in the blood"]'::jsonb, 'Because the life of the flesh is in the blood', 'Blood represents life and was given on the altar to make atonement. That detail is part of the blood and slaughter at the sanctuary instructions in Leviticus 17:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 2, 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:11)', '["To make atonement for souls", "To anoint kings in Israel", "To cleanse the camp roads", "To feed the priests"]'::jsonb, 'To make atonement for souls', 'Blood was assigned to the altar because it makes atonement by reason of the life. That detail is part of the blood and slaughter at the sanctuary instructions in Leviticus 17:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 2, 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:13)', '["It had to be boiled before eating", "It had to be poured out and covered with dust", "It had to be sprinkled on a stone", "It had to be given to the priest"]'::jsonb, 'It had to be poured out and covered with dust', 'Even hunted game required respectful treatment of the blood. That detail is part of the blood and slaughter at the sanctuary instructions in Leviticus 17:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:13)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 2, 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:15)', '["He was cut off immediately without remedy", "He became clean if he was poor", "He had to wash and be unclean until evening", "He had to offer a goat the same day"]'::jsonb, 'He had to wash and be unclean until evening', 'The person became unclean and had to wash before evening. That detail is part of the blood and slaughter at the sanctuary instructions in Leviticus 17:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:15)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 2, 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:3-4)', '["To the nearest tribal gate", "To the door of the tent of meeting", "To his family altar", "To the high place on the hill"]'::jsonb, 'To the door of the tent of meeting', 'Ordinary slaughter of these sacrificial animals had to be brought to the sanctuary. That detail is part of the blood and slaughter at the sanctuary instructions in Leviticus 17:3-4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:3-4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 2, 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:4)', '["He would be unclean until evening only", "He would owe a grain offering", "Blood would be imputed to that man and he would be cut off", "He would serve the priests for a month"]'::jsonb, 'Blood would be imputed to that man and he would be cut off', 'Improper slaughter was treated as bloodguilt. That detail is part of the blood and slaughter at the sanctuary instructions in Leviticus 17:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 2, 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:7)', '["The host of heaven", "Household ancestors", "River spirits", "Goat demons"]'::jsonb, 'Goat demons', 'Israel was forbidden to offer sacrifices to goat idols or demons. That detail is part of the blood and slaughter at the sanctuary instructions in Leviticus 17:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 17, which detail fits the blood and slaughter at the sanctuary instructions? (Leviticus 17:7)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 3, 'In Leviticus 17, what does this detail chiefly emphasize: because the life of the flesh is in the blood?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The sacredness of blood rests in its relation to life and atonement.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The sacredness of blood rests in its relation to life and atonement.', 'The sacredness of blood rests in its relation to life and atonement. Blood represents life and was given on the altar to make atonement. (Leviticus 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 17, what does this detail chiefly emphasize: because the life of the flesh is in the blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 3, 'In Leviticus 17, what does this detail chiefly emphasize: blood would be imputed to that man and he would be cut off?', '["That ritual details were optional once the offering began", "Unauthorized handling of sacrificial blood was a serious covenant offense.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Unauthorized handling of sacrificial blood was a serious covenant offense.', 'Unauthorized handling of sacrificial blood was a serious covenant offense. Improper slaughter was treated as bloodguilt. (Leviticus 17:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 17, what does this detail chiefly emphasize: blood would be imputed to that man and he would be cut off?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 3, 'In Leviticus 17, what does this detail chiefly emphasize: goat demons?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Centralized worship was also a safeguard against idolatry.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Centralized worship was also a safeguard against idolatry.', 'Centralized worship was also a safeguard against idolatry. Israel was forbidden to offer sacrifices to goat idols or demons. (Leviticus 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 17, what does this detail chiefly emphasize: goat demons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 3, 'In Leviticus 17, what does this detail chiefly emphasize: he had to wash and be unclean until evening?', '["That ritual details were optional once the offering began", "Not every violation carried the same penalty, but impurity still had to be addressed.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Not every violation carried the same penalty, but impurity still had to be addressed.', 'Not every violation carried the same penalty, but impurity still had to be addressed. The person became unclean and had to wash before evening. (Leviticus 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 17, what does this detail chiefly emphasize: he had to wash and be unclean until evening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 3, 'In Leviticus 17, what does this detail chiefly emphasize: it had to be poured out and covered with dust?', '["The sacredness of blood extended beyond formal sacrifice.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The sacredness of blood extended beyond formal sacrifice.', 'The sacredness of blood extended beyond formal sacrifice. Even hunted game required respectful treatment of the blood. (Leviticus 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 17, what does this detail chiefly emphasize: it had to be poured out and covered with dust?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 3, 'In Leviticus 17, what does this detail chiefly emphasize: to make atonement for souls?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Atonement is central to the chapter''s teaching on blood."]'::jsonb, 'Atonement is central to the chapter''s teaching on blood.', 'Atonement is central to the chapter''s teaching on blood. Blood was assigned to the altar because it makes atonement by reason of the life. (Leviticus 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 17, what does this detail chiefly emphasize: to make atonement for souls?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 3, 'In Leviticus 17, what does this detail chiefly emphasize: to the door of the tent of meeting?', '["The chapter centralizes sacrificial blood before the LORD.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter centralizes sacrificial blood before the LORD.', 'The chapter centralizes sacrificial blood before the LORD. Ordinary slaughter of these sacrificial animals had to be brought to the sanctuary. (Leviticus 17:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 17, what does this detail chiefly emphasize: to the door of the tent of meeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 4, 'How does Leviticus 17 use the detail ''Because the life of the flesh is in the blood'' within the chapter as a whole?', '["The chapter grounds the blood prohibition in sacrificial theology, not food preference.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter grounds the blood prohibition in sacrificial theology, not food preference.', 'The chapter grounds the blood prohibition in sacrificial theology, not food preference. The detail appears in Leviticus 17:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 17 use the detail ''Because the life of the flesh is in the blood'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 4, 'How does Leviticus 17 use the detail ''Blood would be imputed to that man and he would be cut off'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter makes centralized worship a matter of life and death."]'::jsonb, 'The chapter makes centralized worship a matter of life and death.', 'The chapter makes centralized worship a matter of life and death. The detail appears in Leviticus 17:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 17 use the detail ''Blood would be imputed to that man and he would be cut off'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 4, 'How does Leviticus 17 use the detail ''Goat demons'' within the chapter as a whole?', '["The chapter connects sacrificial discipline with covenant loyalty.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter connects sacrificial discipline with covenant loyalty.', 'The chapter connects sacrificial discipline with covenant loyalty. The detail appears in Leviticus 17:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 17 use the detail ''Goat demons'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 4, 'How does Leviticus 17 use the detail ''He had to wash and be unclean until evening'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter differentiates between impurity and high-handed bloodguilt while treating both seriously."]'::jsonb, 'The chapter differentiates between impurity and high-handed bloodguilt while treating both seriously.', 'The chapter differentiates between impurity and high-handed bloodguilt while treating both seriously. The detail appears in Leviticus 17:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 17 use the detail ''He had to wash and be unclean until evening'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 4, 'How does Leviticus 17 use the detail ''It had to be poured out and covered with dust'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter makes reverence for life a pattern in both worship and subsistence.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter makes reverence for life a pattern in both worship and subsistence.', 'The chapter makes reverence for life a pattern in both worship and subsistence. The detail appears in Leviticus 17:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 17 use the detail ''It had to be poured out and covered with dust'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 4, 'How does Leviticus 17 use the detail ''To make atonement for souls'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter ties life, sacrifice, and forgiveness together in one principle.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ties life, sacrifice, and forgiveness together in one principle.', 'The chapter ties life, sacrifice, and forgiveness together in one principle. The detail appears in Leviticus 17:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 17 use the detail ''To make atonement for souls'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 4, 'How does Leviticus 17 use the detail ''To the door of the tent of meeting'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter guards worship from private or rival altars.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter guards worship from private or rival altars.', 'The chapter guards worship from private or rival altars. The detail appears in Leviticus 17:3-4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 17 use the detail ''To the door of the tent of meeting'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 5, 'What larger theological point in Leviticus 17 is reinforced by the detail ''Because the life of the flesh is in the blood''?', '["The sacredness of blood rests in its relation to life and atonement.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The sacredness of blood rests in its relation to life and atonement.', 'The sacredness of blood rests in its relation to life and atonement. In context, the chapter uses this detail as part of that wider point (Leviticus 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 17 is reinforced by the detail ''Because the life of the flesh is in the blood''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 5, 'What larger theological point in Leviticus 17 is reinforced by the detail ''Blood would be imputed to that man and he would be cut off''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Unauthorized handling of sacrificial blood was a serious covenant offense."]'::jsonb, 'Unauthorized handling of sacrificial blood was a serious covenant offense.', 'Unauthorized handling of sacrificial blood was a serious covenant offense. In context, the chapter uses this detail as part of that wider point (Leviticus 17:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 17 is reinforced by the detail ''Blood would be imputed to that man and he would be cut off''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 5, 'What larger theological point in Leviticus 17 is reinforced by the detail ''Goat demons''?', '["Centralized worship was also a safeguard against idolatry.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Centralized worship was also a safeguard against idolatry.', 'Centralized worship was also a safeguard against idolatry. In context, the chapter uses this detail as part of that wider point (Leviticus 17:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 17 is reinforced by the detail ''Goat demons''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 5, 'What larger theological point in Leviticus 17 is reinforced by the detail ''He had to wash and be unclean until evening''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Not every violation carried the same penalty, but impurity still had to be addressed."]'::jsonb, 'Not every violation carried the same penalty, but impurity still had to be addressed.', 'Not every violation carried the same penalty, but impurity still had to be addressed. In context, the chapter uses this detail as part of that wider point (Leviticus 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 17 is reinforced by the detail ''He had to wash and be unclean until evening''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 5, 'What larger theological point in Leviticus 17 is reinforced by the detail ''It had to be poured out and covered with dust''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The sacredness of blood extended beyond formal sacrifice.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The sacredness of blood extended beyond formal sacrifice.', 'The sacredness of blood extended beyond formal sacrifice. In context, the chapter uses this detail as part of that wider point (Leviticus 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 17 is reinforced by the detail ''It had to be poured out and covered with dust''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 5, 'What larger theological point in Leviticus 17 is reinforced by the detail ''To make atonement for souls''?', '["That worship can be detached from covenant obedience", "Atonement is central to the chapter''s teaching on blood.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Atonement is central to the chapter''s teaching on blood.', 'Atonement is central to the chapter''s teaching on blood. In context, the chapter uses this detail as part of that wider point (Leviticus 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 17 is reinforced by the detail ''To make atonement for souls''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 17, 5, 'What larger theological point in Leviticus 17 is reinforced by the detail ''To the door of the tent of meeting''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The chapter centralizes sacrificial blood before the LORD.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter centralizes sacrificial blood before the LORD.', 'The chapter centralizes sacrificial blood before the LORD. In context, the chapter uses this detail as part of that wider point (Leviticus 17:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 17 is reinforced by the detail ''To the door of the tent of meeting''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 1, 'How does Leviticus 18 summarize the close-relative relationships it forbids?', '["Do not eat with strangers", "Do not dwell near foreign tents", "Do not trim the corners of the beard", "Do not uncover nakedness"]'::jsonb, 'Do not uncover nakedness', 'The repeated phrase forbids sexual relations with close kin. (Leviticus 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Leviticus 18 summarize the close-relative relationships it forbids?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 1, 'What child-related abomination is explicitly forbidden?', '["Giving seed to Molech", "Circumcising on the wrong day", "Naming a child after a foreign king", "Selling a firstborn daughter"]'::jsonb, 'Giving seed to Molech', 'Israel was not to give offspring to Molech or profane God''s name. (Leviticus 18:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What child-related abomination is explicitly forbidden?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 1, 'What is promised to the one who keeps these ordinances?', '["He shall live in them", "He shall never need sacrifice", "He shall inherit the priesthood", "He shall see the ark uncovered"]'::jsonb, 'He shall live in them', 'Keeping God''s statutes is presented as the path of life. (Leviticus 18:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is promised to the one who keeps these ordinances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 1, 'What same-sex act is forbidden in the chapter?', '["Sharing a feast with a man under vow", "Lying with a man as with a woman", "Dwelling in the same tent during war", "Speaking an oath before a male priest"]'::jsonb, 'Lying with a man as with a woman', 'The text calls this act an abomination. (Leviticus 18:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What same-sex act is forbidden in the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 1, 'What warning is given if Israel commits these abominations?', '["They will lose the priesthood immediately", "They will become slaves in Egypt again", "Their offerings will become peace offerings only", "The land will vomit them out as it did the nations before them"]'::jsonb, 'The land will vomit them out as it did the nations before them', 'Israel would face the same land judgment if they defiled it. (Leviticus 18:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What warning is given if Israel commits these abominations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 1, 'Whose practices were Israel forbidden to follow in Leviticus 18?', '["Those of Midian and Edom", "Those of Tyre and Sidon", "Those of Egypt and Canaan", "Those of Babylon and Assyria"]'::jsonb, 'Those of Egypt and Canaan', 'Israel was not to copy the doings of Egypt or the land of Canaan. (Leviticus 18:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose practices were Israel forbidden to follow in Leviticus 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 1, 'Why did the land vomit out its inhabitants according to Leviticus 18?', '["Because they failed to keep the Passover", "Because they refused military tribute", "Because they defiled it with these abominations", "Because they ate unclean birds only"]'::jsonb, 'Because they defiled it with these abominations', 'The land was defiled by the nations'' sexual abominations and so expelled them. (Leviticus 18:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did the land vomit out its inhabitants according to Leviticus 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 2, 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:21)', '["Giving seed to Molech", "Circumcising on the wrong day", "Naming a child after a foreign king", "Selling a firstborn daughter"]'::jsonb, 'Giving seed to Molech', 'Israel was not to give offspring to Molech or profane God''s name. That detail is part of the forbidden sexual relations instructions in Leviticus 18:21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:21)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 2, 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:22)', '["Sharing a feast with a man under vow", "Lying with a man as with a woman", "Dwelling in the same tent during war", "Speaking an oath before a male priest"]'::jsonb, 'Lying with a man as with a woman', 'The text calls this act an abomination. That detail is part of the forbidden sexual relations instructions in Leviticus 18:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:22)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 2, 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:24-25)', '["Because they failed to keep the Passover", "Because they refused military tribute", "Because they defiled it with these abominations", "Because they ate unclean birds only"]'::jsonb, 'Because they defiled it with these abominations', 'The land was defiled by the nations'' sexual abominations and so expelled them. That detail is part of the forbidden sexual relations instructions in Leviticus 18:24-25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:24-25)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 2, 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:28)', '["They will lose the priesthood immediately", "They will become slaves in Egypt again", "Their offerings will become peace offerings only", "The land will vomit them out as it did the nations before them"]'::jsonb, 'The land will vomit them out as it did the nations before them', 'Israel would face the same land judgment if they defiled it. That detail is part of the forbidden sexual relations instructions in Leviticus 18:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:28)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 2, 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:3)', '["Those of Midian and Edom", "Those of Tyre and Sidon", "Those of Egypt and Canaan", "Those of Babylon and Assyria"]'::jsonb, 'Those of Egypt and Canaan', 'Israel was not to copy the doings of Egypt or the land of Canaan. That detail is part of the forbidden sexual relations instructions in Leviticus 18:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 2, 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:5)', '["He shall live in them", "He shall never need sacrifice", "He shall inherit the priesthood", "He shall see the ark uncovered"]'::jsonb, 'He shall live in them', 'Keeping God''s statutes is presented as the path of life. That detail is part of the forbidden sexual relations instructions in Leviticus 18:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 2, 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:6)', '["Do not eat with strangers", "Do not dwell near foreign tents", "Do not trim the corners of the beard", "Do not uncover nakedness"]'::jsonb, 'Do not uncover nakedness', 'The repeated phrase forbids sexual relations with close kin. That detail is part of the forbidden sexual relations instructions in Leviticus 18:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 18, which detail fits the forbidden sexual relations instructions? (Leviticus 18:6)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 3, 'In Leviticus 18, what does this detail chiefly emphasize: because they defiled it with these abominations?', '["That ritual details were optional once the offering began", "Sin affects not just people but the land they inhabit under God.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Sin affects not just people but the land they inhabit under God.', 'Sin affects not just people but the land they inhabit under God. The land was defiled by the nations'' sexual abominations and so expelled them. (Leviticus 18:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 18, what does this detail chiefly emphasize: because they defiled it with these abominations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 3, 'In Leviticus 18, what does this detail chiefly emphasize: do not uncover nakedness?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "The chapter guards family boundaries as part of holiness.", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter guards family boundaries as part of holiness.', 'The chapter guards family boundaries as part of holiness. The repeated phrase forbids sexual relations with close kin. (Leviticus 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 18, what does this detail chiefly emphasize: do not uncover nakedness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 3, 'In Leviticus 18, what does this detail chiefly emphasize: giving seed to molech?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Sexual and family law is joined to the rejection of idolatry."]'::jsonb, 'Sexual and family law is joined to the rejection of idolatry.', 'Sexual and family law is joined to the rejection of idolatry. Israel was not to give offspring to Molech or profane God''s name. (Leviticus 18:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 18, what does this detail chiefly emphasize: giving seed to molech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 3, 'In Leviticus 18, what does this detail chiefly emphasize: he shall live in them?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Obedience is life-giving within God''s covenant order."]'::jsonb, 'Obedience is life-giving within God''s covenant order.', 'Obedience is life-giving within God''s covenant order. Keeping God''s statutes is presented as the path of life. (Leviticus 18:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 18, what does this detail chiefly emphasize: he shall live in them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 3, 'In Leviticus 18, what does this detail chiefly emphasize: lying with a man as with a woman?', '["The chapter defines sexual boundaries according to God''s order, not human preference.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter defines sexual boundaries according to God''s order, not human preference.', 'The chapter defines sexual boundaries according to God''s order, not human preference. The text calls this act an abomination. (Leviticus 18:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 18, what does this detail chiefly emphasize: lying with a man as with a woman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 3, 'In Leviticus 18, what does this detail chiefly emphasize: the land will vomit them out as it did the nations before them?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Election does not cancel covenant accountability.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Election does not cancel covenant accountability.', 'Election does not cancel covenant accountability. Israel would face the same land judgment if they defiled it. (Leviticus 18:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 18, what does this detail chiefly emphasize: the land will vomit them out as it did the nations before them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 3, 'In Leviticus 18, what does this detail chiefly emphasize: those of egypt and canaan?', '["That ritual details were optional once the offering began", "Holiness required cultural distinctness from surrounding nations.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness required cultural distinctness from surrounding nations.', 'Holiness required cultural distinctness from surrounding nations. Israel was not to copy the doings of Egypt or the land of Canaan. (Leviticus 18:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 18, what does this detail chiefly emphasize: those of egypt and canaan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 4, 'How does Leviticus 18 use the detail ''Because they defiled it with these abominations'' within the chapter as a whole?', '["The chapter presents moral pollution as a covenant land issue.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter presents moral pollution as a covenant land issue.', 'The chapter presents moral pollution as a covenant land issue. The detail appears in Leviticus 18:24-25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 18 use the detail ''Because they defiled it with these abominations'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 4, 'How does Leviticus 18 use the detail ''Do not uncover nakedness'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter expresses sexual law through the protection of kinship order.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter expresses sexual law through the protection of kinship order.', 'The chapter expresses sexual law through the protection of kinship order. The detail appears in Leviticus 18:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 18 use the detail ''Do not uncover nakedness'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 4, 'How does Leviticus 18 use the detail ''Giving seed to Molech'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter ties bodily holiness to covenant worship.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ties bodily holiness to covenant worship.', 'The chapter ties bodily holiness to covenant worship. The detail appears in Leviticus 18:21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 18 use the detail ''Giving seed to Molech'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 4, 'How does Leviticus 18 use the detail ''He shall live in them'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter contrasts life in God''s ordinances with defiling practices that bring expulsion.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter contrasts life in God''s ordinances with defiling practices that bring expulsion.', 'The chapter contrasts life in God''s ordinances with defiling practices that bring expulsion. The detail appears in Leviticus 18:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 18 use the detail ''He shall live in them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 4, 'How does Leviticus 18 use the detail ''Lying with a man as with a woman'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter presents holiness as obedience in embodied relations."]'::jsonb, 'The chapter presents holiness as obedience in embodied relations.', 'The chapter presents holiness as obedience in embodied relations. The detail appears in Leviticus 18:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 18 use the detail ''Lying with a man as with a woman'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 4, 'How does Leviticus 18 use the detail ''The land will vomit them out as it did the nations before them'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter applies the nations'' judgment as a warning to Israel itself.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter applies the nations'' judgment as a warning to Israel itself.', 'The chapter applies the nations'' judgment as a warning to Israel itself. The detail appears in Leviticus 18:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 18 use the detail ''The land will vomit them out as it did the nations before them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 4, 'How does Leviticus 18 use the detail ''Those of Egypt and Canaan'' within the chapter as a whole?', '["The chapter frames sexual ethics as covenant nonconformity.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter frames sexual ethics as covenant nonconformity.', 'The chapter frames sexual ethics as covenant nonconformity. The detail appears in Leviticus 18:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 18 use the detail ''Those of Egypt and Canaan'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 5, 'What larger theological point in Leviticus 18 is reinforced by the detail ''Because they defiled it with these abominations''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Sin affects not just people but the land they inhabit under God."]'::jsonb, 'Sin affects not just people but the land they inhabit under God.', 'Sin affects not just people but the land they inhabit under God. In context, the chapter uses this detail as part of that wider point (Leviticus 18:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 18 is reinforced by the detail ''Because they defiled it with these abominations''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 5, 'What larger theological point in Leviticus 18 is reinforced by the detail ''Do not uncover nakedness''?', '["The chapter guards family boundaries as part of holiness.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter guards family boundaries as part of holiness.', 'The chapter guards family boundaries as part of holiness. In context, the chapter uses this detail as part of that wider point (Leviticus 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 18 is reinforced by the detail ''Do not uncover nakedness''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 5, 'What larger theological point in Leviticus 18 is reinforced by the detail ''Giving seed to Molech''?', '["That worship can be detached from covenant obedience", "Sexual and family law is joined to the rejection of idolatry.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Sexual and family law is joined to the rejection of idolatry.', 'Sexual and family law is joined to the rejection of idolatry. In context, the chapter uses this detail as part of that wider point (Leviticus 18:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 18 is reinforced by the detail ''Giving seed to Molech''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 5, 'What larger theological point in Leviticus 18 is reinforced by the detail ''He shall live in them''?', '["That worship can be detached from covenant obedience", "Obedience is life-giving within God''s covenant order.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Obedience is life-giving within God''s covenant order.', 'Obedience is life-giving within God''s covenant order. In context, the chapter uses this detail as part of that wider point (Leviticus 18:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 18 is reinforced by the detail ''He shall live in them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 5, 'What larger theological point in Leviticus 18 is reinforced by the detail ''Lying with a man as with a woman''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The chapter defines sexual boundaries according to God''s order, not human preference.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter defines sexual boundaries according to God''s order, not human preference.', 'The chapter defines sexual boundaries according to God''s order, not human preference. In context, the chapter uses this detail as part of that wider point (Leviticus 18:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 18 is reinforced by the detail ''Lying with a man as with a woman''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 5, 'What larger theological point in Leviticus 18 is reinforced by the detail ''The land will vomit them out as it did the nations before them''?', '["Election does not cancel covenant accountability.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Election does not cancel covenant accountability.', 'Election does not cancel covenant accountability. In context, the chapter uses this detail as part of that wider point (Leviticus 18:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 18 is reinforced by the detail ''The land will vomit them out as it did the nations before them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 18, 5, 'What larger theological point in Leviticus 18 is reinforced by the detail ''Those of Egypt and Canaan''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Holiness required cultural distinctness from surrounding nations."]'::jsonb, 'Holiness required cultural distinctness from surrounding nations.', 'Holiness required cultural distinctness from surrounding nations. In context, the chapter uses this detail as part of that wider point (Leviticus 18:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 18 is reinforced by the detail ''Those of Egypt and Canaan''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 1, 'How was Israel to treat the stranger who sojourned with them?', '["Tax him twice the native rate", "Let him live outside the cities", "Love him as yourself", "Forbid him from gleaning the fields"]'::jsonb, 'Love him as yourself', 'Israel was to love the stranger, remembering their own past in Egypt. (Leviticus 19:33-34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'How was Israel to treat the stranger who sojourned with them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 1, 'What did Israel have to use in commerce?', '["Just balances, just weights, and a just ephah and hin", "Only silver coinage from Tyre", "Measures approved by each tribe separately", "Whatever scale the buyer supplied"]'::jsonb, 'Just balances, just weights, and a just ephah and hin', 'Honest measures were required in business dealings. (Leviticus 19:35-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Israel have to use in commerce?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 1, 'What did the chapter forbid regarding justice?', '["Allowing women to testify", "Judging cases on Sabbath", "Using written contracts at the gate", "Showing partiality to the poor or honoring the mighty in judgment"]'::jsonb, 'Showing partiality to the poor or honoring the mighty in judgment', 'Judgment had to be righteous, not swayed by status. (Leviticus 19:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the chapter forbid regarding justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 1, 'What famous command summarizes neighborly ethics in this chapter?', '["You shall fear your enemy in battle", "You shall love your neighbor as yourself", "You shall trust only your clan", "You shall praise the elders at the gate"]'::jsonb, 'You shall love your neighbor as yourself', 'The chapter commands love of neighbor after forbidding vengeance and grudges. (Leviticus 19:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What famous command summarizes neighborly ethics in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 1, 'What foundational command opens Leviticus 19?', '["You shall be strong, for I give you the land", "You shall be many, for I bless your seed", "You shall be silent, for I speak in thunder", "You shall be holy, for I the LORD your God am holy"]'::jsonb, 'You shall be holy, for I the LORD your God am holy', 'The chapter opens with the broad call to holiness grounded in God''s character. (Leviticus 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What foundational command opens Leviticus 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 1, 'What repeated phrase anchors the commands throughout Leviticus 19?', '["Hear, O Israel", "I am the LORD", "Thus says Moses", "Remember the wilderness"]'::jsonb, 'I am the LORD', 'The commands are repeatedly grounded in the identity and authority of the LORD. (Leviticus 19 throughout).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What repeated phrase anchors the commands throughout Leviticus 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 1, 'What social command is paired with reaping laws in the field?', '["Leave the corners and gleanings for the poor and the stranger", "Burn the corners of the field at harvest", "Store the gleanings only for priests", "Sell the edges first to neighboring tribes"]'::jsonb, 'Leave the corners and gleanings for the poor and the stranger', 'Israel was to leave produce for the poor and the foreigner. (Leviticus 19:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What social command is paired with reaping laws in the field?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 2, 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19 throughout)', '["Hear, O Israel", "I am the LORD", "Thus says Moses", "Remember the wilderness"]'::jsonb, 'I am the LORD', 'The commands are repeatedly grounded in the identity and authority of the LORD. That detail is part of the holiness code instructions in Leviticus 19 throughout.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19 throughout)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 2, 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:15)', '["Allowing women to testify", "Judging cases on Sabbath", "Using written contracts at the gate", "Showing partiality to the poor or honoring the mighty in judgment"]'::jsonb, 'Showing partiality to the poor or honoring the mighty in judgment', 'Judgment had to be righteous, not swayed by status. That detail is part of the holiness code instructions in Leviticus 19:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:15)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 2, 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:18)', '["You shall fear your enemy in battle", "You shall love your neighbor as yourself", "You shall trust only your clan", "You shall praise the elders at the gate"]'::jsonb, 'You shall love your neighbor as yourself', 'The chapter commands love of neighbor after forbidding vengeance and grudges. That detail is part of the holiness code instructions in Leviticus 19:18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:18)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 2, 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:2)', '["You shall be strong, for I give you the land", "You shall be many, for I bless your seed", "You shall be silent, for I speak in thunder", "You shall be holy, for I the LORD your God am holy"]'::jsonb, 'You shall be holy, for I the LORD your God am holy', 'The chapter opens with the broad call to holiness grounded in God''s character. That detail is part of the holiness code instructions in Leviticus 19:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 2, 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:33-34)', '["Tax him twice the native rate", "Let him live outside the cities", "Love him as yourself", "Forbid him from gleaning the fields"]'::jsonb, 'Love him as yourself', 'Israel was to love the stranger, remembering their own past in Egypt. That detail is part of the holiness code instructions in Leviticus 19:33-34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:33-34)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 2, 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:35-36)', '["Just balances, just weights, and a just ephah and hin", "Only silver coinage from Tyre", "Measures approved by each tribe separately", "Whatever scale the buyer supplied"]'::jsonb, 'Just balances, just weights, and a just ephah and hin', 'Honest measures were required in business dealings. That detail is part of the holiness code instructions in Leviticus 19:35-36.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:35-36)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 2, 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:9-10)', '["Leave the corners and gleanings for the poor and the stranger", "Burn the corners of the field at harvest", "Store the gleanings only for priests", "Sell the edges first to neighboring tribes"]'::jsonb, 'Leave the corners and gleanings for the poor and the stranger', 'Israel was to leave produce for the poor and the foreigner. That detail is part of the holiness code instructions in Leviticus 19:9-10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 19, which detail fits the holiness code instructions? (Leviticus 19:9-10)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 3, 'In Leviticus 19, what does this detail chiefly emphasize: i am the lord?', '["Obedience flows from who God is and who Israel belongs to.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Obedience flows from who God is and who Israel belongs to.', 'Obedience flows from who God is and who Israel belongs to. The commands are repeatedly grounded in the identity and authority of the LORD. (Leviticus 19 throughout).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 19, what does this detail chiefly emphasize: i am the lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 3, 'In Leviticus 19, what does this detail chiefly emphasize: just balances, just weights, and a just ephah and hin?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Economic integrity is part of holiness."]'::jsonb, 'Economic integrity is part of holiness.', 'Economic integrity is part of holiness. Honest measures were required in business dealings. (Leviticus 19:35-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 19, what does this detail chiefly emphasize: just balances, just weights, and a just ephah and hin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 3, 'In Leviticus 19, what does this detail chiefly emphasize: leave the corners and gleanings for the poor and the stranger?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Holiness includes generosity and justice toward the vulnerable."]'::jsonb, 'Holiness includes generosity and justice toward the vulnerable.', 'Holiness includes generosity and justice toward the vulnerable. Israel was to leave produce for the poor and the foreigner. (Leviticus 19:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 19, what does this detail chiefly emphasize: leave the corners and gleanings for the poor and the stranger?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 3, 'In Leviticus 19, what does this detail chiefly emphasize: love him as yourself?', '["That ritual details were optional once the offering began", "Holiness remembers redemption and shows mercy to outsiders.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness remembers redemption and shows mercy to outsiders.', 'Holiness remembers redemption and shows mercy to outsiders. Israel was to love the stranger, remembering their own past in Egypt. (Leviticus 19:33-34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 19, what does this detail chiefly emphasize: love him as yourself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 3, 'In Leviticus 19, what does this detail chiefly emphasize: showing partiality to the poor or honoring the mighty in judgment?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holiness includes impartial justice.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness includes impartial justice.', 'Holiness includes impartial justice. Judgment had to be righteous, not swayed by status. (Leviticus 19:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 19, what does this detail chiefly emphasize: showing partiality to the poor or honoring the mighty in judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 3, 'In Leviticus 19, what does this detail chiefly emphasize: you shall be holy, for i the lord your god am holy?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holiness is imitation of the LORD in covenant life.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness is imitation of the LORD in covenant life.', 'Holiness is imitation of the LORD in covenant life. The chapter opens with the broad call to holiness grounded in God''s character. (Leviticus 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 19, what does this detail chiefly emphasize: you shall be holy, for i the lord your god am holy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 3, 'In Leviticus 19, what does this detail chiefly emphasize: you shall love your neighbor as yourself?', '["Holiness is relational, not merely ceremonial.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness is relational, not merely ceremonial.', 'Holiness is relational, not merely ceremonial. The chapter commands love of neighbor after forbidding vengeance and grudges. (Leviticus 19:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 19, what does this detail chiefly emphasize: you shall love your neighbor as yourself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 4, 'How does Leviticus 19 use the detail ''I am the LORD'' within the chapter as a whole?', '["The chapter ties ethics to covenant allegiance through repeated divine self-identification.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ties ethics to covenant allegiance through repeated divine self-identification.', 'The chapter ties ethics to covenant allegiance through repeated divine self-identification. The detail appears in Leviticus 19 throughout.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 19 use the detail ''I am the LORD'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 4, 'How does Leviticus 19 use the detail ''Just balances, just weights, and a just ephah and hin'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter brings market life under the same holy rule as worship."]'::jsonb, 'The chapter brings market life under the same holy rule as worship.', 'The chapter brings market life under the same holy rule as worship. The detail appears in Leviticus 19:35-36.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 19 use the detail ''Just balances, just weights, and a just ephah and hin'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 4, 'How does Leviticus 19 use the detail ''Leave the corners and gleanings for the poor and the stranger'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter turns land ownership into neighbor love under God."]'::jsonb, 'The chapter turns land ownership into neighbor love under God.', 'The chapter turns land ownership into neighbor love under God. The detail appears in Leviticus 19:9-10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 19 use the detail ''Leave the corners and gleanings for the poor and the stranger'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 4, 'How does Leviticus 19 use the detail ''Love him as yourself'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter extends neighbor love beyond native kinship.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter extends neighbor love beyond native kinship.', 'The chapter extends neighbor love beyond native kinship. The detail appears in Leviticus 19:33-34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 19 use the detail ''Love him as yourself'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 4, 'How does Leviticus 19 use the detail ''Showing partiality to the poor or honoring the mighty in judgment'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter resists both favoritism and intimidation in public righteousness.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter resists both favoritism and intimidation in public righteousness.', 'The chapter resists both favoritism and intimidation in public righteousness. The detail appears in Leviticus 19:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 19 use the detail ''Showing partiality to the poor or honoring the mighty in judgment'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 4, 'How does Leviticus 19 use the detail ''You shall be holy, for I the LORD your God am holy'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter gathers many commands under the single principle of divine holiness.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter gathers many commands under the single principle of divine holiness.', 'The chapter gathers many commands under the single principle of divine holiness. The detail appears in Leviticus 19:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 19 use the detail ''You shall be holy, for I the LORD your God am holy'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 4, 'How does Leviticus 19 use the detail ''You shall love your neighbor as yourself'' within the chapter as a whole?', '["The chapter condenses many social duties into active love.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter condenses many social duties into active love.', 'The chapter condenses many social duties into active love. The detail appears in Leviticus 19:18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 19 use the detail ''You shall love your neighbor as yourself'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 5, 'What larger theological point in Leviticus 19 is reinforced by the detail ''I am the LORD''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Obedience flows from who God is and who Israel belongs to.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Obedience flows from who God is and who Israel belongs to.', 'Obedience flows from who God is and who Israel belongs to. In context, the chapter uses this detail as part of that wider point (Leviticus 19 throughout).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 19 is reinforced by the detail ''I am the LORD''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 5, 'What larger theological point in Leviticus 19 is reinforced by the detail ''Just balances, just weights, and a just ephah and hin''?', '["That worship can be detached from covenant obedience", "Economic integrity is part of holiness.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Economic integrity is part of holiness.', 'Economic integrity is part of holiness. In context, the chapter uses this detail as part of that wider point (Leviticus 19:35-36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 19 is reinforced by the detail ''Just balances, just weights, and a just ephah and hin''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 5, 'What larger theological point in Leviticus 19 is reinforced by the detail ''Leave the corners and gleanings for the poor and the stranger''?', '["That worship can be detached from covenant obedience", "Holiness includes generosity and justice toward the vulnerable.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness includes generosity and justice toward the vulnerable.', 'Holiness includes generosity and justice toward the vulnerable. In context, the chapter uses this detail as part of that wider point (Leviticus 19:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 19 is reinforced by the detail ''Leave the corners and gleanings for the poor and the stranger''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 5, 'What larger theological point in Leviticus 19 is reinforced by the detail ''Love him as yourself''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Holiness remembers redemption and shows mercy to outsiders."]'::jsonb, 'Holiness remembers redemption and shows mercy to outsiders.', 'Holiness remembers redemption and shows mercy to outsiders. In context, the chapter uses this detail as part of that wider point (Leviticus 19:33-34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 19 is reinforced by the detail ''Love him as yourself''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 5, 'What larger theological point in Leviticus 19 is reinforced by the detail ''Showing partiality to the poor or honoring the mighty in judgment''?', '["Holiness includes impartial justice.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness includes impartial justice.', 'Holiness includes impartial justice. In context, the chapter uses this detail as part of that wider point (Leviticus 19:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 19 is reinforced by the detail ''Showing partiality to the poor or honoring the mighty in judgment''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 5, 'What larger theological point in Leviticus 19 is reinforced by the detail ''You shall be holy, for I the LORD your God am holy''?', '["Holiness is imitation of the LORD in covenant life.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness is imitation of the LORD in covenant life.', 'Holiness is imitation of the LORD in covenant life. In context, the chapter uses this detail as part of that wider point (Leviticus 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 19 is reinforced by the detail ''You shall be holy, for I the LORD your God am holy''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 19, 5, 'What larger theological point in Leviticus 19 is reinforced by the detail ''You shall love your neighbor as yourself''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Holiness is relational, not merely ceremonial.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness is relational, not merely ceremonial.', 'Holiness is relational, not merely ceremonial. In context, the chapter uses this detail as part of that wider point (Leviticus 19:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 19 is reinforced by the detail ''You shall love your neighbor as yourself''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 1, 'How does the chapter describe the land Israel is entering?', '["A land of rivers and cedars only", "A land flowing with milk and honey", "A land without strangers", "A land of gold and iron chiefly"]'::jsonb, 'A land flowing with milk and honey', 'God promises them a rich inheritance distinct from the nations. (Leviticus 20:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does the chapter describe the land Israel is entering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 1, 'What distinction was Israel to make among animals?', '["Between sacrificial and wild animals only", "Between young and old animals", "Between the clean beast and the unclean, and between the unclean bird and the clean", "Between morning and evening flocks"]'::jsonb, 'Between the clean beast and the unclean, and between the unclean bird and the clean', 'The chapter recalls purity distinctions as part of Israel''s separation. (Leviticus 20:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What distinction was Israel to make among animals?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 1, 'What penalty is attached to cursing father or mother?', '["He shall surely be put to death", "He shall restore double inheritance", "He shall be unclean until evening", "He shall shave his head"]'::jsonb, 'He shall surely be put to death', 'The chapter treats this as a capital offense. (Leviticus 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What penalty is attached to cursing father or mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 1, 'What penalty is prescribed for giving one''s seed to Molech?', '["He shall surely be put to death", "He shall fast for seven days", "He shall be sold as a servant", "He shall wash and remain outside the camp"]'::jsonb, 'He shall surely be put to death', 'Molech worship carried the death penalty. (Leviticus 20:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What penalty is prescribed for giving one''s seed to Molech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 1, 'What was Israel commanded to do regarding mediums and wizards?', '["Consult them only in famine", "Stone them only outside the land", "Do not turn to them", "Bring them to the priest for blessing"]'::jsonb, 'Do not turn to them', 'Turning to spiritists defiled the person and incurred severe judgment. (Leviticus 20:6, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was Israel commanded to do regarding mediums and wizards?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 1, 'What would God do if the people hid their eyes from a Molech offender?', '["Delay judgment until Jubilee", "Set his face against that man and his family", "Require only a ram of restitution", "Transfer the case to foreign judges"]'::jsonb, 'Set his face against that man and his family', 'God himself would act if the community failed to judge. (Leviticus 20:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What would God do if the people hid their eyes from a Molech offender?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 1, 'Why was Israel to sanctify itself according to Leviticus 20?', '["Because the nations imitate them", "Because Aaron carries all guilt", "Because the tabernacle needs more offerings", "Because the LORD sanctifies them"]'::jsonb, 'Because the LORD sanctifies them', 'Israel is called to holiness because the LORD is the one sanctifying them. (Leviticus 20:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why was Israel to sanctify itself according to Leviticus 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 2, 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:2)', '["He shall surely be put to death", "He shall fast for seven days", "He shall be sold as a servant", "He shall wash and remain outside the camp"]'::jsonb, 'He shall surely be put to death', 'Molech worship carried the death penalty. That detail is part of the penalties for abominations instructions in Leviticus 20:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 2, 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:24)', '["A land of rivers and cedars only", "A land flowing with milk and honey", "A land without strangers", "A land of gold and iron chiefly"]'::jsonb, 'A land flowing with milk and honey', 'God promises them a rich inheritance distinct from the nations. That detail is part of the penalties for abominations instructions in Leviticus 20:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:24)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 2, 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:25)', '["Between sacrificial and wild animals only", "Between young and old animals", "Between the clean beast and the unclean, and between the unclean bird and the clean", "Between morning and evening flocks"]'::jsonb, 'Between the clean beast and the unclean, and between the unclean bird and the clean', 'The chapter recalls purity distinctions as part of Israel''s separation. That detail is part of the penalties for abominations instructions in Leviticus 20:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:25)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 2, 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:4-5)', '["Delay judgment until Jubilee", "Set his face against that man and his family", "Require only a ram of restitution", "Transfer the case to foreign judges"]'::jsonb, 'Set his face against that man and his family', 'God himself would act if the community failed to judge. That detail is part of the penalties for abominations instructions in Leviticus 20:4-5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:4-5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 2, 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:6, 27)', '["Consult them only in famine", "Stone them only outside the land", "Do not turn to them", "Bring them to the priest for blessing"]'::jsonb, 'Do not turn to them', 'Turning to spiritists defiled the person and incurred severe judgment. That detail is part of the penalties for abominations instructions in Leviticus 20:6, 27.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:6, 27)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 2, 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:7-8)', '["Because the nations imitate them", "Because Aaron carries all guilt", "Because the tabernacle needs more offerings", "Because the LORD sanctifies them"]'::jsonb, 'Because the LORD sanctifies them', 'Israel is called to holiness because the LORD is the one sanctifying them. That detail is part of the penalties for abominations instructions in Leviticus 20:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:7-8)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 2, 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:9)', '["He shall surely be put to death", "He shall restore double inheritance", "He shall be unclean until evening", "He shall shave his head"]'::jsonb, 'He shall surely be put to death', 'The chapter treats this as a capital offense. That detail is part of the penalties for abominations instructions in Leviticus 20:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 20, which detail fits the penalties for abominations instructions? (Leviticus 20:9)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 3, 'In Leviticus 20, what does this detail chiefly emphasize: a land flowing with milk and honey?', '["Holiness is tied to life in the gift of the land.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness is tied to life in the gift of the land.', 'Holiness is tied to life in the gift of the land. God promises them a rich inheritance distinct from the nations. (Leviticus 20:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 20, what does this detail chiefly emphasize: a land flowing with milk and honey?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 3, 'In Leviticus 20, what does this detail chiefly emphasize: because the lord sanctifies them?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Divine grace grounds covenant holiness.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Divine grace grounds covenant holiness.', 'Divine grace grounds covenant holiness. Israel is called to holiness because the LORD is the one sanctifying them. (Leviticus 20:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 20, what does this detail chiefly emphasize: because the lord sanctifies them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 3, 'In Leviticus 20, what does this detail chiefly emphasize: between the clean beast and the unclean, and between the unclean bird and the clean?', '["That ritual details were optional once the offering began", "Covenant identity touched both morality and daily practice.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Covenant identity touched both morality and daily practice.', 'Covenant identity touched both morality and daily practice. The chapter recalls purity distinctions as part of Israel''s separation. (Leviticus 20:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 20, what does this detail chiefly emphasize: between the clean beast and the unclean, and between the unclean bird and the clean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 3, 'In Leviticus 20, what does this detail chiefly emphasize: do not turn to them?', '["That ritual details were optional once the offering began", "Holiness rejects occult alternatives to God.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness rejects occult alternatives to God.', 'Holiness rejects occult alternatives to God. Turning to spiritists defiled the person and incurred severe judgment. (Leviticus 20:6, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 20, what does this detail chiefly emphasize: do not turn to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 3, 'In Leviticus 20, what does this detail chiefly emphasize: he shall surely be put to death?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The chapter moves from forbidden acts to covenant penalties."]'::jsonb, 'The chapter moves from forbidden acts to covenant penalties.', 'The chapter moves from forbidden acts to covenant penalties. Molech worship carried the death penalty. (Leviticus 20:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 20, what does this detail chiefly emphasize: he shall surely be put to death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 3, 'In Leviticus 20, what does this detail chiefly emphasize: he shall surely be put to death?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Family order is protected as part of holy covenant life."]'::jsonb, 'Family order is protected as part of holy covenant life.', 'Family order is protected as part of holy covenant life. The chapter treats this as a capital offense. (Leviticus 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 20, what does this detail chiefly emphasize: he shall surely be put to death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 3, 'In Leviticus 20, what does this detail chiefly emphasize: set his face against that man and his family?', '["Communal negligence does not cancel divine justice.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Communal negligence does not cancel divine justice.', 'Communal negligence does not cancel divine justice. God himself would act if the community failed to judge. (Leviticus 20:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 20, what does this detail chiefly emphasize: set his face against that man and his family?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 4, 'How does Leviticus 20 use the detail ''A land flowing with milk and honey'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter binds ethical separation to the privilege of inheritance.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter binds ethical separation to the privilege of inheritance.', 'The chapter binds ethical separation to the privilege of inheritance. The detail appears in Leviticus 20:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 20 use the detail ''A land flowing with milk and honey'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 4, 'How does Leviticus 20 use the detail ''Because the LORD sanctifies them'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter roots moral separation in God''s sanctifying claim on Israel."]'::jsonb, 'The chapter roots moral separation in God''s sanctifying claim on Israel.', 'The chapter roots moral separation in God''s sanctifying claim on Israel. The detail appears in Leviticus 20:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 20 use the detail ''Because the LORD sanctifies them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 4, 'How does Leviticus 20 use the detail ''Between the clean beast and the unclean, and between the unclean bird and the clean'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter shows holiness as a total way of life, not a narrow category.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows holiness as a total way of life, not a narrow category.', 'The chapter shows holiness as a total way of life, not a narrow category. The detail appears in Leviticus 20:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 20 use the detail ''Between the clean beast and the unclean, and between the unclean bird and the clean'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 4, 'How does Leviticus 20 use the detail ''Do not turn to them'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter treats false spiritual mediation as covenant treachery.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter treats false spiritual mediation as covenant treachery.', 'The chapter treats false spiritual mediation as covenant treachery. The detail appears in Leviticus 20:6, 27.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 20 use the detail ''Do not turn to them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 4, 'How does Leviticus 20 use the detail ''He shall surely be put to death'' within the chapter as a whole?', '["The chapter shows that some abominations bring the severest sanctions.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows that some abominations bring the severest sanctions.', 'The chapter shows that some abominations bring the severest sanctions. The detail appears in Leviticus 20:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 20 use the detail ''He shall surely be put to death'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 4, 'How does Leviticus 20 use the detail ''He shall surely be put to death'' within the chapter as a whole?', '["The chapter places parental honor among the most serious social obligations.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter places parental honor among the most serious social obligations.', 'The chapter places parental honor among the most serious social obligations. The detail appears in Leviticus 20:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 20 use the detail ''He shall surely be put to death'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 4, 'How does Leviticus 20 use the detail ''Set his face against that man and his family'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter holds both individuals and the community accountable.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter holds both individuals and the community accountable.', 'The chapter holds both individuals and the community accountable. The detail appears in Leviticus 20:4-5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 20 use the detail ''Set his face against that man and his family'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 5, 'What larger theological point in Leviticus 20 is reinforced by the detail ''A land flowing with milk and honey''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Holiness is tied to life in the gift of the land.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness is tied to life in the gift of the land.', 'Holiness is tied to life in the gift of the land. In context, the chapter uses this detail as part of that wider point (Leviticus 20:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 20 is reinforced by the detail ''A land flowing with milk and honey''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 5, 'What larger theological point in Leviticus 20 is reinforced by the detail ''Because the LORD sanctifies them''?', '["Divine grace grounds covenant holiness.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Divine grace grounds covenant holiness.', 'Divine grace grounds covenant holiness. In context, the chapter uses this detail as part of that wider point (Leviticus 20:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 20 is reinforced by the detail ''Because the LORD sanctifies them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 5, 'What larger theological point in Leviticus 20 is reinforced by the detail ''Between the clean beast and the unclean, and between the unclean bird and the clean''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Covenant identity touched both morality and daily practice."]'::jsonb, 'Covenant identity touched both morality and daily practice.', 'Covenant identity touched both morality and daily practice. In context, the chapter uses this detail as part of that wider point (Leviticus 20:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 20 is reinforced by the detail ''Between the clean beast and the unclean, and between the unclean bird and the clean''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 5, 'What larger theological point in Leviticus 20 is reinforced by the detail ''Do not turn to them''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Holiness rejects occult alternatives to God."]'::jsonb, 'Holiness rejects occult alternatives to God.', 'Holiness rejects occult alternatives to God. In context, the chapter uses this detail as part of that wider point (Leviticus 20:6, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 20 is reinforced by the detail ''Do not turn to them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 5, 'What larger theological point in Leviticus 20 is reinforced by the detail ''He shall surely be put to death''?', '["That worship can be detached from covenant obedience", "The chapter moves from forbidden acts to covenant penalties.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter moves from forbidden acts to covenant penalties.', 'The chapter moves from forbidden acts to covenant penalties. In context, the chapter uses this detail as part of that wider point (Leviticus 20:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 20 is reinforced by the detail ''He shall surely be put to death''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 5, 'What larger theological point in Leviticus 20 is reinforced by the detail ''He shall surely be put to death''?', '["That worship can be detached from covenant obedience", "Family order is protected as part of holy covenant life.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Family order is protected as part of holy covenant life.', 'Family order is protected as part of holy covenant life. In context, the chapter uses this detail as part of that wider point (Leviticus 20:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 20 is reinforced by the detail ''He shall surely be put to death''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 20, 5, 'What larger theological point in Leviticus 20 is reinforced by the detail ''Set his face against that man and his family''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Communal negligence does not cancel divine justice.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Communal negligence does not cancel divine justice.', 'Communal negligence does not cancel divine justice. In context, the chapter uses this detail as part of that wider point (Leviticus 20:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 20 is reinforced by the detail ''Set his face against that man and his family''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 1, 'Could a blemished priest still eat the bread of his God?', '["No, he was permanently expelled", "Yes, both of the most holy and of the holy", "Only on Sabbaths", "Only outside the sanctuary court"]'::jsonb, 'Yes, both of the most holy and of the holy', 'A blemished priest could eat holy food though he could not offer at the altar. (Leviticus 21:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Could a blemished priest still eat the bread of his God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 1, 'For whom could an ordinary priest become unclean by touching the dead?', '["For any Israelite neighbor", "For his close relatives such as mother, father, son, daughter, brother, or unmarried sister", "Only for the high priest", "For no one at all"]'::jsonb, 'For his close relatives such as mother, father, son, daughter, brother, or unmarried sister', 'Ordinary priests had limited exceptions for close family mourning. (Leviticus 21:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'For whom could an ordinary priest become unclean by touching the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 1, 'What could a blemished priest not approach?', '["The laver or the priestly garments", "The camp gate or the tribal assembly", "The veil or the altar", "The ark only on feast days"]'::jsonb, 'The veil or the altar', 'He was barred from approaching the veil or altar because of the sanctuary''s holiness. (Leviticus 21:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What could a blemished priest not approach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 1, 'What kind of descendant of Aaron could not offer the bread of his God?', '["One who had a blemish", "One younger than thirty", "One born outside the camp", "One who owned no land"]'::jsonb, 'One who had a blemish', 'Physical blemishes disqualified a priest from offering at the altar. (Leviticus 21:17-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of descendant of Aaron could not offer the bread of his God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 1, 'What was the high priest not allowed to do even for his parents'' deaths?', '["Enter the holy place again", "Eat the peace offering", "Make himself unclean for the dead", "Wear the breastplate"]'::jsonb, 'Make himself unclean for the dead', 'The high priest had stricter rules and could not defile himself even for parents. (Leviticus 21:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the high priest not allowed to do even for his parents'' deaths?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 1, 'Whom was the high priest commanded to marry?', '["Any widow of a priestly family", "A woman from a foreign nation who feared God", "A divorced woman with children", "A virgin of his own people"]'::jsonb, 'A virgin of his own people', 'The high priest had to marry a virgin from his people. (Leviticus 21:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom was the high priest commanded to marry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 1, 'Why were the priests given these restrictions?', '["Because Moses feared rebellion", "Because the people were weak", "Because the land was not yet subdued", "Because the LORD sanctifies them"]'::jsonb, 'Because the LORD sanctifies them', 'The rationale is that the LORD sanctifies the priesthood. (Leviticus 21:8, 15, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were the priests given these restrictions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 2, 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:1-3)', '["For any Israelite neighbor", "For his close relatives such as mother, father, son, daughter, brother, or unmarried sister", "Only for the high priest", "For no one at all"]'::jsonb, 'For his close relatives such as mother, father, son, daughter, brother, or unmarried sister', 'Ordinary priests had limited exceptions for close family mourning. That detail is part of the holiness of priests instructions in Leviticus 21:1-3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:1-3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 2, 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:10-11)', '["Enter the holy place again", "Eat the peace offering", "Make himself unclean for the dead", "Wear the breastplate"]'::jsonb, 'Make himself unclean for the dead', 'The high priest had stricter rules and could not defile himself even for parents. That detail is part of the holiness of priests instructions in Leviticus 21:10-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:10-11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 2, 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:13-14)', '["Any widow of a priestly family", "A woman from a foreign nation who feared God", "A divorced woman with children", "A virgin of his own people"]'::jsonb, 'A virgin of his own people', 'The high priest had to marry a virgin from his people. That detail is part of the holiness of priests instructions in Leviticus 21:13-14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:13-14)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 2, 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:17-21)', '["One who had a blemish", "One younger than thirty", "One born outside the camp", "One who owned no land"]'::jsonb, 'One who had a blemish', 'Physical blemishes disqualified a priest from offering at the altar. That detail is part of the holiness of priests instructions in Leviticus 21:17-21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:17-21)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 2, 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:22)', '["No, he was permanently expelled", "Yes, both of the most holy and of the holy", "Only on Sabbaths", "Only outside the sanctuary court"]'::jsonb, 'Yes, both of the most holy and of the holy', 'A blemished priest could eat holy food though he could not offer at the altar. That detail is part of the holiness of priests instructions in Leviticus 21:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:22)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 2, 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:23)', '["The laver or the priestly garments", "The camp gate or the tribal assembly", "The veil or the altar", "The ark only on feast days"]'::jsonb, 'The veil or the altar', 'He was barred from approaching the veil or altar because of the sanctuary''s holiness. That detail is part of the holiness of priests instructions in Leviticus 21:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:23)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 2, 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:8, 15, 23)', '["Because Moses feared rebellion", "Because the people were weak", "Because the land was not yet subdued", "Because the LORD sanctifies them"]'::jsonb, 'Because the LORD sanctifies them', 'The rationale is that the LORD sanctifies the priesthood. That detail is part of the holiness of priests instructions in Leviticus 21:8, 15, 23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 21, which detail fits the holiness of priests instructions? (Leviticus 21:8, 15, 23)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 3, 'In Leviticus 21, what does this detail chiefly emphasize: a virgin of his own people?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Priestly holiness extended into marriage.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly holiness extended into marriage.', 'Priestly holiness extended into marriage. The high priest had to marry a virgin from his people. (Leviticus 21:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 21, what does this detail chiefly emphasize: a virgin of his own people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 3, 'In Leviticus 21, what does this detail chiefly emphasize: because the lord sanctifies them?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Priestly holiness rests on God''s sanctifying claim.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly holiness rests on God''s sanctifying claim.', 'Priestly holiness rests on God''s sanctifying claim. The rationale is that the LORD sanctifies the priesthood. (Leviticus 21:8, 15, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 21, what does this detail chiefly emphasize: because the lord sanctifies them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 3, 'In Leviticus 21, what does this detail chiefly emphasize: for his close relatives such as mother, father, son, daughter, brother, or unmarried sister?', '["Priestly holiness restricted even natural grief.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Priestly holiness restricted even natural grief.', 'Priestly holiness restricted even natural grief. Ordinary priests had limited exceptions for close family mourning. (Leviticus 21:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 21, what does this detail chiefly emphasize: for his close relatives such as mother, father, son, daughter, brother, or unmarried sister?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 3, 'In Leviticus 21, what does this detail chiefly emphasize: make himself unclean for the dead?', '["That ritual details were optional once the offering began", "Greater holiness brings greater restriction.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Greater holiness brings greater restriction.', 'Greater holiness brings greater restriction. The high priest had stricter rules and could not defile himself even for parents. (Leviticus 21:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 21, what does this detail chiefly emphasize: make himself unclean for the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 3, 'In Leviticus 21, what does this detail chiefly emphasize: one who had a blemish?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The chapter symbolically guards wholeness in those who approach the altar."]'::jsonb, 'The chapter symbolically guards wholeness in those who approach the altar.', 'The chapter symbolically guards wholeness in those who approach the altar. Physical blemishes disqualified a priest from offering at the altar. (Leviticus 21:17-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 21, what does this detail chiefly emphasize: one who had a blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 3, 'In Leviticus 21, what does this detail chiefly emphasize: the veil or the altar?', '["That ritual details were optional once the offering began", "Holy spaces had guarded boundaries.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holy spaces had guarded boundaries.', 'Holy spaces had guarded boundaries. He was barred from approaching the veil or altar because of the sanctuary''s holiness. (Leviticus 21:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 21, what does this detail chiefly emphasize: the veil or the altar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 3, 'In Leviticus 21, what does this detail chiefly emphasize: yes, both of the most holy and of the holy?', '["Disqualification from service was not exclusion from priestly provision.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Disqualification from service was not exclusion from priestly provision.', 'Disqualification from service was not exclusion from priestly provision. A blemished priest could eat holy food though he could not offer at the altar. (Leviticus 21:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 21, what does this detail chiefly emphasize: yes, both of the most holy and of the holy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 4, 'How does Leviticus 21 use the detail ''A virgin of his own people'' within the chapter as a whole?', '["The chapter binds domestic life to the sanctity of priestly office.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter binds domestic life to the sanctity of priestly office.', 'The chapter binds domestic life to the sanctity of priestly office. The detail appears in Leviticus 21:13-14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 21 use the detail ''A virgin of his own people'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 4, 'How does Leviticus 21 use the detail ''Because the LORD sanctifies them'' within the chapter as a whole?', '["The chapter grounds priestly separations in divine sanctification, not personal status.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter grounds priestly separations in divine sanctification, not personal status.', 'The chapter grounds priestly separations in divine sanctification, not personal status. The detail appears in Leviticus 21:8, 15, 23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 21 use the detail ''Because the LORD sanctifies them'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 4, 'How does Leviticus 21 use the detail ''For his close relatives such as mother, father, son, daughter, brother, or unmarried sister'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter regulates mourning in light of holy office.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter regulates mourning in light of holy office.', 'The chapter regulates mourning in light of holy office. The detail appears in Leviticus 21:1-3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 21 use the detail ''For his close relatives such as mother, father, son, daughter, brother, or unmarried sister'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 4, 'How does Leviticus 21 use the detail ''Make himself unclean for the dead'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter distinguishes the high priest as uniquely bound to sanctuary holiness."]'::jsonb, 'The chapter distinguishes the high priest as uniquely bound to sanctuary holiness.', 'The chapter distinguishes the high priest as uniquely bound to sanctuary holiness. The detail appears in Leviticus 21:10-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 21 use the detail ''Make himself unclean for the dead'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 4, 'How does Leviticus 21 use the detail ''One who had a blemish'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter makes visible integrity a sign in priestly representation.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter makes visible integrity a sign in priestly representation.', 'The chapter makes visible integrity a sign in priestly representation. The detail appears in Leviticus 21:17-21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 21 use the detail ''One who had a blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 4, 'How does Leviticus 21 use the detail ''The veil or the altar'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter protects sanctuary holiness through priestly restrictions."]'::jsonb, 'The chapter protects sanctuary holiness through priestly restrictions.', 'The chapter protects sanctuary holiness through priestly restrictions. The detail appears in Leviticus 21:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 21 use the detail ''The veil or the altar'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 4, 'How does Leviticus 21 use the detail ''Yes, both of the most holy and of the holy'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter distinguishes participation in holy food from active altar ministry.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter distinguishes participation in holy food from active altar ministry.', 'The chapter distinguishes participation in holy food from active altar ministry. The detail appears in Leviticus 21:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 21 use the detail ''Yes, both of the most holy and of the holy'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 5, 'What larger theological point in Leviticus 21 is reinforced by the detail ''A virgin of his own people''?', '["Priestly holiness extended into marriage.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Priestly holiness extended into marriage.', 'Priestly holiness extended into marriage. In context, the chapter uses this detail as part of that wider point (Leviticus 21:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 21 is reinforced by the detail ''A virgin of his own people''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 5, 'What larger theological point in Leviticus 21 is reinforced by the detail ''Because the LORD sanctifies them''?', '["Priestly holiness rests on God''s sanctifying claim.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Priestly holiness rests on God''s sanctifying claim.', 'Priestly holiness rests on God''s sanctifying claim. In context, the chapter uses this detail as part of that wider point (Leviticus 21:8, 15, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 21 is reinforced by the detail ''Because the LORD sanctifies them''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 5, 'What larger theological point in Leviticus 21 is reinforced by the detail ''For his close relatives such as mother, father, son, daughter, brother, or unmarried sister''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Priestly holiness restricted even natural grief.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Priestly holiness restricted even natural grief.', 'Priestly holiness restricted even natural grief. In context, the chapter uses this detail as part of that wider point (Leviticus 21:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 21 is reinforced by the detail ''For his close relatives such as mother, father, son, daughter, brother, or unmarried sister''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 5, 'What larger theological point in Leviticus 21 is reinforced by the detail ''Make himself unclean for the dead''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Greater holiness brings greater restriction."]'::jsonb, 'Greater holiness brings greater restriction.', 'Greater holiness brings greater restriction. In context, the chapter uses this detail as part of that wider point (Leviticus 21:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 21 is reinforced by the detail ''Make himself unclean for the dead''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 5, 'What larger theological point in Leviticus 21 is reinforced by the detail ''One who had a blemish''?', '["That worship can be detached from covenant obedience", "The chapter symbolically guards wholeness in those who approach the altar.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter symbolically guards wholeness in those who approach the altar.', 'The chapter symbolically guards wholeness in those who approach the altar. In context, the chapter uses this detail as part of that wider point (Leviticus 21:17-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 21 is reinforced by the detail ''One who had a blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 5, 'What larger theological point in Leviticus 21 is reinforced by the detail ''The veil or the altar''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Holy spaces had guarded boundaries."]'::jsonb, 'Holy spaces had guarded boundaries.', 'Holy spaces had guarded boundaries. In context, the chapter uses this detail as part of that wider point (Leviticus 21:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 21 is reinforced by the detail ''The veil or the altar''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 21, 5, 'What larger theological point in Leviticus 21 is reinforced by the detail ''Yes, both of the most holy and of the holy''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Disqualification from service was not exclusion from priestly provision.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Disqualification from service was not exclusion from priestly provision.', 'Disqualification from service was not exclusion from priestly provision. In context, the chapter uses this detail as part of that wider point (Leviticus 21:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 21 is reinforced by the detail ''Yes, both of the most holy and of the holy''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 1, 'How many days had a newborn ox, sheep, or goat to stay with its mother before it could be offered?', '["One day", "Fourteen days", "Seven days", "Thirty days"]'::jsonb, 'Seven days', 'From the eighth day onward it could be accepted. (Leviticus 22:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many days had a newborn ox, sheep, or goat to stay with its mother before it could be offered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 1, 'What animal relation was forbidden to kill in one day?', '["Two male goats", "A dove and a pigeon", "A ram and a bull", "An animal and its young"]'::jsonb, 'An animal and its young', 'One could not kill an animal and its young on the same day. (Leviticus 22:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal relation was forbidden to kill in one day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 1, 'What condition had an offering animal to meet to be accepted?', '["It had to be the oldest in the flock", "It had to be without blemish", "It had to be female only", "It had to be purchased from a priest"]'::jsonb, 'It had to be without blemish', 'Defective animals were not acceptable for vows or freewill offerings. (Leviticus 22:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What condition had an offering animal to meet to be accepted?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 1, 'What had a priest with uncleanness to avoid?', '["All grain for seven years", "The outer court only", "The holy things until he was clean", "Any contact with Levites"]'::jsonb, 'The holy things until he was clean', 'An unclean priest could not eat holy things until cleansed. (Leviticus 22:2-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What had a priest with uncleanness to avoid?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 1, 'What happened if an outsider ate a holy thing unwittingly?', '["He had to add a fifth and give it to the priest", "He was cut off without remedy", "He became a priestly servant for a year", "He only had to wash and wait until evening"]'::jsonb, 'He had to add a fifth and give it to the priest', 'Inadvertent misuse required restitution plus an added fifth. (Leviticus 22:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened if an outsider ate a holy thing unwittingly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 1, 'Who among a priest''s household could eat the holy food?', '["Any Israelite guest", "Only married daughters", "Any Levite visiting the camp", "Those born in his house or bought with his money"]'::jsonb, 'Those born in his house or bought with his money', 'Permanent members of the priest''s household could eat his food. (Leviticus 22:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who among a priest''s household could eat the holy food?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 1, 'Why were these commands to be kept according to the chapter''s closing rationale?', '["Because the LORD brought Israel out of Egypt to be their God", "Because Aaron anointed the altar", "Because Canaanite judges approved them", "Because the tabernacle was newly built"]'::jsonb, 'Because the LORD brought Israel out of Egypt to be their God', 'Obedience is grounded in redemption and God''s claim over Israel. (Leviticus 22:31-33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were these commands to be kept according to the chapter''s closing rationale?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 2, 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:11)', '["Any Israelite guest", "Only married daughters", "Any Levite visiting the camp", "Those born in his house or bought with his money"]'::jsonb, 'Those born in his house or bought with his money', 'Permanent members of the priest''s household could eat his food. That detail is part of the eating holy things and acceptable offerings instructions in Leviticus 22:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 2, 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:14)', '["He had to add a fifth and give it to the priest", "He was cut off without remedy", "He became a priestly servant for a year", "He only had to wash and wait until evening"]'::jsonb, 'He had to add a fifth and give it to the priest', 'Inadvertent misuse required restitution plus an added fifth. That detail is part of the eating holy things and acceptable offerings instructions in Leviticus 22:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:14)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 2, 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:2-7)', '["All grain for seven years", "The outer court only", "The holy things until he was clean", "Any contact with Levites"]'::jsonb, 'The holy things until he was clean', 'An unclean priest could not eat holy things until cleansed. That detail is part of the eating holy things and acceptable offerings instructions in Leviticus 22:2-7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:2-7)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 2, 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:20-21)', '["It had to be the oldest in the flock", "It had to be without blemish", "It had to be female only", "It had to be purchased from a priest"]'::jsonb, 'It had to be without blemish', 'Defective animals were not acceptable for vows or freewill offerings. That detail is part of the eating holy things and acceptable offerings instructions in Leviticus 22:20-21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:20-21)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 2, 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:27)', '["One day", "Fourteen days", "Seven days", "Thirty days"]'::jsonb, 'Seven days', 'From the eighth day onward it could be accepted. That detail is part of the eating holy things and acceptable offerings instructions in Leviticus 22:27.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:27)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 2, 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:28)', '["Two male goats", "A dove and a pigeon", "A ram and a bull", "An animal and its young"]'::jsonb, 'An animal and its young', 'One could not kill an animal and its young on the same day. That detail is part of the eating holy things and acceptable offerings instructions in Leviticus 22:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:28)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 2, 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:31-33)', '["Because the LORD brought Israel out of Egypt to be their God", "Because Aaron anointed the altar", "Because Canaanite judges approved them", "Because the tabernacle was newly built"]'::jsonb, 'Because the LORD brought Israel out of Egypt to be their God', 'Obedience is grounded in redemption and God''s claim over Israel. That detail is part of the eating holy things and acceptable offerings instructions in Leviticus 22:31-33.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 22, which detail fits the eating holy things and acceptable offerings instructions? (Leviticus 22:31-33)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 3, 'In Leviticus 22, what does this detail chiefly emphasize: an animal and its young?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holiness included humane limits within sacrificial life.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness included humane limits within sacrificial life.', 'Holiness included humane limits within sacrificial life. One could not kill an animal and its young on the same day. (Leviticus 22:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 22, what does this detail chiefly emphasize: an animal and its young?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 3, 'In Leviticus 22, what does this detail chiefly emphasize: because the lord brought israel out of egypt to be their god?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Redemption is the motive for sanctified obedience."]'::jsonb, 'Redemption is the motive for sanctified obedience.', 'Redemption is the motive for sanctified obedience. Obedience is grounded in redemption and God''s claim over Israel. (Leviticus 22:31-33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 22, what does this detail chiefly emphasize: because the lord brought israel out of egypt to be their god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 3, 'In Leviticus 22, what does this detail chiefly emphasize: he had to add a fifth and give it to the priest?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Ignorance did not erase the need to repair misuse of holy things."]'::jsonb, 'Ignorance did not erase the need to repair misuse of holy things.', 'Ignorance did not erase the need to repair misuse of holy things. Inadvertent misuse required restitution plus an added fifth. (Leviticus 22:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 22, what does this detail chiefly emphasize: he had to add a fifth and give it to the priest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 3, 'In Leviticus 22, what does this detail chiefly emphasize: it had to be without blemish?', '["God must not be offered what is damaged or defective.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'God must not be offered what is damaged or defective.', 'God must not be offered what is damaged or defective. Defective animals were not acceptable for vows or freewill offerings. (Leviticus 22:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 22, what does this detail chiefly emphasize: it had to be without blemish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 3, 'In Leviticus 22, what does this detail chiefly emphasize: seven days?', '["That ritual details were optional once the offering began", "Even sacrificial timing was ordered by God.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Even sacrificial timing was ordered by God.', 'Even sacrificial timing was ordered by God. From the eighth day onward it could be accepted. (Leviticus 22:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 22, what does this detail chiefly emphasize: seven days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 3, 'In Leviticus 22, what does this detail chiefly emphasize: the holy things until he was clean?', '["That ritual details were optional once the offering began", "Even priests had to respect holy boundaries in their own uncleanness.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Even priests had to respect holy boundaries in their own uncleanness.', 'Even priests had to respect holy boundaries in their own uncleanness. An unclean priest could not eat holy things until cleansed. (Leviticus 22:2-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 22, what does this detail chiefly emphasize: the holy things until he was clean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 3, 'In Leviticus 22, what does this detail chiefly emphasize: those born in his house or bought with his money?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holy food was restricted but not limited to the priest alone.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holy food was restricted but not limited to the priest alone.', 'Holy food was restricted but not limited to the priest alone. Permanent members of the priest''s household could eat his food. (Leviticus 22:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 22, what does this detail chiefly emphasize: those born in his house or bought with his money?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 4, 'How does Leviticus 22 use the detail ''An animal and its young'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter tempers sacrifice with respect for creaturely order.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter tempers sacrifice with respect for creaturely order.', 'The chapter tempers sacrifice with respect for creaturely order. The detail appears in Leviticus 22:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 22 use the detail ''An animal and its young'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 4, 'How does Leviticus 22 use the detail ''Because the LORD brought Israel out of Egypt to be their God'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter roots priestly and sacrificial care in the exodus identity of Israel.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter roots priestly and sacrificial care in the exodus identity of Israel.', 'The chapter roots priestly and sacrificial care in the exodus identity of Israel. The detail appears in Leviticus 22:31-33.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 22 use the detail ''Because the LORD brought Israel out of Egypt to be their God'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 4, 'How does Leviticus 22 use the detail ''He had to add a fifth and give it to the priest'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter pairs restitution with respect for sacred food.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter pairs restitution with respect for sacred food.', 'The chapter pairs restitution with respect for sacred food. The detail appears in Leviticus 22:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 22 use the detail ''He had to add a fifth and give it to the priest'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 4, 'How does Leviticus 22 use the detail ''It had to be without blemish'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter demands integrity in what is presented to God."]'::jsonb, 'The chapter demands integrity in what is presented to God.', 'The chapter demands integrity in what is presented to God. The detail appears in Leviticus 22:20-21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 22 use the detail ''It had to be without blemish'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 4, 'How does Leviticus 22 use the detail ''Seven days'' within the chapter as a whole?', '["The chapter governs not only what is offered but when it may be offered.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter governs not only what is offered but when it may be offered.', 'The chapter governs not only what is offered but when it may be offered. The detail appears in Leviticus 22:27.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 22 use the detail ''Seven days'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 4, 'How does Leviticus 22 use the detail ''The holy things until he was clean'' within the chapter as a whole?', '["The chapter subjects priestly privilege to priestly purity.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter subjects priestly privilege to priestly purity.', 'The chapter subjects priestly privilege to priestly purity. The detail appears in Leviticus 22:2-7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 22 use the detail ''The holy things until he was clean'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 4, 'How does Leviticus 22 use the detail ''Those born in his house or bought with his money'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter carefully defines legitimate participation in sacred provision.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter carefully defines legitimate participation in sacred provision.', 'The chapter carefully defines legitimate participation in sacred provision. The detail appears in Leviticus 22:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 22 use the detail ''Those born in his house or bought with his money'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 5, 'What larger theological point in Leviticus 22 is reinforced by the detail ''An animal and its young''?', '["Holiness included humane limits within sacrificial life.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holiness included humane limits within sacrificial life.', 'Holiness included humane limits within sacrificial life. In context, the chapter uses this detail as part of that wider point (Leviticus 22:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 22 is reinforced by the detail ''An animal and its young''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 5, 'What larger theological point in Leviticus 22 is reinforced by the detail ''Because the LORD brought Israel out of Egypt to be their God''?', '["That worship can be detached from covenant obedience", "Redemption is the motive for sanctified obedience.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Redemption is the motive for sanctified obedience.', 'Redemption is the motive for sanctified obedience. In context, the chapter uses this detail as part of that wider point (Leviticus 22:31-33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 22 is reinforced by the detail ''Because the LORD brought Israel out of Egypt to be their God''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 5, 'What larger theological point in Leviticus 22 is reinforced by the detail ''He had to add a fifth and give it to the priest''?', '["That worship can be detached from covenant obedience", "Ignorance did not erase the need to repair misuse of holy things.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Ignorance did not erase the need to repair misuse of holy things.', 'Ignorance did not erase the need to repair misuse of holy things. In context, the chapter uses this detail as part of that wider point (Leviticus 22:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 22 is reinforced by the detail ''He had to add a fifth and give it to the priest''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 5, 'What larger theological point in Leviticus 22 is reinforced by the detail ''It had to be without blemish''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "God must not be offered what is damaged or defective.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'God must not be offered what is damaged or defective.', 'God must not be offered what is damaged or defective. In context, the chapter uses this detail as part of that wider point (Leviticus 22:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 22 is reinforced by the detail ''It had to be without blemish''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 5, 'What larger theological point in Leviticus 22 is reinforced by the detail ''Seven days''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Even sacrificial timing was ordered by God."]'::jsonb, 'Even sacrificial timing was ordered by God.', 'Even sacrificial timing was ordered by God. In context, the chapter uses this detail as part of that wider point (Leviticus 22:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 22 is reinforced by the detail ''Seven days''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 5, 'What larger theological point in Leviticus 22 is reinforced by the detail ''The holy things until he was clean''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Even priests had to respect holy boundaries in their own uncleanness."]'::jsonb, 'Even priests had to respect holy boundaries in their own uncleanness.', 'Even priests had to respect holy boundaries in their own uncleanness. In context, the chapter uses this detail as part of that wider point (Leviticus 22:2-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 22 is reinforced by the detail ''The holy things until he was clean''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 22, 5, 'What larger theological point in Leviticus 22 is reinforced by the detail ''Those born in his house or bought with his money''?', '["Holy food was restricted but not limited to the priest alone.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holy food was restricted but not limited to the priest alone.', 'Holy food was restricted but not limited to the priest alone. In context, the chapter uses this detail as part of that wider point (Leviticus 22:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 22 is reinforced by the detail ''Those born in his house or bought with his money''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 1, 'How was the Feast of Weeks counted from the sheaf offering?', '["Forty nights from Passover only", "Three new moons later", "Seven sabbaths complete, then the next day", "Ten days after Trumpets"]'::jsonb, 'Seven sabbaths complete, then the next day', 'Fifty days were counted from the day after the Sabbath associated with firstfruits. (Leviticus 23:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'How was the Feast of Weeks counted from the sheaf offering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 1, 'On which day of the first month was the LORD''s Passover?', '["The fourteenth day at even", "The first day at sunrise", "The tenth day at noon", "The fifteenth day at dawn"]'::jsonb, 'The fourteenth day at even', 'Passover was kept on the fourteenth day of the first month at evening. (Leviticus 23:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'On which day of the first month was the LORD''s Passover?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 1, 'What did Israel do during the Feast of Booths?', '["Dwell in booths for seven days", "Eat only unleavened bread", "March around Jericho", "Offer no sacrifices at all"]'::jsonb, 'Dwell in booths for seven days', 'Living in booths reminded Israel of the wilderness journey. (Leviticus 23:42-43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Israel do during the Feast of Booths?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 1, 'What did the priest wave before the LORD after Passover?', '["The scapegoat", "The sheaf of the firstfruits", "The incense censer", "The showbread table"]'::jsonb, 'The sheaf of the firstfruits', 'The first sheaf of harvest was waved before the LORD for acceptance. (Leviticus 23:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the priest wave before the LORD after Passover?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 1, 'What was the memorial of the blowing of trumpets?', '["A fast on the fourteenth day of the sixth month", "A sacrifice at the end of harvest only", "A vigil on the eighth day of Booths", "A sabbath on the first day of the seventh month"]'::jsonb, 'A sabbath on the first day of the seventh month', 'Trumpets marked a memorial on the first day of the seventh month. (Leviticus 23:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the memorial of the blowing of trumpets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 1, 'What weekly holy time is listed first among the LORD''s appointed feasts?', '["Passover", "The Feast of Booths", "The Day of Atonement", "The Sabbath"]'::jsonb, 'The Sabbath', 'The weekly Sabbath opens the calendar of sacred times. (Leviticus 23:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What weekly holy time is listed first among the LORD''s appointed feasts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 1, 'Why were Israel to dwell in booths according to the text?', '["So harvest workers could sleep near the fields", "So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt", "So the priests could count the tribes", "So strangers would learn Hebrew"]'::jsonb, 'So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt', 'The booths memorialized the exodus wilderness period. (Leviticus 23:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were Israel to dwell in booths according to the text?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 2, 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:10-11)', '["The scapegoat", "The sheaf of the firstfruits", "The incense censer", "The showbread table"]'::jsonb, 'The sheaf of the firstfruits', 'The first sheaf of harvest was waved before the LORD for acceptance. That detail is part of the appointed feasts of the LORD instructions in Leviticus 23:10-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:10-11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 2, 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:15-16)', '["Forty nights from Passover only", "Three new moons later", "Seven sabbaths complete, then the next day", "Ten days after Trumpets"]'::jsonb, 'Seven sabbaths complete, then the next day', 'Fifty days were counted from the day after the Sabbath associated with firstfruits. That detail is part of the appointed feasts of the LORD instructions in Leviticus 23:15-16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:15-16)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 2, 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:24)', '["A fast on the fourteenth day of the sixth month", "A sacrifice at the end of harvest only", "A vigil on the eighth day of Booths", "A sabbath on the first day of the seventh month"]'::jsonb, 'A sabbath on the first day of the seventh month', 'Trumpets marked a memorial on the first day of the seventh month. That detail is part of the appointed feasts of the LORD instructions in Leviticus 23:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:24)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 2, 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:3)', '["Passover", "The Feast of Booths", "The Day of Atonement", "The Sabbath"]'::jsonb, 'The Sabbath', 'The weekly Sabbath opens the calendar of sacred times. That detail is part of the appointed feasts of the LORD instructions in Leviticus 23:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:3)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 2, 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:42-43)', '["Dwell in booths for seven days", "Eat only unleavened bread", "March around Jericho", "Offer no sacrifices at all"]'::jsonb, 'Dwell in booths for seven days', 'Living in booths reminded Israel of the wilderness journey. That detail is part of the appointed feasts of the LORD instructions in Leviticus 23:42-43.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:42-43)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 2, 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:43)', '["So harvest workers could sleep near the fields", "So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt", "So the priests could count the tribes", "So strangers would learn Hebrew"]'::jsonb, 'So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt', 'The booths memorialized the exodus wilderness period. That detail is part of the appointed feasts of the LORD instructions in Leviticus 23:43.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:43)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 2, 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:5)', '["The fourteenth day at even", "The first day at sunrise", "The tenth day at noon", "The fifteenth day at dawn"]'::jsonb, 'The fourteenth day at even', 'Passover was kept on the fourteenth day of the first month at evening. That detail is part of the appointed feasts of the LORD instructions in Leviticus 23:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 23, which detail fits the appointed feasts of the LORD instructions? (Leviticus 23:5)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 3, 'In Leviticus 23, what does this detail chiefly emphasize: a sabbath on the first day of the seventh month?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Sacred assemblies punctuate the year with holy remembrance.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Sacred assemblies punctuate the year with holy remembrance.', 'Sacred assemblies punctuate the year with holy remembrance. Trumpets marked a memorial on the first day of the seventh month. (Leviticus 23:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 23, what does this detail chiefly emphasize: a sabbath on the first day of the seventh month?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 3, 'In Leviticus 23, what does this detail chiefly emphasize: dwell in booths for seven days?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Festivals teach memory by embodied practice."]'::jsonb, 'Festivals teach memory by embodied practice.', 'Festivals teach memory by embodied practice. Living in booths reminded Israel of the wilderness journey. (Leviticus 23:42-43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 23, what does this detail chiefly emphasize: dwell in booths for seven days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 3, 'In Leviticus 23, what does this detail chiefly emphasize: seven sabbaths complete, then the next day?', '["That ritual details were optional once the offering began", "The feast calendar is ordered by counted sacred time.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The feast calendar is ordered by counted sacred time.', 'The feast calendar is ordered by counted sacred time. Fifty days were counted from the day after the Sabbath associated with firstfruits. (Leviticus 23:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 23, what does this detail chiefly emphasize: seven sabbaths complete, then the next day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 3, 'In Leviticus 23, what does this detail chiefly emphasize: so future generations would know the lord made israel dwell in booths when he brought them out of egypt?', '["Festival practice preserves covenant memory across generations.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Festival practice preserves covenant memory across generations.', 'Festival practice preserves covenant memory across generations. The booths memorialized the exodus wilderness period. (Leviticus 23:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 23, what does this detail chiefly emphasize: so future generations would know the lord made israel dwell in booths when he brought them out of egypt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 3, 'In Leviticus 23, what does this detail chiefly emphasize: the fourteenth day at even?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Redemptive memory is built into Israel''s yearly worship."]'::jsonb, 'Redemptive memory is built into Israel''s yearly worship.', 'Redemptive memory is built into Israel''s yearly worship. Passover was kept on the fourteenth day of the first month at evening. (Leviticus 23:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 23, what does this detail chiefly emphasize: the fourteenth day at even?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 3, 'In Leviticus 23, what does this detail chiefly emphasize: the sabbath?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holy time begins with regular weekly rest before annual festivals.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holy time begins with regular weekly rest before annual festivals.', 'Holy time begins with regular weekly rest before annual festivals. The weekly Sabbath opens the calendar of sacred times. (Leviticus 23:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 23, what does this detail chiefly emphasize: the sabbath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 3, 'In Leviticus 23, what does this detail chiefly emphasize: the sheaf of the firstfruits?', '["Harvest begins by acknowledging God as giver.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Harvest begins by acknowledging God as giver.', 'Harvest begins by acknowledging God as giver. The first sheaf of harvest was waved before the LORD for acceptance. (Leviticus 23:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 23, what does this detail chiefly emphasize: the sheaf of the firstfruits?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 4, 'How does Leviticus 23 use the detail ''A sabbath on the first day of the seventh month'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter builds anticipation into the seventh-month festival cycle.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter builds anticipation into the seventh-month festival cycle.', 'The chapter builds anticipation into the seventh-month festival cycle. The detail appears in Leviticus 23:24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 23 use the detail ''A sabbath on the first day of the seventh month'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 4, 'How does Leviticus 23 use the detail ''Dwell in booths for seven days'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter turns historical remembrance into lived annual reenactment."]'::jsonb, 'The chapter turns historical remembrance into lived annual reenactment.', 'The chapter turns historical remembrance into lived annual reenactment. The detail appears in Leviticus 23:42-43.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 23 use the detail ''Dwell in booths for seven days'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 4, 'How does Leviticus 23 use the detail ''Seven sabbaths complete, then the next day'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter makes worship a disciplined remembrance marked by counting.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter makes worship a disciplined remembrance marked by counting.', 'The chapter makes worship a disciplined remembrance marked by counting. The detail appears in Leviticus 23:15-16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 23 use the detail ''Seven sabbaths complete, then the next day'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 4, 'How does Leviticus 23 use the detail ''So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt'' within the chapter as a whole?', '["The chapter joins calendar, ritual, and teaching for Israel''s identity formation.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter joins calendar, ritual, and teaching for Israel''s identity formation.', 'The chapter joins calendar, ritual, and teaching for Israel''s identity formation. The detail appears in Leviticus 23:43.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 23 use the detail ''So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 4, 'How does Leviticus 23 use the detail ''The Sabbath'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter presents Israel''s calendar as structured around God''s appointments.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter presents Israel''s calendar as structured around God''s appointments.', 'The chapter presents Israel''s calendar as structured around God''s appointments. The detail appears in Leviticus 23:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 23 use the detail ''The Sabbath'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 4, 'How does Leviticus 23 use the detail ''The fourteenth day at even'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter orders time around remembered deliverance."]'::jsonb, 'The chapter orders time around remembered deliverance.', 'The chapter orders time around remembered deliverance. The detail appears in Leviticus 23:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 23 use the detail ''The fourteenth day at even'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 4, 'How does Leviticus 23 use the detail ''The sheaf of the firstfruits'' within the chapter as a whole?', '["The chapter sanctifies agricultural life through firstfruits worship.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter sanctifies agricultural life through firstfruits worship.', 'The chapter sanctifies agricultural life through firstfruits worship. The detail appears in Leviticus 23:10-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 23 use the detail ''The sheaf of the firstfruits'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 5, 'What larger theological point in Leviticus 23 is reinforced by the detail ''A sabbath on the first day of the seventh month''?', '["Sacred assemblies punctuate the year with holy remembrance.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Sacred assemblies punctuate the year with holy remembrance.', 'Sacred assemblies punctuate the year with holy remembrance. In context, the chapter uses this detail as part of that wider point (Leviticus 23:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 23 is reinforced by the detail ''A sabbath on the first day of the seventh month''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 5, 'What larger theological point in Leviticus 23 is reinforced by the detail ''Dwell in booths for seven days''?', '["That worship can be detached from covenant obedience", "Festivals teach memory by embodied practice.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Festivals teach memory by embodied practice.', 'Festivals teach memory by embodied practice. In context, the chapter uses this detail as part of that wider point (Leviticus 23:42-43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 23 is reinforced by the detail ''Dwell in booths for seven days''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 5, 'What larger theological point in Leviticus 23 is reinforced by the detail ''Seven sabbaths complete, then the next day''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The feast calendar is ordered by counted sacred time."]'::jsonb, 'The feast calendar is ordered by counted sacred time.', 'The feast calendar is ordered by counted sacred time. In context, the chapter uses this detail as part of that wider point (Leviticus 23:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 23 is reinforced by the detail ''Seven sabbaths complete, then the next day''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 5, 'What larger theological point in Leviticus 23 is reinforced by the detail ''So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Festival practice preserves covenant memory across generations.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Festival practice preserves covenant memory across generations.', 'Festival practice preserves covenant memory across generations. In context, the chapter uses this detail as part of that wider point (Leviticus 23:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 23 is reinforced by the detail ''So future generations would know the LORD made Israel dwell in booths when he brought them out of Egypt''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 5, 'What larger theological point in Leviticus 23 is reinforced by the detail ''The Sabbath''?', '["Holy time begins with regular weekly rest before annual festivals.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holy time begins with regular weekly rest before annual festivals.', 'Holy time begins with regular weekly rest before annual festivals. In context, the chapter uses this detail as part of that wider point (Leviticus 23:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 23 is reinforced by the detail ''The Sabbath''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 5, 'What larger theological point in Leviticus 23 is reinforced by the detail ''The fourteenth day at even''?', '["That worship can be detached from covenant obedience", "Redemptive memory is built into Israel''s yearly worship.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Redemptive memory is built into Israel''s yearly worship.', 'Redemptive memory is built into Israel''s yearly worship. In context, the chapter uses this detail as part of that wider point (Leviticus 23:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 23 is reinforced by the detail ''The fourteenth day at even''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 23, 5, 'What larger theological point in Leviticus 23 is reinforced by the detail ''The sheaf of the firstfruits''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Harvest begins by acknowledging God as giver.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Harvest begins by acknowledging God as giver.', 'Harvest begins by acknowledging God as giver. In context, the chapter uses this detail as part of that wider point (Leviticus 23:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 23 is reinforced by the detail ''The sheaf of the firstfruits''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 1, 'How many cakes of bread were set before the LORD each Sabbath?', '["Seven", "Twelve", "Ten", "Twenty-four"]'::jsonb, 'Twelve', 'Twelve cakes were arranged in two rows as a continual bread offering. (Leviticus 24:5-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many cakes of bread were set before the LORD each Sabbath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 1, 'How was the stranger to be treated in these judgments?', '["The stranger paid silver instead of punishment", "The native alone could be tried in sacred cases", "The stranger and the native were under one law", "The stranger answered only to tribal elders"]'::jsonb, 'The stranger and the native were under one law', 'One standard applied to both stranger and native-born. (Leviticus 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'How was the stranger to be treated in these judgments?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 1, 'What did the people do with the blasphemer before judgment was clarified?', '["They expelled him immediately without inquiry", "They ignored the quarrel until evening", "They made him offer a ram", "They put him in custody"]'::jsonb, 'They put him in custody', 'He was held until the LORD''s will was declared. (Leviticus 24:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the people do with the blasphemer before judgment was clarified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 1, 'What penalty did the LORD command for the blasphemer?', '["All the congregation was to stone him", "He was to remain outside the camp for a year", "He was to restore a guilt offering double", "He was to shave his head and fast"]'::jsonb, 'All the congregation was to stone him', 'The community executed the judgment by stoning outside the camp. (Leviticus 24:14, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What penalty did the LORD command for the blasphemer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 1, 'What principle of retribution is stated in this chapter?', '["Love your enemy and lend freely", "Breach for breach, eye for eye, tooth for tooth", "Sevenfold vengeance for every wound", "A life for a sheep and a lamb for a tooth"]'::jsonb, 'Breach for breach, eye for eye, tooth for tooth', 'The law states proportionate justice for bodily injury. (Leviticus 24:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What principle of retribution is stated in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 1, 'What were the Israelites to bring for the lamp in Leviticus 24?', '["Pure olive oil beaten for the light", "Incense ground fine", "Wine for a drink offering", "Cedars for the lampstand"]'::jsonb, 'Pure olive oil beaten for the light', 'Pure beaten olive oil kept the lamp burning continually. (Leviticus 24:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What were the Israelites to bring for the lamp in Leviticus 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 1, 'Who was the mother of the man who blasphemed the Name?', '["Elisheba, daughter of Amminadab, of Judah", "Miriam, sister of Moses, of Levi", "Shelomith, daughter of Dibri, of the tribe of Dan", "Hannah, daughter of Eliab, of Ephraim"]'::jsonb, 'Shelomith, daughter of Dibri, of the tribe of Dan', 'The narrative identifies the blasphemer by maternal lineage in Israel. (Leviticus 24:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was the mother of the man who blasphemed the Name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 2, 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:10-11)', '["Elisheba, daughter of Amminadab, of Judah", "Miriam, sister of Moses, of Levi", "Shelomith, daughter of Dibri, of the tribe of Dan", "Hannah, daughter of Eliab, of Ephraim"]'::jsonb, 'Shelomith, daughter of Dibri, of the tribe of Dan', 'The narrative identifies the blasphemer by maternal lineage in Israel. That detail is part of the lamp, showbread, and blasphemy instructions in Leviticus 24:10-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:10-11)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 2, 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:12)', '["They expelled him immediately without inquiry", "They ignored the quarrel until evening", "They made him offer a ram", "They put him in custody"]'::jsonb, 'They put him in custody', 'He was held until the LORD''s will was declared. That detail is part of the lamp, showbread, and blasphemy instructions in Leviticus 24:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:12)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 2, 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:14, 23)', '["All the congregation was to stone him", "He was to remain outside the camp for a year", "He was to restore a guilt offering double", "He was to shave his head and fast"]'::jsonb, 'All the congregation was to stone him', 'The community executed the judgment by stoning outside the camp. That detail is part of the lamp, showbread, and blasphemy instructions in Leviticus 24:14, 23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:14, 23)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 2, 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:19-20)', '["Love your enemy and lend freely", "Breach for breach, eye for eye, tooth for tooth", "Sevenfold vengeance for every wound", "A life for a sheep and a lamb for a tooth"]'::jsonb, 'Breach for breach, eye for eye, tooth for tooth', 'The law states proportionate justice for bodily injury. That detail is part of the lamp, showbread, and blasphemy instructions in Leviticus 24:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:19-20)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 2, 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:2)', '["Pure olive oil beaten for the light", "Incense ground fine", "Wine for a drink offering", "Cedars for the lampstand"]'::jsonb, 'Pure olive oil beaten for the light', 'Pure beaten olive oil kept the lamp burning continually. That detail is part of the lamp, showbread, and blasphemy instructions in Leviticus 24:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 2, 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:22)', '["The stranger paid silver instead of punishment", "The native alone could be tried in sacred cases", "The stranger and the native were under one law", "The stranger answered only to tribal elders"]'::jsonb, 'The stranger and the native were under one law', 'One standard applied to both stranger and native-born. That detail is part of the lamp, showbread, and blasphemy instructions in Leviticus 24:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:22)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 2, 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:5-8)', '["Seven", "Twelve", "Ten", "Twenty-four"]'::jsonb, 'Twelve', 'Twelve cakes were arranged in two rows as a continual bread offering. That detail is part of the lamp, showbread, and blasphemy instructions in Leviticus 24:5-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 24, which detail fits the lamp, showbread, and blasphemy instructions? (Leviticus 24:5-8)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 3, 'In Leviticus 24, what does this detail chiefly emphasize: all the congregation was to stone him?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Profaning the divine Name brought severe covenant judgment."]'::jsonb, 'Profaning the divine Name brought severe covenant judgment.', 'Profaning the divine Name brought severe covenant judgment. The community executed the judgment by stoning outside the camp. (Leviticus 24:14, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 24, what does this detail chiefly emphasize: all the congregation was to stone him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 3, 'In Leviticus 24, what does this detail chiefly emphasize: breach for breach, eye for eye, tooth for tooth?', '["Justice must be measured and proportionate, not arbitrary.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Justice must be measured and proportionate, not arbitrary.', 'Justice must be measured and proportionate, not arbitrary. The law states proportionate justice for bodily injury. (Leviticus 24:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 24, what does this detail chiefly emphasize: breach for breach, eye for eye, tooth for tooth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 3, 'In Leviticus 24, what does this detail chiefly emphasize: pure olive oil beaten for the light?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The sanctuary required continual provision for ordered worship."]'::jsonb, 'The sanctuary required continual provision for ordered worship.', 'The sanctuary required continual provision for ordered worship. Pure beaten olive oil kept the lamp burning continually. (Leviticus 24:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 24, what does this detail chiefly emphasize: pure olive oil beaten for the light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 3, 'In Leviticus 24, what does this detail chiefly emphasize: shelomith, daughter of dibri, of the tribe of dan?', '["That ritual details were optional once the offering began", "The case unfolds publicly within the covenant community.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The case unfolds publicly within the covenant community.', 'The case unfolds publicly within the covenant community. The narrative identifies the blasphemer by maternal lineage in Israel. (Leviticus 24:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 24, what does this detail chiefly emphasize: shelomith, daughter of dibri, of the tribe of dan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 3, 'In Leviticus 24, what does this detail chiefly emphasize: the stranger and the native were under one law?', '["That ritual details were optional once the offering began", "Holiness and justice are not ethnically selective within the covenant community.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holiness and justice are not ethnically selective within the covenant community.', 'Holiness and justice are not ethnically selective within the covenant community. One standard applied to both stranger and native-born. (Leviticus 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 24, what does this detail chiefly emphasize: the stranger and the native were under one law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 3, 'In Leviticus 24, what does this detail chiefly emphasize: they put him in custody?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Serious cases required waiting for divine instruction.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Serious cases required waiting for divine instruction.', 'Serious cases required waiting for divine instruction. He was held until the LORD''s will was declared. (Leviticus 24:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 24, what does this detail chiefly emphasize: they put him in custody?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 3, 'In Leviticus 24, what does this detail chiefly emphasize: twelve?', '["The tribes are represented continually before God.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The tribes are represented continually before God.', 'The tribes are represented continually before God. Twelve cakes were arranged in two rows as a continual bread offering. (Leviticus 24:5-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 24, what does this detail chiefly emphasize: twelve?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 4, 'How does Leviticus 24 use the detail ''All the congregation was to stone him'' within the chapter as a whole?', '["The chapter guards God''s holiness through communal justice.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter guards God''s holiness through communal justice.', 'The chapter guards God''s holiness through communal justice. The detail appears in Leviticus 24:14, 23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 24 use the detail ''All the congregation was to stone him'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 4, 'How does Leviticus 24 use the detail ''Breach for breach, eye for eye, tooth for tooth'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter places both blasphemy and bodily harm under ordered public judgment.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter places both blasphemy and bodily harm under ordered public judgment.', 'The chapter places both blasphemy and bodily harm under ordered public judgment. The detail appears in Leviticus 24:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 24 use the detail ''Breach for breach, eye for eye, tooth for tooth'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 4, 'How does Leviticus 24 use the detail ''Pure olive oil beaten for the light'' within the chapter as a whole?', '["The chapter begins with ongoing light before the LORD.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter begins with ongoing light before the LORD.', 'The chapter begins with ongoing light before the LORD. The detail appears in Leviticus 24:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 24 use the detail ''Pure olive oil beaten for the light'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 4, 'How does Leviticus 24 use the detail ''Shelomith, daughter of Dibri, of the tribe of Dan'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter moves from sanctuary order to a concrete test of communal holiness.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter moves from sanctuary order to a concrete test of communal holiness.', 'The chapter moves from sanctuary order to a concrete test of communal holiness. The detail appears in Leviticus 24:10-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 24 use the detail ''Shelomith, daughter of Dibri, of the tribe of Dan'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 4, 'How does Leviticus 24 use the detail ''The stranger and the native were under one law'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter combines equality before the law with reverence for God''s holiness.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter combines equality before the law with reverence for God''s holiness.', 'The chapter combines equality before the law with reverence for God''s holiness. The detail appears in Leviticus 24:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 24 use the detail ''The stranger and the native were under one law'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 4, 'How does Leviticus 24 use the detail ''They put him in custody'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter shows justice proceeding by God''s revealed judgment."]'::jsonb, 'The chapter shows justice proceeding by God''s revealed judgment.', 'The chapter shows justice proceeding by God''s revealed judgment. The detail appears in Leviticus 24:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 24 use the detail ''They put him in custody'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 4, 'How does Leviticus 24 use the detail ''Twelve'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter portrays covenant fellowship through regular bread before the LORD.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter portrays covenant fellowship through regular bread before the LORD.', 'The chapter portrays covenant fellowship through regular bread before the LORD. The detail appears in Leviticus 24:5-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 24 use the detail ''Twelve'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 5, 'What larger theological point in Leviticus 24 is reinforced by the detail ''All the congregation was to stone him''?', '["That worship can be detached from covenant obedience", "Profaning the divine Name brought severe covenant judgment.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Profaning the divine Name brought severe covenant judgment.', 'Profaning the divine Name brought severe covenant judgment. In context, the chapter uses this detail as part of that wider point (Leviticus 24:14, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 24 is reinforced by the detail ''All the congregation was to stone him''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 5, 'What larger theological point in Leviticus 24 is reinforced by the detail ''Breach for breach, eye for eye, tooth for tooth''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Justice must be measured and proportionate, not arbitrary.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Justice must be measured and proportionate, not arbitrary.', 'Justice must be measured and proportionate, not arbitrary. In context, the chapter uses this detail as part of that wider point (Leviticus 24:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 24 is reinforced by the detail ''Breach for breach, eye for eye, tooth for tooth''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 5, 'What larger theological point in Leviticus 24 is reinforced by the detail ''Pure olive oil beaten for the light''?', '["That worship can be detached from covenant obedience", "The sanctuary required continual provision for ordered worship.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The sanctuary required continual provision for ordered worship.', 'The sanctuary required continual provision for ordered worship. In context, the chapter uses this detail as part of that wider point (Leviticus 24:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 24 is reinforced by the detail ''Pure olive oil beaten for the light''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 5, 'What larger theological point in Leviticus 24 is reinforced by the detail ''Shelomith, daughter of Dibri, of the tribe of Dan''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "The case unfolds publicly within the covenant community."]'::jsonb, 'The case unfolds publicly within the covenant community.', 'The case unfolds publicly within the covenant community. In context, the chapter uses this detail as part of that wider point (Leviticus 24:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 24 is reinforced by the detail ''Shelomith, daughter of Dibri, of the tribe of Dan''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 5, 'What larger theological point in Leviticus 24 is reinforced by the detail ''The stranger and the native were under one law''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Holiness and justice are not ethnically selective within the covenant community."]'::jsonb, 'Holiness and justice are not ethnically selective within the covenant community.', 'Holiness and justice are not ethnically selective within the covenant community. In context, the chapter uses this detail as part of that wider point (Leviticus 24:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 24 is reinforced by the detail ''The stranger and the native were under one law''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 5, 'What larger theological point in Leviticus 24 is reinforced by the detail ''They put him in custody''?', '["Serious cases required waiting for divine instruction.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Serious cases required waiting for divine instruction.', 'Serious cases required waiting for divine instruction. In context, the chapter uses this detail as part of that wider point (Leviticus 24:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 24 is reinforced by the detail ''They put him in custody''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 24, 5, 'What larger theological point in Leviticus 24 is reinforced by the detail ''Twelve''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The tribes are represented continually before God.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The tribes are represented continually before God.', 'The tribes are represented continually before God. In context, the chapter uses this detail as part of that wider point (Leviticus 24:5-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 24 is reinforced by the detail ''Twelve''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 1, 'How many sabbatical cycles were counted before the jubilee?', '["Three sabbaths of years", "Ten sabbaths of years", "Seven sabbaths of years", "Twelve sabbaths of years"]'::jsonb, 'Seven sabbaths of years', 'Seven cycles of seven years, or forty-nine years, preceded the jubilee. (Leviticus 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many sabbatical cycles were counted before the jubilee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 1, 'How was a poor Israelite brother to be treated if he became impoverished?', '["As permanent property", "As an enemy of the camp", "As a hired servant, not as a bondservant", "As one cut off from the assembly"]'::jsonb, 'As a hired servant, not as a bondservant', 'A poor Israelite could serve, but not as a slave permanently. (Leviticus 25:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'How was a poor Israelite brother to be treated if he became impoverished?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 1, 'What happened to hereditary land in the jubilee?', '["Each person returned to his possession", "All land became priestly land", "Land sales were made permanent", "Only city houses reverted"]'::jsonb, 'Each person returned to his possession', 'Ancestral holdings reverted in the jubilee year. (Leviticus 25:10, 13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to hereditary land in the jubilee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 1, 'What reason is given for not ruling ruthlessly over a poor brother?', '["Because the elders may revoke your land", "Because foreign merchants watch the camp", "Because the priest needs household workers", "Because the Israelites are the LORD''s servants whom he brought out of Egypt"]'::jsonb, 'Because the Israelites are the LORD''s servants whom he brought out of Egypt', 'Israel belongs to God because he redeemed them from Egypt. (Leviticus 25:42-43, 55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What reason is given for not ruling ruthlessly over a poor brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 1, 'What was the land to observe every seventh year?', '["A double harvest year", "A sabbath of solemn rest for the land", "A year of military review", "A year of temple rebuilding"]'::jsonb, 'A sabbath of solemn rest for the land', 'The land itself was to rest every seventh year. (Leviticus 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the land to observe every seventh year?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 1, 'When was the trumpet of the jubilee to sound?', '["At Passover in the forty-ninth year", "On the Feast of Booths every seventh year", "At Pentecost in the first year", "On the Day of Atonement in the fiftieth year"]'::jsonb, 'On the Day of Atonement in the fiftieth year', 'The jubilee was proclaimed with the ram''s horn on the Day of Atonement. (Leviticus 25:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'When was the trumpet of the jubilee to sound?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 1, 'Why was land not to be sold in perpetuity?', '["Because every tribe owns the whole land equally", "Because the land is mine, says the LORD; you are strangers and sojourners with me", "Because no one may ever transfer a field", "Because only priests may buy land"]'::jsonb, 'Because the land is mine, says the LORD; you are strangers and sojourners with me', 'God''s ownership is the reason land sales are temporary. (Leviticus 25:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why was land not to be sold in perpetuity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 2, 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:10, 13)', '["Each person returned to his possession", "All land became priestly land", "Land sales were made permanent", "Only city houses reverted"]'::jsonb, 'Each person returned to his possession', 'Ancestral holdings reverted in the jubilee year. That detail is part of the sabbatical year and jubilee instructions in Leviticus 25:10, 13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:10, 13)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 2, 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:23)', '["Because every tribe owns the whole land equally", "Because the land is mine, says the LORD; you are strangers and sojourners with me", "Because no one may ever transfer a field", "Because only priests may buy land"]'::jsonb, 'Because the land is mine, says the LORD; you are strangers and sojourners with me', 'God''s ownership is the reason land sales are temporary. That detail is part of the sabbatical year and jubilee instructions in Leviticus 25:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:23)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 2, 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:39-40)', '["As permanent property", "As an enemy of the camp", "As a hired servant, not as a bondservant", "As one cut off from the assembly"]'::jsonb, 'As a hired servant, not as a bondservant', 'A poor Israelite could serve, but not as a slave permanently. That detail is part of the sabbatical year and jubilee instructions in Leviticus 25:39-40.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:39-40)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 2, 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:4)', '["A double harvest year", "A sabbath of solemn rest for the land", "A year of military review", "A year of temple rebuilding"]'::jsonb, 'A sabbath of solemn rest for the land', 'The land itself was to rest every seventh year. That detail is part of the sabbatical year and jubilee instructions in Leviticus 25:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 2, 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:42-43, 55)', '["Because the elders may revoke your land", "Because foreign merchants watch the camp", "Because the priest needs household workers", "Because the Israelites are the LORD''s servants whom he brought out of Egypt"]'::jsonb, 'Because the Israelites are the LORD''s servants whom he brought out of Egypt', 'Israel belongs to God because he redeemed them from Egypt. That detail is part of the sabbatical year and jubilee instructions in Leviticus 25:42-43, 55.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:42-43, 55)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 2, 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:8)', '["Three sabbaths of years", "Ten sabbaths of years", "Seven sabbaths of years", "Twelve sabbaths of years"]'::jsonb, 'Seven sabbaths of years', 'Seven cycles of seven years, or forty-nine years, preceded the jubilee. That detail is part of the sabbatical year and jubilee instructions in Leviticus 25:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:8)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 2, 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:9-10)', '["At Passover in the forty-ninth year", "On the Feast of Booths every seventh year", "At Pentecost in the first year", "On the Day of Atonement in the fiftieth year"]'::jsonb, 'On the Day of Atonement in the fiftieth year', 'The jubilee was proclaimed with the ram''s horn on the Day of Atonement. That detail is part of the sabbatical year and jubilee instructions in Leviticus 25:9-10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 25, which detail fits the sabbatical year and jubilee instructions? (Leviticus 25:9-10)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 3, 'In Leviticus 25, what does this detail chiefly emphasize: a sabbath of solemn rest for the land?', '["The chapter extends Sabbath principles from people to the land.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'The chapter extends Sabbath principles from people to the land.', 'The chapter extends Sabbath principles from people to the land. The land itself was to rest every seventh year. (Leviticus 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 25, what does this detail chiefly emphasize: a sabbath of solemn rest for the land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 3, 'In Leviticus 25, what does this detail chiefly emphasize: as a hired servant, not as a bondservant?', '["That ritual details were optional once the offering began", "Redemption from Egypt shaped Israel''s treatment of fellow Israelites.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Redemption from Egypt shaped Israel''s treatment of fellow Israelites.', 'Redemption from Egypt shaped Israel''s treatment of fellow Israelites. A poor Israelite could serve, but not as a slave permanently. (Leviticus 25:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 25, what does this detail chiefly emphasize: as a hired servant, not as a bondservant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 3, 'In Leviticus 25, what does this detail chiefly emphasize: because the israelites are the lord''s servants whom he brought out of egypt?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Redemption defines how Israel must handle labor and debt.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Redemption defines how Israel must handle labor and debt.', 'Redemption defines how Israel must handle labor and debt. Israel belongs to God because he redeemed them from Egypt. (Leviticus 25:42-43, 55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 25, what does this detail chiefly emphasize: because the israelites are the lord''s servants whom he brought out of egypt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 3, 'In Leviticus 25, what does this detail chiefly emphasize: because the land is mine, says the lord; you are strangers and sojourners with me?', '["Human possession is always subordinate to divine ownership.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Human possession is always subordinate to divine ownership.', 'Human possession is always subordinate to divine ownership. God''s ownership is the reason land sales are temporary. (Leviticus 25:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 25, what does this detail chiefly emphasize: because the land is mine, says the lord; you are strangers and sojourners with me?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 3, 'In Leviticus 25, what does this detail chiefly emphasize: each person returned to his possession?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The chapter prevents permanent alienation of family inheritance."]'::jsonb, 'The chapter prevents permanent alienation of family inheritance.', 'The chapter prevents permanent alienation of family inheritance. Ancestral holdings reverted in the jubilee year. (Leviticus 25:10, 13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 25, what does this detail chiefly emphasize: each person returned to his possession?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 3, 'In Leviticus 25, what does this detail chiefly emphasize: on the day of atonement in the fiftieth year?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Release and restoration are announced in a context of atonement.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Release and restoration are announced in a context of atonement.', 'Release and restoration are announced in a context of atonement. The jubilee was proclaimed with the ram''s horn on the Day of Atonement. (Leviticus 25:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 25, what does this detail chiefly emphasize: on the day of atonement in the fiftieth year?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 3, 'In Leviticus 25, what does this detail chiefly emphasize: seven sabbaths of years?', '["That ritual details were optional once the offering began", "Sacred time builds toward a larger release and restoration.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Sacred time builds toward a larger release and restoration.', 'Sacred time builds toward a larger release and restoration. Seven cycles of seven years, or forty-nine years, preceded the jubilee. (Leviticus 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 25, what does this detail chiefly emphasize: seven sabbaths of years?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 4, 'How does Leviticus 25 use the detail ''A sabbath of solemn rest for the land'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter treats the land as belonging to God and ordered by his rhythm.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter treats the land as belonging to God and ordered by his rhythm.', 'The chapter treats the land as belonging to God and ordered by his rhythm. The detail appears in Leviticus 25:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 25 use the detail ''A sabbath of solemn rest for the land'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 4, 'How does Leviticus 25 use the detail ''As a hired servant, not as a bondservant'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter uses exodus memory to limit economic domination."]'::jsonb, 'The chapter uses exodus memory to limit economic domination.', 'The chapter uses exodus memory to limit economic domination. The detail appears in Leviticus 25:39-40.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 25 use the detail ''As a hired servant, not as a bondservant'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 4, 'How does Leviticus 25 use the detail ''Because the Israelites are the LORD''s servants whom he brought out of Egypt'' within the chapter as a whole?', '["The chapter makes social mercy a consequence of divine ownership and redemption.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter makes social mercy a consequence of divine ownership and redemption.', 'The chapter makes social mercy a consequence of divine ownership and redemption. The detail appears in Leviticus 25:42-43, 55.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 25 use the detail ''Because the Israelites are the LORD''s servants whom he brought out of Egypt'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 4, 'How does Leviticus 25 use the detail ''Because the land is mine, says the LORD; you are strangers and sojourners with me'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter grounds economic law in theology of land belonging to God.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter grounds economic law in theology of land belonging to God.', 'The chapter grounds economic law in theology of land belonging to God. The detail appears in Leviticus 25:23.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 25 use the detail ''Because the land is mine, says the LORD; you are strangers and sojourners with me'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 4, 'How does Leviticus 25 use the detail ''Each person returned to his possession'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter curbs economic accumulation by recalling that the land is God''s.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter curbs economic accumulation by recalling that the land is God''s.', 'The chapter curbs economic accumulation by recalling that the land is God''s. The detail appears in Leviticus 25:10, 13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 25 use the detail ''Each person returned to his possession'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 4, 'How does Leviticus 25 use the detail ''On the Day of Atonement in the fiftieth year'' within the chapter as a whole?', '["The chapter links social reset with sacred reconciliation.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter links social reset with sacred reconciliation.', 'The chapter links social reset with sacred reconciliation. The detail appears in Leviticus 25:9-10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 25 use the detail ''On the Day of Atonement in the fiftieth year'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 4, 'How does Leviticus 25 use the detail ''Seven sabbaths of years'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter scales Sabbath up into national economic reset."]'::jsonb, 'The chapter scales Sabbath up into national economic reset.', 'The chapter scales Sabbath up into national economic reset. The detail appears in Leviticus 25:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 25 use the detail ''Seven sabbaths of years'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 5, 'What larger theological point in Leviticus 25 is reinforced by the detail ''A sabbath of solemn rest for the land''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "The chapter extends Sabbath principles from people to the land.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter extends Sabbath principles from people to the land.', 'The chapter extends Sabbath principles from people to the land. In context, the chapter uses this detail as part of that wider point (Leviticus 25:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 25 is reinforced by the detail ''A sabbath of solemn rest for the land''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 5, 'What larger theological point in Leviticus 25 is reinforced by the detail ''As a hired servant, not as a bondservant''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Redemption from Egypt shaped Israel''s treatment of fellow Israelites."]'::jsonb, 'Redemption from Egypt shaped Israel''s treatment of fellow Israelites.', 'Redemption from Egypt shaped Israel''s treatment of fellow Israelites. In context, the chapter uses this detail as part of that wider point (Leviticus 25:39-40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 25 is reinforced by the detail ''As a hired servant, not as a bondservant''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 5, 'What larger theological point in Leviticus 25 is reinforced by the detail ''Because the Israelites are the LORD''s servants whom he brought out of Egypt''?', '["Redemption defines how Israel must handle labor and debt.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Redemption defines how Israel must handle labor and debt.', 'Redemption defines how Israel must handle labor and debt. In context, the chapter uses this detail as part of that wider point (Leviticus 25:42-43, 55).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 25 is reinforced by the detail ''Because the Israelites are the LORD''s servants whom he brought out of Egypt''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 5, 'What larger theological point in Leviticus 25 is reinforced by the detail ''Because the land is mine, says the LORD; you are strangers and sojourners with me''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Human possession is always subordinate to divine ownership.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Human possession is always subordinate to divine ownership.', 'Human possession is always subordinate to divine ownership. In context, the chapter uses this detail as part of that wider point (Leviticus 25:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 25 is reinforced by the detail ''Because the land is mine, says the LORD; you are strangers and sojourners with me''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 5, 'What larger theological point in Leviticus 25 is reinforced by the detail ''Each person returned to his possession''?', '["That worship can be detached from covenant obedience", "The chapter prevents permanent alienation of family inheritance.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The chapter prevents permanent alienation of family inheritance.', 'The chapter prevents permanent alienation of family inheritance. In context, the chapter uses this detail as part of that wider point (Leviticus 25:10, 13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 25 is reinforced by the detail ''Each person returned to his possession''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 5, 'What larger theological point in Leviticus 25 is reinforced by the detail ''On the Day of Atonement in the fiftieth year''?', '["Release and restoration are announced in a context of atonement.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Release and restoration are announced in a context of atonement.', 'Release and restoration are announced in a context of atonement. In context, the chapter uses this detail as part of that wider point (Leviticus 25:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 25 is reinforced by the detail ''On the Day of Atonement in the fiftieth year''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 25, 5, 'What larger theological point in Leviticus 25 is reinforced by the detail ''Seven sabbaths of years''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Sacred time builds toward a larger release and restoration."]'::jsonb, 'Sacred time builds toward a larger release and restoration.', 'Sacred time builds toward a larger release and restoration. In context, the chapter uses this detail as part of that wider point (Leviticus 25:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 25 is reinforced by the detail ''Seven sabbaths of years''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 1, 'What blessing is promised if Israel walks in God''s statutes?', '["Rain in due season and fruitful land", "A king from every tribe", "An end of all sickness forever", "Riches from the sea without labor"]'::jsonb, 'Rain in due season and fruitful land', 'Obedience would bring timely rain, fruitful trees, and abundant crops. (Leviticus 26:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What blessing is promised if Israel walks in God''s statutes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 1, 'What escalating phrase repeats if Israel will not listen?', '["I will remember Egypt against you", "I will chastise you seven times more for your sins", "I will shorten your days by half", "I will remove the priesthood from Aaron"]'::jsonb, 'I will chastise you seven times more for your sins', 'The curses intensify in repeated stages if Israel remains disobedient. (Leviticus 26:18, 21, 24, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What escalating phrase repeats if Israel will not listen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 1, 'What hope is given if the exiled people confess their iniquity?', '["The LORD will remember his covenant with Jacob, Isaac, and Abraham", "They will return without repentance", "The nations will build them a new sanctuary", "Aaron''s sons will bear their punishment"]'::jsonb, 'The LORD will remember his covenant with Jacob, Isaac, and Abraham', 'Confession opens the promise of covenant remembrance. (Leviticus 26:40-42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What hope is given if the exiled people confess their iniquity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 1, 'What opening prohibition begins Leviticus 26?', '["Do not plant vineyards", "Do not eat unleavened bread in winter", "Do not make idols", "Do not appoint tribal judges"]'::jsonb, 'Do not make idols', 'The chapter begins by forbidding idols, graven images, and figured stones. (Leviticus 26:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What opening prohibition begins Leviticus 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 1, 'What two acts of obedience are singled out at the start of the blessing section?', '["Count your herds and number your cities", "Offer incense daily and fast monthly", "Love the stranger and release all debts yearly", "Keep my sabbaths and reverence my sanctuary"]'::jsonb, 'Keep my sabbaths and reverence my sanctuary', 'Sabbath keeping and reverence for the sanctuary introduce the covenant promises. (Leviticus 26:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What two acts of obedience are singled out at the start of the blessing section?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 1, 'What would happen to Israel''s cities and sanctuaries under the curses?', '["They would all become cities of refuge", "They would be transferred to Levi", "They would be laid waste and made desolate", "They would be hidden from enemies by a cloud"]'::jsonb, 'They would be laid waste and made desolate', 'God warns of desolated cities and devastated sanctuaries. (Leviticus 26:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What would happen to Israel''s cities and sanctuaries under the curses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 1, 'When would the land enjoy its sabbaths?', '["Only during the reign of a righteous king", "Whenever priests blew the trumpets", "At every Feast of Booths", "While Israel lay desolate in their enemies'' land"]'::jsonb, 'While Israel lay desolate in their enemies'' land', 'The land would finally rest during Israel''s exile. (Leviticus 26:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'When would the land enjoy its sabbaths?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 2, 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:1)', '["Do not plant vineyards", "Do not eat unleavened bread in winter", "Do not make idols", "Do not appoint tribal judges"]'::jsonb, 'Do not make idols', 'The chapter begins by forbidding idols, graven images, and figured stones. That detail is part of the blessings and curses instructions in Leviticus 26:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:1)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 2, 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:18, 21, 24, 28)', '["I will remember Egypt against you", "I will chastise you seven times more for your sins", "I will shorten your days by half", "I will remove the priesthood from Aaron"]'::jsonb, 'I will chastise you seven times more for your sins', 'The curses intensify in repeated stages if Israel remains disobedient. That detail is part of the blessings and curses instructions in Leviticus 26:18, 21, 24, 28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:18, 21, 24, 28)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 2, 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:2)', '["Count your herds and number your cities", "Offer incense daily and fast monthly", "Love the stranger and release all debts yearly", "Keep my sabbaths and reverence my sanctuary"]'::jsonb, 'Keep my sabbaths and reverence my sanctuary', 'Sabbath keeping and reverence for the sanctuary introduce the covenant promises. That detail is part of the blessings and curses instructions in Leviticus 26:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 2, 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:3-4)', '["Rain in due season and fruitful land", "A king from every tribe", "An end of all sickness forever", "Riches from the sea without labor"]'::jsonb, 'Rain in due season and fruitful land', 'Obedience would bring timely rain, fruitful trees, and abundant crops. That detail is part of the blessings and curses instructions in Leviticus 26:3-4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:3-4)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 2, 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:31)', '["They would all become cities of refuge", "They would be transferred to Levi", "They would be laid waste and made desolate", "They would be hidden from enemies by a cloud"]'::jsonb, 'They would be laid waste and made desolate', 'God warns of desolated cities and devastated sanctuaries. That detail is part of the blessings and curses instructions in Leviticus 26:31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:31)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 2, 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:34-35)', '["Only during the reign of a righteous king", "Whenever priests blew the trumpets", "At every Feast of Booths", "While Israel lay desolate in their enemies'' land"]'::jsonb, 'While Israel lay desolate in their enemies'' land', 'The land would finally rest during Israel''s exile. That detail is part of the blessings and curses instructions in Leviticus 26:34-35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:34-35)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 2, 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:40-42)', '["The LORD will remember his covenant with Jacob, Isaac, and Abraham", "They will return without repentance", "The nations will build them a new sanctuary", "Aaron''s sons will bear their punishment"]'::jsonb, 'The LORD will remember his covenant with Jacob, Isaac, and Abraham', 'Confession opens the promise of covenant remembrance. That detail is part of the blessings and curses instructions in Leviticus 26:40-42.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 26, which detail fits the blessings and curses instructions? (Leviticus 26:40-42)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 3, 'In Leviticus 26, what does this detail chiefly emphasize: do not make idols?', '["That ritual details were optional once the offering began", "Covenant blessing begins with exclusive loyalty to the LORD.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Covenant blessing begins with exclusive loyalty to the LORD.', 'Covenant blessing begins with exclusive loyalty to the LORD. The chapter begins by forbidding idols, graven images, and figured stones. (Leviticus 26:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 26, what does this detail chiefly emphasize: do not make idols?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 3, 'In Leviticus 26, what does this detail chiefly emphasize: i will chastise you seven times more for your sins?', '["Persistent rebellion brings escalating covenant discipline.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Persistent rebellion brings escalating covenant discipline.', 'Persistent rebellion brings escalating covenant discipline. The curses intensify in repeated stages if Israel remains disobedient. (Leviticus 26:18, 21, 24, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 26, what does this detail chiefly emphasize: i will chastise you seven times more for your sins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 3, 'In Leviticus 26, what does this detail chiefly emphasize: keep my sabbaths and reverence my sanctuary?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Holy time and holy place summarize covenant fidelity.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Holy time and holy place summarize covenant fidelity.', 'Holy time and holy place summarize covenant fidelity. Sabbath keeping and reverence for the sanctuary introduce the covenant promises. (Leviticus 26:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 26, what does this detail chiefly emphasize: keep my sabbaths and reverence my sanctuary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 3, 'In Leviticus 26, what does this detail chiefly emphasize: rain in due season and fruitful land?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "The land responds to covenant faithfulness under God''s favor."]'::jsonb, 'The land responds to covenant faithfulness under God''s favor.', 'The land responds to covenant faithfulness under God''s favor. Obedience would bring timely rain, fruitful trees, and abundant crops. (Leviticus 26:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 26, what does this detail chiefly emphasize: rain in due season and fruitful land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 3, 'In Leviticus 26, what does this detail chiefly emphasize: the lord will remember his covenant with jacob, isaac, and abraham?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Judgment is severe, but covenant mercy is not forgotten."]'::jsonb, 'Judgment is severe, but covenant mercy is not forgotten.', 'Judgment is severe, but covenant mercy is not forgotten. Confession opens the promise of covenant remembrance. (Leviticus 26:40-42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 26, what does this detail chiefly emphasize: the lord will remember his covenant with jacob, isaac, and abraham?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 3, 'In Leviticus 26, what does this detail chiefly emphasize: they would be laid waste and made desolate?', '["That ritual details were optional once the offering began", "Covenant infidelity threatens both society and worship.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Covenant infidelity threatens both society and worship.', 'Covenant infidelity threatens both society and worship. God warns of desolated cities and devastated sanctuaries. (Leviticus 26:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 26, what does this detail chiefly emphasize: they would be laid waste and made desolate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 3, 'In Leviticus 26, what does this detail chiefly emphasize: while israel lay desolate in their enemies'' land?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Ignored Sabbath obligations return as judgment through exile.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Ignored Sabbath obligations return as judgment through exile.', 'Ignored Sabbath obligations return as judgment through exile. The land would finally rest during Israel''s exile. (Leviticus 26:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 26, what does this detail chiefly emphasize: while israel lay desolate in their enemies'' land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 4, 'How does Leviticus 26 use the detail ''Do not make idols'' within the chapter as a whole?', '["The chapter frames blessings and curses around allegiance in worship.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter frames blessings and curses around allegiance in worship.', 'The chapter frames blessings and curses around allegiance in worship. The detail appears in Leviticus 26:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 26 use the detail ''Do not make idols'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 4, 'How does Leviticus 26 use the detail ''I will chastise you seven times more for your sins'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter portrays judgment as measured, progressive, and responsive to stubbornness."]'::jsonb, 'The chapter portrays judgment as measured, progressive, and responsive to stubbornness.', 'The chapter portrays judgment as measured, progressive, and responsive to stubbornness. The detail appears in Leviticus 26:18, 21, 24, 28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 26 use the detail ''I will chastise you seven times more for your sins'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 4, 'How does Leviticus 26 use the detail ''Keep my sabbaths and reverence my sanctuary'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter condenses obedience into reverence for God''s presence and order.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter condenses obedience into reverence for God''s presence and order.', 'The chapter condenses obedience into reverence for God''s presence and order. The detail appears in Leviticus 26:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 26 use the detail ''Keep my sabbaths and reverence my sanctuary'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 4, 'How does Leviticus 26 use the detail ''Rain in due season and fruitful land'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter presents blessing as creation flourishing under obedience.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter presents blessing as creation flourishing under obedience.', 'The chapter presents blessing as creation flourishing under obedience. The detail appears in Leviticus 26:3-4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 26 use the detail ''Rain in due season and fruitful land'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 4, 'How does Leviticus 26 use the detail ''The LORD will remember his covenant with Jacob, Isaac, and Abraham'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter ends discipline with the possibility of remembered covenant grace.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ends discipline with the possibility of remembered covenant grace.', 'The chapter ends discipline with the possibility of remembered covenant grace. The detail appears in Leviticus 26:40-42.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 26 use the detail ''The LORD will remember his covenant with Jacob, Isaac, and Abraham'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 4, 'How does Leviticus 26 use the detail ''They would be laid waste and made desolate'' within the chapter as a whole?', '["The chapter shows judgment reaching every sphere of national life.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter shows judgment reaching every sphere of national life.', 'The chapter shows judgment reaching every sphere of national life. The detail appears in Leviticus 26:31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 26 use the detail ''They would be laid waste and made desolate'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 4, 'How does Leviticus 26 use the detail ''While Israel lay desolate in their enemies'' land'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter turns neglected sacred rhythms into one reason for exile.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter turns neglected sacred rhythms into one reason for exile.', 'The chapter turns neglected sacred rhythms into one reason for exile. The detail appears in Leviticus 26:34-35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 26 use the detail ''While Israel lay desolate in their enemies'' land'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 5, 'What larger theological point in Leviticus 26 is reinforced by the detail ''Do not make idols''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Covenant blessing begins with exclusive loyalty to the LORD."]'::jsonb, 'Covenant blessing begins with exclusive loyalty to the LORD.', 'Covenant blessing begins with exclusive loyalty to the LORD. In context, the chapter uses this detail as part of that wider point (Leviticus 26:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 26 is reinforced by the detail ''Do not make idols''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 5, 'What larger theological point in Leviticus 26 is reinforced by the detail ''I will chastise you seven times more for your sins''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Persistent rebellion brings escalating covenant discipline.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Persistent rebellion brings escalating covenant discipline.', 'Persistent rebellion brings escalating covenant discipline. In context, the chapter uses this detail as part of that wider point (Leviticus 26:18, 21, 24, 28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 26 is reinforced by the detail ''I will chastise you seven times more for your sins''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 5, 'What larger theological point in Leviticus 26 is reinforced by the detail ''Keep my sabbaths and reverence my sanctuary''?', '["Holy time and holy place summarize covenant fidelity.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Holy time and holy place summarize covenant fidelity.', 'Holy time and holy place summarize covenant fidelity. In context, the chapter uses this detail as part of that wider point (Leviticus 26:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 26 is reinforced by the detail ''Keep my sabbaths and reverence my sanctuary''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 5, 'What larger theological point in Leviticus 26 is reinforced by the detail ''Rain in due season and fruitful land''?', '["That worship can be detached from covenant obedience", "The land responds to covenant faithfulness under God''s favor.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'The land responds to covenant faithfulness under God''s favor.', 'The land responds to covenant faithfulness under God''s favor. In context, the chapter uses this detail as part of that wider point (Leviticus 26:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 26 is reinforced by the detail ''Rain in due season and fruitful land''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 5, 'What larger theological point in Leviticus 26 is reinforced by the detail ''The LORD will remember his covenant with Jacob, Isaac, and Abraham''?', '["That worship can be detached from covenant obedience", "Judgment is severe, but covenant mercy is not forgotten.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Judgment is severe, but covenant mercy is not forgotten.', 'Judgment is severe, but covenant mercy is not forgotten. In context, the chapter uses this detail as part of that wider point (Leviticus 26:40-42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 26 is reinforced by the detail ''The LORD will remember his covenant with Jacob, Isaac, and Abraham''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 5, 'What larger theological point in Leviticus 26 is reinforced by the detail ''They would be laid waste and made desolate''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "Covenant infidelity threatens both society and worship."]'::jsonb, 'Covenant infidelity threatens both society and worship.', 'Covenant infidelity threatens both society and worship. In context, the chapter uses this detail as part of that wider point (Leviticus 26:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 26 is reinforced by the detail ''They would be laid waste and made desolate''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 26, 5, 'What larger theological point in Leviticus 26 is reinforced by the detail ''While Israel lay desolate in their enemies'' land''?', '["Ignored Sabbath obligations return as judgment through exile.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Ignored Sabbath obligations return as judgment through exile.', 'Ignored Sabbath obligations return as judgment through exile. In context, the chapter uses this detail as part of that wider point (Leviticus 26:34-35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 26 is reinforced by the detail ''While Israel lay desolate in their enemies'' land''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 1, 'Could the firstborn of animals be sanctified as a special vow gift?', '["Yes, but only in the jubilee year", "Yes, if it is a female", "No, because the firstborn already belongs to the LORD", "No, unless the priest permits it privately"]'::jsonb, 'No, because the firstborn already belongs to the LORD', 'The firstborn could not be specially vowed because it was already the LORD''s. (Leviticus 27:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Could the firstborn of animals be sanctified as a special vow gift?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 1, 'How could a vowed person be handled according to the chapter?', '["By valuation according to the sanctuary shekel", "By tribal vote only", "By immediate lifelong service without exception", "By a peace offering of bread alone"]'::jsonb, 'By valuation according to the sanctuary shekel', 'Persons vowed to the LORD were assigned a valuation in silver. (Leviticus 27:2-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'How could a vowed person be handled according to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 1, 'How does Leviticus close?', '["And the glory of the LORD filled the tabernacle", "These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai", "So Joshua divided the land by lot", "And Aaron blessed the tribes and died"]'::jsonb, 'These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai', 'The book closes by summarizing these laws as commandments given through Moses at Sinai. (Leviticus 27:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Leviticus close?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 1, 'What could not be sold or redeemed once devoted with a devoted thing?', '["Any peace offering breast", "Any field inside a walled city", "Any firstfruits basket", "Anything devoted to destruction as most holy to the LORD"]'::jsonb, 'Anything devoted to destruction as most holy to the LORD', 'A devoted thing was most holy and could not be redeemed or sold. (Leviticus 27:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What could not be sold or redeemed once devoted with a devoted thing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 1, 'What does Leviticus 27 chiefly regulate?', '["Priestly garments for each feast", "The cities of refuge", "Rules for warfare in Canaan", "Vows and things devoted to the LORD"]'::jsonb, 'Vows and things devoted to the LORD', 'The chapter gives valuations and rules for vowed persons, animals, houses, and fields. (Leviticus 27:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Leviticus 27 chiefly regulate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 1, 'What happened if someone wanted to redeem a vowed animal or item?', '["He could redeem it without payment if poor", "He had to add a fifth to its valuation", "He had to offer two lambs instead", "He had to wait until jubilee only"]'::jsonb, 'He had to add a fifth to its valuation', 'Redemption of devoted items commonly required adding one-fifth. (Leviticus 27:13, 15, 19, 27, 31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened if someone wanted to redeem a vowed animal or item?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 1, 'What portion of the produce of the land is declared the LORD''s?', '["The tithe", "The corners of every field", "Every third harvest only", "One lamb out of twelve"]'::jsonb, 'The tithe', 'The tithe of seed and fruit is holy to the LORD. (Leviticus 27:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What portion of the produce of the land is declared the LORD''s?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 2, 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:1-2)', '["Priestly garments for each feast", "The cities of refuge", "Rules for warfare in Canaan", "Vows and things devoted to the LORD"]'::jsonb, 'Vows and things devoted to the LORD', 'The chapter gives valuations and rules for vowed persons, animals, houses, and fields. That detail is part of the vows and dedicated things instructions in Leviticus 27:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:1-2)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 2, 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:13, 15, 19, 27, 31)', '["He could redeem it without payment if poor", "He had to add a fifth to its valuation", "He had to offer two lambs instead", "He had to wait until jubilee only"]'::jsonb, 'He had to add a fifth to its valuation', 'Redemption of devoted items commonly required adding one-fifth. That detail is part of the vows and dedicated things instructions in Leviticus 27:13, 15, 19, 27, 31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:13, 15, 19, 27, 31)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 2, 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:2-8)', '["By valuation according to the sanctuary shekel", "By tribal vote only", "By immediate lifelong service without exception", "By a peace offering of bread alone"]'::jsonb, 'By valuation according to the sanctuary shekel', 'Persons vowed to the LORD were assigned a valuation in silver. That detail is part of the vows and dedicated things instructions in Leviticus 27:2-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:2-8)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 2, 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:26)', '["Yes, but only in the jubilee year", "Yes, if it is a female", "No, because the firstborn already belongs to the LORD", "No, unless the priest permits it privately"]'::jsonb, 'No, because the firstborn already belongs to the LORD', 'The firstborn could not be specially vowed because it was already the LORD''s. That detail is part of the vows and dedicated things instructions in Leviticus 27:26.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:26)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 2, 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:28)', '["Any peace offering breast", "Any field inside a walled city", "Any firstfruits basket", "Anything devoted to destruction as most holy to the LORD"]'::jsonb, 'Anything devoted to destruction as most holy to the LORD', 'A devoted thing was most holy and could not be redeemed or sold. That detail is part of the vows and dedicated things instructions in Leviticus 27:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:28)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 2, 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:30)', '["The tithe", "The corners of every field", "Every third harvest only", "One lamb out of twelve"]'::jsonb, 'The tithe', 'The tithe of seed and fruit is holy to the LORD. That detail is part of the vows and dedicated things instructions in Leviticus 27:30.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:30)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 2, 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:34)', '["And the glory of the LORD filled the tabernacle", "These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai", "So Joshua divided the land by lot", "And Aaron blessed the tribes and died"]'::jsonb, 'These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai', 'The book closes by summarizing these laws as commandments given through Moses at Sinai. That detail is part of the vows and dedicated things instructions in Leviticus 27:34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Leviticus 27, which detail fits the vows and dedicated things instructions? (Leviticus 27:34)'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 3, 'In Leviticus 27, what does this detail chiefly emphasize: anything devoted to destruction as most holy to the lord?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Some consecrations are irreversible under God''s claim.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Some consecrations are irreversible under God''s claim.', 'Some consecrations are irreversible under God''s claim. A devoted thing was most holy and could not be redeemed or sold. (Leviticus 27:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 27, what does this detail chiefly emphasize: anything devoted to destruction as most holy to the lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 3, 'In Leviticus 27, what does this detail chiefly emphasize: by valuation according to the sanctuary shekel?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Dedication involved measurable obligation under sanctuary authority."]'::jsonb, 'Dedication involved measurable obligation under sanctuary authority.', 'Dedication involved measurable obligation under sanctuary authority. Persons vowed to the LORD were assigned a valuation in silver. (Leviticus 27:2-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 27, what does this detail chiefly emphasize: by valuation according to the sanctuary shekel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 3, 'In Leviticus 27, what does this detail chiefly emphasize: he had to add a fifth to its valuation?', '["Vows were serious and not casually reversed.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Vows were serious and not casually reversed.', 'Vows were serious and not casually reversed. Redemption of devoted items commonly required adding one-fifth. (Leviticus 27:13, 15, 19, 27, 31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 27, what does this detail chiefly emphasize: he had to add a fifth to its valuation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 3, 'In Leviticus 27, what does this detail chiefly emphasize: no, because the firstborn already belongs to the lord?', '["That ritual details were optional once the offering began", "One cannot dedicate to God what already belongs to him by right.", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'One cannot dedicate to God what already belongs to him by right.', 'One cannot dedicate to God what already belongs to him by right. The firstborn could not be specially vowed because it was already the LORD''s. (Leviticus 27:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 27, what does this detail chiefly emphasize: no, because the firstborn already belongs to the lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 3, 'In Leviticus 27, what does this detail chiefly emphasize: the tithe?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation", "Regular increase as well as special vows belongs under divine claim."]'::jsonb, 'Regular increase as well as special vows belongs under divine claim.', 'Regular increase as well as special vows belongs under divine claim. The tithe of seed and fruit is holy to the LORD. (Leviticus 27:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 27, what does this detail chiefly emphasize: the tithe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 3, 'In Leviticus 27, what does this detail chiefly emphasize: these are the commandments which the lord commanded moses for the children of israel in mount sinai?', '["Leviticus ends under the authority of divine revelation.", "That ritual details were optional once the offering began", "That holiness depended mainly on political power", "That the chapter dismisses priestly mediation"]'::jsonb, 'Leviticus ends under the authority of divine revelation.', 'Leviticus ends under the authority of divine revelation. The book closes by summarizing these laws as commandments given through Moses at Sinai. (Leviticus 27:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 27, what does this detail chiefly emphasize: these are the commandments which the lord commanded moses for the children of israel in mount sinai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 3, 'In Leviticus 27, what does this detail chiefly emphasize: vows and things devoted to the lord?', '["That ritual details were optional once the offering began", "That holiness depended mainly on political power", "Voluntary vows still come under careful divine regulation.", "That the chapter dismisses priestly mediation"]'::jsonb, 'Voluntary vows still come under careful divine regulation.', 'Voluntary vows still come under careful divine regulation. The chapter gives valuations and rules for vowed persons, animals, houses, and fields. (Leviticus 27:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Leviticus 27, what does this detail chiefly emphasize: vows and things devoted to the lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 4, 'How does Leviticus 27 use the detail ''Anything devoted to destruction as most holy to the LORD'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter ends with the most absolute form of dedication.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter ends with the most absolute form of dedication.', 'The chapter ends with the most absolute form of dedication. The detail appears in Leviticus 27:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 27 use the detail ''Anything devoted to destruction as most holy to the LORD'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 4, 'How does Leviticus 27 use the detail ''By valuation according to the sanctuary shekel'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter turns voluntary zeal into ordered covenant practice."]'::jsonb, 'The chapter turns voluntary zeal into ordered covenant practice.', 'The chapter turns voluntary zeal into ordered covenant practice. The detail appears in Leviticus 27:2-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 27 use the detail ''By valuation according to the sanctuary shekel'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 4, 'How does Leviticus 27 use the detail ''He had to add a fifth to its valuation'' within the chapter as a whole?', '["The chapter discourages light treatment of what has been dedicated.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter discourages light treatment of what has been dedicated.', 'The chapter discourages light treatment of what has been dedicated. The detail appears in Leviticus 27:13, 15, 19, 27, 31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 27 use the detail ''He had to add a fifth to its valuation'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 4, 'How does Leviticus 27 use the detail ''No, because the firstborn already belongs to the LORD'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "The chapter distinguishes voluntary vows from prior covenant claims.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter distinguishes voluntary vows from prior covenant claims.', 'The chapter distinguishes voluntary vows from prior covenant claims. The detail appears in Leviticus 27:26.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 27 use the detail ''No, because the firstborn already belongs to the LORD'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 4, 'How does Leviticus 27 use the detail ''The tithe'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life.", "The chapter broadens dedication from occasional vows to ongoing increase."]'::jsonb, 'The chapter broadens dedication from occasional vows to ongoing increase.', 'The chapter broadens dedication from occasional vows to ongoing increase. The detail appears in Leviticus 27:30.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 27 use the detail ''The tithe'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 4, 'How does Leviticus 27 use the detail ''These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai'' within the chapter as a whole?', '["The chapter closes the whole book by returning the reader to the LORD''s command through Moses.", "It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter closes the whole book by returning the reader to the LORD''s command through Moses.', 'The chapter closes the whole book by returning the reader to the LORD''s command through Moses. The detail appears in Leviticus 27:34.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 27 use the detail ''These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 4, 'How does Leviticus 27 use the detail ''Vows and things devoted to the LORD'' within the chapter as a whole?', '["It shows the chapter replacing sacrifice with private preference.", "It proves the chapter is mainly about military conquest.", "The chapter closes Leviticus by ordering what is specially dedicated to God.", "It minimizes the need for holiness in worship and community life."]'::jsonb, 'The chapter closes Leviticus by ordering what is specially dedicated to God.', 'The chapter closes Leviticus by ordering what is specially dedicated to God. The detail appears in Leviticus 27:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Leviticus 27 use the detail ''Vows and things devoted to the LORD'' within the chapter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 5, 'What larger theological point in Leviticus 27 is reinforced by the detail ''Anything devoted to destruction as most holy to the LORD''?', '["Some consecrations are irreversible under God''s claim.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Some consecrations are irreversible under God''s claim.', 'Some consecrations are irreversible under God''s claim. In context, the chapter uses this detail as part of that wider point (Leviticus 27:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 27 is reinforced by the detail ''Anything devoted to destruction as most holy to the LORD''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 5, 'What larger theological point in Leviticus 27 is reinforced by the detail ''By valuation according to the sanctuary shekel''?', '["That worship can be detached from covenant obedience", "Dedication involved measurable obligation under sanctuary authority.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Dedication involved measurable obligation under sanctuary authority.', 'Dedication involved measurable obligation under sanctuary authority. In context, the chapter uses this detail as part of that wider point (Leviticus 27:2-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 27 is reinforced by the detail ''By valuation according to the sanctuary shekel''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 5, 'What larger theological point in Leviticus 27 is reinforced by the detail ''He had to add a fifth to its valuation''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Vows were serious and not casually reversed.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Vows were serious and not casually reversed.', 'Vows were serious and not casually reversed. In context, the chapter uses this detail as part of that wider point (Leviticus 27:13, 15, 19, 27, 31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 27 is reinforced by the detail ''He had to add a fifth to its valuation''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 5, 'What larger theological point in Leviticus 27 is reinforced by the detail ''No, because the firstborn already belongs to the LORD''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD", "One cannot dedicate to God what already belongs to him by right."]'::jsonb, 'One cannot dedicate to God what already belongs to him by right.', 'One cannot dedicate to God what already belongs to him by right. In context, the chapter uses this detail as part of that wider point (Leviticus 27:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 27 is reinforced by the detail ''No, because the firstborn already belongs to the LORD''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 5, 'What larger theological point in Leviticus 27 is reinforced by the detail ''The tithe''?', '["That worship can be detached from covenant obedience", "Regular increase as well as special vows belongs under divine claim.", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Regular increase as well as special vows belongs under divine claim.', 'Regular increase as well as special vows belongs under divine claim. In context, the chapter uses this detail as part of that wider point (Leviticus 27:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 27 is reinforced by the detail ''The tithe''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 5, 'What larger theological point in Leviticus 27 is reinforced by the detail ''These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai''?', '["That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "Leviticus ends under the authority of divine revelation.", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Leviticus ends under the authority of divine revelation.', 'Leviticus ends under the authority of divine revelation. In context, the chapter uses this detail as part of that wider point (Leviticus 27:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 27 is reinforced by the detail ''These are the commandments which the LORD commanded Moses for the children of Israel in Mount Sinai''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 3, 27, 5, 'What larger theological point in Leviticus 27 is reinforced by the detail ''Vows and things devoted to the LORD''?', '["Voluntary vows still come under careful divine regulation.", "That worship can be detached from covenant obedience", "That ritual uncleanness has no relation to God''s dwelling among his people", "That Israel''s life is ordered chiefly by surrounding nations rather than the LORD"]'::jsonb, 'Voluntary vows still come under careful divine regulation.', 'Voluntary vows still come under careful divine regulation. In context, the chapter uses this detail as part of that wider point (Leviticus 27:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 3
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological point in Leviticus 27 is reinforced by the detail ''Vows and things devoted to the LORD''?'
);
