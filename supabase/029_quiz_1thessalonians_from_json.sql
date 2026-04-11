-- ============================================================================
-- LOGOS LIGHT - 1 Thessalonians (book 52) quiz questions from quiz-questions/1thessalonians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 1, 'According to 1 Thessalonians 1, to whom is the letter addressed?', '["The assembly of the Thessalonians","The assembly of the Galatians","The assembly of the Philippians","The assembly of the Romans"]'::jsonb, 'The assembly of the Thessalonians', 'Paul, Silvanus, and Timothy address the assembly of the Thessalonians in God the Father and the Lord Jesus Christ (1 Thessalonians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 1, to whom is the letter addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 1, 'According to 1 Thessalonians 1, what three things does Paul remember about the Thessalonians?', '["Work of faith, labor of love, and patience of hope","Wisdom, power, and honor","Law, sacrifice, and priesthood","Vision, fasting, and silence"]'::jsonb, 'Work of faith, labor of love, and patience of hope', 'Paul remembers their work of faith, labor of love, and patience of hope in the Lord Jesus (1 Thessalonians 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 1, what three things does Paul remember about the Thessalonians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 1, 'According to 1 Thessalonians 1, in what did the gospel come to the Thessalonians?', '["Power, the Holy Spirit, and much assurance","Only in written form","Signs in the sky","Temple rituals alone"]'::jsonb, 'Power, the Holy Spirit, and much assurance', 'Paul says the gospel came not in word only, but also in power, in the Holy Spirit, and in much assurance (1 Thessalonians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 1, in what did the gospel come to the Thessalonians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 1, 'According to 1 Thessalonians 1, what did the Thessalonians receive with joy?', '["The word","The law","Circumcision","A new temple"]'::jsonb, 'The word', 'They received the word in much affliction with joy of the Holy Spirit (1 Thessalonians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 1, what did the Thessalonians receive with joy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 1, 'According to 1 Thessalonians 1, in what regions did the Thessalonians become an example?', '["Macedonia and Achaia","Galilee and Judea","Asia and Bithynia","Rome and Spain"]'::jsonb, 'Macedonia and Achaia', 'They became an example to all who believe in Macedonia and in Achaia (1 Thessalonians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 1, in what regions did the Thessalonians become an example?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 1, 'According to 1 Thessalonians 1, what sounded out from the Thessalonians?', '["The Lord''s word","A trumpet from heaven","The voice of Moses","Their own wisdom"]'::jsonb, 'The Lord''s word', 'Paul says the Lord''s word sounded out from them, not only in Macedonia and Achaia but in every place (1 Thessalonians 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 1, what sounded out from the Thessalonians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 1, 'According to 1 Thessalonians 1, from what had the Thessalonians turned?', '["Idols","The prophets","Jerusalem","The Scriptures"]'::jsonb, 'Idols', 'They turned to God from idols to serve a living and true God (1 Thessalonians 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 1, from what had the Thessalonians turned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 2, 'How did the Thessalonians become imitators according to 1 Thessalonians 1?', '["By imitating Paul, his companions, and the Lord","By following the Pharisees","By copying Roman rulers","By adopting Greek philosophy"]'::jsonb, 'By imitating Paul, his companions, and the Lord', 'Paul says they became imitators of us and of the Lord (1 Thessalonians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did the Thessalonians become imitators according to 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 2, 'What accompanied the Thessalonians'' reception of the word in 1 Thessalonians 1?', '["Much affliction and joy of the Holy Spirit","Peace with all opponents","Immediate wealth","Freedom from suffering"]'::jsonb, 'Much affliction and joy of the Holy Spirit', 'They received the word in much affliction with joy of the Holy Spirit (1 Thessalonians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What accompanied the Thessalonians'' reception of the word in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 2, 'What does Paul say happened to the Thessalonians'' faith in 1 Thessalonians 1?', '["It spread abroad toward God in every place","It remained hidden","It failed under pressure","It stayed only in Thessalonica"]'::jsonb, 'It spread abroad toward God in every place', 'Paul says their faith toward God has gone out everywhere (1 Thessalonians 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say happened to the Thessalonians'' faith in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 2, 'Whom were the Thessalonians waiting for from heaven according to 1 Thessalonians 1?', '["God''s Son","Moses","Elijah","An archangel only"]'::jsonb, 'God''s Son', 'Paul says they wait for God''s Son from heaven, whom he raised from the dead (1 Thessalonians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom were the Thessalonians waiting for from heaven according to 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 2, 'What does Paul say Jesus delivers believers from in 1 Thessalonians 1?', '["The wrath to come","Roman taxation","Physical death only","The law of Moses"]'::jsonb, 'The wrath to come', 'Jesus delivers us from the wrath to come (1 Thessalonians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say Jesus delivers believers from in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 2, 'What did others report about Paul''s entrance among the Thessalonians in 1 Thessalonians 1?', '["What kind of reception he had","That he failed to preach","That he stayed only one day","That he avoided the synagogue"]'::jsonb, 'What kind of reception he had', 'Others report what kind of entrance Paul and his companions had among them (1 Thessalonians 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did others report about Paul''s entrance among the Thessalonians in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 2, 'How does 1 Thessalonians 1 describe God whom the Thessalonians now serve?', '["Living and true","Hidden and distant","National and local","Severe and unknowable"]'::jsonb, 'Living and true', 'They turned to serve a living and true God (1 Thessalonians 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does 1 Thessalonians 1 describe God whom the Thessalonians now serve?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 3, 'Why does Paul connect election with the gospel coming in power in 1 Thessalonians 1?', '["Their transformed reception of the gospel showed God''s effective choosing of them","Election is based on geography","Power replaces the need for faith","Paul is speaking only about miracles"]'::jsonb, 'Their transformed reception of the gospel showed God''s effective choosing of them', 'Paul says he knows their election because the gospel came in power and they received it with Spirit-given joy despite affliction (1 Thessalonians 1:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect election with the gospel coming in power in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 3, 'What does 1 Thessalonians 1 suggest about genuine conversion?', '["It involves turning from idols to God, serving him, and waiting for his Son","It is only outward membership","It removes all suffering immediately","It requires pilgrimage to Jerusalem"]'::jsonb, 'It involves turning from idols to God, serving him, and waiting for his Son', 'Paul summarizes their conversion as turning to God from idols, serving the living God, and waiting for his Son from heaven (1 Thessalonians 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Thessalonians 1 suggest about genuine conversion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 3, 'Why is the Thessalonians'' joy significant in 1 Thessalonians 1?', '["It shows the Holy Spirit sustained them even in affliction","It means they had no trials","It was based on prosperity","It came from Roman approval"]'::jsonb, 'It shows the Holy Spirit sustained them even in affliction', 'Their joy is specifically described as joy of the Holy Spirit while receiving the word in much affliction (1 Thessalonians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the Thessalonians'' joy significant in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 3, 'What is the effect of the Thessalonians becoming an example in 1 Thessalonians 1?', '["Their witness extended beyond their city and encouraged other believers","It made Paul unnecessary","It limited their testimony to Macedonia only","It replaced the need for preaching"]'::jsonb, 'Their witness extended beyond their city and encouraged other believers', 'They became an example in Macedonia and Achaia, and the word of the Lord sounded out from them in every place (1 Thessalonians 1:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the effect of the Thessalonians becoming an example in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 3, 'How does 1 Thessalonians 1 present Christian hope?', '["As waiting for the risen Son from heaven who rescues from coming wrath","As confidence in earthly rulers","As escape through philosophy","As loyalty to old idols"]'::jsonb, 'As waiting for the risen Son from heaven who rescues from coming wrath', 'Paul defines their hope in terms of waiting for God''s Son from heaven, raised from the dead, who delivers from wrath (1 Thessalonians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 1 Thessalonians 1 present Christian hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 3, 'What does 1 Thessalonians 1 imply about the relationship between message and messenger?', '["The gospel''s power was reinforced by the observable character of those who preached it","Only the message mattered, not conduct","Paul avoided all personal example","The messengers relied on status rather than truth"]'::jsonb, 'The gospel''s power was reinforced by the observable character of those who preached it', 'Paul reminds them what kind of men they proved to be among them for their sake alongside how the gospel came (1 Thessalonians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Thessalonians 1 imply about the relationship between message and messenger?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 3, 'Why does Paul highlight that he does not need to say anything about the Thessalonians'' faith?', '["Their changed life was already widely known","He had forgotten their story","Their faith was private and hidden","Other churches rejected their testimony"]'::jsonb, 'Their changed life was already widely known', 'Paul says he has no need to speak because reports about them had already spread everywhere (1 Thessalonians 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul highlight that he does not need to say anything about the Thessalonians'' faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 4, 'How does 1 Thessalonians 1 join faith, love, and hope to the whole Christian life?', '["Faith works, love labors, and hope endures while centered on Jesus","They are abstract virtues without action","Only hope matters in the chapter","Love is absent from the Thessalonians'' example"]'::jsonb, 'Faith works, love labors, and hope endures while centered on Jesus', 'Paul remembers their work of faith, labor of love, and patience of hope in the Lord Jesus Christ (1 Thessalonians 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 1 join faith, love, and hope to the whole Christian life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 4, 'Why does Paul move from thanksgiving to mission so quickly in 1 Thessalonians 1?', '["The church''s transformed life had become part of the gospel''s wider spread","He abandons thanksgiving for a new topic","Mission matters more than doctrine","He is correcting them for silence"]'::jsonb, 'The church''s transformed life had become part of the gospel''s wider spread', 'Paul thanks God for them, then explains how the gospel came to them and how the Lord''s word sounded out from them to other places (1 Thessalonians 1:2-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul move from thanksgiving to mission so quickly in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 4, 'What theological pattern appears in 1 Thessalonians 1:9-10?', '["Conversion, service, and future hope centered on God and his Son","Law, sacrifice, and temple pilgrimage","National restoration through politics","Hidden wisdom for a spiritual elite"]'::jsonb, 'Conversion, service, and future hope centered on God and his Son', 'They turned to God, now serve him, and wait for his Son from heaven, showing a past, present, and future pattern of Christian life (1 Thessalonians 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What theological pattern appears in 1 Thessalonians 1:9-10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 4, 'How does 1 Thessalonians 1 present the church as missionary?', '["Its faithful reception of the gospel made it a sounding board for the Lord''s word","Only apostles can witness in the chapter","Mission is limited to formal sermons","The church is told to remain unseen"]'::jsonb, 'Its faithful reception of the gospel made it a sounding board for the Lord''s word', 'Paul says the Lord''s word sounded out from the Thessalonians and their faith became known in every place (1 Thessalonians 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 1 present the church as missionary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 4, 'Why is waiting for Jesus from heaven not passive in 1 Thessalonians 1?', '["It stands alongside serving the living God in the present","It means abandoning earthly obedience","It excuses idleness","It replaces the need for holiness"]'::jsonb, 'It stands alongside serving the living God in the present', 'Paul describes them as serving the living and true God while also waiting for his Son from heaven (1 Thessalonians 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is waiting for Jesus from heaven not passive in 1 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 4, 'How does 1 Thessalonians 1 show that affliction did not invalidate the gospel?', '["The word was received in affliction with Spirit-given joy and produced lasting faith","Affliction proved Paul preached wrongly","The gospel came only after suffering ended","The Thessalonians escaped conflict entirely"]'::jsonb, 'The word was received in affliction with Spirit-given joy and produced lasting faith', 'They received the word in much affliction with joy of the Holy Spirit and became examples to others (1 Thessalonians 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 1 show that affliction did not invalidate the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 4, 'What does chapter 1 suggest about assurance in ministry?', '["Assurance is tied to God''s power in the gospel and visible fruit in believers","Assurance rests on social approval","Assurance depends on miracles alone","Assurance is impossible until Christ returns"]'::jsonb, 'Assurance is tied to God''s power in the gospel and visible fruit in believers', 'Paul mentions much assurance in the preaching of the gospel and points to the Thessalonians'' transformed lives as evidence (1 Thessalonians 1:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does chapter 1 suggest about assurance in ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 5, 'How does 1 Thessalonians 1 present a Trinitarian pattern without using later doctrinal formulas?', '["The church lives before the Father, receives the gospel in the Holy Spirit, and waits for the Son from heaven","Only the Father acts in the chapter","The Spirit is absent from conversion","The Son is mentioned only as an example"]'::jsonb, 'The church lives before the Father, receives the gospel in the Holy Spirit, and waits for the Son from heaven', 'The assembly is in God the Father and the Lord Jesus, the gospel comes in the Holy Spirit, and believers wait for the Son from heaven (1 Thessalonians 1:1, 5-6, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 1 present a Trinitarian pattern without using later doctrinal formulas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 5, 'Why is the turning from idols in 1 Thessalonians 1 central rather than incidental?', '["It marks conversion as a transfer of worship, allegiance, and hope","It is a minor cultural detail","It applies only to a few members","It means the Thessalonians rejected all visible things"]'::jsonb, 'It marks conversion as a transfer of worship, allegiance, and hope', 'Paul frames their conversion as turning from idols to God, serving him, and waiting for his Son, showing a complete reorientation of life (1 Thessalonians 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the turning from idols in 1 Thessalonians 1 central rather than incidental?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 5, 'What does 1 Thessalonians 1 imply about eschatology and discipleship?', '["Expectation of Jesus'' return fuels present fidelity rather than speculation","Hope in Christ''s return discourages witness","Future judgment is irrelevant to discipleship","Waiting for Christ cancels service to God"]'::jsonb, 'Expectation of Jesus'' return fuels present fidelity rather than speculation', 'Paul joins waiting for the Son from heaven with faithful service to the living God and public witness through the word sounding out (1 Thessalonians 1:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 Thessalonians 1 imply about eschatology and discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 5, 'How does chapter 1 challenge the idea that suffering disproves divine favor?', '["The chosen and Spirit-filled church receives the word amid affliction and still becomes exemplary","Election guarantees ease","Affliction shows the gospel failed","God''s favor is measured by comfort alone"]'::jsonb, 'The chosen and Spirit-filled church receives the word amid affliction and still becomes exemplary', 'Paul ties God''s election, the Spirit''s work, affliction, joy, and exemplary witness together in one account (1 Thessalonians 1:4-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 1 challenge the idea that suffering disproves divine favor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 5, 'Why does Paul stress that reports about the Thessalonians have already spread everywhere?', '["A faithful local church can become evidence of the gospel''s power far beyond itself","Paul is avoiding further teaching","He is exaggerating to flatter them","He wants them to stop witnessing"]'::jsonb, 'A faithful local church can become evidence of the gospel''s power far beyond itself', 'Paul says their faith and witness are so well known that he has no need to say anything about them in those places (1 Thessalonians 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul stress that reports about the Thessalonians have already spread everywhere?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 5, 'What larger theological significance lies in Jesus delivering from the wrath to come?', '["The risen Jesus is the decisive rescuer in God''s final judgment","Wrath refers only to Roman persecution","Deliverance means exemption from all earthly trouble","Paul speaks only of political salvation"]'::jsonb, 'The risen Jesus is the decisive rescuer in God''s final judgment', 'Paul identifies Jesus, raised from the dead, as the one who delivers believers from the coming wrath, placing salvation in an eschatological frame (1 Thessalonians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological significance lies in Jesus delivering from the wrath to come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 1, 5, 'How does 1 Thessalonians 1 treat doctrine and example together?', '["The truth of the gospel is displayed in both proclamation and the transformed life it creates","Doctrine matters but conduct does not","Only conduct persuades, not truth","Paul separates theology from lived witness"]'::jsonb, 'The truth of the gospel is displayed in both proclamation and the transformed life it creates', 'Paul points both to how the gospel came in power and to what kind of people the preachers were, then to the Thessalonians'' changed lives and witness (1 Thessalonians 1:5-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 1 treat doctrine and example together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 1, 'According to 1 Thessalonians 2, was Paul''s entrance to the Thessalonians in vain?', '["No","Yes","Only partly","Paul does not say"]'::jsonb, 'No', 'Paul says their entrance to the Thessalonians was not found vain (1 Thessalonians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 2, was Paul''s entrance to the Thessalonians in vain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 1, 'According to 1 Thessalonians 2, where had Paul suffered before coming to Thessalonica?', '["Philippi","Corinth","Ephesus","Jerusalem"]'::jsonb, 'Philippi', 'Paul says they had suffered before and been shamefully treated at Philippi (1 Thessalonians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 2, where had Paul suffered before coming to Thessalonica?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 1, 'According to 1 Thessalonians 2, whom did Paul seek to please?', '["God","Men","The magistrates","The philosophers"]'::jsonb, 'God', 'Paul says they speak not as pleasing men, but God who tests their hearts (1 Thessalonians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 2, whom did Paul seek to please?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 1, 'According to 1 Thessalonians 2, what did Paul say he never used as a cloak?', '["Covetousness","Humility","Truth","Patience"]'::jsonb, 'Covetousness', 'Paul says they did not come with a cloak of covetousness; God is witness (1 Thessalonians 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 2, what did Paul say he never used as a cloak?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 1, 'According to 1 Thessalonians 2, how did Paul and his companions behave among the Thessalonians?', '["Gently, like a nursing mother","Harshly, like rulers","Secretly, like spies","Silently, like strangers"]'::jsonb, 'Gently, like a nursing mother', 'Paul says they were gentle among them, like a nursing mother cherishes her own children (1 Thessalonians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 2, how did Paul and his companions behave among the Thessalonians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 1, 'According to 1 Thessalonians 2, what did Paul work night and day to avoid being?', '["A burden to any of them","An enemy of Rome","A stranger to the synagogue","A teacher without learning"]'::jsonb, 'A burden to any of them', 'Paul says they worked night and day so as not to be a burden while preaching the gospel (1 Thessalonians 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 2, what did Paul work night and day to avoid being?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 1, 'According to 1 Thessalonians 2, how did Paul exhort each one of the believers?', '["As a father with his own children","As a king with subjects","As a judge in court","As a stranger in a city"]'::jsonb, 'As a father with his own children', 'Paul says he exhorted, comforted, and testified to each one as a father with his own children (1 Thessalonians 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 2, how did Paul exhort each one of the believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 2, 'What gave Paul boldness to speak in Thessalonica according to 1 Thessalonians 2?', '["God","Public approval","Roman protection","Philosophical skill"]'::jsonb, 'God', 'Paul says they were bold in our God to speak the gospel amid much conflict (1 Thessalonians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What gave Paul boldness to speak in Thessalonica according to 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 2, 'What does Paul say their exhortation was not from in 1 Thessalonians 2?', '["Error, uncleanness, or deceit","Courage, faith, or hope","Prayer, teaching, or patience","Scripture, truth, or love"]'::jsonb, 'Error, uncleanness, or deceit', 'Paul says their exhortation was not of error, nor of uncleanness, nor in deception (1 Thessalonians 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say their exhortation was not from in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 2, 'Why did Paul say he and his companions could have claimed honor as apostles?', '["They were apostles of Christ","They were citizens of Rome","They were priests of the temple","They were elders in Jerusalem"]'::jsonb, 'They were apostles of Christ', 'Paul says they might have claimed authority as apostles of Christ (1 Thessalonians 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Paul say he and his companions could have claimed honor as apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 2, 'What two things besides the gospel did Paul say he was pleased to share with the Thessalonians?', '["His own soul and affection","His property and title","His Roman rights and status","His visions and secrets"]'::jsonb, 'His own soul and affection', 'Paul says they were pleased to impart not only the gospel of God but also their own souls because the Thessalonians had become very dear to them (1 Thessalonians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What two things besides the gospel did Paul say he was pleased to share with the Thessalonians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 2, 'How did the Thessalonians receive the word they heard from Paul according to 1 Thessalonians 2?', '["As God''s word","As human philosophy","As Roman law","As a temporary opinion"]'::jsonb, 'As God''s word', 'Paul thanks God that they received the word not as the word of men, but as it is in truth, God''s word (1 Thessalonians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did the Thessalonians receive the word they heard from Paul according to 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 2, 'Whom did the Thessalonians imitate in suffering according to 1 Thessalonians 2?', '["The assemblies of God in Judea","The rulers of Rome","The philosophers of Athens","The priests in Jerusalem"]'::jsonb, 'The assemblies of God in Judea', 'They became imitators of the assemblies of God in Judea, suffering from their own countrymen as those churches did from the Jews (1 Thessalonians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did the Thessalonians imitate in suffering according to 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 2, 'What are the Thessalonians called at Christ''s coming in 1 Thessalonians 2?', '["Paul''s glory and joy","Paul''s opponents","A hidden remnant only","A burden on the churches"]'::jsonb, 'Paul''s glory and joy', 'Paul asks, what is our hope, joy, or crown of rejoicing? Are not even you before our Lord Jesus at his coming? You are our glory and joy (1 Thessalonians 2:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What are the Thessalonians called at Christ''s coming in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 3, 'What does 1 Thessalonians 2 reveal about Paul''s ministry motives?', '["He ministered to please God rather than to gain praise or money","He sought political influence","He preached mainly for public honor","He depended on flattery to win converts"]'::jsonb, 'He ministered to please God rather than to gain praise or money', 'Paul denies flattery, greed, and seeking glory from people, and says he speaks to please God who tests hearts (1 Thessalonians 2:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Thessalonians 2 reveal about Paul''s ministry motives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 3, 'Why does Paul use both mother and father imagery in 1 Thessalonians 2?', '["To show his ministry combined tenderness with personal exhortation","To confuse family roles","To avoid speaking about apostleship","To describe only financial support"]'::jsonb, 'To show his ministry combined tenderness with personal exhortation', 'Paul compares himself to a nursing mother in tenderness and to a father in exhorting and encouraging each believer (1 Thessalonians 2:7-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul use both mother and father imagery in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 3, 'What does Paul emphasize by saying God''s word works in believers in 1 Thessalonians 2?', '["The received gospel remains active and effective in those who believe","The word matters only when first heard","Belief makes preaching unnecessary","The word works apart from faith"]'::jsonb, 'The received gospel remains active and effective in those who believe', 'Paul says the word of God works effectively in you who believe (1 Thessalonians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul emphasize by saying God''s word works in believers in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 3, 'How does suffering function in 1 Thessalonians 2?', '["It places the Thessalonians in continuity with other faithful churches","It proves they believed wrongly","It shows God abandoned them","It applies only to apostles"]'::jsonb, 'It places the Thessalonians in continuity with other faithful churches', 'Paul says they became imitators of the churches in Judea by suffering from their own countrymen (1 Thessalonians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does suffering function in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 3, 'Why does Paul stress laboring night and day in 1 Thessalonians 2?', '["He wanted to avoid burdening the Thessalonians while preaching freely","He wished to gain wealth secretly","He feared preaching publicly","He had no support from God"]'::jsonb, 'He wanted to avoid burdening the Thessalonians while preaching freely', 'Paul worked night and day so that he might not burden any of them while proclaiming the gospel (1 Thessalonians 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul stress laboring night and day in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 3, 'What does 1 Thessalonians 2 imply about apostolic authority?', '["True authority can forgo status claims and serve sacrificially for others'' good","Authority requires constant display of power","Apostles must demand honor from churches","Authority depends on philosophical brilliance"]'::jsonb, 'True authority can forgo status claims and serve sacrificially for others'' good', 'Though Paul could have asserted authority as an apostle, he instead describes gentle, sacrificial, and hardworking ministry (1 Thessalonians 2:6-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Thessalonians 2 imply about apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 3, 'Why does Paul mention Satan hindering his return in 1 Thessalonians 2?', '["To explain that separation from the church was opposed and painful, not indifferent","To excuse a lack of concern","To deny God''s sovereignty","To shift blame from Rome to the church"]'::jsonb, 'To explain that separation from the church was opposed and painful, not indifferent', 'Paul says he wanted to come again and again, but Satan hindered them, highlighting his deep desire to return (1 Thessalonians 2:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention Satan hindering his return in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 4, 'How does 1 Thessalonians 2 connect message integrity and messenger integrity?', '["Paul argues that truthful proclamation was matched by transparent motives and holy conduct","He treats conduct as irrelevant if doctrine is right","Only good motives matter, not truth","He separates preaching from personal life entirely"]'::jsonb, 'Paul argues that truthful proclamation was matched by transparent motives and holy conduct', 'Paul denies deceit and greed, says God tests hearts, and points to holy, righteous, and blameless conduct among believers (1 Thessalonians 2:3-5, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 2 connect message integrity and messenger integrity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 4, 'What does Paul mean by wanting the Thessalonians to walk worthily of God in 1 Thessalonians 2?', '["Their conduct should correspond to God''s call into his kingdom and glory","They must earn citizenship through works","They should withdraw from public life","They must imitate Judea''s customs"]'::jsonb, 'Their conduct should correspond to God''s call into his kingdom and glory', 'Paul exhorts them to walk worthily of God, who calls them into his own kingdom and glory (1 Thessalonians 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul mean by wanting the Thessalonians to walk worthily of God in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 4, 'Why is receiving the apostolic message as God''s word so important in chapter 2?', '["It explains why the word continued powerfully at work in the believers","It gave Paul personal prestige","It removed the need for further instruction","It was merely a courtesy to visiting teachers"]'::jsonb, 'It explains why the word continued powerfully at work in the believers', 'Paul thanks God that they received the message as God''s word, which also works in believers (1 Thessalonians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is receiving the apostolic message as God''s word so important in chapter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 4, 'How does 1 Thessalonians 2 frame pastoral affection?', '["It is intense enough to share not only the gospel but also one''s own life","It is mainly professional distance","It is shown only by written instruction","It excludes exhortation and correction"]'::jsonb, 'It is intense enough to share not only the gospel but also one''s own life', 'Paul says they were pleased to share not only the gospel of God but also their own souls because the Thessalonians had become dear to them (1 Thessalonians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 2 frame pastoral affection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 4, 'What larger pattern does 1 Thessalonians 2 establish for Christian suffering?', '["Believers can share in the same pattern of opposition seen in other faithful churches","Suffering belongs only to Paul","Only Jewish believers suffer faithfully","Suffering is always a sign of compromise"]'::jsonb, 'Believers can share in the same pattern of opposition seen in other faithful churches', 'Paul links the Thessalonians'' suffering with that of the Judean churches, showing continuity in the experience of opposition (1 Thessalonians 2:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger pattern does 1 Thessalonians 2 establish for Christian suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 4, 'Why does Paul end the chapter with hope, joy, and crown language?', '["He sees the church itself as the fruit of his ministry that will matter at Christ''s coming","He shifts to speaking about material rewards","He is referring to political victory","He means only present emotional comfort"]'::jsonb, 'He sees the church itself as the fruit of his ministry that will matter at Christ''s coming', 'Paul calls the Thessalonians his hope, joy, crown of rejoicing, glory, and joy in relation to the Lord''s coming (1 Thessalonians 2:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul end the chapter with hope, joy, and crown language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 4, 'How does this chapter balance divine calling and human exhortation?', '["God calls believers into his kingdom, and Paul exhorts them to walk in line with that call","Divine calling makes exhortation unnecessary","Human exhortation replaces God''s call","Only future glory matters, not present conduct"]'::jsonb, 'God calls believers into his kingdom, and Paul exhorts them to walk in line with that call', 'Paul describes God''s call into his kingdom and glory while also exhorting, comforting, and testifying that they should walk worthily of God (1 Thessalonians 2:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this chapter balance divine calling and human exhortation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 5, 'What does 1 Thessalonians 2 imply about the apostolic ministry model?', '["Authority is exercised through truth, self-giving love, holiness, and costly labor rather than self-exaltation","Authority depends on domination and public honor","Ministry should avoid emotional bonds","The apostolic model centers on rhetorical display"]'::jsonb, 'Authority is exercised through truth, self-giving love, holiness, and costly labor rather than self-exaltation', 'Paul emphasizes truthfulness, lack of greed, motherly gentleness, fatherly exhortation, holy conduct, and laboring night and day (1 Thessalonians 2:3-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 Thessalonians 2 imply about the apostolic ministry model?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 5, 'How does 1 Thessalonians 2 deepen the theology of the word beyond mere information transfer?', '["The word is God''s active instrument that continues working in those who believe","The word matters only as historical memory","The word becomes effective only through eloquence","The word''s power ends once the sermon is over"]'::jsonb, 'The word is God''s active instrument that continues working in those who believe', 'Paul says the word they received as God''s word works effectively in believers, giving it ongoing formative power (1 Thessalonians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 2 deepen the theology of the word beyond mere information transfer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 5, 'Why is the combination of maternal and paternal ministry images theologically rich in chapter 2?', '["It shows pastoral care includes both tender nurture and morally serious formation","It signals confusion about leadership","It limits ministry to family households","It means Paul avoids public preaching"]'::jsonb, 'It shows pastoral care includes both tender nurture and morally serious formation', 'Paul''s mother image stresses cherishing care, while the father image stresses exhortation, comfort, and testimony toward worthy living (1 Thessalonians 2:7-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the combination of maternal and paternal ministry images theologically rich in chapter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 5, 'How does Paul use eschatology to interpret ministry in 1 Thessalonians 2?', '["The ultimate significance of his labor is measured at the Lord Jesus'' coming","Eschatology is unrelated to pastoral work","Only present success matters","Christ''s coming is mentioned merely to comfort Paul privately"]'::jsonb, 'The ultimate significance of his labor is measured at the Lord Jesus'' coming', 'Paul describes the Thessalonians as his hope, joy, and crown before the Lord Jesus at his coming, tying present ministry to future evaluation and joy (1 Thessalonians 2:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul use eschatology to interpret ministry in 1 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 5, 'What larger conflict frame appears when Paul says Satan hindered his return?', '["Pastoral separation and gospel work unfold within real spiritual opposition","Satan alone determines ministry outcomes","Spiritual conflict cancels human responsibility","The hindrance was purely imaginary"]'::jsonb, 'Pastoral separation and gospel work unfold within real spiritual opposition', 'Paul''s desire to return is interpreted through spiritual opposition, indicating that ministry occurs within a contested spiritual field (1 Thessalonians 2:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger conflict frame appears when Paul says Satan hindered his return?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 5, 'How does chapter 2 challenge performative ministry?', '["It prizes God-tested hearts, sacrificial labor, and genuine care over flattery and public glory","It teaches that results justify manipulation","It defines ministry by fame","It values applause above faithfulness"]'::jsonb, 'It prizes God-tested hearts, sacrificial labor, and genuine care over flattery and public glory', 'Paul repeatedly contrasts true ministry with flattery, greed, and the pursuit of human glory, instead highlighting sincerity and sacrifice (1 Thessalonians 2:3-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 2 challenge performative ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 2, 5, 'What does 1 Thessalonians 2 suggest about the church as ministry fruit?', '["People formed by the gospel are themselves the enduring joy and crown of faithful ministry","Only numerical growth counts as fruit","Ministry fruit is mainly financial support","Fruit belongs only to the apostle, not the church"]'::jsonb, 'People formed by the gospel are themselves the enduring joy and crown of faithful ministry', 'Paul identifies the Thessalonians themselves as his glory and joy at Christ''s coming (1 Thessalonians 2:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 Thessalonians 2 suggest about the church as ministry fruit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 1, 'According to 1 Thessalonians 3, whom did Paul send to Thessalonica?', '["Timothy","Silvanus","Titus","Luke"]'::jsonb, 'Timothy', 'Paul says he sent Timothy, our brother and God''s servant in the gospel of Christ (1 Thessalonians 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 3, whom did Paul send to Thessalonica?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 1, 'According to 1 Thessalonians 3, why did Paul send Timothy?', '["To establish and comfort them concerning their faith","To collect money only","To appoint Roman officials","To take them to Jerusalem"]'::jsonb, 'To establish and comfort them concerning their faith', 'Timothy was sent to establish them and comfort them concerning their faith (1 Thessalonians 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 3, why did Paul send Timothy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 1, 'According to 1 Thessalonians 3, what should no one be moved by?', '["These afflictions","This prosperity","These rulers","These visions"]'::jsonb, 'These afflictions', 'Paul says no one should be moved by these afflictions (1 Thessalonians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 3, what should no one be moved by?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 1, 'According to 1 Thessalonians 3, for what were believers appointed?', '["Afflictions","Earthly honor","Temple service","Political rule"]'::jsonb, 'Afflictions', 'Paul says believers are appointed to these afflictions (1 Thessalonians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 3, for what were believers appointed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 1, 'According to 1 Thessalonians 3, what good news did Timothy bring back?', '["Their faith and love","A Roman decree","A famine warning","A new temple plan"]'::jsonb, 'Their faith and love', 'Timothy brought Paul good news of their faith and love (1 Thessalonians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 3, what good news did Timothy bring back?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 1, 'According to 1 Thessalonians 3, when does Paul say, ''now we live''?', '["If you stand fast in the Lord","If you return to us","If suffering ends","If Rome changes"]'::jsonb, 'If you stand fast in the Lord', 'Paul says, ''For now we live, if you stand fast in the Lord'' (1 Thessalonians 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 3, when does Paul say, ''now we live''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 1, 'According to 1 Thessalonians 3, what did Paul pray to see?', '["Their face","The temple","The emperor","A sign in heaven"]'::jsonb, 'Their face', 'Paul prays exceedingly that he may see their face and perfect what is lacking in their faith (1 Thessalonians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 3, what did Paul pray to see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 2, 'What concern moved Paul to send Timothy in 1 Thessalonians 3?', '["That the tempter might have tempted them","That they had become wealthy","That they had moved away","That they had forgotten Jerusalem"]'::jsonb, 'That the tempter might have tempted them', 'Paul feared that the tempter had tempted them and that his labor might have been in vain (1 Thessalonians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What concern moved Paul to send Timothy in 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 2, 'What did Timothy report about how the Thessalonians remembered Paul?', '["They remembered him kindly and longed to see him","They had forgotten him","They opposed his teaching","They feared his return"]'::jsonb, 'They remembered him kindly and longed to see him', 'Timothy reported that they always have good remembrance of Paul, longing to see him as Paul also longs to see them (1 Thessalonians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Timothy report about how the Thessalonians remembered Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 2, 'How was Paul comforted according to 1 Thessalonians 3?', '["Through their faith amid his own distress and affliction","Through Roman protection","Through financial gifts only","Through escaping persecution"]'::jsonb, 'Through their faith amid his own distress and affliction', 'Paul says he was comforted over them in all his distress and affliction through their faith (1 Thessalonians 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How was Paul comforted according to 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 2, 'What does Paul want to supply according to 1 Thessalonians 3?', '["What is lacking in their faith","A new law","A new temple service","Roman citizenship"]'::jsonb, 'What is lacking in their faith', 'Paul prays to see them and perfect what is lacking in their faith (1 Thessalonians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul want to supply according to 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 2, 'Toward whom does Paul pray the Thessalonians'' love would abound in 1 Thessalonians 3?', '["Toward one another and toward all men","Toward Jews only","Toward leaders only","Toward family only"]'::jsonb, 'Toward one another and toward all men', 'Paul prays that the Lord may make them increase and abound in love toward one another and toward all men (1 Thessalonians 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Toward whom does Paul pray the Thessalonians'' love would abound in 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 2, 'Before whom does Paul want their hearts established blameless in holiness?', '["Our God and Father","The Roman courts","The synagogue rulers","The nations"]'::jsonb, 'Our God and Father', 'Paul prays that their hearts may be established blameless in holiness before our God and Father (1 Thessalonians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Before whom does Paul want their hearts established blameless in holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 2, 'At what event does Paul mention the saints being with Jesus in 1 Thessalonians 3?', '["The coming of our Lord Jesus","The destruction of the temple","Pentecost","Paul''s next visit"]'::jsonb, 'The coming of our Lord Jesus', 'Paul speaks of the coming of our Lord Jesus with all his saints (1 Thessalonians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'At what event does Paul mention the saints being with Jesus in 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 3, 'Why does Paul say believers are appointed to afflictions in 1 Thessalonians 3?', '["To prepare them to see suffering as part of Christian calling rather than as a surprise","To deny God''s care","To discourage conversion","To restrict faith to apostles"]'::jsonb, 'To prepare them to see suffering as part of Christian calling rather than as a surprise', 'Paul had told them beforehand they would suffer affliction and says believers are appointed to it (1 Thessalonians 3:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say believers are appointed to afflictions in 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 3, 'What does Timothy''s report reveal about pastoral ministry in 1 Thessalonians 3?', '["Faithful ministry includes checking on believers and being strengthened by their endurance","Pastors should avoid hearing from churches","Only correction matters, not encouragement","Reports are mainly administrative"]'::jsonb, 'Faithful ministry includes checking on believers and being strengthened by their endurance', 'Timothy is sent to strengthen them, and his report of their faith and love brings Paul deep comfort and joy (1 Thessalonians 3:2, 6-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Timothy''s report reveal about pastoral ministry in 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 3, 'Why does Paul tie abounding love to holiness in 1 Thessalonians 3?', '["Growing love is part of how God establishes hearts blameless before him","Love and holiness are unrelated","Holiness replaces love","Only doctrinal knowledge produces holiness"]'::jsonb, 'Growing love is part of how God establishes hearts blameless before him', 'Paul prays first for increasing love and then for hearts established blameless in holiness before God (1 Thessalonians 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul tie abounding love to holiness in 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 3, 'What does ''now we live'' imply about Paul''s relationship to the Thessalonians?', '["Their perseverance brought him profound renewed encouragement in ministry","His life literally depended on them","He had stopped caring about other churches","He meant only physical health"]'::jsonb, 'Their perseverance brought him profound renewed encouragement in ministry', 'Paul expresses how deeply their standing fast in the Lord revives and comforts him amid his own distress (1 Thessalonians 3:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''now we live'' imply about Paul''s relationship to the Thessalonians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 3, 'How does 1 Thessalonians 3 portray temptation?', '["As a real threat to perseverance that pastors must take seriously","As irrelevant to believers","As only an internal emotion without consequence","As something Paul mentions only in passing without concern"]'::jsonb, 'As a real threat to perseverance that pastors must take seriously', 'Paul fears that the tempter might have tempted them and made his labor vain, showing the seriousness of temptation (1 Thessalonians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 1 Thessalonians 3 portray temptation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 3, 'Why does Paul still want to supply what is lacking in their faith if Timothy brought good news?', '["Strong faith can still need further strengthening and instruction","Timothy''s report was false","Paul doubted all churches completely","Good news means their faith had disappeared"]'::jsonb, 'Strong faith can still need further strengthening and instruction', 'Paul rejoices in their faith and love yet still prays to see them and complete what is lacking in their faith (1 Thessalonians 3:6, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul still want to supply what is lacking in their faith if Timothy brought good news?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 3, 'How does chapter 3 connect present pastoral care with future hope?', '["Paul''s prayers for love and holiness are directed toward readiness for Jesus'' coming","Future hope replaces present care","The coming of Jesus is unrelated to present growth","Paul mentions the future only to end the letter section"]'::jsonb, 'Paul''s prayers for love and holiness are directed toward readiness for Jesus'' coming', 'Paul prays for abounding love and blameless holiness specifically in view of the coming of the Lord Jesus (1 Thessalonians 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does chapter 3 connect present pastoral care with future hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 4, 'How does 1 Thessalonians 3 balance realism and encouragement about suffering?', '["Affliction is expected, yet steadfast faith within it brings deep joy and comfort","Affliction is denied altogether","Encouragement comes only after suffering ends","Suffering is portrayed as meaningless"]'::jsonb, 'Affliction is expected, yet steadfast faith within it brings deep joy and comfort', 'Paul says believers are appointed to afflictions, yet Timothy''s good report of steadfast faith brings comfort and joy (1 Thessalonians 3:3-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 3 balance realism and encouragement about suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 4, 'What does the chapter reveal about the role of encouragement in church life?', '["God uses co-workers and reports of faith to strengthen both churches and ministers","Encouragement is secondary to argument alone","Only apostles need strengthening","Encouragement belongs only to private prayer"]'::jsonb, 'God uses co-workers and reports of faith to strengthen both churches and ministers', 'Timothy is sent to establish the Thessalonians, and then his report establishes and comforts Paul in return (1 Thessalonians 3:2, 6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the chapter reveal about the role of encouragement in church life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 4, 'Why does Paul direct prayer to both God the Father and the Lord Jesus in 1 Thessalonians 3?', '["He frames the church''s life and future under shared divine direction and authority","He is uncertain which one can answer prayer","He separates their roles completely","He mentions Jesus only as a messenger"]'::jsonb, 'He frames the church''s life and future under shared divine direction and authority', 'Paul prays that our God and Father himself and our Lord Jesus direct his way to them and establish the church, showing coordinated divine care (1 Thessalonians 3:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul direct prayer to both God the Father and the Lord Jesus in 1 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 4, 'How does chapter 3 show that perseverance is communal rather than merely individual?', '["Paul, Timothy, and the Thessalonians are all bound together in mutual concern, strengthening, and joy","Perseverance happens in isolation only","Only Timothy''s faith matters","The church''s condition has no effect on Paul"]'::jsonb, 'Paul, Timothy, and the Thessalonians are all bound together in mutual concern, strengthening, and joy', 'Paul sends Timothy to strengthen them, Timothy returns with news, and Paul is comforted and rejoices because of their faith (1 Thessalonians 3:1-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does chapter 3 show that perseverance is communal rather than merely individual?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 4, 'What does 1 Thessalonians 3 imply about holiness and eschatology?', '["Present holiness is cultivated in view of final accountability before God at Christ''s coming","Future hope makes holiness optional","Holiness belongs only to this life with no future dimension","The coming of Christ concerns only doctrine, not conduct"]'::jsonb, 'Present holiness is cultivated in view of final accountability before God at Christ''s coming', 'Paul prays that their hearts be established blameless in holiness before God at the coming of the Lord Jesus with all his saints (1 Thessalonians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 1 Thessalonians 3 imply about holiness and eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 4, 'Why is Paul''s joy in 1 Thessalonians 3 presented as thanksgiving?', '["Because the church''s endurance is viewed as a gift from God rather than merely a human achievement","Because Paul had no role in their growth","Because thanksgiving replaces prayer","Because joy is unrelated to faith"]'::jsonb, 'Because the church''s endurance is viewed as a gift from God rather than merely a human achievement', 'Paul asks what thanksgiving he can render to God for all the joy he has because of them before God (1 Thessalonians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Paul''s joy in 1 Thessalonians 3 presented as thanksgiving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 4, 'How does chapter 3 prepare for the ethical teaching that follows in chapter 4?', '["It prays for abounding love and blameless holiness before moving into practical exhortation","It closes the letter''s concerns completely","It turns away from holiness toward speculation","It treats ethics as separate from prayer"]'::jsonb, 'It prays for abounding love and blameless holiness before moving into practical exhortation', 'Paul''s closing prayer in chapter 3 focuses on love and holiness, which become central themes in the ethical instructions of chapter 4 (1 Thessalonians 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does chapter 3 prepare for the ethical teaching that follows in chapter 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 5, 'How does 1 Thessalonians 3 portray pastoral ministry as both vulnerable and hope-filled?', '["Paul openly fears for the church under temptation, yet responds through prayer, sending help, and rejoicing in their perseverance","Paul presents ministry as emotionally detached","Fear and hope are treated as opposites that cannot coexist","The chapter portrays ministry as self-sufficient"]'::jsonb, 'Paul openly fears for the church under temptation, yet responds through prayer, sending help, and rejoicing in their perseverance', 'Paul is anxious enough to send Timothy, fears the tempter''s work, yet is comforted by Timothy''s report and prays for their continued growth (1 Thessalonians 3:1-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 3 portray pastoral ministry as both vulnerable and hope-filled?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 5, 'What deeper theological logic connects love increasing and hearts established in holiness?', '["Love is not opposed to holiness but is one of the means by which God prepares his people for his presence","Holiness requires withdrawing from others","Love belongs to emotion only and not to sanctification","Paul contrasts love with readiness for Christ''s coming"]'::jsonb, 'Love is not opposed to holiness but is one of the means by which God prepares his people for his presence', 'Paul prays for increased love immediately before praying for hearts established blameless in holiness before God at Christ''s coming (1 Thessalonians 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper theological logic connects love increasing and hearts established in holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 5, 'How does chapter 3 challenge triumphalistic views of Christian life?', '["It assumes affliction and temptation remain real even in faithful churches","It teaches mature churches outgrow all trials","It says suffering belongs only to unbelievers","It defines victory as the absence of hardship"]'::jsonb, 'It assumes affliction and temptation remain real even in faithful churches', 'Paul speaks of appointed afflictions and the tempter''s danger even while rejoicing over the Thessalonians'' genuine faith and love (1 Thessalonians 3:3-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 3 challenge triumphalistic views of Christian life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 5, 'What does 1 Thessalonians 3 imply about the church''s stability?', '["Stability is sustained through God''s action, pastoral care, mutual faithfulness, and future-oriented prayer","Stability depends only on human resolve","Stability comes from avoiding all suffering","Stability means never needing correction"]'::jsonb, 'Stability is sustained through God''s action, pastoral care, mutual faithfulness, and future-oriented prayer', 'The chapter combines Timothy''s strengthening ministry, Paul''s prayers, God''s direction, and the Thessalonians'' steadfastness in the Lord (1 Thessalonians 3:2, 8, 11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 Thessalonians 3 imply about the church''s stability?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 5, 'Why is Paul''s request to see their face theologically significant rather than merely emotional?', '["Embodied fellowship serves the strengthening and completion of the church''s faith","Paul simply prefers travel","Seeing them would remove the need for God''s work","The request is unrelated to ministry goals"]'::jsonb, 'Embodied fellowship serves the strengthening and completion of the church''s faith', 'Paul longs to see them specifically so that he may perfect what is lacking in their faith, showing that personal presence serves spiritual formation (1 Thessalonians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s request to see their face theologically significant rather than merely emotional?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 5, 'How does 1 Thessalonians 3 hold together divine sovereignty and human means?', '["God establishes the church, yet Paul sends Timothy, prays, and longs to instruct them","God''s sovereignty removes the need for ministry effort","Human effort alone secures perseverance","The chapter avoids both prayer and planning"]'::jsonb, 'God establishes the church, yet Paul sends Timothy, prays, and longs to instruct them', 'Paul actively uses pastoral means while praying that God and the Lord Jesus direct his way and establish their hearts in holiness (1 Thessalonians 3:2, 10-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 3 hold together divine sovereignty and human means?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 3, 5, 'What does this chapter suggest about eschatological hope and church care?', '["Hope in Christ''s coming intensifies present care for the church rather than distracting from it","Future hope makes pastoral concern less important","Only present needs matter in Paul''s thinking","The coming of Christ belongs only to chapter 4"]'::jsonb, 'Hope in Christ''s coming intensifies present care for the church rather than distracting from it', 'Paul''s concern for their faith, his joy in their perseverance, and his prayer for holiness all culminate in readiness for Christ''s coming (1 Thessalonians 3:5-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does this chapter suggest about eschatological hope and church care?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 1, 'According to 1 Thessalonians 4, what does Paul urge the Thessalonians to do more and more?', '["Walk so as to please God","Seek public honor","Debate the law","Travel to Jerusalem"]'::jsonb, 'Walk so as to please God', 'Paul urges them to abound more and more in how they ought to walk and please God (1 Thessalonians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 4, what does Paul urge the Thessalonians to do more and more?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 1, 'According to 1 Thessalonians 4, what is the will of God?', '["Your sanctification","Your public success","Your political safety","Your ritual washing only"]'::jsonb, 'Your sanctification', 'Paul says, ''For this is the will of God: your sanctification'' (1 Thessalonians 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 4, what is the will of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 1, 'According to 1 Thessalonians 4, from what should believers abstain?', '["Sexual immorality","Food entirely","Marriage","Work"]'::jsonb, 'Sexual immorality', 'Paul says believers should abstain from sexual immorality (1 Thessalonians 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 4, from what should believers abstain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 1, 'According to 1 Thessalonians 4, in what should each person know how to possess his own vessel?', '["Sanctification and honor","Pride and freedom","Silence and secrecy","Power and wealth"]'::jsonb, 'Sanctification and honor', 'Each one should know how to possess his own vessel in sanctification and honor (1 Thessalonians 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 4, in what should each person know how to possess his own vessel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 1, 'According to 1 Thessalonians 4, what should believers study to be?', '["Quiet","Famous","Wealthy","Debaters"]'::jsonb, 'Quiet', 'Paul urges them to aspire to live quietly (1 Thessalonians 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 4, what should believers study to be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 1, 'According to 1 Thessalonians 4, with whose hands should believers work?', '["Their own","Their neighbors''","Their rulers''","The priests''"]'::jsonb, 'Their own', 'Paul tells them to work with their own hands (1 Thessalonians 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 4, with whose hands should believers work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 1, 'According to 1 Thessalonians 4, who will rise first?', '["The dead in Christ","The rulers of the earth","The angels","The prophets of old"]'::jsonb, 'The dead in Christ', 'Paul says the dead in Christ will rise first (1 Thessalonians 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 4, who will rise first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 2, 'How should believers differ from the Gentiles according to 1 Thessalonians 4?', '["They should not live in the passion of lust","They should avoid all work","They should seek public praise","They should refuse marriage entirely"]'::jsonb, 'They should not live in the passion of lust', 'Paul says not in the passion of lust, even as the Gentiles who do not know God (1 Thessalonians 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should believers differ from the Gentiles according to 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 2, 'What does Paul say the Lord is regarding wrongs done in this matter in 1 Thessalonians 4?', '["An avenger","A spectator","A philosopher","A judge only in the distant future"]'::jsonb, 'An avenger', 'Paul says the Lord is an avenger in all these things (1 Thessalonians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say the Lord is regarding wrongs done in this matter in 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 2, 'To what has God called believers according to 1 Thessalonians 4?', '["Holiness","Uncleanness","Political influence","Withdrawal from society"]'::jsonb, 'Holiness', 'God called us not for uncleanness, but in sanctification (1 Thessalonians 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'To what has God called believers according to 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 2, 'Whom does Paul say taught the Thessalonians to love one another?', '["God","Paul alone","The synagogue","The magistrates"]'::jsonb, 'God', 'Paul says they are taught by God to love one another (1 Thessalonians 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom does Paul say taught the Thessalonians to love one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 2, 'How should believers walk toward those who are outside according to 1 Thessalonians 4?', '["Properly","Secretly","Boastfully","Harshly"]'::jsonb, 'Properly', 'Paul says they should walk properly toward those who are outside (1 Thessalonians 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should believers walk toward those who are outside according to 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 2, 'What does Paul not want the Thessalonians to be ignorant about in 1 Thessalonians 4?', '["Those who are asleep","The Roman empire","Temple customs","The food laws"]'::jsonb, 'Those who are asleep', 'Paul does not want them to be ignorant concerning those who have fallen asleep (1 Thessalonians 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul not want the Thessalonians to be ignorant about in 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 2, 'What will accompany the Lord''s descent from heaven in 1 Thessalonians 4?', '["A shout, the voice of an archangel, and God''s trumpet","Silence and secrecy","A temple sacrifice","Only a private vision"]'::jsonb, 'A shout, the voice of an archangel, and God''s trumpet', 'The Lord will descend with a shout, with the voice of the archangel, and with God''s trumpet (1 Thessalonians 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What will accompany the Lord''s descent from heaven in 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 3, 'Why does Paul connect sanctification with sexual ethics in 1 Thessalonians 4?', '["Holiness must shape bodily life, not remain a merely inward claim","The body is unimportant to God","Sanctification is only ceremonial","Sexual conduct is unrelated to knowing God"]'::jsonb, 'Holiness must shape bodily life, not remain a merely inward claim', 'Paul defines God''s will as sanctification and immediately applies it to sexual self-control in honor before God (1 Thessalonians 4:3-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect sanctification with sexual ethics in 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 3, 'What is the significance of Paul saying those who reject this do not reject man but God?', '["The ethical instruction carries divine authority, not merely apostolic preference","Paul is claiming personal infallibility apart from God","Human relationships no longer matter","Only the Spirit, not Scripture, gives moral guidance"]'::jsonb, 'The ethical instruction carries divine authority, not merely apostolic preference', 'Paul says the one who rejects these instructions rejects not man but God, who gives his Holy Spirit (1 Thessalonians 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Paul saying those who reject this do not reject man but God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 3, 'Why does Paul pair brotherly love with quiet work in 1 Thessalonians 4?', '["Love for others includes living responsibly and not becoming unnecessarily dependent","Quietness opposes love","Work replaces love as the Christian duty","Paul wants believers to avoid outsiders altogether"]'::jsonb, 'Love for others includes living responsibly and not becoming unnecessarily dependent', 'After commending their love, Paul urges them to abound more by living quietly, minding their own business, and working with their own hands (1 Thessalonians 4:9-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul pair brotherly love with quiet work in 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 3, 'How does 1 Thessalonians 4 use the resurrection of Jesus to comfort believers about the dead?', '["Jesus'' resurrection guarantees that God will bring with him those who sleep in Jesus","Jesus'' resurrection applies only to apostles","The resurrection removes all grief entirely","It proves only that souls survive"]'::jsonb, 'Jesus'' resurrection guarantees that God will bring with him those who sleep in Jesus', 'Paul reasons from Jesus'' death and resurrection to God''s future action for those who have fallen asleep in Jesus (1 Thessalonians 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 1 Thessalonians 4 use the resurrection of Jesus to comfort believers about the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 3, 'What pastoral problem is Paul addressing in the final part of 1 Thessalonians 4?', '["Sorrow and uncertainty about believers who have died","Conflict over Roman citizenship","Disagreement about food laws","Whether Gentiles may join the church"]'::jsonb, 'Sorrow and uncertainty about believers who have died', 'Paul writes so they will not grieve like the rest who have no hope concerning those who have fallen asleep (1 Thessalonians 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What pastoral problem is Paul addressing in the final part of 1 Thessalonians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 3, 'What does Paul emphasize by saying living believers will not precede those who have fallen asleep?', '["The dead in Christ are not disadvantaged at the Lord''s coming","Only the living will meet the Lord","The resurrection happens after a long delay for the dead","The dead are excluded from hope"]'::jsonb, 'The dead in Christ are not disadvantaged at the Lord''s coming', 'Paul says the living will in no way precede those who have fallen asleep, and then says the dead in Christ will rise first (1 Thessalonians 4:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul emphasize by saying living believers will not precede those who have fallen asleep?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 3, 'Why does Paul end this teaching with ''comfort one another with these words''?', '["The doctrine of Christ''s coming is meant to strengthen grieving believers","The teaching is mainly speculative","The details are intended for argument only","Comfort comes from ignoring death"]'::jsonb, 'The doctrine of Christ''s coming is meant to strengthen grieving believers', 'Paul explicitly tells them to comfort one another with these words after explaining the resurrection and meeting the Lord (1 Thessalonians 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul end this teaching with ''comfort one another with these words''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 4, 'How does 1 Thessalonians 4 connect holiness and hope rather than treating them separately?', '["The chapter moves from sanctified living now to resurrection hope later as parts of one Christian life","Holiness belongs only to the present and hope only to scholars","Resurrection hope makes ethics unnecessary","Ethics and hope are unrelated topics stitched together"]'::jsonb, 'The chapter moves from sanctified living now to resurrection hope later as parts of one Christian life', 'Paul first addresses sanctification, love, and orderly life, then turns to hope for the dead and the coming of the Lord, presenting both as central to discipleship (1 Thessalonians 4:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 4 connect holiness and hope rather than treating them separately?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 4, 'Why does Paul stress honorable self-control in contrast to Gentile lust?', '["Christian ethics are rooted in knowing God and reflecting his holiness","Paul is attacking ethnicity rather than behavior","He thinks desire itself is always evil","He is describing only clergy expectations"]'::jsonb, 'Christian ethics are rooted in knowing God and reflecting his holiness', 'Paul contrasts sanctification and honor with the passion of lust among those who do not know God (1 Thessalonians 4:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul stress honorable self-control in contrast to Gentile lust?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 4, 'How does chapter 4 present public witness to outsiders?', '["Holy and orderly daily life adorns the gospel before those outside the church","Witness depends only on public speeches","Outsiders should be ignored","The church''s life should remain hidden"]'::jsonb, 'Holy and orderly daily life adorns the gospel before those outside the church', 'Paul tells them to live quietly, work, and walk properly toward outsiders so that they may lack nothing and bear a fitting witness (1 Thessalonians 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does chapter 4 present public witness to outsiders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 4, 'What does 1 Thessalonians 4 imply about Christian grief?', '["Believers may grieve, but not as those who have no hope","Christians must never feel sorrow","Hope eliminates love for the dead","Grief itself is condemned as unbelief"]'::jsonb, 'Believers may grieve, but not as those who have no hope', 'Paul does not forbid grief; he distinguishes Christian grief from hopeless grief because of the resurrection hope in Christ (1 Thessalonians 4:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 1 Thessalonians 4 imply about Christian grief?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 4, 'Why is ''we will always be with the Lord'' the climax of Paul''s argument?', '["The final comfort is enduring communion with Christ for all his people","The main point is simply the order of events","Paul''s aim is only to describe heavenly geography","He wants to end speculation with mystery"]'::jsonb, 'The final comfort is enduring communion with Christ for all his people', 'After describing the resurrection and gathering, Paul climaxes with the promise that believers will always be with the Lord (1 Thessalonians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is ''we will always be with the Lord'' the climax of Paul''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 4, 'How does the Spirit''s mention in 1 Thessalonians 4 intensify the call to holiness?', '["Rejecting holiness means rejecting God, who gives his Holy Spirit","The Spirit replaces the need for moral effort","The Spirit is mentioned only to comfort the dead","The Spirit belongs only to apostles"]'::jsonb, 'Rejecting holiness means rejecting God, who gives his Holy Spirit', 'Paul says the one who rejects this rejects not man but God, who gives his Holy Spirit (1 Thessalonians 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the Spirit''s mention in 1 Thessalonians 4 intensify the call to holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 4, 'What kind of community does Paul envision through these commands in chapter 4?', '["A holy, loving, hardworking, and hopeful church awaiting Christ","A withdrawn community concerned only with ritual","A movement shaped by unrest and dependence","A church focused only on end-times charts"]'::jsonb, 'A holy, loving, hardworking, and hopeful church awaiting Christ', 'The chapter joins sanctification, brotherly love, quiet labor, and resurrection hope into one vision of faithful Christian life (1 Thessalonians 4:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of community does Paul envision through these commands in chapter 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 5, 'How does 1 Thessalonians 4 resist the split between spirituality and the body?', '["It treats bodily holiness and bodily resurrection as integral to Christian faith","It values the soul but not the body","It spiritualizes resurrection away","It limits sanctification to inward attitudes"]'::jsonb, 'It treats bodily holiness and bodily resurrection as integral to Christian faith', 'Paul addresses bodily sanctification in sexual ethics and then teaches the bodily resurrection of the dead in Christ, refusing to separate spirituality from embodied life (1 Thessalonians 4:3-8, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 4 resist the split between spirituality and the body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 5, 'Why is resurrection hope central to Paul''s pastoral answer about death?', '["Hope is grounded in Jesus'' own death and resurrection, not in vague optimism","Paul comforts them by minimizing death","The answer is only symbolic survival","He points mainly to memory of the deceased"]'::jsonb, 'Hope is grounded in Jesus'' own death and resurrection, not in vague optimism', 'Paul argues directly from Jesus'' death and resurrection to the future of those who sleep in Jesus (1 Thessalonians 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is resurrection hope central to Paul''s pastoral answer about death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 5, 'How does 1 Thessalonians 4 make ordinary labor a theological issue?', '["Quiet work becomes part of holy witness and neighborly responsibility before outsiders","Work is merely economic necessity","Paul thinks manual work is spiritually inferior","Labor matters only for church leaders"]'::jsonb, 'Quiet work becomes part of holy witness and neighborly responsibility before outsiders', 'Paul ties quiet living and working with one''s own hands to proper conduct toward outsiders and lacking nothing (1 Thessalonians 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 4 make ordinary labor a theological issue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 5, 'What does the sequence of chapter 4 suggest about Christian discipleship?', '["Moral holiness, brotherly love, daily faithfulness, and resurrection hope belong together","Hope can be separated from ethics","Brotherly love is less important than speculation","Sanctification concerns only private devotion"]'::jsonb, 'Moral holiness, brotherly love, daily faithfulness, and resurrection hope belong together', 'Paul moves from sanctification to love to quiet labor to resurrection comfort, shaping a comprehensive discipleship pattern (1 Thessalonians 4:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the sequence of chapter 4 suggest about Christian discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 5, 'Why does Paul''s resurrection teaching comfort rather than merely inform?', '["Because its goal is to assure believers that death cannot separate Christ''s people from his presence","Because the exact timetable is the main point","Because the chapter denies the pain of loss","Because Paul wants curiosity more than stability"]'::jsonb, 'Because its goal is to assure believers that death cannot separate Christ''s people from his presence', 'Paul''s argument ends not with chronology for its own sake but with the promise that believers will always be with the Lord and should comfort one another (1 Thessalonians 4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul''s resurrection teaching comfort rather than merely inform?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 5, 'What does 1 Thessalonians 4 imply about holiness as a response to divine gift?', '["Holiness is demanded by the God who calls, avenges wrong, and gives his Holy Spirit","Holiness earns God''s Spirit","God''s gifts make holiness optional","Holiness is a human project apart from God"]'::jsonb, 'Holiness is demanded by the God who calls, avenges wrong, and gives his Holy Spirit', 'Paul grounds holiness in God''s will, God''s call, God''s justice, and God''s gift of the Holy Spirit (1 Thessalonians 4:3, 6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 Thessalonians 4 imply about holiness as a response to divine gift?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 4, 5, 'How does chapter 4 keep eschatology from becoming escapist?', '["The same believers who await the Lord are told to live quietly, work, love, and pursue holiness now","Future hope replaces present responsibilities","Only the dead matter in Paul''s teaching","Eschatology is detached from ethics in the chapter"]'::jsonb, 'The same believers who await the Lord are told to live quietly, work, love, and pursue holiness now', 'Paul embeds the coming of the Lord within practical commands for sanctification, brotherly love, and ordinary labor, showing hope shapes present life (1 Thessalonians 4:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 4 keep eschatology from becoming escapist?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 1, 'According to 1 Thessalonians 5, how will the day of the Lord come?', '["Like a thief in the night","Like a royal parade","Like a temple feast","Like a public debate"]'::jsonb, 'Like a thief in the night', 'Paul says the day of the Lord comes like a thief in the night (1 Thessalonians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 5, how will the day of the Lord come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 1, 'According to 1 Thessalonians 5, what will people be saying before sudden destruction comes?', '["Peace and safety","War and famine","Grace and truth","Joy and hope"]'::jsonb, 'Peace and safety', 'When they are saying, ''Peace and safety,'' then sudden destruction comes on them (1 Thessalonians 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 5, what will people be saying before sudden destruction comes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 1, 'According to 1 Thessalonians 5, what are believers called?', '["Children of light and children of the day","Children of night and shadow","Children of the law","Children of wrath"]'::jsonb, 'Children of light and children of the day', 'Paul says believers are all children of light and children of the day (1 Thessalonians 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 5, what are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 1, 'According to 1 Thessalonians 5, what should believers do instead of sleeping?', '["Watch and be sober","Hide and be silent","Mourn without hope","Debate without rest"]'::jsonb, 'Watch and be sober', 'Paul says let us not sleep as the rest do, but let us watch and be sober (1 Thessalonians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 5, what should believers do instead of sleeping?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 1, 'According to 1 Thessalonians 5, what should believers put on as a breastplate?', '["Faith and love","Wisdom and strength","Silence and fasting","Law and ritual"]'::jsonb, 'Faith and love', 'Paul tells them to put on the breastplate of faith and love (1 Thessalonians 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 5, what should believers put on as a breastplate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 1, 'According to 1 Thessalonians 5, what is the helmet?', '["The hope of salvation","The fear of judgment","The law of Moses","Earthly peace"]'::jsonb, 'The hope of salvation', 'Paul says to wear for a helmet the hope of salvation (1 Thessalonians 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 5, what is the helmet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 1, 'According to 1 Thessalonians 5, what should believers do always?', '["Rejoice","Argue","Travel","Fast"]'::jsonb, 'Rejoice', 'Paul commands, ''Rejoice always'' (1 Thessalonians 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Thessalonians 5, what should believers do always?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 2, 'Why will the day of the Lord not overtake believers like a thief according to 1 Thessalonians 5?', '["They are not in darkness","They know the exact date","They have no weakness","They live in Jerusalem"]'::jsonb, 'They are not in darkness', 'Paul says they are not in darkness that the day should overtake them like a thief (1 Thessalonians 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why will the day of the Lord not overtake believers like a thief according to 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 2, 'For what has God not appointed believers according to 1 Thessalonians 5?', '["Wrath","Work","Prayer","Suffering"]'::jsonb, 'Wrath', 'God did not appoint us to wrath, but to the obtaining of salvation through our Lord Jesus Christ (1 Thessalonians 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'For what has God not appointed believers according to 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 2, 'What did Christ do so that believers might live together with him?', '["He died for us","He wrote the law","He built the temple","He defeated Rome"]'::jsonb, 'He died for us', 'Paul says Christ died for us so that whether we wake or sleep, we should live together with him (1 Thessalonians 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Christ do so that believers might live together with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 2, 'Whom does Paul tell the Thessalonians to recognize in 1 Thessalonians 5?', '["Those who labor among them and are over them in the Lord","Only traveling teachers","Only wealthy patrons","Only prophets from Judea"]'::jsonb, 'Those who labor among them and are over them in the Lord', 'Paul asks them to know those who labor among them, are over them in the Lord, and admonish them (1 Thessalonians 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom does Paul tell the Thessalonians to recognize in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 2, 'What kinds of people are believers told to help in 1 Thessalonians 5?', '["The weak","Only the rich","Only widows","Only foreigners"]'::jsonb, 'The weak', 'Paul tells them to admonish the disorderly, encourage the fainthearted, and support the weak (1 Thessalonians 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kinds of people are believers told to help in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 2, 'What should believers not quench according to 1 Thessalonians 5?', '["The Spirit","Their work","Their memory","Their courage"]'::jsonb, 'The Spirit', 'Paul commands, ''Do not quench the Spirit'' (1 Thessalonians 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should believers not quench according to 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 2, 'What should believers do with all things according to 1 Thessalonians 5?', '["Test them and hold firmly what is good","Reject them immediately","Accept them without testing","Hide them from others"]'::jsonb, 'Test them and hold firmly what is good', 'Paul says to test all things, hold firmly that which is good (1 Thessalonians 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should believers do with all things according to 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 3, 'What is the significance of the contrast between day and night in 1 Thessalonians 5?', '["Believers'' identity in the light should shape alert and sober living","It only describes literal times of day","Paul is discussing farming cycles","Night symbolizes ordinary sleep only"]'::jsonb, 'Believers'' identity in the light should shape alert and sober living', 'Because believers are children of light and day, Paul calls them to watchfulness and sobriety rather than sleep and drunkenness (1 Thessalonians 5:4-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the contrast between day and night in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 3, 'Why does Paul answer fear of the day of the Lord with salvation language in 1 Thessalonians 5?', '["The day brings judgment for darkness but hope for those destined for salvation in Christ","Believers will avoid all hardship before that day","Paul denies any future judgment","The day matters only to unbelievers"]'::jsonb, 'The day brings judgment for darkness but hope for those destined for salvation in Christ', 'Paul contrasts sudden destruction for others with believers not being appointed to wrath but to salvation through Jesus (1 Thessalonians 5:3-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul answer fear of the day of the Lord with salvation language in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 3, 'How does 1 Thessalonians 5 connect doctrine and community life?', '["Hope in Christ''s return leads into mutual encouragement, order, patience, and prayer","Teaching about the day of the Lord replaces church relationships","Doctrine matters only for private belief","Community life is detached from eschatology"]'::jsonb, 'Hope in Christ''s return leads into mutual encouragement, order, patience, and prayer', 'After discussing the day of the Lord and salvation, Paul tells them to encourage one another and then gives a series of communal instructions (1 Thessalonians 5:11-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 1 Thessalonians 5 connect doctrine and community life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 3, 'What does ''pray without ceasing'' most clearly suggest in 1 Thessalonians 5?', '["A continual life of dependence on God rather than literal nonstop speech","That believers must do nothing but pray audibly","That prayer replaces work","That only leaders should be in prayer"]'::jsonb, 'A continual life of dependence on God rather than literal nonstop speech', 'Within a chain of practical exhortations, Paul calls for a persistent prayerful posture alongside rejoicing and thanksgiving (1 Thessalonians 5:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''pray without ceasing'' most clearly suggest in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 3, 'Why does Paul tell the Thessalonians both not to despise prophecies and to test all things?', '["Spiritual openness must be joined with discernment","All prophecies should be accepted uncritically","Testing cancels the Spirit''s work","Discernment means rejecting all spiritual speech"]'::jsonb, 'Spiritual openness must be joined with discernment', 'Paul refuses two extremes: despising prophecies and uncritical acceptance, calling instead for testing and holding fast what is good (1 Thessalonians 5:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul tell the Thessalonians both not to despise prophecies and to test all things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 3, 'What does 1 Thessalonians 5 imply about church leadership?', '["Leaders who labor and admonish are to be known and esteemed in love for their work''s sake","Leaders should be honored regardless of conduct","Leadership exists only outside the local church","Admonition has no place in leadership"]'::jsonb, 'Leaders who labor and admonish are to be known and esteemed in love for their work''s sake', 'Paul tells the Thessalonians to recognize and esteem those who labor among them, are over them in the Lord, and admonish them (1 Thessalonians 5:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Thessalonians 5 imply about church leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 3, 'How does chapter 5 define Christian response to evil from others?', '["Do not repay evil for evil, but pursue what is good","Answer evil with stronger retaliation","Withdraw from everyone permanently","Wait for leaders to respond instead"]'::jsonb, 'Do not repay evil for evil, but pursue what is good', 'Paul tells them to see that none renders evil for evil, but always follow after that which is good for one another and for all (1 Thessalonians 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does chapter 5 define Christian response to evil from others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 4, 'How does 1 Thessalonians 5 link eschatological identity to ethical vigilance?', '["Because believers belong to the day, they are to live watchfully, soberly, and hopefully","Knowing the future date is the main ethical tool","The day of the Lord removes present obligations","Only fear, not hope, motivates holiness"]'::jsonb, 'Because believers belong to the day, they are to live watchfully, soberly, and hopefully', 'Paul grounds watchfulness and sobriety in the fact that believers are children of light and day, clothed with faith, love, and hope (1 Thessalonians 5:4-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 5 link eschatological identity to ethical vigilance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 4, 'Why does Paul place faith, love, and hope in martial imagery in 1 Thessalonians 5?', '["These virtues equip believers for alert endurance in a hostile and deceptive world","He is replacing spiritual virtues with violence","He means only soldiers can endure","The imagery concerns Rome rather than Christ"]'::jsonb, 'These virtues equip believers for alert endurance in a hostile and deceptive world', 'Paul uses breastplate and helmet imagery to portray faith, love, and hope as protective virtues for those awaiting salvation (1 Thessalonians 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul place faith, love, and hope in martial imagery in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 4, 'How does chapter 5 balance God''s preserving work and human responsibility?', '["God sanctifies and preserves his people, while they are still called to vigilance, discernment, and prayer","Human effort alone keeps believers faithful","God''s work removes the need for obedience","Paul leaves the tension unresolved by ignoring both sides"]'::jsonb, 'God sanctifies and preserves his people, while they are still called to vigilance, discernment, and prayer', 'Paul gives many commands for watchfulness and holiness, then prays that the God of peace himself sanctify them completely and preserve them blameless (1 Thessalonians 5:6-8, 21-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does chapter 5 balance God''s preserving work and human responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 4, 'What kind of church culture does 1 Thessalonians 5 envision?', '["One marked by mutual encouragement, patient care, discernment, prayer, and peace","One dominated by fear and secrecy","One built on retaliation and suspicion","One focused only on dramatic prophecy"]'::jsonb, 'One marked by mutual encouragement, patient care, discernment, prayer, and peace', 'Paul calls the church to encourage one another, esteem leaders, warn and help various people, pray, test, and live peaceably (1 Thessalonians 5:11-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of church culture does 1 Thessalonians 5 envision?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 4, 'Why does Paul pray for sanctification of spirit, soul, and body in 1 Thessalonians 5?', '["He wants the whole person preserved blameless for the coming of Christ","He divides the person into unrelated parts","He means only the body matters","He is introducing a philosophical system"]'::jsonb, 'He wants the whole person preserved blameless for the coming of Christ', 'Paul prays that their spirit, soul, and body be preserved complete and blameless at the coming of the Lord Jesus Christ (1 Thessalonians 5:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul pray for sanctification of spirit, soul, and body in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 4, 'What does ''the one who calls you is faithful, who will also do it'' add to the chapter''s commands?', '["The many exhortations rest on God''s faithful action, not on human strength alone","God''s faithfulness makes exhortations meaningless","Paul means only leaders will be kept","Faithfulness applies only to the end of the letter"]'::jsonb, 'The many exhortations rest on God''s faithful action, not on human strength alone', 'After praying for their complete sanctification, Paul grounds confidence in God''s faithfulness to accomplish what he calls them to (1 Thessalonians 5:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does ''the one who calls you is faithful, who will also do it'' add to the chapter''s commands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 4, 'How does 1 Thessalonians 5 make the day of the Lord pastoral rather than merely apocalyptic?', '["Paul uses it to call the church into encouragement, holiness, and hope rather than speculation alone","He uses it only to frighten unbelievers","He treats it as an isolated doctrine","He avoids any practical application"]'::jsonb, 'Paul uses it to call the church into encouragement, holiness, and hope rather than speculation alone', 'The teaching about the day leads directly into exhortations to encourage one another, live soberly, and trust God''s saving purpose in Christ (1 Thessalonians 5:1-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Thessalonians 5 make the day of the Lord pastoral rather than merely apocalyptic?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 5, 'How does 1 Thessalonians 5 unify eschatology, ethics, and ecclesiology?', '["The coming day shapes a vigilant, hopeful, ordered, and mutually caring church","The day of the Lord concerns prophecy only","Church life is unrelated to future hope","Ethics replaces the need for eschatology"]'::jsonb, 'The coming day shapes a vigilant, hopeful, ordered, and mutually caring church', 'Paul moves from the day of the Lord to sober living, mutual encouragement, leadership, care for the weak, prayer, discernment, and sanctification, showing an integrated vision of church life (1 Thessalonians 5:1-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 5 unify eschatology, ethics, and ecclesiology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 5, 'Why is the language of light and day so theologically important in 1 Thessalonians 5?', '["It gives believers an identity grounded in God''s coming reality that should already govern their conduct","It refers only to literal daytime activities","It teaches believers are naturally better than others","It replaces the need for salvation by Christ"]'::jsonb, 'It gives believers an identity grounded in God''s coming reality that should already govern their conduct', 'Believers are called children of light and day, so their identity in the coming salvation informs present watchfulness and sobriety (1 Thessalonians 5:4-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the language of light and day so theologically important in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 5, 'How does 1 Thessalonians 5 protect the church from both gullibility and cynicism?', '["It says not to despise prophecies and also to test everything carefully","It teaches the church to reject all spiritual gifts","It says every claimed prophecy must be accepted","It leaves discernment to leaders only"]'::jsonb, 'It says not to despise prophecies and also to test everything carefully', 'Paul guards against cynical dismissal and naive acceptance by holding together openness to prophecy and testing of all things (1 Thessalonians 5:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Thessalonians 5 protect the church from both gullibility and cynicism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 5, 'What is the significance of Paul pairing Christ''s death with whether believers wake or sleep?', '["Union with Christ secures life with him regardless of whether believers are alive or dead at his coming","Only the spiritually alert will live with him","Sleep here denies bodily resurrection","Paul is speaking only about physical rest habits"]'::jsonb, 'Union with Christ secures life with him regardless of whether believers are alive or dead at his coming', 'Paul says Christ died for us so that whether we wake or sleep, we should live together with him, extending hope across life and death (1 Thessalonians 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of Paul pairing Christ''s death with whether believers wake or sleep?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 5, 'How does chapter 5 challenge self-focused spirituality?', '["Its commands are saturated with concern for building up others, honoring leaders, helping the weak, and seeking good for all","It defines holiness as private experience only","It urges believers to withdraw from the church","It limits spirituality to inward feelings"]'::jsonb, 'Its commands are saturated with concern for building up others, honoring leaders, helping the weak, and seeking good for all', 'Paul''s exhortations repeatedly direct believers toward mutual encouragement, peace, patience, support, and the pursuit of good for one another and all people (1 Thessalonians 5:11-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 5 challenge self-focused spirituality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 5, 'Why is God''s faithfulness the final ground of confidence in 1 Thessalonians 5?', '["Because the God who calls his people is the one who will complete their sanctification and preservation","Because believers can sanctify themselves without help","Because commands are unnecessary if God is faithful","Because only future grace matters and not present obedience"]'::jsonb, 'Because the God who calls his people is the one who will complete their sanctification and preservation', 'After praying for complete sanctification, Paul says the one who calls you is faithful, who will also do it (1 Thessalonians 5:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is God''s faithfulness the final ground of confidence in 1 Thessalonians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 52, 5, 5, 'How does the letter''s closing cluster of commands reveal Paul''s vision of mature Christianity?', '["Mature faith is joyful, prayerful, thankful, discerning, peaceable, and wholly open to God''s sanctifying work","Maturity is mainly advanced speculation about the last days","Maturity means freedom from ordinary church obligations","Mature believers no longer need community"]'::jsonb, 'Mature faith is joyful, prayerful, thankful, discerning, peaceable, and wholly open to God''s sanctifying work', 'The chapter''s rapid commands culminate in prayer for complete sanctification, portraying maturity as a comprehensive Spirit-shaped way of life before God''s coming future (1 Thessalonians 5:12-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 52
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the letter''s closing cluster of commands reveal Paul''s vision of mature Christianity?'
);
