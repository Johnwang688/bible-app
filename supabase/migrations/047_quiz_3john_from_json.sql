-- ============================================================================
-- LOGOS LIGHT — 3 John (book 64) quiz questions from quiz-questions/3john.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, how does the writer describe himself at the beginning of the letter?', '["The elder", "The prisoner", "The apostle to the nations", "The servant in Patmos"]'::jsonb, 'The elder', 'The letter opens with the words, ''The elder to Gaius the beloved'' (3 John 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, how does the writer describe himself at the beginning of the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, to whom is the letter addressed?', '["Gaius", "Demetrius", "Diotrephes", "Caiaphas"]'::jsonb, 'Gaius', 'The elder addresses the letter ''to Gaius the beloved'' (3 John 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, to whom is the letter addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, what does the elder pray will prosper along with Gaius''s health?', '["His soul", "His business", "His household", "His reputation in Rome"]'::jsonb, 'His soul', 'The elder prays that Gaius may prosper and be in health, ''even as your soul prospers'' (3 John 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, what does the elder pray will prosper along with Gaius''s health?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, what brought the elder great joy regarding Gaius?', '["Brothers testified that he walked in truth", "He had traveled safely to Ephesus", "He had rebuilt the meeting house", "He had become a famous teacher"]'::jsonb, 'Brothers testified that he walked in truth', 'The elder rejoiced greatly when brothers came and testified about Gaius''s truth, how he walked in truth (3 John 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, what brought the elder great joy regarding Gaius?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, what does the elder say he has no greater joy than?', '["Hearing that his children walk in truth", "Seeing churches grow in number", "Receiving gifts from believers", "Traveling with faithful brothers"]'::jsonb, 'Hearing that his children walk in truth', 'He writes, ''I have no greater joy than this, to hear about my children walking in truth'' (3 John 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, what does the elder say he has no greater joy than?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, what kind of work was Gaius doing for the brothers and strangers?', '["A faithful work", "A secret work", "A burdensome work", "An unfinished work"]'::jsonb, 'A faithful work', 'The elder says Gaius does ''a faithful work in whatever you accomplish for those who are brothers and strangers'' (3 John 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, what kind of work was Gaius doing for the brothers and strangers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, for whose sake had certain brothers gone out?', '["For the sake of the Name", "For the sake of Moses", "For the sake of Caesar", "For the sake of the temple"]'::jsonb, 'For the sake of the Name', 'The letter says they went out ''for the sake of the Name'' (3 John 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, for whose sake had certain brothers gone out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, from whom were those traveling brothers taking nothing?', '["The Gentiles", "The Samaritans", "The priests", "The tax collectors"]'::jsonb, 'The Gentiles', 'The elder says they took nothing from the Gentiles (3 John 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, from whom were those traveling brothers taking nothing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, whom does the elder say loves to be first among them?', '["Diotrephes", "Demetrius", "Gaius", "Silvanus"]'::jsonb, 'Diotrephes', 'The elder writes, ''Diotrephes, who loves to be first among them'' (3 John 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, whom does the elder say loves to be first among them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 1, 'According to 3 John 1, who has the testimony of all and of the truth itself?', '["Demetrius", "Diotrephes", "Gaius", "The elder"]'::jsonb, 'Demetrius', 'The elder says, ''Demetrius has the testimony of all, and of the truth itself'' (3 John 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 3 John 1, who has the testimony of all and of the truth itself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, why did the elder rejoice greatly?', '["Because brothers came and testified to Gaius''s truth", "Because Diotrephes had repented publicly", "Because Demetrius had built a new church", "Because the Gentiles had begun to support the mission"]'::jsonb, 'Because brothers came and testified to Gaius''s truth', 'He rejoiced greatly when brothers came and bore witness to Gaius''s truth and his walking in truth (3 John 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, why did the elder rejoice greatly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, how had Gaius shown love before the assembly?', '["By helping the brothers and strangers on their journey", "By debating false teachers in public", "By sending money to Jerusalem only", "By refusing to host any travelers"]'::jsonb, 'By helping the brothers and strangers on their journey', 'The brothers testified before the assembly to Gaius''s love, and the elder says he will do well to send them forward worthily of God (3 John 1:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, how had Gaius shown love before the assembly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, how should Gaius send the traveling brothers on their journey?', '["In a manner worthy of God", "As quickly as possible", "With letters from Rome", "In secret to avoid attention"]'::jsonb, 'In a manner worthy of God', 'The elder says, ''You will do well to send them forward on their journey in a manner worthy of God'' (3 John 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, how should Gaius send the traveling brothers on their journey?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, why ought believers receive such workers?', '["So they may become fellow workers for the truth", "So they may gain status in the churches", "So they may avoid persecution from Rome", "So they may replace local elders quickly"]'::jsonb, 'So they may become fellow workers for the truth', 'The elder says believers ought to receive such people ''that we may be fellow workers for the truth'' (3 John 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, why ought believers receive such workers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, how had Diotrephes responded to the elder and his companions?', '["He did not accept them", "He welcomed them openly", "He traveled with them briefly", "He sent aid for their mission"]'::jsonb, 'He did not accept them', 'The elder says Diotrephes ''doesn''t accept us'' (3 John 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, how had Diotrephes responded to the elder and his companions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, what was Diotrephes doing with brothers who wanted to receive visiting believers?', '["Forbidding them and throwing them out of the assembly", "Training them for missionary travel", "Sending them to Demetrius for counsel", "Asking them to wait for the elder''s letter"]'::jsonb, 'Forbidding them and throwing them out of the assembly', 'Diotrephes would not receive the brothers, forbade those who wanted to, and threw them out of the assembly (3 John 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, what was Diotrephes doing with brothers who wanted to receive visiting believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, what instruction does the elder give Gaius about imitation?', '["Do not imitate what is evil, but what is good", "Imitate the strongest speaker in the church", "Avoid imitating any teacher at all", "Imitate only those from your own family"]'::jsonb, 'Do not imitate what is evil, but what is good', 'The elder writes, ''Don''t imitate that which is evil, but that which is good'' (3 John 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, what instruction does the elder give Gaius about imitation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, what does the elder hope to do soon instead of writing more with ink and pen?', '["See Gaius and speak face to face", "Send another messenger from Jerusalem", "Visit the Gentiles who supported the mission", "Write a public letter to the whole province"]'::jsonb, 'See Gaius and speak face to face', 'The elder says he hopes to see Gaius soon and they will speak face to face (3 John 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, what does the elder hope to do soon instead of writing more with ink and pen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 2, 'According to 3 John 1, how is Demetrius further commended besides receiving testimony from all?', '["He has the testimony of the truth itself", "He was healed from a serious illness", "He was appointed over many churches", "He supported the brothers from Gentile gifts"]'::jsonb, 'He has the testimony of the truth itself', 'The elder says Demetrius has testimony from all, ''and of the truth itself'' (3 John 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 3 John 1, how is Demetrius further commended besides receiving testimony from all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, what does the elder''s prayer for Gaius''s health imply about Gaius''s spiritual condition?', '["His soul was already prospering well", "He had abandoned the truth recently", "He was spiritually weak but physically strong", "He was unknown to the churches"]'::jsonb, 'His soul was already prospering well', 'The elder prays Gaius may prosper in health ''even as your soul prospers,'' implying Gaius''s spiritual condition was strong (3 John 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, what does the elder''s prayer for Gaius''s health imply about Gaius''s spiritual condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, what does Gaius''s hospitality reveal about his character?', '["His love was active and faithful toward truth-serving workers", "He preferred strangers over fellow believers", "He was trying to gain power over the assembly", "He wanted the Gentiles to finance the mission"]'::jsonb, 'His love was active and faithful toward truth-serving workers', 'Gaius is praised for faithful action toward brothers and strangers who testified of his love and were to be helped forward worthily of God (3 John 1:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, what does Gaius''s hospitality reveal about his character?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, what does the phrase ''for the sake of the Name'' suggest about the traveling workers?', '["They were serving Christ''s mission with devoted purpose", "They were seeking a reputation for themselves", "They were traveling to collect taxes for the churches", "They were leaving because of family disputes only"]'::jsonb, 'They were serving Christ''s mission with devoted purpose', 'The letter says they went out for the sake of the Name, indicating mission centered on Christ and his cause (3 John 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, what does the phrase ''for the sake of the Name'' suggest about the traveling workers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, what does the contrast between Gaius and Diotrephes mainly highlight?', '["The difference between serving the truth and seeking prominence", "The difference between wealth and poverty in the churches", "The difference between Jews and Gentiles in the mission", "The difference between older and younger believers"]'::jsonb, 'The difference between serving the truth and seeking prominence', 'Gaius is praised for faithful hospitality that advances the truth, while Diotrephes is criticized for loving to be first and rejecting the brothers (3 John 1:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, what does the contrast between Gaius and Diotrephes mainly highlight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, what does becoming ''fellow workers for the truth'' imply about supporting missionaries?', '["Those who support faithful workers share in the ministry of truth", "Only ordained elders can take part in gospel work", "Support matters less than public teaching ability", "Financial help alone is the whole mission"]'::jsonb, 'Those who support faithful workers share in the ministry of truth', 'The elder says receiving such workers makes believers ''fellow workers for the truth,'' showing partnership in gospel ministry (3 John 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, what does becoming ''fellow workers for the truth'' imply about supporting missionaries?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, why is Diotrephes''s behavior more serious than personal rudeness?', '["It harms the church''s welcome of faithful workers and resists apostolic authority", "It only shows he preferred shorter letters", "It means he misunderstood travel schedules briefly", "It mainly concerns his dislike of Demetrius alone"]'::jsonb, 'It harms the church''s welcome of faithful workers and resists apostolic authority', 'Diotrephes does not accept the elder, speaks wicked words, refuses the brothers, and expels those who would receive them, making his behavior damaging to the church (3 John 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, why is Diotrephes''s behavior more serious than personal rudeness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, what is the force of the command not to imitate evil but good?', '["Believers should discern examples carefully and choose conduct aligned with God", "Believers should avoid learning from anyone around them", "Believers should copy only famous leaders", "Believers should ignore actions and focus only on words"]'::jsonb, 'Believers should discern examples carefully and choose conduct aligned with God', 'The elder tells Gaius not to imitate evil but good, then links doing good with being of God and doing evil with not seeing God (3 John 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, what is the force of the command not to imitate evil but good?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 3, 'According to 3 John 1, what does the commendation of Demetrius contribute to the letter?', '["It provides a positive example of approved character after the warning about Diotrephes", "It replaces Gaius as the main recipient of the letter", "It shows every traveler should be received without discernment", "It introduces a dispute over church finances"]'::jsonb, 'It provides a positive example of approved character after the warning about Diotrephes', 'After warning about Diotrephes, the elder commends Demetrius with strong testimony, offering a contrasting example of approved character (3 John 1:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 3 John 1, what does the commendation of Demetrius contribute to the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 4, 'How do 3 John 1:5-8 and 3 John 1:9-10 work together in the letter''s argument?', '["They contrast faithful support of gospel workers with selfish opposition to them", "They show two equally valid ways of leading the church", "They compare local ministry with temple worship", "They explain why written letters are better than visits"]'::jsonb, 'They contrast faithful support of gospel workers with selfish opposition to them', 'Gaius is praised for helping the brothers and becoming a fellow worker for the truth, while Diotrephes rejects them and expels those who receive them (3 John 1:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do 3 John 1:5-8 and 3 John 1:9-10 work together in the letter''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 4, 'How does the theme of truth shape the whole letter of 3 John 1?', '["Truth is seen in Gaius''s walk, the mission of the brothers, and the approval of Demetrius", "Truth appears only in the opening greeting and nowhere else", "Truth is mainly about legal disputes inside the church", "Truth is treated as less important than peace at any cost"]'::jsonb, 'Truth is seen in Gaius''s walk, the mission of the brothers, and the approval of Demetrius', 'The elder rejoices that Gaius walks in truth, says believers become fellow workers for the truth, and says Demetrius has testimony from the truth itself (3 John 1:3-4, 8, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the theme of truth shape the whole letter of 3 John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 4, 'What role does hospitality play in the structure and purpose of 3 John 1?', '["It serves as a concrete test of whether someone advances or hinders the truth", "It is mentioned only as a minor personal preference", "It replaces doctrinal faithfulness as the central issue", "It is treated as unnecessary when leaders disagree"]'::jsonb, 'It serves as a concrete test of whether someone advances or hinders the truth', 'Gaius''s hospitality supports truth-serving workers, whereas Diotrephes''s refusal blocks them and harms the church, making hospitality a practical measure of faithfulness (3 John 1:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What role does hospitality play in the structure and purpose of 3 John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 4, 'How does the elder''s statement ''I have no greater joy than this'' function in the letter?', '["It frames the letter around spiritual faithfulness rather than mere personal affection", "It shifts the focus away from truth to material success", "It shows the elder values travel reports more than people", "It introduces a list of church regulations only"]'::jsonb, 'It frames the letter around spiritual faithfulness rather than mere personal affection', 'The elder''s greatest joy is hearing that his children walk in truth, setting spiritual faithfulness at the center of the letter''s encouragement and rebuke (3 John 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the elder''s statement ''I have no greater joy than this'' function in the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 4, 'Why is the elder''s intention to confront Diotrephes significant in the flow of 3 John 1?', '["It shows that abusive leadership in the church must be remembered and addressed", "It means the elder had no evidence against him", "It suggests Diotrephes had already been restored fully", "It turns the letter into a civil lawsuit"]'::jsonb, 'It shows that abusive leadership in the church must be remembered and addressed', 'The elder says that if he comes, he will call attention to what Diotrephes is doing, showing that harmful leadership behavior requires direct accountability (3 John 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the elder''s intention to confront Diotrephes significant in the flow of 3 John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 4, 'Why does 3 John 1 place the commendation of Demetrius after the warning about Diotrephes?', '["To follow the negative example with a trustworthy positive model", "To show Demetrius had replaced Diotrephes officially", "To move the topic away from church life to personal travel", "To prove that all conflict in the church had ended"]'::jsonb, 'To follow the negative example with a trustworthy positive model', 'After warning Gaius not to imitate evil, the letter commends Demetrius, giving a concrete example of one with good testimony (3 John 1:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 3 John 1 place the commendation of Demetrius after the warning about Diotrephes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 4, 'How does the close of 3 John 1 affect the tone of the letter as a whole?', '["It keeps the letter personal and pastoral despite its sharp warning", "It turns the letter into a formal legal decree", "It withdraws everything said earlier about truth", "It shows the elder no longer planned to visit"]'::jsonb, 'It keeps the letter personal and pastoral despite its sharp warning', 'The elder closes with peace, greetings, and a hope to speak face to face, giving the brief letter a warm pastoral tone alongside its rebuke (3 John 1:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the close of 3 John 1 affect the tone of the letter as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 5, 'According to 3 John 1, what theological principle stands behind the call to support traveling brothers?', '["Supporting faithful workers makes believers partners in the truth", "Only wealthy Christians can honor God properly", "Church authority depends mainly on hosting ability", "Mission should rely on Gentile sponsorship whenever possible"]'::jsonb, 'Supporting faithful workers makes believers partners in the truth', 'The elder says believers ought to receive such workers so that ''we may be fellow workers for the truth'' (3 John 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 3 John 1, what theological principle stands behind the call to support traveling brothers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 5, 'According to 3 John 1, what does the phrase ''hasn''t seen God'' mean in the contrast between good and evil conduct?', '["Persistent evil conduct reveals a lack of real knowledge of God", "Only visions can prove someone knows God", "Seeing God refers mainly to physical eyesight", "Anyone who sins once has permanently lost hope"]'::jsonb, 'Persistent evil conduct reveals a lack of real knowledge of God', 'The elder writes, ''He who does evil hasn''t seen God,'' linking conduct with true spiritual knowledge of God (3 John 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 3 John 1, what does the phrase ''hasn''t seen God'' mean in the contrast between good and evil conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 5, 'How does 3 John 1 connect personal piety and practical ministry?', '["A prospering soul is expressed in truthful living and generous support for gospel work", "Private spirituality is enough even without action", "Good health matters more than faithful conduct", "Mission work should be separated from character"]'::jsonb, 'A prospering soul is expressed in truthful living and generous support for gospel work', 'Gaius is described as one whose soul prospers, who walks in truth, and who faithfully supports traveling brothers, connecting inner spiritual health with outward ministry (3 John 1:2-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 3 John 1 connect personal piety and practical ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 5, 'What makes Diotrephes''s sin in 3 John 1 especially dangerous for the church?', '["His desire for preeminence turns leadership into opposition against truth and faithful workers", "He simply preferred different travel arrangements", "He struggled only with private doubt and said nothing publicly", "He objected to receiving Gentile believers into baptism"]'::jsonb, 'His desire for preeminence turns leadership into opposition against truth and faithful workers', 'Diotrephes loves to be first, rejects the elder, speaks maliciously, refuses the brothers, and expels those who receive them, showing how pride distorts leadership (3 John 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What makes Diotrephes''s sin in 3 John 1 especially dangerous for the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 5, 'Why is Demetrius''s testimony from ''the truth itself'' especially weighty in 3 John 1?', '["It means his character is consistent with the reality of the gospel, not just human praise", "It means truth was a person traveling with him", "It shows he had written more letters than the elder", "It proves he was the leader of every church in the region"]'::jsonb, 'It means his character is consistent with the reality of the gospel, not just human praise', 'The elder says Demetrius has testimony from all and from the truth itself, suggesting his life aligns with the truth he professes (3 John 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Demetrius''s testimony from ''the truth itself'' especially weighty in 3 John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 5, 'How does 3 John 1 present a careful balance between love and discernment?', '["It praises generous support for faithful workers while exposing a harmful leader by name", "It says love requires ignoring every doctrinal or moral problem", "It teaches discernment matters only for elders and not for friends", "It avoids evaluating anyone in order to keep peace"]'::jsonb, 'It praises generous support for faithful workers while exposing a harmful leader by name', 'The letter warmly commends Gaius''s love and hospitality toward faithful workers, yet also clearly warns about Diotrephes''s destructive behavior (3 John 1:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 3 John 1 present a careful balance between love and discernment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 64, 1, 5, 'What does 3 John 1 suggest about the relationship between truth and church order?', '["Church life should be arranged to welcome and assist those serving the truth, not block them", "Truth is unrelated to how leaders treat other believers", "Church order exists mainly to protect powerful personalities", "Hospitality and authority should never overlap"]'::jsonb, 'Church life should be arranged to welcome and assist those serving the truth, not block them', 'The elder commends receiving workers for the truth and condemns Diotrephes for blocking them and expelling supporters, linking truth to proper church conduct and order (3 John 1:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 64
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 3 John 1 suggest about the relationship between truth and church order?'
);
