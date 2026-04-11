-- ============================================================================
-- LOGOS LIGHT - 1 Peter (book 60) quiz questions from quiz-questions/1peter.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 1, 'According to 1 Peter 1, by whose foreknowledge are the elect chosen?', '["God the Father","Moses","The prophets","The elders"]'::jsonb, 'God the Father', 'Peter addresses the elect as chosen according to the foreknowledge of God the Father (1 Peter 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 1, by whose foreknowledge are the elect chosen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 1, 'According to 1 Peter 1, into what are believers born again?', '["A living hope","An earthly kingdom","A life without trials","A new priesthood"]'::jsonb, 'A living hope', 'God begot believers again to a living hope through Jesus Christ''s resurrection (1 Peter 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 1, into what are believers born again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 1, 'According to 1 Peter 1, what is kept in heaven for believers?', '["An inheritance","A temple","A throne on earth","A crown of silver"]'::jsonb, 'An inheritance', 'Peter says believers have an incorruptible inheritance reserved in heaven (1 Peter 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 1, what is kept in heaven for believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 1, 'According to 1 Peter 1, what is faith tested by fire compared to?', '["Gold","Silver","Incense","Stone"]'::jsonb, 'Gold', 'Peter compares tested faith to gold refined by fire, though faith is more precious (1 Peter 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 1, what is faith tested by fire compared to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 1, 'According to 1 Peter 1, what are believers told to be in all their conduct?', '["Holy","Silent","Prosperous","Fearless"]'::jsonb, 'Holy', 'Because God is holy, believers are to be holy in all their conduct (1 Peter 1:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 1, what are believers told to be in all their conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 1, 'According to 1 Peter 1, with what were believers not redeemed?', '["Silver or gold","Faith and hope","Mercy and grace","Water and bread"]'::jsonb, 'Silver or gold', 'Peter says they were not redeemed with corruptible things like silver or gold (1 Peter 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 1, with what were believers not redeemed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 1, 'According to 1 Peter 1, what remains forever?', '["The word of the Lord","Human glory","The grass","Earthly treasure"]'::jsonb, 'The word of the Lord', 'Peter quotes Isaiah that the word of the Lord remains forever (1 Peter 1:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 1, what remains forever?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 2, 'According to 1 Peter 1, how are believers guarded for salvation?', '["By God''s power through faith","By military strength","By strict rituals","By political peace"]'::jsonb, 'By God''s power through faith', 'Believers are guarded by God''s power through faith for salvation ready to be revealed (1 Peter 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 1, how are believers guarded for salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 2, 'According to 1 Peter 1, for how long might believers be grieved by various trials?', '["For a little while","For exactly seven years","For a single day","For their entire earthly life without relief"]'::jsonb, 'For a little while', 'Peter says that for a little while, if needed, they have been grieved by various trials (1 Peter 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 1, for how long might believers be grieved by various trials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 2, 'According to 1 Peter 1, what do believers receive as the outcome of their faith?', '["The salvation of your souls","Immediate wealth","Freedom from death now","Political authority"]'::jsonb, 'The salvation of your souls', 'Peter says they receive the result of faith, the salvation of their souls (1 Peter 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 1, what do believers receive as the outcome of their faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 2, 'According to 1 Peter 1, what did the prophets search out carefully?', '["The grace to come to believers","The borders of Israel","The names of the apostles","The timing of the exile only"]'::jsonb, 'The grace to come to believers', 'The prophets inquired carefully about the grace that would come and the sufferings of Christ and glories after them (1 Peter 1:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 1, what did the prophets search out carefully?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 2, 'According to 1 Peter 1, what should believers set fully on the grace to be brought to them?', '["Their hope","Their anger","Their money","Their sorrow"]'::jsonb, 'Their hope', 'Peter tells them to set their hope fully on the grace to be brought at Jesus Christ''s revelation (1 Peter 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 1, what should believers set fully on the grace to be brought to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 2, 'According to 1 Peter 1, how should believers love one another?', '["Fervently from the heart","Only in public gatherings","When convenient","As repayment"]'::jsonb, 'Fervently from the heart', 'Having purified their souls, believers are to love one another fervently from the heart (1 Peter 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 1, how should believers love one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 2, 'According to 1 Peter 1, through what were believers born again?', '["The living and abiding word of God","The traditions of the elders","Temple sacrifices","Roman law"]'::jsonb, 'The living and abiding word of God', 'Peter says believers were born again through the living and abiding word of God (1 Peter 1:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 1, through what were believers born again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 3, 'In 1 Peter 1, why does Peter connect trials with the testing of faith?', '["To show tested faith results in praise, glory, and honor","To prove God abandons his people","To teach that suffering is meaningless","To say hardship automatically saves everyone"]'::jsonb, 'To show tested faith results in praise, glory, and honor', 'Trials test faith so it may be found to result in praise, glory, and honor at Jesus Christ''s revelation (1 Peter 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 1, why does Peter connect trials with the testing of faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 3, 'In 1 Peter 1, why is the inheritance described as incorruptible, undefiled, and unfading?', '["To contrast heavenly hope with perishable earthly things","To suggest believers earn it by endurance","To describe the temple furnishings","To explain Israel''s land allotments"]'::jsonb, 'To contrast heavenly hope with perishable earthly things', 'Peter emphasizes that the believer''s inheritance is secure and unlike earthly possessions that decay (1 Peter 1:4, 18, 24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 1, why is the inheritance described as incorruptible, undefiled, and unfading?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 3, 'In 1 Peter 1, what does calling Christians to be holy as God is holy imply?', '["Their conduct should reflect God''s character","They must withdraw from all society","They can become sinless by effort alone","Only leaders are called to holiness"]'::jsonb, 'Their conduct should reflect God''s character', 'Peter applies the holiness of God to the believer''s whole manner of life (1 Peter 1:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 1, what does calling Christians to be holy as God is holy imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 3, 'In 1 Peter 1, what is the force of calling Christ a lamb without blemish and without spot?', '["It presents his sacrifice as pure and acceptable","It means Jesus was literally a temple animal","It denies his humanity","It limits redemption to priests"]'::jsonb, 'It presents his sacrifice as pure and acceptable', 'Peter uses sacrificial language to show Christ''s blood as the flawless means of redemption (1 Peter 1:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 1, what is the force of calling Christ a lamb without blemish and without spot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 3, 'In 1 Peter 1, why does Peter stress that believers love Christ though they have not seen him?', '["To highlight genuine faith without physical sight","To discourage eyewitness testimony","To deny the resurrection appearances","To say sight is sinful"]'::jsonb, 'To highlight genuine faith without physical sight', 'Peter praises believers who love and trust Christ without seeing him, showing the reality of their faith (1 Peter 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 1, why does Peter stress that believers love Christ though they have not seen him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 3, 'In 1 Peter 1, why are believers told not to be conformed to former lusts?', '["Because their new identity calls for a different way of life","Because desire itself is always evil","Because Gentiles cannot be saved otherwise","Because only outward reform matters"]'::jsonb, 'Because their new identity calls for a different way of life', 'As obedient children, they are no longer to live as they did in former ignorance (1 Peter 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 1, why are believers told not to be conformed to former lusts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 3, 'In 1 Peter 1, what does the contrast between fading grass and enduring word emphasize?', '["Human life is temporary, but God''s message endures","Nature is evil while speech is holy","Only prophets can understand Scripture","Earthly bodies will never die"]'::jsonb, 'Human life is temporary, but God''s message endures', 'Peter contrasts human frailty with the permanence of God''s word (1 Peter 1:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 1, what does the contrast between fading grass and enduring word emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 4, 'How does 1 Peter 1 connect the believer''s future inheritance with present suffering?', '["Present trials refine faith while future salvation remains secure","Suffering cancels the inheritance unless avoided","The inheritance is only symbolic and not future","Trials replace the need for faith"]'::jsonb, 'Present trials refine faith while future salvation remains secure', 'Peter places grief in trials alongside a kept inheritance and salvation ready to be revealed (1 Peter 1:4-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 1 connect the believer''s future inheritance with present suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 4, 'How does 1 Peter 1 present the work of the Trinity in salvation?', '["Chosen by the Father, sanctified by the Spirit, cleansed for Jesus Christ","Created by the Son, judged by the Father, ignored by the Spirit","Saved only by the Father without the Son or Spirit","Protected by angels rather than God"]'::jsonb, 'Chosen by the Father, sanctified by the Spirit, cleansed for Jesus Christ', 'Peter speaks of the Father''s foreknowledge, the Spirit''s sanctifying work, and sprinkling by Jesus Christ''s blood (1 Peter 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 1 present the work of the Trinity in salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 4, 'How does 1 Peter 1 use redemption language to reshape ordinary Christian conduct?', '["Because believers were bought at great cost, they should live reverently","Because redemption makes obedience optional","Because only public worship matters after redemption","Because holiness applies only to Jewish believers"]'::jsonb, 'Because believers were bought at great cost, they should live reverently', 'Peter grounds holy fear in the fact that believers were redeemed by Christ''s precious blood (1 Peter 1:17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 1 use redemption language to reshape ordinary Christian conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 4, 'How does 1 Peter 1 use the prophets to frame the gospel message received by believers?', '["The prophets anticipated Christ''s sufferings and later glories now announced in the gospel","The prophets replaced the need for apostolic preaching","The prophets fully understood every detail at the time","The prophets spoke only about political restoration"]'::jsonb, 'The prophets anticipated Christ''s sufferings and later glories now announced in the gospel', 'Peter says the prophets searched into these things, which are now announced by those who preached the gospel (1 Peter 1:10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 1 use the prophets to frame the gospel message received by believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 4, 'How does 1 Peter 1 unite hope, holiness, and love?', '["Future hope in Christ leads to holy living and sincere love","Love replaces holiness and hope","Holiness matters, but love does not","Hope is only about escaping present duties"]'::jsonb, 'Future hope in Christ leads to holy living and sincere love', 'Peter moves from setting hope on future grace to holy conduct and then fervent love for one another (1 Peter 1:13-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 1 unite hope, holiness, and love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 4, 'Why does 1 Peter 1 say angels desire to look into the announced gospel realities?', '["To underline the greatness of the salvation now revealed","To show angels do not know God","To say angels preach instead of humans","To minimize the prophets'' role"]'::jsonb, 'To underline the greatness of the salvation now revealed', 'Peter heightens the wonder of salvation by saying even angels long to look into these things (1 Peter 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 1 say angels desire to look into the announced gospel realities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 4, 'Why does 1 Peter 1 move from new birth to enduring word at the chapter''s end?', '["To show the new life of believers rests on God''s lasting message","To argue that preaching has replaced Christ","To make baptism the only focus","To deny the role of resurrection in salvation"]'::jsonb, 'To show the new life of believers rests on God''s lasting message', 'Believers are born again through the living word, which stands forever unlike human glory (1 Peter 1:23-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 1 move from new birth to enduring word at the chapter''s end?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 5, 'In 1 Peter 1, what is the significance of saying Christ was foreknown before the foundation of the world but revealed in these last times?', '["Redemption in Christ was part of God''s eternal plan and disclosed in history","Jesus only began to exist at his revelation","Peter means prophecy replaced Christ''s work","The cross was a response to Rome rather than God''s purpose"]'::jsonb, 'Redemption in Christ was part of God''s eternal plan and disclosed in history', 'Peter says Christ was foreknown before the world''s foundation and manifested in these last times for believers (1 Peter 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 1, what is the significance of saying Christ was foreknown before the foundation of the world but revealed in these last times?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 5, 'In 1 Peter 1, why is the command to conduct yourselves in fear not a contradiction of Christian hope?', '["It calls for reverent living before the impartial Judge while trusting his saving grace","It means believers should doubt their redemption","It replaces love with terror as the chief virtue","It applies only before conversion"]'::jsonb, 'It calls for reverent living before the impartial Judge while trusting his saving grace', 'Peter combines hope in grace with reverent conduct because the Father judges impartially and believers were redeemed at great cost (1 Peter 1:13, 17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 1, why is the command to conduct yourselves in fear not a contradiction of Christian hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 5, 'In 1 Peter 1, why does Peter pair Christ''s sufferings with the glories that would follow?', '["To present suffering as the pathway that leads to vindication","To deny that Christ really suffered","To teach that glory comes before obedience","To limit glory to Israel''s monarchy"]'::jsonb, 'To present suffering as the pathway that leads to vindication', 'The prophets testified beforehand to Christ''s sufferings and the glories after them, a pattern that shapes Christian hope (1 Peter 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 1, why does Peter pair Christ''s sufferings with the glories that would follow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 5, 'In 1 Peter 1, what theological point is made by redeeming people from futile inherited ways rather than merely forgiving isolated acts?', '["The gospel liberates believers from an empty inherited manner of life","Sin is only social custom and never personal guilt","Tradition is always evil in itself","Redemption is mainly economic"]'::jsonb, 'The gospel liberates believers from an empty inherited manner of life', 'Peter says believers were redeemed from the futile way of life handed down from their fathers by Christ''s blood (1 Peter 1:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 1, what theological point is made by redeeming people from futile inherited ways rather than merely forgiving isolated acts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 5, 'What is the significance in 1 Peter 1 of grounding Christian identity in both resurrection hope and imperishable word?', '["The believer''s life is secured by both Christ''s risen work and God''s enduring promise","Peter is describing two unrelated paths to salvation","Only Scripture matters, not resurrection","Only resurrection matters, not the preached gospel"]'::jsonb, 'The believer''s life is secured by both Christ''s risen work and God''s enduring promise', 'Peter roots new birth in Jesus Christ''s resurrection and also in the abiding word that announces the gospel (1 Peter 1:3, 23-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance in 1 Peter 1 of grounding Christian identity in both resurrection hope and imperishable word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 5, 'Why does 1 Peter 1 place unseen faith, prophetic anticipation, apostolic preaching, and angelic interest in one chapter?', '["To show the gospel stands at the center of a vast revelatory drama","To argue only angels truly understand salvation","To say prophecy is obsolete and mistaken","To separate the church from Israel''s Scriptures"]'::jsonb, 'To show the gospel stands at the center of a vast revelatory drama', 'Peter joins prophets, preachers, believers, and angels around the same salvation now revealed in Christ (1 Peter 1:8-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 Peter 1 place unseen faith, prophetic anticipation, apostolic preaching, and angelic interest in one chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 1, 5, 'Why does the holiness call in 1 Peter 1 matter for a scattered audience living among the nations?', '["Their distinctive conduct bears witness to the God who called them","Holiness keeps them politically dominant","Holiness exempts them from suffering","Only private belief matters for exiles"]'::jsonb, 'Their distinctive conduct bears witness to the God who called them', 'Peter addresses dispersed believers and urges conduct shaped by the holy God who has redeemed them (1 Peter 1:1, 15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does the holiness call in 1 Peter 1 matter for a scattered audience living among the nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 1, 'According to 1 Peter 2, what should believers long for like newborn babies?', '["Pure spiritual milk","Earthly honor","Temple sacrifices","Political peace"]'::jsonb, 'Pure spiritual milk', 'Peter tells believers to long for the pure spiritual milk so they may grow (1 Peter 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 2, what should believers long for like newborn babies?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 1, 'According to 1 Peter 2, who is the living stone rejected by men but chosen by God?', '["Jesus Christ","Peter","Moses","David"]'::jsonb, 'Jesus Christ', 'Peter describes Christ as the living stone rejected by men but chosen and precious to God (1 Peter 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 2, who is the living stone rejected by men but chosen by God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 1, 'According to 1 Peter 2, believers are being built into what kind of house?', '["A spiritual house","A royal palace","A school","A fortress"]'::jsonb, 'A spiritual house', 'Believers are being built up as a spiritual house to be a holy priesthood (1 Peter 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 2, believers are being built into what kind of house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 1, 'According to 1 Peter 2, what kind of priesthood are believers called?', '["A royal priesthood","A Levitical priesthood","A hidden priesthood","A temporary priesthood"]'::jsonb, 'A royal priesthood', 'Peter calls believers a chosen race and a royal priesthood (1 Peter 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 2, what kind of priesthood are believers called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 1, 'According to 1 Peter 2, believers should abstain from what?', '["Fleshly lusts","Daily work","Public worship","Hospitality"]'::jsonb, 'Fleshly lusts', 'Peter urges the beloved to abstain from fleshly lusts that war against the soul (1 Peter 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 2, believers should abstain from what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 1, 'According to 1 Peter 2, believers should submit to every ordinance of man for whose sake?', '["The Lord''s","Caesar''s","Their own","The priests''"]'::jsonb, 'The Lord''s', 'Peter says to submit to every human institution for the Lord''s sake (1 Peter 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 2, believers should submit to every ordinance of man for whose sake?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 1, 'According to 1 Peter 2, who bore our sins in his body on the tree?', '["Christ","Paul","The high priest","An angel"]'::jsonb, 'Christ', 'Peter says Christ himself bore our sins in his body on the tree (1 Peter 2:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 2, who bore our sins in his body on the tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 2, 'According to 1 Peter 2, what have believers tasted?', '["That the Lord is gracious","The bitterness of death","The power of Rome","The fire of judgment"]'::jsonb, 'That the Lord is gracious', 'Peter writes, if indeed you have tasted that the Lord is gracious (1 Peter 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 2, what have believers tasted?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 2, 'According to 1 Peter 2, what are believers to offer as a holy priesthood?', '["Spiritual sacrifices acceptable to God","Animal offerings in Jerusalem","Military service","Public arguments"]'::jsonb, 'Spiritual sacrifices acceptable to God', 'As a holy priesthood, believers offer spiritual sacrifices acceptable to God through Jesus Christ (1 Peter 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 2, what are believers to offer as a holy priesthood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 2, 'According to 1 Peter 2, what should believers proclaim?', '["The excellencies of him who called them","The power of the empire","Their own moral achievements","The wisdom of philosophers"]'::jsonb, 'The excellencies of him who called them', 'Believers are chosen so they may proclaim the excellencies of the one who called them out of darkness (1 Peter 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 2, what should believers proclaim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 2, 'According to 1 Peter 2, what may happen when Gentiles observe believers'' good works?', '["They may glorify God in the day of visitation","They will always persecute them more","They will make them rulers","They will stop speaking altogether"]'::jsonb, 'They may glorify God in the day of visitation', 'Peter says good conduct among the Gentiles can lead them to glorify God in the day of visitation (1 Peter 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 2, what may happen when Gentiles observe believers'' good works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 2, 'According to 1 Peter 2, what is God''s will regarding foolish accusations?', '["That doing good should silence ignorant people","That believers answer insult with insult","That the church seek revenge","That Christians withdraw from society entirely"]'::jsonb, 'That doing good should silence ignorant people', 'Peter says it is God''s will that by doing good believers silence the ignorance of foolish people (1 Peter 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 2, what is God''s will regarding foolish accusations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 2, 'According to 1 Peter 2, what four short commands are given in verse 17?', '["Honor all men, love the brotherhood, fear God, honor the king","Judge all men, defend your rights, fear Caesar, honor the temple","Love your friends, avoid rulers, fear nothing, honor yourself","Honor elders, despise outsiders, fear punishment, honor wealth"]'::jsonb, 'Honor all men, love the brotherhood, fear God, honor the king', 'Peter gives four concise commands in 1 Peter 2:17.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 2, what four short commands are given in verse 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 2, 'According to 1 Peter 2, what did Christ not do when he was reviled?', '["He did not revile in return","He did not speak at all","He did not pray","He did not suffer"]'::jsonb, 'He did not revile in return', 'When Christ was reviled, he did not revile in return but entrusted himself to God (1 Peter 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 2, what did Christ not do when he was reviled?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 3, 'In 1 Peter 2, why does Peter move from milk imagery to temple imagery?', '["To show believers both grow in Christ and are built together in him","To replace spiritual growth with ritual law","To focus only on clergy rather than all believers","To show the temple in Jerusalem still defines access to God"]'::jsonb, 'To show believers both grow in Christ and are built together in him', 'Peter describes believers as nourished for growth and then as living stones joined into a spiritual house (1 Peter 2:2-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 2, why does Peter move from milk imagery to temple imagery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 3, 'In 1 Peter 2, what is the point of calling believers once not a people but now God''s people?', '["Their identity now comes from God''s mercy and calling","Their ethnic background has been erased","They no longer belong to any earthly community","Only Jewish believers count as God''s people"]'::jsonb, 'Their identity now comes from God''s mercy and calling', 'Peter emphasizes that God''s mercy has made them his people, echoing covenant language (1 Peter 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 2, what is the point of calling believers once not a people but now God''s people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 3, 'In 1 Peter 2, why should honorable conduct matter among nonbelievers?', '["Because visible good works can expose false charges and point others to God","Because reputation is more important than truth","Because Christians must avoid all criticism","Because salvation comes through civic respectability"]'::jsonb, 'Because visible good works can expose false charges and point others to God', 'Peter links good conduct among the Gentiles to silencing slander and leading observers to glorify God (1 Peter 2:12, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 2, why should honorable conduct matter among nonbelievers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 3, 'In 1 Peter 2, why is submission to human authorities not described as absolute allegiance?', '["Believers submit for the Lord''s sake while remaining servants of God","Earthly rulers are identical to God","Christians must obey every order no matter what","Submission means abandoning freedom in Christ"]'::jsonb, 'Believers submit for the Lord''s sake while remaining servants of God', 'Peter says they live as free people, yet as God''s servants, submitting for the Lord''s sake (1 Peter 2:13, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 2, why is submission to human authorities not described as absolute allegiance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 3, 'In 1 Peter 2, what makes patient suffering for doing good commendable before God?', '["It reflects Christ''s own pattern and trusts God''s judgment","It earns automatic social freedom","It proves suffering is pleasant","It removes the need for faith"]'::jsonb, 'It reflects Christ''s own pattern and trusts God''s judgment', 'Peter says enduring sorrow while suffering unjustly finds favor with God and follows Christ''s example (1 Peter 2:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 2, what makes patient suffering for doing good commendable before God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 3, 'In 1 Peter 2, what does Christ''s bearing sins on the tree aim to produce in believers?', '["Dying to sins and living to righteousness","Freedom from all earthly pain now","Political triumph over enemies","A return to old desires"]'::jsonb, 'Dying to sins and living to righteousness', 'Peter says Christ bore sins so that we might die to sins and live to righteousness (1 Peter 2:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 2, what does Christ''s bearing sins on the tree aim to produce in believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 3, 'In 1 Peter 2, what is implied by calling Jesus the Shepherd and Overseer of souls?', '["Christ personally guards and guides his people","The church no longer needs holiness","Only elders can belong to him","Believers guide themselves without correction"]'::jsonb, 'Christ personally guards and guides his people', 'Peter says believers have returned to the Shepherd and Overseer of their souls (1 Peter 2:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 2, what is implied by calling Jesus the Shepherd and Overseer of souls?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 4, 'How does 1 Peter 2 tie Christian identity to Christian mission?', '["Being chosen by God leads to proclaiming his excellencies in the world","Identity in Christ removes the need for witness","Mission belongs only to apostles, not the church","Priestly identity is strictly private"]'::jsonb, 'Being chosen by God leads to proclaiming his excellencies in the world', 'Peter names believers as a chosen race and royal priesthood so that they may proclaim God''s excellencies (1 Peter 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 2 tie Christian identity to Christian mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 4, 'How does 1 Peter 2 use Old Testament stone texts to explain responses to Christ?', '["The same cornerstone is precious to believers but a stumbling stone to the disobedient","The stone images only describe the temple building materials","All people respond to Christ identically","The stone texts refer only to David''s kingdom"]'::jsonb, 'The same cornerstone is precious to believers but a stumbling stone to the disobedient', 'Peter combines cornerstone and stumbling-stone texts to show differing responses to Christ (1 Peter 2:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 2 use Old Testament stone texts to explain responses to Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 4, 'How does 1 Peter 2 balance freedom and submission?', '["Christians are free, yet they use freedom as God''s servants rather than as a cover for evil","Freedom means rejecting every civil authority","Submission means losing all moral agency","The two ideas are left unresolved"]'::jsonb, 'Christians are free, yet they use freedom as God''s servants rather than as a cover for evil', 'Peter commands believers to live as free people, but not to use freedom as a cloak for wickedness (1 Peter 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 2 balance freedom and submission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 4, 'How does 1 Peter 2 present Christ''s suffering as both example and atonement?', '["He leaves an example for endurance and also bears sins to heal his people","He only models patience without saving effect","He only atones with no ethical implications","His suffering mainly teaches political resistance"]'::jsonb, 'He leaves an example for endurance and also bears sins to heal his people', 'Peter says Christ suffered leaving an example and also bore our sins, bringing healing and righteousness (1 Peter 2:21-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 2 present Christ''s suffering as both example and atonement?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 4, 'How does 1 Peter 2 treat exile life among the nations?', '["Believers live as sojourners whose distinct conduct serves as witness","Exile means refusing all public responsibility","Exile removes the call to holiness","Sojourners should hide their faith completely"]'::jsonb, 'Believers live as sojourners whose distinct conduct serves as witness', 'Peter addresses them as sojourners and urges good conduct among the Gentiles (1 Peter 2:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 2 treat exile life among the nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 4, 'Why does 1 Peter 2 move from public witness to household suffering?', '["To show Christlike discipleship applies in both civic and personal settings","To narrow obedience to slaves only","To shift away from the gospel to social custom","To claim injustice is good in itself"]'::jsonb, 'To show Christlike discipleship applies in both civic and personal settings', 'Peter applies the witness of good conduct broadly, then shows it within unjust household relationships by Christ''s example (1 Peter 2:12-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 2 move from public witness to household suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 4, 'Why does 1 Peter 2 describe the church with titles like chosen race and holy nation?', '["To portray the church as God''s covenant people gathered around Christ","To replace moral obedience with status language","To grant national sovereignty to every congregation","To limit salvation to one ethnicity"]'::jsonb, 'To portray the church as God''s covenant people gathered around Christ', 'Peter applies covenant titles to believers to show their identity as God''s people in Christ (1 Peter 2:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 2 describe the church with titles like chosen race and holy nation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 5, 'In 1 Peter 2, what is the significance of portraying Christ as the cornerstone for a dispersed church rather than a physical temple?', '["God''s dwelling is now centered on Christ and his people, not a building","Peter denies all continuity with Israel''s Scriptures","The church has no need for communal life","Only apostles can approach Christ the stone"]'::jsonb, 'God''s dwelling is now centered on Christ and his people, not a building', 'Peter presents Christ as the chosen cornerstone and believers as living stones built into a spiritual house (1 Peter 2:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 2, what is the significance of portraying Christ as the cornerstone for a dispersed church rather than a physical temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 5, 'In 1 Peter 2, why is the phrase called out of darkness into his marvelous light important for mission?', '["It frames witness as testimony to God''s saving transfer of identity","It means believers no longer struggle with sin","It limits salvation to dramatic conversion stories","It refers only to creation rather than redemption"]'::jsonb, 'It frames witness as testimony to God''s saving transfer of identity', 'Believers proclaim God''s excellencies because he called them out of darkness into marvelous light (1 Peter 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 2, why is the phrase called out of darkness into his marvelous light important for mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 5, 'In 1 Peter 2, what theological logic supports nonretaliation under unjust suffering?', '["Christ entrusted himself to the righteous Judge, and his people follow him","Injustice is good and should be sought out","Believers have no Judge over them","Retaliation is forbidden only for slaves, not others"]'::jsonb, 'Christ entrusted himself to the righteous Judge, and his people follow him', 'Peter points to Christ, who did not retaliate but entrusted himself to God who judges justly (1 Peter 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 2, what theological logic supports nonretaliation under unjust suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 5, 'In 1 Peter 2, how do priesthood and sacrifice language reshape ordinary Christian life?', '["All believers offer God acceptable spiritual worship through Christ","Only a special class can approach God","Sacrifice language is abolished and meaningless","The chapter requires animal offerings in the church"]'::jsonb, 'All believers offer God acceptable spiritual worship through Christ', 'Peter says believers are a holy priesthood offering spiritual sacrifices acceptable to God through Jesus Christ (1 Peter 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 2, how do priesthood and sacrifice language reshape ordinary Christian life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 5, 'In 1 Peter 2, why is it significant that healing comes through Christ''s wounds in a passage about suffering servants?', '["The very suffering inflicted on Christ becomes the means of his people''s restoration","Healing here promises immediate physical cure to all","Peter means wounds are symbolic only and not redemptive","The wounds belong to believers, not Christ"]'::jsonb, 'The very suffering inflicted on Christ becomes the means of his people''s restoration', 'Peter says by Christ''s wounds believers were healed, tying redemption to his suffering (1 Peter 2:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 2, why is it significant that healing comes through Christ''s wounds in a passage about suffering servants?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 5, 'In 1 Peter 2, what is the significance of combining civic submission, moral freedom, and divine servanthood in one argument?', '["Christian public life is governed by loyalty to God that shapes how freedom is exercised","Peter collapses church and empire into one authority","Freedom and obedience are treated as opposites that cannot mix","The chapter is only about private spirituality"]'::jsonb, 'Christian public life is governed by loyalty to God that shapes how freedom is exercised', 'Peter grounds submission in the Lord''s sake while calling believers free people who are still God''s servants (1 Peter 2:13, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 2, what is the significance of combining civic submission, moral freedom, and divine servanthood in one argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 2, 5, 'Why does 1 Peter 2 use exile language together with temple and priesthood language?', '["The scattered church remains God''s holy people and dwelling place while living among the nations","Exile cancels covenant identity entirely","Temple language applies only after believers leave the world","Priesthood in exile belongs only to leaders"]'::jsonb, 'The scattered church remains God''s holy people and dwelling place while living among the nations', 'Peter calls believers sojourners, yet also living stones and a royal priesthood, combining identity and mission in dispersion (1 Peter 2:5, 9, 11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 Peter 2 use exile language together with temple and priesthood language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 1, 'According to 1 Peter 3, what should wives be in relation to their husbands?', '["In subjection","In public rivalry","Without concern for them","Their household judges"]'::jsonb, 'In subjection', 'Peter tells wives to be in subjection to their own husbands (1 Peter 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 3, what should wives be in relation to their husbands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 1, 'According to 1 Peter 3, what kind of beauty is called imperishable?', '["The hidden person of the heart","Braided hair","Gold jewelry","Fine clothing"]'::jsonb, 'The hidden person of the heart', 'Peter says the imperishable beauty is the hidden person of the heart with a gentle and quiet spirit (1 Peter 3:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 3, what kind of beauty is called imperishable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 1, 'According to 1 Peter 3, how should husbands live with their wives?', '["According to knowledge","As harsh masters","Without honor","In public suspicion"]'::jsonb, 'According to knowledge', 'Peter instructs husbands to live with their wives according to knowledge and show them honor (1 Peter 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 3, how should husbands live with their wives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 1, 'According to 1 Peter 3, what should believers not return for evil?', '["Evil or reviling","Prayer or blessing","Honor or mercy","Patience or hope"]'::jsonb, 'Evil or reviling', 'Peter says not to repay evil for evil or reviling for reviling (1 Peter 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 3, what should believers not return for evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 1, 'According to 1 Peter 3, what should a person seeking good days keep from evil?', '["His tongue","His table","His hands","His household"]'::jsonb, 'His tongue', 'Peter cites Psalm 34: whoever desires life should keep his tongue from evil (1 Peter 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 3, what should a person seeking good days keep from evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 1, 'According to 1 Peter 3, Christ suffered once for sins, the righteous for whom?', '["The unrighteous","The angels","The rulers","The prophets"]'::jsonb, 'The unrighteous', 'Peter says Christ suffered once for sins, the righteous for the unrighteous (1 Peter 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 3, Christ suffered once for sins, the righteous for whom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 1, 'According to 1 Peter 3, how many souls were saved through water in Noah''s ark?', '["Eight","Seven","Ten","Twelve"]'::jsonb, 'Eight', 'Peter says eight souls were saved through water in Noah''s day (1 Peter 3:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 3, how many souls were saved through water in Noah''s ark?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 2, 'According to 1 Peter 3, what may win disobedient husbands even without a word?', '["The conduct of their wives","A public debate","A civil penalty","A dream"]'::jsonb, 'The conduct of their wives', 'Peter says some husbands may be won without a word by the conduct of their wives (1 Peter 3:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 3, what may win disobedient husbands even without a word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 2, 'According to 1 Peter 3, what kind of spirit is precious in God''s sight?', '["A gentle and quiet spirit","A bold and combative spirit","A suspicious spirit","A restless spirit"]'::jsonb, 'A gentle and quiet spirit', 'Peter says a gentle and quiet spirit is very precious in God''s sight (1 Peter 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 3, what kind of spirit is precious in God''s sight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 2, 'According to 1 Peter 3, why should husbands honor their wives?', '["Because they are fellow heirs of the grace of life","Because women are socially powerful","Because honor guarantees wealth","Because only wives pray"]'::jsonb, 'Because they are fellow heirs of the grace of life', 'Peter says husbands should honor wives as fellow heirs of the grace of life so their prayers are not hindered (1 Peter 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 3, why should husbands honor their wives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 2, 'According to 1 Peter 3, what should believers pursue?', '["Peace","Revenge","Position","Visibility"]'::jsonb, 'Peace', 'Peter quotes Psalm 34: believers should seek peace and pursue it (1 Peter 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 3, what should believers pursue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 2, 'According to 1 Peter 3, what should believers sanctify in their hearts?', '["Christ as Lord","Their own conscience","Their nation","The temple"]'::jsonb, 'Christ as Lord', 'Peter tells believers to sanctify Christ as Lord in their hearts (1 Peter 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 3, what should believers sanctify in their hearts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 2, 'According to 1 Peter 3, with what should believers make their defense?', '["Meekness and fear","Mockery and force","Silence only","Anger and contempt"]'::jsonb, 'Meekness and fear', 'Believers should be ready to give an answer with meekness and fear (1 Peter 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 3, with what should believers make their defense?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 2, 'According to 1 Peter 3, what does baptism correspond to?', '["Noah''s rescue through water","Circumcision only","Temple washing only","Israel crossing the Jordan only"]'::jsonb, 'Noah''s rescue through water', 'Peter links Noah''s deliverance through water with baptism as its corresponding figure (1 Peter 3:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 3, what does baptism correspond to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 3, 'In 1 Peter 3, why does Peter emphasize inward beauty over outward adornment?', '["Because character before God matters more than display","Because clothing is always sinful","Because marriage removes the need for beauty","Because Peter forbids all personal care"]'::jsonb, 'Because character before God matters more than display', 'Peter redirects attention from external adornment to the hidden person of the heart, which is precious before God (1 Peter 3:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 3, why does Peter emphasize inward beauty over outward adornment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 3, 'In 1 Peter 3, why is hindered prayer connected to a husband''s treatment of his wife?', '["Because spiritual life and relational conduct cannot be separated","Because only wives have access to God","Because prayer depends on social status","Because marriage is merely symbolic"]'::jsonb, 'Because spiritual life and relational conduct cannot be separated', 'Peter links honoring one''s wife with unhindered prayers, showing that devotion to God affects household conduct (1 Peter 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 3, why is hindered prayer connected to a husband''s treatment of his wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 3, 'In 1 Peter 3, what is the point of blessing those who mistreat you rather than repaying evil?', '["Believers are called to inherit blessing and reflect God''s way","Blessing guarantees immediate safety","Retaliation is acceptable if done privately","It only applies to speech, not action"]'::jsonb, 'Believers are called to inherit blessing and reflect God''s way', 'Peter says believers were called to this so they may inherit a blessing (1 Peter 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 3, what is the point of blessing those who mistreat you rather than repaying evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 3, 'In 1 Peter 3, why should believers be ready to give an answer for their hope?', '["Their faithful lives will prompt questions from others","Everyone already understands Christian hope","Only leaders need to speak about faith","Defense of hope is mainly a legal strategy"]'::jsonb, 'Their faithful lives will prompt questions from others', 'Peter assumes believers'' hope-filled conduct will bring questions, so they must be ready to answer well (1 Peter 3:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 3, why should believers be ready to give an answer for their hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 3, 'In 1 Peter 3, why is suffering for doing good said to be better than suffering for doing evil?', '["Because it aligns with God''s will and Christ''s own path","Because all suffering is equally commendable","Because evil conduct protects believers from harm","Because doing good always prevents persecution"]'::jsonb, 'Because it aligns with God''s will and Christ''s own path', 'Peter says it is better, if God''s will should so will, to suffer for doing good than for doing evil, and he points to Christ (1 Peter 3:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 3, why is suffering for doing good said to be better than suffering for doing evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 3, 'In 1 Peter 3, what does baptism save believers from according to Peter''s explanation?', '["Not dirt from the body, but a bad conscience through Christ''s resurrection","All earthly troubles immediately","The need for repentance","Physical death in every case"]'::jsonb, 'Not dirt from the body, but a bad conscience through Christ''s resurrection', 'Peter says baptism is not removal of dirt from the flesh but an appeal to God from a good conscience through Jesus Christ''s resurrection (1 Peter 3:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 3, what does baptism save believers from according to Peter''s explanation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 3, 'In 1 Peter 3, what does Christ''s position at God''s right hand imply?', '["His victory and authority over all opposing powers","His temporary rest before judgment by angels","His separation from the Father","His loss of concern for the church"]'::jsonb, 'His victory and authority over all opposing powers', 'Peter says Christ is at God''s right hand with angels, authorities, and powers subjected to him (1 Peter 3:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 3, what does Christ''s position at God''s right hand imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 4, 'How does 1 Peter 3 connect household conduct with public witness?', '["Godly behavior in marriage and speech supports the credibility of Christian hope","Household life is isolated from witness","Only public preaching counts as testimony","Marriage instructions are unrelated to the gospel"]'::jsonb, 'Godly behavior in marriage and speech supports the credibility of Christian hope', 'Peter links conduct in the home, blessing instead of retaliation, and readiness to explain Christian hope (1 Peter 3:1-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 3 connect household conduct with public witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 4, 'How does 1 Peter 3 use Psalm 34 to reinforce its ethical teaching?', '["It grounds Christian speech, peace, and righteousness in Scripture","It replaces Christ''s teaching with a separate moral code","It applies only to ancient Israel, not the church","It narrows ethics to ritual purity"]'::jsonb, 'It grounds Christian speech, peace, and righteousness in Scripture', 'Peter quotes Psalm 34 about speech, turning from evil, and pursuing peace to support his exhortations (1 Peter 3:10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 3 use Psalm 34 to reinforce its ethical teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 4, 'How does 1 Peter 3 relate apologetics to holiness?', '["Believers defend their hope best when Christ is set apart as Lord within them","Arguments alone are enough without character","Apologetics is only for courtroom trials","Holiness and witness are separate tasks"]'::jsonb, 'Believers defend their hope best when Christ is set apart as Lord within them', 'Peter roots readiness to answer in sanctifying Christ as Lord in the heart and keeping a good conscience (1 Peter 3:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 3 relate apologetics to holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 4, 'How does 1 Peter 3 portray Christ''s suffering and triumph together?', '["He suffers once for sins and then is exalted over every power","His suffering ended in defeat and obscurity","Triumph comes without any suffering","Exaltation belongs to believers, not Christ"]'::jsonb, 'He suffers once for sins and then is exalted over every power', 'Peter moves from Christ suffering for sins to his resurrection, ascension, and supreme authority (1 Peter 3:18, 21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 3 portray Christ''s suffering and triumph together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 4, 'How does 1 Peter 3 use Noah''s flood typology without reducing baptism to mere ritual washing?', '["It points to salvation through God''s act and a conscience appeal grounded in resurrection","It says water itself automatically saves everyone","It denies any link between Noah and baptism","It makes baptism a symbol with no spiritual meaning"]'::jsonb, 'It points to salvation through God''s act and a conscience appeal grounded in resurrection', 'Peter explicitly says baptism is not the removal of dirt but an appeal to God through Jesus Christ''s resurrection (1 Peter 3:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 3 use Noah''s flood typology without reducing baptism to mere ritual washing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 4, 'Why does 1 Peter 3 present Sarah as an example for wives?', '["To show that holy women of old hoped in God and expressed trust through conduct","To make Old Testament examples replace Christ","To require every wife to use Sarah''s exact words","To elevate fear as the basis of marriage"]'::jsonb, 'To show that holy women of old hoped in God and expressed trust through conduct', 'Peter points to holy women who hoped in God, especially Sarah, as an example of faithful conduct (1 Peter 3:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 3 present Sarah as an example for wives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 4, 'Why does 1 Peter 3 join blessing enemies with readiness to answer for hope?', '["Distinctive conduct and clear confession together form a credible witness","Speech matters, but conduct does not","Only suffering creates witness, not hope","The answer for hope should replace good works"]'::jsonb, 'Distinctive conduct and clear confession together form a credible witness', 'Peter joins nonretaliation, good conscience, and gentle explanation as part of Christian witness under pressure (1 Peter 3:9, 15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 3 join blessing enemies with readiness to answer for hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 5, 'In 1 Peter 3, what is the theological significance of saying Christ suffered once for sins, the righteous for the unrighteous?', '["It presents a definitive substitutionary suffering that brings sinners to God","It means Christ suffered repeatedly until enough merit was earned","It describes only a moral example with no reconciling effect","It limits atonement to unjust courts"]'::jsonb, 'It presents a definitive substitutionary suffering that brings sinners to God', 'Peter says Christ suffered once for sins, the righteous for the unrighteous, that he might bring us to God (1 Peter 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 3, what is the theological significance of saying Christ suffered once for sins, the righteous for the unrighteous?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 5, 'In 1 Peter 3, why is the appeal to a good conscience essential to Peter''s baptism language?', '["Because baptism signifies responsive faith before God, not mere outward cleansing","Because conscience replaces resurrection in salvation","Because Peter rejects water entirely","Because only priests can have a good conscience"]'::jsonb, 'Because baptism signifies responsive faith before God, not mere outward cleansing', 'Peter carefully explains that baptism is not bodily washing but an appeal to God from a good conscience through the resurrection of Christ (1 Peter 3:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 3, why is the appeal to a good conscience essential to Peter''s baptism language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 5, 'In 1 Peter 3, what is gained by linking everyday marital ethics to Christ''s cosmic exaltation at the chapter''s end?', '["The same lordship of Christ governs both household faithfulness and ultimate victory","Peter shifts topics without any connection","Marriage is shown to be more important than resurrection","Exaltation cancels ethical responsibilities"]'::jsonb, 'The same lordship of Christ governs both household faithfulness and ultimate victory', 'Peter moves from home life and witness to the exalted Christ, showing continuity between ordinary obedience and ultimate hope (1 Peter 3:1-7, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 3, what is gained by linking everyday marital ethics to Christ''s cosmic exaltation at the chapter''s end?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 5, 'In 1 Peter 3, why does Peter emphasize meekness in giving a defense rather than aggression?', '["Christian witness reflects the character of the Lord believers confess","Truth depends on intimidation to prevail","Persecution ends if believers speak harshly enough","Meekness is only for private devotion"]'::jsonb, 'Christian witness reflects the character of the Lord believers confess', 'Peter pairs sanctifying Christ as Lord with answering in meekness and fear, so the manner of witness matches the message (1 Peter 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 3, why does Peter emphasize meekness in giving a defense rather than aggression?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 5, 'In 1 Peter 3, how does Psalm 34 function within Peter''s larger argument about suffering?', '["It assures believers that God''s eyes are on the righteous even when they suffer","It promises the righteous never face opposition","It narrows righteousness to ceremonial speech rules","It replaces trust in Christ with trust in David"]'::jsonb, 'It assures believers that God''s eyes are on the righteous even when they suffer', 'Peter cites Psalm 34 to show the Lord''s eyes are on the righteous and his face is against evil, supporting endurance in suffering (1 Peter 3:10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 3, how does Psalm 34 function within Peter''s larger argument about suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 5, 'Why does 1 Peter 3 put Noah''s small rescued household beside a church facing hostility?', '["To encourage a pressured minority that God''s saving faithfulness does not depend on large numbers","To predict only eight Christians will be saved","To say isolation is superior to witness","To suggest judgment is no longer real"]'::jsonb, 'To encourage a pressured minority that God''s saving faithfulness does not depend on large numbers', 'Peter reminds suffering believers that even in Noah''s day only a few were saved, yet God preserved them through judgment (1 Peter 3:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 Peter 3 put Noah''s small rescued household beside a church facing hostility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 3, 5, 'Why is it significant in 1 Peter 3 that the one believers sanctify in their hearts is Christ the Lord?', '["Their inner allegiance is centered explicitly on the exalted Christ","Peter avoids speaking about Jesus directly","Christ is named only as a moral teacher here","Heart devotion is treated as optional"]'::jsonb, 'Their inner allegiance is centered explicitly on the exalted Christ', 'Peter does not merely say fear God in general; he tells believers to sanctify Christ as Lord in their hearts (1 Peter 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is it significant in 1 Peter 3 that the one believers sanctify in their hearts is Christ the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 1, 'According to 1 Peter 4, with what mind should believers arm themselves?', '["The same mind as Christ","The mind of Caesar","The wisdom of this age","The fear of suffering"]'::jsonb, 'The same mind as Christ', 'Peter tells believers to arm themselves with the same mind as Christ, who suffered in the flesh (1 Peter 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 4, with what mind should believers arm themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 1, 'According to 1 Peter 4, believers should no longer live for what?', '["Human lusts","The will of God","Brotherly love","Hospitality"]'::jsonb, 'Human lusts', 'Peter says believers should no longer live the rest of their time for human lusts but for God''s will (1 Peter 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 4, believers should no longer live for what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 1, 'According to 1 Peter 4, what is near?', '["The end of all things","The Roman collapse","The earthly kingdom","The temple rebuilding"]'::jsonb, 'The end of all things', 'Peter says the end of all things is at hand (1 Peter 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 4, what is near?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 1, 'According to 1 Peter 4, what should believers keep fervent among themselves?', '["Love","Suspicion","Competition","Fear"]'::jsonb, 'Love', 'Above all, believers are to keep fervent in love among themselves (1 Peter 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 4, what should believers keep fervent among themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 1, 'According to 1 Peter 4, what does love cover?', '["A multitude of sins","Every civil offense","All earthly debts","Only public shame"]'::jsonb, 'A multitude of sins', 'Peter says love covers a multitude of sins (1 Peter 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 4, what does love cover?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 1, 'According to 1 Peter 4, how should believers show hospitality?', '["Without grumbling","Only to the wealthy","Rarely and reluctantly","Only on feast days"]'::jsonb, 'Without grumbling', 'Peter says to be hospitable to one another without grumbling (1 Peter 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 4, how should believers show hospitality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 1, 'According to 1 Peter 4, as what should a person speak when speaking?', '["As the oracles of God","As a philosopher","As a ruler","As a storyteller only"]'::jsonb, 'As the oracles of God', 'Peter says whoever speaks should do so as speaking the oracles of God (1 Peter 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 4, as what should a person speak when speaking?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 2, 'According to 1 Peter 4, why do unbelievers think it strange when Christians do not join them?', '["Because believers no longer run with them into the same excess of riot","Because Christians stop all social contact","Because believers become politically powerful","Because Christians refuse to work"]'::jsonb, 'Because believers no longer run with them into the same excess of riot', 'Peter says unbelievers are surprised when Christians do not join them in the same flood of debauchery (1 Peter 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 4, why do unbelievers think it strange when Christians do not join them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 2, 'According to 1 Peter 4, to whom will unbelievers give account?', '["To him who is ready to judge the living and the dead","To the emperor only","To the church elders only","To their ancestors"]'::jsonb, 'To him who is ready to judge the living and the dead', 'Peter says they will give account to the one ready to judge the living and the dead (1 Peter 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 4, to whom will unbelievers give account?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 2, 'According to 1 Peter 4, why should believers be sober and of sound mind?', '["For prayers","For business success","For military service","For public honor"]'::jsonb, 'For prayers', 'Because the end is near, Peter tells believers to be sober-minded for the sake of prayers (1 Peter 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 4, why should believers be sober and of sound mind?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 2, 'According to 1 Peter 4, how should each believer use a gift received?', '["To serve one another as good stewards of God''s grace","To gain status over others","To keep it private","To imitate public speakers only"]'::jsonb, 'To serve one another as good stewards of God''s grace', 'Peter says each person should serve others with the gift received, as good stewards of God''s varied grace (1 Peter 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 4, how should each believer use a gift received?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 2, 'According to 1 Peter 4, with whose strength should a person serve?', '["The strength God supplies","His own determination","The strength of angels","Roman power"]'::jsonb, 'The strength God supplies', 'Whoever serves should do so with the strength God supplies, so God is glorified through Jesus Christ (1 Peter 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 4, with whose strength should a person serve?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 2, 'According to 1 Peter 4, what should believers not think strange?', '["The fiery trial among them","God''s mercy","The resurrection","Answered prayer"]'::jsonb, 'The fiery trial among them', 'Peter says not to think it strange concerning the fiery trial that comes to test them (1 Peter 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 4, what should believers not think strange?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 2, 'According to 1 Peter 4, if anyone suffers as a Christian, what should he do?', '["Glorify God in that name","Hide his faith","Return evil for evil","Doubt his calling"]'::jsonb, 'Glorify God in that name', 'If anyone suffers as a Christian, he should not be ashamed but glorify God in that name (1 Peter 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 4, if anyone suffers as a Christian, what should he do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 3, 'In 1 Peter 4, why does Peter say the one who has suffered in the flesh has ceased from sin?', '["Suffering marks a decisive break with the old pattern of sinful living","Suffering makes believers incapable of future temptation","Physical pain itself removes guilt","Christians become perfect once opposed"]'::jsonb, 'Suffering marks a decisive break with the old pattern of sinful living', 'Peter urges believers to adopt Christ''s mindset so they no longer live for human desires but for God''s will (1 Peter 4:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 4, why does Peter say the one who has suffered in the flesh has ceased from sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 3, 'In 1 Peter 4, why are sobriety and prayer linked to the nearness of the end?', '["Urgent times call for alert dependence on God","Prayer is only needed near the end","Sobriety means emotional coldness","The end removes the need for serving others"]'::jsonb, 'Urgent times call for alert dependence on God', 'Peter says the end is near, so believers should be self-controlled and sober-minded for prayer (1 Peter 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 4, why are sobriety and prayer linked to the nearness of the end?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 3, 'In 1 Peter 4, what is the point of calling gifts forms of God''s varied grace?', '["Different believers serve in different ways under one gracious source","Only impressive gifts matter","Grace is divided unequally by human rank","Speaking gifts replace practical service"]'::jsonb, 'Different believers serve in different ways under one gracious source', 'Peter says believers steward God''s varied grace by using their gifts to serve one another (1 Peter 4:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 4, what is the point of calling gifts forms of God''s varied grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 3, 'In 1 Peter 4, why can believers rejoice when sharing Christ''s sufferings?', '["Because present suffering is tied to future joy at his revealed glory","Because suffering is enjoyable by itself","Because persecution proves innocence automatically","Because pain replaces the need for hope"]'::jsonb, 'Because present suffering is tied to future joy at his revealed glory', 'Peter says rejoice insofar as you share Christ''s sufferings, so that at his glory''s revelation you may also rejoice with exultation (1 Peter 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 4, why can believers rejoice when sharing Christ''s sufferings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 3, 'In 1 Peter 4, why is suffering as a murderer or thief treated differently from suffering as a Christian?', '["Only suffering tied to faithful discipleship carries honor before God","All suffering has equal spiritual value","Crime is excused if done for survival","Christian suffering means breaking civil law"]'::jsonb, 'Only suffering tied to faithful discipleship carries honor before God', 'Peter distinguishes deserved suffering for wrongdoing from suffering as a Christian, which should not bring shame (1 Peter 4:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 4, why is suffering as a murderer or thief treated differently from suffering as a Christian?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 3, 'In 1 Peter 4, what does judgment beginning at the house of God imply?', '["God purifies his own people first, and the ungodly face an even more serious outcome","Believers are condemned before unbelievers are evaluated","The church escapes all testing in history","Judgment only refers to human courts"]'::jsonb, 'God purifies his own people first, and the ungodly face an even more serious outcome', 'Peter says judgment begins with God''s household and uses that to warn about the end of those who disobey the gospel (1 Peter 4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 4, what does judgment beginning at the house of God imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 3, 'In 1 Peter 4, what should suffering believers do with their souls?', '["Entrust them to a faithful Creator while doing good","Hide them from God in fear","Prove themselves by revenge","Wait passively without obedience"]'::jsonb, 'Entrust them to a faithful Creator while doing good', 'Peter tells those suffering according to God''s will to entrust their souls to a faithful Creator in doing good (1 Peter 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 4, what should suffering believers do with their souls?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 4, 'How does 1 Peter 4 connect Christ''s suffering mindset with everyday Christian ethics?', '["Union with Christ''s path reshapes desires, prayer, love, hospitality, and service","Christ''s suffering is only a doctrine with no practical effect","Ethics in the chapter are unrelated commands","Suffering excuses believers from serving others"]'::jsonb, 'Union with Christ''s path reshapes desires, prayer, love, hospitality, and service', 'Peter begins with Christ''s suffering mindset and then applies it to prayer, love, hospitality, and stewardship (1 Peter 4:1-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 4 connect Christ''s suffering mindset with everyday Christian ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 4, 'How does 1 Peter 4 frame the church''s life in the last days?', '["As alert, prayerful, loving, and mutually serving under the nearness of the end","As disengaged from all practical concerns","As focused mainly on predicting dates","As free from suffering because the end is near"]'::jsonb, 'As alert, prayerful, loving, and mutually serving under the nearness of the end', 'Because the end is near, Peter calls for sober prayer, fervent love, hospitality, and stewardship of gifts (1 Peter 4:7-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 4 frame the church''s life in the last days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 4, 'How does 1 Peter 4 connect suffering with God''s glory?', '["Sharing Christ''s sufferings now leads to joy at his revelation, and the Spirit of glory rests on the reproached","Suffering itself is glory regardless of cause","Glory belongs only to the next life, never the present","God''s glory departs when believers are insulted"]'::jsonb, 'Sharing Christ''s sufferings now leads to joy at his revelation, and the Spirit of glory rests on the reproached', 'Peter ties present reproach for Christ to the resting of the Spirit of glory and future joy at Christ''s revelation (1 Peter 4:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 4 connect suffering with God''s glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 4, 'How does 1 Peter 4 distinguish godly witness from sinful notoriety?', '["It forbids suffering for wrongdoing while honoring suffering for the name of Christ","It treats every social stigma as persecution","It says a Christian may ignore moral conduct if criticized","It identifies crime with discipleship"]'::jsonb, 'It forbids suffering for wrongdoing while honoring suffering for the name of Christ', 'Peter warns against suffering as a criminal and contrasts that with suffering as a Christian (1 Peter 4:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 4 distinguish godly witness from sinful notoriety?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 4, 'How does 1 Peter 4 use stewardship language to shape ministry?', '["Every gift is entrusted for others'' good so God is glorified through Christ","Gifts are private possessions for personal distinction","Only speaking ministry counts as real service","Stewardship in the church is mostly financial"]'::jsonb, 'Every gift is entrusted for others'' good so God is glorified through Christ', 'Peter says believers should serve one another with their gifts as good stewards so that God may be glorified through Jesus Christ (1 Peter 4:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 4 use stewardship language to shape ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 4, 'Why does 1 Peter 4 call God a faithful Creator when addressing suffering?', '["It encourages trust in God''s sovereign care while believers continue doing good","It shifts attention away from Christ''s work","It suggests creation, not redemption, is Peter''s main theme","It means suffering believers should stop praying"]'::jsonb, 'It encourages trust in God''s sovereign care while believers continue doing good', 'Peter closes by urging believers to entrust themselves to a faithful Creator while doing good (1 Peter 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 4 call God a faithful Creator when addressing suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 4, 'Why does 1 Peter 4 say the gospel was preached even to the dead?', '["To stress that those now dead were evangelized in life and live to God in the spirit","To teach postmortem conversion for all people","To deny final judgment","To say death nullifies the gospel"]'::jsonb, 'To stress that those now dead were evangelized in life and live to God in the spirit', 'Peter says the gospel was preached to those who are now dead so that though judged in the flesh as humans, they might live to God in the spirit (1 Peter 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 4 say the gospel was preached even to the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 5, 'In 1 Peter 4, what is the theological value of calling the Spirit on suffering believers the Spirit of glory and of God?', '["It interprets reproach for Christ as a site of divine presence rather than defeat","It means suffering believers become divine","It restricts the Spirit to times of persecution only","It denies the Spirit''s role in ordinary service"]'::jsonb, 'It interprets reproach for Christ as a site of divine presence rather than defeat', 'Peter says if believers are reproached for Christ''s name, the Spirit of glory and of God rests on them (1 Peter 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 4, what is the theological value of calling the Spirit on suffering believers the Spirit of glory and of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 5, 'In 1 Peter 4, why is eschatology tied to ordinary practices like prayer, hospitality, and serving?', '["Awareness of the end intensifies faithful communal life rather than replacing it","The end makes ordinary obedience unnecessary","Only dramatic martyrdom matters in the last days","Peter wants believers to abandon daily responsibilities"]'::jsonb, 'Awareness of the end intensifies faithful communal life rather than replacing it', 'Because the end is near, Peter calls believers to prayer, love, hospitality, and service rather than withdrawal (1 Peter 4:7-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 4, why is eschatology tied to ordinary practices like prayer, hospitality, and serving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 5, 'In 1 Peter 4, what is gained by describing Christian service as stewardship of varied grace rather than individual talent?', '["Ministry is received from God and exercised for others, not possessed for self-display","Natural ability is all Peter cares about","Grace is limited to speaking roles","Service becomes optional if one feels unqualified"]'::jsonb, 'Ministry is received from God and exercised for others, not possessed for self-display', 'Peter frames gifts as stewardship of God''s varied grace, turning attention from self to faithful service (1 Peter 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 4, what is gained by describing Christian service as stewardship of varied grace rather than individual talent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 5, 'In 1 Peter 4, why does judgment beginning with God''s house intensify rather than diminish hope?', '["God''s refining work among his people assures them he is actively dealing with evil and preparing final justice","It means believers should expect only condemnation","It removes any distinction between church and world","It teaches that the gospel has failed"]'::jsonb, 'God''s refining work among his people assures them he is actively dealing with evil and preparing final justice', 'Peter presents present judgment within God''s house as part of a larger reality that will culminate more severely for those who reject the gospel (1 Peter 4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 4, why does judgment beginning with God''s house intensify rather than diminish hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 5, 'In 1 Peter 4, how does Peter preserve both God''s sovereignty and human responsibility in suffering?', '["Believers suffer according to God''s will and yet must keep doing good while trusting him","Sovereignty means human obedience is irrelevant","Responsibility means God is absent from suffering","Peter treats suffering as random chance"]'::jsonb, 'Believers suffer according to God''s will and yet must keep doing good while trusting him', 'Peter tells those suffering according to God''s will to entrust themselves to God while doing good (1 Peter 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 4, how does Peter preserve both God''s sovereignty and human responsibility in suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 5, 'In 1 Peter 4, why does Peter contrast the believers'' former pagan life with their present endurance?', '["To show conversion as a real break that explains present hostility","To suggest past sins are unforgettable and unforgiven","To make Gentile background the chief issue rather than Christ","To say believers should avoid all contact with unbelievers"]'::jsonb, 'To show conversion as a real break that explains present hostility', 'Peter says enough time has passed in former pagan conduct, and now unbelievers are surprised by the believers'' changed lives (1 Peter 4:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 4, why does Peter contrast the believers'' former pagan life with their present endurance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 4, 5, 'Why does 1 Peter 4 tie all ministry to God''s glory through Jesus Christ at the end of its gift instructions?', '["The final goal of all speech and service is doxological, not self-exalting","Peter is ending the letter early","Only preachers can glorify God through Christ","The church exists mainly to showcase gifted individuals"]'::jsonb, 'The final goal of all speech and service is doxological, not self-exalting', 'Peter says believers speak and serve in God''s strength so that in everything God may be glorified through Jesus Christ (1 Peter 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 Peter 4 tie all ministry to God''s glory through Jesus Christ at the end of its gift instructions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 1, 'According to 1 Peter 5, whom does Peter exhort first in the chapter?', '["The elders","The widows","The rulers","The servants"]'::jsonb, 'The elders', 'Peter begins by exhorting the elders among his readers (1 Peter 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 5, whom does Peter exhort first in the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 1, 'According to 1 Peter 5, what will faithful shepherds receive when the Chief Shepherd appears?', '["An unfading crown of glory","A golden scepter","Earthly wealth","A place of vengeance"]'::jsonb, 'An unfading crown of glory', 'Peter says faithful elders will receive the unfading crown of glory when the Chief Shepherd appears (1 Peter 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 5, what will faithful shepherds receive when the Chief Shepherd appears?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 1, 'According to 1 Peter 5, how should younger people relate to elders?', '["Be subject to them","Compete with them","Ignore them","Publicly shame them"]'::jsonb, 'Be subject to them', 'Peter tells younger people to be subject to the elders (1 Peter 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 5, how should younger people relate to elders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 1, 'According to 1 Peter 5, what should believers cast on God?', '["All their anxiety","Their spiritual gifts","Their enemies","Their honor"]'::jsonb, 'All their anxiety', 'Peter tells believers to cast all their anxiety on God because he cares for them (1 Peter 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 5, what should believers cast on God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 1, 'According to 1 Peter 5, what animal is the devil compared to?', '["A roaring lion","A serpent in the grass","A wolf at night","A ravenous bear"]'::jsonb, 'A roaring lion', 'Peter warns that the devil prowls around like a roaring lion seeking someone to devour (1 Peter 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 5, what animal is the devil compared to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 1, 'According to 1 Peter 5, whom should believers resist?', '["The devil","The Chief Shepherd","Silvanus","Mark"]'::jsonb, 'The devil', 'Peter says believers should resist the devil, steadfast in faith (1 Peter 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 5, whom should believers resist?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 1, 'According to 1 Peter 5, who called believers to his eternal glory in Christ?', '["The God of all grace","The apostle Peter","The holy angels","The church in Babylon"]'::jsonb, 'The God of all grace', 'Peter calls God the God of all grace who called believers to his eternal glory in Christ (1 Peter 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Peter 5, who called believers to his eternal glory in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 2, 'According to 1 Peter 5, how should elders shepherd God''s flock?', '["Willingly and eagerly, not for shameful gain","By force and greed","Only when watched","As owners of the flock"]'::jsonb, 'Willingly and eagerly, not for shameful gain', 'Peter tells elders to shepherd willingly and eagerly, not by compulsion or for dishonest gain (1 Peter 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 5, how should elders shepherd God''s flock?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 2, 'According to 1 Peter 5, how should leaders relate to those in their charge?', '["As examples to the flock","As domineering rulers","As distant officials","As paid instructors only"]'::jsonb, 'As examples to the flock', 'Peter says elders must not lord it over those allotted to them, but be examples to the flock (1 Peter 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 5, how should leaders relate to those in their charge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 2, 'According to 1 Peter 5, with what should all believers clothe themselves toward one another?', '["Humility","Prestige","Boldness","Authority"]'::jsonb, 'Humility', 'Peter tells all believers to clothe themselves with humility toward one another (1 Peter 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 5, with what should all believers clothe themselves toward one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 2, 'According to 1 Peter 5, when will God exalt the humble?', '["In due time","Immediately in every case","Only after political change","At the next feast"]'::jsonb, 'In due time', 'Peter says humble yourselves under God''s mighty hand so that he may exalt you in due time (1 Peter 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 5, when will God exalt the humble?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 2, 'According to 1 Peter 5, what do believers know about the sufferings they face?', '["The same sufferings are being accomplished in their brotherhood in the world","They alone are targeted","Their trials prove God has left the church","No one else understands them"]'::jsonb, 'The same sufferings are being accomplished in their brotherhood in the world', 'Peter reminds them that the same kinds of sufferings are experienced by believers throughout the world (1 Peter 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 5, what do believers know about the sufferings they face?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 2, 'According to 1 Peter 5, what will God do after believers have suffered a little while?', '["Perfect, establish, strengthen, and settle them","Remove every earthly conflict at once","Give them political rule","Release them from all responsibility"]'::jsonb, 'Perfect, establish, strengthen, and settle them', 'After a little while of suffering, God will himself perfect, establish, strengthen, and settle believers (1 Peter 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 5, what will God do after believers have suffered a little while?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 2, 'According to 1 Peter 5, what does Peter say is the true grace of God?', '["The message he has written and testified to","Escape from all trials","Honor from society","The power of Rome"]'::jsonb, 'The message he has written and testified to', 'Peter says he has written briefly, exhorting and testifying that this is the true grace of God; stand firm in it (1 Peter 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 1 Peter 5, what does Peter say is the true grace of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 3, 'In 1 Peter 5, why is humility essential for both leaders and the led?', '["Because God opposes the proud but gives grace to the humble","Because humility removes the need for courage","Because only younger people struggle with pride","Because church order depends on status competition"]'::jsonb, 'Because God opposes the proud but gives grace to the humble', 'Peter applies humility broadly and quotes that God resists the proud but gives grace to the humble (1 Peter 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 5, why is humility essential for both leaders and the led?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 3, 'In 1 Peter 5, what is the force of calling Christ the Chief Shepherd?', '["Human leaders serve under Christ''s higher authority and example","Peter replaces Christ as the church''s true shepherd","Only elders belong to Christ''s flock","Shepherding is mainly administrative"]'::jsonb, 'Human leaders serve under Christ''s higher authority and example', 'Peter tells elders to shepherd God''s flock while looking to the appearing of the Chief Shepherd (1 Peter 5:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 5, what is the force of calling Christ the Chief Shepherd?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 3, 'In 1 Peter 5, why can believers cast anxieties on God?', '["Because he genuinely cares for them","Because anxiety is imaginary","Because vigilance is unnecessary","Because elders carry all burdens alone"]'::jsonb, 'Because he genuinely cares for them', 'Peter grounds the command to cast anxieties on God in the truth that he cares for believers (1 Peter 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 5, why can believers cast anxieties on God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 3, 'In 1 Peter 5, why are sobriety and watchfulness necessary alongside trust in God?', '["Because the devil actively seeks to devour, so confidence must be alert","Because trust in God produces passivity","Because fear is the highest Christian virtue","Because spiritual danger is only imaginary"]'::jsonb, 'Because the devil actively seeks to devour, so confidence must be alert', 'Peter joins trustful care from God with alert resistance because the devil prowls like a roaring lion (1 Peter 5:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 5, why are sobriety and watchfulness necessary alongside trust in God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 3, 'In 1 Peter 5, why does Peter mention worldwide brotherhood sharing similar sufferings?', '["To remind believers they are not isolated in their trials","To say every trial is identical in detail","To minimize local suffering","To replace prayer with statistics"]'::jsonb, 'To remind believers they are not isolated in their trials', 'Peter strengthens them by saying the same sufferings are being experienced by their brotherhood in the world (1 Peter 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 5, why does Peter mention worldwide brotherhood sharing similar sufferings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 3, 'In 1 Peter 5, what does standing firm in the true grace of God require?', '["Persevering in the apostolic message under pressure","Escaping every hardship","Seeking honor from the culture","Trusting personal charisma"]'::jsonb, 'Persevering in the apostolic message under pressure', 'Peter''s closing says he has testified to the true grace of God and urges believers to stand firm in it (1 Peter 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 5, what does standing firm in the true grace of God require?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 3, 'In 1 Peter 5, what does the promise of an unfading crown of glory communicate to faithful shepherds?', '["Their reward is lasting and tied to Christ''s appearing","Their reward depends on public praise now","Shepherds are exempt from suffering","The crown is a political office"]'::jsonb, 'Their reward is lasting and tied to Christ''s appearing', 'Peter contrasts temporary gain with an unfading crown of glory given when the Chief Shepherd appears (1 Peter 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 1 Peter 5, what does the promise of an unfading crown of glory communicate to faithful shepherds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 4, 'How does 1 Peter 5 tie church leadership to the larger message of the letter?', '["Elders model humble endurance and care in the same suffering-shaped pattern Peter has taught throughout","Leadership is treated as separate from suffering and witness","The chapter abandons the exile theme for administration only","Peter shifts from theology to mere formality"]'::jsonb, 'Elders model humble endurance and care in the same suffering-shaped pattern Peter has taught throughout', 'Peter addresses shepherding, humility, suffering, vigilance, and future glory in continuity with the whole letter''s themes (1 Peter 5:1-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 5 tie church leadership to the larger message of the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 4, 'How does 1 Peter 5 balance humility and hope?', '["Believers humble themselves now under God''s hand, trusting him to exalt them in due time","Humility cancels expectation of future glory","Hope is grounded in self-assertion","Exaltation belongs only to church leaders"]'::jsonb, 'Believers humble themselves now under God''s hand, trusting him to exalt them in due time', 'Peter links humility under God''s mighty hand with future exaltation in due time (1 Peter 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 5 balance humility and hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 4, 'How does 1 Peter 5 hold together divine care and spiritual warfare?', '["God''s care invites trust, while the devil''s hostility demands vigilance and resistance","If God cares, no resistance is needed","Spiritual warfare cancels the comfort of prayer","The devil acts independently of God''s oversight"]'::jsonb, 'God''s care invites trust, while the devil''s hostility demands vigilance and resistance', 'Peter says cast anxiety on God because he cares, yet also be sober and resist the devil steadfast in faith (1 Peter 5:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 5 hold together divine care and spiritual warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 4, 'How does 1 Peter 5 frame suffering in relation to eternal glory?', '["A little while of suffering stands before eternal glory and divine restoration","Suffering is the final state of believers","Glory comes without any need for perseverance","Earthly relief is the main promise in the chapter"]'::jsonb, 'A little while of suffering stands before eternal glory and divine restoration', 'Peter says the God of all grace called believers to eternal glory, and after a little while of suffering he will restore them (1 Peter 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 5 frame suffering in relation to eternal glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 4, 'How does 1 Peter 5 prevent Christian leadership from becoming domination?', '["It requires willing service, eager care, and exemplary conduct instead of lording it over others","It removes all authority from leaders","It bases leadership on age alone","It says discipline is always domineering"]'::jsonb, 'It requires willing service, eager care, and exemplary conduct instead of lording it over others', 'Peter says elders must shepherd willingly and eagerly, not as domineering over those in their charge (1 Peter 5:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Peter 5 prevent Christian leadership from becoming domination?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 4, 'Why does 1 Peter 5 end by calling Peter''s message the true grace of God?', '["It summarizes the letter as a reliable apostolic witness in which believers must stand firm","It narrows grace to suffering only","It means the letter replaces Scripture","It suggests grace is merely a greeting formula"]'::jsonb, 'It summarizes the letter as a reliable apostolic witness in which believers must stand firm', 'Peter says he has written exhorting and testifying that this is the true grace of God; believers are to stand firm in it (1 Peter 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 5 end by calling Peter''s message the true grace of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 4, 'Why does 1 Peter 5 address both elders and younger people before speaking to all about humility?', '["Different roles exist in the church, but humility is required across them all","Only age determines spiritual maturity","The chapter is mainly about generational conflict","Humility applies to leaders but not to others"]'::jsonb, 'Different roles exist in the church, but humility is required across them all', 'Peter gives role-specific instruction and then broadens the call: all of you clothe yourselves with humility (1 Peter 5:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does 1 Peter 5 address both elders and younger people before speaking to all about humility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 5, 'In 1 Peter 5, what is the significance of Peter identifying himself as a fellow elder and witness of Christ''s sufferings?', '["He leads by shared participation rather than distant rank, linking authority with witness and future glory","He gives up all apostolic authority in the letter","He speaks only as a historian, not a shepherd","He separates leadership from suffering"]'::jsonb, 'He leads by shared participation rather than distant rank, linking authority with witness and future glory', 'Peter exhorts the elders as a fellow elder, witness of Christ''s sufferings, and sharer in the coming glory (1 Peter 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 5, what is the significance of Peter identifying himself as a fellow elder and witness of Christ''s sufferings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 5, 'In 1 Peter 5, why is the image of the Chief Shepherd important after instructions against domineering leadership?', '["It reminds leaders that the flock belongs to Christ and that their authority is delegated","It means elders should act as little kings until Christ returns","It removes accountability from shepherds","It limits shepherding to Peter alone"]'::jsonb, 'It reminds leaders that the flock belongs to Christ and that their authority is delegated', 'Peter speaks of God''s flock and the appearing of the Chief Shepherd, keeping elders under Christ''s rule (1 Peter 5:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 5, why is the image of the Chief Shepherd important after instructions against domineering leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 5, 'In 1 Peter 5, what theological tension is resolved by casting anxiety on God while also resisting the devil?', '["Trust in God''s care strengthens active vigilance rather than replacing it","Anxiety is the best defense against Satan","Resistance shows God cannot be trusted","Only prayer matters; resistance is unnecessary"]'::jsonb, 'Trust in God''s care strengthens active vigilance rather than replacing it', 'Peter places God''s care beside commands to be watchful and resist the devil, showing trust and alertness belong together (1 Peter 5:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 5, what theological tension is resolved by casting anxiety on God while also resisting the devil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 5, 'In 1 Peter 5, why is the phrase God of all grace especially fitting in a conclusion centered on suffering and restoration?', '["It gathers the whole letter under God''s sustaining favor from calling to final strengthening","It means grace is only future and not present","It narrows grace to forgiveness without transformation","It suggests suffering comes apart from God''s purposes"]'::jsonb, 'It gathers the whole letter under God''s sustaining favor from calling to final strengthening', 'Peter names God the God of all grace who calls believers to eternal glory and personally restores them after suffering (1 Peter 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 5, why is the phrase God of all grace especially fitting in a conclusion centered on suffering and restoration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 5, 'In 1 Peter 5, what is the force of saying believers suffer for a little while before restoration?', '["Present affliction is real but temporary in light of God''s lasting purposes","Suffering is unreal and should be ignored","Restoration happens instantly in every case","Only leaders suffer for a little while"]'::jsonb, 'Present affliction is real but temporary in light of God''s lasting purposes', 'Peter neither denies suffering nor absolutizes it; he places it under God''s promise of restoration after a little while (1 Peter 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 5, what is the force of saying believers suffer for a little while before restoration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 5, 'In 1 Peter 5, how does the letter''s closing call to stand firm in true grace summarize its theology of exile?', '["Scattered believers endure suffering by remaining rooted in God''s gracious gospel","Exile is solved by political control","Grace removes the need for perseverance","Standing firm means cultural withdrawal only"]'::jsonb, 'Scattered believers endure suffering by remaining rooted in God''s gracious gospel', 'Peter''s final exhortation is to stand firm in the true grace of God, matching the letter''s call for steadfastness amid exile and suffering (1 Peter 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 1 Peter 5, how does the letter''s closing call to stand firm in true grace summarize its theology of exile?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 60, 5, 5, 'Why does 1 Peter 5 end with peace to all who are in Christ after so much emphasis on suffering and vigilance?', '["The closing peace reflects the secure identity and hope believers possess in union with Christ","Peace means conflict has already disappeared from the world","Peter is contradicting his warnings about the devil","Peace is limited to leaders in Babylon"]'::jsonb, 'The closing peace reflects the secure identity and hope believers possess in union with Christ', 'Peter ends with peace to all who are in Christ, a fitting conclusion after calling them to endure suffering and resist the devil in faith (1 Peter 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 60
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does 1 Peter 5 end with peace to all who are in Christ after so much emphasis on suffering and vigilance?'
);
