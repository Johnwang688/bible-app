-- ============================================================================
-- LOGOS LIGHT - Hebrews (book 58) quiz questions from quiz-questions/hebrews.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 1, 'According to Hebrews 1, by whom has God now spoken in these last days?', '["By his Son","By angels","By Moses","By the apostles"]'::jsonb, 'By his Son', 'Hebrews 1:1-2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 1, by whom has God now spoken in these last days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 1, 'According to Hebrews 1:14, what are angels sent forth to do?', '["Serve for the sake of those who will inherit salvation","Rule the church","Receive worship from believers","Offer final atonement for sin"]'::jsonb, 'Serve for the sake of those who will inherit salvation', 'Hebrews 1:14 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 1:14, what are angels sent forth to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 1, 'According to Hebrews 1:2, through whom did God make the worlds?', '["Through the Son","Through angels","Through Abraham","Through the law"]'::jsonb, 'Through the Son', 'Hebrews 1:2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 1:2, through whom did God make the worlds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 1, 'According to Hebrews 1:2, what did God appoint the Son to be?', '["Heir of all things","Servant of the temple","Judge of angels only","Teacher of the law"]'::jsonb, 'Heir of all things', 'Hebrews 1:2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 1:2, what did God appoint the Son to be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 1, 'Hebrews 1 says the Son became much better than whom?', '["The angels","The prophets","The priests","The kings of Israel"]'::jsonb, 'The angels', 'Hebrews 1:4 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Hebrews 1 says the Son became much better than whom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 1, 'In Hebrews 1:8, what kind of scepter belongs to the Son''s kingdom?', '["A scepter of uprightness","A rod of iron only","A staff of Moses","A sword of judgment alone"]'::jsonb, 'A scepter of uprightness', 'Hebrews 1:8 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Hebrews 1:8, what kind of scepter belongs to the Son''s kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 1, 'What did the Son do before he sat down at the right hand of the Majesty on high?', '["He made purification of sins","He judged the nations","He rebuilt the temple","He gave a new priesthood to angels"]'::jsonb, 'He made purification of sins', 'Hebrews 1:3 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the Son do before he sat down at the right hand of the Majesty on high?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 2, 'In context, what does Hebrews 1:1-2 emphasize?', '["The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son''s exaltation follows a completed saving work dealing with sin."]'::jsonb, 'The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.', 'This is the point made in context at Hebrews 1:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 1:1-2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 2, 'In context, what does Hebrews 1:14 emphasize?', '["Angels are ministering spirits whose role is service, not lordship.","The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant."]'::jsonb, 'Angels are ministering spirits whose role is service, not lordship.', 'This is the point made in context at Hebrews 1:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 1:14 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 2, 'In context, what does Hebrews 1:2 emphasize?', '["The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son''s exaltation follows a completed saving work dealing with sin."]'::jsonb, 'The Son is portrayed as the rightful possessor of all things, not a limited mediator.', 'This is the point made in context at Hebrews 1:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 1:2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 2, 'In context, what does Hebrews 1:2 emphasize?', '["The Son is placed on the creator side of reality, not within creation as a mere servant.","The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son''s exaltation follows a completed saving work dealing with sin."]'::jsonb, 'The Son is placed on the creator side of reality, not within creation as a mere servant.', 'This is the point made in context at Hebrews 1:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 1:2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 2, 'In context, what does Hebrews 1:3 emphasize?', '["The Son''s exaltation follows a completed saving work dealing with sin.","The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant."]'::jsonb, 'The Son''s exaltation follows a completed saving work dealing with sin.', 'This is the point made in context at Hebrews 1:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 1:3 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 2, 'In context, what does Hebrews 1:4 emphasize?', '["The comparison establishes that the Son belongs to a category above heavenly servants.","The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant."]'::jsonb, 'The comparison establishes that the Son belongs to a category above heavenly servants.', 'This is the point made in context at Hebrews 1:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 1:4 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 2, 'In context, what does Hebrews 1:8 emphasize?', '["The Son''s reign is marked by righteous rule, not arbitrary power.","The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant."]'::jsonb, 'The Son''s reign is marked by righteous rule, not arbitrary power.', 'This is the point made in context at Hebrews 1:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 1:8 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 3, 'What is the best contextual significance of Hebrews 1:1-2 in Hebrews 1?', '["The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son''s exaltation follows a completed saving work dealing with sin.","The comparison establishes that the Son belongs to a category above heavenly servants."]'::jsonb, 'The chapter presents the Son as God''s climactic revelation after earlier prophetic messages.', 'The surrounding argument supports this significance at Hebrews 1:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 1:1-2 in Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 3, 'What is the best contextual significance of Hebrews 1:14 in Hebrews 1?', '["Angels are ministering spirits whose role is service, not lordship.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son''s exaltation follows a completed saving work dealing with sin."]'::jsonb, 'Angels are ministering spirits whose role is service, not lordship.', 'The surrounding argument supports this significance at Hebrews 1:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 1:14 in Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 3, 'What is the best contextual significance of Hebrews 1:2 in Hebrews 1?', '["The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son''s exaltation follows a completed saving work dealing with sin.","The comparison establishes that the Son belongs to a category above heavenly servants."]'::jsonb, 'The Son is portrayed as the rightful possessor of all things, not a limited mediator.', 'The surrounding argument supports this significance at Hebrews 1:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 1:2 in Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 3, 'What is the best contextual significance of Hebrews 1:2 in Hebrews 1?', '["The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son''s exaltation follows a completed saving work dealing with sin.","The comparison establishes that the Son belongs to a category above heavenly servants."]'::jsonb, 'The Son is placed on the creator side of reality, not within creation as a mere servant.', 'The surrounding argument supports this significance at Hebrews 1:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 1:2 in Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 3, 'What is the best contextual significance of Hebrews 1:3 in Hebrews 1?', '["The Son''s exaltation follows a completed saving work dealing with sin.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The comparison establishes that the Son belongs to a category above heavenly servants."]'::jsonb, 'The Son''s exaltation follows a completed saving work dealing with sin.', 'The surrounding argument supports this significance at Hebrews 1:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 1:3 in Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 3, 'What is the best contextual significance of Hebrews 1:4 in Hebrews 1?', '["The comparison establishes that the Son belongs to a category above heavenly servants.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son''s exaltation follows a completed saving work dealing with sin."]'::jsonb, 'The comparison establishes that the Son belongs to a category above heavenly servants.', 'The surrounding argument supports this significance at Hebrews 1:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 1:4 in Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 3, 'What is the best contextual significance of Hebrews 1:8 in Hebrews 1?', '["The Son''s reign is marked by righteous rule, not arbitrary power.","The Son is portrayed as the rightful possessor of all things, not a limited mediator.","The Son is placed on the creator side of reality, not within creation as a mere servant.","The Son''s exaltation follows a completed saving work dealing with sin."]'::jsonb, 'The Son''s reign is marked by righteous rule, not arbitrary power.', 'The surrounding argument supports this significance at Hebrews 1:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 1:8 in Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 4, 'How does Hebrews 1:1-2 function in the broader argument of Hebrews 1?', '["Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.","The chapter links the Son''s inheritance with his supremacy over every created order.","Hebrews grounds the Son''s superiority not only in redemption but also in creation itself.","Hebrews joins priestly atonement and royal enthronement in one portrait of the Son."]'::jsonb, 'Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.', 'This synthesis fits the chapter''s broader argument around Hebrews 1:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 1:1-2 function in the broader argument of Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 4, 'How does Hebrews 1:14 function in the broader argument of Hebrews 1?', '["The chapter ends by distinguishing the Son as ruler from angels as servants to the heirs of salvation.","Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.","The chapter links the Son''s inheritance with his supremacy over every created order.","Hebrews grounds the Son''s superiority not only in redemption but also in creation itself."]'::jsonb, 'The chapter ends by distinguishing the Son as ruler from angels as servants to the heirs of salvation.', 'This synthesis fits the chapter''s broader argument around Hebrews 1:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 1:14 function in the broader argument of Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 4, 'How does Hebrews 1:2 function in the broader argument of Hebrews 1?', '["The chapter links the Son''s inheritance with his supremacy over every created order.","Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.","Hebrews grounds the Son''s superiority not only in redemption but also in creation itself.","Hebrews joins priestly atonement and royal enthronement in one portrait of the Son."]'::jsonb, 'The chapter links the Son''s inheritance with his supremacy over every created order.', 'This synthesis fits the chapter''s broader argument around Hebrews 1:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 1:2 function in the broader argument of Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 4, 'How does Hebrews 1:2 function in the broader argument of Hebrews 1?', '["Hebrews grounds the Son''s superiority not only in redemption but also in creation itself.","Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.","The chapter links the Son''s inheritance with his supremacy over every created order.","Hebrews joins priestly atonement and royal enthronement in one portrait of the Son."]'::jsonb, 'Hebrews grounds the Son''s superiority not only in redemption but also in creation itself.', 'This synthesis fits the chapter''s broader argument around Hebrews 1:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 1:2 function in the broader argument of Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 4, 'How does Hebrews 1:3 function in the broader argument of Hebrews 1?', '["Hebrews joins priestly atonement and royal enthronement in one portrait of the Son.","Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.","The chapter links the Son''s inheritance with his supremacy over every created order.","Hebrews grounds the Son''s superiority not only in redemption but also in creation itself."]'::jsonb, 'Hebrews joins priestly atonement and royal enthronement in one portrait of the Son.', 'This synthesis fits the chapter''s broader argument around Hebrews 1:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 1:3 function in the broader argument of Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 4, 'How does Hebrews 1:4 function in the broader argument of Hebrews 1?', '["The chapter uses angel language to make Christ''s rank unmistakably unique.","Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.","The chapter links the Son''s inheritance with his supremacy over every created order.","Hebrews grounds the Son''s superiority not only in redemption but also in creation itself."]'::jsonb, 'The chapter uses angel language to make Christ''s rank unmistakably unique.', 'This synthesis fits the chapter''s broader argument around Hebrews 1:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 1:4 function in the broader argument of Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 4, 'How does Hebrews 1:8 function in the broader argument of Hebrews 1?', '["Hebrews presents the Son''s kingdom as both royal and morally perfect.","Hebrews opens by showing that the Son completes and surpasses prior modes of revelation.","The chapter links the Son''s inheritance with his supremacy over every created order.","Hebrews grounds the Son''s superiority not only in redemption but also in creation itself."]'::jsonb, 'Hebrews presents the Son''s kingdom as both royal and morally perfect.', 'This synthesis fits the chapter''s broader argument around Hebrews 1:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 1:8 function in the broader argument of Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 5, 'What is the strongest theological reading of Hebrews 1:1-2 within Hebrews 1?', '["The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.","Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.","The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made.","The seated Son is exalted because his sacrifice is effective and finished, anticipating the later once-for-all priestly argument."]'::jsonb, 'The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.', 'This theological reading is grounded in Hebrews 1:1-2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 1:1-2 within Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 5, 'What is the strongest theological reading of Hebrews 1:14 within Hebrews 1?', '["Hebrews closes the angel comparison by locating angels within God''s saving economy as helpers, while the Son remains the sovereign center.","The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.","Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.","The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made."]'::jsonb, 'Hebrews closes the angel comparison by locating angels within God''s saving economy as helpers, while the Son remains the sovereign center.', 'This theological reading is grounded in Hebrews 1:14 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 1:14 within Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 5, 'What is the strongest theological reading of Hebrews 1:2 within Hebrews 1?', '["Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.","The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.","The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made.","The seated Son is exalted because his sacrifice is effective and finished, anticipating the later once-for-all priestly argument."]'::jsonb, 'Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.', 'This theological reading is grounded in Hebrews 1:2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 1:2 within Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 5, 'What is the strongest theological reading of Hebrews 1:2 within Hebrews 1?', '["The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made.","The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.","Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.","The seated Son is exalted because his sacrifice is effective and finished, anticipating the later once-for-all priestly argument."]'::jsonb, 'The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made.', 'This theological reading is grounded in Hebrews 1:2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 1:2 within Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 5, 'What is the strongest theological reading of Hebrews 1:3 within Hebrews 1?', '["The seated Son is exalted because his sacrifice is effective and finished, anticipating the later once-for-all priestly argument.","The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.","Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.","The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made."]'::jsonb, 'The seated Son is exalted because his sacrifice is effective and finished, anticipating the later once-for-all priestly argument.', 'This theological reading is grounded in Hebrews 1:3 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 1:3 within Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 5, 'What is the strongest theological reading of Hebrews 1:4 within Hebrews 1?', '["Hebrews does not demean angels; it heightens the Son by contrasting worshiping servants with the enthroned Son.","The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.","Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.","The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made."]'::jsonb, 'Hebrews does not demean angels; it heightens the Son by contrasting worshiping servants with the enthroned Son.', 'This theological reading is grounded in Hebrews 1:4 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 1:4 within Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 1, 5, 'What is the strongest theological reading of Hebrews 1:8 within Hebrews 1?', '["By stressing uprightness, the chapter shows that the Son''s divine kingship is ethically pure and covenantally fitting.","The letter''s Christology begins with revelation: the Son is not one messenger among others but the decisive self-disclosure of God.","Calling the Son heir of all things signals universal dominion and prepares for the argument that no angel shares his status.","The chapter ties revelation and creation together: the one who speaks finally is also the one through whom the ages were made."]'::jsonb, 'By stressing uprightness, the chapter shows that the Son''s divine kingship is ethically pure and covenantally fitting.', 'This theological reading is grounded in Hebrews 1:8 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 1:8 within Hebrews 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 1, 'According to Hebrews 2:1, what danger are believers warned against?', '["Drifting away from what they heard","Returning to Egypt","Seeking angelic visions","Building a new tabernacle"]'::jsonb, 'Drifting away from what they heard', 'Hebrews 2:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 2:1, what danger are believers warned against?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 1, 'According to Hebrews 2:10, what was Jesus made through sufferings?', '["The author of salvation made perfect through sufferings","A servant lower than Moses forever","A prophet without a kingdom","An angelic mediator"]'::jsonb, 'The author of salvation made perfect through sufferings', 'Hebrews 2:10 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 2:10, what was Jesus made through sufferings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 1, 'According to Hebrews 2:14, through death Jesus brought to nothing whom?', '["The devil, who had the power of death","Moses, who gave the law","Aaron, who offered sacrifices","Caesar, who ruled the nations"]'::jsonb, 'The devil, who had the power of death', 'Hebrews 2:14 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 2:14, through death Jesus brought to nothing whom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 1, 'What does Hebrews 2:11 say Jesus is not ashamed to call believers?', '["Brothers","Servants only","Strangers","Subjects of angels"]'::jsonb, 'Brothers', 'Hebrews 2:11 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 2:11 say Jesus is not ashamed to call believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 1, 'What does Hebrews 2:3 call the message that must not be neglected?', '["So great a salvation","A temporary covenant","An earthly inheritance","A mystery for angels"]'::jsonb, 'So great a salvation', 'Hebrews 2:3 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 2:3 call the message that must not be neglected?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 1, 'Why did Jesus have to be made like his brothers in every respect according to Hebrews 2?', '["To become a merciful and faithful high priest","To receive angelic worship","To inherit Levi''s genealogy","To abolish human weakness"]'::jsonb, 'To become a merciful and faithful high priest', 'Hebrews 2:17-18 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did Jesus have to be made like his brothers in every respect according to Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 1, 'Why was Jesus crowned with glory and honor in Hebrews 2:9?', '["Because of the suffering of death","Because he received the law","Because he conquered Rome","Because he avoided temptation"]'::jsonb, 'Because of the suffering of death', 'Hebrews 2:9 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why was Jesus crowned with glory and honor in Hebrews 2:9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 2, 'In context, what does Hebrews 2:1 emphasize?', '["The chapter begins with a warning that neglecting the message leads to spiritual drift.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","His sufferings fitted him to complete his saving mission for many sons."]'::jsonb, 'The chapter begins with a warning that neglecting the message leads to spiritual drift.', 'This is the point made in context at Hebrews 2:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 2:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 2, 'In context, what does Hebrews 2:10 emphasize?', '["His sufferings fitted him to complete his saving mission for many sons.","The chapter begins with a warning that neglecting the message leads to spiritual drift.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others."]'::jsonb, 'His sufferings fitted him to complete his saving mission for many sons.', 'This is the point made in context at Hebrews 2:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 2:10 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 2, 'In context, what does Hebrews 2:11 emphasize?', '["The sanctifying Son identifies with the sanctified as members of one family.","The chapter begins with a warning that neglecting the message leads to spiritual drift.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others."]'::jsonb, 'The sanctifying Son identifies with the sanctified as members of one family.', 'This is the point made in context at Hebrews 2:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 2:11 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 2, 'In context, what does Hebrews 2:14 emphasize?', '["By sharing flesh and blood, Jesus defeats the tyrant who held people in death''s fear.","The chapter begins with a warning that neglecting the message leads to spiritual drift.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others."]'::jsonb, 'By sharing flesh and blood, Jesus defeats the tyrant who held people in death''s fear.', 'This is the point made in context at Hebrews 2:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 2:14 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 2, 'In context, what does Hebrews 2:17-18 emphasize?', '["His true humanity equips him to represent people before God and help the tempted.","The chapter begins with a warning that neglecting the message leads to spiritual drift.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others."]'::jsonb, 'His true humanity equips him to represent people before God and help the tempted.', 'This is the point made in context at Hebrews 2:17-18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 2:17-18 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 2, 'In context, what does Hebrews 2:3 emphasize?', '["Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","The chapter begins with a warning that neglecting the message leads to spiritual drift.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","His sufferings fitted him to complete his saving mission for many sons."]'::jsonb, 'Salvation is described as great because it comes through the Lord and is confirmed by witnesses.', 'This is the point made in context at Hebrews 2:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 2:3 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 2, 'In context, what does Hebrews 2:9 emphasize?', '["Jesus'' exaltation is tied to his suffering and death on behalf of others.","The chapter begins with a warning that neglecting the message leads to spiritual drift.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","His sufferings fitted him to complete his saving mission for many sons."]'::jsonb, 'Jesus'' exaltation is tied to his suffering and death on behalf of others.', 'This is the point made in context at Hebrews 2:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 2:9 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 3, 'What is the best contextual significance of Hebrews 2:1 in Hebrews 2?', '["The chapter begins with a warning that neglecting the message leads to spiritual drift.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","His sufferings fitted him to complete his saving mission for many sons.","The sanctifying Son identifies with the sanctified as members of one family."]'::jsonb, 'The chapter begins with a warning that neglecting the message leads to spiritual drift.', 'The surrounding argument supports this significance at Hebrews 2:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 2:1 in Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 3, 'What is the best contextual significance of Hebrews 2:10 in Hebrews 2?', '["His sufferings fitted him to complete his saving mission for many sons.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","The sanctifying Son identifies with the sanctified as members of one family."]'::jsonb, 'His sufferings fitted him to complete his saving mission for many sons.', 'The surrounding argument supports this significance at Hebrews 2:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 2:10 in Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 3, 'What is the best contextual significance of Hebrews 2:11 in Hebrews 2?', '["The sanctifying Son identifies with the sanctified as members of one family.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","His sufferings fitted him to complete his saving mission for many sons."]'::jsonb, 'The sanctifying Son identifies with the sanctified as members of one family.', 'The surrounding argument supports this significance at Hebrews 2:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 2:11 in Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 3, 'What is the best contextual significance of Hebrews 2:14 in Hebrews 2?', '["By sharing flesh and blood, Jesus defeats the tyrant who held people in death''s fear.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","His sufferings fitted him to complete his saving mission for many sons."]'::jsonb, 'By sharing flesh and blood, Jesus defeats the tyrant who held people in death''s fear.', 'The surrounding argument supports this significance at Hebrews 2:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 2:14 in Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 3, 'What is the best contextual significance of Hebrews 2:17-18 in Hebrews 2?', '["His true humanity equips him to represent people before God and help the tempted.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","His sufferings fitted him to complete his saving mission for many sons."]'::jsonb, 'His true humanity equips him to represent people before God and help the tempted.', 'The surrounding argument supports this significance at Hebrews 2:17-18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 2:17-18 in Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 3, 'What is the best contextual significance of Hebrews 2:3 in Hebrews 2?', '["Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","Jesus'' exaltation is tied to his suffering and death on behalf of others.","His sufferings fitted him to complete his saving mission for many sons.","The sanctifying Son identifies with the sanctified as members of one family."]'::jsonb, 'Salvation is described as great because it comes through the Lord and is confirmed by witnesses.', 'The surrounding argument supports this significance at Hebrews 2:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 2:3 in Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 3, 'What is the best contextual significance of Hebrews 2:9 in Hebrews 2?', '["Jesus'' exaltation is tied to his suffering and death on behalf of others.","Salvation is described as great because it comes through the Lord and is confirmed by witnesses.","His sufferings fitted him to complete his saving mission for many sons.","The sanctifying Son identifies with the sanctified as members of one family."]'::jsonb, 'Jesus'' exaltation is tied to his suffering and death on behalf of others.', 'The surrounding argument supports this significance at Hebrews 2:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 2:9 in Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 4, 'How does Hebrews 2:1 function in the broader argument of Hebrews 2?', '["Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.","The chapter frames apostasy as despising the supreme salvation announced in the Son.","Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death.","Hebrews connects Jesus'' sufferings with his role as the pioneer who brings others to glory."]'::jsonb, 'Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.', 'This synthesis fits the chapter''s broader argument around Hebrews 2:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 2:1 function in the broader argument of Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 4, 'How does Hebrews 2:10 function in the broader argument of Hebrews 2?', '["Hebrews connects Jesus'' sufferings with his role as the pioneer who brings others to glory.","Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.","The chapter frames apostasy as despising the supreme salvation announced in the Son.","Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death."]'::jsonb, 'Hebrews connects Jesus'' sufferings with his role as the pioneer who brings others to glory.', 'This synthesis fits the chapter''s broader argument around Hebrews 2:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 2:10 function in the broader argument of Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 4, 'How does Hebrews 2:11 function in the broader argument of Hebrews 2?', '["The chapter emphasizes solidarity: the exalted Son does not save at a distance.","Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.","The chapter frames apostasy as despising the supreme salvation announced in the Son.","Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death."]'::jsonb, 'The chapter emphasizes solidarity: the exalted Son does not save at a distance.', 'This synthesis fits the chapter''s broader argument around Hebrews 2:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 2:11 function in the broader argument of Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 4, 'How does Hebrews 2:14 function in the broader argument of Hebrews 2?', '["Hebrews presents the incarnation as strategic for victory over death and the devil.","Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.","The chapter frames apostasy as despising the supreme salvation announced in the Son.","Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death."]'::jsonb, 'Hebrews presents the incarnation as strategic for victory over death and the devil.', 'This synthesis fits the chapter''s broader argument around Hebrews 2:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 2:14 function in the broader argument of Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 4, 'How does Hebrews 2:17-18 function in the broader argument of Hebrews 2?', '["The chapter links incarnation, atonement, and priestly sympathy in one argument.","Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.","The chapter frames apostasy as despising the supreme salvation announced in the Son.","Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death."]'::jsonb, 'The chapter links incarnation, atonement, and priestly sympathy in one argument.', 'This synthesis fits the chapter''s broader argument around Hebrews 2:17-18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 2:17-18 function in the broader argument of Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 4, 'How does Hebrews 2:3 function in the broader argument of Hebrews 2?', '["The chapter frames apostasy as despising the supreme salvation announced in the Son.","Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.","Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death.","Hebrews connects Jesus'' sufferings with his role as the pioneer who brings others to glory."]'::jsonb, 'The chapter frames apostasy as despising the supreme salvation announced in the Son.', 'This synthesis fits the chapter''s broader argument around Hebrews 2:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 2:3 function in the broader argument of Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 4, 'How does Hebrews 2:9 function in the broader argument of Hebrews 2?', '["Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death.","Hebrews moves from the Son''s greatness to the urgency of responding carefully to his message.","The chapter frames apostasy as despising the supreme salvation announced in the Son.","Hebrews connects Jesus'' sufferings with his role as the pioneer who brings others to glory."]'::jsonb, 'Hebrews shows that the path to glory for the Son runs through humiliation and sacrificial death.', 'This synthesis fits the chapter''s broader argument around Hebrews 2:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 2:9 function in the broader argument of Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 5, 'What is the strongest theological reading of Hebrews 2:1 within Hebrews 2?', '["The warning passage shows that higher revelation in the Son brings heavier accountability, not less.","Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.","The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph.","Perfection here means vocational completion: the incarnate Son is fully qualified as the saving leader through suffering."]'::jsonb, 'The warning passage shows that higher revelation in the Son brings heavier accountability, not less.', 'This theological reading is grounded in Hebrews 2:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 2:1 within Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 5, 'What is the strongest theological reading of Hebrews 2:10 within Hebrews 2?', '["Perfection here means vocational completion: the incarnate Son is fully qualified as the saving leader through suffering.","The warning passage shows that higher revelation in the Son brings heavier accountability, not less.","Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.","The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph."]'::jsonb, 'Perfection here means vocational completion: the incarnate Son is fully qualified as the saving leader through suffering.', 'This theological reading is grounded in Hebrews 2:10 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 2:10 within Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 5, 'What is the strongest theological reading of Hebrews 2:11 within Hebrews 2?', '["Calling believers brothers reveals that Christ''s saving work creates familial union, not merely legal acquittal.","The warning passage shows that higher revelation in the Son brings heavier accountability, not less.","Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.","The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph."]'::jsonb, 'Calling believers brothers reveals that Christ''s saving work creates familial union, not merely legal acquittal.', 'This theological reading is grounded in Hebrews 2:11 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 2:11 within Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 5, 'What is the strongest theological reading of Hebrews 2:14 within Hebrews 2?', '["The Son conquers not by avoiding death but by entering it and breaking its enslaving power from within.","The warning passage shows that higher revelation in the Son brings heavier accountability, not less.","Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.","The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph."]'::jsonb, 'The Son conquers not by avoiding death but by entering it and breaking its enslaving power from within.', 'This theological reading is grounded in Hebrews 2:14 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 2:14 within Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 5, 'What is the strongest theological reading of Hebrews 2:17-18 within Hebrews 2?', '["Hebrews grounds Christ''s priesthood in solidarity: only the fully human Son can make propitiation and effectively aid his people.","The warning passage shows that higher revelation in the Son brings heavier accountability, not less.","Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.","The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph."]'::jsonb, 'Hebrews grounds Christ''s priesthood in solidarity: only the fully human Son can make propitiation and effectively aid his people.', 'This theological reading is grounded in Hebrews 2:17-18 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 2:17-18 within Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 5, 'What is the strongest theological reading of Hebrews 2:3 within Hebrews 2?', '["Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.","The warning passage shows that higher revelation in the Son brings heavier accountability, not less.","The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph.","Perfection here means vocational completion: the incarnate Son is fully qualified as the saving leader through suffering."]'::jsonb, 'Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.', 'This theological reading is grounded in Hebrews 2:3 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 2:3 within Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 2, 5, 'What is the strongest theological reading of Hebrews 2:9 within Hebrews 2?', '["The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph.","The warning passage shows that higher revelation in the Son brings heavier accountability, not less.","Hebrews treats salvation as climactic revelation and redemptive reality together, intensifying the warning against indifference.","Perfection here means vocational completion: the incarnate Son is fully qualified as the saving leader through suffering."]'::jsonb, 'The chapter reshapes expectations of glory by presenting suffering as the appointed means of the Son''s saving triumph.', 'This theological reading is grounded in Hebrews 2:9 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 2:9 within Hebrews 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 1, 'According to Hebrews 3:3, Jesus was counted worthy of more glory than whom?', '["Moses","Aaron","David","Joshua"]'::jsonb, 'Moses', 'Hebrews 3:3 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 3:3, Jesus was counted worthy of more glory than whom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 1, 'According to Hebrews 3:6, Christ is faithful over God''s house as what?', '["A Son","A servant","A prophet","An angel"]'::jsonb, 'A Son', 'Hebrews 3:6 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 3:6, Christ is faithful over God''s house as what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 1, 'How often does Hebrews 3:13 say believers should exhort one another?', '["Day by day, while it is called Today","Only on feast days","Once a year","When the temple is open"]'::jsonb, 'Day by day, while it is called Today', 'Hebrews 3:13 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'How often does Hebrews 3:13 say believers should exhort one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 1, 'What kind of heart does Hebrews 3:12 warn against?', '["An evil heart of unbelief","An anxious heart of sorrow","A divided heart of wealth","A proud heart of knowledge"]'::jsonb, 'An evil heart of unbelief', 'Hebrews 3:12 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of heart does Hebrews 3:12 warn against?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 1, 'What repeated command does Hebrews 3 give when God''s voice is heard?', '["Do not harden your hearts","Return to the wilderness","Wait for another prophet","Offer more sacrifices"]'::jsonb, 'Do not harden your hearts', 'Hebrews 3:7-8 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What repeated command does Hebrews 3 give when God''s voice is heard?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 1, 'Whom does Hebrews 3:1 tell the readers to consider?', '["Jesus, the Apostle and High Priest of our confession","Moses, the mediator of the covenant","Aaron, the first high priest","Joshua, the giver of rest"]'::jsonb, 'Jesus, the Apostle and High Priest of our confession', 'Hebrews 3:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom does Hebrews 3:1 tell the readers to consider?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 1, 'Why were the wilderness generation unable to enter God''s rest?', '["Because of unbelief","Because of weak armies","Because of lack of sacrifices","Because of foreign oppression"]'::jsonb, 'Because of unbelief', 'Hebrews 3:19 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were the wilderness generation unable to enter God''s rest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 2, 'In context, what does Hebrews 3:1 emphasize?', '["The readers are called to fix their attention on Jesus as the central figure of their confession.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation."]'::jsonb, 'The readers are called to fix their attention on Jesus as the central figure of their confession.', 'This is the point made in context at Hebrews 3:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 3:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 2, 'In context, what does Hebrews 3:12 emphasize?', '["Unbelief is treated as a moral-spiritual danger that pulls people away from the living God.","The readers are called to fix their attention on Jesus as the central figure of their confession.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status."]'::jsonb, 'Unbelief is treated as a moral-spiritual danger that pulls people away from the living God.', 'This is the point made in context at Hebrews 3:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 3:12 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 2, 'In context, what does Hebrews 3:13 emphasize?', '["Mutual exhortation is presented as a daily means of resisting sin''s deceitfulness.","The readers are called to fix their attention on Jesus as the central figure of their confession.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status."]'::jsonb, 'Mutual exhortation is presented as a daily means of resisting sin''s deceitfulness.', 'This is the point made in context at Hebrews 3:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 3:13 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 2, 'In context, what does Hebrews 3:19 emphasize?', '["The final diagnosis of Israel''s failure is unbelief rather than lack of opportunity.","The readers are called to fix their attention on Jesus as the central figure of their confession.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status."]'::jsonb, 'The final diagnosis of Israel''s failure is unbelief rather than lack of opportunity.', 'This is the point made in context at Hebrews 3:19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 3:19 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 2, 'In context, what does Hebrews 3:3 emphasize?', '["Jesus surpasses Moses the way a builder surpasses the house.","The readers are called to fix their attention on Jesus as the central figure of their confession.","Christ relates to God''s house with filial authority rather than servant status.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation."]'::jsonb, 'Jesus surpasses Moses the way a builder surpasses the house.', 'This is the point made in context at Hebrews 3:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 3:3 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 2, 'In context, what does Hebrews 3:6 emphasize?', '["Christ relates to God''s house with filial authority rather than servant status.","The readers are called to fix their attention on Jesus as the central figure of their confession.","Jesus surpasses Moses the way a builder surpasses the house.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation."]'::jsonb, 'Christ relates to God''s house with filial authority rather than servant status.', 'This is the point made in context at Hebrews 3:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 3:6 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 2, 'In context, what does Hebrews 3:7-8 emphasize?', '["The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation.","The readers are called to fix their attention on Jesus as the central figure of their confession.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status."]'::jsonb, 'The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation.', 'This is the point made in context at Hebrews 3:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 3:7-8 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 3, 'What is the best contextual significance of Hebrews 3:1 in Hebrews 3?', '["The readers are called to fix their attention on Jesus as the central figure of their confession.","Christ relates to God''s house with filial authority rather than servant status.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation.","Unbelief is treated as a moral-spiritual danger that pulls people away from the living God."]'::jsonb, 'The readers are called to fix their attention on Jesus as the central figure of their confession.', 'The surrounding argument supports this significance at Hebrews 3:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 3:1 in Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 3, 'What is the best contextual significance of Hebrews 3:12 in Hebrews 3?', '["Unbelief is treated as a moral-spiritual danger that pulls people away from the living God.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation."]'::jsonb, 'Unbelief is treated as a moral-spiritual danger that pulls people away from the living God.', 'The surrounding argument supports this significance at Hebrews 3:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 3:12 in Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 3, 'What is the best contextual significance of Hebrews 3:13 in Hebrews 3?', '["Mutual exhortation is presented as a daily means of resisting sin''s deceitfulness.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation."]'::jsonb, 'Mutual exhortation is presented as a daily means of resisting sin''s deceitfulness.', 'The surrounding argument supports this significance at Hebrews 3:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 3:13 in Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 3, 'What is the best contextual significance of Hebrews 3:19 in Hebrews 3?', '["The final diagnosis of Israel''s failure is unbelief rather than lack of opportunity.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation."]'::jsonb, 'The final diagnosis of Israel''s failure is unbelief rather than lack of opportunity.', 'The surrounding argument supports this significance at Hebrews 3:19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 3:19 in Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 3, 'What is the best contextual significance of Hebrews 3:3 in Hebrews 3?', '["Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation.","Unbelief is treated as a moral-spiritual danger that pulls people away from the living God."]'::jsonb, 'Jesus surpasses Moses the way a builder surpasses the house.', 'The surrounding argument supports this significance at Hebrews 3:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 3:3 in Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 3, 'What is the best contextual significance of Hebrews 3:6 in Hebrews 3?', '["Christ relates to God''s house with filial authority rather than servant status.","Jesus surpasses Moses the way a builder surpasses the house.","The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation.","Unbelief is treated as a moral-spiritual danger that pulls people away from the living God."]'::jsonb, 'Christ relates to God''s house with filial authority rather than servant status.', 'The surrounding argument supports this significance at Hebrews 3:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 3:6 in Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 3, 'What is the best contextual significance of Hebrews 3:7-8 in Hebrews 3?', '["The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation.","Jesus surpasses Moses the way a builder surpasses the house.","Christ relates to God''s house with filial authority rather than servant status.","Unbelief is treated as a moral-spiritual danger that pulls people away from the living God."]'::jsonb, 'The chapter uses Psalm 95 to warn against the settled resistance that marked the wilderness generation.', 'The surrounding argument supports this significance at Hebrews 3:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 3:7-8 in Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 4, 'How does Hebrews 3:1 function in the broader argument of Hebrews 3?', '["The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.","Hebrews honors Moses while insisting that Christ stands above him in dignity and role.","The chapter contrasts Moses in the house with Christ over the house.","Hebrews turns Israel''s past rebellion into a present exhortation for the church."]'::jsonb, 'The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.', 'This synthesis fits the chapter''s broader argument around Hebrews 3:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 3:1 function in the broader argument of Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 4, 'How does Hebrews 3:12 function in the broader argument of Hebrews 3?', '["The chapter interprets failure in the wilderness not as mere weakness but as unbelieving rebellion.","The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.","Hebrews honors Moses while insisting that Christ stands above him in dignity and role.","The chapter contrasts Moses in the house with Christ over the house."]'::jsonb, 'The chapter interprets failure in the wilderness not as mere weakness but as unbelieving rebellion.', 'This synthesis fits the chapter''s broader argument around Hebrews 3:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 3:12 function in the broader argument of Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 4, 'How does Hebrews 3:13 function in the broader argument of Hebrews 3?', '["Perseverance in Hebrews is communal, not merely individual.","The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.","Hebrews honors Moses while insisting that Christ stands above him in dignity and role.","The chapter contrasts Moses in the house with Christ over the house."]'::jsonb, 'Perseverance in Hebrews is communal, not merely individual.', 'This synthesis fits the chapter''s broader argument around Hebrews 3:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 3:13 function in the broader argument of Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 4, 'How does Hebrews 3:19 function in the broader argument of Hebrews 3?', '["Hebrews closes the chapter by making unbelief the interpretive key for the wilderness narrative.","The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.","Hebrews honors Moses while insisting that Christ stands above him in dignity and role.","The chapter contrasts Moses in the house with Christ over the house."]'::jsonb, 'Hebrews closes the chapter by making unbelief the interpretive key for the wilderness narrative.', 'This synthesis fits the chapter''s broader argument around Hebrews 3:19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 3:19 function in the broader argument of Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 4, 'How does Hebrews 3:3 function in the broader argument of Hebrews 3?', '["Hebrews honors Moses while insisting that Christ stands above him in dignity and role.","The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.","The chapter contrasts Moses in the house with Christ over the house.","Hebrews turns Israel''s past rebellion into a present exhortation for the church."]'::jsonb, 'Hebrews honors Moses while insisting that Christ stands above him in dignity and role.', 'This synthesis fits the chapter''s broader argument around Hebrews 3:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 3:3 function in the broader argument of Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 4, 'How does Hebrews 3:6 function in the broader argument of Hebrews 3?', '["The chapter contrasts Moses in the house with Christ over the house.","The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.","Hebrews honors Moses while insisting that Christ stands above him in dignity and role.","Hebrews turns Israel''s past rebellion into a present exhortation for the church."]'::jsonb, 'The chapter contrasts Moses in the house with Christ over the house.', 'This synthesis fits the chapter''s broader argument around Hebrews 3:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 3:6 function in the broader argument of Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 4, 'How does Hebrews 3:7-8 function in the broader argument of Hebrews 3?', '["Hebrews turns Israel''s past rebellion into a present exhortation for the church.","The chapter begins by directing persevering faith toward Jesus rather than toward former covenant leaders.","Hebrews honors Moses while insisting that Christ stands above him in dignity and role.","The chapter contrasts Moses in the house with Christ over the house."]'::jsonb, 'Hebrews turns Israel''s past rebellion into a present exhortation for the church.', 'This synthesis fits the chapter''s broader argument around Hebrews 3:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 3:7-8 function in the broader argument of Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 5, 'What is the strongest theological reading of Hebrews 3:1 within Hebrews 3?', '["Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.","The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.","The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not.","The use of Today means the ancient warning remains a living word pressing for present response."]'::jsonb, 'Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.', 'This theological reading is grounded in Hebrews 3:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 3:1 within Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 5, 'What is the strongest theological reading of Hebrews 3:12 within Hebrews 3?', '["Hebrews exposes apostasy at the level of the heart, showing that departure begins internally before it appears outwardly.","Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.","The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.","The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not."]'::jsonb, 'Hebrews exposes apostasy at the level of the heart, showing that departure begins internally before it appears outwardly.', 'This theological reading is grounded in Hebrews 3:12 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 3:12 within Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 5, 'What is the strongest theological reading of Hebrews 3:13 within Hebrews 3?', '["The chapter makes perseverance a shared responsibility because hardening is gradual and deceptive.","Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.","The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.","The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not."]'::jsonb, 'The chapter makes perseverance a shared responsibility because hardening is gradual and deceptive.', 'This theological reading is grounded in Hebrews 3:13 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 3:13 within Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 5, 'What is the strongest theological reading of Hebrews 3:19 within Hebrews 3?', '["Rest is forfeited not by external difficulty but by refusing God''s trustworthy word.","Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.","The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.","The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not."]'::jsonb, 'Rest is forfeited not by external difficulty but by refusing God''s trustworthy word.', 'This theological reading is grounded in Hebrews 3:19 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 3:19 within Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 5, 'What is the strongest theological reading of Hebrews 3:3 within Hebrews 3?', '["The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.","Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.","The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not.","The use of Today means the ancient warning remains a living word pressing for present response."]'::jsonb, 'The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.', 'This theological reading is grounded in Hebrews 3:3 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 3:3 within Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 5, 'What is the strongest theological reading of Hebrews 3:6 within Hebrews 3?', '["The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not.","Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.","The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.","The use of Today means the ancient warning remains a living word pressing for present response."]'::jsonb, 'The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not.', 'This theological reading is grounded in Hebrews 3:6 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 3:6 within Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 3, 5, 'What is the strongest theological reading of Hebrews 3:7-8 within Hebrews 3?', '["The use of Today means the ancient warning remains a living word pressing for present response.","Naming Jesus as Apostle and High Priest joins divine mission and priestly mediation in one office.","The Moses comparison elevates Christ without flattening the old covenant; the servant is faithful, but the Son is superior.","The servant-Son contrast reinforces that Jesus belongs to God''s identity and authority in a way Moses does not."]'::jsonb, 'The use of Today means the ancient warning remains a living word pressing for present response.', 'This theological reading is grounded in Hebrews 3:7-8 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 3:7-8 within Hebrews 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 1, 'According to Hebrews 4:13, how many creatures are hidden from God''s sight?', '["None","Only angels","Only the wicked","Those inside the covenant"]'::jsonb, 'None', 'Hebrews 4:13 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Hebrews 4:13, how many creatures are hidden from God''s sight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 1, 'How does Hebrews 4 describe the word of God?', '["Living, active, and sharper than any two-edged sword","Hidden, partial, and ceremonial","Gentle, symbolic, and optional","Silent, mystical, and private"]'::jsonb, 'Living, active, and sharper than any two-edged sword', 'Hebrews 4:12 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Hebrews 4 describe the word of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 1, 'How does Hebrews 4:15 describe Jesus in relation to temptation?', '["Tempted in all points like us, yet without sin","Untouched by human weakness","Tempted and overcome","Exempt from suffering"]'::jsonb, 'Tempted in all points like us, yet without sin', 'Hebrews 4:15 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Hebrews 4:15 describe Jesus in relation to temptation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 1, 'If Joshua had given final rest, what would not have been spoken of later?', '["Another day of rest","Another priesthood","Another temple","Another prophet like Moses"]'::jsonb, 'Another day of rest', 'Hebrews 4:8-9 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'If Joshua had given final rest, what would not have been spoken of later?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 1, 'What promise does Hebrews 4:1 say still remains?', '["The promise of entering God''s rest","The promise of returning to Sinai","The promise of Levitical perfection","The promise of angelic rule"]'::jsonb, 'The promise of entering God''s rest', 'Hebrews 4:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What promise does Hebrews 4:1 say still remains?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 1, 'Where does Hebrews 4:16 tell believers to draw near with boldness?', '["To the throne of grace","To Mount Sinai","To the earthly sanctuary only","To the judgment seat of angels"]'::jsonb, 'To the throne of grace', 'Hebrews 4:16 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where does Hebrews 4:16 tell believers to draw near with boldness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 1, 'Why did the message not profit those who heard it in Hebrews 4:2?', '["It was not united by faith with those who heard","It was spoken by angels only","It came too late for Israel","It lacked priestly support"]'::jsonb, 'It was not united by faith with those who heard', 'Hebrews 4:2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did the message not profit those who heard it in Hebrews 4:2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 2, 'In context, what does Hebrews 4:1 emphasize?', '["The chapter insists that God''s rest is still open and must be pursued seriously.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people.","God''s word is powerfully penetrating and able to expose the inner person."]'::jsonb, 'The chapter insists that God''s rest is still open and must be pursued seriously.', 'This is the point made in context at Hebrews 4:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 4:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 2, 'In context, what does Hebrews 4:12 emphasize?', '["God''s word is powerfully penetrating and able to expose the inner person.","The chapter insists that God''s rest is still open and must be pursued seriously.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people."]'::jsonb, 'God''s word is powerfully penetrating and able to expose the inner person.', 'This is the point made in context at Hebrews 4:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 4:12 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 2, 'In context, what does Hebrews 4:13 emphasize?', '["All people stand completely exposed before the God to whom they must answer.","The chapter insists that God''s rest is still open and must be pursued seriously.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people."]'::jsonb, 'All people stand completely exposed before the God to whom they must answer.', 'This is the point made in context at Hebrews 4:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 4:13 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 2, 'In context, what does Hebrews 4:15 emphasize?', '["Jesus fully shares human testing while remaining morally pure.","The chapter insists that God''s rest is still open and must be pursued seriously.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people."]'::jsonb, 'Jesus fully shares human testing while remaining morally pure.', 'This is the point made in context at Hebrews 4:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 4:15 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 2, 'In context, what does Hebrews 4:16 emphasize?', '["Because of Jesus, believers may approach God for mercy and timely help.","The chapter insists that God''s rest is still open and must be pursued seriously.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people."]'::jsonb, 'Because of Jesus, believers may approach God for mercy and timely help.', 'This is the point made in context at Hebrews 4:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 4:16 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 2, 'In context, what does Hebrews 4:2 emphasize?', '["Hearing alone does not benefit people unless the message is received in faith.","The chapter insists that God''s rest is still open and must be pursued seriously.","Joshua''s conquest did not exhaust the rest God intended for his people.","God''s word is powerfully penetrating and able to expose the inner person."]'::jsonb, 'Hearing alone does not benefit people unless the message is received in faith.', 'This is the point made in context at Hebrews 4:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 4:2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 2, 'In context, what does Hebrews 4:8-9 emphasize?', '["Joshua''s conquest did not exhaust the rest God intended for his people.","The chapter insists that God''s rest is still open and must be pursued seriously.","Hearing alone does not benefit people unless the message is received in faith.","God''s word is powerfully penetrating and able to expose the inner person."]'::jsonb, 'Joshua''s conquest did not exhaust the rest God intended for his people.', 'This is the point made in context at Hebrews 4:8-9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 4:8-9 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 3, 'What is the best contextual significance of Hebrews 4:1 in Hebrews 4?', '["The chapter insists that God''s rest is still open and must be pursued seriously.","Joshua''s conquest did not exhaust the rest God intended for his people.","God''s word is powerfully penetrating and able to expose the inner person.","All people stand completely exposed before the God to whom they must answer."]'::jsonb, 'The chapter insists that God''s rest is still open and must be pursued seriously.', 'The surrounding argument supports this significance at Hebrews 4:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 4:1 in Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 3, 'What is the best contextual significance of Hebrews 4:12 in Hebrews 4?', '["God''s word is powerfully penetrating and able to expose the inner person.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people.","All people stand completely exposed before the God to whom they must answer."]'::jsonb, 'God''s word is powerfully penetrating and able to expose the inner person.', 'The surrounding argument supports this significance at Hebrews 4:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 4:12 in Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 3, 'What is the best contextual significance of Hebrews 4:13 in Hebrews 4?', '["All people stand completely exposed before the God to whom they must answer.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people.","God''s word is powerfully penetrating and able to expose the inner person."]'::jsonb, 'All people stand completely exposed before the God to whom they must answer.', 'The surrounding argument supports this significance at Hebrews 4:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 4:13 in Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 3, 'What is the best contextual significance of Hebrews 4:15 in Hebrews 4?', '["Jesus fully shares human testing while remaining morally pure.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people.","God''s word is powerfully penetrating and able to expose the inner person."]'::jsonb, 'Jesus fully shares human testing while remaining morally pure.', 'The surrounding argument supports this significance at Hebrews 4:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 4:15 in Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 3, 'What is the best contextual significance of Hebrews 4:16 in Hebrews 4?', '["Because of Jesus, believers may approach God for mercy and timely help.","Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people.","God''s word is powerfully penetrating and able to expose the inner person."]'::jsonb, 'Because of Jesus, believers may approach God for mercy and timely help.', 'The surrounding argument supports this significance at Hebrews 4:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 4:16 in Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 3, 'What is the best contextual significance of Hebrews 4:2 in Hebrews 4?', '["Hearing alone does not benefit people unless the message is received in faith.","Joshua''s conquest did not exhaust the rest God intended for his people.","God''s word is powerfully penetrating and able to expose the inner person.","All people stand completely exposed before the God to whom they must answer."]'::jsonb, 'Hearing alone does not benefit people unless the message is received in faith.', 'The surrounding argument supports this significance at Hebrews 4:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 4:2 in Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 3, 'What is the best contextual significance of Hebrews 4:8-9 in Hebrews 4?', '["Joshua''s conquest did not exhaust the rest God intended for his people.","Hearing alone does not benefit people unless the message is received in faith.","God''s word is powerfully penetrating and able to expose the inner person.","All people stand completely exposed before the God to whom they must answer."]'::jsonb, 'Joshua''s conquest did not exhaust the rest God intended for his people.', 'The surrounding argument supports this significance at Hebrews 4:8-9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 4:8-9 in Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 4, 'How does Hebrews 4:1 function in the broader argument of Hebrews 4?', '["Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.","The chapter contrasts outward exposure to God''s word with inward believing response.","Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan.","The chapter turns from rest to the searching power of the word that discerns true response."]'::jsonb, 'Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.', 'This synthesis fits the chapter''s broader argument around Hebrews 4:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 4:1 function in the broader argument of Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 4, 'How does Hebrews 4:12 function in the broader argument of Hebrews 4?', '["The chapter turns from rest to the searching power of the word that discerns true response.","Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.","The chapter contrasts outward exposure to God''s word with inward believing response.","Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan."]'::jsonb, 'The chapter turns from rest to the searching power of the word that discerns true response.', 'This synthesis fits the chapter''s broader argument around Hebrews 4:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 4:12 function in the broader argument of Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 4, 'How does Hebrews 4:13 function in the broader argument of Hebrews 4?', '["The chapter pairs the searching word with the all-seeing God before whom every heart is open.","Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.","The chapter contrasts outward exposure to God''s word with inward believing response.","Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan."]'::jsonb, 'The chapter pairs the searching word with the all-seeing God before whom every heart is open.', 'This synthesis fits the chapter''s broader argument around Hebrews 4:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 4:13 function in the broader argument of Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 4, 'How does Hebrews 4:15 function in the broader argument of Hebrews 4?', '["The chapter grounds confidence in Christ''s priesthood in both his solidarity and his sinlessness.","Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.","The chapter contrasts outward exposure to God''s word with inward believing response.","Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan."]'::jsonb, 'The chapter grounds confidence in Christ''s priesthood in both his solidarity and his sinlessness.', 'This synthesis fits the chapter''s broader argument around Hebrews 4:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 4:15 function in the broader argument of Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 4, 'How does Hebrews 4:16 function in the broader argument of Hebrews 4?', '["The chapter moves from warning and exposure to confident access through the high priest.","Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.","The chapter contrasts outward exposure to God''s word with inward believing response.","Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan."]'::jsonb, 'The chapter moves from warning and exposure to confident access through the high priest.', 'This synthesis fits the chapter''s broader argument around Hebrews 4:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 4:16 function in the broader argument of Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 4, 'How does Hebrews 4:2 function in the broader argument of Hebrews 4?', '["The chapter contrasts outward exposure to God''s word with inward believing response.","Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.","Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan.","The chapter turns from rest to the searching power of the word that discerns true response."]'::jsonb, 'The chapter contrasts outward exposure to God''s word with inward believing response.', 'This synthesis fits the chapter''s broader argument around Hebrews 4:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 4:2 function in the broader argument of Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 4, 'How does Hebrews 4:8-9 function in the broader argument of Hebrews 4?', '["Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan.","Hebrews treats the rest promise as ongoing, not exhausted by Israel''s history.","The chapter contrasts outward exposure to God''s word with inward believing response.","The chapter turns from rest to the searching power of the word that discerns true response."]'::jsonb, 'Hebrews argues from Scripture itself that the promised rest transcends entry into Canaan.', 'This synthesis fits the chapter''s broader argument around Hebrews 4:8-9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 4:8-9 function in the broader argument of Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 5, 'What is the strongest theological reading of Hebrews 4:1 within Hebrews 4?', '["Rest functions as an eschatological promise that calls for persevering faith in the present.","Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.","The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself.","Hebrews presents revelation as active divine address that judges and unveils rather than merely informs."]'::jsonb, 'Rest functions as an eschatological promise that calls for persevering faith in the present.', 'This theological reading is grounded in Hebrews 4:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 4:1 within Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 5, 'What is the strongest theological reading of Hebrews 4:12 within Hebrews 4?', '["Hebrews presents revelation as active divine address that judges and unveils rather than merely informs.","Rest functions as an eschatological promise that calls for persevering faith in the present.","Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.","The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself."]'::jsonb, 'Hebrews presents revelation as active divine address that judges and unveils rather than merely informs.', 'This theological reading is grounded in Hebrews 4:12 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 4:12 within Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 5, 'What is the strongest theological reading of Hebrews 4:13 within Hebrews 4?', '["Exposure before God prepares the need for a high priest who can represent the fully known sinner.","Rest functions as an eschatological promise that calls for persevering faith in the present.","Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.","The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself."]'::jsonb, 'Exposure before God prepares the need for a high priest who can represent the fully known sinner.', 'This theological reading is grounded in Hebrews 4:13 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 4:13 within Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 5, 'What is the strongest theological reading of Hebrews 4:15 within Hebrews 4?', '["His sympathy is not weakened by sinlessness; it is strengthened because he endured temptation without failing.","Rest functions as an eschatological promise that calls for persevering faith in the present.","Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.","The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself."]'::jsonb, 'His sympathy is not weakened by sinlessness; it is strengthened because he endured temptation without failing.', 'This theological reading is grounded in Hebrews 4:15 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 4:15 within Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 5, 'What is the strongest theological reading of Hebrews 4:16 within Hebrews 4?', '["Hebrews unites reverence and confidence by making grace-filled access possible through Christ''s mediation.","Rest functions as an eschatological promise that calls for persevering faith in the present.","Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.","The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself."]'::jsonb, 'Hebrews unites reverence and confidence by making grace-filled access possible through Christ''s mediation.', 'This theological reading is grounded in Hebrews 4:16 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 4:16 within Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 5, 'What is the strongest theological reading of Hebrews 4:2 within Hebrews 4?', '["Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.","Rest functions as an eschatological promise that calls for persevering faith in the present.","The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself.","Hebrews presents revelation as active divine address that judges and unveils rather than merely informs."]'::jsonb, 'Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.', 'This theological reading is grounded in Hebrews 4:2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 4:2 within Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 4, 5, 'What is the strongest theological reading of Hebrews 4:8-9 within Hebrews 4?', '["The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself.","Rest functions as an eschatological promise that calls for persevering faith in the present.","Hebrews rejects any merely formal relation to revelation; faith is the fitting mode of reception.","Hebrews presents revelation as active divine address that judges and unveils rather than merely informs."]'::jsonb, 'The chapter rereads Israel''s history typologically, showing that Joshua''s rest pointed beyond itself.', 'This theological reading is grounded in Hebrews 4:8-9 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 4:8-9 within Hebrews 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 1, 'After whose order is Christ a priest forever?', '["The order of Melchizedek","The order of Aaron","The order of Moses","The order of Levi alone"]'::jsonb, 'The order of Melchizedek', 'Hebrews 5:6 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'After whose order is Christ a priest forever?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 1, 'From whom is every high priest taken according to Hebrews 5:1?', '["From among men","From among angels","From among kings","From among prophets only"]'::jsonb, 'From among men', 'Hebrews 5:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'From whom is every high priest taken according to Hebrews 5:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 1, 'How does a man receive the honor of the high priesthood according to Hebrews 5:4?', '["By being called by God, as Aaron was","By choosing it for himself","By inheriting a throne","By military victory"]'::jsonb, 'By being called by God, as Aaron was', 'Hebrews 5:4 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does a man receive the honor of the high priesthood according to Hebrews 5:4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 1, 'To whom did Christ become the author of eternal salvation in Hebrews 5:9?', '["To all who obey him","To angels only","To Levi''s descendants","To those who trust sacrifices"]'::jsonb, 'To all who obey him', 'Hebrews 5:9 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'To whom did Christ become the author of eternal salvation in Hebrews 5:9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 1, 'What did Jesus offer up in the days of his flesh according to Hebrews 5:7?', '["Prayers and supplications with strong crying and tears","Incense in the temple","Animal blood for himself","Fire from heaven"]'::jsonb, 'Prayers and supplications with strong crying and tears', 'Hebrews 5:7 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus offer up in the days of his flesh according to Hebrews 5:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 1, 'What did the Son learn by the things he suffered?', '["Obedience","How to rule angels","How to receive worship","How to avoid death"]'::jsonb, 'Obedience', 'Hebrews 5:8 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the Son learn by the things he suffered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 1, 'What food does Hebrews 5 say belongs to the mature?', '["Solid food","Milk only","Showbread","Manna from heaven"]'::jsonb, 'Solid food', 'Hebrews 5:12-14 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What food does Hebrews 5 say belongs to the mature?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 2, 'In context, what does Hebrews 5:1 emphasize?', '["Priestly representation requires genuine solidarity with the people represented.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer."]'::jsonb, 'Priestly representation requires genuine solidarity with the people represented.', 'This is the point made in context at Hebrews 5:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 5:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 2, 'In context, what does Hebrews 5:12-14 emphasize?', '["Spiritual maturity is marked by trained discernment rather than perpetual infancy.","Priestly representation requires genuine solidarity with the people represented.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one."]'::jsonb, 'Spiritual maturity is marked by trained discernment rather than perpetual infancy.', 'This is the point made in context at Hebrews 5:12-14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 5:12-14 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 2, 'In context, what does Hebrews 5:4 emphasize?', '["Priesthood is a divine calling, not a self-appointed office.","Priestly representation requires genuine solidarity with the people represented.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer."]'::jsonb, 'Priesthood is a divine calling, not a self-appointed office.', 'This is the point made in context at Hebrews 5:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 5:4 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 2, 'In context, what does Hebrews 5:6 emphasize?', '["Christ''s priesthood belongs to a different and superior order from the Levitical one.","Priestly representation requires genuine solidarity with the people represented.","Priesthood is a divine calling, not a self-appointed office.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer."]'::jsonb, 'Christ''s priesthood belongs to a different and superior order from the Levitical one.', 'This is the point made in context at Hebrews 5:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 5:6 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 2, 'In context, what does Hebrews 5:7 emphasize?', '["The Son''s earthly suffering involved real dependence, anguish, and obedient prayer.","Priestly representation requires genuine solidarity with the people represented.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one."]'::jsonb, 'The Son''s earthly suffering involved real dependence, anguish, and obedient prayer.', 'This is the point made in context at Hebrews 5:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 5:7 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 2, 'In context, what does Hebrews 5:8 emphasize?', '["His suffering was the arena in which filial obedience was fully enacted.","Priestly representation requires genuine solidarity with the people represented.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one."]'::jsonb, 'His suffering was the arena in which filial obedience was fully enacted.', 'This is the point made in context at Hebrews 5:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 5:8 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 2, 'In context, what does Hebrews 5:9 emphasize?', '["Saving benefit is tied to persevering allegiance to Christ.","Priestly representation requires genuine solidarity with the people represented.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one."]'::jsonb, 'Saving benefit is tied to persevering allegiance to Christ.', 'This is the point made in context at Hebrews 5:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 5:9 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 3, 'What is the best contextual significance of Hebrews 5:1 in Hebrews 5?', '["Priestly representation requires genuine solidarity with the people represented.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer.","His suffering was the arena in which filial obedience was fully enacted."]'::jsonb, 'Priestly representation requires genuine solidarity with the people represented.', 'The surrounding argument supports this significance at Hebrews 5:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 5:1 in Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 3, 'What is the best contextual significance of Hebrews 5:12-14 in Hebrews 5?', '["Spiritual maturity is marked by trained discernment rather than perpetual infancy.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer."]'::jsonb, 'Spiritual maturity is marked by trained discernment rather than perpetual infancy.', 'The surrounding argument supports this significance at Hebrews 5:12-14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 5:12-14 in Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 3, 'What is the best contextual significance of Hebrews 5:4 in Hebrews 5?', '["Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer.","His suffering was the arena in which filial obedience was fully enacted."]'::jsonb, 'Priesthood is a divine calling, not a self-appointed office.', 'The surrounding argument supports this significance at Hebrews 5:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 5:4 in Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 3, 'What is the best contextual significance of Hebrews 5:6 in Hebrews 5?', '["Christ''s priesthood belongs to a different and superior order from the Levitical one.","Priesthood is a divine calling, not a self-appointed office.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer.","His suffering was the arena in which filial obedience was fully enacted."]'::jsonb, 'Christ''s priesthood belongs to a different and superior order from the Levitical one.', 'The surrounding argument supports this significance at Hebrews 5:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 5:6 in Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 3, 'What is the best contextual significance of Hebrews 5:7 in Hebrews 5?', '["The Son''s earthly suffering involved real dependence, anguish, and obedient prayer.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","His suffering was the arena in which filial obedience was fully enacted."]'::jsonb, 'The Son''s earthly suffering involved real dependence, anguish, and obedient prayer.', 'The surrounding argument supports this significance at Hebrews 5:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 5:7 in Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 3, 'What is the best contextual significance of Hebrews 5:8 in Hebrews 5?', '["His suffering was the arena in which filial obedience was fully enacted.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer."]'::jsonb, 'His suffering was the arena in which filial obedience was fully enacted.', 'The surrounding argument supports this significance at Hebrews 5:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 5:8 in Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 3, 'What is the best contextual significance of Hebrews 5:9 in Hebrews 5?', '["Saving benefit is tied to persevering allegiance to Christ.","Priesthood is a divine calling, not a self-appointed office.","Christ''s priesthood belongs to a different and superior order from the Levitical one.","The Son''s earthly suffering involved real dependence, anguish, and obedient prayer."]'::jsonb, 'Saving benefit is tied to persevering allegiance to Christ.', 'The surrounding argument supports this significance at Hebrews 5:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 5:9 in Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 4, 'How does Hebrews 5:1 function in the broader argument of Hebrews 5?', '["The chapter explains priesthood in terms of human identification and divine appointment.","The chapter protects Christ''s priesthood from any charge of self-exaltation.","The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories.","Hebrews portrays Christ''s priestly fitness through lived suffering, not detached transcendence."]'::jsonb, 'The chapter explains priesthood in terms of human identification and divine appointment.', 'This synthesis fits the chapter''s broader argument around Hebrews 5:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 5:1 function in the broader argument of Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 4, 'How does Hebrews 5:12-14 function in the broader argument of Hebrews 5?', '["The chapter ends by rebuking dullness and calling the readers toward doctrinal and moral maturity.","The chapter explains priesthood in terms of human identification and divine appointment.","The chapter protects Christ''s priesthood from any charge of self-exaltation.","The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories."]'::jsonb, 'The chapter ends by rebuking dullness and calling the readers toward doctrinal and moral maturity.', 'This synthesis fits the chapter''s broader argument around Hebrews 5:12-14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 5:12-14 function in the broader argument of Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 4, 'How does Hebrews 5:4 function in the broader argument of Hebrews 5?', '["The chapter protects Christ''s priesthood from any charge of self-exaltation.","The chapter explains priesthood in terms of human identification and divine appointment.","The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories.","Hebrews portrays Christ''s priestly fitness through lived suffering, not detached transcendence."]'::jsonb, 'The chapter protects Christ''s priesthood from any charge of self-exaltation.', 'This synthesis fits the chapter''s broader argument around Hebrews 5:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 5:4 function in the broader argument of Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 4, 'How does Hebrews 5:6 function in the broader argument of Hebrews 5?', '["The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories.","The chapter explains priesthood in terms of human identification and divine appointment.","The chapter protects Christ''s priesthood from any charge of self-exaltation.","Hebrews portrays Christ''s priestly fitness through lived suffering, not detached transcendence."]'::jsonb, 'The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories.', 'This synthesis fits the chapter''s broader argument around Hebrews 5:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 5:6 function in the broader argument of Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 4, 'How does Hebrews 5:7 function in the broader argument of Hebrews 5?', '["Hebrews portrays Christ''s priestly fitness through lived suffering, not detached transcendence.","The chapter explains priesthood in terms of human identification and divine appointment.","The chapter protects Christ''s priesthood from any charge of self-exaltation.","The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories."]'::jsonb, 'Hebrews portrays Christ''s priestly fitness through lived suffering, not detached transcendence.', 'This synthesis fits the chapter''s broader argument around Hebrews 5:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 5:7 function in the broader argument of Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 4, 'How does Hebrews 5:8 function in the broader argument of Hebrews 5?', '["The chapter shows that the Son''s perfection is displayed through obedient endurance.","The chapter explains priesthood in terms of human identification and divine appointment.","The chapter protects Christ''s priesthood from any charge of self-exaltation.","The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories."]'::jsonb, 'The chapter shows that the Son''s perfection is displayed through obedient endurance.', 'This synthesis fits the chapter''s broader argument around Hebrews 5:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 5:8 function in the broader argument of Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 4, 'How does Hebrews 5:9 function in the broader argument of Hebrews 5?', '["Hebrews joins Christ''s completed work with the call for responsive obedience.","The chapter explains priesthood in terms of human identification and divine appointment.","The chapter protects Christ''s priesthood from any charge of self-exaltation.","The chapter introduces Melchizedek to expand the horizon beyond Aaronic categories."]'::jsonb, 'Hebrews joins Christ''s completed work with the call for responsive obedience.', 'This synthesis fits the chapter''s broader argument around Hebrews 5:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 5:9 function in the broader argument of Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 5, 'What is the strongest theological reading of Hebrews 5:1 within Hebrews 5?', '["Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.","Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.","This priestly order signals permanence and prepares the later argument for a better covenant.","The praying Son reveals that obedience is enacted in genuine human weakness and trust, not bypassed by divinity."]'::jsonb, 'Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.', 'This theological reading is grounded in Hebrews 5:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 5:1 within Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 5, 'What is the strongest theological reading of Hebrews 5:12-14 within Hebrews 5?', '["Hebrews treats theological immaturity as dangerous because it leaves people unable to discern and persevere.","Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.","Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.","This priestly order signals permanence and prepares the later argument for a better covenant."]'::jsonb, 'Hebrews treats theological immaturity as dangerous because it leaves people unable to discern and persevere.', 'This theological reading is grounded in Hebrews 5:12-14 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 5:12-14 within Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 5, 'What is the strongest theological reading of Hebrews 5:4 within Hebrews 5?', '["Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.","Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.","This priestly order signals permanence and prepares the later argument for a better covenant.","The praying Son reveals that obedience is enacted in genuine human weakness and trust, not bypassed by divinity."]'::jsonb, 'Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.', 'This theological reading is grounded in Hebrews 5:4 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 5:4 within Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 5, 'What is the strongest theological reading of Hebrews 5:6 within Hebrews 5?', '["This priestly order signals permanence and prepares the later argument for a better covenant.","Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.","Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.","The praying Son reveals that obedience is enacted in genuine human weakness and trust, not bypassed by divinity."]'::jsonb, 'This priestly order signals permanence and prepares the later argument for a better covenant.', 'This theological reading is grounded in Hebrews 5:6 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 5:6 within Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 5, 'What is the strongest theological reading of Hebrews 5:7 within Hebrews 5?', '["The praying Son reveals that obedience is enacted in genuine human weakness and trust, not bypassed by divinity.","Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.","Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.","This priestly order signals permanence and prepares the later argument for a better covenant."]'::jsonb, 'The praying Son reveals that obedience is enacted in genuine human weakness and trust, not bypassed by divinity.', 'This theological reading is grounded in Hebrews 5:7 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 5:7 within Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 5, 'What is the strongest theological reading of Hebrews 5:8 within Hebrews 5?', '["Learning obedience does not imply prior disobedience; it means experiential fulfillment of obedient sonship in suffering.","Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.","Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.","This priestly order signals permanence and prepares the later argument for a better covenant."]'::jsonb, 'Learning obedience does not imply prior disobedience; it means experiential fulfillment of obedient sonship in suffering.', 'This theological reading is grounded in Hebrews 5:8 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 5:8 within Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 5, 5, 'What is the strongest theological reading of Hebrews 5:9 within Hebrews 5?', '["The chapter resists any severing of salvation from discipleship; the perfected priest saves a persevering people.","Hebrews shows why Christ''s incarnation matters for priesthood: representation must be truly human.","Hebrews frames true priesthood as grounded in God''s oath and call rather than human ambition.","This priestly order signals permanence and prepares the later argument for a better covenant."]'::jsonb, 'The chapter resists any severing of salvation from discipleship; the perfected priest saves a persevering people.', 'This theological reading is grounded in Hebrews 5:9 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 5:9 within Hebrews 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 1, 'What does Hebrews 6 say is impossible for those who fall away?', '["To renew them again to repentance","To teach them doctrine","To forgive daily sins","To restore temple worship"]'::jsonb, 'To renew them again to repentance', 'Hebrews 6:4-6 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 6 say is impossible for those who fall away?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 1, 'What does Hebrews 6:1 urge believers to do?', '["Press on to maturity","Return to elementary shadows","Seek another mediator","Wait without diligence"]'::jsonb, 'Press on to maturity', 'Hebrews 6:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 6:1 urge believers to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 1, 'What does Hebrews 6:10 say God is not unrighteous to forget?', '["Their work and love shown toward his name","Their Levitical sacrifices","Their political suffering only","Their ancestry from Abraham"]'::jsonb, 'Their work and love shown toward his name', 'Hebrews 6:10 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 6:10 say God is not unrighteous to forget?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 1, 'What happens to land that bears thorns and thistles in Hebrews 6?', '["It is rejected and near to a curse, with an end to be burned","It becomes holy ground","It is stored for future harvest","It is given to the priests"]'::jsonb, 'It is rejected and near to a curse, with an end to be burned', 'Hebrews 6:7-8 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happens to land that bears thorns and thistles in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 1, 'What image does Hebrews 6 use for hope?', '["An anchor of the soul entering within the veil","A lamp in the wilderness","A sword for battle","A crown on the head"]'::jsonb, 'An anchor of the soul entering within the veil', 'Hebrews 6:19-20 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What image does Hebrews 6 use for hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 1, 'What is impossible for God according to Hebrews 6:18?', '["To lie","To judge the world","To hear prayer","To save through Christ"]'::jsonb, 'To lie', 'Hebrews 6:18 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is impossible for God according to Hebrews 6:18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 1, 'Whom does Hebrews 6:12 tell believers to imitate?', '["Those who through faith and patience inherit the promises","Those who seek signs","Those who keep the old sacrifices","Those who avoid suffering"]'::jsonb, 'Those who through faith and patience inherit the promises', 'Hebrews 6:12 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom does Hebrews 6:12 tell believers to imitate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 2, 'In context, what does Hebrews 6:1 emphasize?', '["The readers are urged not to remain at the stage of basic beginnings.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","After warning, the chapter encourages believers that God remembers faithful service."]'::jsonb, 'The readers are urged not to remain at the stage of basic beginnings.', 'This is the point made in context at Hebrews 6:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 6:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 2, 'In context, what does Hebrews 6:10 emphasize?', '["After warning, the chapter encourages believers that God remembers faithful service.","The readers are urged not to remain at the stage of basic beginnings.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment."]'::jsonb, 'After warning, the chapter encourages believers that God remembers faithful service.', 'This is the point made in context at Hebrews 6:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 6:10 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 2, 'In context, what does Hebrews 6:12 emphasize?', '["Inheritance comes through persevering faith rather than passivity.","The readers are urged not to remain at the stage of basic beginnings.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment."]'::jsonb, 'Inheritance comes through persevering faith rather than passivity.', 'This is the point made in context at Hebrews 6:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 6:12 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 2, 'In context, what does Hebrews 6:18 emphasize?', '["Believers are strengthened by the utter reliability of God''s promise and oath.","The readers are urged not to remain at the stage of basic beginnings.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment."]'::jsonb, 'Believers are strengthened by the utter reliability of God''s promise and oath.', 'This is the point made in context at Hebrews 6:18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 6:18 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 2, 'In context, what does Hebrews 6:19-20 emphasize?', '["Hope is stable because it is fixed in the heavenly presence where Jesus has gone ahead.","The readers are urged not to remain at the stage of basic beginnings.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment."]'::jsonb, 'Hope is stable because it is fixed in the heavenly presence where Jesus has gone ahead.', 'This is the point made in context at Hebrews 6:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 6:19-20 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 2, 'In context, what does Hebrews 6:4-6 emphasize?', '["The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","The readers are urged not to remain at the stage of basic beginnings.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","After warning, the chapter encourages believers that God remembers faithful service."]'::jsonb, 'The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.', 'This is the point made in context at Hebrews 6:4-6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 6:4-6 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 2, 'In context, what does Hebrews 6:7-8 emphasize?', '["Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","The readers are urged not to remain at the stage of basic beginnings.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","After warning, the chapter encourages believers that God remembers faithful service."]'::jsonb, 'Fruitlessness after repeated blessing is a picture of covenant failure under judgment.', 'This is the point made in context at Hebrews 6:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 6:7-8 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 3, 'What is the best contextual significance of Hebrews 6:1 in Hebrews 6?', '["The readers are urged not to remain at the stage of basic beginnings.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","After warning, the chapter encourages believers that God remembers faithful service.","Inheritance comes through persevering faith rather than passivity."]'::jsonb, 'The readers are urged not to remain at the stage of basic beginnings.', 'The surrounding argument supports this significance at Hebrews 6:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 6:1 in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 3, 'What is the best contextual significance of Hebrews 6:10 in Hebrews 6?', '["After warning, the chapter encourages believers that God remembers faithful service.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","Inheritance comes through persevering faith rather than passivity."]'::jsonb, 'After warning, the chapter encourages believers that God remembers faithful service.', 'The surrounding argument supports this significance at Hebrews 6:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 6:10 in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 3, 'What is the best contextual significance of Hebrews 6:12 in Hebrews 6?', '["Inheritance comes through persevering faith rather than passivity.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","After warning, the chapter encourages believers that God remembers faithful service."]'::jsonb, 'Inheritance comes through persevering faith rather than passivity.', 'The surrounding argument supports this significance at Hebrews 6:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 6:12 in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 3, 'What is the best contextual significance of Hebrews 6:18 in Hebrews 6?', '["Believers are strengthened by the utter reliability of God''s promise and oath.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","After warning, the chapter encourages believers that God remembers faithful service."]'::jsonb, 'Believers are strengthened by the utter reliability of God''s promise and oath.', 'The surrounding argument supports this significance at Hebrews 6:18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 6:18 in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 3, 'What is the best contextual significance of Hebrews 6:19-20 in Hebrews 6?', '["Hope is stable because it is fixed in the heavenly presence where Jesus has gone ahead.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","After warning, the chapter encourages believers that God remembers faithful service."]'::jsonb, 'Hope is stable because it is fixed in the heavenly presence where Jesus has gone ahead.', 'The surrounding argument supports this significance at Hebrews 6:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 6:19-20 in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 3, 'What is the best contextual significance of Hebrews 6:4-6 in Hebrews 6?', '["The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","After warning, the chapter encourages believers that God remembers faithful service.","Inheritance comes through persevering faith rather than passivity."]'::jsonb, 'The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.', 'The surrounding argument supports this significance at Hebrews 6:4-6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 6:4-6 in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 3, 'What is the best contextual significance of Hebrews 6:7-8 in Hebrews 6?', '["Fruitlessness after repeated blessing is a picture of covenant failure under judgment.","The warning highlights the grave seriousness of apostasy after deep exposure to covenant privileges.","After warning, the chapter encourages believers that God remembers faithful service.","Inheritance comes through persevering faith rather than passivity."]'::jsonb, 'Fruitlessness after repeated blessing is a picture of covenant failure under judgment.', 'The surrounding argument supports this significance at Hebrews 6:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 6:7-8 in Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 4, 'How does Hebrews 6:1 function in the broader argument of Hebrews 6?', '["The chapter links perseverance with movement toward full maturity rather than stagnation.","Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.","The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy.","Hebrews balances stern exhortation with pastoral assurance rooted in God''s justice."]'::jsonb, 'The chapter links perseverance with movement toward full maturity rather than stagnation.', 'This synthesis fits the chapter''s broader argument around Hebrews 6:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 6:1 function in the broader argument of Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 4, 'How does Hebrews 6:10 function in the broader argument of Hebrews 6?', '["Hebrews balances stern exhortation with pastoral assurance rooted in God''s justice.","The chapter links perseverance with movement toward full maturity rather than stagnation.","Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.","The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy."]'::jsonb, 'Hebrews balances stern exhortation with pastoral assurance rooted in God''s justice.', 'This synthesis fits the chapter''s broader argument around Hebrews 6:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 6:10 function in the broader argument of Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 4, 'How does Hebrews 6:12 function in the broader argument of Hebrews 6?', '["The chapter turns from warning toward faithful exemplars who model patient endurance.","The chapter links perseverance with movement toward full maturity rather than stagnation.","Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.","The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy."]'::jsonb, 'The chapter turns from warning toward faithful exemplars who model patient endurance.', 'This synthesis fits the chapter''s broader argument around Hebrews 6:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 6:12 function in the broader argument of Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 4, 'How does Hebrews 6:18 function in the broader argument of Hebrews 6?', '["The chapter grounds Christian hope in God''s unchangeable truthfulness.","The chapter links perseverance with movement toward full maturity rather than stagnation.","Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.","The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy."]'::jsonb, 'The chapter grounds Christian hope in God''s unchangeable truthfulness.', 'This synthesis fits the chapter''s broader argument around Hebrews 6:18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 6:18 function in the broader argument of Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 4, 'How does Hebrews 6:19-20 function in the broader argument of Hebrews 6?', '["The chapter joins assurance to Christ''s priestly forerunner ministry beyond the veil.","The chapter links perseverance with movement toward full maturity rather than stagnation.","Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.","The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy."]'::jsonb, 'The chapter joins assurance to Christ''s priestly forerunner ministry beyond the veil.', 'This synthesis fits the chapter''s broader argument around Hebrews 6:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 6:19-20 function in the broader argument of Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 4, 'How does Hebrews 6:4-6 function in the broader argument of Hebrews 6?', '["Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.","The chapter links perseverance with movement toward full maturity rather than stagnation.","The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy.","Hebrews balances stern exhortation with pastoral assurance rooted in God''s justice."]'::jsonb, 'Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.', 'This synthesis fits the chapter''s broader argument around Hebrews 6:4-6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 6:4-6 function in the broader argument of Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 4, 'How does Hebrews 6:7-8 function in the broader argument of Hebrews 6?', '["The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy.","The chapter links perseverance with movement toward full maturity rather than stagnation.","Hebrews uses severe language to shake complacency and expose the horror of repudiating the Son.","Hebrews balances stern exhortation with pastoral assurance rooted in God''s justice."]'::jsonb, 'The agricultural image turns warning into a visible contrast between fruitful endurance and barren apostasy.', 'This synthesis fits the chapter''s broader argument around Hebrews 6:7-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 6:7-8 function in the broader argument of Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 5, 'What is the strongest theological reading of Hebrews 6:1 within Hebrews 6?', '["In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.","The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.","Hebrews shows that privilege without fruit brings greater liability, not safety.","Divine remembrance here underlines covenant faithfulness: God does not overlook love-shaped perseverance."]'::jsonb, 'In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.', 'This theological reading is grounded in Hebrews 6:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 6:1 within Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 5, 'What is the strongest theological reading of Hebrews 6:10 within Hebrews 6?', '["Divine remembrance here underlines covenant faithfulness: God does not overlook love-shaped perseverance.","In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.","The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.","Hebrews shows that privilege without fruit brings greater liability, not safety."]'::jsonb, 'Divine remembrance here underlines covenant faithfulness: God does not overlook love-shaped perseverance.', 'This theological reading is grounded in Hebrews 6:10 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 6:10 within Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 5, 'What is the strongest theological reading of Hebrews 6:12 within Hebrews 6?', '["Faith in Hebrews is future-oriented endurance, not momentary enthusiasm.","In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.","The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.","Hebrews shows that privilege without fruit brings greater liability, not safety."]'::jsonb, 'Faith in Hebrews is future-oriented endurance, not momentary enthusiasm.', 'This theological reading is grounded in Hebrews 6:12 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 6:12 within Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 5, 'What is the strongest theological reading of Hebrews 6:18 within Hebrews 6?', '["Hope is secure because it rests on God''s immutable character, not on shifting human experience.","In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.","The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.","Hebrews shows that privilege without fruit brings greater liability, not safety."]'::jsonb, 'Hope is secure because it rests on God''s immutable character, not on shifting human experience.', 'This theological reading is grounded in Hebrews 6:18 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 6:18 within Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 5, 'What is the strongest theological reading of Hebrews 6:19-20 within Hebrews 6?', '["Hebrews relocates the believer''s security from earth to the heavenly sanctuary where the forerunner already stands.","In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.","The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.","Hebrews shows that privilege without fruit brings greater liability, not safety."]'::jsonb, 'Hebrews relocates the believer''s security from earth to the heavenly sanctuary where the forerunner already stands.', 'This theological reading is grounded in Hebrews 6:19-20 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 6:19-20 within Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 5, 'What is the strongest theological reading of Hebrews 6:4-6 within Hebrews 6?', '["The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.","In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.","Hebrews shows that privilege without fruit brings greater liability, not safety.","Divine remembrance here underlines covenant faithfulness: God does not overlook love-shaped perseverance."]'::jsonb, 'The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.', 'This theological reading is grounded in Hebrews 6:4-6 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 6:4-6 within Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 6, 5, 'What is the strongest theological reading of Hebrews 6:7-8 within Hebrews 6?', '["Hebrews shows that privilege without fruit brings greater liability, not safety.","In Hebrews, maturity is not optional enrichment; it is part of enduring faithfully to the end.","The impossibility passage portrays apostasy as public re-crucifixion in effect, not as ordinary weakness needing minor correction.","Divine remembrance here underlines covenant faithfulness: God does not overlook love-shaped perseverance."]'::jsonb, 'Hebrews shows that privilege without fruit brings greater liability, not safety.', 'This theological reading is grounded in Hebrews 6:7-8 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 6:7-8 within Hebrews 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 1, 'From which tribe did the Lord come according to Hebrews 7:14?', '["Judah","Levi","Benjamin","Ephraim"]'::jsonb, 'Judah', 'Hebrews 7:14 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'From which tribe did the Lord come according to Hebrews 7:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 1, 'What change follows from a change in the priesthood according to Hebrews 7:12?', '["A change in the law","A change in God''s character","A change in the promises","A change in creation"]'::jsonb, 'A change in the law', 'Hebrews 7:12 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What change follows from a change in the priesthood according to Hebrews 7:12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 1, 'What does the name Melchizedek mean according to Hebrews 7:2?', '["King of righteousness","Priest of sacrifice","Prince of armies","Keeper of the law"]'::jsonb, 'King of righteousness', 'Hebrews 7:2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the name Melchizedek mean according to Hebrews 7:2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 1, 'What has Jesus become in Hebrews 7:22?', '["The surety of a better covenant","The servant of the first covenant","The guardian of Sinai only","The mediator of angelic law"]'::jsonb, 'The surety of a better covenant', 'Hebrews 7:22 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What has Jesus become in Hebrews 7:22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 1, 'Who met Abraham returning from the slaughter of the kings?', '["Melchizedek king of Salem","Aaron the priest","Moses the lawgiver","Joshua son of Nun"]'::jsonb, 'Melchizedek king of Salem', 'Hebrews 7:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who met Abraham returning from the slaughter of the kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 1, 'Whom did Melchizedek bless in Hebrews 7?', '["Abraham","Levi","Moses","David"]'::jsonb, 'Abraham', 'Hebrews 7:6-7 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Melchizedek bless in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 1, 'Why is Jesus able to save to the uttermost those who draw near to God through him?', '["Because he always lives to make intercession for them","Because the temple still stands","Because the law is sufficient","Because angels complete his work"]'::jsonb, 'Because he always lives to make intercession for them', 'Hebrews 7:25 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why is Jesus able to save to the uttermost those who draw near to God through him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 2, 'In context, what does Hebrews 7:1 emphasize?', '["Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","A new priesthood cannot be contained within the former legal arrangement."]'::jsonb, 'Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.', 'This is the point made in context at Hebrews 7:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 7:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 2, 'In context, what does Hebrews 7:12 emphasize?', '["A new priesthood cannot be contained within the former legal arrangement.","Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham."]'::jsonb, 'A new priesthood cannot be contained within the former legal arrangement.', 'This is the point made in context at Hebrews 7:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 7:12 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 2, 'In context, what does Hebrews 7:14 emphasize?', '["Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent.","Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham."]'::jsonb, 'Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent.', 'This is the point made in context at Hebrews 7:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 7:14 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 2, 'In context, what does Hebrews 7:2 emphasize?', '["His name and title are used to symbolize righteous and peace-giving rule.","Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","A new priesthood cannot be contained within the former legal arrangement."]'::jsonb, 'His name and title are used to symbolize righteous and peace-giving rule.', 'This is the point made in context at Hebrews 7:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 7:2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 2, 'In context, what does Hebrews 7:22 emphasize?', '["Jesus personally guarantees a covenant superior to the old arrangement.","Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham."]'::jsonb, 'Jesus personally guarantees a covenant superior to the old arrangement.', 'This is the point made in context at Hebrews 7:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 7:22 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 2, 'In context, what does Hebrews 7:25 emphasize?', '["His ongoing life ensures the continuing effectiveness of his priestly ministry.","Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham."]'::jsonb, 'His ongoing life ensures the continuing effectiveness of his priestly ministry.', 'This is the point made in context at Hebrews 7:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 7:25 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 2, 'In context, what does Hebrews 7:6-7 emphasize?', '["Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","His name and title are used to symbolize righteous and peace-giving rule.","A new priesthood cannot be contained within the former legal arrangement."]'::jsonb, 'Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.', 'This is the point made in context at Hebrews 7:6-7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 7:6-7 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 3, 'What is the best contextual significance of Hebrews 7:1 in Hebrews 7?', '["Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","A new priesthood cannot be contained within the former legal arrangement.","Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent."]'::jsonb, 'Melchizedek enters as a priest-king who blesses Abraham and points beyond Levi.', 'The surrounding argument supports this significance at Hebrews 7:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 7:1 in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 3, 'What is the best contextual significance of Hebrews 7:12 in Hebrews 7?', '["A new priesthood cannot be contained within the former legal arrangement.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent."]'::jsonb, 'A new priesthood cannot be contained within the former legal arrangement.', 'The surrounding argument supports this significance at Hebrews 7:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 7:12 in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 3, 'What is the best contextual significance of Hebrews 7:14 in Hebrews 7?', '["Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","A new priesthood cannot be contained within the former legal arrangement."]'::jsonb, 'Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent.', 'The surrounding argument supports this significance at Hebrews 7:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 7:14 in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 3, 'What is the best contextual significance of Hebrews 7:2 in Hebrews 7?', '["His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","A new priesthood cannot be contained within the former legal arrangement.","Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent."]'::jsonb, 'His name and title are used to symbolize righteous and peace-giving rule.', 'The surrounding argument supports this significance at Hebrews 7:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 7:2 in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 3, 'What is the best contextual significance of Hebrews 7:22 in Hebrews 7?', '["Jesus personally guarantees a covenant superior to the old arrangement.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","A new priesthood cannot be contained within the former legal arrangement."]'::jsonb, 'Jesus personally guarantees a covenant superior to the old arrangement.', 'The surrounding argument supports this significance at Hebrews 7:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 7:22 in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 3, 'What is the best contextual significance of Hebrews 7:25 in Hebrews 7?', '["His ongoing life ensures the continuing effectiveness of his priestly ministry.","His name and title are used to symbolize righteous and peace-giving rule.","Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","A new priesthood cannot be contained within the former legal arrangement."]'::jsonb, 'His ongoing life ensures the continuing effectiveness of his priestly ministry.', 'The surrounding argument supports this significance at Hebrews 7:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 7:25 in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 3, 'What is the best contextual significance of Hebrews 7:6-7 in Hebrews 7?', '["Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.","His name and title are used to symbolize righteous and peace-giving rule.","A new priesthood cannot be contained within the former legal arrangement.","Jesus'' tribal origin confirms that his priesthood does not arise from Levitical descent."]'::jsonb, 'Because the greater blesses the lesser, Melchizedek is shown to stand above Abraham.', 'The surrounding argument supports this significance at Hebrews 7:6-7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 7:6-7 in Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 4, 'How does Hebrews 7:1 function in the broader argument of Hebrews 7?', '["The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.","The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.","The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi.","The chapter argues that Christ''s priesthood requires structural covenantal change, not minor adjustment."]'::jsonb, 'The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.', 'This synthesis fits the chapter''s broader argument around Hebrews 7:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 7:1 function in the broader argument of Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 4, 'How does Hebrews 7:12 function in the broader argument of Hebrews 7?', '["The chapter argues that Christ''s priesthood requires structural covenantal change, not minor adjustment.","The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.","The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.","The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi."]'::jsonb, 'The chapter argues that Christ''s priesthood requires structural covenantal change, not minor adjustment.', 'This synthesis fits the chapter''s broader argument around Hebrews 7:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 7:12 function in the broader argument of Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 4, 'How does Hebrews 7:14 function in the broader argument of Hebrews 7?', '["The chapter highlights Judah to prove that Christ''s priesthood rests on a different basis altogether.","The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.","The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.","The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi."]'::jsonb, 'The chapter highlights Judah to prove that Christ''s priesthood rests on a different basis altogether.', 'This synthesis fits the chapter''s broader argument around Hebrews 7:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 7:14 function in the broader argument of Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 4, 'How does Hebrews 7:2 function in the broader argument of Hebrews 7?', '["The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.","The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.","The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi.","The chapter argues that Christ''s priesthood requires structural covenantal change, not minor adjustment."]'::jsonb, 'The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.', 'This synthesis fits the chapter''s broader argument around Hebrews 7:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 7:2 function in the broader argument of Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 4, 'How does Hebrews 7:22 function in the broader argument of Hebrews 7?', '["The chapter moves from priesthood to covenant, showing that Christ''s person secures better access to God.","The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.","The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.","The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi."]'::jsonb, 'The chapter moves from priesthood to covenant, showing that Christ''s person secures better access to God.', 'This synthesis fits the chapter''s broader argument around Hebrews 7:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 7:22 function in the broader argument of Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 4, 'How does Hebrews 7:25 function in the broader argument of Hebrews 7?', '["The chapter contrasts dying priests with the ever-living Christ whose intercession never stops.","The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.","The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.","The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi."]'::jsonb, 'The chapter contrasts dying priests with the ever-living Christ whose intercession never stops.', 'This synthesis fits the chapter''s broader argument around Hebrews 7:25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 7:25 function in the broader argument of Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 4, 'How does Hebrews 7:6-7 function in the broader argument of Hebrews 7?', '["The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi.","The chapter uses Melchizedek to open a line of priesthood older and greater than the Levitical system.","The chapter reads Melchizedek''s very name as part of the argument for a fitting priest-king.","The chapter argues that Christ''s priesthood requires structural covenantal change, not minor adjustment."]'::jsonb, 'The blessing scene proves the superiority of Melchizedek''s order over Abraham and therefore over Levi.', 'This synthesis fits the chapter''s broader argument around Hebrews 7:6-7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 7:6-7 function in the broader argument of Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 5, 'What is the strongest theological reading of Hebrews 7:1 within Hebrews 7?', '["Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.","Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.","Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate.","Hebrews presents the priesthood shift as legally and covenantally decisive, showing the old order to be provisional."]'::jsonb, 'Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.', 'This theological reading is grounded in Hebrews 7:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 7:1 within Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 5, 'What is the strongest theological reading of Hebrews 7:12 within Hebrews 7?', '["Hebrews presents the priesthood shift as legally and covenantally decisive, showing the old order to be provisional.","Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.","Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.","Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate."]'::jsonb, 'Hebrews presents the priesthood shift as legally and covenantally decisive, showing the old order to be provisional.', 'This theological reading is grounded in Hebrews 7:12 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 7:12 within Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 5, 'What is the strongest theological reading of Hebrews 7:14 within Hebrews 7?', '["By locating Jesus in Judah, Hebrews underscores that his priesthood depends on divine oath and indestructible life, not genealogy.","Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.","Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.","Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate."]'::jsonb, 'By locating Jesus in Judah, Hebrews underscores that his priesthood depends on divine oath and indestructible life, not genealogy.', 'This theological reading is grounded in Hebrews 7:14 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 7:14 within Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 5, 'What is the strongest theological reading of Hebrews 7:2 within Hebrews 7?', '["Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.","Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.","Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate.","Hebrews presents the priesthood shift as legally and covenantally decisive, showing the old order to be provisional."]'::jsonb, 'Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.', 'This theological reading is grounded in Hebrews 7:2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 7:2 within Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 5, 'What is the strongest theological reading of Hebrews 7:22 within Hebrews 7?', '["The better covenant is not secured by a system alone but by the living Son who guarantees it.","Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.","Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.","Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate."]'::jsonb, 'The better covenant is not secured by a system alone but by the living Son who guarantees it.', 'This theological reading is grounded in Hebrews 7:22 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 7:22 within Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 5, 'What is the strongest theological reading of Hebrews 7:25 within Hebrews 7?', '["Hebrews roots full salvation in Christ''s indestructible life, making his priesthood permanently effective.","Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.","Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.","Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate."]'::jsonb, 'Hebrews roots full salvation in Christ''s indestructible life, making his priesthood permanently effective.', 'This theological reading is grounded in Hebrews 7:25 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 7:25 within Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 7, 5, 'What is the strongest theological reading of Hebrews 7:6-7 within Hebrews 7?', '["Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate.","Melchizedek functions typologically as a scriptural witness to a transcendent priesthood fulfilled in Christ.","Hebrews interprets Genesis with theological sensitivity, seeing in Melchizedek a pattern of royal-priestly righteousness and peace.","Hebrews presents the priesthood shift as legally and covenantally decisive, showing the old order to be provisional."]'::jsonb, 'Hebrews reasons covenantally: if Abraham is blessed by Melchizedek, the priesthood descending from Abraham is implicitly subordinate.', 'This theological reading is grounded in Hebrews 7:6-7 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 7:6-7 within Hebrews 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 1, 'How does Hebrews 8:5 describe the earthly priests'' service?', '["As a copy and shadow of the heavenly things","As the final form of worship","As equal to Christ''s ministry","As unnecessary from the beginning"]'::jsonb, 'As a copy and shadow of the heavenly things', 'Hebrews 8:5 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Hebrews 8:5 describe the earthly priests'' service?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 1, 'Of what better thing is Jesus the mediator in Hebrews 8:6?', '["A better covenant enacted on better promises","A stricter law with harsher penalties","An earthly throne in Jerusalem","A return to Aaronic worship"]'::jsonb, 'A better covenant enacted on better promises', 'Hebrews 8:6 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Of what better thing is Jesus the mediator in Hebrews 8:6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 1, 'What does God say he will remember no more in the new covenant?', '["Their sins and iniquities","Their sacrifices and offerings","Their wilderness journeys","Their tribal divisions"]'::jsonb, 'Their sins and iniquities', 'Hebrews 8:12-13 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does God say he will remember no more in the new covenant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 1, 'What tabernacle does Hebrews 8:2 call the true tabernacle?', '["The one the Lord pitched, not man","The tabernacle of Moses in the wilderness","Herod''s temple","The altar outside the camp"]'::jsonb, 'The one the Lord pitched, not man', 'Hebrews 8:2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What tabernacle does Hebrews 8:2 call the true tabernacle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 1, 'What universal knowledge marks the new covenant in Hebrews 8:11?', '["All shall know the Lord, from the least to the greatest","Only priests shall know the Lord","Only prophets shall know the Lord","Only Israel''s kings shall know the Lord"]'::jsonb, 'All shall know the Lord, from the least to the greatest', 'Hebrews 8:11 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What universal knowledge marks the new covenant in Hebrews 8:11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 1, 'Where does God say he will write his laws in the new covenant?', '["On their minds and on their hearts","On stone tablets only","On temple walls","On priestly garments"]'::jsonb, 'On their minds and on their hearts', 'Hebrews 8:10 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where does God say he will write his laws in the new covenant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 1, 'Where is the high priest seated according to Hebrews 8:1?', '["At the right hand of the throne of the Majesty in the heavens","In the earthly holy place","At Mount Sinai","Among the ministering angels"]'::jsonb, 'At the right hand of the throne of the Majesty in the heavens', 'Hebrews 8:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where is the high priest seated according to Hebrews 8:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 2, 'In context, what does Hebrews 8:1 emphasize?', '["Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself.","Christ''s ministry is superior because the covenant he mediates is superior."]'::jsonb, 'Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.', 'This is the point made in context at Hebrews 8:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 8:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 2, 'In context, what does Hebrews 8:10 emphasize?', '["The new covenant internalizes God''s will rather than relying on external inscription alone.","Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself."]'::jsonb, 'The new covenant internalizes God''s will rather than relying on external inscription alone.', 'This is the point made in context at Hebrews 8:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 8:10 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 2, 'In context, what does Hebrews 8:11 emphasize?', '["The covenant community is marked by a widespread personal knowledge of God.","Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself."]'::jsonb, 'The covenant community is marked by a widespread personal knowledge of God.', 'This is the point made in context at Hebrews 8:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 8:11 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 2, 'In context, what does Hebrews 8:12-13 emphasize?', '["Full forgiveness is central to the new covenant, rendering the former order obsolete.","Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself."]'::jsonb, 'Full forgiveness is central to the new covenant, rendering the former order obsolete.', 'This is the point made in context at Hebrews 8:12-13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 8:12-13 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 2, 'In context, what does Hebrews 8:2 emphasize?', '["The earthly sanctuary is not ultimate; the real one is established by God himself.","Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The old sanctuary was real but derivative, pointing beyond itself.","Christ''s ministry is superior because the covenant he mediates is superior."]'::jsonb, 'The earthly sanctuary is not ultimate; the real one is established by God himself.', 'This is the point made in context at Hebrews 8:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 8:2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 2, 'In context, what does Hebrews 8:5 emphasize?', '["The old sanctuary was real but derivative, pointing beyond itself.","Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The earthly sanctuary is not ultimate; the real one is established by God himself.","Christ''s ministry is superior because the covenant he mediates is superior."]'::jsonb, 'The old sanctuary was real but derivative, pointing beyond itself.', 'This is the point made in context at Hebrews 8:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 8:5 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 2, 'In context, what does Hebrews 8:6 emphasize?', '["Christ''s ministry is superior because the covenant he mediates is superior.","Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself."]'::jsonb, 'Christ''s ministry is superior because the covenant he mediates is superior.', 'This is the point made in context at Hebrews 8:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 8:6 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 3, 'What is the best contextual significance of Hebrews 8:1 in Hebrews 8?', '["Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.","The old sanctuary was real but derivative, pointing beyond itself.","Christ''s ministry is superior because the covenant he mediates is superior.","The new covenant internalizes God''s will rather than relying on external inscription alone."]'::jsonb, 'Christ''s priestly ministry is exercised from a heavenly position of completed exaltation.', 'The surrounding argument supports this significance at Hebrews 8:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 8:1 in Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 3, 'What is the best contextual significance of Hebrews 8:10 in Hebrews 8?', '["The new covenant internalizes God''s will rather than relying on external inscription alone.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself.","Christ''s ministry is superior because the covenant he mediates is superior."]'::jsonb, 'The new covenant internalizes God''s will rather than relying on external inscription alone.', 'The surrounding argument supports this significance at Hebrews 8:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 8:10 in Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 3, 'What is the best contextual significance of Hebrews 8:11 in Hebrews 8?', '["The covenant community is marked by a widespread personal knowledge of God.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself.","Christ''s ministry is superior because the covenant he mediates is superior."]'::jsonb, 'The covenant community is marked by a widespread personal knowledge of God.', 'The surrounding argument supports this significance at Hebrews 8:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 8:11 in Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 3, 'What is the best contextual significance of Hebrews 8:12-13 in Hebrews 8?', '["Full forgiveness is central to the new covenant, rendering the former order obsolete.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself.","Christ''s ministry is superior because the covenant he mediates is superior."]'::jsonb, 'Full forgiveness is central to the new covenant, rendering the former order obsolete.', 'The surrounding argument supports this significance at Hebrews 8:12-13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 8:12-13 in Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 3, 'What is the best contextual significance of Hebrews 8:2 in Hebrews 8?', '["The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself.","Christ''s ministry is superior because the covenant he mediates is superior.","The new covenant internalizes God''s will rather than relying on external inscription alone."]'::jsonb, 'The earthly sanctuary is not ultimate; the real one is established by God himself.', 'The surrounding argument supports this significance at Hebrews 8:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 8:2 in Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 3, 'What is the best contextual significance of Hebrews 8:5 in Hebrews 8?', '["The old sanctuary was real but derivative, pointing beyond itself.","The earthly sanctuary is not ultimate; the real one is established by God himself.","Christ''s ministry is superior because the covenant he mediates is superior.","The new covenant internalizes God''s will rather than relying on external inscription alone."]'::jsonb, 'The old sanctuary was real but derivative, pointing beyond itself.', 'The surrounding argument supports this significance at Hebrews 8:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 8:5 in Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 3, 'What is the best contextual significance of Hebrews 8:6 in Hebrews 8?', '["Christ''s ministry is superior because the covenant he mediates is superior.","The earthly sanctuary is not ultimate; the real one is established by God himself.","The old sanctuary was real but derivative, pointing beyond itself.","The new covenant internalizes God''s will rather than relying on external inscription alone."]'::jsonb, 'Christ''s ministry is superior because the covenant he mediates is superior.', 'The surrounding argument supports this significance at Hebrews 8:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 8:6 in Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 4, 'How does Hebrews 8:1 function in the broader argument of Hebrews 8?', '["The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.","The chapter contrasts earthly copies with the heavenly reality where Christ serves.","The chapter argues that the old cultus was intentionally typological rather than ultimate.","The chapter ties heavenly priesthood directly to covenantal renewal."]'::jsonb, 'The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.', 'This synthesis fits the chapter''s broader argument around Hebrews 8:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 8:1 function in the broader argument of Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 4, 'How does Hebrews 8:10 function in the broader argument of Hebrews 8?', '["The chapter emphasizes inward transformation as a defining mark of the new covenant.","The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.","The chapter contrasts earthly copies with the heavenly reality where Christ serves.","The chapter argues that the old cultus was intentionally typological rather than ultimate."]'::jsonb, 'The chapter emphasizes inward transformation as a defining mark of the new covenant.', 'This synthesis fits the chapter''s broader argument around Hebrews 8:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 8:10 function in the broader argument of Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 4, 'How does Hebrews 8:11 function in the broader argument of Hebrews 8?', '["The chapter highlights immediacy of covenant knowledge as part of the new era.","The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.","The chapter contrasts earthly copies with the heavenly reality where Christ serves.","The chapter argues that the old cultus was intentionally typological rather than ultimate."]'::jsonb, 'The chapter highlights immediacy of covenant knowledge as part of the new era.', 'This synthesis fits the chapter''s broader argument around Hebrews 8:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 8:11 function in the broader argument of Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 4, 'How does Hebrews 8:12-13 function in the broader argument of Hebrews 8?', '["The chapter ends by showing that forgiveness and obsolescence go together.","The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.","The chapter contrasts earthly copies with the heavenly reality where Christ serves.","The chapter argues that the old cultus was intentionally typological rather than ultimate."]'::jsonb, 'The chapter ends by showing that forgiveness and obsolescence go together.', 'This synthesis fits the chapter''s broader argument around Hebrews 8:12-13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 8:12-13 function in the broader argument of Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 4, 'How does Hebrews 8:2 function in the broader argument of Hebrews 8?', '["The chapter contrasts earthly copies with the heavenly reality where Christ serves.","The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.","The chapter argues that the old cultus was intentionally typological rather than ultimate.","The chapter ties heavenly priesthood directly to covenantal renewal."]'::jsonb, 'The chapter contrasts earthly copies with the heavenly reality where Christ serves.', 'This synthesis fits the chapter''s broader argument around Hebrews 8:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 8:2 function in the broader argument of Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 4, 'How does Hebrews 8:5 function in the broader argument of Hebrews 8?', '["The chapter argues that the old cultus was intentionally typological rather than ultimate.","The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.","The chapter contrasts earthly copies with the heavenly reality where Christ serves.","The chapter ties heavenly priesthood directly to covenantal renewal."]'::jsonb, 'The chapter argues that the old cultus was intentionally typological rather than ultimate.', 'This synthesis fits the chapter''s broader argument around Hebrews 8:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 8:5 function in the broader argument of Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 4, 'How does Hebrews 8:6 function in the broader argument of Hebrews 8?', '["The chapter ties heavenly priesthood directly to covenantal renewal.","The chapter''s chief point is that the church has a heavenly priest, not merely an earthly cultus.","The chapter contrasts earthly copies with the heavenly reality where Christ serves.","The chapter argues that the old cultus was intentionally typological rather than ultimate."]'::jsonb, 'The chapter ties heavenly priesthood directly to covenantal renewal.', 'This synthesis fits the chapter''s broader argument around Hebrews 8:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 8:6 function in the broader argument of Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 5, 'What is the strongest theological reading of Hebrews 8:1 within Hebrews 8?', '["His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.","Hebrews relocates worship from man-made shadows to the divine original in heaven.","Shadow language preserves the value of the old covenant while denying it finality.","Hebrews presents covenant superiority as inseparable from the person and ministry of Christ."]'::jsonb, 'His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.', 'This theological reading is grounded in Hebrews 8:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 8:1 within Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 5, 'What is the strongest theological reading of Hebrews 8:10 within Hebrews 8?', '["Hebrews interprets Jeremiah as promising not mere legal revision but covenantal re-creation of the people.","His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.","Hebrews relocates worship from man-made shadows to the divine original in heaven.","Shadow language preserves the value of the old covenant while denying it finality."]'::jsonb, 'Hebrews interprets Jeremiah as promising not mere legal revision but covenantal re-creation of the people.', 'This theological reading is grounded in Hebrews 8:10 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 8:10 within Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 5, 'What is the strongest theological reading of Hebrews 8:11 within Hebrews 8?', '["The promise signals a democratized covenant life in which access to God is no longer restricted to a spiritual elite.","His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.","Hebrews relocates worship from man-made shadows to the divine original in heaven.","Shadow language preserves the value of the old covenant while denying it finality."]'::jsonb, 'The promise signals a democratized covenant life in which access to God is no longer restricted to a spiritual elite.', 'This theological reading is grounded in Hebrews 8:11 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 8:11 within Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 5, 'What is the strongest theological reading of Hebrews 8:12-13 within Hebrews 8?', '["Once sins are finally remembered no more, the old covenant order is shown to be aging toward disappearance.","His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.","Hebrews relocates worship from man-made shadows to the divine original in heaven.","Shadow language preserves the value of the old covenant while denying it finality."]'::jsonb, 'Once sins are finally remembered no more, the old covenant order is shown to be aging toward disappearance.', 'This theological reading is grounded in Hebrews 8:12-13 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 8:12-13 within Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 5, 'What is the strongest theological reading of Hebrews 8:2 within Hebrews 8?', '["Hebrews relocates worship from man-made shadows to the divine original in heaven.","His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.","Shadow language preserves the value of the old covenant while denying it finality.","Hebrews presents covenant superiority as inseparable from the person and ministry of Christ."]'::jsonb, 'Hebrews relocates worship from man-made shadows to the divine original in heaven.', 'This theological reading is grounded in Hebrews 8:2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 8:2 within Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 5, 'What is the strongest theological reading of Hebrews 8:5 within Hebrews 8?', '["Shadow language preserves the value of the old covenant while denying it finality.","His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.","Hebrews relocates worship from man-made shadows to the divine original in heaven.","Hebrews presents covenant superiority as inseparable from the person and ministry of Christ."]'::jsonb, 'Shadow language preserves the value of the old covenant while denying it finality.', 'This theological reading is grounded in Hebrews 8:5 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 8:5 within Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 8, 5, 'What is the strongest theological reading of Hebrews 8:6 within Hebrews 8?', '["Hebrews presents covenant superiority as inseparable from the person and ministry of Christ.","His seated position means royal authority and finished sacrifice, redefining priestly ministry in heavenly terms.","Hebrews relocates worship from man-made shadows to the divine original in heaven.","Shadow language preserves the value of the old covenant while denying it finality."]'::jsonb, 'Hebrews presents covenant superiority as inseparable from the person and ministry of Christ.', 'This theological reading is grounded in Hebrews 8:6 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 8:6 within Hebrews 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 1, 'By what did Christ enter the holy place once for all according to Hebrews 9:12?', '["By his own blood","By the blood of goats and calves","By incense only","By the prayers of angels"]'::jsonb, 'By his own blood', 'Hebrews 9:12 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'By what did Christ enter the holy place once for all according to Hebrews 9:12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 1, 'For what is Christ the mediator according to Hebrews 9:15?', '["A new covenant","The covenant at Sinai only","An angelic administration","A political kingdom on earth"]'::jsonb, 'A new covenant', 'Hebrews 9:15 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'For what is Christ the mediator according to Hebrews 9:15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 1, 'How many times was Christ offered to bear the sins of many?', '["Once","Year by year","Twice, before and after resurrection","Once for Israel and once for the nations"]'::jsonb, 'Once', 'Hebrews 9:28 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many times was Christ offered to bear the sins of many?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 1, 'How often did the high priest enter the second tabernacle according to Hebrews 9:7?', '["Once a year","Every Sabbath","Every month","Whenever Israel sinned"]'::jsonb, 'Once a year', 'Hebrews 9:7 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'How often did the high priest enter the second tabernacle according to Hebrews 9:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 1, 'What did the first covenant have according to Hebrews 9:1?', '["Ordinances of divine service and an earthly sanctuary","A heavenly priest already seated","Final forgiveness of sins","An everlasting perfect conscience"]'::jsonb, 'Ordinances of divine service and an earthly sanctuary', 'Hebrews 9:1-2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the first covenant have according to Hebrews 9:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 1, 'What does Hebrews 9:22 say is necessary for remission?', '["The shedding of blood","Strict Sabbath keeping","Genealogical purity","Pilgrimage to Jerusalem"]'::jsonb, 'The shedding of blood', 'Hebrews 9:22 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 9:22 say is necessary for remission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 1, 'What does the blood of Christ cleanse according to Hebrews 9:14?', '["The conscience from dead works to serve the living God","The temple furniture only","The body from ritual dust","The land of Canaan"]'::jsonb, 'The conscience from dead works to serve the living God', 'Hebrews 9:14 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the blood of Christ cleanse according to Hebrews 9:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 2, 'In context, what does Hebrews 9:1-2 emphasize?', '["The old covenant had a real earthly worship structure, but it was not the final reality.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","Christ''s sacrifice reaches the inner person in a way old rites could not."]'::jsonb, 'The old covenant had a real earthly worship structure, but it was not the final reality.', 'This is the point made in context at Hebrews 9:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 9:1-2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 2, 'In context, what does Hebrews 9:12 emphasize?', '["Christ secures redemption through his own self-offering rather than borrowed animal blood.","The old covenant had a real earthly worship structure, but it was not the final reality.","Restricted access showed that the way into God''s full presence was not yet open.","Christ''s sacrifice reaches the inner person in a way old rites could not."]'::jsonb, 'Christ secures redemption through his own self-offering rather than borrowed animal blood.', 'This is the point made in context at Hebrews 9:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 9:12 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 2, 'In context, what does Hebrews 9:14 emphasize?', '["Christ''s sacrifice reaches the inner person in a way old rites could not.","The old covenant had a real earthly worship structure, but it was not the final reality.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood."]'::jsonb, 'Christ''s sacrifice reaches the inner person in a way old rites could not.', 'This is the point made in context at Hebrews 9:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 9:14 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 2, 'In context, what does Hebrews 9:15 emphasize?', '["His death redeems transgressions under the first covenant and secures promised inheritance.","The old covenant had a real earthly worship structure, but it was not the final reality.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood."]'::jsonb, 'His death redeems transgressions under the first covenant and secures promised inheritance.', 'This is the point made in context at Hebrews 9:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 9:15 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 2, 'In context, what does Hebrews 9:22 emphasize?', '["Forgiveness is grounded in sacrificial death, not in bare ritual effort.","The old covenant had a real earthly worship structure, but it was not the final reality.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood."]'::jsonb, 'Forgiveness is grounded in sacrificial death, not in bare ritual effort.', 'This is the point made in context at Hebrews 9:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 9:22 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 2, 'In context, what does Hebrews 9:28 emphasize?', '["His sacrifice is final and sufficient, unlike repeated old covenant offerings.","The old covenant had a real earthly worship structure, but it was not the final reality.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood."]'::jsonb, 'His sacrifice is final and sufficient, unlike repeated old covenant offerings.', 'This is the point made in context at Hebrews 9:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 9:28 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 2, 'In context, what does Hebrews 9:7 emphasize?', '["Restricted access showed that the way into God''s full presence was not yet open.","The old covenant had a real earthly worship structure, but it was not the final reality.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","Christ''s sacrifice reaches the inner person in a way old rites could not."]'::jsonb, 'Restricted access showed that the way into God''s full presence was not yet open.', 'This is the point made in context at Hebrews 9:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 9:7 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 3, 'What is the best contextual significance of Hebrews 9:1-2 in Hebrews 9?', '["The old covenant had a real earthly worship structure, but it was not the final reality.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","Christ''s sacrifice reaches the inner person in a way old rites could not.","His death redeems transgressions under the first covenant and secures promised inheritance."]'::jsonb, 'The old covenant had a real earthly worship structure, but it was not the final reality.', 'The surrounding argument supports this significance at Hebrews 9:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 9:1-2 in Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 3, 'What is the best contextual significance of Hebrews 9:12 in Hebrews 9?', '["Christ secures redemption through his own self-offering rather than borrowed animal blood.","Restricted access showed that the way into God''s full presence was not yet open.","Christ''s sacrifice reaches the inner person in a way old rites could not.","His death redeems transgressions under the first covenant and secures promised inheritance."]'::jsonb, 'Christ secures redemption through his own self-offering rather than borrowed animal blood.', 'The surrounding argument supports this significance at Hebrews 9:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 9:12 in Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 3, 'What is the best contextual significance of Hebrews 9:14 in Hebrews 9?', '["Christ''s sacrifice reaches the inner person in a way old rites could not.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","His death redeems transgressions under the first covenant and secures promised inheritance."]'::jsonb, 'Christ''s sacrifice reaches the inner person in a way old rites could not.', 'The surrounding argument supports this significance at Hebrews 9:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 9:14 in Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 3, 'What is the best contextual significance of Hebrews 9:15 in Hebrews 9?', '["His death redeems transgressions under the first covenant and secures promised inheritance.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","Christ''s sacrifice reaches the inner person in a way old rites could not."]'::jsonb, 'His death redeems transgressions under the first covenant and secures promised inheritance.', 'The surrounding argument supports this significance at Hebrews 9:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 9:15 in Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 3, 'What is the best contextual significance of Hebrews 9:22 in Hebrews 9?', '["Forgiveness is grounded in sacrificial death, not in bare ritual effort.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","Christ''s sacrifice reaches the inner person in a way old rites could not."]'::jsonb, 'Forgiveness is grounded in sacrificial death, not in bare ritual effort.', 'The surrounding argument supports this significance at Hebrews 9:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 9:22 in Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 3, 'What is the best contextual significance of Hebrews 9:28 in Hebrews 9?', '["His sacrifice is final and sufficient, unlike repeated old covenant offerings.","Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","Christ''s sacrifice reaches the inner person in a way old rites could not."]'::jsonb, 'His sacrifice is final and sufficient, unlike repeated old covenant offerings.', 'The surrounding argument supports this significance at Hebrews 9:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 9:28 in Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 3, 'What is the best contextual significance of Hebrews 9:7 in Hebrews 9?', '["Restricted access showed that the way into God''s full presence was not yet open.","Christ secures redemption through his own self-offering rather than borrowed animal blood.","Christ''s sacrifice reaches the inner person in a way old rites could not.","His death redeems transgressions under the first covenant and secures promised inheritance."]'::jsonb, 'Restricted access showed that the way into God''s full presence was not yet open.', 'The surrounding argument supports this significance at Hebrews 9:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 9:7 in Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 4, 'How does Hebrews 9:1-2 function in the broader argument of Hebrews 9?', '["The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.","The chapter uses ritual limitation to expose the incompleteness of the old order.","The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice.","The chapter contrasts external ritual cleansing with inward conscience cleansing."]'::jsonb, 'The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.', 'This synthesis fits the chapter''s broader argument around Hebrews 9:1-2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 9:1-2 function in the broader argument of Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 4, 'How does Hebrews 9:12 function in the broader argument of Hebrews 9?', '["The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice.","The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.","The chapter uses ritual limitation to expose the incompleteness of the old order.","The chapter contrasts external ritual cleansing with inward conscience cleansing."]'::jsonb, 'The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice.', 'This synthesis fits the chapter''s broader argument around Hebrews 9:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 9:12 function in the broader argument of Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 4, 'How does Hebrews 9:14 function in the broader argument of Hebrews 9?', '["The chapter contrasts external ritual cleansing with inward conscience cleansing.","The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.","The chapter uses ritual limitation to expose the incompleteness of the old order.","The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice."]'::jsonb, 'The chapter contrasts external ritual cleansing with inward conscience cleansing.', 'This synthesis fits the chapter''s broader argument around Hebrews 9:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 9:14 function in the broader argument of Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 4, 'How does Hebrews 9:15 function in the broader argument of Hebrews 9?', '["The chapter links covenant mediation to substitutionary death and inheritance.","The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.","The chapter uses ritual limitation to expose the incompleteness of the old order.","The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice."]'::jsonb, 'The chapter links covenant mediation to substitutionary death and inheritance.', 'This synthesis fits the chapter''s broader argument around Hebrews 9:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 9:15 function in the broader argument of Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 4, 'How does Hebrews 9:22 function in the broader argument of Hebrews 9?', '["The chapter shows continuity between covenant forgiveness and blood while climaxing in Christ''s better sacrifice.","The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.","The chapter uses ritual limitation to expose the incompleteness of the old order.","The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice."]'::jsonb, 'The chapter shows continuity between covenant forgiveness and blood while climaxing in Christ''s better sacrifice.', 'This synthesis fits the chapter''s broader argument around Hebrews 9:22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 9:22 function in the broader argument of Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 4, 'How does Hebrews 9:28 function in the broader argument of Hebrews 9?', '["The chapter ends by pairing Christ''s once-offered sacrifice with his future appearing for salvation.","The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.","The chapter uses ritual limitation to expose the incompleteness of the old order.","The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice."]'::jsonb, 'The chapter ends by pairing Christ''s once-offered sacrifice with his future appearing for salvation.', 'This synthesis fits the chapter''s broader argument around Hebrews 9:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 9:28 function in the broader argument of Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 4, 'How does Hebrews 9:7 function in the broader argument of Hebrews 9?', '["The chapter uses ritual limitation to expose the incompleteness of the old order.","The chapter starts by describing the old sanctuary to prepare for contrast with Christ''s greater ministry.","The chapter centers Christ''s priestly entrance on the unique worth of his sacrifice.","The chapter contrasts external ritual cleansing with inward conscience cleansing."]'::jsonb, 'The chapter uses ritual limitation to expose the incompleteness of the old order.', 'This synthesis fits the chapter''s broader argument around Hebrews 9:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 9:7 function in the broader argument of Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 5, 'What is the strongest theological reading of Hebrews 9:1-2 within Hebrews 9?', '["Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.","Annual entry with blood dramatized distance from God and the repetitive nature of the former system.","His own blood signals both priest and victim united in one decisive act of redemption.","Hebrews presents the blood of Christ as effecting deep covenant transformation, not mere ceremonial adjustment."]'::jsonb, 'Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.', 'This theological reading is grounded in Hebrews 9:1-2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 9:1-2 within Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 5, 'What is the strongest theological reading of Hebrews 9:12 within Hebrews 9?', '["His own blood signals both priest and victim united in one decisive act of redemption.","Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.","Annual entry with blood dramatized distance from God and the repetitive nature of the former system.","Hebrews presents the blood of Christ as effecting deep covenant transformation, not mere ceremonial adjustment."]'::jsonb, 'His own blood signals both priest and victim united in one decisive act of redemption.', 'This theological reading is grounded in Hebrews 9:12 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 9:12 within Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 5, 'What is the strongest theological reading of Hebrews 9:14 within Hebrews 9?', '["Hebrews presents the blood of Christ as effecting deep covenant transformation, not mere ceremonial adjustment.","Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.","Annual entry with blood dramatized distance from God and the repetitive nature of the former system.","His own blood signals both priest and victim united in one decisive act of redemption."]'::jsonb, 'Hebrews presents the blood of Christ as effecting deep covenant transformation, not mere ceremonial adjustment.', 'This theological reading is grounded in Hebrews 9:14 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 9:14 within Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 5, 'What is the strongest theological reading of Hebrews 9:15 within Hebrews 9?', '["Christ mediates not only by teaching but by dying so that heirs may truly receive the promised inheritance.","Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.","Annual entry with blood dramatized distance from God and the repetitive nature of the former system.","His own blood signals both priest and victim united in one decisive act of redemption."]'::jsonb, 'Christ mediates not only by teaching but by dying so that heirs may truly receive the promised inheritance.', 'This theological reading is grounded in Hebrews 9:15 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 9:15 within Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 5, 'What is the strongest theological reading of Hebrews 9:22 within Hebrews 9?', '["Hebrews insists that divine forgiveness is not casual; it is achieved through a costly sacrificial logic fulfilled by Christ.","Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.","Annual entry with blood dramatized distance from God and the repetitive nature of the former system.","His own blood signals both priest and victim united in one decisive act of redemption."]'::jsonb, 'Hebrews insists that divine forgiveness is not casual; it is achieved through a costly sacrificial logic fulfilled by Christ.', 'This theological reading is grounded in Hebrews 9:22 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 9:22 within Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 5, 'What is the strongest theological reading of Hebrews 9:28 within Hebrews 9?', '["Hebrews ties final atonement and eschatological hope together: the once-offered Christ will return not to repeat sacrifice but to consummate salvation.","Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.","Annual entry with blood dramatized distance from God and the repetitive nature of the former system.","His own blood signals both priest and victim united in one decisive act of redemption."]'::jsonb, 'Hebrews ties final atonement and eschatological hope together: the once-offered Christ will return not to repeat sacrifice but to consummate salvation.', 'This theological reading is grounded in Hebrews 9:28 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 9:28 within Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 9, 5, 'What is the strongest theological reading of Hebrews 9:7 within Hebrews 9?', '["Annual entry with blood dramatized distance from God and the repetitive nature of the former system.","Hebrews does not dismiss the first covenant as false; it marks it as provisional and worldly in location.","His own blood signals both priest and victim united in one decisive act of redemption.","Hebrews presents the blood of Christ as effecting deep covenant transformation, not mere ceremonial adjustment."]'::jsonb, 'Annual entry with blood dramatized distance from God and the repetitive nature of the former system.', 'This theological reading is grounded in Hebrews 9:7 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 9:7 within Hebrews 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 1, 'By one offering, what has Christ done according to Hebrews 10:14?', '["Perfected forever those who are being sanctified","Improved the old sacrifices slightly","Perfected angels for service","Delayed final judgment"]'::jsonb, 'Perfected forever those who are being sanctified', 'Hebrews 10:14 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'By one offering, what has Christ done according to Hebrews 10:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 1, 'By what do believers have boldness to enter the holy place?', '["By the blood of Jesus, through the new and living way","By Levitical ancestry","By keeping food laws","By Sinai''s covenant rituals"]'::jsonb, 'By the blood of Jesus, through the new and living way', 'Hebrews 10:19-20 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'By what do believers have boldness to enter the holy place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 1, 'How do the righteous live according to Hebrews 10:38?', '["By faith","By sacrifices","By sight","By priestly lineage"]'::jsonb, 'By faith', 'Hebrews 10:38-39 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'How do the righteous live according to Hebrews 10:38?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 1, 'How have believers been sanctified according to Hebrews 10:10?', '["Through the offering of the body of Jesus Christ once for all","Through yearly Day of Atonement rituals","Through angelic mediation","Through personal zeal alone"]'::jsonb, 'Through the offering of the body of Jesus Christ once for all', 'Hebrews 10:10 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'How have believers been sanctified according to Hebrews 10:10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 1, 'What does Hebrews 10:1 say the law has?', '["A shadow of the good things to come","The final image of reality","The power to perfect the conscience fully","The throne of grace itself"]'::jsonb, 'A shadow of the good things to come', 'Hebrews 10:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 10:1 say the law has?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 1, 'What is impossible according to Hebrews 10:4?', '["That the blood of bulls and goats should take away sins","That God should forgive","That priests should minister daily","That believers should draw near"]'::jsonb, 'That the blood of bulls and goats should take away sins', 'Hebrews 10:4 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is impossible according to Hebrews 10:4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 1, 'What should believers consider doing for one another according to Hebrews 10:24?', '["Provoking one another to love and good works","Competing for spiritual rank","Returning to temple sacrifices","Waiting in private isolation"]'::jsonb, 'Provoking one another to love and good works', 'Hebrews 10:24-25 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What should believers consider doing for one another according to Hebrews 10:24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 2, 'In context, what does Hebrews 10:1 emphasize?', '["The law pointed ahead but could not itself bring final perfection.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering.","A single sacrifice secures lasting efficacy for God''s people."]'::jsonb, 'The law pointed ahead but could not itself bring final perfection.', 'This is the point made in context at Hebrews 10:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 10:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 2, 'In context, what does Hebrews 10:10 emphasize?', '["Sanctification is rooted in Christ''s definitive sacrificial offering.","The law pointed ahead but could not itself bring final perfection.","Animal sacrifices could symbolize but not accomplish final removal of sin.","A single sacrifice secures lasting efficacy for God''s people."]'::jsonb, 'Sanctification is rooted in Christ''s definitive sacrificial offering.', 'This is the point made in context at Hebrews 10:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 10:10 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 2, 'In context, what does Hebrews 10:14 emphasize?', '["A single sacrifice secures lasting efficacy for God''s people.","The law pointed ahead but could not itself bring final perfection.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering."]'::jsonb, 'A single sacrifice secures lasting efficacy for God''s people.', 'This is the point made in context at Hebrews 10:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 10:14 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 2, 'In context, what does Hebrews 10:19-20 emphasize?', '["Christ''s death opens direct access to God that the old system could not provide.","The law pointed ahead but could not itself bring final perfection.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering."]'::jsonb, 'Christ''s death opens direct access to God that the old system could not provide.', 'This is the point made in context at Hebrews 10:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 10:19-20 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 2, 'In context, what does Hebrews 10:24-25 emphasize?', '["Perseverance is nurtured through active mutual encouragement within the gathered community.","The law pointed ahead but could not itself bring final perfection.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering."]'::jsonb, 'Perseverance is nurtured through active mutual encouragement within the gathered community.', 'This is the point made in context at Hebrews 10:24-25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 10:24-25 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 2, 'In context, what does Hebrews 10:38-39 emphasize?', '["Endurance to the end is marked by faith rather than shrinking back.","The law pointed ahead but could not itself bring final perfection.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering."]'::jsonb, 'Endurance to the end is marked by faith rather than shrinking back.', 'This is the point made in context at Hebrews 10:38-39.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 10:38-39 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 2, 'In context, what does Hebrews 10:4 emphasize?', '["Animal sacrifices could symbolize but not accomplish final removal of sin.","The law pointed ahead but could not itself bring final perfection.","Sanctification is rooted in Christ''s definitive sacrificial offering.","A single sacrifice secures lasting efficacy for God''s people."]'::jsonb, 'Animal sacrifices could symbolize but not accomplish final removal of sin.', 'This is the point made in context at Hebrews 10:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 10:4 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 3, 'What is the best contextual significance of Hebrews 10:1 in Hebrews 10?', '["The law pointed ahead but could not itself bring final perfection.","Sanctification is rooted in Christ''s definitive sacrificial offering.","A single sacrifice secures lasting efficacy for God''s people.","Christ''s death opens direct access to God that the old system could not provide."]'::jsonb, 'The law pointed ahead but could not itself bring final perfection.', 'The surrounding argument supports this significance at Hebrews 10:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 10:1 in Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 3, 'What is the best contextual significance of Hebrews 10:10 in Hebrews 10?', '["Sanctification is rooted in Christ''s definitive sacrificial offering.","Animal sacrifices could symbolize but not accomplish final removal of sin.","A single sacrifice secures lasting efficacy for God''s people.","Christ''s death opens direct access to God that the old system could not provide."]'::jsonb, 'Sanctification is rooted in Christ''s definitive sacrificial offering.', 'The surrounding argument supports this significance at Hebrews 10:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 10:10 in Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 3, 'What is the best contextual significance of Hebrews 10:14 in Hebrews 10?', '["A single sacrifice secures lasting efficacy for God''s people.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering.","Christ''s death opens direct access to God that the old system could not provide."]'::jsonb, 'A single sacrifice secures lasting efficacy for God''s people.', 'The surrounding argument supports this significance at Hebrews 10:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 10:14 in Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 3, 'What is the best contextual significance of Hebrews 10:19-20 in Hebrews 10?', '["Christ''s death opens direct access to God that the old system could not provide.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering.","A single sacrifice secures lasting efficacy for God''s people."]'::jsonb, 'Christ''s death opens direct access to God that the old system could not provide.', 'The surrounding argument supports this significance at Hebrews 10:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 10:19-20 in Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 3, 'What is the best contextual significance of Hebrews 10:24-25 in Hebrews 10?', '["Perseverance is nurtured through active mutual encouragement within the gathered community.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering.","A single sacrifice secures lasting efficacy for God''s people."]'::jsonb, 'Perseverance is nurtured through active mutual encouragement within the gathered community.', 'The surrounding argument supports this significance at Hebrews 10:24-25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 10:24-25 in Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 3, 'What is the best contextual significance of Hebrews 10:38-39 in Hebrews 10?', '["Endurance to the end is marked by faith rather than shrinking back.","Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering.","A single sacrifice secures lasting efficacy for God''s people."]'::jsonb, 'Endurance to the end is marked by faith rather than shrinking back.', 'The surrounding argument supports this significance at Hebrews 10:38-39.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 10:38-39 in Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 3, 'What is the best contextual significance of Hebrews 10:4 in Hebrews 10?', '["Animal sacrifices could symbolize but not accomplish final removal of sin.","Sanctification is rooted in Christ''s definitive sacrificial offering.","A single sacrifice secures lasting efficacy for God''s people.","Christ''s death opens direct access to God that the old system could not provide."]'::jsonb, 'Animal sacrifices could symbolize but not accomplish final removal of sin.', 'The surrounding argument supports this significance at Hebrews 10:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 10:4 in Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 4, 'How does Hebrews 10:1 function in the broader argument of Hebrews 10?', '["The chapter begins by showing why repeated sacrifices signal incompleteness.","The chapter strips away misplaced confidence in repetitive animal offerings.","The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act.","The chapter contrasts the standing priest of repetition with the seated Christ of completion."]'::jsonb, 'The chapter begins by showing why repeated sacrifices signal incompleteness.', 'This synthesis fits the chapter''s broader argument around Hebrews 10:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 10:1 function in the broader argument of Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 4, 'How does Hebrews 10:10 function in the broader argument of Hebrews 10?', '["The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act.","The chapter begins by showing why repeated sacrifices signal incompleteness.","The chapter strips away misplaced confidence in repetitive animal offerings.","The chapter contrasts the standing priest of repetition with the seated Christ of completion."]'::jsonb, 'The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act.', 'This synthesis fits the chapter''s broader argument around Hebrews 10:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 10:10 function in the broader argument of Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 4, 'How does Hebrews 10:14 function in the broader argument of Hebrews 10?', '["The chapter contrasts the standing priest of repetition with the seated Christ of completion.","The chapter begins by showing why repeated sacrifices signal incompleteness.","The chapter strips away misplaced confidence in repetitive animal offerings.","The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act."]'::jsonb, 'The chapter contrasts the standing priest of repetition with the seated Christ of completion.', 'This synthesis fits the chapter''s broader argument around Hebrews 10:14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 10:14 function in the broader argument of Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 4, 'How does Hebrews 10:19-20 function in the broader argument of Hebrews 10?', '["The chapter moves from doctrinal exposition to practical confidence in worship.","The chapter begins by showing why repeated sacrifices signal incompleteness.","The chapter strips away misplaced confidence in repetitive animal offerings.","The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act."]'::jsonb, 'The chapter moves from doctrinal exposition to practical confidence in worship.', 'This synthesis fits the chapter''s broader argument around Hebrews 10:19-20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 10:19-20 function in the broader argument of Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 4, 'How does Hebrews 10:24-25 function in the broader argument of Hebrews 10?', '["The chapter makes endurance a shared church practice rather than a solitary project.","The chapter begins by showing why repeated sacrifices signal incompleteness.","The chapter strips away misplaced confidence in repetitive animal offerings.","The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act."]'::jsonb, 'The chapter makes endurance a shared church practice rather than a solitary project.', 'This synthesis fits the chapter''s broader argument around Hebrews 10:24-25.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 10:24-25 function in the broader argument of Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 4, 'How does Hebrews 10:38-39 function in the broader argument of Hebrews 10?', '["The chapter ends by pivoting from warning to the faith that will dominate chapter 11.","The chapter begins by showing why repeated sacrifices signal incompleteness.","The chapter strips away misplaced confidence in repetitive animal offerings.","The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act."]'::jsonb, 'The chapter ends by pivoting from warning to the faith that will dominate chapter 11.', 'This synthesis fits the chapter''s broader argument around Hebrews 10:38-39.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 10:38-39 function in the broader argument of Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 4, 'How does Hebrews 10:4 function in the broader argument of Hebrews 10?', '["The chapter strips away misplaced confidence in repetitive animal offerings.","The chapter begins by showing why repeated sacrifices signal incompleteness.","The chapter identifies Jesus'' embodied obedience and sacrifice as the decisive saving act.","The chapter contrasts the standing priest of repetition with the seated Christ of completion."]'::jsonb, 'The chapter strips away misplaced confidence in repetitive animal offerings.', 'This synthesis fits the chapter''s broader argument around Hebrews 10:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 10:4 function in the broader argument of Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 5, 'What is the strongest theological reading of Hebrews 10:1 within Hebrews 10?', '["Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.","Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.","Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering.","Hebrews can speak of present sanctification and perfected status together because Christ''s work is decisive even as its effects unfold in the people."]'::jsonb, 'Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.', 'This theological reading is grounded in Hebrews 10:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 10:1 within Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 5, 'What is the strongest theological reading of Hebrews 10:10 within Hebrews 10?', '["Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering.","Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.","Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.","Hebrews can speak of present sanctification and perfected status together because Christ''s work is decisive even as its effects unfold in the people."]'::jsonb, 'Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering.', 'This theological reading is grounded in Hebrews 10:10 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 10:10 within Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 5, 'What is the strongest theological reading of Hebrews 10:14 within Hebrews 10?', '["Hebrews can speak of present sanctification and perfected status together because Christ''s work is decisive even as its effects unfold in the people.","Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.","Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.","Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering."]'::jsonb, 'Hebrews can speak of present sanctification and perfected status together because Christ''s work is decisive even as its effects unfold in the people.', 'This theological reading is grounded in Hebrews 10:14 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 10:14 within Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 5, 'What is the strongest theological reading of Hebrews 10:19-20 within Hebrews 10?', '["Access language shows that Christ''s sacrifice does not merely forgive from afar; it ushers believers into God''s presence.","Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.","Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.","Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering."]'::jsonb, 'Access language shows that Christ''s sacrifice does not merely forgive from afar; it ushers believers into God''s presence.', 'This theological reading is grounded in Hebrews 10:19-20 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 10:19-20 within Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 5, 'What is the strongest theological reading of Hebrews 10:24-25 within Hebrews 10?', '["Hebrews treats public assembly as a means of grace for perseverance, especially as the Day approaches.","Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.","Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.","Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering."]'::jsonb, 'Hebrews treats public assembly as a means of grace for perseverance, especially as the Day approaches.', 'This theological reading is grounded in Hebrews 10:24-25 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 10:24-25 within Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 5, 'What is the strongest theological reading of Hebrews 10:38-39 within Hebrews 10?', '["Hebrews uses Habakkuk to define the faithful life as steadfast trust under pressure rather than retreat into unbelief.","Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.","Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.","Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering."]'::jsonb, 'Hebrews uses Habakkuk to define the faithful life as steadfast trust under pressure rather than retreat into unbelief.', 'This theological reading is grounded in Hebrews 10:38-39 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 10:38-39 within Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 10, 5, 'What is the strongest theological reading of Hebrews 10:4 within Hebrews 10?', '["Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.","Shadow language frames the old cult as anticipatory, requiring fulfillment in Christ rather than repetition.","Once-for-all sanctification in Hebrews rests on the incarnate Son doing the Father''s will in a single effective offering.","Hebrews can speak of present sanctification and perfected status together because Christ''s work is decisive even as its effects unfold in the people."]'::jsonb, 'Hebrews presses the insufficiency of animal blood to show the necessity of the incarnate Son''s self-offering.', 'This theological reading is grounded in Hebrews 10:4 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 10:4 within Hebrews 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 1, 'How does Hebrews 11:1 define faith?', '["Assurance of things hoped for and conviction of things not seen","Certainty about visible rituals only","Freedom from all suffering","Possession of earthly power"]'::jsonb, 'Assurance of things hoped for and conviction of things not seen', 'Hebrews 11:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Hebrews 11:1 define faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 1, 'What city was Abraham looking for according to Hebrews 11:10?', '["The city with foundations whose builder and maker is God","Jerusalem under David","Babylon restored","Salem under Melchizedek"]'::jsonb, 'The city with foundations whose builder and maker is God', 'Hebrews 11:10 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What city was Abraham looking for according to Hebrews 11:10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 1, 'What did some refuse in order to obtain a better resurrection?', '["Release or deliverance","Temple service","The Passover","Their family inheritance"]'::jsonb, 'Release or deliverance', 'Hebrews 11:35 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did some refuse in order to obtain a better resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 1, 'What do we understand by faith according to Hebrews 11:3?', '["That the worlds were framed by the word of God","That matter is eternal","That angels created the earth","That creation is self-made"]'::jsonb, 'That the worlds were framed by the word of God', 'Hebrews 11:3 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What do we understand by faith according to Hebrews 11:3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 1, 'What is impossible without faith according to Hebrews 11:6?', '["To be well-pleasing to God","To understand the law","To receive earthly wealth","To join Abraham''s family tree"]'::jsonb, 'To be well-pleasing to God', 'Hebrews 11:6 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is impossible without faith according to Hebrews 11:6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 1, 'Who offered a more excellent sacrifice than Cain according to Hebrews 11?', '["Abel","Enoch","Noah","Isaac"]'::jsonb, 'Abel', 'Hebrews 11:4 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who offered a more excellent sacrifice than Cain according to Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 1, 'Why were the faithful of old not made perfect apart from us?', '["Because God had provided something better concerning us","Because they lacked true faith","Because the law condemned them alone","Because they were waiting for angels"]'::jsonb, 'Because God had provided something better concerning us', 'Hebrews 11:39-40 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why were the faithful of old not made perfect apart from us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 2, 'In context, what does Hebrews 11:1 emphasize?', '["Faith is confident trust in God''s promised realities even when they are not visible.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith.","Faith is indispensable because it approaches God as real and rewarding."]'::jsonb, 'Faith is confident trust in God''s promised realities even when they are not visible.', 'This is the point made in context at Hebrews 11:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 11:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 2, 'In context, what does Hebrews 11:10 emphasize?', '["Abraham''s faith reached beyond land possession to a God-built future homeland.","Faith is confident trust in God''s promised realities even when they are not visible.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith."]'::jsonb, 'Abraham''s faith reached beyond land possession to a God-built future homeland.', 'This is the point made in context at Hebrews 11:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 11:10 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 2, 'In context, what does Hebrews 11:3 emphasize?', '["Faith receives creation itself as grounded in God''s powerful speech.","Faith is confident trust in God''s promised realities even when they are not visible.","Abel''s offering is remembered as an expression of righteous faith.","Faith is indispensable because it approaches God as real and rewarding."]'::jsonb, 'Faith receives creation itself as grounded in God''s powerful speech.', 'This is the point made in context at Hebrews 11:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 11:3 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 2, 'In context, what does Hebrews 11:35 emphasize?', '["Faith sometimes accepts suffering rather than compromising for temporary escape.","Faith is confident trust in God''s promised realities even when they are not visible.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith."]'::jsonb, 'Faith sometimes accepts suffering rather than compromising for temporary escape.', 'This is the point made in context at Hebrews 11:35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 11:35 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 2, 'In context, what does Hebrews 11:39-40 emphasize?', '["The faithful of previous ages await the shared completion of God''s plan with the new covenant people.","Faith is confident trust in God''s promised realities even when they are not visible.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith."]'::jsonb, 'The faithful of previous ages await the shared completion of God''s plan with the new covenant people.', 'This is the point made in context at Hebrews 11:39-40.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 11:39-40 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 2, 'In context, what does Hebrews 11:4 emphasize?', '["Abel''s offering is remembered as an expression of righteous faith.","Faith is confident trust in God''s promised realities even when they are not visible.","Faith receives creation itself as grounded in God''s powerful speech.","Faith is indispensable because it approaches God as real and rewarding."]'::jsonb, 'Abel''s offering is remembered as an expression of righteous faith.', 'This is the point made in context at Hebrews 11:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 11:4 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 2, 'In context, what does Hebrews 11:6 emphasize?', '["Faith is indispensable because it approaches God as real and rewarding.","Faith is confident trust in God''s promised realities even when they are not visible.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith."]'::jsonb, 'Faith is indispensable because it approaches God as real and rewarding.', 'This is the point made in context at Hebrews 11:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 11:6 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 3, 'What is the best contextual significance of Hebrews 11:1 in Hebrews 11?', '["Faith is confident trust in God''s promised realities even when they are not visible.","Abel''s offering is remembered as an expression of righteous faith.","Faith is indispensable because it approaches God as real and rewarding.","Abraham''s faith reached beyond land possession to a God-built future homeland."]'::jsonb, 'Faith is confident trust in God''s promised realities even when they are not visible.', 'The surrounding argument supports this significance at Hebrews 11:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 11:1 in Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 3, 'What is the best contextual significance of Hebrews 11:10 in Hebrews 11?', '["Abraham''s faith reached beyond land possession to a God-built future homeland.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith.","Faith is indispensable because it approaches God as real and rewarding."]'::jsonb, 'Abraham''s faith reached beyond land possession to a God-built future homeland.', 'The surrounding argument supports this significance at Hebrews 11:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 11:10 in Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 3, 'What is the best contextual significance of Hebrews 11:3 in Hebrews 11?', '["Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith.","Faith is indispensable because it approaches God as real and rewarding.","Abraham''s faith reached beyond land possession to a God-built future homeland."]'::jsonb, 'Faith receives creation itself as grounded in God''s powerful speech.', 'The surrounding argument supports this significance at Hebrews 11:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 11:3 in Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 3, 'What is the best contextual significance of Hebrews 11:35 in Hebrews 11?', '["Faith sometimes accepts suffering rather than compromising for temporary escape.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith.","Faith is indispensable because it approaches God as real and rewarding."]'::jsonb, 'Faith sometimes accepts suffering rather than compromising for temporary escape.', 'The surrounding argument supports this significance at Hebrews 11:35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 11:35 in Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 3, 'What is the best contextual significance of Hebrews 11:39-40 in Hebrews 11?', '["The faithful of previous ages await the shared completion of God''s plan with the new covenant people.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith.","Faith is indispensable because it approaches God as real and rewarding."]'::jsonb, 'The faithful of previous ages await the shared completion of God''s plan with the new covenant people.', 'The surrounding argument supports this significance at Hebrews 11:39-40.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 11:39-40 in Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 3, 'What is the best contextual significance of Hebrews 11:4 in Hebrews 11?', '["Abel''s offering is remembered as an expression of righteous faith.","Faith receives creation itself as grounded in God''s powerful speech.","Faith is indispensable because it approaches God as real and rewarding.","Abraham''s faith reached beyond land possession to a God-built future homeland."]'::jsonb, 'Abel''s offering is remembered as an expression of righteous faith.', 'The surrounding argument supports this significance at Hebrews 11:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 11:4 in Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 3, 'What is the best contextual significance of Hebrews 11:6 in Hebrews 11?', '["Faith is indispensable because it approaches God as real and rewarding.","Faith receives creation itself as grounded in God''s powerful speech.","Abel''s offering is remembered as an expression of righteous faith.","Abraham''s faith reached beyond land possession to a God-built future homeland."]'::jsonb, 'Faith is indispensable because it approaches God as real and rewarding.', 'The surrounding argument supports this significance at Hebrews 11:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 11:6 in Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 4, 'How does Hebrews 11:1 function in the broader argument of Hebrews 11?', '["The chapter defines faith before illustrating it in the lives of the elders.","The chapter begins with creation to show that faith rests in God''s word from the start.","The chapter portrays faith as ancient and costly from the earliest generations.","The chapter universalizes faith as the necessary posture of every true approach to God."]'::jsonb, 'The chapter defines faith before illustrating it in the lives of the elders.', 'This synthesis fits the chapter''s broader argument around Hebrews 11:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 11:1 function in the broader argument of Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 4, 'How does Hebrews 11:10 function in the broader argument of Hebrews 11?', '["The chapter interprets patriarchal faith as oriented toward heavenly permanence, not merely earthly settlement.","The chapter defines faith before illustrating it in the lives of the elders.","The chapter begins with creation to show that faith rests in God''s word from the start.","The chapter portrays faith as ancient and costly from the earliest generations."]'::jsonb, 'The chapter interprets patriarchal faith as oriented toward heavenly permanence, not merely earthly settlement.', 'This synthesis fits the chapter''s broader argument around Hebrews 11:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 11:10 function in the broader argument of Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 4, 'How does Hebrews 11:3 function in the broader argument of Hebrews 11?', '["The chapter begins with creation to show that faith rests in God''s word from the start.","The chapter defines faith before illustrating it in the lives of the elders.","The chapter portrays faith as ancient and costly from the earliest generations.","The chapter universalizes faith as the necessary posture of every true approach to God."]'::jsonb, 'The chapter begins with creation to show that faith rests in God''s word from the start.', 'This synthesis fits the chapter''s broader argument around Hebrews 11:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 11:3 function in the broader argument of Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 4, 'How does Hebrews 11:35 function in the broader argument of Hebrews 11?', '["The chapter broadens faith beyond triumph to include steadfast endurance under torture.","The chapter defines faith before illustrating it in the lives of the elders.","The chapter begins with creation to show that faith rests in God''s word from the start.","The chapter portrays faith as ancient and costly from the earliest generations."]'::jsonb, 'The chapter broadens faith beyond triumph to include steadfast endurance under torture.', 'This synthesis fits the chapter''s broader argument around Hebrews 11:35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 11:35 function in the broader argument of Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 4, 'How does Hebrews 11:39-40 function in the broader argument of Hebrews 11?', '["The chapter ends by joining past saints and present believers in one unfolding purpose of God.","The chapter defines faith before illustrating it in the lives of the elders.","The chapter begins with creation to show that faith rests in God''s word from the start.","The chapter portrays faith as ancient and costly from the earliest generations."]'::jsonb, 'The chapter ends by joining past saints and present believers in one unfolding purpose of God.', 'This synthesis fits the chapter''s broader argument around Hebrews 11:39-40.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 11:39-40 function in the broader argument of Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 4, 'How does Hebrews 11:4 function in the broader argument of Hebrews 11?', '["The chapter portrays faith as ancient and costly from the earliest generations.","The chapter defines faith before illustrating it in the lives of the elders.","The chapter begins with creation to show that faith rests in God''s word from the start.","The chapter universalizes faith as the necessary posture of every true approach to God."]'::jsonb, 'The chapter portrays faith as ancient and costly from the earliest generations.', 'This synthesis fits the chapter''s broader argument around Hebrews 11:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 11:4 function in the broader argument of Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 4, 'How does Hebrews 11:6 function in the broader argument of Hebrews 11?', '["The chapter universalizes faith as the necessary posture of every true approach to God.","The chapter defines faith before illustrating it in the lives of the elders.","The chapter begins with creation to show that faith rests in God''s word from the start.","The chapter portrays faith as ancient and costly from the earliest generations."]'::jsonb, 'The chapter universalizes faith as the necessary posture of every true approach to God.', 'This synthesis fits the chapter''s broader argument around Hebrews 11:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 11:6 function in the broader argument of Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 5, 'What is the strongest theological reading of Hebrews 11:1 within Hebrews 11?', '["Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.","Hebrews links faith and ontology: what is seen depends on the unseen speaking God.","Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper.","Hebrews grounds faith in God''s character, not in bare optimism: he is, and he rewards seekers."]'::jsonb, 'Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.', 'This theological reading is grounded in Hebrews 11:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 11:1 within Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 5, 'What is the strongest theological reading of Hebrews 11:10 within Hebrews 11?', '["Hebrews re-reads the patriarchal story eschatologically: the true inheritance is a divine city beyond present geography.","Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.","Hebrews links faith and ontology: what is seen depends on the unseen speaking God.","Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper."]'::jsonb, 'Hebrews re-reads the patriarchal story eschatologically: the true inheritance is a divine city beyond present geography.', 'This theological reading is grounded in Hebrews 11:10 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 11:10 within Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 5, 'What is the strongest theological reading of Hebrews 11:3 within Hebrews 11?', '["Hebrews links faith and ontology: what is seen depends on the unseen speaking God.","Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.","Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper.","Hebrews grounds faith in God''s character, not in bare optimism: he is, and he rewards seekers."]'::jsonb, 'Hebrews links faith and ontology: what is seen depends on the unseen speaking God.', 'This theological reading is grounded in Hebrews 11:3 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 11:3 within Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 5, 'What is the strongest theological reading of Hebrews 11:35 within Hebrews 11?', '["Hebrews dismantles any shallow triumphalism by presenting resurrection hope as stronger than the instinct for immediate relief.","Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.","Hebrews links faith and ontology: what is seen depends on the unseen speaking God.","Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper."]'::jsonb, 'Hebrews dismantles any shallow triumphalism by presenting resurrection hope as stronger than the instinct for immediate relief.', 'This theological reading is grounded in Hebrews 11:35 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 11:35 within Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 5, 'What is the strongest theological reading of Hebrews 11:39-40 within Hebrews 11?', '["Hebrews presents redemptive history as a unified drama whose consummation comes corporately in Christ, not in isolated eras.","Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.","Hebrews links faith and ontology: what is seen depends on the unseen speaking God.","Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper."]'::jsonb, 'Hebrews presents redemptive history as a unified drama whose consummation comes corporately in Christ, not in isolated eras.', 'This theological reading is grounded in Hebrews 11:39-40 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 11:39-40 within Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 5, 'What is the strongest theological reading of Hebrews 11:4 within Hebrews 11?', '["Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper.","Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.","Hebrews links faith and ontology: what is seen depends on the unseen speaking God.","Hebrews grounds faith in God''s character, not in bare optimism: he is, and he rewards seekers."]'::jsonb, 'Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper.', 'This theological reading is grounded in Hebrews 11:4 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 11:4 within Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 11, 5, 'What is the strongest theological reading of Hebrews 11:6 within Hebrews 11?', '["Hebrews grounds faith in God''s character, not in bare optimism: he is, and he rewards seekers.","Hebrews presents faith as eschatological perception shaped by God''s word rather than by visible conditions.","Hebrews links faith and ontology: what is seen depends on the unseen speaking God.","Abel''s continuing witness shows that faith outlives death because God vindicates the righteous worshiper."]'::jsonb, 'Hebrews grounds faith in God''s character, not in bare optimism: he is, and he rewards seekers.', 'This theological reading is grounded in Hebrews 11:6 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 11:6 within Hebrews 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 1, 'To what mountain have believers come according to Hebrews 12:22?', '["Mount Zion, the city of the living God, the heavenly Jerusalem","Mount Sinai in the wilderness","Mount Carmel","Mount Gerizim"]'::jsonb, 'Mount Zion, the city of the living God, the heavenly Jerusalem', 'Hebrews 12:22-24 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'To what mountain have believers come according to Hebrews 12:22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 1, 'What are believers receiving according to Hebrews 12:28?', '["A kingdom that cannot be shaken","An earthly priesthood that passes away","A temporary rest in Canaan","A yearly sacrifice for sin"]'::jsonb, 'A kingdom that cannot be shaken', 'Hebrews 12:28-29 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What are believers receiving according to Hebrews 12:28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 1, 'What does Hebrews 12:1 say believers should lay aside?', '["Every weight and the sin that so easily entangles","The promises of God","The cloud of witnesses","The hope of resurrection"]'::jsonb, 'Every weight and the sin that so easily entangles', 'Hebrews 12:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 12:1 say believers should lay aside?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 1, 'What does discipline yield afterward according to Hebrews 12:11?', '["The peaceable fruit of righteousness","Immediate earthly ease","Levitical authority","Freedom from all weakness"]'::jsonb, 'The peaceable fruit of righteousness', 'Hebrews 12:11 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does discipline yield afterward according to Hebrews 12:11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 1, 'Who is given as the warning example of a profane person in Hebrews 12?', '["Esau","Cain","Saul","Achan"]'::jsonb, 'Esau', 'Hebrews 12:16 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is given as the warning example of a profane person in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 1, 'Whom does the Lord discipline according to Hebrews 12:6?', '["The one he loves","Only his enemies","Only priests","Only kings of Israel"]'::jsonb, 'The one he loves', 'Hebrews 12:6 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom does the Lord discipline according to Hebrews 12:6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 1, 'Whom should believers look to according to Hebrews 12:2?', '["Jesus, the author and perfecter of faith","Moses, the servant of the house","Aaron, the first priest","Abraham, the father of many nations"]'::jsonb, 'Jesus, the author and perfecter of faith', 'Hebrews 12:2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom should believers look to according to Hebrews 12:2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 2, 'In context, what does Hebrews 12:1 emphasize?', '["The race of faith requires renouncing whatever hinders endurance.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","God''s discipline is painful now but productive in moral and spiritual fruit."]'::jsonb, 'The race of faith requires renouncing whatever hinders endurance.', 'This is the point made in context at Hebrews 12:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 12:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 2, 'In context, what does Hebrews 12:11 emphasize?', '["God''s discipline is painful now but productive in moral and spiritual fruit.","The race of faith requires renouncing whatever hinders endurance.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment."]'::jsonb, 'God''s discipline is painful now but productive in moral and spiritual fruit.', 'This is the point made in context at Hebrews 12:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 12:11 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 2, 'In context, what does Hebrews 12:16 emphasize?', '["Esau represents trading enduring inheritance for immediate appetite.","The race of faith requires renouncing whatever hinders endurance.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment."]'::jsonb, 'Esau represents trading enduring inheritance for immediate appetite.', 'This is the point made in context at Hebrews 12:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 12:16 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 2, 'In context, what does Hebrews 12:2 emphasize?', '["Jesus is both the model and completer of the faithful path.","The race of faith requires renouncing whatever hinders endurance.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","God''s discipline is painful now but productive in moral and spiritual fruit."]'::jsonb, 'Jesus is both the model and completer of the faithful path.', 'This is the point made in context at Hebrews 12:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 12:2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 2, 'In context, what does Hebrews 12:22-24 emphasize?', '["Believers belong to a heavenly assembly marked by joy, access, and covenant mediation.","The race of faith requires renouncing whatever hinders endurance.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment."]'::jsonb, 'Believers belong to a heavenly assembly marked by joy, access, and covenant mediation.', 'This is the point made in context at Hebrews 12:22-24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 12:22-24 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 2, 'In context, what does Hebrews 12:28-29 emphasize?', '["Because their inheritance is unshakable, believers should worship with reverence and awe.","The race of faith requires renouncing whatever hinders endurance.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment."]'::jsonb, 'Because their inheritance is unshakable, believers should worship with reverence and awe.', 'This is the point made in context at Hebrews 12:28-29.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 12:28-29 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 2, 'In context, what does Hebrews 12:6 emphasize?', '["Suffering under God''s hand is interpreted as filial discipline, not abandonment.","The race of faith requires renouncing whatever hinders endurance.","Jesus is both the model and completer of the faithful path.","God''s discipline is painful now but productive in moral and spiritual fruit."]'::jsonb, 'Suffering under God''s hand is interpreted as filial discipline, not abandonment.', 'This is the point made in context at Hebrews 12:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 12:6 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 3, 'What is the best contextual significance of Hebrews 12:1 in Hebrews 12?', '["The race of faith requires renouncing whatever hinders endurance.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","God''s discipline is painful now but productive in moral and spiritual fruit.","Esau represents trading enduring inheritance for immediate appetite."]'::jsonb, 'The race of faith requires renouncing whatever hinders endurance.', 'The surrounding argument supports this significance at Hebrews 12:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 12:1 in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 3, 'What is the best contextual significance of Hebrews 12:11 in Hebrews 12?', '["God''s discipline is painful now but productive in moral and spiritual fruit.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","Esau represents trading enduring inheritance for immediate appetite."]'::jsonb, 'God''s discipline is painful now but productive in moral and spiritual fruit.', 'The surrounding argument supports this significance at Hebrews 12:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 12:11 in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 3, 'What is the best contextual significance of Hebrews 12:16 in Hebrews 12?', '["Esau represents trading enduring inheritance for immediate appetite.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","God''s discipline is painful now but productive in moral and spiritual fruit."]'::jsonb, 'Esau represents trading enduring inheritance for immediate appetite.', 'The surrounding argument supports this significance at Hebrews 12:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 12:16 in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 3, 'What is the best contextual significance of Hebrews 12:2 in Hebrews 12?', '["Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","God''s discipline is painful now but productive in moral and spiritual fruit.","Esau represents trading enduring inheritance for immediate appetite."]'::jsonb, 'Jesus is both the model and completer of the faithful path.', 'The surrounding argument supports this significance at Hebrews 12:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 12:2 in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 3, 'What is the best contextual significance of Hebrews 12:22-24 in Hebrews 12?', '["Believers belong to a heavenly assembly marked by joy, access, and covenant mediation.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","God''s discipline is painful now but productive in moral and spiritual fruit."]'::jsonb, 'Believers belong to a heavenly assembly marked by joy, access, and covenant mediation.', 'The surrounding argument supports this significance at Hebrews 12:22-24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 12:22-24 in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 3, 'What is the best contextual significance of Hebrews 12:28-29 in Hebrews 12?', '["Because their inheritance is unshakable, believers should worship with reverence and awe.","Jesus is both the model and completer of the faithful path.","Suffering under God''s hand is interpreted as filial discipline, not abandonment.","God''s discipline is painful now but productive in moral and spiritual fruit."]'::jsonb, 'Because their inheritance is unshakable, believers should worship with reverence and awe.', 'The surrounding argument supports this significance at Hebrews 12:28-29.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 12:28-29 in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 3, 'What is the best contextual significance of Hebrews 12:6 in Hebrews 12?', '["Suffering under God''s hand is interpreted as filial discipline, not abandonment.","Jesus is both the model and completer of the faithful path.","God''s discipline is painful now but productive in moral and spiritual fruit.","Esau represents trading enduring inheritance for immediate appetite."]'::jsonb, 'Suffering under God''s hand is interpreted as filial discipline, not abandonment.', 'The surrounding argument supports this significance at Hebrews 12:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 12:6 in Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 4, 'How does Hebrews 12:1 function in the broader argument of Hebrews 12?', '["The chapter turns the witness of chapter 11 into a call for active perseverance.","The chapter centers endurance in Christ''s own cross-to-throne journey.","The chapter reframes hardship as evidence of sonship and a means of holiness.","The chapter measures discipline by its long-term fruit rather than by immediate comfort."]'::jsonb, 'The chapter turns the witness of chapter 11 into a call for active perseverance.', 'This synthesis fits the chapter''s broader argument around Hebrews 12:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 12:1 function in the broader argument of Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 4, 'How does Hebrews 12:11 function in the broader argument of Hebrews 12?', '["The chapter measures discipline by its long-term fruit rather than by immediate comfort.","The chapter turns the witness of chapter 11 into a call for active perseverance.","The chapter centers endurance in Christ''s own cross-to-throne journey.","The chapter reframes hardship as evidence of sonship and a means of holiness."]'::jsonb, 'The chapter measures discipline by its long-term fruit rather than by immediate comfort.', 'This synthesis fits the chapter''s broader argument around Hebrews 12:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 12:11 function in the broader argument of Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 4, 'How does Hebrews 12:16 function in the broader argument of Hebrews 12?', '["The chapter warns that contempt for sacred inheritance can be irreversible in its consequences.","The chapter turns the witness of chapter 11 into a call for active perseverance.","The chapter centers endurance in Christ''s own cross-to-throne journey.","The chapter reframes hardship as evidence of sonship and a means of holiness."]'::jsonb, 'The chapter warns that contempt for sacred inheritance can be irreversible in its consequences.', 'This synthesis fits the chapter''s broader argument around Hebrews 12:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 12:16 function in the broader argument of Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 4, 'How does Hebrews 12:2 function in the broader argument of Hebrews 12?', '["The chapter centers endurance in Christ''s own cross-to-throne journey.","The chapter turns the witness of chapter 11 into a call for active perseverance.","The chapter reframes hardship as evidence of sonship and a means of holiness.","The chapter measures discipline by its long-term fruit rather than by immediate comfort."]'::jsonb, 'The chapter centers endurance in Christ''s own cross-to-throne journey.', 'This synthesis fits the chapter''s broader argument around Hebrews 12:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 12:2 function in the broader argument of Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 4, 'How does Hebrews 12:22-24 function in the broader argument of Hebrews 12?', '["The chapter contrasts terrifying Sinai with the gracious reality of Zion in Christ.","The chapter turns the witness of chapter 11 into a call for active perseverance.","The chapter centers endurance in Christ''s own cross-to-throne journey.","The chapter reframes hardship as evidence of sonship and a means of holiness."]'::jsonb, 'The chapter contrasts terrifying Sinai with the gracious reality of Zion in Christ.', 'This synthesis fits the chapter''s broader argument around Hebrews 12:22-24.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 12:22-24 function in the broader argument of Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 4, 'How does Hebrews 12:28-29 function in the broader argument of Hebrews 12?', '["The chapter closes by turning eschatological stability into present worshipful obedience.","The chapter turns the witness of chapter 11 into a call for active perseverance.","The chapter centers endurance in Christ''s own cross-to-throne journey.","The chapter reframes hardship as evidence of sonship and a means of holiness."]'::jsonb, 'The chapter closes by turning eschatological stability into present worshipful obedience.', 'This synthesis fits the chapter''s broader argument around Hebrews 12:28-29.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 12:28-29 function in the broader argument of Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 4, 'How does Hebrews 12:6 function in the broader argument of Hebrews 12?', '["The chapter reframes hardship as evidence of sonship and a means of holiness.","The chapter turns the witness of chapter 11 into a call for active perseverance.","The chapter centers endurance in Christ''s own cross-to-throne journey.","The chapter measures discipline by its long-term fruit rather than by immediate comfort."]'::jsonb, 'The chapter reframes hardship as evidence of sonship and a means of holiness.', 'This synthesis fits the chapter''s broader argument around Hebrews 12:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 12:6 function in the broader argument of Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 5, 'What is the strongest theological reading of Hebrews 12:1 within Hebrews 12?', '["Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.","Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.","Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory.","Hebrews teaches teleological suffering: hardship under God is ordered toward righteous peace."]'::jsonb, 'Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.', 'This theological reading is grounded in Hebrews 12:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 12:1 within Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 5, 'What is the strongest theological reading of Hebrews 12:11 within Hebrews 12?', '["Hebrews teaches teleological suffering: hardship under God is ordered toward righteous peace.","Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.","Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.","Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory."]'::jsonb, 'Hebrews teaches teleological suffering: hardship under God is ordered toward righteous peace.', 'This theological reading is grounded in Hebrews 12:11 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 12:11 within Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 5, 'What is the strongest theological reading of Hebrews 12:16 within Hebrews 12?', '["Esau embodies apostasy as the devaluation of covenant blessing in favor of transient gratification.","Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.","Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.","Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory."]'::jsonb, 'Esau embodies apostasy as the devaluation of covenant blessing in favor of transient gratification.', 'This theological reading is grounded in Hebrews 12:16 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 12:16 within Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 5, 'What is the strongest theological reading of Hebrews 12:2 within Hebrews 12?', '["Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.","Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.","Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory.","Hebrews teaches teleological suffering: hardship under God is ordered toward righteous peace."]'::jsonb, 'Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.', 'This theological reading is grounded in Hebrews 12:2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 12:2 within Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 5, 'What is the strongest theological reading of Hebrews 12:22-24 within Hebrews 12?', '["Hebrews relocates the church''s identity from the old mountain of distance and dread to the heavenly city of mediated access.","Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.","Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.","Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory."]'::jsonb, 'Hebrews relocates the church''s identity from the old mountain of distance and dread to the heavenly city of mediated access.', 'This theological reading is grounded in Hebrews 12:22-24 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 12:22-24 within Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 5, 'What is the strongest theological reading of Hebrews 12:28-29 within Hebrews 12?', '["Hebrews joins assurance and reverence: the unshakable kingdom invites grateful service before the consuming fire of God.","Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.","Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.","Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory."]'::jsonb, 'Hebrews joins assurance and reverence: the unshakable kingdom invites grateful service before the consuming fire of God.', 'This theological reading is grounded in Hebrews 12:28-29 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 12:28-29 within Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 12, 5, 'What is the strongest theological reading of Hebrews 12:6 within Hebrews 12?', '["Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory.","Hebrews portrays sanctification as athletic endurance shaped by eschatological focus rather than passive drift.","Looking to Jesus means more than admiration; it means orienting faith around the crucified and exalted Son.","Hebrews teaches teleological suffering: hardship under God is ordered toward righteous peace."]'::jsonb, 'Hebrews turns pain into a covenant category: discipline confirms paternal love and trains the heirs of glory.', 'This theological reading is grounded in Hebrews 12:6 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 12:6 within Hebrews 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 1, 'How is Jesus Christ described in Hebrews 13:8?', '["The same yesterday and today and forever","Changing with each covenant age","Present only in memory","Limited to the apostolic generation"]'::jsonb, 'The same yesterday and today and forever', 'Hebrews 13:8 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'How is Jesus Christ described in Hebrews 13:8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 1, 'What does Hebrews 13:1 command to continue?', '["Brotherly love","Temple sacrifices","National boasting","Ceremonial washings"]'::jsonb, 'Brotherly love', 'Hebrews 13:1 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 13:1 command to continue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 1, 'What does Hebrews 13:9 say the heart should be established by?', '["Grace","Foods","Genealogy","Political power"]'::jsonb, 'Grace', 'Hebrews 13:9 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Hebrews 13:9 say the heart should be established by?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 1, 'What had some done unawares by showing love to strangers?', '["Entertained angels","Hosted kings","Received apostles only","Restored the old covenant"]'::jsonb, 'Entertained angels', 'Hebrews 13:2 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What had some done unawares by showing love to strangers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 1, 'What sacrifice should believers offer continually through Jesus?', '["A sacrifice of praise, the fruit of lips confessing his name","The blood of bulls and goats","Incense in the earthly temple","Pilgrimage vows"]'::jsonb, 'A sacrifice of praise, the fruit of lips confessing his name', 'Hebrews 13:15 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What sacrifice should believers offer continually through Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 1, 'What should believers be free from according to Hebrews 13:5?', '["The love of money","Love of neighbor","Hope of resurrection","Concern for holiness"]'::jsonb, 'The love of money', 'Hebrews 13:5 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What should believers be free from according to Hebrews 13:5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 1, 'Where did Jesus suffer in order to sanctify the people with his own blood?', '["Outside the gate","Inside the holy of holies on earth","At Mount Sinai","In the courts of Herod"]'::jsonb, 'Outside the gate', 'Hebrews 13:12-13 supports this directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus suffer in order to sanctify the people with his own blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 2, 'In context, what does Hebrews 13:1 emphasize?', '["The chapter opens with practical community ethics rooted in the gospel.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people.","Jesus remains constant amid changing circumstances and teachings."]'::jsonb, 'The chapter opens with practical community ethics rooted in the gospel.', 'This is the point made in context at Hebrews 13:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 13:1 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 2, 'In context, what does Hebrews 13:12-13 emphasize?', '["Christ''s suffering outside the gate calls believers to identify with his reproach.","The chapter opens with practical community ethics rooted in the gospel.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people."]'::jsonb, 'Christ''s suffering outside the gate calls believers to identify with his reproach.', 'This is the point made in context at Hebrews 13:12-13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 13:12-13 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 2, 'In context, what does Hebrews 13:15 emphasize?', '["The fitting ongoing sacrifice in the new covenant is praise flowing from confessed allegiance to Jesus.","The chapter opens with practical community ethics rooted in the gospel.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people."]'::jsonb, 'The fitting ongoing sacrifice in the new covenant is praise flowing from confessed allegiance to Jesus.', 'This is the point made in context at Hebrews 13:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 13:15 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 2, 'In context, what does Hebrews 13:2 emphasize?', '["Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","The chapter opens with practical community ethics rooted in the gospel.","Contentment rests on God''s promise never to leave or forsake his people.","Jesus remains constant amid changing circumstances and teachings."]'::jsonb, 'Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.', 'This is the point made in context at Hebrews 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 13:2 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 2, 'In context, what does Hebrews 13:5 emphasize?', '["Contentment rests on God''s promise never to leave or forsake his people.","The chapter opens with practical community ethics rooted in the gospel.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Jesus remains constant amid changing circumstances and teachings."]'::jsonb, 'Contentment rests on God''s promise never to leave or forsake his people.', 'This is the point made in context at Hebrews 13:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 13:5 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 2, 'In context, what does Hebrews 13:8 emphasize?', '["Jesus remains constant amid changing circumstances and teachings.","The chapter opens with practical community ethics rooted in the gospel.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people."]'::jsonb, 'Jesus remains constant amid changing circumstances and teachings.', 'This is the point made in context at Hebrews 13:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 13:8 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 2, 'In context, what does Hebrews 13:9 emphasize?', '["Spiritual steadiness comes from grace rather than ritual food regulations.","The chapter opens with practical community ethics rooted in the gospel.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people."]'::jsonb, 'Spiritual steadiness comes from grace rather than ritual food regulations.', 'This is the point made in context at Hebrews 13:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In context, what does Hebrews 13:9 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 3, 'What is the best contextual significance of Hebrews 13:1 in Hebrews 13?', '["The chapter opens with practical community ethics rooted in the gospel.","Contentment rests on God''s promise never to leave or forsake his people.","Jesus remains constant amid changing circumstances and teachings.","Spiritual steadiness comes from grace rather than ritual food regulations."]'::jsonb, 'The chapter opens with practical community ethics rooted in the gospel.', 'The surrounding argument supports this significance at Hebrews 13:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 13:1 in Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 3, 'What is the best contextual significance of Hebrews 13:12-13 in Hebrews 13?', '["Christ''s suffering outside the gate calls believers to identify with his reproach.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people.","Jesus remains constant amid changing circumstances and teachings."]'::jsonb, 'Christ''s suffering outside the gate calls believers to identify with his reproach.', 'The surrounding argument supports this significance at Hebrews 13:12-13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 13:12-13 in Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 3, 'What is the best contextual significance of Hebrews 13:15 in Hebrews 13?', '["The fitting ongoing sacrifice in the new covenant is praise flowing from confessed allegiance to Jesus.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people.","Jesus remains constant amid changing circumstances and teachings."]'::jsonb, 'The fitting ongoing sacrifice in the new covenant is praise flowing from confessed allegiance to Jesus.', 'The surrounding argument supports this significance at Hebrews 13:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 13:15 in Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 3, 'What is the best contextual significance of Hebrews 13:2 in Hebrews 13?', '["Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people.","Jesus remains constant amid changing circumstances and teachings.","Spiritual steadiness comes from grace rather than ritual food regulations."]'::jsonb, 'Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.', 'The surrounding argument supports this significance at Hebrews 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 13:2 in Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 3, 'What is the best contextual significance of Hebrews 13:5 in Hebrews 13?', '["Contentment rests on God''s promise never to leave or forsake his people.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Jesus remains constant amid changing circumstances and teachings.","Spiritual steadiness comes from grace rather than ritual food regulations."]'::jsonb, 'Contentment rests on God''s promise never to leave or forsake his people.', 'The surrounding argument supports this significance at Hebrews 13:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 13:5 in Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 3, 'What is the best contextual significance of Hebrews 13:8 in Hebrews 13?', '["Jesus remains constant amid changing circumstances and teachings.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people.","Spiritual steadiness comes from grace rather than ritual food regulations."]'::jsonb, 'Jesus remains constant amid changing circumstances and teachings.', 'The surrounding argument supports this significance at Hebrews 13:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 13:8 in Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 3, 'What is the best contextual significance of Hebrews 13:9 in Hebrews 13?', '["Spiritual steadiness comes from grace rather than ritual food regulations.","Hospitality is urged with the reminder that unseen significance may attend ordinary obedience.","Contentment rests on God''s promise never to leave or forsake his people.","Jesus remains constant amid changing circumstances and teachings."]'::jsonb, 'Spiritual steadiness comes from grace rather than ritual food regulations.', 'The surrounding argument supports this significance at Hebrews 13:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the best contextual significance of Hebrews 13:9 in Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 4, 'How does Hebrews 13:1 function in the broader argument of Hebrews 13?', '["Hebrews ends not with abstraction but with love-shaped communal life.","The chapter turns love outward in costly welcome, not inward comfort alone.","The chapter opposes greed by grounding security in God''s presence rather than possessions.","The chapter anchors the community''s stability in the unchanging person of Christ."]'::jsonb, 'Hebrews ends not with abstraction but with love-shaped communal life.', 'This synthesis fits the chapter''s broader argument around Hebrews 13:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 13:1 function in the broader argument of Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 4, 'How does Hebrews 13:12-13 function in the broader argument of Hebrews 13?', '["The chapter transforms exclusion and shame into the place of faithful solidarity with Jesus.","Hebrews ends not with abstraction but with love-shaped communal life.","The chapter turns love outward in costly welcome, not inward comfort alone.","The chapter opposes greed by grounding security in God''s presence rather than possessions."]'::jsonb, 'The chapter transforms exclusion and shame into the place of faithful solidarity with Jesus.', 'This synthesis fits the chapter''s broader argument around Hebrews 13:12-13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 13:12-13 function in the broader argument of Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 4, 'How does Hebrews 13:15 function in the broader argument of Hebrews 13?', '["The chapter ends with worship recast in Christ-centered verbal and practical sacrifice.","Hebrews ends not with abstraction but with love-shaped communal life.","The chapter turns love outward in costly welcome, not inward comfort alone.","The chapter opposes greed by grounding security in God''s presence rather than possessions."]'::jsonb, 'The chapter ends with worship recast in Christ-centered verbal and practical sacrifice.', 'This synthesis fits the chapter''s broader argument around Hebrews 13:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 13:15 function in the broader argument of Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 4, 'How does Hebrews 13:2 function in the broader argument of Hebrews 13?', '["The chapter turns love outward in costly welcome, not inward comfort alone.","Hebrews ends not with abstraction but with love-shaped communal life.","The chapter opposes greed by grounding security in God''s presence rather than possessions.","The chapter anchors the community''s stability in the unchanging person of Christ."]'::jsonb, 'The chapter turns love outward in costly welcome, not inward comfort alone.', 'This synthesis fits the chapter''s broader argument around Hebrews 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 13:2 function in the broader argument of Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 4, 'How does Hebrews 13:5 function in the broader argument of Hebrews 13?', '["The chapter opposes greed by grounding security in God''s presence rather than possessions.","Hebrews ends not with abstraction but with love-shaped communal life.","The chapter turns love outward in costly welcome, not inward comfort alone.","The chapter anchors the community''s stability in the unchanging person of Christ."]'::jsonb, 'The chapter opposes greed by grounding security in God''s presence rather than possessions.', 'This synthesis fits the chapter''s broader argument around Hebrews 13:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 13:5 function in the broader argument of Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 4, 'How does Hebrews 13:8 function in the broader argument of Hebrews 13?', '["The chapter anchors the community''s stability in the unchanging person of Christ.","Hebrews ends not with abstraction but with love-shaped communal life.","The chapter turns love outward in costly welcome, not inward comfort alone.","The chapter opposes greed by grounding security in God''s presence rather than possessions."]'::jsonb, 'The chapter anchors the community''s stability in the unchanging person of Christ.', 'This synthesis fits the chapter''s broader argument around Hebrews 13:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 13:8 function in the broader argument of Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 4, 'How does Hebrews 13:9 function in the broader argument of Hebrews 13?', '["The chapter contrasts gospel nourishment with external religious preoccupations.","Hebrews ends not with abstraction but with love-shaped communal life.","The chapter turns love outward in costly welcome, not inward comfort alone.","The chapter opposes greed by grounding security in God''s presence rather than possessions."]'::jsonb, 'The chapter contrasts gospel nourishment with external religious preoccupations.', 'This synthesis fits the chapter''s broader argument around Hebrews 13:9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Hebrews 13:9 function in the broader argument of Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 5, 'What is the strongest theological reading of Hebrews 13:1 within Hebrews 13?', '["Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.","Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.","Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety.","The immutability of Jesus guards the church against novelty that departs from the gospel center."]'::jsonb, 'Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.', 'This theological reading is grounded in Hebrews 13:1 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 13:1 within Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 5, 'What is the strongest theological reading of Hebrews 13:12-13 within Hebrews 13?', '["Going outside the camp means embracing a cruciform identity rather than clinging to old sacred geography.","Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.","Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.","Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety."]'::jsonb, 'Going outside the camp means embracing a cruciform identity rather than clinging to old sacred geography.', 'This theological reading is grounded in Hebrews 13:12-13 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 13:12-13 within Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 5, 'What is the strongest theological reading of Hebrews 13:15 within Hebrews 13?', '["Hebrews fulfills sacrificial language by redirecting it toward continual praise and doing good through the once-for-all mediator.","Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.","Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.","Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety."]'::jsonb, 'Hebrews fulfills sacrificial language by redirecting it toward continual praise and doing good through the once-for-all mediator.', 'This theological reading is grounded in Hebrews 13:15 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 13:15 within Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 5, 'What is the strongest theological reading of Hebrews 13:2 within Hebrews 13?', '["Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.","Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.","Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety.","The immutability of Jesus guards the church against novelty that departs from the gospel center."]'::jsonb, 'Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.', 'This theological reading is grounded in Hebrews 13:2 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 13:2 within Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 5, 'What is the strongest theological reading of Hebrews 13:5 within Hebrews 13?', '["Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety.","Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.","Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.","The immutability of Jesus guards the church against novelty that departs from the gospel center."]'::jsonb, 'Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety.', 'This theological reading is grounded in Hebrews 13:5 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 13:5 within Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 5, 'What is the strongest theological reading of Hebrews 13:8 within Hebrews 13?', '["The immutability of Jesus guards the church against novelty that departs from the gospel center.","Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.","Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.","Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety."]'::jsonb, 'The immutability of Jesus guards the church against novelty that departs from the gospel center.', 'This theological reading is grounded in Hebrews 13:8 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 13:8 within Hebrews 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 58, 13, 5, 'What is the strongest theological reading of Hebrews 13:9 within Hebrews 13?', '["Hebrews opposes strange teachings by locating true stability in grace-centered relation to Christ.","Brotherly love in the closing chapter shows that perseverance is embodied in ordinary covenant relationships.","Hebrews preserves the mystery of providence: acts of hospitality may participate in realities beyond what the host can see.","Hebrews treats contentment as theological trust: divine presence displaces monetary anxiety."]'::jsonb, 'Hebrews opposes strange teachings by locating true stability in grace-centered relation to Christ.', 'This theological reading is grounded in Hebrews 13:9 and its chapter context.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 58
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest theological reading of Hebrews 13:9 within Hebrews 13?'
);
