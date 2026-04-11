-- ============================================================================
-- LOGOS LIGHT — Ephesians (book 49) quiz questions from quiz-questions/ephesians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 1, 'According to Ephesians 1, in whom are believers blessed with every spiritual blessing?', '["In Christ","In Moses","In Jerusalem","In the law"]'::jsonb, 'In Christ', 'Paul says God has blessed us with every spiritual blessing in the heavenly places in Christ (Ephesians 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 1, in whom are believers blessed with every spiritual blessing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 1, 'According to Ephesians 1, what did God predestine believers for through Jesus Christ?', '["Adoption as children","Earthly kingship","Temple service","Political freedom"]'::jsonb, 'Adoption as children', 'God predestined believers to adoption as children through Jesus Christ to himself (Ephesians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 1, what did God predestine believers for through Jesus Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 1, 'According to Ephesians 1, what do believers have through Christ''s blood?', '["Redemption","Circumcision","Priestly ancestry","Civil authority"]'::jsonb, 'Redemption', 'In Christ we have redemption through his blood, the forgiveness of our trespasses (Ephesians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 1, what do believers have through Christ''s blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 1, 'According to Ephesians 1, with what were believers sealed?', '["The Holy Spirit of promise","The sign of circumcision","The tablets of the law","A mark from angels"]'::jsonb, 'The Holy Spirit of promise', 'After believing, they were sealed with the Holy Spirit of promise (Ephesians 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 1, with what were believers sealed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 1, 'According to Ephesians 1, what is the church called in relation to Christ?', '["His body","His temple tax","His earthly throne","His outer court"]'::jsonb, 'His body', 'Paul says God gave Christ as head over all things to the church, which is his body (Ephesians 1:22-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 1, what is the church called in relation to Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 2, 'Why does Paul say believers were chosen in Christ in Ephesians 1?', '["To be holy and without blemish before him in love","To rule the nations immediately","To replace the angels","To rebuild the temple"]'::jsonb, 'To be holy and without blemish before him in love', 'Paul says believers were chosen in Christ before the foundation of the world to be holy and without blemish before him in love (Ephesians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul say believers were chosen in Christ in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 2, 'What mystery of God''s will does Ephesians 1 say was made known?', '["To sum up all things in Christ","To abolish creation","To restore animal sacrifice","To separate heaven from earth forever"]'::jsonb, 'To sum up all things in Christ', 'God made known the mystery of his will, to sum up all things in Christ, the things in the heavens and the things on the earth (Ephesians 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What mystery of God''s will does Ephesians 1 say was made known?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 2, 'What does Paul call the Holy Spirit in Ephesians 1 besides a seal?', '["The guarantee of our inheritance","The law written on stone","The ruler of this age","The first apostle"]'::jsonb, 'The guarantee of our inheritance', 'The Holy Spirit is called the guarantee of our inheritance until the redemption of God''s own possession (Ephesians 1:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul call the Holy Spirit in Ephesians 1 besides a seal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 2, 'What two qualities in the Ephesian believers does Paul say he heard about?', '["Faith in the Lord Jesus and love toward all the saints","Boldness in debate and skill in writing","Knowledge of mysteries and power over demons","Zeal for ceremonies and fasting"]'::jsonb, 'Faith in the Lord Jesus and love toward all the saints', 'Paul gives thanks after hearing of their faith in the Lord Jesus and their love toward all the saints (Ephesians 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What two qualities in the Ephesian believers does Paul say he heard about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 2, 'What does Paul pray the eyes of their heart may know in Ephesians 1?', '["The hope of his calling","The exact day of Christ\u0027s return","The names of every angel","The borders of Israel"]'::jsonb, 'The hope of his calling', 'Paul prays that the eyes of their heart may be enlightened so they may know the hope of his calling (Ephesians 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul pray the eyes of their heart may know in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 3, 'What does Ephesians 1 emphasize by repeating the phrase ''in Christ'' or similar expressions?', '["Every saving blessing is located in union with Christ","Believers earn favor by copying Christ externally","Paul is only using poetic repetition without meaning","The chapter is mainly about geography"]'::jsonb, 'Every saving blessing is located in union with Christ', 'Paul repeatedly anchors election, redemption, inheritance, and sealing in Christ, stressing union with him as the sphere of salvation (Ephesians 1:3-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 1 emphasize by repeating the phrase ''in Christ'' or similar expressions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 3, 'Why does Paul move from praise to prayer in Ephesians 1?', '["He wants believers not only to possess salvation\u0027s blessings but to understand them deeply","He regrets praising God too strongly","He changes to an unrelated subject","He is asking for political support"]'::jsonb, 'He wants believers not only to possess salvation''s blessings but to understand them deeply', 'After praising God for salvation''s blessings, Paul prays that the Ephesians may know their hope, inheritance, and God''s power more fully (Ephesians 1:15-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul move from praise to prayer in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 3, 'How is God''s power described in Ephesians 1?', '["It is the same mighty power he worked in Christ when he raised him from the dead","It appears only in miracles during Paul\u0027s ministry","It is mainly the power of human wisdom","It belongs only to angels"]'::jsonb, 'It is the same mighty power he worked in Christ when he raised him from the dead', 'Paul points to the working of God''s mighty strength in raising Christ and seating him at his right hand (Ephesians 1:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How is God''s power described in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 3, 'What does Ephesians 1 teach about Christ''s present status?', '["He is seated above all rule, authority, power, and dominion","He remains under angelic oversight","He reigns only within the church building","He has authority only over Israel"]'::jsonb, 'He is seated above all rule, authority, power, and dominion', 'God seated Christ at his right hand in the heavenly places above every rule, authority, power, dominion, and every name that is named (Ephesians 1:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 1 teach about Christ''s present status?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 3, 'Why is the church called the fullness of Christ in Ephesians 1?', '["The exalted Christ fills his body with his presence and purpose","The church completes what Christ lacks in deity","The church replaces Christ as head","Only apostles belong to Christ\u0027s fullness"]'::jsonb, 'The exalted Christ fills his body with his presence and purpose', 'Paul describes the church as Christ''s body, the fullness of him who fills all in all (Ephesians 1:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the church called the fullness of Christ in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 4, 'How does Ephesians 1 relate God''s eternal plan to the believer''s present experience?', '["The same God who planned salvation before the world\u0027s foundation now seals believers by the Spirit and enlightens them to know their hope","Eternal election removes the need for present faith","The chapter separates doctrine from experience completely","Only future blessings matter in Christ"]'::jsonb, 'The same God who planned salvation before the world''s foundation now seals believers by the Spirit and enlightens them to know their hope', 'Paul moves from God''s eternal choosing and predestining to present redemption, sealing, and prayer for spiritual understanding (Ephesians 1:4-5, 7, 13, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 1 relate God''s eternal plan to the believer''s present experience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 4, 'Why does Ephesians 1 repeatedly say salvation is ''to the praise of his glory''?', '["Because God\u0027s saving work is designed to magnify his grace rather than human achievement","Because worship replaces the need for holiness","Because only angels can understand redemption","Because the church earns God\u0027s glory"]'::jsonb, 'Because God''s saving work is designed to magnify his grace rather than human achievement', 'Paul repeats that election, adoption, inheritance, and sealing are to the praise of God''s glory, emphasizing divine grace as the source of salvation (Ephesians 1:6, 12, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Ephesians 1 repeatedly say salvation is ''to the praise of his glory''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 4, 'How does Paul''s prayer in Ephesians 1 connect Christ''s exaltation with the church''s confidence?', '["The same resurrection power that exalted Christ is at work for believers under his headship","Christ\u0027s exaltation leaves the church to act on its own","The church must ascend to heaven to find hope","Only future generations benefit from Christ\u0027s reign"]'::jsonb, 'The same resurrection power that exalted Christ is at work for believers under his headship', 'Paul prays they may know God''s great power toward believers, the same power shown in Christ''s resurrection and exaltation as head over the church (Ephesians 1:19-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s prayer in Ephesians 1 connect Christ''s exaltation with the church''s confidence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 4, 'What does Ephesians 1 suggest about the relationship between the Father, the Son, and the Holy Spirit in salvation?', '["The Father plans, the Son redeems, and the Spirit seals the people of God","Only the Son acts while the Father and Spirit remain distant","The Spirit replaces the Son after the cross","The chapter teaches three separate gods"]'::jsonb, 'The Father plans, the Son redeems, and the Spirit seals the people of God', 'Ephesians 1 presents the Father''s gracious purpose, redemption through the Son''s blood, and sealing by the Holy Spirit (Ephesians 1:3-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Ephesians 1 suggest about the relationship between the Father, the Son, and the Holy Spirit in salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 5, 'What is the theological significance of Ephesians 1 locating election ''before the foundation of the world''?', '["It shows salvation originates in God\u0027s eternal grace rather than in human initiative","It means faith and preaching are unnecessary","It limits salvation to angels and apostles","It denies the importance of Christ\u0027s blood"]'::jsonb, 'It shows salvation originates in God''s eternal grace rather than in human initiative', 'Paul places God''s choosing before the world''s foundation to stress the prior grace and purpose of God in Christ (Ephesians 1:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of Ephesians 1 locating election ''before the foundation of the world''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 5, 'How does Ephesians 1 present the end goal of history itself?', '["All things in heaven and on earth are to be brought together under Christ","History ends in endless separation between heaven and earth","The nations finally abolish all worship","Israel alone becomes the whole of creation"]'::jsonb, 'All things in heaven and on earth are to be brought together under Christ', 'Paul says God''s purpose is for the administration of the fullness of the times: to sum up all things in Christ (Ephesians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 1 present the end goal of history itself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 5, 'Why is the Spirit called the guarantee of the inheritance in Ephesians 1?', '["The Spirit is God\u0027s present pledge that final redemption will surely come","The Spirit replaces the future inheritance entirely","The inheritance belongs only to Israel\u0027s land","The guarantee depends on human merit"]'::jsonb, 'The Spirit is God''s present pledge that final redemption will surely come', 'Paul says the Holy Spirit is the guarantee of our inheritance until the redemption of God''s own possession (Ephesians 1:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the Spirit called the guarantee of the inheritance in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 5, 'How does Ephesians 1 redefine true power over against worldly notions of power?', '["True power is God\u0027s resurrection power displayed in Christ and for his people","True power is the ability to dominate earthly empires","True power comes through secret mystical knowledge","True power belongs mainly to human rulers"]'::jsonb, 'True power is God''s resurrection power displayed in Christ and for his people', 'Paul points believers to the immeasurable greatness of God''s power shown in raising and exalting Christ above every power (Ephesians 1:19-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 1 redefine true power over against worldly notions of power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 1, 'According to Ephesians 2, what were believers dead in before salvation?', '["Trespasses and sins","Ceremonial washings","Political exile","Physical sickness"]'::jsonb, 'Trespasses and sins', 'Paul says believers were dead through their trespasses and sins (Ephesians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 2, what were believers dead in before salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 1, 'According to Ephesians 2, by what are believers saved?', '["By grace","By works of the law","By national descent","By wisdom"]'::jsonb, 'By grace', 'Paul says, ''By grace you have been saved'' (Ephesians 2:5, 8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 2, by what are believers saved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 1, 'According to Ephesians 2, through whom do both Jews and Gentiles have access to the Father?', '["Through Christ","Through Moses","Through the temple veil","Through circumcision"]'::jsonb, 'Through Christ', 'Through Christ we both have our access in one Spirit to the Father (Ephesians 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 2, through whom do both Jews and Gentiles have access to the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 1, 'According to Ephesians 2, what has Christ made both groups?', '["One","Rivals","Priests only","Separate nations forever"]'::jsonb, 'One', 'Paul says Christ is our peace, who made both one (Ephesians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 2, what has Christ made both groups?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 1, 'According to Ephesians 2, what are believers called in God''s household?', '["Fellow citizens with the saints","Foreigners forever","Slaves of the temple","Strangers without hope"]'::jsonb, 'Fellow citizens with the saints', 'Believers are no longer strangers and foreigners, but fellow citizens with the saints and of God''s household (Ephesians 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 2, what are believers called in God''s household?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 2, 'How did believers once walk according to Ephesians 2?', '["According to the course of this world and the prince of the power of the air","According to the prophets and apostles","According to heavenly wisdom","According to the law of love"]'::jsonb, 'According to the course of this world and the prince of the power of the air', 'Paul says they once walked according to the course of this world, according to the prince of the power of the air (Ephesians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did believers once walk according to Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 2, 'Why did God make believers alive together with Christ in Ephesians 2?', '["Because of his great love and rich mercy","Because they first proved their worth","Because they kept every ordinance","Because Rome approved them"]'::jsonb, 'Because of his great love and rich mercy', 'God, being rich in mercy, because of his great love with which he loved us, made us alive together with Christ (Ephesians 2:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did God make believers alive together with Christ in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 2, 'What does Ephesians 2 say about salvation and works?', '["It is not of works, so that no one may boast","It comes mainly through moral effort","It depends first on ethnic identity","It requires temple sacrifices"]'::jsonb, 'It is not of works, so that no one may boast', 'Paul says salvation is by grace through faith and not of works, that no one would boast (Ephesians 2:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Ephesians 2 say about salvation and works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 2, 'What did Gentiles once lack according to Ephesians 2?', '["Hope and God in the world","Any language or family","A place in the Roman empire","Food and clothing only"]'::jsonb, 'Hope and God in the world', 'Paul says they were strangers to the covenants of promise, having no hope and without God in the world (Ephesians 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Gentiles once lack according to Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 2, 'On what foundation is God''s household built in Ephesians 2?', '["The apostles and prophets, with Christ Jesus as the chief cornerstone","The ceremonies of Moses alone","The kings of Israel","The wisdom of Greece"]'::jsonb, 'The apostles and prophets, with Christ Jesus as the chief cornerstone', 'God''s household is built on the foundation of the apostles and prophets, Christ Jesus himself being the chief cornerstone (Ephesians 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'On what foundation is God''s household built in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 3, 'What is the point of contrasting former death with present life in Ephesians 2?', '["Salvation is entirely God\u0027s merciful act toward the spiritually helpless","People can revive themselves if given enough time","Sin only wounds but never enslaves","Faith matters less than ancestry"]'::jsonb, 'Salvation is entirely God''s merciful act toward the spiritually helpless', 'Paul begins with spiritual death and then emphasizes God''s mercy and grace in making believers alive with Christ (Ephesians 2:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of contrasting former death with present life in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 3, 'Why does Paul call believers God''s workmanship in Ephesians 2?', '["Their new life is God\u0027s creation, leading to good works he prepared beforehand","They are saved by the quality of their labor","Only apostles are God\u0027s workmanship","Good works replace grace as the basis of salvation"]'::jsonb, 'Their new life is God''s creation, leading to good works he prepared beforehand', 'Paul says believers are God''s workmanship, created in Christ Jesus for good works prepared beforehand (Ephesians 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul call believers God''s workmanship in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 3, 'What does it mean that Christ ''is our peace'' in Ephesians 2?', '["He personally reconciles hostile groups to God and to one another","He merely teaches peaceful ideas without changing relationships","He ends all distinctions of creaturely life","He grants peace only to one ethnic group"]'::jsonb, 'He personally reconciles hostile groups to God and to one another', 'Christ made both groups one, broke down the dividing wall, and reconciled both in one body to God through the cross (Ephesians 2:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does it mean that Christ ''is our peace'' in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 3, 'How does Ephesians 2 describe the result of Christ''s work for Gentiles who were far away?', '["They have been brought near by the blood of Christ","They remain in the outer court","They must first become Jews to approach God","They receive only partial access"]'::jsonb, 'They have been brought near by the blood of Christ', 'Paul says those who once were far off were brought near in the blood of Christ (Ephesians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Ephesians 2 describe the result of Christ''s work for Gentiles who were far away?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 3, 'What picture of the church concludes Ephesians 2?', '["A holy temple growing together in the Lord","A scattered crowd without structure","A restored political kingdom","An army built on earthly power"]'::jsonb, 'A holy temple growing together in the Lord', 'Paul says the whole building, fitted together, grows into a holy temple in the Lord, a dwelling place of God in the Spirit (Ephesians 2:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What picture of the church concludes Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 4, 'How does Ephesians 2 connect vertical reconciliation with horizontal reconciliation?', '["Christ reconciles people to God through the cross and therefore also makes former enemies one in him","Peace with God has no effect on human divisions","Human unity comes first and then God accepts it","Only Jews receive reconciliation with God"]'::jsonb, 'Christ reconciles people to God through the cross and therefore also makes former enemies one in him', 'Paul joins Christ''s reconciliation of both groups to God in one body with the destruction of hostility between them (Ephesians 2:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 2 connect vertical reconciliation with horizontal reconciliation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 4, 'Why does Paul stress that salvation is by grace through faith and not from works in Ephesians 2?', '["To exclude boasting and show salvation is God\u0027s gift from start to finish","To deny the importance of obedience after conversion","To say faith is itself a human achievement","To reject the Old Testament entirely"]'::jsonb, 'To exclude boasting and show salvation is God''s gift from start to finish', 'Paul says salvation is the gift of God, not of works, so that no one may boast (Ephesians 2:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul stress that salvation is by grace through faith and not from works in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 4, 'How does the temple imagery at the end of Ephesians 2 deepen the chapter''s message of unity?', '["Former outsiders are now built together as one dwelling place of God in the Spirit","The old Jerusalem temple remains the only meeting place with God","Only Jewish believers become stones in God\u0027s house","Unity requires removing Christ as cornerstone"]'::jsonb, 'Former outsiders are now built together as one dwelling place of God in the Spirit', 'Paul says believers are being built together for a habitation of God in the Spirit, showing a shared identity in one spiritual temple (Ephesians 2:19-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the temple imagery at the end of Ephesians 2 deepen the chapter''s message of unity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 4, 'What is the force of saying believers are seated with Christ in the heavenly places?', '["Their new status and life are bound up with the risen Christ, not merely earthly conditions","They no longer live on earth in any meaningful sense","Only future believers will share Christ\u0027s life","They already rule earthly governments"]'::jsonb, 'Their new status and life are bound up with the risen Christ, not merely earthly conditions', 'God raised believers up with Christ and seated them with him in the heavenly places, showing the believer''s new standing in union with Christ (Ephesians 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the force of saying believers are seated with Christ in the heavenly places?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 5, 'What larger biblical pattern is fulfilled when those far off are brought near in Ephesians 2?', '["God\u0027s covenant promises expand in Christ to gather the nations into one reconciled people","The nations replace Israel through political conquest","Gentiles gain access apart from Christ\u0027s blood","The promises are reduced to earthly territory only"]'::jsonb, 'God''s covenant promises expand in Christ to gather the nations into one reconciled people', 'Paul describes Gentiles once excluded from Israel''s commonwealth as now brought near by Christ''s blood into one household and temple of God (Ephesians 2:12-13, 19-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger biblical pattern is fulfilled when those far off are brought near in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 5, 'Why is Ephesians 2 crucial for understanding Christian identity?', '["It defines believers by grace, resurrection life, reconciliation, and shared belonging in God\u0027s household","It makes ancestry and ritual the main markers of God\u0027s people","It centers identity on earthly citizenship","It teaches salvation without transformation"]'::jsonb, 'It defines believers by grace, resurrection life, reconciliation, and shared belonging in God''s household', 'The chapter moves from death to life, from alienation to access, and from hostility to one new humanity in Christ (Ephesians 2:1-10, 11-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Ephesians 2 crucial for understanding Christian identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 5, 'How does Ephesians 2 answer the idea that grace produces passivity?', '["Grace saves apart from works yet creates a new people for the good works God prepared","Grace removes all ethical calling from life","Grace matters only before baptism","Grace is another name for lawkeeping"]'::jsonb, 'Grace saves apart from works yet creates a new people for the good works God prepared', 'Paul denies salvation by works but immediately says believers are created in Christ Jesus for good works prepared beforehand (Ephesians 2:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 2 answer the idea that grace produces passivity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 5, 'What is the significance of Christ abolishing ''the law of commandments contained in ordinances'' in Ephesians 2?', '["He removes the barrier that divided Jew and Gentile so as to create one new humanity in peace","He abolishes God\u0027s moral will altogether","He rejects every use of the Old Testament","He erases the need for holiness"]'::jsonb, 'He removes the barrier that divided Jew and Gentile so as to create one new humanity in peace', 'Paul explains that Christ abolished the dividing ordinances in order to create one new man and reconcile both groups to God through the cross (Ephesians 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of Christ abolishing ''the law of commandments contained in ordinances'' in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 1, 'According to Ephesians 3, for whom is Paul a prisoner?', '["For Christ Jesus on behalf of the Gentiles","For Caesar on behalf of Rome","For Jerusalem on behalf of the priests","For Moses on behalf of Israel"]'::jsonb, 'For Christ Jesus on behalf of the Gentiles', 'Paul says he is the prisoner of Christ Jesus on behalf of you Gentiles (Ephesians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 3, for whom is Paul a prisoner?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 1, 'According to Ephesians 3, what mystery was made known to Paul by revelation?', '["That the Gentiles are fellow heirs and fellow members of the body","That angels would replace the church","That Israel would lose every promise","That the temple would be rebuilt immediately"]'::jsonb, 'That the Gentiles are fellow heirs and fellow members of the body', 'Paul says the mystery is that Gentiles are fellow heirs, fellow members of the body, and fellow partakers of the promise in Christ through the gospel (Ephesians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 3, what mystery was made known to Paul by revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 1, 'According to Ephesians 3, what was Paul given to preach among the Gentiles?', '["The unsearchable riches of Christ","The wisdom of Greek philosophers","The rule of the synagogue","The traditions of the elders"]'::jsonb, 'The unsearchable riches of Christ', 'Paul says grace was given to him to preach to the Gentiles the unsearchable riches of Christ (Ephesians 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 3, what was Paul given to preach among the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 1, 'According to Ephesians 3, through whom is the manifold wisdom of God now made known?', '["Through the church","Through Caesar","Through the temple veil","Through secret books"]'::jsonb, 'Through the church', 'Paul says the manifold wisdom of God is now made known through the church to the rulers and authorities in the heavenly places (Ephesians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 3, through whom is the manifold wisdom of God now made known?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 1, 'According to Ephesians 3, through what do believers have boldness and access with confidence?', '["Through faith in Christ","Through national privilege","Through ceremonial law","Through temple priests"]'::jsonb, 'Through faith in Christ', 'Paul says in Christ we have boldness and access in confidence through our faith in him (Ephesians 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 3, through what do believers have boldness and access with confidence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 2, 'Why does Paul tell the Ephesians not to lose heart at his tribulations?', '["Because his sufferings are for their glory","Because suffering proves God has abandoned him","Because prison ends the gospel\u0027s spread","Because he expects immediate release"]'::jsonb, 'Because his sufferings are for their glory', 'Paul asks them not to lose heart at his tribulations for them, which are their glory (Ephesians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul tell the Ephesians not to lose heart at his tribulations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 2, 'Before whom does Paul bow his knees in Ephesians 3?', '["The Father","The emperor","The Sanhedrin","The angels"]'::jsonb, 'The Father', 'Paul says, ''For this cause, I bow my knees to the Father'' (Ephesians 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Before whom does Paul bow his knees in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 2, 'What does Paul pray Christ may do in the hearts of believers in Ephesians 3?', '["Dwell in their hearts through faith","Condemn them through the law","Replace the Spirit\u0027s work","Remove their memory"]'::jsonb, 'Dwell in their hearts through faith', 'Paul prays that Christ may dwell in their hearts through faith (Ephesians 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul pray Christ may do in the hearts of believers in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 2, 'What dimensions of Christ''s love does Paul mention in Ephesians 3?', '["Its breadth, length, height, and depth","Its color, sound, shape, and form","Its history, language, law, and land","Its strength, speed, weight, and fire"]'::jsonb, 'Its breadth, length, height, and depth', 'Paul prays that believers may comprehend the breadth, length, height, and depth of Christ''s love (Ephesians 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What dimensions of Christ''s love does Paul mention in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 2, 'How much is God able to do according to Ephesians 3?', '["Exceedingly abundantly above all that we ask or think","Only what we can imagine clearly","Only what the apostles request","Only what Israel expects"]'::jsonb, 'Exceedingly abundantly above all that we ask or think', 'Paul closes with praise to the God who is able to do exceedingly abundantly above all that we ask or think (Ephesians 3:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How much is God able to do according to Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 3, 'Why does Paul call the inclusion of the Gentiles a ''mystery'' in Ephesians 3?', '["It was part of God\u0027s plan but is now revealed clearly in Christ and by the Spirit","It is permanently unknowable to the church","It is a secret for a spiritual elite only","It was invented by Paul in prison"]'::jsonb, 'It was part of God''s plan but is now revealed clearly in Christ and by the Spirit', 'Paul says the mystery was not made known in former generations as it has now been revealed to Christ''s holy apostles and prophets in the Spirit (Ephesians 3:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul call the inclusion of the Gentiles a ''mystery'' in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 3, 'What does Ephesians 3 suggest about the purpose of Paul''s ministry?', '["To make plain God\u0027s eternal plan in Christ for Jews and Gentiles together","To secure political power for the churches","To replace all other apostles","To establish a new temple priesthood"]'::jsonb, 'To make plain God''s eternal plan in Christ for Jews and Gentiles together', 'Paul says grace was given to him to preach Christ''s riches to the Gentiles and to make all see the fellowship of the mystery (Ephesians 3:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 3 suggest about the purpose of Paul''s ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 3, 'Why does Paul pray for inner strengthening before speaking of knowing Christ''s love?', '["Deep grasp of Christ\u0027s love requires spiritual power in the inner person","The body must be ignored in Christian life","Human effort alone can reach divine fullness","Knowledge matters more than love"]'::jsonb, 'Deep grasp of Christ''s love requires spiritual power in the inner person', 'Paul prays they may be strengthened through the Spirit in the inner man so that Christ may dwell in their hearts and they may know his love (Ephesians 3:16-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul pray for inner strengthening before speaking of knowing Christ''s love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 3, 'What does it mean to be ''filled with all the fullness of God'' in Ephesians 3?', '["Believers are to be saturated by God\u0027s life and presence, not made equal to God","Believers become divine beings by nature","Only apostles can receive God\u0027s fullness","Fullness refers only to material prosperity"]'::jsonb, 'Believers are to be saturated by God''s life and presence, not made equal to God', 'Paul prays that believers may know Christ''s love and be filled to all the fullness of God, speaking of spiritual fullness through God''s indwelling grace (Ephesians 3:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does it mean to be ''filled with all the fullness of God'' in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 3, 'What role does the church have in God''s cosmic purpose according to Ephesians 3?', '["The church displays God\u0027s manifold wisdom even to heavenly rulers and authorities","The church exists only for private devotion","The church replaces Christ as mediator","The church hides God\u0027s purposes from the nations"]'::jsonb, 'The church displays God''s manifold wisdom even to heavenly rulers and authorities', 'Paul says the manifold wisdom of God is now made known through the church to rulers and authorities in the heavenly places (Ephesians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What role does the church have in God''s cosmic purpose according to Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 4, 'How does Ephesians 3 build on the unity theme of chapter 2?', '["It explains that the one new people of God is the revealed mystery of Christ and the focus of Paul\u0027s ministry","It abandons the theme of Jew and Gentile reconciliation","It limits God\u0027s plan to Israel only","It moves from unity to ceremonial law"]'::jsonb, 'It explains that the one new people of God is the revealed mystery of Christ and the focus of Paul''s ministry', 'After showing Christ made both groups one in chapter 2, Paul explains in chapter 3 that Gentiles are fellow heirs and members of the same body (Ephesians 2:14-16; 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 3 build on the unity theme of chapter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 4, 'Why is Paul''s imprisonment not a contradiction of his ministry in Ephesians 3?', '["His suffering belongs within God\u0027s gracious purpose to bring the gospel to the Gentiles","Prison proves the mystery failed","Paul says suffering has no meaning for believers","Only free men can serve Christ effectively"]'::jsonb, 'His suffering belongs within God''s gracious purpose to bring the gospel to the Gentiles', 'Paul presents himself as a prisoner for the Gentiles and tells them not to lose heart at his tribulations, since these serve their glory (Ephesians 3:1, 13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Paul''s imprisonment not a contradiction of his ministry in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 4, 'How does Paul''s prayer in Ephesians 3 move from strength to love to fullness?', '["The Spirit strengthens the inner person so Christ dwells by faith, leading to deeper grasp of his love and fuller experience of God\u0027s life","Strength comes through law, love through fear, and fullness through rituals","Fullness comes before Christ dwells in believers","Love replaces the need for the Spirit"]'::jsonb, 'The Spirit strengthens the inner person so Christ dwells by faith, leading to deeper grasp of his love and fuller experience of God''s life', 'Paul prays for Spirit-strengthened inner life, Christ dwelling by faith, comprehension of Christ''s love, and fullness of God (Ephesians 3:16-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s prayer in Ephesians 3 move from strength to love to fullness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 4, 'What does Ephesians 3 imply about confidence in prayer and access to God?', '["Because of Christ believers approach God boldly, and God\u0027s power exceeds their requests and thoughts","Prayer depends on temple location and priestly rank","Confidence belongs only to apostles in prison","God can do only what believers are able to imagine"]'::jsonb, 'Because of Christ believers approach God boldly, and God''s power exceeds their requests and thoughts', 'Paul speaks of bold access through faith in Christ and then praises God as able to do beyond all we ask or think (Ephesians 3:12, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Ephesians 3 imply about confidence in prayer and access to God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 5, 'Why is Ephesians 3 important for understanding the church''s place in God''s eternal purpose?', '["It shows the church is not an afterthought but the arena where God\u0027s long-hidden plan in Christ is now revealed","It treats the church as a temporary pause in redemption","It says heavenly powers reveal God to the church rather than through it","It places God\u0027s main purpose in political reform"]'::jsonb, 'It shows the church is not an afterthought but the arena where God''s long-hidden plan in Christ is now revealed', 'Paul says the mystery hidden in God is now revealed and that through the church God''s manifold wisdom is made known according to his eternal purpose in Christ (Ephesians 3:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Ephesians 3 important for understanding the church''s place in God''s eternal purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 5, 'How does Ephesians 3 portray the love of Christ as both knowable and beyond knowledge?', '["Believers truly experience Christ\u0027s love, yet it always surpasses what finite minds can exhaust","Christ\u0027s love cannot be known in any real sense","Only scholars can know Christ\u0027s love","The chapter treats love as less important than power"]'::jsonb, 'Believers truly experience Christ''s love, yet it always surpasses what finite minds can exhaust', 'Paul prays they may know the love of Christ which surpasses knowledge, expressing both real experience and inexhaustible greatness (Ephesians 3:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 3 portray the love of Christ as both knowable and beyond knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 5, 'What does Ephesians 3 suggest about the relationship between doctrine and doxology?', '["Revealed truth about God\u0027s mystery leads naturally into worship and praise","Doctrine and worship should remain separate","Only emotional experience leads to doxology","Doxology replaces careful teaching"]'::jsonb, 'Revealed truth about God''s mystery leads naturally into worship and praise', 'Paul''s exposition of the mystery and his prayer conclude in praise to God, showing theology issuing in worship (Ephesians 3:8-12, 14-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Ephesians 3 suggest about the relationship between doctrine and doxology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 5, 'Why is the phrase ''according to the power that works in us'' significant in Ephesians 3:20?', '["God\u0027s immeasurable ability is not distant only; it is already at work within believers by grace","Human inner strength creates God\u0027s power","Only extraordinary miracle-workers have this power","The church must wait until heaven to know any divine power"]'::jsonb, 'God''s immeasurable ability is not distant only; it is already at work within believers by grace', 'Paul praises the God able to do beyond what we ask or think according to the power already working in believers (Ephesians 3:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''according to the power that works in us'' significant in Ephesians 3:20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 1, 'According to Ephesians 4, how should believers walk in relation to their calling?', '["Worthily","Carelessly","Proudly","Secretively"]'::jsonb, 'Worthily', 'Paul urges believers to walk worthily of the calling with which they were called (Ephesians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 4, how should believers walk in relation to their calling?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 1, 'According to Ephesians 4, what should believers keep in the bond of peace?', '["The unity of the Spirit","The old self","The dividing wall","The works of darkness"]'::jsonb, 'The unity of the Spirit', 'Paul tells believers to be eager to keep the unity of the Spirit in the bond of peace (Ephesians 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 4, what should believers keep in the bond of peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 1, 'According to Ephesians 4, who gave gifts to people after ascending on high?', '["Christ","Moses","Paul","The rulers of the nations"]'::jsonb, 'Christ', 'Paul says Christ ascended on high and gave gifts to men (Ephesians 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 4, who gave gifts to people after ascending on high?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 1, 'According to Ephesians 4, what should the thief do instead of stealing?', '["Work with his hands what is good","Hide more carefully","Wait for charity only","Leave the city"]'::jsonb, 'Work with his hands what is good', 'Paul says the one who stole should steal no more, but rather labor, working with his hands what is good (Ephesians 4:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 4, what should the thief do instead of stealing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 1, 'According to Ephesians 4, by whom are believers sealed for the day of redemption?', '["The Holy Spirit of God","The chief priest","The angels of heaven","Their own obedience"]'::jsonb, 'The Holy Spirit of God', 'Paul says not to grieve the Holy Spirit of God, in whom believers were sealed for the day of redemption (Ephesians 4:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 4, by whom are believers sealed for the day of redemption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 2, 'What attitudes does Paul pair with a worthy walk in Ephesians 4?', '["Lowliness, humility, patience, and bearing with one another in love","Self-assertion, boldness, and rivalry","Distance, secrecy, and silence","Power, wealth, and influence"]'::jsonb, 'Lowliness, humility, patience, and bearing with one another in love', 'Paul describes a worthy walk with all lowliness, humility, patience, and bearing with one another in love (Ephesians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What attitudes does Paul pair with a worthy walk in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 2, 'For what purpose did Christ give apostles, prophets, evangelists, pastors, and teachers?', '["For the equipping of the saints for the work of service","For ruling nations by force","For keeping ministry in the hands of a few","For replacing the church\u0027s need for love"]'::jsonb, 'For the equipping of the saints for the work of service', 'Christ gave ministry gifts for equipping the saints for the work of service, to the building up of Christ''s body (Ephesians 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'For what purpose did Christ give apostles, prophets, evangelists, pastors, and teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 2, 'What danger does Paul say maturity protects believers from in Ephesians 4?', '["Being tossed by every wind of doctrine","Serving one another","Working honestly","Speaking the truth"]'::jsonb, 'Being tossed by every wind of doctrine', 'Paul says spiritual maturity keeps believers from being tossed to and fro and carried about with every wind of doctrine (Ephesians 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What danger does Paul say maturity protects believers from in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 2, 'What does Paul tell believers to speak in Ephesians 4?', '["The truth in love","Flattery for peace","Mysteries without explanation","Only silence"]'::jsonb, 'The truth in love', 'Paul says believers are to speak truth in love and grow up in all things into Christ (Ephesians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul tell believers to speak in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 2, 'What old pattern of life are believers told to put off in Ephesians 4?', '["The old man corrupted by deceitful lusts","The hope of their calling","The unity of the Spirit","The love of Christ"]'::jsonb, 'The old man corrupted by deceitful lusts', 'Paul says to put off the old man that grows corrupt after deceitful lusts (Ephesians 4:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What old pattern of life are believers told to put off in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 3, 'Why does Ephesians 4 place unity and diversity together in the same chapter?', '["The one body of Christ is preserved through varied gifts given by the same exalted Lord","Unity requires eliminating all distinctions of gifting","Diversity exists only because unity failed","Paul changes subjects without connection"]'::jsonb, 'The one body of Christ is preserved through varied gifts given by the same exalted Lord', 'Paul affirms one body, one Spirit, one Lord, and also says grace was given to each one according to Christ''s gift (Ephesians 4:4-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Ephesians 4 place unity and diversity together in the same chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 3, 'What does ''speaking truth in love'' imply in Ephesians 4?', '["Christian maturity requires both doctrinal honesty and loving character","Truth should be softened until it disappears","Love excuses falsehood if peace is maintained","Only leaders must care about truth"]'::jsonb, 'Christian maturity requires both doctrinal honesty and loving character', 'Paul connects speaking the truth in love with growing up into Christ, joining truth and love in maturity (Ephesians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''speaking truth in love'' imply in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 3, 'How does Ephesians 4 describe the Christian life as a process of renewal?', '["Believers put off the old self, are renewed in mind, and put on the new self","Believers return gradually to their former habits","Renewal happens without any ethical change","The body matters but the mind does not"]'::jsonb, 'Believers put off the old self, are renewed in mind, and put on the new self', 'Paul commands believers to put off the old man, be renewed in the spirit of their mind, and put on the new man created after God''s likeness (Ephesians 4:22-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Ephesians 4 describe the Christian life as a process of renewal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 3, 'Why does Paul connect everyday speech and anger to grieving the Holy Spirit?', '["Ordinary conduct matters because believers belong to God and are marked by his Spirit","The Spirit cares only about public worship","Words and emotions are morally neutral","Only theft can grieve the Spirit"]'::jsonb, 'Ordinary conduct matters because believers belong to God and are marked by his Spirit', 'Paul places lying, corrupt speech, anger, and bitterness alongside the warning not to grieve the Holy Spirit who sealed believers (Ephesians 4:25-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect everyday speech and anger to grieving the Holy Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 3, 'What does Ephesians 4 teach about ministry in the church?', '["Leaders equip the whole body so every part contributes to growth","Only a few gifted people do the real work","Maturity comes by isolation from the church","Growth is unrelated to truth or love"]'::jsonb, 'Leaders equip the whole body so every part contributes to growth', 'Paul says ministry gifts equip the saints, and the whole body grows as each part does its work in love (Ephesians 4:11-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 4 teach about ministry in the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 4, 'How does Ephesians 4 connect doctrine, ministry, and maturity?', '["Christ gives teaching gifts so the body grows into stable, truthful, loving maturity","Doctrine is for leaders while maturity is for ordinary believers","Ministry replaces the need for doctrinal truth","Maturity means freedom from the church"]'::jsonb, 'Christ gives teaching gifts so the body grows into stable, truthful, loving maturity', 'Paul links Christ''s gifts, the equipping of the saints, protection from false teaching, and growth into Christ through truth and love (Ephesians 4:11-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 4 connect doctrine, ministry, and maturity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 4, 'Why does Paul move from the one body and one Lord to commands about lying, labor, and speech?', '["The unity of the church must be embodied in concrete habits that fit the new creation in Christ","Practical ethics are unrelated to Christian doctrine","The chapter abandons unity once behavior is discussed","Only social harmony matters, not holiness"]'::jsonb, 'The unity of the church must be embodied in concrete habits that fit the new creation in Christ', 'Paul grounds ethical commands in the believers'' shared identity as one body and their renewal in Christ (Ephesians 4:4-6, 22-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul move from the one body and one Lord to commands about lying, labor, and speech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 4, 'What is the significance of Christ''s descent and ascent in Ephesians 4?', '["The risen Christ fills all things and has authority to distribute gifts to his people","It means Christ stopped being Lord while on earth","It concerns only the geography of Jerusalem","It limits Christ\u0027s authority to heaven only"]'::jsonb, 'The risen Christ fills all things and has authority to distribute gifts to his people', 'Paul says the one who descended is also the one who ascended far above all heavens that he might fill all things, and then speaks of his gifts (Ephesians 4:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of Christ''s descent and ascent in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 4, 'How does Ephesians 4 portray holiness in relation to community?', '["Personal renewal and communal peace belong together in the life of the body","Holiness is private and has no effect on others","Community life matters more than truth","Only leaders are called to purity"]'::jsonb, 'Personal renewal and communal peace belong together in the life of the body', 'Paul joins the call to worthy, humble unity with putting off the old self and practicing truthful, edifying, forgiving conduct toward one another (Ephesians 4:1-3, 22-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 4 portray holiness in relation to community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 5, 'Why is Ephesians 4 crucial for a theology of the church?', '["It presents the church as one body under one Lord, growing to maturity through Christ\u0027s gifts and the loving work of every member","It teaches the church can mature without shared doctrine","It treats unity as optional for gifted believers","It places church growth in political success"]'::jsonb, 'It presents the church as one body under one Lord, growing to maturity through Christ''s gifts and the loving work of every member', 'Paul ties unity, gifted ministry, truth, love, and the effective working of each part together in describing the church''s growth into Christ (Ephesians 4:4-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Ephesians 4 crucial for a theology of the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 5, 'What deeper point lies behind Paul''s contrast between the Gentiles'' darkened mind and the believer''s renewed mind?', '["Conversion involves a fundamental reorientation of understanding, desire, and conduct under Christ","The mind has no role in Christian obedience","Only behavior changes while inner life remains the same","Paul is condemning all non-Jews by ethnicity"]'::jsonb, 'Conversion involves a fundamental reorientation of understanding, desire, and conduct under Christ', 'Paul contrasts the futility, darkness, and hardness of the old life with learning Christ, renewal of the mind, and the new self created after God''s likeness (Ephesians 4:17-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper point lies behind Paul''s contrast between the Gentiles'' darkened mind and the believer''s renewed mind?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 5, 'How does Ephesians 4 redefine freedom from the old life?', '["Freedom is not moral emptiness but participation in truthful, constructive, Spirit-honoring life together","Freedom means each person follows private impulses","Freedom cancels the need for speech discipline","Freedom belongs only to the most gifted believers"]'::jsonb, 'Freedom is not moral emptiness but participation in truthful, constructive, Spirit-honoring life together', 'Paul''s commands about truth, labor, speech, kindness, and forgiveness show the shape of life after putting off the old self and putting on the new (Ephesians 4:25-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 4 redefine freedom from the old life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 5, 'What is the significance of saying the new self is created after the likeness of God in righteousness and holiness of truth?', '["The gospel restores humans toward God\u0027s intended image in a distinctly moral and truthful life","Believers become creators alongside God","Truth and holiness are secondary to giftedness","The new self is purely symbolic with no ethical demand"]'::jsonb, 'The gospel restores humans toward God''s intended image in a distinctly moral and truthful life', 'Paul says believers are to put on the new self created according to God in righteousness and holiness of the truth (Ephesians 4:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of saying the new self is created after the likeness of God in righteousness and holiness of truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 1, 'According to Ephesians 5, whom should believers imitate?', '["God","Caesar","The old self","The rulers of this age"]'::jsonb, 'God', 'Paul says, ''Be therefore imitators of God, as beloved children'' (Ephesians 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 5, whom should believers imitate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 1, 'According to Ephesians 5, how did Christ love us?', '["He gave himself up for us","He ignored our weakness","He ruled by fear","He waited for us to deserve it"]'::jsonb, 'He gave himself up for us', 'Paul says Christ loved us and gave himself up for us, an offering and sacrifice to God (Ephesians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 5, how did Christ love us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 1, 'According to Ephesians 5, what are believers called?', '["Light in the Lord","Children of wrath","Strangers forever","Servants of darkness"]'::jsonb, 'Light in the Lord', 'Paul says, ''Now you are light in the Lord. Walk as children of light'' (Ephesians 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 5, what are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 1, 'According to Ephesians 5, with what should believers be filled instead of wine?', '["The Spirit","Bold speech only","Worldly pleasure","Secret knowledge"]'::jsonb, 'The Spirit', 'Paul says, ''Don''t be drunken with wine... but be filled with the Spirit'' (Ephesians 5:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 5, with what should believers be filled instead of wine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 1, 'According to Ephesians 5, what should wives do toward their husbands?', '["Be subject as to the Lord","Rule over them by force","Ignore them completely","Treat them as strangers"]'::jsonb, 'Be subject as to the Lord', 'Paul says wives should be subject to their own husbands as to the Lord (Ephesians 5:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 5, what should wives do toward their husbands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 2, 'What kind of speech does Paul reject in Ephesians 5?', '["Filthiness, foolish talking, and coarse jesting","Teaching with patience","Psalms and hymns","Giving thanks"]'::jsonb, 'Filthiness, foolish talking, and coarse jesting', 'Paul says filthiness, foolish talking, and coarse jesting are not fitting; instead there should be giving of thanks (Ephesians 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of speech does Paul reject in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 2, 'How are believers to walk according to Ephesians 5?', '["Carefully, as wise and not unwise","Carelessly, because grace covers all","In fear of every person","Only when others are watching"]'::jsonb, 'Carefully, as wise and not unwise', 'Paul says to walk carefully, not as unwise but as wise (Ephesians 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How are believers to walk according to Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 2, 'Why should believers redeem the time according to Ephesians 5?', '["Because the days are evil","Because the harvest is over","Because Rome is near","Because wisdom has vanished"]'::jsonb, 'Because the days are evil', 'Paul says to redeem the time because the days are evil (Ephesians 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why should believers redeem the time according to Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 2, 'What should believers seek to understand in Ephesians 5?', '["What the will of the Lord is","How to please every person","How to control the nations","What the stars decree"]'::jsonb, 'What the will of the Lord is', 'Paul says, ''Don''t be foolish, but understand what the will of the Lord is'' (Ephesians 5:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should believers seek to understand in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 2, 'How are Spirit-filled believers described as speaking in Ephesians 5?', '["In psalms, hymns, and spiritual songs","Only in silence before God","Only with prophetic warnings","In the language of angels alone"]'::jsonb, 'In psalms, hymns, and spiritual songs', 'Paul says Spirit-filled believers speak to one another in psalms, hymns, and spiritual songs (Ephesians 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How are Spirit-filled believers described as speaking in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 3, 'What does it mean to walk in love in Ephesians 5?', '["To pattern life after Christ\u0027s self-giving sacrifice","To affirm every desire without discernment","To avoid correction in the church","To love only those who agree with us"]'::jsonb, 'To pattern life after Christ''s self-giving sacrifice', 'Paul grounds love in Christ''s sacrificial self-giving, making that the pattern for believers (Ephesians 5:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does it mean to walk in love in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 3, 'Why does Paul contrast darkness and light in Ephesians 5?', '["Believers\u0027 new identity in the Lord requires a new kind of visible life","Creation itself is being abolished","Only public sins matter to God","Knowledge is evil but emotion is good"]'::jsonb, 'Believers'' new identity in the Lord requires a new kind of visible life', 'Because believers are now light in the Lord, Paul calls them to walk as children of light and expose unfruitful works of darkness (Ephesians 5:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul contrast darkness and light in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 3, 'What does Ephesians 5 teach about wisdom?', '["Wisdom discerns the Lord\u0027s will and uses time well in evil days","Wisdom is mainly speculative knowledge","Wisdom means avoiding all ordinary responsibilities","Wisdom comes from wine-induced inspiration"]'::jsonb, 'Wisdom discerns the Lord''s will and uses time well in evil days', 'Paul ties wisdom to careful walking, redeeming the time, and understanding the will of the Lord (Ephesians 5:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 5 teach about wisdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 3, 'How does Ephesians 5 connect worship and daily life?', '["Spirit-filled worship overflows into gratitude, mutual submission, and transformed relationships","Worship is separate from ethical living","Daily life matters less than singing skill","Marriage has no relation to Christ"]'::jsonb, 'Spirit-filled worship overflows into gratitude, mutual submission, and transformed relationships', 'Paul moves from being filled with the Spirit and singing with thankfulness into mutual submission and household instructions (Ephesians 5:18-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Ephesians 5 connect worship and daily life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 3, 'What does the husband''s love for his wife model according to Ephesians 5?', '["Christ\u0027s sacrificial love for the church","Adam\u0027s authority before the fall","The power of Roman household codes","The love of a teacher for students"]'::jsonb, 'Christ''s sacrificial love for the church', 'Paul commands husbands to love their wives just as Christ loved the church and gave himself up for her (Ephesians 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the husband''s love for his wife model according to Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 4, 'How does Ephesians 5 connect holiness and love?', '["Holy living flows from beloved identity and is patterned after Christ\u0027s loving sacrifice","Holiness and love pull in opposite directions","Love excuses impurity if motives are sincere","Holiness belongs only to private worship"]'::jsonb, 'Holy living flows from beloved identity and is patterned after Christ''s loving sacrifice', 'Paul calls believers beloved children who imitate God, walk in Christlike love, and reject impurity and darkness (Ephesians 5:1-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 5 connect holiness and love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 4, 'Why does Paul treat marriage as a ''great mystery'' in Ephesians 5?', '["Human marriage points beyond itself to Christ\u0027s relationship with the church","Marriage is too confusing to understand clearly","Only apostles may marry faithfully","Marriage replaces the gospel as the main message"]'::jsonb, 'Human marriage points beyond itself to Christ''s relationship with the church', 'After citing Genesis about husband and wife becoming one flesh, Paul says this mystery is great, but he speaks concerning Christ and the church (Ephesians 5:31-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul treat marriage as a ''great mystery'' in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 4, 'How does being filled with the Spirit differ from being drunk with wine in Ephesians 5?', '["The Spirit produces ordered worship, gratitude, and submission rather than dissipation","Both lead to the same kind of freedom","Wine is condemned because all joy is suspect","The Spirit removes the need for self-control"]'::jsonb, 'The Spirit produces ordered worship, gratitude, and submission rather than dissipation', 'Paul contrasts drunkenness leading to debauchery with Spirit-filled life expressed in worship, thanksgiving, and mutual submission (Ephesians 5:18-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does being filled with the Spirit differ from being drunk with wine in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 4, 'What does Ephesians 5 suggest about Christ''s purpose for the church?', '["He sanctifies and cleanses the church to present her glorious and holy","He leaves the church unchanged but forgiven","He values power more than purity","He intends only leaders to become holy"]'::jsonb, 'He sanctifies and cleanses the church to present her glorious and holy', 'Paul says Christ loved the church and gave himself up for her to sanctify her and present her to himself glorious, holy, and without blemish (Ephesians 5:25-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Ephesians 5 suggest about Christ''s purpose for the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 5, 'How does Ephesians 5 transform ordinary household life into a theological witness?', '["Marriage is framed as a lived parable of Christ\u0027s union with and care for the church","Household life is treated as spiritually unimportant","Only church gatherings reveal Christ\u0027s work","Family relationships replace the need for the gospel"]'::jsonb, 'Marriage is framed as a lived parable of Christ''s union with and care for the church', 'Paul interprets marriage through Christ and the church, making household love and honor part of the church''s witness to the gospel (Ephesians 5:22-33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 5 transform ordinary household life into a theological witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 5, 'Why does Ephesians 5 place thanksgiving at the center of holy speech and Spirit-filled life?', '["Thankfulness turns the heart from corrupt desire toward joyful recognition of God\u0027s grace","Thanksgiving is a minor courtesy with no theological weight","Only wealthy believers can give thanks properly","Giving thanks replaces the need for wisdom"]'::jsonb, 'Thankfulness turns the heart from corrupt desire toward joyful recognition of God''s grace', 'Paul replaces corrupt speech with thanksgiving and includes giving thanks always as a mark of Spirit-filled life (Ephesians 5:4, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Ephesians 5 place thanksgiving at the center of holy speech and Spirit-filled life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 5, 'What deeper moral vision stands behind Paul''s call to walk as children of light?', '["Christian ethics arise from participation in God\u0027s light, exposing darkness by a life shaped by truth, righteousness, and goodness","Believers should withdraw from the world and stop doing good within it","Light refers only to intellectual knowledge","Darkness can be overcome merely by public criticism"]'::jsonb, 'Christian ethics arise from participation in God''s light, exposing darkness by a life shaped by truth, righteousness, and goodness', 'Paul says the fruit of the light is in all goodness, righteousness, and truth, and calls believers to expose unfruitful works of darkness (Ephesians 5:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper moral vision stands behind Paul''s call to walk as children of light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 5, 'How does Ephesians 5 hold together authority, love, and mutual submission without reducing them to mere social custom?', '["These relationships are reinterpreted under Christ\u0027s lordship and sacrificial love rather than by raw power","Paul simply baptizes Roman customs without change","Mutual submission removes all distinctions of responsibility","Love cancels the need for any order in relationships"]'::jsonb, 'These relationships are reinterpreted under Christ''s lordship and sacrificial love rather than by raw power', 'The section is framed by reverence for Christ, Spirit-filled life, Christ''s sacrificial love, and the church''s relationship to Christ, giving the household instructions a gospel-shaped meaning (Ephesians 5:18-21, 25-33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 5 hold together authority, love, and mutual submission without reducing them to mere social custom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 1, 'According to Ephesians 6, what should children do in the Lord?', '["Obey their parents","Ignore correction","Teach their fathers","Seek their own way"]'::jsonb, 'Obey their parents', 'Paul says, ''Children, obey your parents in the Lord, for this is right'' (Ephesians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 6, what should children do in the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 1, 'According to Ephesians 6, what should fathers not do to their children?', '["Provoke them to wrath","Teach them the Lord\u0027s instruction","Pray for them","Provide for them"]'::jsonb, 'Provoke them to wrath', 'Paul says fathers should not provoke their children to wrath, but bring them up in the discipline and instruction of the Lord (Ephesians 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 6, what should fathers not do to their children?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 1, 'According to Ephesians 6, what should believers put on?', '["The whole armor of God","The garments of the temple","The robes of Rome","The old self"]'::jsonb, 'The whole armor of God', 'Paul tells believers to put on the whole armor of God so they may stand against the devil''s schemes (Ephesians 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 6, what should believers put on?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 1, 'According to Ephesians 6, what is the sword of the Spirit?', '["The word of God","Human reason","The law of Rome","The tongue of the wise"]'::jsonb, 'The word of God', 'Paul says the sword of the Spirit is the word of God (Ephesians 6:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 6, what is the sword of the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 1, 'According to Ephesians 6, who is sent to inform the Ephesians about Paul''s condition?', '["Tychicus","Timothy","Titus","Barnabas"]'::jsonb, 'Tychicus', 'Paul says Tychicus will make all things known to them concerning his circumstances (Ephesians 6:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 6, who is sent to inform the Ephesians about Paul''s condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 2, 'What commandment does Paul quote as the first with a promise in Ephesians 6?', '["Honor your father and mother","You shall not steal","You shall love your neighbor","Remember the Sabbath day"]'::jsonb, 'Honor your father and mother', 'Paul cites ''Honor your father and mother'' as the first commandment with promise (Ephesians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What commandment does Paul quote as the first with a promise in Ephesians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 2, 'How should bondservants obey their masters according to Ephesians 6?', '["With sincerity of heart, as to Christ","Only when being watched","By outward show without inner devotion","With resentment and delay"]'::jsonb, 'With sincerity of heart, as to Christ', 'Paul says bondservants should obey with fear and trembling, in singleness of heart, as to Christ (Ephesians 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should bondservants obey their masters according to Ephesians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 2, 'Against whom do believers wrestle according to Ephesians 6?', '["Rulers, authorities, and spiritual forces of wickedness","Only flesh and blood enemies","Only their own imagination","The saints of other churches"]'::jsonb, 'Rulers, authorities, and spiritual forces of wickedness', 'Paul says our wrestling is not against flesh and blood, but against rulers, authorities, and spiritual forces of wickedness in the heavenly places (Ephesians 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'Against whom do believers wrestle according to Ephesians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 2, 'What does Paul say the shield of faith can extinguish?', '["All the fiery darts of the evil one","Every earthly trial immediately","The need for prayer","The commands of God"]'::jsonb, 'All the fiery darts of the evil one', 'Paul says the shield of faith will enable believers to quench all the fiery darts of the evil one (Ephesians 6:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say the shield of faith can extinguish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 2, 'What does Paul ask prayer for in Ephesians 6?', '["That he may boldly make known the mystery of the gospel","That he may escape all suffering immediately","That he may return to Ephesus as ruler","That he may stop preaching to Gentiles"]'::jsonb, 'That he may boldly make known the mystery of the gospel', 'Paul asks that words may be given to him to open his mouth boldly to make known the mystery of the gospel (Ephesians 6:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul ask prayer for in Ephesians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 3, 'Why does Ephesians 6 place family and work relationships alongside spiritual warfare?', '["Ordinary obedience is part of the battlefield where loyalty to Christ is lived out","Spiritual warfare matters only at work","Family life is unrelated to Christ\u0027s lordship","Warfare replaces the need for daily faithfulness"]'::jsonb, 'Ordinary obedience is part of the battlefield where loyalty to Christ is lived out', 'Paul applies Christ''s lordship to children, fathers, servants, and masters before describing the armor needed to stand faithfully in spiritual conflict (Ephesians 6:1-9, 10-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Ephesians 6 place family and work relationships alongside spiritual warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 3, 'What does Ephesians 6 teach about Christian strength?', '["Believers are to be strong in the Lord and in the strength of his might","Strength comes mainly from natural personality","Only apostles need spiritual strength","Strength is found in weapons of flesh and blood"]'::jsonb, 'Believers are to be strong in the Lord and in the strength of his might', 'Paul says, ''Be strong in the Lord, and in the strength of his might'' (Ephesians 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 6 teach about Christian strength?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 3, 'Why is each piece of armor in Ephesians 6 associated with a spiritual reality?', '["Believers stand against evil through truth, righteousness, gospel peace, faith, salvation, and God\u0027s word","Paul is prescribing a literal military uniform for worship","The armor is mainly about social status","Only one piece really matters, and the rest are decorative"]'::jsonb, 'Believers stand against evil through truth, righteousness, gospel peace, faith, salvation, and God''s word', 'Paul names belt, breastplate, shoes, shield, helmet, and sword in ways that correspond to spiritual realities given by God (Ephesians 6:14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is each piece of armor in Ephesians 6 associated with a spiritual reality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 3, 'How does prayer function in Ephesians 6?', '["Prayer accompanies all the armor as constant dependence on God","Prayer is separate from spiritual warfare","Prayer is only for apostles in prison","Prayer replaces the need for truth and faith"]'::jsonb, 'Prayer accompanies all the armor as constant dependence on God', 'After describing the armor, Paul calls for praying at all times in the Spirit with all perseverance and supplication for all the saints (Ephesians 6:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does prayer function in Ephesians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 3, 'What does Ephesians 6 imply by calling Paul an ambassador in chains?', '["The gospel\u0027s royal message continues even through suffering and apparent weakness","Paul\u0027s imprisonment ended his mission","Chains gave Paul civil authority over Rome","Ambassadors no longer needed courage"]'::jsonb, 'The gospel''s royal message continues even through suffering and apparent weakness', 'Paul calls himself an ambassador in chains and asks for boldness, showing that gospel witness persists even under imprisonment (Ephesians 6:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 6 imply by calling Paul an ambassador in chains?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 4, 'How does Ephesians 6 relate earthly authority structures to the lordship of Christ?', '["Children, fathers, servants, and masters are all addressed under Christ\u0027s higher authority and impartial judgment","Earthly authority replaces Christ\u0027s rule","Paul ignores injustice and accountability entirely","Only masters answer to Christ, not servants"]'::jsonb, 'Children, fathers, servants, and masters are all addressed under Christ''s higher authority and impartial judgment', 'Paul grounds obedience and treatment of others in the Lord, reminding masters that they too have a Master in heaven and there is no partiality with him (Ephesians 6:1, 4-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 6 relate earthly authority structures to the lordship of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 4, 'Why does Paul insist that the struggle is not against flesh and blood?', '["He reframes opposition in spiritual terms so believers fight with God\u0027s resources rather than treating people as ultimate enemies","He denies that human sin causes harm","He says physical actions never matter","He means Christians should never resist temptation"]'::jsonb, 'He reframes opposition in spiritual terms so believers fight with God''s resources rather than treating people as ultimate enemies', 'Paul says the struggle is against spiritual powers, which is why believers need God''s armor rather than fleshly strategies (Ephesians 6:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul insist that the struggle is not against flesh and blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 4, 'How does Ephesians 6 connect truth and readiness in spiritual warfare?', '["Believers stand fast when grounded in truth and prepared by the gospel of peace","Readiness comes from aggression rather than peace","Truth is less important than zeal","The gospel matters only at conversion"]'::jsonb, 'Believers stand fast when grounded in truth and prepared by the gospel of peace', 'Paul describes the belt of truth and feet shod with the readiness of the gospel of peace as part of the armor for standing firm (Ephesians 6:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 6 connect truth and readiness in spiritual warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 4, 'What is the significance of ending Ephesians with peace, love, faith, and grace?', '["The letter closes by returning to the gospel gifts that sustain the church in obedience and battle","Paul ends with ideas unrelated to the rest of the letter","Only peace matters, not faith or grace","Grace is reserved for leaders at the end"]'::jsonb, 'The letter closes by returning to the gospel gifts that sustain the church in obedience and battle', 'Paul''s closing blessing of peace, love with faith, and grace gathers up the themes of divine gift, unity, and faithful perseverance found throughout the letter (Ephesians 6:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of ending Ephesians with peace, love, faith, and grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 5, 'Why is the armor of God more than a metaphor for personal toughness?', '["It describes a God-given participation in divine truth and salvation for standing within a cosmic spiritual conflict","It mainly teaches self-confidence and mental grit","It can be reduced to positive thinking","It applies only in moments of persecution"]'::jsonb, 'It describes a God-given participation in divine truth and salvation for standing within a cosmic spiritual conflict', 'The armor consists of realities God gives and is needed because the conflict is with spiritual powers, not merely personal feelings or circumstances (Ephesians 6:10-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the armor of God more than a metaphor for personal toughness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 5, 'How does Ephesians 6 keep spiritual warfare from becoming triumphalist?', '["The focus is on standing, praying, persevering, and depending on the Lord rather than on boasting in human power","Believers are promised an easy life without resistance","The chapter tells believers to conquer by domination","Prayer is omitted so that courage alone can rule"]'::jsonb, 'The focus is on standing, praying, persevering, and depending on the Lord rather than on boasting in human power', 'Paul repeatedly says to stand, be strong in the Lord, and pray at all times, framing warfare as dependence on God''s might rather than self-exaltation (Ephesians 6:10-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 6 keep spiritual warfare from becoming triumphalist?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 5, 'What does Ephesians 6 imply about gospel proclamation in hostile settings?', '["The gospel must still be spoken boldly even when its messenger is chained","Hostility means the church should speak only privately forever","Chains prove God\u0027s message has failed","Boldness is unnecessary once truth is known"]'::jsonb, 'The gospel must still be spoken boldly even when its messenger is chained', 'Paul asks for prayer that he may speak boldly as he ought to speak, even as an ambassador in chains (Ephesians 6:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Ephesians 6 imply about gospel proclamation in hostile settings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 5, 'How does Ephesians 6 gather together the letter''s larger themes?', '["It joins household obedience, cosmic conflict, prayer, and grace under the exalted lordship of Christ","It abandons the letter\u0027s earlier themes of unity and salvation","It focuses only on Roman social order","It ends by replacing grace with effort"]'::jsonb, 'It joins household obedience, cosmic conflict, prayer, and grace under the exalted lordship of Christ', 'The chapter applies the gospel to relationships, explains spiritual warfare under Christ''s strength, and closes with peace, love, faith, and grace (Ephesians 6:1-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 6 gather together the letter''s larger themes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 1, 'According to Ephesians 1, in love God predestined believers to what?', '["Adoption through Jesus Christ","Life under angels","Service in the temple courts","Earthly dominion over nations"]'::jsonb, 'Adoption through Jesus Christ', 'Paul says God predestined believers to adoption as children through Jesus Christ (Ephesians 1:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 1, in love God predestined believers to what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 1, 'According to Ephesians 1, where is Christ seated now?', '["At God\u0027s right hand in the heavenly places","At the temple altar in Jerusalem","Among the rulers of Rome","At the foot of Sinai"]'::jsonb, 'At God''s right hand in the heavenly places', 'God raised Christ and seated him at his right hand in the heavenly places (Ephesians 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 1, where is Christ seated now?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 2, 'What does Paul say believers first did before being sealed with the Spirit in Ephesians 1?', '["They heard the word of truth and believed","They completed the works of the law","They traveled to Jerusalem","They received visions from angels"]'::jsonb, 'They heard the word of truth and believed', 'Paul says they heard the word of truth, the gospel of salvation, and having also believed were sealed with the Spirit (Ephesians 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say believers first did before being sealed with the Spirit in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 2, 'What riches does Paul mention in Ephesians 1 that believers should know?', '["The riches of the glory of God\u0027s inheritance in the saints","The treasures of Solomon\u0027s temple","The wealth of the Roman empire","The abundance of earthly grain"]'::jsonb, 'The riches of the glory of God''s inheritance in the saints', 'Paul prays they may know the riches of the glory of God''s inheritance in the saints (Ephesians 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What riches does Paul mention in Ephesians 1 that believers should know?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 3, 'What does Ephesians 1 imply about forgiveness in relation to grace?', '["Forgiveness flows from the riches of God\u0027s grace in Christ","Forgiveness depends mainly on ritual effort","Grace follows forgiveness only after obedience","Forgiveness is reserved for a spiritual elite"]'::jsonb, 'Forgiveness flows from the riches of God''s grace in Christ', 'Paul connects redemption and forgiveness with the riches of God''s grace lavished on believers in Christ (Ephesians 1:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 1 imply about forgiveness in relation to grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 3, 'Why does Paul highlight God''s purpose and counsel in Ephesians 1?', '["To show salvation unfolds according to God\u0027s sovereign design rather than chance","To suggest history is controlled by earthly rulers","To deny the importance of Christ\u0027s resurrection","To make prayer unnecessary"]'::jsonb, 'To show salvation unfolds according to God''s sovereign design rather than chance', 'Paul says God works all things according to the counsel of his will and gives believers an inheritance according to that purpose (Ephesians 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul highlight God''s purpose and counsel in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 4, 'How does Ephesians 1 connect inheritance and praise?', '["Believers receive an inheritance so that their lives display the praise of God\u0027s glory","Inheritance is mainly for earthly comfort","Praise replaces the need for inheritance","Only apostles inherit God\u0027s promises"]'::jsonb, 'Believers receive an inheritance so that their lives display the praise of God''s glory', 'Paul says believers were made an inheritance so that they should be to the praise of his glory (Ephesians 1:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 1 connect inheritance and praise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 4, 'Why does Paul describe Christ as head over all things for the church in Ephesians 1?', '["Christ\u0027s universal reign serves the good and security of his people","The church exists apart from Christ\u0027s authority","Only heavenly beings benefit from Christ\u0027s rule","The church rules Christ by its prayers"]'::jsonb, 'Christ''s universal reign serves the good and security of his people', 'Paul says God gave Christ as head over all things to the church, linking his cosmic authority to his care for his body (Ephesians 1:22-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul describe Christ as head over all things for the church in Ephesians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 4, 'How does Ephesians 1 combine assurance and hope?', '["The Spirit\u0027s seal assures believers now while pointing them toward final redemption and inheritance","Hope is needed only when assurance is absent","Assurance comes from earthly success","Hope replaces faith in Christ"]'::jsonb, 'The Spirit''s seal assures believers now while pointing them toward final redemption and inheritance', 'The Spirit seals believers in the present and guarantees their inheritance until final redemption (Ephesians 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 1 combine assurance and hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 5, 'How does Ephesians 1 frame salvation as both personal and cosmic?', '["Individual redemption and forgiveness are part of God\u0027s larger purpose to unite all things in Christ","Personal salvation replaces God\u0027s concern for creation","Cosmic restoration happens without redemption from sin","Only heavenly beings matter in God\u0027s plan"]'::jsonb, 'Individual redemption and forgiveness are part of God''s larger purpose to unite all things in Christ', 'Paul moves from personal blessings like redemption and sealing to God''s plan to sum up all things in Christ (Ephesians 1:7-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 1 frame salvation as both personal and cosmic?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 5, 'Why is Christ''s exaltation in Ephesians 1 essential to the church''s identity?', '["The church exists as the body of the risen and reigning Christ who fills all things","The church can define itself apart from Christ\u0027s reign","Christ\u0027s exaltation matters only for future judgment","The church receives life mainly from tradition"]'::jsonb, 'The church exists as the body of the risen and reigning Christ who fills all things', 'Paul ties Christ''s exalted headship directly to the church as his body and fullness (Ephesians 1:20-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Christ''s exaltation in Ephesians 1 essential to the church''s identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 1, 5, 'What does Ephesians 1 imply about the believer''s security in salvation?', '["God\u0027s purpose, Christ\u0027s redemption, and the Spirit\u0027s seal together ground strong assurance","Security depends mainly on emotional consistency","Assurance comes only from visible miracles","Believers are left uncertain until the end with no present pledge"]'::jsonb, 'God''s purpose, Christ''s redemption, and the Spirit''s seal together ground strong assurance', 'The chapter joins God''s predestining purpose, redemption through Christ, and the Spirit''s sealing as a guarantee of inheritance (Ephesians 1:5, 7, 13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Ephesians 1 imply about the believer''s security in salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 1, 'According to Ephesians 2, where has God made believers sit with Christ?', '["In the heavenly places","At Mount Sinai","In the temple courts","In Caesar\u0027s house"]'::jsonb, 'In the heavenly places', 'Paul says God raised believers up with Christ and made them sit with him in the heavenly places (Ephesians 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 2, where has God made believers sit with Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 1, 'According to Ephesians 2, what has Christ broken down between Jews and Gentiles?', '["The middle wall of partition","The gates of Rome","The throne of David","The heavens themselves"]'::jsonb, 'The middle wall of partition', 'Paul says Christ broke down the middle wall of partition between the two groups (Ephesians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 2, what has Christ broken down between Jews and Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 2, 'What future display of grace does Ephesians 2 mention?', '["In the ages to come God will show the exceeding riches of his grace","In the next empire God will restore the temple kingdom","At once God will end all earthly labor","In secret only angels will see his kindness"]'::jsonb, 'In the ages to come God will show the exceeding riches of his grace', 'Paul says God raised believers with Christ so that in the ages to come he might show the exceeding riches of his grace in kindness toward us (Ephesians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What future display of grace does Ephesians 2 mention?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 2, 'What new thing did Christ create in himself according to Ephesians 2?', '["One new man from the two","A second temple in Rome","A new tribe of Levi","A covenant without peace"]'::jsonb, 'One new man from the two', 'Paul says Christ created in himself one new man from the two, making peace (Ephesians 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What new thing did Christ create in himself according to Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 3, 'What does Ephesians 2 imply about human boasting?', '["It is excluded because salvation is God\u0027s gift, not a human accomplishment","It is encouraged after moral reform","It is allowed if based on ancestry","It disappears only for Gentiles"]'::jsonb, 'It is excluded because salvation is God''s gift, not a human accomplishment', 'Paul says salvation is not of works so that no one may boast (Ephesians 2:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 2 imply about human boasting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 3, 'Why is access to the Father in one Spirit significant in Ephesians 2?', '["It shows both reconciled groups now share the same direct approach to God","It means only Gentiles may approach God now","It restores the old separation of courts","It makes the cross unnecessary"]'::jsonb, 'It shows both reconciled groups now share the same direct approach to God', 'Paul says through Christ both groups have access in one Spirit to the Father, showing shared reconciliation and worship (Ephesians 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is access to the Father in one Spirit significant in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 4, 'Why does Ephesians 2 move from salvation by grace to temple imagery?', '["The grace that saves individuals also creates a reconciled people where God now dwells","Temple language replaces Christ\u0027s work","Grace matters only until church life begins","The temple exists mainly as a political symbol"]'::jsonb, 'The grace that saves individuals also creates a reconciled people where God now dwells', 'Paul moves from grace and faith to one new humanity and finally to a holy temple and dwelling place of God in the Spirit (Ephesians 2:8-10, 14-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Ephesians 2 move from salvation by grace to temple imagery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 4, 'How does Ephesians 2 portray Christ as peace?', '["Peace is not abstract only; Christ himself embodies and accomplishes reconciliation","Peace is a human ideal independent of the cross","Peace applies only to personal feelings","Peace means the end of all difference whatsoever"]'::jsonb, 'Peace is not abstract only; Christ himself embodies and accomplishes reconciliation', 'Paul says Christ is our peace and then explains that he made both groups one and reconciled them through the cross (Ephesians 2:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 2 portray Christ as peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 4, 'Why is Christ called the cornerstone in Ephesians 2?', '["He is the decisive reference point that aligns and holds together God\u0027s entire new dwelling place","He replaces the need for apostles and prophets entirely","He represents only one ethnic part of the church","He is merely the first believer among many"]'::jsonb, 'He is the decisive reference point that aligns and holds together God''s entire new dwelling place', 'The household is built on apostles and prophets with Christ Jesus as the chief cornerstone, giving unity and stability to the whole building (Ephesians 2:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Christ called the cornerstone in Ephesians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 5, 'How does Ephesians 2 redefine the people of God?', '["God\u0027s people are a grace-made, Christ-reconciled, Spirit-indwelt household drawn from former outsiders and insiders alike","God\u0027s people are defined only by ethnic descent","God\u0027s people are now only a private spiritual concept with no communal form","God\u0027s people consist only of those under the old ordinances"]'::jsonb, 'God''s people are a grace-made, Christ-reconciled, Spirit-indwelt household drawn from former outsiders and insiders alike', 'Paul describes salvation by grace, the reconciliation of Jew and Gentile, and the building together of believers into God''s dwelling place (Ephesians 2:8-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 2 redefine the people of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 5, 'Why is the phrase ''one new man'' in Ephesians 2 theologically significant?', '["It points to a new corporate humanity in Christ that transcends former hostility","It refers only to a single future ruler","It means individual salvation replaces the church","It denies that the body of Christ has many members"]'::jsonb, 'It points to a new corporate humanity in Christ that transcends former hostility', 'Paul says Christ created one new man from the two, making peace and reconciling both in one body to God (Ephesians 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''one new man'' in Ephesians 2 theologically significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 2, 5, 'How does Ephesians 2 hold together the already and not yet of salvation?', '["Believers are already alive, seated with Christ, and built together, while still awaiting the full display of grace in the ages to come","Everything remains future with no present change","All salvation is complete in earthly terms only","The chapter rejects any future hope"]'::jsonb, 'Believers are already alive, seated with Christ, and built together, while still awaiting the full display of grace in the ages to come', 'Paul speaks of present resurrection life and access, while also pointing to the ages to come and the ongoing growth of God''s temple (Ephesians 2:6-7, 21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 2 hold together the already and not yet of salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 1, 'According to Ephesians 3, what was Paul made by God''s grace?', '["A servant of the gospel","A ruler over the churches","A high priest in Jerusalem","A master of the law"]'::jsonb, 'A servant of the gospel', 'Paul says he was made a servant of the gospel according to the gift of God''s grace (Ephesians 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 3, what was Paul made by God''s grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 1, 'According to Ephesians 3, what does Paul ask the believers not to do because of his sufferings?', '["Lose heart","Pray for him","Trust Christ","Walk in love"]'::jsonb, 'Lose heart', 'Paul asks them not to lose heart at his tribulations for them (Ephesians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 3, what does Paul ask the believers not to do because of his sufferings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 2, 'What does Paul say had not been made known to previous generations as it is now?', '["The mystery of Christ","The existence of Israel","The power of prayer","The goodness of creation"]'::jsonb, 'The mystery of Christ', 'Paul says the mystery of Christ was not made known to people in other generations as it has now been revealed (Ephesians 3:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say had not been made known to previous generations as it is now?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 2, 'From whom is every family in heaven and on earth named according to Ephesians 3?', '["The Father","Adam alone","The angels","The church"]'::jsonb, 'The Father', 'Paul bows before the Father, from whom every family in heaven and on earth is named (Ephesians 3:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'From whom is every family in heaven and on earth named according to Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 3, 'What does Ephesians 3 reveal about the scope of the gospel?', '["The gospel gathers Gentiles into the same promised inheritance in Christ","The gospel is limited to one ethnic household","The gospel concerns private ethics only","The gospel is mainly a political program"]'::jsonb, 'The gospel gathers Gentiles into the same promised inheritance in Christ', 'Paul defines the mystery as Gentiles becoming fellow heirs and fellow members of the same body in Christ through the gospel (Ephesians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 3 reveal about the scope of the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 3, 'Why does Paul describe himself as ''less than the least of all saints'' in Ephesians 3?', '["To magnify the grace that entrusted him with proclaiming Christ\u0027s riches","To deny that his ministry had any authority","To suggest humility is incompatible with apostleship","To apologize for preaching to Gentiles"]'::jsonb, 'To magnify the grace that entrusted him with proclaiming Christ''s riches', 'Paul says this grace was given to him, though he is less than the least of all saints, to preach Christ''s unsearchable riches (Ephesians 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul describe himself as ''less than the least of all saints'' in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 4, 'How does Ephesians 3 connect revelation and mission?', '["What God revealed as mystery Paul must now proclaim openly among the Gentiles","Revelation replaces the need for preaching","Mission exists without any revealed content","Only hidden teachings can be missionary"]'::jsonb, 'What God revealed as mystery Paul must now proclaim openly among the Gentiles', 'Paul says the mystery was made known to him by revelation, and that grace was given to preach Christ''s riches and make all see the mystery''s administration (Ephesians 3:3, 8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 3 connect revelation and mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 4, 'Why is bold access through faith central in Ephesians 3?', '["It shows that the mystery revealed in Christ ends distance from God for those who believe","It limits prayer to apostles and prophets","It restores temple barriers as holy protections","It means reverence is no longer needed"]'::jsonb, 'It shows that the mystery revealed in Christ ends distance from God for those who believe', 'Paul says in Christ believers have boldness and access with confidence through faith in him, matching the letter''s theme of nearness and reconciliation (Ephesians 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is bold access through faith central in Ephesians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 4, 'How does Ephesians 3 portray the church before the unseen powers?', '["The church is the means by which God displays his many-sided wisdom in the heavenly realm","The church learns wisdom mainly from hostile powers","The church has no cosmic significance","Only Israel\u0027s monarchy reveals God\u0027s wisdom"]'::jsonb, 'The church is the means by which God displays his many-sided wisdom in the heavenly realm', 'Paul says God''s manifold wisdom is now made known through the church to the rulers and authorities in the heavenly places (Ephesians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 3 portray the church before the unseen powers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 5, 'How does Ephesians 3 show that divine power and divine love belong together?', '["God\u0027s power strengthens believers so they can know and live within Christ\u0027s immeasurable love","Power matters, but love is merely symbolic","Love replaces the need for strength from God","Only future believers will know this connection"]'::jsonb, 'God''s power strengthens believers so they can know and live within Christ''s immeasurable love', 'Paul prays for strength through the Spirit, Christ dwelling by faith, and deeper knowledge of Christ''s love, linking power and love in one request (Ephesians 3:16-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 3 show that divine power and divine love belong together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 5, 'Why does Paul''s prayer in Ephesians 3 move toward fullness rather than mere information?', '["The goal of revelation is transformed participation in God\u0027s life, not bare awareness of facts","Paul thinks knowledge is unimportant in every sense","Facts about Christ are enough without inner change","Fullness comes from human discipline alone"]'::jsonb, 'The goal of revelation is transformed participation in God''s life, not bare awareness of facts', 'Paul prays beyond information about the mystery toward inner strengthening, Christ''s indwelling, knowledge of his love, and fullness of God (Ephesians 3:16-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul''s prayer in Ephesians 3 move toward fullness rather than mere information?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 3, 5, 'What does Ephesians 3 suggest about suffering in ministry?', '["Suffering can serve God\u0027s gracious mission without negating the dignity or fruitfulness of the gospel","Suffering proves a minister has left God\u0027s will","Ministry succeeds only when suffering is absent","Paul\u0027s chains cancel his apostolic office"]'::jsonb, 'Suffering can serve God''s gracious mission without negating the dignity or fruitfulness of the gospel', 'Paul''s imprisonment is presented as part of his ministry for the Gentiles, and he tells them not to lose heart because his suffering serves their glory (Ephesians 3:1, 13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Ephesians 3 suggest about suffering in ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 1, 'According to Ephesians 4, how many bodies does Paul mention?', '["One body","Two bodies","Seven bodies","Many unrelated bodies"]'::jsonb, 'One body', 'Paul says there is one body and one Spirit (Ephesians 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 4, how many bodies does Paul mention?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 1, 'According to Ephesians 4, what should no longer come out of a believer''s mouth?', '["Corrupt speech","Psalms and hymns","Words of prayer","Truth in love"]'::jsonb, 'Corrupt speech', 'Paul says no corrupt speech should proceed out of the believer''s mouth (Ephesians 4:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 4, what should no longer come out of a believer''s mouth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 2, 'What is the goal of the church''s growth according to Ephesians 4?', '["The measure of the stature of the fullness of Christ","The glory of earthly kings","Freedom from all correction","The wisdom of philosophers"]'::jsonb, 'The measure of the stature of the fullness of Christ', 'Paul says the body matures until it reaches the measure of the stature of the fullness of Christ (Ephesians 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the goal of the church''s growth according to Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 2, 'What should believers do with anger according to Ephesians 4?', '["Do not let the sun go down on it","Nurse it in silence","Use it to control others","Treat it as holiness"]'::jsonb, 'Do not let the sun go down on it', 'Paul says, ''Be angry, and don''t sin.'' He adds, ''Don''t let the sun go down on your wrath'' (Ephesians 4:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should believers do with anger according to Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 3, 'Why does Paul list seven ''ones'' in Ephesians 4?', '["To ground the church\u0027s unity in the shared realities of salvation rather than personal preference","To provide a mystical number without practical meaning","To teach that diversity of gifts is a problem","To replace love with uniformity"]'::jsonb, 'To ground the church''s unity in the shared realities of salvation rather than personal preference', 'Paul anchors unity in one body, one Spirit, one hope, one Lord, one faith, one baptism, and one God and Father of all (Ephesians 4:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul list seven ''ones'' in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 3, 'What does Ephesians 4 suggest about false teaching?', '["Immaturity leaves believers vulnerable, so truth-filled growth in Christ is necessary","False teaching matters only for leaders","Maturity comes by avoiding all teaching","Love alone protects without truth"]'::jsonb, 'Immaturity leaves believers vulnerable, so truth-filled growth in Christ is necessary', 'Paul warns against being tossed by every wind of doctrine and connects maturity with truth and growth into Christ (Ephesians 4:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 4 suggest about false teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 4, 'How does Ephesians 4 present Christ as both source and goal of the church''s growth?', '["Christ gives the gifts, supplies the life, and defines the maturity toward which the body grows","Christ gives gifts but withdraws from the church\u0027s growth","The church grows by human skill apart from Christ","Christ is the goal only for leaders, not the whole body"]'::jsonb, 'Christ gives the gifts, supplies the life, and defines the maturity toward which the body grows', 'Paul describes Christ giving gifts and the whole body growing up into him, from whom the body is fitted and supplied (Ephesians 4:11-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 4 present Christ as both source and goal of the church''s growth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 4, 'Why does Ephesians 4 connect forgiveness with God''s action in Christ?', '["Christian forgiveness is grounded in the grace believers themselves have received from God","Forgiveness is mainly a strategy for avoiding conflict","Only serious offenses require God\u0027s pattern","Believers forgive in order to earn mercy"]'::jsonb, 'Christian forgiveness is grounded in the grace believers themselves have received from God', 'Paul tells believers to forgive one another just as God also in Christ forgave them (Ephesians 4:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Ephesians 4 connect forgiveness with God''s action in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 4, 'What does Ephesians 4 imply about truthfulness in the body of Christ?', '["Truthfulness is essential because believers belong to one another as members of one body","Truth matters less than avoiding discomfort","Lying is acceptable if unity is preserved outwardly","Only teachers are responsible to speak truth"]'::jsonb, 'Truthfulness is essential because believers belong to one another as members of one body', 'Paul commands believers to put away falsehood and speak truth with their neighbors because they are members of one another (Ephesians 4:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Ephesians 4 imply about truthfulness in the body of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 5, 'How does Ephesians 4 show that Christian maturity is corporate rather than merely individual?', '["The whole body is equipped, protected, and built up in love as each part works properly under Christ","Maturity is achieved mainly in isolation from other believers","Only leaders need maturity for the church to thrive","Individual gifts make the body unnecessary"]'::jsonb, 'The whole body is equipped, protected, and built up in love as each part works properly under Christ', 'Paul describes the saints being equipped and the whole body growing and building itself up in love through the proper working of each part (Ephesians 4:12-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 4 show that Christian maturity is corporate rather than merely individual?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 5, 'Why is grieving the Holy Spirit so serious in Ephesians 4?', '["Sin contradicts the holy relationship marked by the Spirit\u0027s sealing and the hope of redemption","The Spirit can be grieved only by formal worship errors","The Spirit\u0027s seal has no ethical implications","Believers grieve the Spirit only when they doubt gifts"]'::jsonb, 'Sin contradicts the holy relationship marked by the Spirit''s sealing and the hope of redemption', 'Paul warns against grieving the Spirit precisely because believers have been sealed in him for the day of redemption (Ephesians 4:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is grieving the Holy Spirit so serious in Ephesians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 4, 5, 'What vision of humanity stands behind Ephesians 4''s command to put on the new self?', '["In Christ, humanity is being renewed toward God\u0027s image in truthful holiness and righteousness","Human nature is fixed and cannot be remade","Only external conduct matters to God","The new self is a legal fiction without real transformation"]'::jsonb, 'In Christ, humanity is being renewed toward God''s image in truthful holiness and righteousness', 'Paul says the new self is created according to God in righteousness and holiness of truth (Ephesians 4:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What vision of humanity stands behind Ephesians 4''s command to put on the new self?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 1, 'According to Ephesians 5, what should believers give instead of coarse joking?', '["Thanksgiving","Silence alone","Public rebuke only","Secret wisdom"]'::jsonb, 'Thanksgiving', 'Paul says coarse jesting is not fitting, but rather giving of thanks (Ephesians 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 5, what should believers give instead of coarse joking?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 1, 'According to Ephesians 5, what should believers try to learn?', '["What is pleasing to the Lord","What impresses the world","What secures wealth quickly","What avoids all suffering"]'::jsonb, 'What is pleasing to the Lord', 'Paul tells believers as children of light to prove what is well pleasing to the Lord (Ephesians 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 5, what should believers try to learn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 2, 'What fruit does Paul associate with the light in Ephesians 5?', '["Goodness, righteousness, and truth","Power, wealth, and honor","Mystery, silence, and fear","Ceremony, lineage, and rank"]'::jsonb, 'Goodness, righteousness, and truth', 'Paul says the fruit of the light consists in all goodness, righteousness, and truth (Ephesians 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What fruit does Paul associate with the light in Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 2, 'How should believers submit to one another according to Ephesians 5?', '["In the fear of Christ","In fear of human rulers only","Only when commanded by force","As a temporary compromise"]'::jsonb, 'In the fear of Christ', 'Paul says believers are to submit to one another in the fear of Christ (Ephesians 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should believers submit to one another according to Ephesians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 3, 'Why does Paul say to expose the works of darkness rather than participate in them?', '["Children of light are meant to reveal what belongs to God rather than share in what opposes him","Darkness disappears through silence alone","Exposure means public shaming in every case","Believers should know evil by practicing it first"]'::jsonb, 'Children of light are meant to reveal what belongs to God rather than share in what opposes him', 'Paul says to have no fellowship with unfruitful works of darkness, but rather even expose them, because believers are light in the Lord (Ephesians 5:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say to expose the works of darkness rather than participate in them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 3, 'What does Ephesians 5 imply about the church''s relation to Christ in marriage language?', '["The church lives under Christ\u0027s loving headship as the body he nourishes and cherishes","The church is independent of Christ\u0027s care","Marriage imagery reduces Christ\u0027s authority","Only future believers belong to Christ\u0027s body"]'::jsonb, 'The church lives under Christ''s loving headship as the body he nourishes and cherishes', 'Paul says Christ is head of the church, its Savior, and that he nourishes and cherishes it as his own body (Ephesians 5:23, 29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 5 imply about the church''s relation to Christ in marriage language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 4, 'How does Ephesians 5 portray holiness as visible and relational?', '["It appears in speech, gratitude, wisdom, worship, and Christ-shaped love within relationships","It is mainly a hidden inner state with no outward form","It concerns worship gatherings but not households","It means withdrawing from all ordinary life"]'::jsonb, 'It appears in speech, gratitude, wisdom, worship, and Christ-shaped love within relationships', 'Paul addresses speech, thanksgiving, wise conduct, Spirit-filled worship, and the relationship of wives and husbands under Christ (Ephesians 5:4, 15-21, 22-33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 5 portray holiness as visible and relational?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 4, 'Why does Paul connect Christ''s love for the church with cleansing by the washing of water with the word?', '["Christ\u0027s saving love is not only forgiving but also sanctifying and renewing his people","The church becomes holy without Christ\u0027s sacrifice","Cleansing happens through ceremonies alone","Marriage has no relation to holiness"]'::jsonb, 'Christ''s saving love is not only forgiving but also sanctifying and renewing his people', 'Paul says Christ gave himself for the church to sanctify her, having cleansed her by the washing of water with the word (Ephesians 5:25-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul connect Christ''s love for the church with cleansing by the washing of water with the word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 4, 'How does Ephesians 5 transform wisdom from an abstract ideal into a lived reality?', '["Wisdom is shown in redeemed time, discerned obedience, Spirit-filled worship, and holy relationships","Wisdom is merely the ability to solve public debates","Wisdom excludes joy and singing","Wisdom belongs only to husbands in the household"]'::jsonb, 'Wisdom is shown in redeemed time, discerned obedience, Spirit-filled worship, and holy relationships', 'Paul ties wisdom to careful walking, understanding the Lord''s will, Spirit-filled praise, thanksgiving, and ordered relationships under Christ (Ephesians 5:15-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 5 transform wisdom from an abstract ideal into a lived reality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 5, 'How does Ephesians 5 treat love as both sacrifice and sanctification?', '["Christ\u0027s love gives itself up and also purifies the beloved for glory","Love demands sacrifice but has no cleansing purpose","Sanctification replaces the need for love","Only human affection matters in marriage"]'::jsonb, 'Christ''s love gives itself up and also purifies the beloved for glory', 'Paul says Christ loved the church and gave himself up for her in order to sanctify and present her glorious (Ephesians 5:25-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 5 treat love as both sacrifice and sanctification?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 5, 'Why is imitation of God in Ephesians 5 inseparable from beloved-child identity?', '["Believers imitate the Father\u0027s character because they have already been received as his loved children","Imitation creates sonship by human effort","Only sinless people may imitate God","God\u0027s fatherhood is unrelated to holiness"]'::jsonb, 'Believers imitate the Father''s character because they have already been received as his loved children', 'Paul grounds imitation of God in the believers'' identity as beloved children and then points to Christ''s love as the pattern (Ephesians 5:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is imitation of God in Ephesians 5 inseparable from beloved-child identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 5, 5, 'What does Ephesians 5 imply about the church''s final destiny?', '["Christ intends to present the church radiant, holy, and without blemish before himself","The church\u0027s goal is merely earthly stability","The church remains permanently mixed with impurity","Final glory belongs only to individual believers, not the church"]'::jsonb, 'Christ intends to present the church radiant, holy, and without blemish before himself', 'Paul says Christ''s purpose is to present the church to himself glorious, without spot or wrinkle, but holy and without blemish (Ephesians 5:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Ephesians 5 imply about the church''s final destiny?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 1, 'According to Ephesians 6, what should fathers bring their children up in?', '["The discipline and instruction of the Lord","The customs of Rome","The anger of the household","The fear of earthly rulers"]'::jsonb, 'The discipline and instruction of the Lord', 'Paul says fathers should bring up their children in the discipline and instruction of the Lord (Ephesians 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 6, what should fathers bring their children up in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 1, 'According to Ephesians 6, what kind of shoes should believers have on their feet?', '["The readiness of the gospel of peace","The sandals of the priests","The shoes of military conquest","The footwear of Caesar\u0027s court"]'::jsonb, 'The readiness of the gospel of peace', 'Paul tells believers to have their feet shod with the readiness of the gospel of peace (Ephesians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Ephesians 6, what kind of shoes should believers have on their feet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 2, 'What attitude should masters avoid according to Ephesians 6?', '["Threatening","Fairness","Goodwill","Remembering heaven"]'::jsonb, 'Threatening', 'Paul tells masters to do the same things to their servants and to give up threatening (Ephesians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What attitude should masters avoid according to Ephesians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 2, 'What piece of armor does Paul connect with righteousness?', '["The breastplate","The helmet","The belt","The shield"]'::jsonb, 'The breastplate', 'Paul says to put on the breastplate of righteousness (Ephesians 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What piece of armor does Paul connect with righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 3, 'What does Ephesians 6 imply about Christian obedience in social roles?', '["Every role is relativized and dignified by service rendered ultimately to the Lord Christ","Earthly roles are spiritually meaningless","Masters alone serve Christ in their station","Only public ministry can honor Christ"]'::jsonb, 'Every role is relativized and dignified by service rendered ultimately to the Lord Christ', 'Paul repeatedly frames obedience and good will in relation to Christ, reminding all parties of the Lord in heaven who judges without partiality (Ephesians 6:5-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Ephesians 6 imply about Christian obedience in social roles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 3, 'Why is the gospel called a gospel of peace in the armor imagery?', '["Believers stand firm with readiness rooted in the reconciling peace God has established in Christ","Peace means the conflict with evil is imaginary","The gospel removes the need for courage","Peace refers only to personal quietness"]'::jsonb, 'Believers stand firm with readiness rooted in the reconciling peace God has established in Christ', 'Paul speaks of readiness from the gospel of peace as part of the armor for standing, tying conflict and reconciliation together under Christ (Ephesians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the gospel called a gospel of peace in the armor imagery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 4, 'How does Ephesians 6 connect prayer to perseverance for the whole church?', '["Prayer is constant watchfulness in the Spirit on behalf of all the saints, not merely private devotion","Prayer concerns only personal comfort during hardship","Perseverance makes prayer unnecessary","Only imprisoned apostles are told to pray"]'::jsonb, 'Prayer is constant watchfulness in the Spirit on behalf of all the saints, not merely private devotion', 'Paul commands prayer at all times in the Spirit with perseverance and supplication for all the saints (Ephesians 6:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 6 connect prayer to perseverance for the whole church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 4, 'Why does Ephesians 6 present standing as the repeated goal of the armor?', '["The church\u0027s calling is steadfast resistance in God\u0027s strength rather than confidence in self-made victory","Believers are called mainly to retreat from the world","Standing means spiritual passivity without action","The armor is for earthly conquest of nations"]'::jsonb, 'The church''s calling is steadfast resistance in God''s strength rather than confidence in self-made victory', 'Paul repeatedly says to stand against the schemes of the devil and, having done all, to stand, emphasizing steadfast dependence on God''s armor (Ephesians 6:11, 13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Ephesians 6 present standing as the repeated goal of the armor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 4, 'How does Ephesians 6 show that gospel ministry and spiritual warfare are linked?', '["The same armor and prayerful dependence needed to resist evil also sustain bold proclamation of the gospel","Preaching belongs outside the conflict with evil","Warfare ends once the gospel is spoken once","Only private holiness matters, not witness"]'::jsonb, 'The same armor and prayerful dependence needed to resist evil also sustain bold proclamation of the gospel', 'Paul moves from armor and prayer directly into requesting prayer for bold gospel speech as an ambassador in chains (Ephesians 6:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Ephesians 6 show that gospel ministry and spiritual warfare are linked?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 5, 'How does Ephesians 6 present the Christian life as both conflict and communion?', '["Believers stand in battle against spiritual evil while remaining sustained by prayer, peace, love, faith, and grace from God","Conflict replaces all fellowship among believers","Communion with God ends the need for resistance","Only leaders experience the tension of battle and blessing"]'::jsonb, 'Believers stand in battle against spiritual evil while remaining sustained by prayer, peace, love, faith, and grace from God', 'The chapter combines armor and warfare imagery with prayer for all saints and a closing blessing of peace, love, faith, and grace (Ephesians 6:10-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Ephesians 6 present the Christian life as both conflict and communion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 5, 'Why is the phrase ''there is no partiality with him'' important in Ephesians 6?', '["Christ\u0027s lordship judges all human status, placing masters and servants alike under the same divine authority","God overlooks injustice if social order remains stable","Partiality exists only in spiritual warfare, not in households","Only servants answer to heaven for their conduct"]'::jsonb, 'Christ''s lordship judges all human status, placing masters and servants alike under the same divine authority', 'Paul reminds masters that they and their servants share the same Master in heaven and that there is no partiality with him (Ephesians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''there is no partiality with him'' important in Ephesians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 49, 6, 5, 'What deeper point is made by combining salvation, faith, truth, righteousness, peace, and God''s word as armor?', '["The believer stands in battle clothed in the gospel realities God has given rather than in self-made strength","Christian warfare depends mainly on imagination and emotion","Only one doctrine is needed and the rest are optional","The armor is symbolic and has no relation to real Christian life"]'::jsonb, 'The believer stands in battle clothed in the gospel realities God has given rather than in self-made strength', 'Each piece of armor is tied to a saving reality from God, showing that steadfastness comes from God''s provision in Christ rather than human power (Ephesians 6:13-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 49
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper point is made by combining salvation, faith, truth, righteousness, peace, and God''s word as armor?'
);

