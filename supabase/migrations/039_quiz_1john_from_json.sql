-- ============================================================================
-- LOGOS LIGHT - 1 John (book 62) quiz questions from quiz-questions/1john.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 1, 'According to 1 John 1, what was from the beginning?', '["The Word of life","The new covenant","The temple service","The law of Moses"]'::jsonb, 'The Word of life', 'John begins by speaking of what was from the beginning, the Word of life (1 John 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 1, what was from the beginning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 1, 'According to 1 John 1, with whom does John say the life was manifested?', '["With the Father","With Abraham","With the prophets","With the angels"]'::jsonb, 'With the Father', 'John says the eternal life was with the Father and was revealed to us (1 John 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 1, with whom does John say the life was manifested?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 1, 'According to 1 John 1, with whom is the believers'' fellowship?', '["With the Father and with his Son Jesus Christ","Only with the apostles","Only with Israel","Only with the angels"]'::jsonb, 'With the Father and with his Son Jesus Christ', 'John says true fellowship is with the Father and with his Son Jesus Christ (1 John 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 1, with whom is the believers'' fellowship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 1, 'According to 1 John 1, what is God?', '["Light","Fire","A shadow","Silence"]'::jsonb, 'Light', 'John states plainly that God is light (1 John 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 1, what is God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 1, 'According to 1 John 1, how much darkness is in God?', '["None at all","A little","Only at night","Only in judgment"]'::jsonb, 'None at all', 'John adds that in God there is no darkness at all (1 John 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 1, how much darkness is in God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 1, 'According to 1 John 1, what cleanses us from all sin?', '["The blood of Jesus Christ his Son","Our promises","Temple offerings","Good intentions"]'::jsonb, 'The blood of Jesus Christ his Son', 'The blood of Jesus Christ his Son cleanses us from all sin (1 John 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 1, what cleanses us from all sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 1, 'According to 1 John 1, what should we do if we confess our sins?', '["Trust that God is faithful and righteous to forgive","Hide from God","Repeat the law perfectly","Wait for a prophet"]'::jsonb, 'Trust that God is faithful and righteous to forgive', 'If we confess our sins, God is faithful and righteous to forgive and cleanse us (1 John 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 1, what should we do if we confess our sins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 2, 'Why does John write the things of 1 John 1?', '["So that joy may be made full","So that believers become wealthy","So that Rome may be overthrown","So that the temple may be rebuilt"]'::jsonb, 'So that joy may be made full', 'John says he writes these things so that joy may be made full (1 John 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does John write the things of 1 John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 2, 'According to 1 John 1, what happens if we say we have fellowship with God but walk in darkness?', '["We lie and do not tell the truth","We become wiser","We fulfill the law","We prove our freedom"]'::jsonb, 'We lie and do not tell the truth', 'Claiming fellowship while walking in darkness is a lie (1 John 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 1, what happens if we say we have fellowship with God but walk in darkness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 2, 'According to 1 John 1, what accompanies walking in the light?', '["Fellowship with one another","Escape from all suffering","Political favor","Freedom from temptation"]'::jsonb, 'Fellowship with one another', 'If we walk in the light, we have fellowship with one another (1 John 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 1, what accompanies walking in the light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 2, 'According to 1 John 1, what happens if we say we have no sin?', '["We deceive ourselves","We become pure","We honor the truth","We please God more"]'::jsonb, 'We deceive ourselves', 'John says that claiming to have no sin means we deceive ourselves (1 John 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 1, what happens if we say we have no sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 2, 'According to 1 John 1, what is not in us if we claim to have no sin?', '["The truth","The temple","A kingdom","A teacher"]'::jsonb, 'The truth', 'If we say we have no sin, the truth is not in us (1 John 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 1, what is not in us if we claim to have no sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 2, 'According to 1 John 1, from what does God cleanse those who confess?', '["All unrighteousness","Only public sins","Only ritual impurity","Only past mistakes"]'::jsonb, 'All unrighteousness', 'God forgives confessed sins and cleanses from all unrighteousness (1 John 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 1, from what does God cleanse those who confess?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 2, 'According to 1 John 1, what do we make God if we say we have not sinned?', '["A liar","A judge only","A distant king","A silent witness"]'::jsonb, 'A liar', 'To deny personal sin is to make God a liar because his word says otherwise (1 John 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 1, what do we make God if we say we have not sinned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 3, 'In 1 John 1, why does John stress hearing, seeing, and touching the Word of life?', '["To show that the apostolic witness to Jesus is concrete and historical","To prove only sight matters","To deny spiritual truth","To replace faith with science"]'::jsonb, 'To show that the apostolic witness to Jesus is concrete and historical', 'John piles up sensory language to ground his testimony in real encounter with Jesus (1 John 1:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 1, why does John stress hearing, seeing, and touching the Word of life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 3, 'In 1 John 1, what does walking in darkness most clearly imply?', '["Living in contradiction to God''s character","Being physically blind","Lacking Jewish ancestry","Avoiding public ministry"]'::jsonb, 'Living in contradiction to God''s character', 'Since God is light, walking in darkness means living contrary to him while claiming fellowship (1 John 1:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 1, what does walking in darkness most clearly imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 3, 'In 1 John 1, what does confession of sins demonstrate?', '["Honest agreement with God''s verdict about sin","Spiritual perfection already achieved","Freedom from needing grace","A claim to superior knowledge"]'::jsonb, 'Honest agreement with God''s verdict about sin', 'Confession fits John''s call for truthful living before God and receiving cleansing (1 John 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 1, what does confession of sins demonstrate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 3, 'In 1 John 1, why is the claim of sinlessness so serious?', '["It denies the truth about ourselves and contradicts God''s word","It proves a person has matured faster","It is only a minor wording issue","It applies only to teachers"]'::jsonb, 'It denies the truth about ourselves and contradicts God''s word', 'John says such a claim deceives us and makes God a liar, showing his word is not in us (1 John 1:8, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 1, why is the claim of sinlessness so serious?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 3, 'In 1 John 1, how are fellowship and cleansing related?', '["Walking in the light brings shared fellowship and ongoing cleansing through Jesus","Cleansing makes fellowship unnecessary","Fellowship replaces the need for forgiveness","They refer to unrelated topics"]'::jsonb, 'Walking in the light brings shared fellowship and ongoing cleansing through Jesus', 'John joins fellowship with one another and cleansing by Jesus'' blood in the same sentence (1 John 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 1, how are fellowship and cleansing related?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 3, 'In 1 John 1, what does the statement that God is faithful and righteous to forgive imply?', '["Forgiveness rests on God''s consistent character, not human merit","Forgiveness is earned by perfect confession","God forgives reluctantly","Righteousness and mercy oppose each other"]'::jsonb, 'Forgiveness rests on God''s consistent character, not human merit', 'John grounds forgiveness in who God is: faithful and righteous (1 John 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 1, what does the statement that God is faithful and righteous to forgive imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 3, 'In 1 John 1, what is the main contrast driving the chapter''s ethical message?', '["Light versus darkness","Temple versus wilderness","Circumcision versus uncircumcision","King versus prophet"]'::jsonb, 'Light versus darkness', 'John frames truthful Christian living around the contrast between light and darkness (1 John 1:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 1, what is the main contrast driving the chapter''s ethical message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 4, 'How does 1 John 1 connect apostolic testimony to Christian fellowship?', '["Receiving the apostolic witness brings people into fellowship with God and his people","Fellowship replaces the need for testimony","Only apostles can share fellowship","Testimony matters only for private devotion"]'::jsonb, 'Receiving the apostolic witness brings people into fellowship with God and his people', 'John proclaims what the apostles experienced so that readers may share fellowship with them and with God (1 John 1:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 1 connect apostolic testimony to Christian fellowship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 4, 'How does 1 John 1 resist any version of faith that ignores moral conduct?', '["It says claims of fellowship are false if the life remains in darkness","It teaches doctrine alone is enough","It treats conduct as optional after conversion","It says only rituals prove fellowship"]'::jsonb, 'It says claims of fellowship are false if the life remains in darkness', 'John exposes empty profession by tying fellowship with God to walking in the light (1 John 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 1 resist any version of faith that ignores moral conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 4, 'How does 1 John 1 hold together seriousness about sin and confidence in grace?', '["It rejects denial of sin while promising forgiveness to those who confess","It downplays sin to comfort believers","It demands sinlessness before fellowship begins","It offers grace without repentance"]'::jsonb, 'It rejects denial of sin while promising forgiveness to those who confess', 'John warns against denying sin but also points to God''s forgiving cleansing for confessors (1 John 1:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 1 hold together seriousness about sin and confidence in grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 4, 'What larger purpose does joy serve in 1 John 1?', '["It is the communal result of sharing the apostolic message and fellowship with God","It is merely private excitement","It replaces truth as the goal","It comes from escaping earthly duties"]'::jsonb, 'It is the communal result of sharing the apostolic message and fellowship with God', 'John writes so that joy may be full in the context of shared fellowship around the revealed life (1 John 1:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger purpose does joy serve in 1 John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 4, 'Why does 1 John 1 make denial of sin effectively a denial of revelation?', '["Because God''s message exposes sin, so rejecting that truth contradicts his word","Because sin exists only in the Old Testament","Because revelation concerns angels only","Because confession belongs to priests alone"]'::jsonb, 'Because God''s message exposes sin, so rejecting that truth contradicts his word', 'If God''s message says he is light, then denying our sin means his word is not in us (1 John 1:5, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 John 1 make denial of sin effectively a denial of revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 4, 'What balance does 1 John 1 strike between vertical and horizontal fellowship?', '["Fellowship with God is inseparable from truthful shared life among believers","Only horizontal fellowship matters","Only private fellowship with God matters","Fellowship is unrelated to truth"]'::jsonb, 'Fellowship with God is inseparable from truthful shared life among believers', 'John links fellowship with the Father and Son to fellowship with one another in the light (1 John 1:3, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What balance does 1 John 1 strike between vertical and horizontal fellowship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 4, 'How does 1 John 1 frame Jesus'' blood in relation to ongoing Christian life?', '["As the continuing basis of cleansing for those who walk in the light","As relevant only before conversion","As a symbol without real effect","As limited to ceremonial offenses"]'::jsonb, 'As the continuing basis of cleansing for those who walk in the light', 'John speaks of Jesus'' blood cleansing believers as they walk in the light (1 John 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 1 frame Jesus'' blood in relation to ongoing Christian life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 5, 'Why is 1 John 1 often understood as opposing early denials of Jesus'' real humanity?', '["Because John emphasizes tangible encounter with the revealed life","Because John avoids all physical language","Because John says the body is evil","Because John rejects eyewitness testimony"]'::jsonb, 'Because John emphasizes tangible encounter with the revealed life', 'The language of hearing, seeing, and touching underlines the real manifestation of Jesus (1 John 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is 1 John 1 often understood as opposing early denials of Jesus'' real humanity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 5, 'In 1 John 1, what does it mean that the eternal life was manifested?', '["God''s life was disclosed in the historical appearing of the Son","Eternal life began only after the resurrection","Life was hidden in the temple law","Human effort revealed life to God"]'::jsonb, 'God''s life was disclosed in the historical appearing of the Son', 'John says the life was manifested, seen, and testified to, pointing to the Son''s appearing (1 John 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 John 1, what does it mean that the eternal life was manifested?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 5, 'What theological point is strongest in John''s claim that God is light and in him is no darkness at all?', '["God is perfectly holy and truthful with no moral impurity","God is only physically bright","God changes with circumstances","God ignores ethical distinctions"]'::jsonb, 'God is perfectly holy and truthful with no moral impurity', 'The image of light expresses God''s utter purity and truthfulness in context (1 John 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological point is strongest in John''s claim that God is light and in him is no darkness at all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 5, 'How does 1 John 1 portray confession differently from mere regret?', '["Confession is truthful alignment with God''s word that receives cleansing","Confession is only an emotional release","Confession replaces the need for Christ","Confession is a public ritual for apostles alone"]'::jsonb, 'Confession is truthful alignment with God''s word that receives cleansing', 'John ties confession to God''s faithful forgiveness and cleansing, not just feeling sorry (1 John 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 1 portray confession differently from mere regret?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 5, 'Why does 1 John 1 make fellowship impossible apart from truth?', '["Because fellowship with the God of light cannot coexist with falsehood","Because fellowship depends on education level","Because only sinless people may gather","Because truth belongs only to leaders"]'::jsonb, 'Because fellowship with the God of light cannot coexist with falsehood', 'John denies fellowship claims made in darkness and exposes sin denial as deception (1 John 1:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 John 1 make fellowship impossible apart from truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 5, 'What is the best reading of John''s repeated ''if we say'' statements in 1 John 1?', '["They function as pastoral tests exposing false assurances","They are random rhetorical flourishes","They introduce Old Testament quotations only","They describe Roman legal formulas"]'::jsonb, 'They function as pastoral tests exposing false assurances', 'John uses repeated conditional claims to measure profession against truth, conduct, and God''s word (1 John 1:6, 8, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the best reading of John''s repeated ''if we say'' statements in 1 John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 1, 5, 'How does 1 John 1 support assurance without encouraging presumption?', '["It offers real cleansing through Jesus while refusing self-deceptive claims of sinlessness","It grounds assurance in human sincerity alone","It says sin no longer matters","It limits assurance to apostles"]'::jsonb, 'It offers real cleansing through Jesus while refusing self-deceptive claims of sinlessness', 'John gives confidence in Christ''s cleansing yet rejects denial of sin as self-deception (1 John 1:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 1 support assurance without encouraging presumption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 1, 'According to 1 John 2, why does John write these things?', '["So that you may not sin","So that you may gain riches","So that you may leave the church","So that you may avoid prayer"]'::jsonb, 'So that you may not sin', 'John writes so that his readers may not sin (1 John 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 2, why does John write these things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 1, 'According to 1 John 2, who is our Advocate with the Father?', '["Jesus Christ the righteous","Moses the servant","John the Baptist","Michael the archangel"]'::jsonb, 'Jesus Christ the righteous', 'If anyone sins, we have an Advocate with the Father, Jesus Christ the righteous (1 John 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 2, who is our Advocate with the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 1, 'According to 1 John 2, what is Jesus for our sins?', '["The atoning sacrifice","The temple curtain","The new high priesthood only","The Passover meal"]'::jsonb, 'The atoning sacrifice', 'Jesus is the atoning sacrifice for our sins (1 John 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 2, what is Jesus for our sins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 1, 'According to 1 John 2, how do we know that we know Jesus?', '["If we keep his commandments","If we speak loudly","If we travel often","If we know many teachers"]'::jsonb, 'If we keep his commandments', 'John says we know that we know him if we keep his commandments (1 John 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 2, how do we know that we know Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 1, 'According to 1 John 2, who is in the light?', '["The one who loves his brother","The one who hates correction","The one who trusts riches","The one who speaks first"]'::jsonb, 'The one who loves his brother', 'Whoever loves his brother remains in the light (1 John 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 2, who is in the light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 1, 'According to 1 John 2, what should believers not love?', '["The world","Their neighbors","The Scriptures","The brethren"]'::jsonb, 'The world', 'John commands, Do not love the world or the things in the world (1 John 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 2, what should believers not love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 1, 'According to 1 John 2, who is the liar?', '["The one who denies that Jesus is the Christ","The one who asks questions","The one who travels to many churches","The one who fasts often"]'::jsonb, 'The one who denies that Jesus is the Christ', 'John calls the denier of Jesus as the Christ the liar (1 John 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 2, who is the liar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 2, 'According to 1 John 2, for whose sins is Jesus the atoning sacrifice?', '["Not for ours only, but also for the whole world","Only for the apostles","Only for Israel","Only for the church in Ephesus"]'::jsonb, 'Not for ours only, but also for the whole world', 'John says Jesus is the atoning sacrifice not for ours only but also for the whole world (1 John 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 2, for whose sins is Jesus the atoning sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 2, 'According to 1 John 2, what is true of the person who says, ''I know him,'' but does not keep his commandments?', '["He is a liar","He is immature only","He is beyond correction","He is spiritually neutral"]'::jsonb, 'He is a liar', 'John says that claim is false if obedience is absent (1 John 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 2, what is true of the person who says, ''I know him,'' but does not keep his commandments?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 2, 'According to 1 John 2, what is perfected in the one who keeps God''s word?', '["The love of God","His public reputation","The wisdom of the age","His earthly inheritance"]'::jsonb, 'The love of God', 'Whoever keeps God''s word, truly in him the love of God has been perfected (1 John 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 2, what is perfected in the one who keeps God''s word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 2, 'According to 1 John 2, what does the one who says he remains in Christ ought to do?', '["Walk as Jesus walked","Avoid all labor","Leave his family","Seek political power"]'::jsonb, 'Walk as Jesus walked', 'John says the one who says he remains in Christ ought to walk as he walked (1 John 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 2, what does the one who says he remains in Christ ought to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 2, 'According to 1 John 2, what darkens the one who hates his brother?', '["Darkness blinds his eyes","Pride crowns his head","The law condemns his speech only","Angels oppose his travel"]'::jsonb, 'Darkness blinds his eyes', 'The one who hates his brother is in darkness, and the darkness has blinded his eyes (1 John 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 2, what darkens the one who hates his brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 2, 'According to 1 John 2, what three things are in the world?', '["The lust of the flesh, the lust of the eyes, and the pride of life","Gold, power, and fame","War, famine, and plague","Fear, doubt, and sleep"]'::jsonb, 'The lust of the flesh, the lust of the eyes, and the pride of life', 'John lists these three as what is in the world and not from the Father (1 John 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 2, what three things are in the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 2, 'According to 1 John 2, what remains forever?', '["The one who does God''s will","The glory of the world","The temple system","Human praise"]'::jsonb, 'The one who does God''s will', 'The world passes away, but the one who does God''s will remains forever (1 John 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 2, what remains forever?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 3, 'In 1 John 2, what does obedience reveal about someone''s claim to know God?', '["It confirms whether the claim is genuine","It is optional after conversion","It matters only for leaders","It replaces faith in Christ"]'::jsonb, 'It confirms whether the claim is genuine', 'John treats obedience as evidence that someone truly knows God (1 John 2:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 2, what does obedience reveal about someone''s claim to know God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 3, 'In 1 John 2, why can the command to love be called both old and new?', '["It is longstanding in God''s message yet freshly seen in Christ and his people","It changes meaning in every age","It belongs only to the new covenant and not before","It is old for Jews but new for Gentiles only"]'::jsonb, 'It is longstanding in God''s message yet freshly seen in Christ and his people', 'John says it is an old command they had from the beginning and also a new command true in Christ and in them (1 John 2:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 2, why can the command to love be called both old and new?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 3, 'In 1 John 2, what does hatred of a brother show despite verbal claims?', '["That the person still walks in darkness","That the person seeks justice","That the person is spiritually advanced","That the person is testing others"]'::jsonb, 'That the person still walks in darkness', 'John says the one claiming light while hating his brother is still in darkness (1 John 2:9, 11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 2, what does hatred of a brother show despite verbal claims?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 3, 'In 1 John 2, why is love for the world incompatible with love for the Father?', '["Because the world''s desires do not come from the Father","Because creation itself is evil","Because believers must leave society entirely","Because only poverty pleases God"]'::jsonb, 'Because the world''s desires do not come from the Father', 'John says the things in the world are not from the Father but from the world (1 John 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 2, why is love for the world incompatible with love for the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 3, 'In 1 John 2, what is the significance of many antichrists already being present?', '["It shows that the last hour is already underway","It proves Christ has already returned","It means no believers remain","It ends the need for discernment"]'::jsonb, 'It shows that the last hour is already underway', 'John says many antichrists have arisen, and by this we know it is the last hour (1 John 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 2, what is the significance of many antichrists already being present?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 3, 'In 1 John 2, what does departure from the community reveal about false teachers?', '["They were not truly of the apostolic fellowship","They were the strongest believers","They had received a better anointing","They were sent out as missionaries"]'::jsonb, 'They were not truly of the apostolic fellowship', 'John says they went out from us, but they were not of us (1 John 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 2, what does departure from the community reveal about false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 3, 'In 1 John 2, why does denying the Son also mean lacking the Father?', '["Because fellowship with the Father is inseparable from receiving the Son","Because the Father stopped speaking","Because only Jews know the Father","Because the Son replaces the Father"]'::jsonb, 'Because fellowship with the Father is inseparable from receiving the Son', 'John says no one who denies the Son has the Father, but one confessing the Son has the Father also (1 John 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 2, why does denying the Son also mean lacking the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 4, 'How does 1 John 2 balance moral seriousness with gospel comfort?', '["It urges believers not to sin while pointing sinners to Jesus the Advocate","It removes all concern for sin","It says comfort comes by self-defense","It offers law without mercy"]'::jsonb, 'It urges believers not to sin while pointing sinners to Jesus the Advocate', 'John writes against sin but immediately offers Christ''s advocacy and atoning work (1 John 2:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 2 balance moral seriousness with gospel comfort?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 4, 'How does 1 John 2 connect knowing God, obedience, and imitation of Christ?', '["Knowing God is shown in keeping his word and walking as Jesus walked","Knowing God excludes obedience","Imitation replaces faith","Obedience matters only for mature believers"]'::jsonb, 'Knowing God is shown in keeping his word and walking as Jesus walked', 'John ties knowing God to commandment keeping and says remaining in Christ means walking as he walked (1 John 2:3-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 2 connect knowing God, obedience, and imitation of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 4, 'How does brotherly love function in 1 John 2 as a test of spiritual condition?', '["Love shows life in the light, while hatred exposes darkness","Love is only a social courtesy","Hatred is acceptable if doctrine is sound","Love is less important than visions"]'::jsonb, 'Love shows life in the light, while hatred exposes darkness', 'John contrasts loving a brother with hating a brother as light versus darkness (1 John 2:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does brotherly love function in 1 John 2 as a test of spiritual condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 4, 'What larger contrast structures 1 John 2:15-17?', '["The passing world versus the enduring will of God","Jerusalem versus Rome","Law versus prophets","Silence versus speech"]'::jsonb, 'The passing world versus the enduring will of God', 'John contrasts a world that passes away with the person who does God''s will forever (1 John 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger contrast structures 1 John 2:15-17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 4, 'Why does 1 John 2 treat false teaching as both doctrinal and communal danger?', '["Because denial of the Son severs fellowship with God and breaks from the church","Because doctrine matters less than unity","Because every departure is harmless","Because only public teaching can deceive"]'::jsonb, 'Because denial of the Son severs fellowship with God and breaks from the church', 'John ties antichrist teaching to denying the Son and to going out from the community (1 John 2:19, 22-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 John 2 treat false teaching as both doctrinal and communal danger?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 4, 'How does the anointing theme in 1 John 2 serve John''s readers?', '["It reassures them that they have received truth enabling discernment","It gives secret knowledge beyond Scripture","It replaces every human teacher in all settings","It promises earthly success"]'::jsonb, 'It reassures them that they have received truth enabling discernment', 'John says his readers have an anointing from the Holy One and know the truth amid deception (1 John 2:20-21, 27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the anointing theme in 1 John 2 serve John''s readers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 4, 'What is the practical force of John''s command to let what they heard from the beginning remain in them?', '["They must stay anchored in the original apostolic message about the Son","They should seek newer revelations first","They must return to temple sacrifices","They should avoid all memory of the past"]'::jsonb, 'They must stay anchored in the original apostolic message about the Son', 'John tells them to abide in what they heard from the beginning so they remain in the Son and the Father (1 John 2:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the practical force of John''s command to let what they heard from the beginning remain in them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 5, 'In 1 John 2, what role does Jesus as Advocate play alongside Jesus as atoning sacrifice?', '["He both represents believers before the Father and secures their forgiveness","He only teaches moral lessons","He pleads without any sacrificial basis","He substitutes for the Father entirely"]'::jsonb, 'He both represents believers before the Father and secures their forgiveness', 'John presents Jesus as Advocate and atoning sacrifice in the same opening assurance (1 John 2:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 John 2, what role does Jesus as Advocate play alongside Jesus as atoning sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 5, 'Why does 1 John 2 present love of the world as a theological problem and not merely a behavioral one?', '["Because it reveals rival allegiance opposed to the Father''s will","Because material things are evil in themselves","Because believers may never enjoy creation","Because only monks can obey God"]'::jsonb, 'Because it reveals rival allegiance opposed to the Father''s will', 'John says love for the world excludes the Father''s love because worldly desires are not from him (1 John 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 John 2 present love of the world as a theological problem and not merely a behavioral one?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 5, 'What is the clearest meaning of antichrist in 1 John 2?', '["A present denier of the true identity of Jesus","A Roman emperor only","Any political enemy of Judea","A symbol for suffering in general"]'::jsonb, 'A present denier of the true identity of Jesus', 'John identifies the antichrist as the one denying the Father and the Son, especially denying Jesus as the Christ (1 John 2:18, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the clearest meaning of antichrist in 1 John 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 5, 'How does 1 John 2 use abiding as a response to deception?', '["By remaining in the original gospel and in the Son, believers resist deceivers","By withdrawing from all teaching","By trusting private visions first","By abandoning doctrine for love alone"]'::jsonb, 'By remaining in the original gospel and in the Son, believers resist deceivers', 'John warns about deceivers and answers by calling readers to abide in what they heard from the beginning (1 John 2:24-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 2 use abiding as a response to deception?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 5, 'What does 1 John 2 suggest about assurance at Christ''s coming?', '["Abiding in Christ prepares believers for confidence rather than shame","Assurance depends on public status","Only martyrs can stand unashamed","Fear is the proper final response for all"]'::jsonb, 'Abiding in Christ prepares believers for confidence rather than shame', 'John says to abide in him so that at his appearing we may have boldness and not shrink back in shame (1 John 2:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 John 2 suggest about assurance at Christ''s coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 5, 'Why is confession of the Son central in 1 John 2 rather than secondary to ethics?', '["Because right relation to the Father depends on receiving the Son truly","Because ethics alone save","Because doctrine matters only to teachers","Because confession replaces obedience entirely"]'::jsonb, 'Because right relation to the Father depends on receiving the Son truly', 'John says confessing the Son is the way one has the Father also (1 John 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is confession of the Son central in 1 John 2 rather than secondary to ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 2, 5, 'How does 1 John 2 link new birth and righteous practice?', '["Those who practice righteousness show they have been born of God","Righteous practice causes God to adopt people","Birth from God removes ethical obligation","Only teachers are born of God"]'::jsonb, 'Those who practice righteousness show they have been born of God', 'John says everyone who practices righteousness has been born of him (1 John 2:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 2 link new birth and righteous practice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 1, 'According to 1 John 3, what has the Father bestowed on us?', '["That we should be called children of God","A kingdom of silver","A new temple","A law written on stone"]'::jsonb, 'That we should be called children of God', 'John marvels that the Father has given us the love that we should be called children of God (1 John 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 3, what has the Father bestowed on us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 1, 'According to 1 John 3, why does the world not know us?', '["Because it did not know him","Because we speak another language","Because we hide from society","Because we reject creation"]'::jsonb, 'Because it did not know him', 'The world does not know us because it did not know him (1 John 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 3, why does the world not know us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 1, 'According to 1 John 3, what will we be like when Christ is revealed?', '["Like him","Like angels only","Like kings of earth","Like the prophets of old"]'::jsonb, 'Like him', 'When he is revealed, we shall be like him, for we shall see him as he is (1 John 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 3, what will we be like when Christ is revealed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 1, 'According to 1 John 3, what is sin?', '["Lawlessness","A lack of emotion","Only public failure","A ritual mistake only"]'::jsonb, 'Lawlessness', 'John defines sin as lawlessness (1 John 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 3, what is sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 1, 'According to 1 John 3, why was the Son of God revealed?', '["To destroy the works of the devil","To restore the temple tax","To give political liberty","To appoint earthly judges"]'::jsonb, 'To destroy the works of the devil', 'John says the Son of God was revealed for this purpose, to destroy the works of the devil (1 John 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 3, why was the Son of God revealed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 1, 'According to 1 John 3, whom should we not be like?', '["Cain","Abel","Noah","Samuel"]'::jsonb, 'Cain', 'John says we should not be like Cain, who was of the evil one and killed his brother (1 John 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 3, whom should we not be like?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 1, 'According to 1 John 3, how do we know love?', '["Because Jesus laid down his life for us","Because the world praises us","Because we keep our possessions","Because we avoid suffering"]'::jsonb, 'Because Jesus laid down his life for us', 'We know love by this, that Jesus laid down his life for us (1 John 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 3, how do we know love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 2, 'According to 1 John 3, what does everyone who has this hope in Christ do?', '["Purifies himself","Withdraws from prayer","Builds an altar","Avoids all work"]'::jsonb, 'Purifies himself', 'Everyone who has this hope set on Christ purifies himself, even as he is pure (1 John 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 3, what does everyone who has this hope in Christ do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 2, 'According to 1 John 3, what was true of Jesus regarding sin?', '["In him is no sin","He overcame only some sins","He confessed his own sins","He learned sin by experience"]'::jsonb, 'In him is no sin', 'John says Jesus appeared to take away sins, and in him is no sin (1 John 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 3, what was true of Jesus regarding sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 2, 'According to 1 John 3, what does the person who practices righteousness show?', '["That he is righteous, even as Christ is righteous","That he has no need of grace","That he is above temptation","That he should lead every church"]'::jsonb, 'That he is righteous, even as Christ is righteous', 'The one who practices righteousness is righteous, even as Christ is righteous (1 John 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 3, what does the person who practices righteousness show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 2, 'According to 1 John 3, why did Cain kill Abel?', '["Because Cain''s works were evil and his brother''s righteous","Because Abel stole his land","Because Abel mocked him publicly","Because Cain feared famine"]'::jsonb, 'Because Cain''s works were evil and his brother''s righteous', 'Cain killed Abel because his own works were evil and his brother''s righteous (1 John 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 3, why did Cain kill Abel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 2, 'According to 1 John 3, what have we passed out of because we love the brothers?', '["Death into life","Bondage into wealth","Ignorance into fame","Exile into office"]'::jsonb, 'Death into life', 'Love for the brothers shows that we have passed out of death into life (1 John 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 3, what have we passed out of because we love the brothers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 2, 'According to 1 John 3, what is true of everyone who hates his brother?', '["He is a murderer","He is merely immature","He is beyond judgment","He is spiritually gifted"]'::jsonb, 'He is a murderer', 'John says everyone who hates his brother is a murderer (1 John 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 3, what is true of everyone who hates his brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 2, 'According to 1 John 3, how should we love?', '["In deed and truth","In word only","In public speeches","In moments of ease only"]'::jsonb, 'In deed and truth', 'John says not to love in word only but in deed and truth (1 John 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 3, how should we love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 3, 'In 1 John 3, how does future hope affect present conduct?', '["Hope of seeing Christ produces a pursuit of purity","Hope makes conduct irrelevant","Hope removes the struggle with sin instantly","Hope is only for scholars"]'::jsonb, 'Hope of seeing Christ produces a pursuit of purity', 'John ties the hope of being like Christ to purifying oneself now (1 John 3:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 3, how does future hope affect present conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 3, 'In 1 John 3, what does habitual sin reveal about a person''s relation to Christ?', '["It shows a life not truly abiding in him","It proves freedom from the law","It is spiritually harmless","It is only a weakness in language"]'::jsonb, 'It shows a life not truly abiding in him', 'John says whoever remains in Christ does not keep sinning in the sense of settled practice (1 John 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 3, what does habitual sin reveal about a person''s relation to Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 3, 'In 1 John 3, what does Cain represent in John''s argument?', '["The pattern of hatred that opposes righteous brotherly love","The model of acceptable worship","A neutral family dispute","The end of sacrifice"]'::jsonb, 'The pattern of hatred that opposes righteous brotherly love', 'John uses Cain as the example of murderous hatred flowing from evil works (1 John 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 3, what does Cain represent in John''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 3, 'In 1 John 3, why does love for fellow believers indicate life?', '["Because love is evidence of passing from death into life","Because love removes the need for truth","Because love guarantees earthly success","Because love is merely natural affection"]'::jsonb, 'Because love is evidence of passing from death into life', 'John says we know we have passed from death to life because we love the brothers (1 John 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 3, why does love for fellow believers indicate life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 3, 'In 1 John 3, what does refusing to help a needy brother call into question?', '["Whether God''s love abides in that person","Whether church leaders approved him","Whether he owns enough property","Whether he knows the law of Moses"]'::jsonb, 'Whether God''s love abides in that person', 'John asks how God''s love can abide in one who closes his heart against a needy brother (1 John 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 3, what does refusing to help a needy brother call into question?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 3, 'In 1 John 3, what does a condemning heart do in contrast with God?', '["It accuses, but God is greater and knows all things","It always speaks more truly than God","It removes the need for prayer","It proves a person is unsaved in every case"]'::jsonb, 'It accuses, but God is greater and knows all things', 'John says if our heart condemns us, God is greater than our heart and knows all things (1 John 3:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 3, what does a condemning heart do in contrast with God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 3, 'In 1 John 3, what is John''s summary commandment?', '["Believe in Jesus'' name and love one another","Fast twice weekly and give alms","Offer incense and prayers daily","Study wisdom and avoid outsiders"]'::jsonb, 'Believe in Jesus'' name and love one another', 'John summarizes God''s command as faith in his Son and love for one another (1 John 3:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 3, what is John''s summary commandment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 4, 'How does 1 John 3 connect identity and ethics?', '["Being God''s children leads to a life that reflects his purity and love","Identity has no bearing on conduct","Conduct creates divine sonship from nothing","Only public ministry matters for identity"]'::jsonb, 'Being God''s children leads to a life that reflects his purity and love', 'John links being children of God to hope, purity, righteousness, and brotherly love (1 John 3:1-3, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 3 connect identity and ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 4, 'How does 1 John 3 use Christ''s appearing as both salvation and ethical model?', '["Christ appeared to take away sins, and his self-giving defines how believers love","His appearing matters only for prophecy charts","It excuses ongoing hatred","It concerns angels instead of humans"]'::jsonb, 'Christ appeared to take away sins, and his self-giving defines how believers love', 'John connects Christ''s appearing to taking away sins and to laying down his life as the model of love (1 John 3:5, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 3 use Christ''s appearing as both salvation and ethical model?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 4, 'What does 1 John 3 imply about indifference toward a needy brother?', '["It contradicts the claim that God''s love is abiding within","It is acceptable if doctrine is sound","It is wiser than generosity","It proves spiritual maturity"]'::jsonb, 'It contradicts the claim that God''s love is abiding within', 'John treats withheld compassion as incompatible with God''s abiding love (1 John 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 1 John 3 imply about indifference toward a needy brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 4, 'How does 1 John 3 move from assurance of heart to confidence in prayer?', '["A clear conscience before God supports boldness in asking according to his commands","Prayer depends on eloquence alone","Assurance comes from wealth and health","Only apostles may pray confidently"]'::jsonb, 'A clear conscience before God supports boldness in asking according to his commands', 'If our heart does not condemn us, we have boldness toward God and receive what we ask as we keep his commands (1 John 3:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 3 move from assurance of heart to confidence in prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 4, 'How does 1 John 3 combine faith and love rather than separating them?', '["The command is both to believe in the Son and to love one another","Faith replaces love entirely","Love makes belief optional","They belong to different groups of believers"]'::jsonb, 'The command is both to believe in the Son and to love one another', 'John states God''s command in two joined parts: faith in Jesus and love for one another (1 John 3:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 3 combine faith and love rather than separating them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 4, 'What role does the Spirit play at the end of 1 John 3?', '["The Spirit assures believers that God remains in them","The Spirit replaces Christ''s work","The Spirit cancels obedience","The Spirit speaks only through dreams"]'::jsonb, 'The Spirit assures believers that God remains in them', 'John says we know God remains in us by the Spirit he gave us (1 John 3:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What role does the Spirit play at the end of 1 John 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 4, 'How does 1 John 3 use abiding language to hold together obedience, assurance, and the Spirit?', '["Remaining in God is shown in keeping his command and confirmed by the Spirit he gives","Abiding means withdrawing from other believers","The Spirit makes obedience unnecessary","Assurance comes from effort apart from God"]'::jsonb, 'Remaining in God is shown in keeping his command and confirmed by the Spirit he gives', 'John says the one who keeps God''s commandments remains in him, and we know this by the Spirit he gave us (1 John 3:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 3 use abiding language to hold together obedience, assurance, and the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 5, 'Why does 1 John 3 treat persistent sin as incompatible with new birth?', '["Because God''s seed remains in the believer, opposing a settled pattern of sin","Because believers become incapable of any failure","Because forgiveness ends after baptism","Because only teachers are born of God"]'::jsonb, 'Because God''s seed remains in the believer, opposing a settled pattern of sin', 'John says one born of God does not live in ongoing sin because God''s seed remains in him (1 John 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 John 3 treat persistent sin as incompatible with new birth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 5, 'How does 1 John 3 distinguish Christian assurance from mere self-approval?', '["Assurance is grounded before God, who knows all things, and is tested by truth and love","Assurance is whatever a person feels strongly","Assurance comes through public applause","Assurance depends on avoiding all doubt by force"]'::jsonb, 'Assurance is grounded before God, who knows all things, and is tested by truth and love', 'John speaks of assuring our hearts before God, who is greater than our heart, in the context of loving in deed and truth (1 John 3:18-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 3 distinguish Christian assurance from mere self-approval?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 5, 'What theological point is strongest in 1 John 3''s contrast between Cain and Christ?', '["The children of God are marked by self-giving love, not murderous envy","Both figures illustrate acceptable devotion","Hatred is morally neutral if one feels wronged","Violence can serve righteousness"]'::jsonb, 'The children of God are marked by self-giving love, not murderous envy', 'John contrasts Cain''s hatred with Christ''s laying down his life, defining true love (1 John 3:12, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological point is strongest in 1 John 3''s contrast between Cain and Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 5, 'How does 1 John 3 define the visible distinction between children of God and children of the devil?', '["By righteous practice and love for brothers","By ethnic descent","By miraculous signs alone","By social status in the church"]'::jsonb, 'By righteous practice and love for brothers', 'John says the difference is evident in who practices righteousness and loves his brother (1 John 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 3 define the visible distinction between children of God and children of the devil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 5, 'Why is brotherly love in 1 John 3 more than an emotional ideal?', '["It is defined by Christ''s sacrificial action and expressed in concrete care","It depends on natural personality only","It is fulfilled by polite words alone","It belongs only to church leaders"]'::jsonb, 'It is defined by Christ''s sacrificial action and expressed in concrete care', 'John grounds love in Jesus laying down his life and in sharing with a needy brother (1 John 3:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is brotherly love in 1 John 3 more than an emotional ideal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 5, 'What does 1 John 3 suggest about obedience and answered prayer?', '["Confident prayer belongs to those abiding in God and seeking what pleases him","Prayer manipulates God when repeated enough","Answered prayer belongs only to the sinless","Prayer is unrelated to obedience"]'::jsonb, 'Confident prayer belongs to those abiding in God and seeking what pleases him', 'John links receiving what we ask with keeping God''s commandments and doing what is pleasing to him (1 John 3:22-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 John 3 suggest about obedience and answered prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 3, 5, 'How does 1 John 3 use future vision of Christ to shape present discipleship?', '["The promise of seeing him as he is calls believers into present purification","The future vision makes present holiness unnecessary","Only mystics will see Christ","The vision is about earthly politics"]'::jsonb, 'The promise of seeing him as he is calls believers into present purification', 'John says hope in Christ''s appearing leads believers to purify themselves now (1 John 3:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 3 use future vision of Christ to shape present discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 1, 'According to 1 John 4, what should believers test?', '["The spirits","The seasons","The stars","The nations"]'::jsonb, 'The spirits', 'John tells believers not to believe every spirit, but to test the spirits (1 John 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 4, what should believers test?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 1, 'According to 1 John 4, what confession identifies the Spirit of God?', '["Jesus Christ has come in the flesh","Jesus was only a prophet","The law alone saves","The Father has no Son"]'::jsonb, 'Jesus Christ has come in the flesh', 'Every spirit confessing Jesus Christ has come in the flesh is from God (1 John 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 4, what confession identifies the Spirit of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 1, 'According to 1 John 4, who is greater than the one in the world?', '["He who is in you","The strongest ruler","The one with many followers","The spirit of the age"]'::jsonb, 'He who is in you', 'John says greater is he who is in you than he who is in the world (1 John 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 4, who is greater than the one in the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 1, 'According to 1 John 4, what is God?', '["Love","Power only","A hidden force","An unknown mystery only"]'::jsonb, 'Love', 'John twice states that God is love (1 John 4:8, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 4, what is God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 1, 'According to 1 John 4, whom did God send into the world?', '["His only Son","Only an angel","A prophet like Elijah","A new lawgiver"]'::jsonb, 'His only Son', 'God sent his only Son into the world that we might live through him (1 John 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 4, whom did God send into the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 1, 'According to 1 John 4, what does perfect love cast out?', '["Fear","Wisdom","Hope","Discipline"]'::jsonb, 'Fear', 'There is no fear in love, but perfect love casts out fear (1 John 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 4, what does perfect love cast out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 1, 'According to 1 John 4, why do we love?', '["Because he first loved us","Because we earned his favor","Because fear drives us","Because the world rewards us"]'::jsonb, 'Because he first loved us', 'We love because he first loved us (1 John 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 4, why do we love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 2, 'According to 1 John 4, why should believers test the spirits?', '["Because many false prophets have gone out into the world","Because all teachers are unreliable","Because miracles are evil","Because prayer is uncertain"]'::jsonb, 'Because many false prophets have gone out into the world', 'John gives the reason for testing spirits: many false prophets are in the world (1 John 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 4, why should believers test the spirits?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 2, 'According to 1 John 4, what spirit does not confess Jesus?', '["The spirit of the antichrist","The spirit of Moses","The spirit of prophecy","The spirit of wisdom"]'::jsonb, 'The spirit of the antichrist', 'John says the spirit not confessing Jesus is the spirit of the antichrist (1 John 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 4, what spirit does not confess Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 2, 'According to 1 John 4, why does the world listen to false teachers?', '["Because they are from the world and speak from it","Because truth is unclear","Because the apostles stayed silent","Because love requires agreement"]'::jsonb, 'Because they are from the world and speak from it', 'John says false teachers are from the world, therefore the world listens to them (1 John 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 4, why does the world listen to false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 2, 'According to 1 John 4, how is God''s love manifested toward us?', '["He sent his only Son so that we might live through him","He spared us all suffering","He restored Israel''s throne","He hid our sins without dealing with them"]'::jsonb, 'He sent his only Son so that we might live through him', 'God''s love was revealed in sending his only Son into the world for our life (1 John 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 4, how is God''s love manifested toward us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 2, 'According to 1 John 4, what did God send his Son to be?', '["The atoning sacrifice for our sins","The judge of Israel only","The new temple priest only","The ruler of Rome"]'::jsonb, 'The atoning sacrifice for our sins', 'John says God sent his Son to be the atoning sacrifice for our sins (1 John 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 4, what did God send his Son to be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 2, 'According to 1 John 4, what happens if we love one another?', '["God remains in us and his love is perfected in us","We avoid all trials","We become equal to Christ","We no longer need discernment"]'::jsonb, 'God remains in us and his love is perfected in us', 'When we love one another, God remains in us and his love is perfected in us (1 John 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 4, what happens if we love one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 2, 'According to 1 John 4, who has the Father sent as Savior of the world?', '["The Son","John the Baptist","Michael","Peter"]'::jsonb, 'The Son', 'John says the Father has sent the Son as the Savior of the world (1 John 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 4, who has the Father sent as Savior of the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 3, 'In 1 John 4, why is confessing Jesus'' incarnation a decisive test?', '["Because true teaching must affirm the real coming of the Son in flesh","Because doctrine about creation is enough","Because moral sincerity alone defines truth","Because only miracles prove a spirit"]'::jsonb, 'Because true teaching must affirm the real coming of the Son in flesh', 'John makes confession that Jesus Christ has come in the flesh the test for whether a spirit is from God (1 John 4:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 4, why is confessing Jesus'' incarnation a decisive test?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 3, 'In 1 John 4, what does the phrase ''God is love'' mean in context?', '["God''s character is displayed in self-giving action toward sinners","Love is a vague feeling without truth","Any human affection is automatically divine","God ignores holiness because he is love"]'::jsonb, 'God''s character is displayed in self-giving action toward sinners', 'John explains God''s love by the sending of the Son as atoning sacrifice (1 John 4:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 4, what does the phrase ''God is love'' mean in context?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 3, 'In 1 John 4, why does love among believers matter theologically?', '["Because unseen God is made evident in his people through mutual love","Because love replaces truth about Jesus","Because only love for enemies matters","Because love guarantees worldly approval"]'::jsonb, 'Because unseen God is made evident in his people through mutual love', 'Though no one has seen God, love among believers shows God remaining in them (1 John 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 4, why does love among believers matter theologically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 3, 'In 1 John 4, what is the relationship between God''s Spirit and Christian assurance?', '["The Spirit given by God confirms that we remain in him and he in us","The Spirit removes the need for confession","The Spirit speaks apart from Jesus","The Spirit is known only by emotional intensity"]'::jsonb, 'The Spirit given by God confirms that we remain in him and he in us', 'John says we know that we remain in him because he has given us of his Spirit (1 John 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 4, what is the relationship between God''s Spirit and Christian assurance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 3, 'In 1 John 4, what does fear show when contrasted with perfected love?', '["Fear relates to punishment and is driven out as love is brought to maturity","Fear is the highest Christian virtue","Fear and love are unrelated","Fear disappears once suffering ends"]'::jsonb, 'Fear relates to punishment and is driven out as love is brought to maturity', 'John says fear has punishment, and perfect love casts out fear (1 John 4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 4, what does fear show when contrasted with perfected love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 3, 'In 1 John 4, why is loving an unseen God impossible without loving a seen brother?', '["Because failure to love the visible brother exposes the falsity of the claim to love God","Because God is less important than people","Because brotherly love earns salvation","Because sight alone creates love"]'::jsonb, 'Because failure to love the visible brother exposes the falsity of the claim to love God', 'John says one who does not love his brother whom he has seen cannot love God whom he has not seen (1 John 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 4, why is loving an unseen God impossible without loving a seen brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 3, 'In 1 John 4, what joins confession and love in John''s argument?', '["Both are marks of abiding in God","Confession matters, but love does not","Love matters, but confession does not","They belong to different stages of faith"]'::jsonb, 'Both are marks of abiding in God', 'John links confessing Jesus as Son of God and loving one another with abiding in God (1 John 4:15-16, 21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 4, what joins confession and love in John''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 4, 'How does 1 John 4 connect doctrinal discernment with the life of love?', '["True faith both confesses the incarnate Son and practices love shaped by God''s sending","Doctrine matters but love does not","Love matters but doctrine does not","Neither is testable in practice"]'::jsonb, 'True faith both confesses the incarnate Son and practices love shaped by God''s sending', 'John tests spirits by confession of Jesus and then grounds love in God''s sending of his Son (1 John 4:2, 9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 4 connect doctrinal discernment with the life of love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 4, 'How does 1 John 4 portray Christian boldness for the day of judgment?', '["Mature love gives confidence because believers share Christ''s standing in this world","Boldness comes from denying judgment","Only sinless people may be bold","Boldness comes from worldly influence"]'::jsonb, 'Mature love gives confidence because believers share Christ''s standing in this world', 'John says love is perfected with us so that we may have boldness in the day of judgment, because as he is, so are we in this world (1 John 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 4 portray Christian boldness for the day of judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 4, 'Why does 1 John 4 say no one has seen God in the middle of a discussion about love?', '["To show that God''s unseen presence becomes evident as believers love one another","To deny all knowledge of God","To end discussion of doctrine","To promote mystical visions"]'::jsonb, 'To show that God''s unseen presence becomes evident as believers love one another', 'John says no one has seen God, yet if we love one another, God remains in us (1 John 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 John 4 say no one has seen God in the middle of a discussion about love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 4, 'How does 1 John 4 hold together God''s initiative and human response?', '["God first loved and sent his Son, so believers respond by loving one another","Human love starts the relationship with God","God waits for human worthiness before acting","Response is unnecessary once doctrine is correct"]'::jsonb, 'God first loved and sent his Son, so believers respond by loving one another', 'John defines love by God''s prior action in sending his Son and then commands believers to love one another (1 John 4:10-11, 19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 4 hold together God''s initiative and human response?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 4, 'What does 1 John 4 suggest about the source of false teaching''s appeal?', '["It resonates with the world because it speaks from the world''s perspective","It is irresistible to all believers","It comes from the apostles themselves","It prevails because God is absent"]'::jsonb, 'It resonates with the world because it speaks from the world''s perspective', 'John says false teachers are from the world, and the world hears them (1 John 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 1 John 4 suggest about the source of false teaching''s appeal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 4, 'How does 1 John 4 define the church''s obligation to love?', '["If God loved us in this way, we also ought to love one another","Love is optional for mature believers","Only those with spiritual gifts must love","Love is needed only during conflict"]'::jsonb, 'If God loved us in this way, we also ought to love one another', 'John draws the ethical conclusion directly from God''s prior love in Christ (1 John 4:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 4 define the church''s obligation to love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 4, 'What tension does 1 John 4 remove by joining love and judgment?', '["Love does not erase judgment; it prepares believers for it with confidence","Judgment cancels love entirely","Love means judgment never existed","Only fear can prepare for judgment"]'::jsonb, 'Love does not erase judgment; it prepares believers for it with confidence', 'John speaks of perfected love giving boldness for the day of judgment rather than ignoring it (1 John 4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What tension does 1 John 4 remove by joining love and judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 5, 'Why is the confession that Jesus Christ has come in the flesh especially important in 1 John 4?', '["It rejects teaching that severs the divine Son from real human incarnation","It simply repeats a minor formula","It is only for baptismal ceremonies","It concerns Jesus'' birth place, not his person"]'::jsonb, 'It rejects teaching that severs the divine Son from real human incarnation', 'John makes the incarnation confession the key doctrinal test against antichrist error (1 John 4:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the confession that Jesus Christ has come in the flesh especially important in 1 John 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 5, 'How does 1 John 4 guard against reducing love to sentimentality?', '["It defines love by God''s sending of the Son as atoning sacrifice","It says love ignores truth and sin","It grounds love in personal preference","It measures love by popularity"]'::jsonb, 'It defines love by God''s sending of the Son as atoning sacrifice', 'John says in this is love: not that we loved God, but that he loved us and sent his Son (1 John 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 4 guard against reducing love to sentimentality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 5, 'What does 1 John 4 imply about the inseparability of theology and ethics?', '["Right confession of Jesus and genuine love for others belong together in abiding faith","Theology matters, but ethics never do","Ethics matter, but confession is irrelevant","Neither can be known in this life"]'::jsonb, 'Right confession of Jesus and genuine love for others belong together in abiding faith', 'John binds together confession of the Son, God''s indwelling Spirit, and love for brothers (1 John 4:2, 13, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 John 4 imply about the inseparability of theology and ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 5, 'Why does 1 John 4 say perfect love casts out fear rather than all reverence?', '["Because the fear in view is fear of punishment, not humble awe before God","Because reverence is obsolete in Christ","Because believers never face judgment language","Because fear refers only to enemies"]'::jsonb, 'Because the fear in view is fear of punishment, not humble awe before God', 'John explains that fear has punishment, showing the specific fear he means (1 John 4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 John 4 say perfect love casts out fear rather than all reverence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 5, 'How does 1 John 4 use apostolic witness in relation to the Spirit?', '["The Spirit of truth aligns listeners with the apostolic testimony about the Son","The Spirit bypasses apostolic witness entirely","The apostles spoke only from the world","The Spirit and witness are unrelated"]'::jsonb, 'The Spirit of truth aligns listeners with the apostolic testimony about the Son', 'John says ''we are from God'' and distinguishes the Spirit of truth from error by response to apostolic witness (1 John 4:6, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 4 use apostolic witness in relation to the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 5, 'What is the deepest contradiction exposed by claiming to love God while hating a brother?', '["A false claim about invisible devotion unmasked by visible lovelessness","A normal stage of spiritual growth","A purely emotional inconsistency","A problem fixed by stronger rituals"]'::jsonb, 'A false claim about invisible devotion unmasked by visible lovelessness', 'John calls such a person a liar because visible love for a brother tests the claim to love the unseen God (1 John 4:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the deepest contradiction exposed by claiming to love God while hating a brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 4, 5, 'How does 1 John 4 show that assurance is both doctrinal and relational?', '["Confidence grows where the true Son is confessed and God''s love is brought to maturity among believers","Assurance depends only on strong feelings","Doctrine alone gives assurance without love","Love alone gives assurance without truth about Jesus"]'::jsonb, 'Confidence grows where the true Son is confessed and God''s love is brought to maturity among believers', 'John ties abiding assurance to confessing the Son, receiving the Spirit, and perfected love that gives boldness (1 John 4:15-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 4 show that assurance is both doctrinal and relational?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 1, 'According to 1 John 5, who is born of God?', '["Whoever believes that Jesus is the Christ","Whoever is born in Israel","Whoever keeps a vow","Whoever sees an angel"]'::jsonb, 'Whoever believes that Jesus is the Christ', 'John says everyone who believes that Jesus is the Christ has been born of God (1 John 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 5, who is born of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 1, 'According to 1 John 5, what are God''s commandments not?', '["Burdensome","True","Holy","Good"]'::jsonb, 'Burdensome', 'John says God''s commandments are not burdensome (1 John 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 5, what are God''s commandments not?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 1, 'According to 1 John 5, what has overcome the world?', '["Our faith","Our wisdom","Our heritage","Our zeal"]'::jsonb, 'Our faith', 'This is the victory that has overcome the world: our faith (1 John 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 5, what has overcome the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 1, 'According to 1 John 5, by what did Jesus Christ come?', '["By water and blood","By fire and cloud","By law and sacrifice","By sword and crown"]'::jsonb, 'By water and blood', 'John says Jesus Christ came by water and blood (1 John 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 5, by what did Jesus Christ come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 1, 'According to 1 John 5, who testifies because he is the truth?', '["The Spirit","John only","The law","The church"]'::jsonb, 'The Spirit', 'The Spirit is the one who testifies, because the Spirit is the truth (1 John 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 5, who testifies because he is the truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 1, 'According to 1 John 5, where is eternal life found?', '["In God''s Son","In human effort","In the temple","In earthly wisdom"]'::jsonb, 'In God''s Son', 'God gave us eternal life, and this life is in his Son (1 John 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 5, where is eternal life found?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 1, 'According to 1 John 5, from what should little children keep themselves?', '["Idols","Storms","Crowds","Debts"]'::jsonb, 'Idols', 'John closes the letter by saying, Little children, keep yourselves from idols (1 John 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 John 5, from what should little children keep themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 2, 'According to 1 John 5, how do we know that we love the children of God?', '["When we love God and keep his commandments","When we avoid all conflict","When we praise them publicly","When we agree on everything"]'::jsonb, 'When we love God and keep his commandments', 'John says we know we love God''s children when we love God and do his commandments (1 John 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 5, how do we know that we love the children of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 2, 'According to 1 John 5, who overcomes the world?', '["The one who believes that Jesus is the Son of God","The one who keeps the law of Moses","The one who rules a nation","The one who avoids suffering"]'::jsonb, 'The one who believes that Jesus is the Son of God', 'John says the overcomer is the one believing Jesus is the Son of God (1 John 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 5, who overcomes the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 2, 'According to 1 John 5, what three testify?', '["The Spirit, the water, and the blood","Faith, hope, and love","The law, the prophets, and the writings","Peter, James, and John"]'::jsonb, 'The Spirit, the water, and the blood', 'John says the Spirit, the water, and the blood testify, and the three agree (1 John 5:7-8 in many English numberings, cf. 1 John 5:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 5, what three testify?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 2, 'According to 1 John 5, what is God''s testimony?', '["That he has given us eternal life in his Son","That all people are already safe","That law-keeping gives life","That prophets alone know the truth"]'::jsonb, 'That he has given us eternal life in his Son', 'God''s testimony is that he gave us eternal life, and this life is in his Son (1 John 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 5, what is God''s testimony?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 2, 'According to 1 John 5, why did John write these things to believers?', '["So that they may know they have eternal life","So that they may seek another gospel","So that they may stop praying","So that they may fear judgment always"]'::jsonb, 'So that they may know they have eternal life', 'John writes so believers in the Son''s name may know they have eternal life (1 John 5:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 5, why did John write these things to believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 2, 'According to 1 John 5, when does God hear us in prayer?', '["When we ask anything according to his will","When we ask with long repetition","Only at the temple","Only if we never doubted"]'::jsonb, 'When we ask anything according to his will', 'John says this is our confidence: if we ask anything according to his will, he hears us (1 John 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 5, when does God hear us in prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 2, 'According to 1 John 5, what is true of the whole world?', '["It lies in the power of the evil one","It already loves the Father","It has no need of redemption","It is ruled by the apostles"]'::jsonb, 'It lies in the power of the evil one', 'John says the whole world lies in the power of the evil one (1 John 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 John 5, what is true of the whole world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 3, 'In 1 John 5, how are faith, love, and obedience related?', '["New birth produces faith in Christ, love for God''s family, and obedient living","They compete with each other","Only faith matters after conversion","Love cancels obedience"]'::jsonb, 'New birth produces faith in Christ, love for God''s family, and obedient living', 'John links being born of God with believing Jesus is the Christ, loving God''s children, and keeping commandments (1 John 5:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 5, how are faith, love, and obedience related?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 3, 'In 1 John 5, why are God''s commandments not burdensome?', '["Because those born of God overcome the world through faith","Because God lowers his standards","Because obedience is unnecessary","Because only leaders must obey"]'::jsonb, 'Because those born of God overcome the world through faith', 'John says the commandments are not burdensome, then explains that whatever is born of God overcomes the world (1 John 5:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 5, why are God''s commandments not burdensome?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 3, 'In 1 John 5, what is the force of saying the Spirit, water, and blood agree?', '["Their united witness confirms the true identity and saving work of Jesus","They symbolize three unrelated virtues","They deny the need for faith","They point only to creation"]'::jsonb, 'Their united witness confirms the true identity and saving work of Jesus', 'John presents converging testimony that supports who Jesus is and what God has done in him (1 John 5:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 5, what is the force of saying the Spirit, water, and blood agree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 3, 'In 1 John 5, what does refusing God''s testimony about the Son amount to?', '["Making God a liar","Showing intellectual caution","Needing more miracles only","Questioning minor details"]'::jsonb, 'Making God a liar', 'John says the one not believing God has made him a liar because he has not believed God''s testimony about the Son (1 John 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 5, what does refusing God''s testimony about the Son amount to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 3, 'In 1 John 5, why is assurance of eternal life possible in the present?', '["Because life is already given in the Son to those who believe","Because no future judgment exists","Because feelings are enough","Because church membership guarantees it"]'::jsonb, 'Because life is already given in the Son to those who believe', 'John writes so believers may know they have eternal life because that life is in the Son (1 John 5:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 5, why is assurance of eternal life possible in the present?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 3, 'In 1 John 5, how does John distinguish sin leading to death from other sin?', '["He recognizes a serious category for which he does not encourage prayer in the same way","He says all sins are identical in consequence","He denies that believers ever sin","He explains it fully with no ambiguity"]'::jsonb, 'He recognizes a serious category for which he does not encourage prayer in the same way', 'John speaks of sin leading to death and says he is not saying one should make request concerning that (1 John 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 5, how does John distinguish sin leading to death from other sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 3, 'In 1 John 5, what does John''s closing contrast emphasize about believers and the world?', '["Believers are from God even while the whole world lies under the evil one","Believers and the world share the same master","The world has already been fully renewed","Believers should fear the evil one above all"]'::jsonb, 'Believers are from God even while the whole world lies under the evil one', 'John says we are of God, and the whole world lies in the evil one (1 John 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 John 5, what does John''s closing contrast emphasize about believers and the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 4, 'How does 1 John 5 summarize the letter''s major marks of genuine faith?', '["Belief in Jesus, love for God''s children, and obedience to God''s commands","Visions, eloquence, and public honor","Birthright, ritual, and status","Withdrawal, silence, and private insight"]'::jsonb, 'Belief in Jesus, love for God''s children, and obedience to God''s commands', 'The chapter weaves together faith, love, and obedience as signs of those born of God (1 John 5:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 5 summarize the letter''s major marks of genuine faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 4, 'How does 1 John 5 connect victory over the world with Christology?', '["Victory belongs to those who believe Jesus is the Son of God","Victory comes from national strength","Victory comes through personal discipline alone","Victory comes from avoiding all conflict"]'::jsonb, 'Victory belongs to those who believe Jesus is the Son of God', 'John asks who overcomes the world except the one believing Jesus is the Son of God (1 John 5:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 5 connect victory over the world with Christology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 4, 'Why does 1 John 5 appeal to divine testimony as greater than human testimony?', '["Because assurance about the Son rests on God''s own witness, which is decisive","Because human witnesses never matter","Because only private experience is valid","Because reason is opposed to faith"]'::jsonb, 'Because assurance about the Son rests on God''s own witness, which is decisive', 'John argues that if we receive human testimony, God''s testimony is greater concerning his Son (1 John 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 John 5 appeal to divine testimony as greater than human testimony?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 4, 'How does 1 John 5 move from assurance to prayer?', '["Knowing eternal life in the Son leads to confidence in asking according to God''s will","Prayer replaces assurance entirely","Only uncertain believers should pray","Prayer is unrelated to eternal life"]'::jsonb, 'Knowing eternal life in the Son leads to confidence in asking according to God''s will', 'After saying believers may know they have eternal life, John immediately speaks of confidence in prayer according to God''s will (1 John 5:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 5 move from assurance to prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 4, 'What does 1 John 5 imply about intercession for a sinning brother?', '["Believers should pray for brothers whose sin is not unto death, trusting God to give life","Every sin must be ignored","Prayer for others is discouraged","Intercession belongs only to apostles"]'::jsonb, 'Believers should pray for brothers whose sin is not unto death, trusting God to give life', 'John says if anyone sees his brother sinning a sin not leading to death, he should ask and God will give life (1 John 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 1 John 5 imply about intercession for a sinning brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 4, 'How does 1 John 5 use the phrase ''we know'' near the end of the letter?', '["To restate settled convictions about new birth, protection, and the true God in Christ","To introduce uncertain speculation","To shift away from doctrine","To deny mystery entirely"]'::jsonb, 'To restate settled convictions about new birth, protection, and the true God in Christ', 'John closes with repeated ''we know'' statements about believers, the world, and the Son of God (1 John 5:18-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 John 5 use the phrase ''we know'' near the end of the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 4, 'What does 1 John 5 suggest about idolatry in the context of the whole letter?', '["Anything rivaling the true God revealed in his Son must be rejected","Idolatry refers only to carved statues in pagan temples","Idolatry is unrelated to false teaching","Idolatry no longer threatens believers"]'::jsonb, 'Anything rivaling the true God revealed in his Son must be rejected', 'The final warning follows John''s strong emphasis on the true God and eternal life in his Son (1 John 5:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 1 John 5 suggest about idolatry in the context of the whole letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 5, 'What is the strongest function of the witness language in 1 John 5?', '["To present a converging case from God himself about the identity and saving significance of the Son","To replace faith with legal argument alone","To deny the role of the Spirit","To focus on John rather than Jesus"]'::jsonb, 'To present a converging case from God himself about the identity and saving significance of the Son', 'John gathers the Spirit, water, blood, and God''s testimony to confirm the Son and the life found in him (1 John 5:6-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the strongest function of the witness language in 1 John 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 5, 'How does 1 John 5 hold assurance and dependence together?', '["Believers can know they have eternal life while still praying in submission to God''s will","Assurance removes the need for prayer","Dependence means assurance is impossible","Only leaders may know eternal life"]'::jsonb, 'Believers can know they have eternal life while still praying in submission to God''s will', 'John gives certainty of eternal life and then frames prayer by the condition of God''s will (1 John 5:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 5 hold assurance and dependence together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 5, 'Why does 1 John 5 close by calling Jesus Christ ''the true God and eternal life''?', '["To seal the letter''s witness that true life and true knowledge of God are found in the Son","To distinguish Jesus from eternal life","To deny the Father''s deity","To summarize only moral teaching"]'::jsonb, 'To seal the letter''s witness that true life and true knowledge of God are found in the Son', 'John says the Son has come so we may know him who is true, and then identifies Jesus Christ as the true God and eternal life (1 John 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 John 5 close by calling Jesus Christ ''the true God and eternal life''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 5, 'What does 1 John 5 imply about spiritual protection for the one born of God?', '["The evil one does not lay hold of the one kept by God","Believers must fear constant defeat","Protection means absence of temptation","Protection belongs only to apostles"]'::jsonb, 'The evil one does not lay hold of the one kept by God', 'John says the one born of God is kept, and the evil one does not touch him in the decisive sense John describes (1 John 5:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 John 5 imply about spiritual protection for the one born of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 5, 'How does 1 John 5 present obedience as freedom rather than burden?', '["Because new birth and faith enable a victory that makes God''s commands fitting rather than crushing","Because God lowers every command to preference","Because obedience is symbolic only","Because burdens belong only to the Old Testament"]'::jsonb, 'Because new birth and faith enable a victory that makes God''s commands fitting rather than crushing', 'John says God''s commands are not burdensome and explains this in terms of new birth and overcoming faith (1 John 5:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 5 present obedience as freedom rather than burden?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 5, 'Why is the final warning against idols a fitting conclusion to 1 John?', '["Because the whole letter has called believers to cling to the true God revealed in the Son against every rival","Because idols were John''s only concern from the start","Because ethics and doctrine no longer matter","Because idols refer only to political emblems"]'::jsonb, 'Because the whole letter has called believers to cling to the true God revealed in the Son against every rival', 'After stressing the true God and eternal life in the Son, John ends by warning against substitutes and rivals (1 John 5:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the final warning against idols a fitting conclusion to 1 John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 62, 5, 5, 'How does 1 John 5 present certainty as rooted in revelation rather than self-confidence?', '["Believers know because God has testified concerning his Son and given understanding through him","Believers know because they never struggle","Believers know because human testimony is always enough","Believers know by ignoring doctrine"]'::jsonb, 'Believers know because God has testified concerning his Son and given understanding through him', 'John grounds certainty in God''s testimony about the Son and in the Son''s coming to give understanding (1 John 5:9-13, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 62
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 John 5 present certainty as rooted in revelation rather than self-confidence?'
);
