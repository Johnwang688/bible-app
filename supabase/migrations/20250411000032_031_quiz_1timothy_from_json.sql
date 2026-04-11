-- ============================================================================
-- LOGOS LIGHT - 1 Timothy (book 54) quiz questions from quiz-questions/1timothy.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 1, 'According to 1 Timothy 1, where did Paul ask Timothy to remain?', '["Ephesus","Corinth","Rome","Jerusalem"]'::jsonb, 'Ephesus', 'Paul urged Timothy to remain at Ephesus so he could instruct certain men not to teach a different doctrine (1 Timothy 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 1, where did Paul ask Timothy to remain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 1, 'According to 1 Timothy 1, what were some teaching besides sound doctrine?', '["Myths and endless genealogies","Psalms and hymns","Parables and proverbs","Visions and dreams"]'::jsonb, 'Myths and endless genealogies', 'Paul says certain people were to avoid myths and endless genealogies, which promote disputes rather than God''s stewardship in faith (1 Timothy 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 1, what were some teaching besides sound doctrine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 1, 'According to 1 Timothy 1, what is the goal of the commandment?', '["Love out of a pure heart, a good conscience, and sincere faith","Knowledge of hidden mysteries","Power over demons","Influence with rulers"]'::jsonb, 'Love out of a pure heart, a good conscience, and sincere faith', 'Paul says the goal of the commandment is love out of a pure heart, a good conscience, and sincere faith (1 Timothy 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 1, what is the goal of the commandment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 1, 'According to 1 Timothy 1, for whom is the law not made?', '["A righteous person","The lawless and disobedient","Sinners and profane people","Murderers and liars"]'::jsonb, 'A righteous person', 'Paul says the law is not made for a righteous person but for the lawless and insubordinate and others opposed to sound doctrine (1 Timothy 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 1, for whom is the law not made?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 1, 'According to 1 Timothy 1, what had Paul formerly been?', '["A blasphemer, persecutor, and violent man","A chief priest","A Roman soldier","A philosopher"]'::jsonb, 'A blasphemer, persecutor, and violent man', 'Paul says he formerly was a blasphemer, a persecutor, and an insolent man (1 Timothy 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 1, what had Paul formerly been?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 1, 'According to 1 Timothy 1, why did Christ Jesus come into the world?', '["To save sinners","To restore the temple","To crown earthly kings","To teach secret wisdom"]'::jsonb, 'To save sinners', 'Paul calls it a faithful saying that Christ Jesus came into the world to save sinners (1 Timothy 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 1, why did Christ Jesus come into the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 1, 'According to 1 Timothy 1, whom does Paul say he delivered to Satan?', '["Hymenaeus and Alexander","Phygelus and Hermogenes","Demas and Crescens","Titus and Silas"]'::jsonb, 'Hymenaeus and Alexander', 'Paul says he delivered Hymenaeus and Alexander to Satan so they might be taught not to blaspheme (1 Timothy 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 1, whom does Paul say he delivered to Satan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 2, 'What did Paul tell Timothy to command certain men not to teach in 1 Timothy 1?', '["A different doctrine","The Psalms","The prophets","The gospel of Christ"]'::jsonb, 'A different doctrine', 'Paul left Timothy in Ephesus so he might command certain men not to teach a different doctrine (1 Timothy 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Paul tell Timothy to command certain men not to teach in 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 2, 'What do myths and endless genealogies produce according to 1 Timothy 1?', '["Disputes","Faith and peace","Holiness and joy","Bold preaching"]'::jsonb, 'Disputes', 'Paul says myths and endless genealogies promote disputes rather than God''s stewardship which is in faith (1 Timothy 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What do myths and endless genealogies produce according to 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 2, 'What had some turned aside to according to 1 Timothy 1?', '["Vain talking","Faithful labor","Brotherly love","Prayer and worship"]'::jsonb, 'Vain talking', 'Some had turned aside from the goal of love to vain talking (1 Timothy 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What had some turned aside to according to 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 2, 'How does Paul say the law is good in 1 Timothy 1?', '["If a person uses it lawfully","If it replaces grace","If it is ignored","If it is used for myths"]'::jsonb, 'If a person uses it lawfully', 'Paul says we know that the law is good if a person uses it lawfully (1 Timothy 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul say the law is good in 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 2, 'What was entrusted to Paul according to 1 Timothy 1?', '["The gospel of the glory of the blessed God","The temple treasury","The high priesthood","A Roman office"]'::jsonb, 'The gospel of the glory of the blessed God', 'Paul says this is according to the gospel of the glory of the blessed God, which was committed to his trust (1 Timothy 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was entrusted to Paul according to 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 2, 'Why did Paul receive mercy according to 1 Timothy 1?', '["He acted ignorantly in unbelief","He had always been righteous","He kept the law perfectly","He never opposed the church"]'::jsonb, 'He acted ignorantly in unbelief', 'Paul says he received mercy because he acted ignorantly in unbelief (1 Timothy 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Paul receive mercy according to 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 2, 'What did Paul tell Timothy to hold along with faith in 1 Timothy 1?', '["A good conscience","A Roman passport","Temple privileges","Silence before opponents"]'::jsonb, 'A good conscience', 'Paul charges Timothy to hold faith and a good conscience, which some rejected and made shipwreck concerning the faith (1 Timothy 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Paul tell Timothy to hold along with faith in 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 3, 'Why does Paul connect sound doctrine with the goal of love in 1 Timothy 1?', '["True teaching is meant to produce morally transformed love, not empty speculation","Doctrine replaces love entirely","Love makes doctrine unnecessary","Paul sees no relationship between truth and character"]'::jsonb, 'True teaching is meant to produce morally transformed love, not empty speculation', 'Paul contrasts myths and vain talk with the goal of the commandment: love from a pure heart, good conscience, and sincere faith (1 Timothy 1:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect sound doctrine with the goal of love in 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 3, 'What does Paul''s testimony in 1 Timothy 1 emphasize about grace?', '["Grace can transform even a violent persecutor into a servant of Christ","Grace is only for the already righteous","Grace matters less than law-keeping","Paul earned mercy through his past zeal"]'::jsonb, 'Grace can transform even a violent persecutor into a servant of Christ', 'Paul presents himself as a former persecutor who received mercy and abundant grace, making him an example of Christ''s saving patience (1 Timothy 1:12-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s testimony in 1 Timothy 1 emphasize about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 3, 'Why does Paul say the law is for the lawless rather than the righteous?', '["The law exposes and restrains conduct contrary to God''s moral order","The righteous have no need for moral truth","The law was created only for Israel''s priests","Paul denies any continuing moral function for the law"]'::jsonb, 'The law exposes and restrains conduct contrary to God''s moral order', 'Paul lists various sinful behaviors to show the law addresses conduct opposed to sound doctrine (1 Timothy 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say the law is for the lawless rather than the righteous?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 3, 'What does ''shipwreck concerning the faith'' suggest in 1 Timothy 1?', '["Rejecting faith and a good conscience can lead to spiritual ruin","Faith is automatically secure regardless of conduct","Only leaders can fall away","Good conscience has no role in perseverance"]'::jsonb, 'Rejecting faith and a good conscience can lead to spiritual ruin', 'Paul says some rejected faith and a good conscience and thus made shipwreck concerning the faith (1 Timothy 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''shipwreck concerning the faith'' suggest in 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 3, 'Why does Paul call his conversion an example in 1 Timothy 1?', '["His life demonstrates Christ''s long-suffering toward future believers","He wants others to imitate his persecution","He is proving apostles are sinless","He means only Timothy should learn from it"]'::jsonb, 'His life demonstrates Christ''s long-suffering toward future believers', 'Paul says he received mercy so that in him first Jesus Christ might show all his patience as an example to those who would later believe (1 Timothy 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul call his conversion an example in 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 3, 'How does Paul''s praise of God in 1 Timothy 1 fit the chapter?', '["Reflection on mercy and the gospel naturally leads him to doxology","It interrupts the chapter without reason","It is aimed at false teachers only","It replaces the need for instruction"]'::jsonb, 'Reflection on mercy and the gospel naturally leads him to doxology', 'After recounting Christ''s mercy to save sinners, Paul bursts into praise to the King eternal, immortal, invisible, the only God (1 Timothy 1:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s praise of God in 1 Timothy 1 fit the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 3, 'Why does Paul entrust a charge to Timothy at the end of 1 Timothy 1?', '["The defense of sound teaching requires faithful perseverance in spiritual conflict","Timothy is being relieved of ministry","Paul is ending all correction in Ephesus","The charge concerns Roman politics"]'::jsonb, 'The defense of sound teaching requires faithful perseverance in spiritual conflict', 'Paul gives Timothy a charge according to previous prophecies so that he may war the good warfare, holding faith and a good conscience (1 Timothy 1:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul entrust a charge to Timothy at the end of 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 4, 'How does 1 Timothy 1 join doctrine and ethics?', '["Sound doctrine is measured not only by correctness but by the kind of life and love it produces","Ethics matter but doctrine does not","Doctrine is only theoretical in this chapter","Paul keeps teaching and conduct completely separate"]'::jsonb, 'Sound doctrine is measured not only by correctness but by the kind of life and love it produces', 'Paul opposes false teaching that breeds disputes and insists the command''s goal is love from a pure heart, good conscience, and sincere faith (1 Timothy 1:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 1 join doctrine and ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 4, 'What role does Paul''s own story play in the argument of chapter 1?', '["His conversion is living evidence that the gospel he guards is powerful, gracious, and trustworthy","It serves only as autobiography","It proves persecution is a virtue","It replaces the need for church order"]'::jsonb, 'His conversion is living evidence that the gospel he guards is powerful, gracious, and trustworthy', 'Paul''s testimony about mercy and transformation reinforces the faithful saying that Christ came to save sinners and supports his charge to Timothy (1 Timothy 1:12-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What role does Paul''s own story play in the argument of chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 4, 'Why does Paul list many kinds of sinners when discussing the law in 1 Timothy 1?', '["He shows that the law addresses concrete forms of ungodliness contrary to sound doctrine","He is trying to produce curiosity only","He is giving a complete civil code","He is denying the gospel''s relevance to sinners"]'::jsonb, 'He shows that the law addresses concrete forms of ungodliness contrary to sound doctrine', 'Paul''s list demonstrates the law''s moral exposure of behaviors that stand against sound teaching and the gospel entrusted to him (1 Timothy 1:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul list many kinds of sinners when discussing the law in 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 4, 'How does 1 Timothy 1 portray ministry as warfare?', '["Guarding truth and conscience in the face of false teaching requires disciplined spiritual struggle","Ministry is mainly a search for comfort","The warfare is against Rome alone","Paul calls for physical violence"]'::jsonb, 'Guarding truth and conscience in the face of false teaching requires disciplined spiritual struggle', 'Paul charges Timothy to war the good warfare by holding faith and a good conscience against the backdrop of false teaching and shipwrecked faith (1 Timothy 1:18-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 1 portray ministry as warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 4, 'What does the chapter imply about false teaching''s danger?', '["It is dangerous not only because it is false but because it leads people away from love, conscience, and faith","Its danger is only intellectual confusion","It harms only outsiders","Paul treats it as a minor preference"]'::jsonb, 'It is dangerous not only because it is false but because it leads people away from love, conscience, and faith', 'Paul connects false teaching with disputes, vain talk, misuse of the law, and eventually shipwreck of faith, showing deep spiritual harm (1 Timothy 1:4-7, 19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the chapter imply about false teaching''s danger?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 4, 'How does Paul''s doxology contribute to his refutation of error?', '["By centering everything on the majesty of the only God rather than human speculation","By avoiding theology in favor of emotion","By praising Timothy instead of God","By minimizing the seriousness of sin"]'::jsonb, 'By centering everything on the majesty of the only God rather than human speculation', 'After discussing mercy and salvation, Paul praises the eternal and invisible King, redirecting attention from speculative teaching to God''s glory (1 Timothy 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s doxology contribute to his refutation of error?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 4, 'What does the discipline of Hymenaeus and Alexander show about church leadership?', '["Leaders must sometimes enact severe correction to protect the faith and confront blasphemy","Correction is never appropriate","Public teaching has no consequences","Discipline means counting offenders as beyond hope"]'::jsonb, 'Leaders must sometimes enact severe correction to protect the faith and confront blasphemy', 'Paul says he handed these men over to Satan so they might learn not to blaspheme, indicating serious corrective action for the sake of the church and the offenders (1 Timothy 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the discipline of Hymenaeus and Alexander show about church leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 5, 'How does 1 Timothy 1 portray the gospel as both doctrinally precise and morally transformative?', '["The gospel is a trust to be guarded in truth and a power that produces love, conscience, and changed lives","The gospel is only a moral example","The gospel concerns doctrine but not behavior","Transformation replaces the need for truth"]'::jsonb, 'The gospel is a trust to be guarded in truth and a power that produces love, conscience, and changed lives', 'Paul links sound doctrine and the glorious gospel with the goal of love, his own transformed life, and Timothy''s charge to hold faith and a good conscience (1 Timothy 1:5, 11-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 1 portray the gospel as both doctrinally precise and morally transformative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 5, 'Why is Paul''s self-description as the foremost of sinners theologically significant?', '["It magnifies Christ''s mercy by showing that no sinner lies beyond his saving purpose","It denies Paul''s apostleship","It means sin remains stronger than grace","It suggests only extreme sinners can be saved"]'::jsonb, 'It magnifies Christ''s mercy by showing that no sinner lies beyond his saving purpose', 'Paul uses his own extreme past to display Christ''s perfect patience as an example for future believers (1 Timothy 1:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s self-description as the foremost of sinners theologically significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 5, 'How does 1 Timothy 1 resist both legalism and lawlessness?', '["It upholds the lawful use of the law while locating salvation and transformation in the gospel of grace","It rejects the law entirely","It makes law-keeping the basis of justification","It treats moral obedience as optional"]'::jsonb, 'It upholds the lawful use of the law while locating salvation and transformation in the gospel of grace', 'Paul says the law is good if used lawfully, yet he centers everything in the gospel entrusted to him and the grace that overflowed to him in Christ (1 Timothy 1:8-11, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 1 resist both legalism and lawlessness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 5, 'What does the chapter imply about conscience in Christian perseverance?', '["Conscience is not secondary but bound up with faithfulness, so rejecting it can wreck faith","Conscience matters only before conversion","Faith is strongest when detached from conscience","Conscience is merely cultural instinct in Paul''s view"]'::jsonb, 'Conscience is not secondary but bound up with faithfulness, so rejecting it can wreck faith', 'Paul explicitly links holding faith with holding a good conscience and warns that rejecting this leads to shipwreck concerning the faith (1 Timothy 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the chapter imply about conscience in Christian perseverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 5, 'How does 1 Timothy 1 frame pastoral ministry as stewardship rather than self-expression?', '["Timothy and Paul are entrusted with a divine charge and gospel that must be guarded and applied faithfully","Pastors are free to innovate doctrine without restraint","Ministry is mainly personal storytelling","Authority comes from popularity alone"]'::jsonb, 'Timothy and Paul are entrusted with a divine charge and gospel that must be guarded and applied faithfully', 'Paul speaks of the gospel committed to his trust and the charge entrusted to Timothy according to prophecy, emphasizing received responsibility rather than self-invented ministry (1 Timothy 1:11, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 1 frame pastoral ministry as stewardship rather than self-expression?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 5, 'Why is Paul''s chapter-long movement from warning to testimony to doxology to charge so effective?', '["It shows that guarding the church''s doctrine rests on the grace of Christ, the glory of God, and the seriousness of the pastoral task","It is a random collection of disconnected ideas","It minimizes false teaching by focusing on worship","It treats Timothy''s task as merely administrative"]'::jsonb, 'It shows that guarding the church''s doctrine rests on the grace of Christ, the glory of God, and the seriousness of the pastoral task', 'Paul moves from false teaching and lawful doctrine to mercy in Christ, praise to God, and then Timothy''s charge, creating a coherent pastoral theology of ministry (1 Timothy 1:3-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s chapter-long movement from warning to testimony to doxology to charge so effective?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 1, 5, 'What larger theological contrast shapes 1 Timothy 1?', '["Fruitless speculation and blasphemy are set against gospel truth, mercy, and faithful stewardship","Law and gospel are merged into one indistinguishable message","Only personal morality matters, not teaching","Paul contrasts Jews and Gentiles without reference to Christ"]'::jsonb, 'Fruitless speculation and blasphemy are set against gospel truth, mercy, and faithful stewardship', 'The chapter contrasts myths, vain talk, misuse of the law, and blasphemy with the glorious gospel, Christ''s mercy, and Timothy''s faithful charge (1 Timothy 1:3-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological contrast shapes 1 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 1, 'According to 1 Timothy 2, for whom should prayers be made?', '["All men","Only the apostles","Only the poor","Only Israel"]'::jsonb, 'All men', 'Paul urges that petitions, prayers, intercessions, and thanksgivings be made for all men (1 Timothy 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 2, for whom should prayers be made?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 1, 'According to 1 Timothy 2, for whom specifically should believers pray among public authorities?', '["Kings and all in high places","Only Jewish rulers","Only local magistrates in Ephesus","No civil rulers at all"]'::jsonb, 'Kings and all in high places', 'Paul specifically names kings and all who are in high places (1 Timothy 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 2, for whom specifically should believers pray among public authorities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 1, 'According to 1 Timothy 2, how many Gods are there?', '["One","Two","Many","Paul does not say"]'::jsonb, 'One', 'Paul says there is one God (1 Timothy 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 2, how many Gods are there?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 1, 'According to 1 Timothy 2, who is the one mediator between God and men?', '["The man Christ Jesus","Moses","Timothy","An angel"]'::jsonb, 'The man Christ Jesus', 'Paul says there is one mediator between God and men, the man Christ Jesus (1 Timothy 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 2, who is the one mediator between God and men?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 1, 'According to 1 Timothy 2, what did Christ Jesus give himself as?', '["A ransom for all","A king over Rome","A priest in the temple","A teacher only"]'::jsonb, 'A ransom for all', 'Christ Jesus gave himself as a ransom for all (1 Timothy 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 2, what did Christ Jesus give himself as?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 1, 'According to 1 Timothy 2, what should men do in every place?', '["Pray, lifting up holy hands","Debate endlessly","Remain silent always","Offer sacrifices"]'::jsonb, 'Pray, lifting up holy hands', 'Paul desires that the men pray in every place, lifting up holy hands without wrath and doubting (1 Timothy 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 2, what should men do in every place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 1, 'According to 1 Timothy 2, how should women adorn themselves?', '["In modest apparel with propriety and self-control","In costly crowns","In garments of kings","In military dress"]'::jsonb, 'In modest apparel with propriety and self-control', 'Paul says women should adorn themselves in modest clothing, with propriety and self-control (1 Timothy 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 2, how should women adorn themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 2, 'Why does Paul say believers should pray for rulers in 1 Timothy 2?', '["So they may lead a tranquil and quiet life in all godliness and reverence","So rulers will all become apostles","So Christians can avoid all work","So Rome will collapse"]'::jsonb, 'So they may lead a tranquil and quiet life in all godliness and reverence', 'Paul gives this reason for praying for kings and all in high places (1 Timothy 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul say believers should pray for rulers in 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 2, 'What does God desire according to 1 Timothy 2?', '["That all men be saved and come to the knowledge of the truth","That only rulers be saved","That no one ask questions","That believers withdraw from society"]'::jsonb, 'That all men be saved and come to the knowledge of the truth', 'Paul says God our Savior desires all men to be saved and to come to the knowledge of the truth (1 Timothy 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does God desire according to 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 2, 'What was Paul appointed to be according to 1 Timothy 2?', '["A preacher, apostle, and teacher of the Gentiles","A high priest in Jerusalem","A Roman governor","A judge over the churches"]'::jsonb, 'A preacher, apostle, and teacher of the Gentiles', 'Paul says he was appointed a preacher and an apostle, a teacher of the Gentiles in faith and truth (1 Timothy 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was Paul appointed to be according to 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 2, 'Without what should men pray according to 1 Timothy 2?', '["Wrath and disputing","Hands and voices","Faith and hope","Teaching and truth"]'::jsonb, 'Wrath and disputing', 'Paul says men should pray without wrath and disputing (1 Timothy 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Without what should men pray according to 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 2, 'With what does Paul say women should adorn themselves rather than elaborate external display?', '["Good works","Political influence","Temple lineage","Public debate"]'::jsonb, 'Good works', 'Paul says this is proper for women professing godliness: to adorn themselves with good works (1 Timothy 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'With what does Paul say women should adorn themselves rather than elaborate external display?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 2, 'How should a woman learn according to 1 Timothy 2?', '["In quietness with all submission","Only through visions","By public debate with rulers","Through endless genealogies"]'::jsonb, 'In quietness with all submission', 'Paul says a woman should learn in quietness with all submission (1 Timothy 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should a woman learn according to 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 2, 'What order from Genesis does Paul mention in 1 Timothy 2?', '["Adam was formed first, then Eve","Eve was formed first, then Adam","Both were formed together","Paul does not mention creation order"]'::jsonb, 'Adam was formed first, then Eve', 'Paul says Adam was first formed, then Eve (1 Timothy 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What order from Genesis does Paul mention in 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 3, 'Why does Paul connect prayer for rulers with the church''s life in 1 Timothy 2?', '["Public peace serves the church''s calling to godly life and broad witness","Rulers are automatically saved by prayer","The church''s only task is politics","Prayer is meant to secure wealth"]'::jsonb, 'Public peace serves the church''s calling to godly life and broad witness', 'Paul links prayer for rulers with a tranquil life in godliness and then grounds it in God''s saving desire for all people (1 Timothy 2:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect prayer for rulers with the church''s life in 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 3, 'What does the one mediator language teach in 1 Timothy 2?', '["Access to God is centered uniquely in Christ Jesus","Many mediators share God''s work equally","Prayer to rulers replaces prayer to God","Paul is speaking only of ethnic Israel"]'::jsonb, 'Access to God is centered uniquely in Christ Jesus', 'Paul grounds prayer and salvation in the reality that there is one God and one mediator between God and men, the man Christ Jesus (1 Timothy 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the one mediator language teach in 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 3, 'Why does Paul emphasize Christ''s ransom for all in this context?', '["Because the church''s prayers and mission should reflect the wide saving scope of God''s purpose","Because all are automatically saved regardless of truth","Because rulers need no prayer","Because salvation comes apart from Christ''s death"]'::jsonb, 'Because the church''s prayers and mission should reflect the wide saving scope of God''s purpose', 'The ransom language supports prayer for all and God''s desire that all be saved and know the truth (1 Timothy 2:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize Christ''s ransom for all in this context?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 3, 'How do holiness and worship connect in 1 Timothy 2?', '["Prayer and outward conduct are tied to moral purity rather than mere ritual form","Worship is unrelated to daily life","External appearance is all that matters","Only leaders are called to holiness"]'::jsonb, 'Prayer and outward conduct are tied to moral purity rather than mere ritual form', 'Paul speaks of holy hands in prayer and of modest adornment joined to good works, linking worship and godly life (1 Timothy 2:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How do holiness and worship connect in 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 3, 'What does Paul''s teaching about adornment suggest about godliness?', '["Godliness is displayed more truly in character and deeds than in external luxury","External beauty is sinful in itself","Good works are optional if clothing is modest","Paul cares only about social class"]'::jsonb, 'Godliness is displayed more truly in character and deeds than in external luxury', 'Paul contrasts elaborate display with modesty and good works proper for those professing godliness (1 Timothy 2:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s teaching about adornment suggest about godliness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 3, 'Why does Paul mention Adam and Eve in 1 Timothy 2?', '["He roots his instruction in creation and fall order rather than local custom alone","He is retelling Genesis only for history''s sake","He means Eve was more valuable than Adam","He is denying salvation to women"]'::jsonb, 'He roots his instruction in creation and fall order rather than local custom alone', 'Paul appeals to Adam being formed first and Eve being deceived, grounding his reasoning in Genesis rather than temporary social preference (1 Timothy 2:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention Adam and Eve in 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 3, 'What is the effect of placing Paul''s appointment to the Gentiles in this chapter?', '["It reinforces the universal reach of prayer, salvation, and Christ''s mediating work","It narrows the message to Israel alone","It shifts away from gospel themes","It proves public office is the church''s highest goal"]'::jsonb, 'It reinforces the universal reach of prayer, salvation, and Christ''s mediating work', 'Paul''s appointment as preacher and teacher of the Gentiles fits the chapter''s emphasis on prayer for all and Christ''s ransom for all (1 Timothy 2:1-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the effect of placing Paul''s appointment to the Gentiles in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 4, 'How does 1 Timothy 2 connect worship and mission?', '["The church''s prayer life reflects and participates in God''s saving purpose for all kinds of people","Prayer is inward only and unrelated to the world","Mission makes worship unnecessary","Public witness depends only on political strength"]'::jsonb, 'The church''s prayer life reflects and participates in God''s saving purpose for all kinds of people', 'Paul commands prayer for all, including rulers, and grounds it in God''s desire for all to be saved and Christ''s ransom for all (1 Timothy 2:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 2 connect worship and mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 4, 'Why is the one God and one mediator statement central to the chapter?', '["It gives theological grounding for universal prayer and universal gospel proclamation","It limits prayer to one ethnic group","It argues against prayer altogether","It concerns philosophy more than salvation"]'::jsonb, 'It gives theological grounding for universal prayer and universal gospel proclamation', 'Because there is one God and one mediator, the church''s prayer and witness reach outward to all rather than remaining tribal or exclusive (1 Timothy 2:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the one God and one mediator statement central to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 4, 'What kind of public presence for the church does 1 Timothy 2 envision?', '["A peaceable, reverent, praying community whose life commends the truth","A violent political movement","A hidden sect unconcerned with society","A community built on outward display"]'::jsonb, 'A peaceable, reverent, praying community whose life commends the truth', 'Paul wants prayer for rulers so believers may live tranquilly in godliness and reverence, while worship and conduct reflect the gospel''s truth (1 Timothy 2:2, 8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of public presence for the church does 1 Timothy 2 envision?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 4, 'How does 1 Timothy 2 treat the relationship between inward devotion and outward appearance?', '["Outward presentation should be governed by inward godliness expressed in modesty and good works","Outward appearance is spiritually irrelevant","Only appearance matters to God","Paul values luxury as evidence of blessing"]'::jsonb, 'Outward presentation should be governed by inward godliness expressed in modesty and good works', 'Paul''s contrast between elaborate adornment and modesty with good works shows that outward life should reflect inward godliness (1 Timothy 2:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 2 treat the relationship between inward devotion and outward appearance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 4, 'Why does Paul link his own Gentile ministry to Christ''s ransom for all?', '["His ministry is the appointed means by which the universal scope of Christ''s work is proclaimed","He is defending a private mission unrelated to the church","He is limiting salvation to Gentiles only","He is claiming higher rank than Christ"]'::jsonb, 'His ministry is the appointed means by which the universal scope of Christ''s work is proclaimed', 'Paul presents his own appointment as preacher, apostle, and teacher of the Gentiles immediately after speaking of Christ''s ransom for all (1 Timothy 2:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul link his own Gentile ministry to Christ''s ransom for all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 4, 'What larger concern about church order appears in this chapter?', '["Paul wants gathered worship and community life to reflect creation, redemption, and godliness rather than confusion","Order exists only for civic reputation","The chapter is unconcerned with worship setting","Church order matters only to elders"]'::jsonb, 'Paul wants gathered worship and community life to reflect creation, redemption, and godliness rather than confusion', 'Paul addresses prayer, public demeanor, modesty, learning, and teaching in a way grounded in theology and aimed at ordered godliness in the church (1 Timothy 2:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger concern about church order appears in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 4, 'How does chapter 2 resist making salvation merely private?', '["It ties salvation in Christ to public prayer, social peace, and church witness among all kinds of people","It restricts faith to inward feeling only","It disconnects salvation from public life","It says only rulers matter in God''s plan"]'::jsonb, 'It ties salvation in Christ to public prayer, social peace, and church witness among all kinds of people', 'The chapter begins with prayer for all, including rulers, and grounds this in God''s saving desire and Christ''s mediating work for all (1 Timothy 2:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does chapter 2 resist making salvation merely private?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 5, 'How does 1 Timothy 2 present the church as a priestly, interceding people?', '["The church is called to offer broad prayer for all kinds of people because Christ mediates between God and humanity","Prayer is limited to private needs only","Only apostles may intercede for rulers","Intercession is replaced by civil activism"]'::jsonb, 'The church is called to offer broad prayer for all kinds of people because Christ mediates between God and humanity', 'Paul''s universal call to prayer is grounded in the one God, one mediator, and Christ''s ransom for all, giving the church an intercessory vocation (1 Timothy 2:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 2 present the church as a priestly, interceding people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 5, 'Why is Christ''s humanity explicit in the phrase ''the man Christ Jesus'' in this chapter?', '["Paul emphasizes Christ''s suitability as mediator who truly stands between God and humanity","Paul is denying Christ''s divinity","The phrase serves only poetic rhythm","It means Christ mediates only for men and not women"]'::jsonb, 'Paul emphasizes Christ''s suitability as mediator who truly stands between God and humanity', 'In a passage on mediation and ransom, Paul''s wording stresses Christ''s representative role between God and human beings (1 Timothy 2:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Christ''s humanity explicit in the phrase ''the man Christ Jesus'' in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 5, 'How does 1 Timothy 2 confront both spiritual elitism and social tribalism?', '["It expands prayer, salvation, and gospel witness beyond narrow groups because God and Christ are one for all","It limits concern to the church''s inner circle","It makes rulers more savable than others","It teaches separate mediators for separate peoples"]'::jsonb, 'It expands prayer, salvation, and gospel witness beyond narrow groups because God and Christ are one for all', 'The chapter repeatedly stresses all men, one God, one mediator, and Christ''s ransom for all, undercutting narrow exclusivism (1 Timothy 2:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 2 confront both spiritual elitism and social tribalism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 5, 'What deeper theological logic links modesty, good works, and ordered learning in 1 Timothy 2?', '["The gathered church should visibly reflect redeemed humanity shaped by truth rather than status display or disorder","These instructions are unrelated practical rules only","Paul values outward display over inward holiness","Learning has no role in church life"]'::jsonb, 'The gathered church should visibly reflect redeemed humanity shaped by truth rather than status display or disorder', 'Paul''s directions on attire, good works, learning, and order all serve a vision of worship and community life consistent with godliness and truth (1 Timothy 2:8-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper theological logic links modesty, good works, and ordered learning in 1 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 5, 'How does chapter 2 integrate creation, redemption, and church practice?', '["Paul grounds church prayer and order in God''s saving purpose in Christ and in realities traced back to creation","Church practice is disconnected from theology","Only redemption matters, not creation","Creation alone determines salvation"]'::jsonb, 'Paul grounds church prayer and order in God''s saving purpose in Christ and in realities traced back to creation', 'The chapter moves from God''s saving desire and Christ''s mediation to instructions for worship and then appeals to Adam and Eve, joining redemption and creation in church life (1 Timothy 2:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 2 integrate creation, redemption, and church practice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 5, 'Why is the chapter''s broad prayer horizon important in a pastoral letter about church order?', '["It shows that healthy church order is not inward-curved but outward-facing toward God''s mission in the world","Church order exists only for private harmony","Prayer distracts from pastoral oversight","Public life is outside God''s concern"]'::jsonb, 'It shows that healthy church order is not inward-curved but outward-facing toward God''s mission in the world', 'Paul''s instructions about ordered worship begin with prayer for all people, including rulers, because the church''s life is bound to God''s saving concern for the world (1 Timothy 2:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the chapter''s broad prayer horizon important in a pastoral letter about church order?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 2, 5, 'What is the significance of ending the chapter with perseverance in faith, love, and holiness?', '["Paul frames Christian life as ongoing steadfastness in virtue rather than momentary spiritual display","He abandons the chapter''s earlier themes entirely","Faith and holiness matter only for women in Ephesus","He is replacing the gospel with moralism"]'::jsonb, 'Paul frames Christian life as ongoing steadfastness in virtue rather than momentary spiritual display', 'The chapter''s final emphasis on continuing in faith, love, holiness, and self-control highlights persevering godliness as central to Christian life (1 Timothy 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of ending the chapter with perseverance in faith, love, and holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 1, 'According to 1 Timothy 3, what is it if a man seeks the office of an overseer?', '["A good work","A dangerous ambition","A royal privilege","An impossible calling"]'::jsonb, 'A good work', 'Paul says if a man seeks the office of an overseer, he desires a good work (1 Timothy 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 3, what is it if a man seeks the office of an overseer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 1, 'According to 1 Timothy 3, how many wives should an overseer be the husband of?', '["One","Two","As many as he can support","Paul does not say"]'::jsonb, 'One', 'An overseer must be the husband of one wife (1 Timothy 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 3, how many wives should an overseer be the husband of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 1, 'According to 1 Timothy 3, what must an overseer be able to do?', '["Teach","Speak foreign languages","Lead armies","Interpret dreams"]'::jsonb, 'Teach', 'Paul lists being able to teach among the qualifications for an overseer (1 Timothy 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 3, what must an overseer be able to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 1, 'According to 1 Timothy 3, what should an overseer not be?', '["A drunkard","Hospitable","Gentle","Respectable"]'::jsonb, 'A drunkard', 'Paul says an overseer must not be a drunkard (1 Timothy 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 3, what should an overseer not be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 1, 'According to 1 Timothy 3, what must an overseer manage well?', '["His own house","The Roman treasury","The synagogue school","A trade guild"]'::jsonb, 'His own house', 'An overseer must manage his own house well, keeping his children in submission with all reverence (1 Timothy 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 3, what must an overseer manage well?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 1, 'According to 1 Timothy 3, what must deacons hold?', '["The mystery of the faith in a pure conscience","The sword of Rome","The priestly garments","The keys of the temple"]'::jsonb, 'The mystery of the faith in a pure conscience', 'Paul says deacons must hold the mystery of the faith in a pure conscience (1 Timothy 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 3, what must deacons hold?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 1, 'According to 1 Timothy 3, what is the church called?', '["The pillar and ground of the truth","The new temple of Herod","The throne of David","The school of prophets"]'::jsonb, 'The pillar and ground of the truth', 'Paul calls the assembly of the living God the pillar and ground of the truth (1 Timothy 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 3, what is the church called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 2, 'Why does Paul say an overseer must not be a new convert?', '["Lest he become conceited and fall into the devil''s condemnation","Because only old men can serve","Because new converts cannot pray","Because new converts cannot be taught"]'::jsonb, 'Lest he become conceited and fall into the devil''s condemnation', 'Paul warns against appointing a new convert lest he become puffed up and fall into condemnation (1 Timothy 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul say an overseer must not be a new convert?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 2, 'What kind of reputation should an overseer have with outsiders according to 1 Timothy 3?', '["A good testimony","A feared reputation","A wealthy reputation","A scholarly reputation only"]'::jsonb, 'A good testimony', 'Paul says he must also have good testimony from those who are outside (1 Timothy 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of reputation should an overseer have with outsiders according to 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 2, 'What must happen to deacons before they serve according to 1 Timothy 3?', '["They must first be tested","They must become overseers first","They must travel with Paul","They must memorize the whole law"]'::jsonb, 'They must first be tested', 'Paul says let these also first be tested; then let them serve as deacons if they are blameless (1 Timothy 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What must happen to deacons before they serve according to 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 2, 'How should deacons'' wives or women similarly serve according to 1 Timothy 3?', '["They should be reverent, not slanderers, temperate, and faithful","They should rule the church","They should avoid all work","They should seek public honor"]'::jsonb, 'They should be reverent, not slanderers, temperate, and faithful', 'Paul says women likewise must be reverent, not slanderers, temperate, faithful in all things (1 Timothy 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should deacons'' wives or women similarly serve according to 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 2, 'What do deacons gain by serving well according to 1 Timothy 3?', '["A good standing and great boldness in the faith","Political influence","Automatic promotion to overseer","Freedom from all testing"]'::jsonb, 'A good standing and great boldness in the faith', 'Those who have served well as deacons gain for themselves a good standing and great boldness in the faith in Christ Jesus (1 Timothy 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What do deacons gain by serving well according to 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 2, 'Why is Paul writing these things according to 1 Timothy 3?', '["So Timothy will know how people ought to behave in God''s house","So Timothy can leave Ephesus at once","So the church will seek Roman approval","So all believers become deacons"]'::jsonb, 'So Timothy will know how people ought to behave in God''s house', 'Paul writes so Timothy may know how men ought to behave in the house of God (1 Timothy 3:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why is Paul writing these things according to 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 2, 'What does Paul call the mystery of godliness in 1 Timothy 3?', '["Great","Hidden and unknowable","Temporary","A matter of genealogies"]'::jsonb, 'Great', 'Paul says, without controversy, great is the mystery of godliness (1 Timothy 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul call the mystery of godliness in 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 3, 'Why does Paul stress household management for overseers and deacons in 1 Timothy 3?', '["Faithfulness in close daily relationships reveals readiness for wider church responsibility","Family life is irrelevant to church leadership","Only public speaking qualifies a leader","Paul values social status above character"]'::jsonb, 'Faithfulness in close daily relationships reveals readiness for wider church responsibility', 'Paul argues from managing one''s own house to caring for the assembly of God, showing the connection between household faithfulness and church oversight (1 Timothy 3:4-5, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul stress household management for overseers and deacons in 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 3, 'What does 1 Timothy 3 suggest about leadership in the church?', '["Leadership is fundamentally a matter of tested character and doctrinal integrity","Leadership depends mainly on charisma","Wealth is the chief qualification","Public power outweighs private conduct"]'::jsonb, 'Leadership is fundamentally a matter of tested character and doctrinal integrity', 'Paul''s qualifications focus on sobriety, self-control, family life, reputation, tested faithfulness, and holding the faith with a pure conscience (1 Timothy 3:1-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Timothy 3 suggest about leadership in the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 3, 'Why is being able to teach included among overseer qualifications?', '["Church oversight includes guarding and communicating the truth, not merely administration","Teaching is optional for overseers","Only deacons need doctrine","Paul is speaking only of private tutoring"]'::jsonb, 'Church oversight includes guarding and communicating the truth, not merely administration', 'The chapter joins character with the ability to teach, indicating that oversight includes doctrinal responsibility in the household of God (1 Timothy 3:2, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is being able to teach included among overseer qualifications?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 3, 'What is the significance of the church being called the pillar and ground of the truth?', '["The church is entrusted to uphold and display God''s truth in the world","The church creates truth on its own","Truth exists apart from the church''s witness","Only leaders, not the church, matter for truth"]'::jsonb, 'The church is entrusted to uphold and display God''s truth in the world', 'Paul''s image of pillar and ground presents the church as supporting and bearing witness to the truth it has received (1 Timothy 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the church being called the pillar and ground of the truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 3, 'Why is a good reputation with outsiders important in 1 Timothy 3?', '["Church leaders must not bring reproach on the gospel before the watching world","Outsiders should decide doctrine","Public approval is more important than truth","Only unbelievers can test a leader"]'::jsonb, 'Church leaders must not bring reproach on the gospel before the watching world', 'Paul links a good testimony from outsiders with avoiding reproach and the devil''s snare (1 Timothy 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is a good reputation with outsiders important in 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 3, 'How does the mystery of godliness hymn function in the chapter?', '["It grounds church order in the person and work of Christ","It replaces all leadership qualifications","It serves only as liturgical ornament","It shifts attention away from truth"]'::jsonb, 'It grounds church order in the person and work of Christ', 'After speaking of the church as the pillar of truth, Paul summarizes the mystery of godliness in a Christ-centered confession, anchoring conduct and order in Christ himself (1 Timothy 3:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the mystery of godliness hymn function in the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 3, 'What does testing deacons before service imply about ministry?', '["Ministry should be entrusted to proven, not merely eager, servants","Desire alone is enough for office","Testing belongs only to overseers","Paul opposes all new servants"]'::jsonb, 'Ministry should be entrusted to proven, not merely eager, servants', 'Paul says deacons should first be tested and then serve if found blameless, showing the value of proven character (1 Timothy 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does testing deacons before service imply about ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 4, 'How does 1 Timothy 3 join the visible structure of the church with the invisible reality of the gospel?', '["Leadership qualifications serve the church''s calling to uphold the truth centered in Christ","Structure replaces the gospel","The gospel makes leadership unnecessary","Truth is unrelated to church order"]'::jsonb, 'Leadership qualifications serve the church''s calling to uphold the truth centered in Christ', 'Paul moves from overseer and deacon qualifications to the church as pillar of truth and then to the mystery of godliness focused on Christ (1 Timothy 3:1-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 3 join the visible structure of the church with the invisible reality of the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 4, 'Why are so many leadership qualifications negative as well as positive in 1 Timothy 3?', '["Leaders must be protected not only from moral failure but from traits that distort the church''s witness","Paul has no positive vision for leaders","Only sin avoidance matters, not virtue","The church is mainly a disciplinary institution"]'::jsonb, 'Leaders must be protected not only from moral failure but from traits that distort the church''s witness', 'Paul combines positive virtues like hospitality and gentleness with warnings against drunkenness, violence, greed, and conceit to shape credible leadership (1 Timothy 3:2-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why are so many leadership qualifications negative as well as positive in 1 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 4, 'What kind of church culture is implied by Paul''s qualifications for deacons?', '["One where service, integrity, and tested faithfulness are honored as essential ministries","Only public teachers matter in the church","Service roles are spiritually secondary","Character is less important for practical ministry"]'::jsonb, 'One where service, integrity, and tested faithfulness are honored as essential ministries', 'Paul gives careful qualifications for deacons, showing that service roles are weighty and spiritually significant in the church''s life (1 Timothy 3:8-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of church culture is implied by Paul''s qualifications for deacons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 4, 'How does 1 Timothy 3 portray the household of God?', '["As a living community whose conduct must fit the truth it confesses","As merely an institution of rules","As unrelated to daily behavior","As a hidden mystical idea only"]'::jsonb, 'As a living community whose conduct must fit the truth it confesses', 'Paul writes so Timothy may know how to behave in God''s house, the assembly of the living God, the pillar and ground of the truth (1 Timothy 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 3 portray the household of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 4, 'Why is conceit especially dangerous in a new convert appointed to oversight?', '["Spiritual pride can place a leader in the same kind of downfall associated with the devil","Conceit only harms public speaking ability","New converts are automatically less saved","Paul opposes all growth in leadership"]'::jsonb, 'Spiritual pride can place a leader in the same kind of downfall associated with the devil', 'Paul warns that a novice may become puffed up and fall into the same condemnation associated with the devil (1 Timothy 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is conceit especially dangerous in a new convert appointed to oversight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 4, 'What is the significance of the Christ confession following discussion of church offices?', '["Church order exists to serve and display the truth about Christ, not to become an end in itself","Paul changes to an unrelated hymn topic","The confession replaces the need for leaders","It means doctrine only matters after structure is fixed"]'::jsonb, 'Church order exists to serve and display the truth about Christ, not to become an end in itself', 'The chapter climaxes not in offices themselves but in a confession of Christ''s manifestation, vindication, proclamation, belief, and glory (1 Timothy 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of the Christ confession following discussion of church offices?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 4, 'How does this chapter address the relation between private life and public ministry?', '["Private life is inseparable from public ministry because hidden habits shape public faithfulness","Private life has no bearing on leadership","Only public gifting matters","Paul allows a split between home and church character"]'::jsonb, 'Private life is inseparable from public ministry because hidden habits shape public faithfulness', 'Paul repeatedly roots church leadership in sober self-control, home life, family management, and tested character, showing private life feeds public ministry (1 Timothy 3:2-5, 10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this chapter address the relation between private life and public ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 5, 'How does 1 Timothy 3 challenge modern assumptions that leadership is mostly about talent?', '["It insists that character, tested faithfulness, and ordered life are more foundational than giftedness alone","It dismisses teaching ability as irrelevant","It teaches charisma is enough if results are good","It values external success over holiness"]'::jsonb, 'It insists that character, tested faithfulness, and ordered life are more foundational than giftedness alone', 'Paul''s emphasis falls overwhelmingly on moral and relational qualifications, with teaching ability included within a wider framework of faithful character (1 Timothy 3:1-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 3 challenge modern assumptions that leadership is mostly about talent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 5, 'Why is the church called the pillar and ground of the truth a weighty ecclesiological claim?', '["It means the church bears public responsibility to uphold, protect, and display God''s revealed truth","It means the church invents truth for itself","It restricts truth to leaders only","It reduces the church to a political institution"]'::jsonb, 'It means the church bears public responsibility to uphold, protect, and display God''s revealed truth', 'Paul identifies the church as the place where the truth is upheld and displayed, which is why its conduct and leadership matter so much (1 Timothy 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the church called the pillar and ground of the truth a weighty ecclesiological claim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 5, 'How does the mystery of godliness confession keep the church from becoming merely managerial?', '["It roots the church''s order in the redemptive revelation and exaltation of Christ rather than in administration alone","It turns the chapter away from theology entirely","It says structure is unnecessary once a hymn is sung","It limits godliness to private mysticism"]'::jsonb, 'It roots the church''s order in the redemptive revelation and exaltation of Christ rather than in administration alone', 'The confession centers on Christ''s incarnation, vindication, proclamation, faith reception, and glory, making clear that church order serves gospel reality (1 Timothy 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the mystery of godliness confession keep the church from becoming merely managerial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 5, 'What does 1 Timothy 3 imply about the relationship between doctrine and institution?', '["The church''s institutional life must be shaped to protect and embody the truth it confesses","Institutions matter more than doctrine","Doctrine and structure are unrelated","Truth is protected best by informal chaos"]'::jsonb, 'The church''s institutional life must be shaped to protect and embody the truth it confesses', 'Paul gives ordered qualifications so that God''s household may function in a way worthy of being the pillar of the truth about Christ (1 Timothy 3:1-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 Timothy 3 imply about the relationship between doctrine and institution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 5, 'Why does Paul treat both overseers and deacons as spiritually weighty offices?', '["Because the whole church''s witness depends on faithful governance and faithful service alike","Because deacons are future overseers by definition","Because service roles are mostly symbolic","Because only hierarchy matters in Paul''s vision"]'::jsonb, 'Because the whole church''s witness depends on faithful governance and faithful service alike', 'Paul treats both offices carefully because the conduct of leaders and servants affects the life of God''s household and its witness to the truth (1 Timothy 3:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul treat both overseers and deacons as spiritually weighty offices?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 5, 'How does chapter 3 present leadership as Christ-shaped rather than status-shaped?', '["Its qualifications emphasize sobriety, gentleness, faithfulness, and truth rather than prestige or domination","It rewards aggressive ambition and public power","It prizes wealth and influence as signs of calling","It ignores the cross-shaped pattern of service"]'::jsonb, 'Its qualifications emphasize sobriety, gentleness, faithfulness, and truth rather than prestige or domination', 'Paul''s qualifications consistently resist violent, greedy, arrogant, or status-driven patterns, favoring traits fitting service in God''s household under Christ (1 Timothy 3:2-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 3 present leadership as Christ-shaped rather than status-shaped?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 3, 5, 'What larger theological vision is implied by moving from church qualifications to Christ''s cosmic confession?', '["The ordered local church participates in and bears witness to the worldwide and heavenly significance of Christ","Local church life is disconnected from the gospel''s global meaning","Leadership matters only for internal administration","Paul abandons local concerns for abstract poetry"]'::jsonb, 'The ordered local church participates in and bears witness to the worldwide and heavenly significance of Christ', 'The chapter moves from local church offices to a confession of Christ proclaimed among the nations and received in the world, linking local order with universal gospel reality (1 Timothy 3:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theological vision is implied by moving from church qualifications to Christ''s cosmic confession?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 1, 'According to 1 Timothy 4, what does the Spirit expressly say will happen in later times?', '["Some will fall away from the faith","All rulers will repent","The temple will be restored","There will be no more false teaching"]'::jsonb, 'Some will fall away from the faith', 'The Spirit expressly says that in later times some will fall away from the faith (1 Timothy 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 4, what does the Spirit expressly say will happen in later times?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 1, 'According to 1 Timothy 4, to what will some give heed?', '["Deceiving spirits and doctrines of demons","The prophets and apostles","Psalms and hymns","The law and temple sacrifices"]'::jsonb, 'Deceiving spirits and doctrines of demons', 'Paul says some will give heed to deceiving spirits and doctrines of demons (1 Timothy 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 4, to what will some give heed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 1, 'According to 1 Timothy 4, what did some forbid?', '["Marriage","Prayer","Teaching","Baptism"]'::jsonb, 'Marriage', 'Paul says these false teachers forbid marriage (1 Timothy 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 4, what did some forbid?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 1, 'According to 1 Timothy 4, what is to be rejected if received with thanksgiving?', '["Nothing created by God","All bodily exercise","All wealth","All traditions"]'::jsonb, 'Nothing created by God', 'Every creature of God is good, and nothing is to be rejected if it is received with thanksgiving (1 Timothy 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 4, what is to be rejected if received with thanksgiving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 1, 'According to 1 Timothy 4, for what is bodily exercise profitable?', '["A little","Everything","Nothing","Only salvation"]'::jsonb, 'A little', 'Paul says bodily exercise has some profit, but godliness is profitable for all things (1 Timothy 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 4, for what is bodily exercise profitable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 1, 'According to 1 Timothy 4, for what is godliness profitable?', '["All things","Physical strength only","Public honor only","Future life only"]'::jsonb, 'All things', 'Godliness is profitable for all things, having promise of the life which now is and of that which is to come (1 Timothy 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 4, for what is godliness profitable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 1, 'According to 1 Timothy 4, what should no one despise in Timothy?', '["His youth","His teaching","His prayers","His travel plans"]'::jsonb, 'His youth', 'Paul says, ''Let no man despise your youth'' (1 Timothy 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 4, what should no one despise in Timothy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 2, 'How are created things sanctified according to 1 Timothy 4?', '["By the word of God and prayer","By temple sacrifice","By priestly lineage","By Roman law"]'::jsonb, 'By the word of God and prayer', 'Paul says they are sanctified through the word of God and prayer (1 Timothy 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How are created things sanctified according to 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 2, 'What kind of myths should Timothy refuse according to 1 Timothy 4?', '["Profane and old wives'' fables","The psalms of David","The parables of Jesus","The promises to Abraham"]'::jsonb, 'Profane and old wives'' fables', 'Paul tells Timothy to refuse profane and old wives'' fables (1 Timothy 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of myths should Timothy refuse according to 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 2, 'For what should Timothy exercise himself in 1 Timothy 4?', '["Godliness","Political speech","Military skill","Philosophical debate"]'::jsonb, 'Godliness', 'Paul says, exercise yourself toward godliness (1 Timothy 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'For what should Timothy exercise himself in 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 2, 'In whom does Paul say they have hoped according to 1 Timothy 4?', '["The living God","The law of Moses","The rulers of the age","Their own discipline"]'::jsonb, 'The living God', 'Paul says they have their hope set on the living God (1 Timothy 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In whom does Paul say they have hoped according to 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 2, 'What public ministries should Timothy devote himself to until Paul comes?', '["Reading, exhortation, and teaching","Healing, travel, and fundraising","Silence, fasting, and retreat","Politics, writing, and trade"]'::jsonb, 'Reading, exhortation, and teaching', 'Paul tells Timothy to devote himself to public reading, exhortation, and teaching (1 Timothy 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What public ministries should Timothy devote himself to until Paul comes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 2, 'What should Timothy not neglect in 1 Timothy 4?', '["The gift that is in him","His Roman rights","His family trade","His private wealth"]'::jsonb, 'The gift that is in him', 'Paul tells Timothy not to neglect the gift that was given him through prophecy with the laying on of the hands of the eldership (1 Timothy 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should Timothy not neglect in 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 2, 'What will Timothy save by taking heed to himself and the teaching?', '["Both himself and those who hear him","Only his own reputation","Only the elders","Only the false teachers"]'::jsonb, 'Both himself and those who hear him', 'Paul says by doing this Timothy will save both himself and those who hear him (1 Timothy 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What will Timothy save by taking heed to himself and the teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 3, 'Why does Paul reject ascetic commands about foods and marriage in 1 Timothy 4?', '["They deny the goodness of God''s creation when received rightly with thanksgiving","They make people too spiritual","They are harmless private preferences","They are required by the gospel"]'::jsonb, 'They deny the goodness of God''s creation when received rightly with thanksgiving', 'Paul opposes these teachings because God created such things to be received with thanksgiving, and every creature of God is good (1 Timothy 4:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul reject ascetic commands about foods and marriage in 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 3, 'What does 1 Timothy 4 imply about false spirituality?', '["It can look strict and serious while actually contradicting God''s good creation","It always rejects doctrine entirely","It is better than thanksgiving","It is harmless if sincere"]'::jsonb, 'It can look strict and serious while actually contradicting God''s good creation', 'Paul identifies teachings forbidding marriage and foods as demonic deception because they oppose God''s created gifts received with thanksgiving (1 Timothy 4:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Timothy 4 imply about false spirituality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 3, 'Why does Paul compare bodily exercise and godliness in 1 Timothy 4?', '["He acknowledges limited physical benefit while stressing the comprehensive value of godliness","He denies any value in the body","He teaches athletes cannot be godly","He says bodily training is the path to salvation"]'::jsonb, 'He acknowledges limited physical benefit while stressing the comprehensive value of godliness', 'Paul says bodily exercise profits a little, but godliness profits for all things, both now and in the life to come (1 Timothy 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul compare bodily exercise and godliness in 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 3, 'What does Timothy''s youth have to do with ministry in 1 Timothy 4?', '["Youth is not a barrier if Timothy shows an exemplary life and faithful teaching","Young ministers should avoid teaching entirely","Paul tells Timothy to hide from public ministry","Age alone guarantees authority"]'::jsonb, 'Youth is not a barrier if Timothy shows an exemplary life and faithful teaching', 'Paul counters possible contempt for Timothy''s youth by telling him to be an example in speech, conduct, love, faith, and purity (1 Timothy 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Timothy''s youth have to do with ministry in 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 3, 'How does 1 Timothy 4 define a good servant of Christ Jesus?', '["One nourished in the words of the faith and good doctrine while warning others","One who avoids all correction","One who seeks public honor first","One who relies on age and position alone"]'::jsonb, 'One nourished in the words of the faith and good doctrine while warning others', 'Paul says Timothy will be a good servant by reminding the brothers of these things and being nourished in faith and good doctrine (1 Timothy 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 1 Timothy 4 define a good servant of Christ Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 3, 'Why does Paul link hope in the living God with labor and striving?', '["Christian hope energizes persistent effort rather than passivity","Hope replaces the need for effort","Labor proves hope is uncertain","Only apostles should strive"]'::jsonb, 'Christian hope energizes persistent effort rather than passivity', 'Paul says they labor and strive because they have set their hope on the living God, showing hope drives perseverance (1 Timothy 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul link hope in the living God with labor and striving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 3, 'What does taking heed to teaching and life together imply in 1 Timothy 4?', '["Doctrine and personal conduct are inseparable in ministry fruitfulness","Teaching matters but conduct does not","Conduct matters but doctrine does not","Only private devotion saves hearers"]'::jsonb, 'Doctrine and personal conduct are inseparable in ministry fruitfulness', 'Paul tells Timothy to take heed to himself and to his teaching, showing both life and doctrine matter for salvation''s effect on self and hearers (1 Timothy 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does taking heed to teaching and life together imply in 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 4, 'How does 1 Timothy 4 contrast true and false godliness?', '["False godliness rejects God''s gifts, while true godliness receives them rightly and pursues holiness with gratitude","False godliness is more demanding and therefore superior","True godliness ignores the body entirely","Both forms are equally valid spiritual paths"]'::jsonb, 'False godliness rejects God''s gifts, while true godliness receives them rightly and pursues holiness with gratitude', 'Paul contrasts ascetic error about foods and marriage with thankful reception of God''s good creation and disciplined pursuit of godliness (1 Timothy 4:1-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 4 contrast true and false godliness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 4, 'What larger vision of ministry appears in Paul''s instructions to Timothy in chapter 4?', '["Ministry requires doctrinal clarity, personal example, public reading, and disciplined use of spiritual gifts","Ministry is mainly private mystical experience","Public teaching replaces personal holiness","Gifts matter more than perseverance"]'::jsonb, 'Ministry requires doctrinal clarity, personal example, public reading, and disciplined use of spiritual gifts', 'Paul combines teaching against error with exemplary conduct, public ministry, attention to giftedness, and perseverance (1 Timothy 4:6-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger vision of ministry appears in Paul''s instructions to Timothy in chapter 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 4, 'Why does Paul place thanksgiving at the center of his response to ascetic error?', '["Thanksgiving acknowledges God as Creator and receives his gifts in faith rather than suspicion","Thanksgiving makes discernment unnecessary","False teaching can be cured only by stricter rules","Gratitude is unrelated to doctrine"]'::jsonb, 'Thanksgiving acknowledges God as Creator and receives his gifts in faith rather than suspicion', 'Paul''s reply to the forbidding of foods and marriage emphasizes that God''s creatures are good and to be received with thanksgiving (1 Timothy 4:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul place thanksgiving at the center of his response to ascetic error?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 4, 'How does 1 Timothy 4 connect present discipline and future hope?', '["Exercise toward godliness is worthwhile because it bears promise for both the present life and the life to come","Future hope makes present discipline unnecessary","Present discipline matters only for physical health","Hope concerns only heaven and not current ministry"]'::jsonb, 'Exercise toward godliness is worthwhile because it bears promise for both the present life and the life to come', 'Paul explicitly says godliness holds promise for the life that now is and that which is to come (1 Timothy 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 4 connect present discipline and future hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 4, 'What does chapter 4 imply about the church''s relation to creation?', '["The church should honor God''s creation rightly rather than treating created gifts as spiritually suspect","The church should distrust all bodily and material realities","Creation is irrelevant once Christ comes","Only spiritual things can be holy"]'::jsonb, 'The church should honor God''s creation rightly rather than treating created gifts as spiritually suspect', 'Paul defends marriage and foods as created by God to be received with thanksgiving, rejecting anti-creation spirituality (1 Timothy 4:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does chapter 4 imply about the church''s relation to creation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 4, 'How does Paul''s word to Timothy about example and teaching resist personality-based ministry?', '["Authority is grounded in godly life and faithful truth rather than age, image, or force of personality","Youth can be overcome only by theatrical skill","Teaching is secondary to charisma","Public ministry needs no moral credibility"]'::jsonb, 'Authority is grounded in godly life and faithful truth rather than age, image, or force of personality', 'Paul answers possible contempt for Timothy''s youth not with self-assertion but with exemplary conduct, reading, exhortation, and teaching (1 Timothy 4:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s word to Timothy about example and teaching resist personality-based ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 4, 'Why does Paul tell Timothy to be absorbed in these things so that progress may be plain?', '["Ministry maturity should be visible through sustained attention and growth rather than neglect","Progress is mainly numerical growth","Paul wants Timothy to impress opponents","Visible progress makes doctrine unnecessary"]'::jsonb, 'Ministry maturity should be visible through sustained attention and growth rather than neglect', 'Paul tells Timothy to meditate on these things and give himself wholly to them so that his progress may be evident to all (1 Timothy 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul tell Timothy to be absorbed in these things so that progress may be plain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 5, 'How does 1 Timothy 4 challenge spiritualities that treat creation as the enemy of holiness?', '["It insists that God''s creation is good and that true holiness consists in rightly received gifts and disciplined godliness, not creation-denial","It teaches holiness requires rejecting all created pleasures","It says bodily life is outside God''s concern","It treats ascetic severity as the highest spirituality"]'::jsonb, 'It insists that God''s creation is good and that true holiness consists in rightly received gifts and disciplined godliness, not creation-denial', 'Paul rejects teachings forbidding marriage and foods while still calling for exercise toward godliness, holding creation and holiness together under God''s word (1 Timothy 4:1-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 4 challenge spiritualities that treat creation as the enemy of holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 5, 'Why is the phrase ''Savior of all men, especially of those who believe'' theologically weighty in this chapter?', '["It distinguishes the wide benevolent scope of God''s saving concern from the special saving benefit experienced by believers","It teaches all people are saved in exactly the same way","It means faith is optional","It limits God''s care to believers only"]'::jsonb, 'It distinguishes the wide benevolent scope of God''s saving concern from the special saving benefit experienced by believers', 'Paul places this line in a context of hope in the living God and persevering ministry, expressing a broad saving orientation with special reference to believers (1 Timothy 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''Savior of all men, especially of those who believe'' theologically weighty in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 5, 'How does chapter 4 unite theology, pastoral practice, and personal formation?', '["Timothy must resist false doctrine, honor God''s creation, cultivate godliness, use his gift, and persevere in teaching","Theology and practice are separated into different spheres","Personal formation matters less than public teaching","Only giftedness matters in pastoral ministry"]'::jsonb, 'Timothy must resist false doctrine, honor God''s creation, cultivate godliness, use his gift, and persevere in teaching', 'Paul''s instructions range from doctrinal warning to creation theology to disciplined ministry habits, forming a comprehensive picture of pastoral faithfulness (1 Timothy 4:1-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 4 unite theology, pastoral practice, and personal formation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 5, 'What does 1 Timothy 4 imply about the danger of false teaching for ordinary church life?', '["False teaching distorts everyday realities like marriage, food, and ministry, not just abstract theology","Its effects are limited to scholars","It matters only for future generations","It cannot touch church practice"]'::jsonb, 'False teaching distorts everyday realities like marriage, food, and ministry, not just abstract theology', 'Paul shows false doctrine affecting marriage and food while also calling Timothy to concrete habits of reading, teaching, and example (1 Timothy 4:1-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 1 Timothy 4 imply about the danger of false teaching for ordinary church life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 5, 'How does 1 Timothy 4 portray salvation as both present and future in ministerial perseverance?', '["Godliness has promise for the present and future, and Timothy''s perseverance serves the saving good of himself and his hearers","Salvation belongs only to the future","Present ministry has no saving significance","Perseverance matters only for leaders'' reputations"]'::jsonb, 'Godliness has promise for the present and future, and Timothy''s perseverance serves the saving good of himself and his hearers', 'Paul links godliness to present and future life and tells Timothy that perseverance in life and teaching will save himself and his hearers (1 Timothy 4:8, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 4 portray salvation as both present and future in ministerial perseverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 5, 'Why is visible progress in ministry important in Paul''s framework?', '["Because faithful growth in truth and godliness should become evident as a public witness to the church","Because external success is the only measure that matters","Because Timothy must outperform all rivals","Because progress eliminates the need for dependence on God"]'::jsonb, 'Because faithful growth in truth and godliness should become evident as a public witness to the church', 'Paul wants Timothy''s progress to be manifest to all, indicating that ministerial maturity is to be visible in life and doctrine (1 Timothy 4:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is visible progress in ministry important in Paul''s framework?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 4, 5, 'What larger contrast structures 1 Timothy 4?', '["Demonic false asceticism is opposed to grateful reception of God''s gifts and disciplined godliness in Christ","Creation and godliness are presented as enemies","Ministry and personal holiness are separated","Paul contrasts prayer and teaching as opposites"]'::jsonb, 'Demonic false asceticism is opposed to grateful reception of God''s gifts and disciplined godliness in Christ', 'The chapter sets deceiving spirits and anti-creation rules over against God''s good gifts, godliness, hope in the living God, and faithful ministry (1 Timothy 4:1-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger contrast structures 1 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 1, 'According to 1 Timothy 5, how should Timothy appeal to an older man?', '["As a father","As an enemy","As a servant","As a stranger"]'::jsonb, 'As a father', 'Paul tells Timothy not to rebuke an older man harshly, but to exhort him as a father (1 Timothy 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 5, how should Timothy appeal to an older man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 1, 'According to 1 Timothy 5, how should older women be treated?', '["As mothers","As rulers","As servants","As strangers"]'::jsonb, 'As mothers', 'Paul says older women should be treated as mothers (1 Timothy 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 5, how should older women be treated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 1, 'According to 1 Timothy 5, whom should the church honor?', '["Widows who are really widows","All wealthy donors","Only traveling teachers","All older women equally"]'::jsonb, 'Widows who are really widows', 'Paul says to honor widows who are truly widows (1 Timothy 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 5, whom should the church honor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 1, 'According to 1 Timothy 5, what should children or grandchildren learn first?', '["To show piety toward their own family","To leave home quickly","To avoid older relatives","To give to strangers first"]'::jsonb, 'To show piety toward their own family', 'Paul says children and grandchildren should first learn to show piety toward their own family and repay their parents (1 Timothy 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 5, what should children or grandchildren learn first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 1, 'According to 1 Timothy 5, what is a widow who lives in pleasure?', '["Dead while she lives","Blessed above all","Free from concern","An example to all"]'::jsonb, 'Dead while she lives', 'Paul says she who gives herself to pleasure is dead while she lives (1 Timothy 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 5, what is a widow who lives in pleasure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 1, 'According to 1 Timothy 5, what has someone denied if he does not provide for his own household?', '["The faith","His Roman rights","The priesthood","The resurrection"]'::jsonb, 'The faith', 'Paul says one who does not provide for his own has denied the faith and is worse than an unbeliever (1 Timothy 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 5, what has someone denied if he does not provide for his own household?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 1, 'According to 1 Timothy 5, what should not be received against an elder except from how many witnesses?', '["Two or three","One only","Seven","Twelve"]'::jsonb, 'Two or three', 'Paul says do not receive an accusation against an elder except at the word of two or three witnesses (1 Timothy 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 5, what should not be received against an elder except from how many witnesses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 2, 'How should younger women be treated according to 1 Timothy 5?', '["As sisters, in all purity","As servants","As rivals","As widows automatically"]'::jsonb, 'As sisters, in all purity', 'Paul says younger women are to be treated as sisters, in all purity (1 Timothy 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should younger women be treated according to 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 2, 'What does Paul say a true widow has set her hope on in 1 Timothy 5?', '["God","Her relatives","The church treasury","Public honor"]'::jsonb, 'God', 'A true widow has set her hope on God and continues in petitions and prayers night and day (1 Timothy 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say a true widow has set her hope on in 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 2, 'At what age should a widow be enrolled according to 1 Timothy 5?', '["Not under sixty years old","Not under forty years old","At any age","Only after seventy"]'::jsonb, 'Not under sixty years old', 'Paul says let no one be enrolled as a widow under sixty years old (1 Timothy 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'At what age should a widow be enrolled according to 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 2, 'What kind of reputation should an enrolled widow have according to 1 Timothy 5?', '["A reputation for good works","A reputation for wealth","A reputation for debate","A reputation for travel"]'::jsonb, 'A reputation for good works', 'Paul lists being well reported of for good works among the qualifications for widows (1 Timothy 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of reputation should an enrolled widow have according to 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 2, 'What does Paul tell younger widows to do?', '["Marry, bear children, and manage the household","Join the widows'' list immediately","Avoid all domestic responsibility","Travel constantly with Timothy"]'::jsonb, 'Marry, bear children, and manage the household', 'Paul desires younger widows to marry, bear children, and manage the house (1 Timothy 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul tell younger widows to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 2, 'What are elders who rule well counted worthy of according to 1 Timothy 5?', '["Double honor","Only correction","Civil office","A vow of silence"]'::jsonb, 'Double honor', 'Paul says elders who rule well are worthy of double honor, especially those laboring in word and teaching (1 Timothy 5:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What are elders who rule well counted worthy of according to 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 2, 'What does Paul tell Timothy to drink a little of for his stomach''s sake?', '["Wine","Water only","Milk","Olive oil"]'::jsonb, 'Wine', 'Paul tells Timothy to use a little wine for his stomach and frequent ailments (1 Timothy 5:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul tell Timothy to drink a little of for his stomach''s sake?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 3, 'Why does Paul stress family responsibility before church support for widows?', '["Care for relatives is itself a Christian duty and protects the church from unnecessary burden","The church should never support widows","Families replace the church entirely","Widows are less important than elders"]'::jsonb, 'Care for relatives is itself a Christian duty and protects the church from unnecessary burden', 'Paul tells children and grandchildren to care for family first so the church may relieve those who are truly widows (1 Timothy 5:4, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul stress family responsibility before church support for widows?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 3, 'What does 1 Timothy 5 imply about the church''s care for vulnerable people?', '["Care should be compassionate, discerning, and ordered rather than careless or indiscriminate","The church should avoid organized care entirely","Need alone cancels all discernment","Paul opposes support for widows"]'::jsonb, 'Care should be compassionate, discerning, and ordered rather than careless or indiscriminate', 'Paul gives careful criteria for widows and family responsibility, showing that mercy and order belong together (1 Timothy 5:3-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Timothy 5 imply about the church''s care for vulnerable people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 3, 'Why does Paul warn Timothy not to receive accusations against elders lightly?', '["Leadership should be protected from reckless charges while still remaining accountable under proper testimony","Elders are beyond correction","Only apostles may correct elders","Truth about leaders should remain hidden"]'::jsonb, 'Leadership should be protected from reckless charges while still remaining accountable under proper testimony', 'Paul requires two or three witnesses for accusations, yet also says elders who persist in sin should be rebuked before all (1 Timothy 5:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul warn Timothy not to receive accusations against elders lightly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 3, 'How does chapter 5 balance mercy and accountability?', '["It combines practical care for widows with serious discipline and fairness for leaders","Mercy excludes all structure","Accountability cancels compassion","Paul treats widows and elders with the same exact instructions"]'::jsonb, 'It combines practical care for widows with serious discipline and fairness for leaders', 'Paul addresses both widow care and elder accountability, showing the church must be both compassionate and just (1 Timothy 5:3-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does chapter 5 balance mercy and accountability?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 3, 'Why does Paul tell Timothy to keep these instructions without prejudice or partiality?', '["Church order and discipline must not be bent by favoritism","Only outsiders are prone to bias","Partiality helps preserve peace","Prejudice matters only in civil courts"]'::jsonb, 'Church order and discipline must not be bent by favoritism', 'Paul solemnly charges Timothy to observe these things without prejudice, doing nothing by partiality (1 Timothy 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul tell Timothy to keep these instructions without prejudice or partiality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 3, 'What does ''do not lay hands hastily on anyone'' suggest in 1 Timothy 5?', '["Leadership recognition should be careful because shared responsibility can follow reckless endorsement","Ordination is always wrong","Only older men may be appointed","Hands should never be used in prayer"]'::jsonb, 'Leadership recognition should be careful because shared responsibility can follow reckless endorsement', 'Paul warns Timothy not to lay hands hastily on anyone nor participate in others'' sins, linking recognition of leaders with moral seriousness (1 Timothy 5:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''do not lay hands hastily on anyone'' suggest in 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 3, 'Why does Paul mention that some sins and good works become obvious later?', '["Not everything about a person is immediately visible, so judgment and appointments require patience","All sins stay permanently hidden","Good works never matter in discernment","Timothy should stop evaluating people altogether"]'::jsonb, 'Not everything about a person is immediately visible, so judgment and appointments require patience', 'Paul says some sins are obvious beforehand and others follow after, and likewise with good works, underscoring careful discernment over time (1 Timothy 5:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention that some sins and good works become obvious later?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 4, 'How does 1 Timothy 5 portray the church as a family without losing order?', '["Relationships are framed with familial honor, yet practical criteria and discipline still govern conduct","Family language eliminates all rules","Order matters only for elders, not widows","The church is treated as an institution without affection"]'::jsonb, 'Relationships are framed with familial honor, yet practical criteria and discipline still govern conduct', 'Paul speaks of fathers, mothers, brothers, and sisters, while also giving structured instructions for widows and elders (1 Timothy 5:1-2, 3-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 5 portray the church as a family without losing order?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 4, 'Why is honoring widows described in such specific terms?', '["The church''s compassion must be wise, sustainable, and directed toward genuine need","Paul wants to reduce mercy","Support should go to anyone without inquiry","Widow care is less important than public reputation"]'::jsonb, 'The church''s compassion must be wise, sustainable, and directed toward genuine need', 'Paul distinguishes true widows, family responsibilities, and enrollment criteria so that the church''s care is focused and faithful (1 Timothy 5:3-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is honoring widows described in such specific terms?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 4, 'How does 1 Timothy 5 uphold both the honor and accountability of elders?', '["Faithful elders receive honor, but persistent sin is publicly rebuked under careful witness","Honor means elders cannot be corrected","Accountability cancels the need for honor","Only civil courts may judge elders"]'::jsonb, 'Faithful elders receive honor, but persistent sin is publicly rebuked under careful witness', 'Paul grants double honor to worthy elders while also requiring proper witnesses for charges and public rebuke for persisting sin (1 Timothy 5:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 5 uphold both the honor and accountability of elders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 4, 'What does chapter 5 suggest about pastoral discernment?', '["Pastoral care requires patience because both sins and virtues may unfold over time","Discernment should be immediate and impulsive","Only visible outward matters count","Paul thinks discernment is unnecessary if rules exist"]'::jsonb, 'Pastoral care requires patience because both sins and virtues may unfold over time', 'Paul''s remarks about hidden sins and later-apparent good works show that leaders must judge carefully and not hastily (1 Timothy 5:22, 24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does chapter 5 suggest about pastoral discernment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 4, 'Why is provision for one''s household treated so seriously in 1 Timothy 5?', '["Neglecting basic family responsibility contradicts the faith one professes","Family provision is only a social custom","Paul values finances over doctrine","The church should replace all family obligations"]'::jsonb, 'Neglecting basic family responsibility contradicts the faith one professes', 'Paul says failure to provide for one''s own household amounts to denying the faith and being worse than an unbeliever (1 Timothy 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is provision for one''s household treated so seriously in 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 4, 'How does Paul''s personal counsel about Timothy''s health fit the chapter?', '["It shows pastoral instruction includes embodied wisdom, not abstract leadership alone","It interrupts the chapter without any connection to real life","It replaces church order with private medicine","Paul denies prayer can help the body"]'::jsonb, 'It shows pastoral instruction includes embodied wisdom, not abstract leadership alone', 'In the midst of church order and discernment, Paul gives a practical bodily counsel, showing ministry addresses real embodied life (1 Timothy 5:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s personal counsel about Timothy''s health fit the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 4, 'What kind of church ecosystem emerges from 1 Timothy 5?', '["A community of intergenerational honor, wise care, disciplined leadership, and patient judgment","A community ruled only by formal office","A fellowship with no structure or compassion","A church focused only on private spirituality"]'::jsonb, 'A community of intergenerational honor, wise care, disciplined leadership, and patient judgment', 'The chapter touches family-like relationships, widow support, elder honor, discipline, fairness, and careful evaluation, forming a comprehensive church life vision (1 Timothy 5:1-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of church ecosystem emerges from 1 Timothy 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 5, 'How does 1 Timothy 5 challenge both sentimental and bureaucratic approaches to church care?', '["It calls for mercy governed by truth, family duty, and discernment rather than either sentiment alone or cold procedure","Sentiment is always enough for church care","Only rules matter and compassion should be minimized","Paul opposes all organized care as unspiritual"]'::jsonb, 'It calls for mercy governed by truth, family duty, and discernment rather than either sentiment alone or cold procedure', 'Paul''s widow instructions show tender concern yet insist on concrete criteria and family obligations, integrating compassion and wisdom (1 Timothy 5:3-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 5 challenge both sentimental and bureaucratic approaches to church care?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 5, 'Why is the faith-denial language about family provision so strong?', '["Because Christian confession must be embodied in concrete obligations of love and responsibility","Because household care replaces the gospel","Because Paul values family above the church absolutely","Because material provision alone defines holiness"]'::jsonb, 'Because Christian confession must be embodied in concrete obligations of love and responsibility', 'Paul uses strong language to show that faith must shape ordinary responsibilities, especially toward one''s own household (1 Timothy 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the faith-denial language about family provision so strong?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 5, 'How does 1 Timothy 5 reflect a theology of time in pastoral judgment?', '["Because sins and virtues may emerge gradually, faithful judgment must resist haste and allow time to reveal character","Time has no value in discernment","Immediate impressions are always sufficient","Paul believes hidden sins never surface"]'::jsonb, 'Because sins and virtues may emerge gradually, faithful judgment must resist haste and allow time to reveal character', 'Paul''s warning against hastiness and his observation that some sins and good works appear later show that pastoral judgment must be patient (1 Timothy 5:22, 24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 5 reflect a theology of time in pastoral judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 5, 'What is the deeper ecclesial significance of honoring elders and widows in the same chapter?', '["The church is responsible both to recognize faithful service and to protect vulnerable members within one ordered household","Paul is combining unrelated administrative topics","Only leaders matter and widows are secondary","Widows and elders receive the same role in the church"]'::jsonb, 'The church is responsible both to recognize faithful service and to protect vulnerable members within one ordered household', 'The chapter''s treatment of widows and elders shows the church as God''s household, where honor, care, and accountability all belong together (1 Timothy 5:3-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the deeper ecclesial significance of honoring elders and widows in the same chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 5, 'How does 1 Timothy 5 show that holiness includes practical administration?', '["Paul treats support, accusations, ordination, health, and discipline as moral and spiritual matters before God","Administration is spiritually neutral in the chapter","Only prayer is holy and structure is worldly","Practical issues are beneath pastoral concern"]'::jsonb, 'Paul treats support, accusations, ordination, health, and discipline as moral and spiritual matters before God', 'Paul gives solemn, God-conscious instruction on a wide range of practical matters, indicating that holiness penetrates church administration (1 Timothy 5:21-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 5 show that holiness includes practical administration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 5, 'Why is partiality especially destructive in the kinds of decisions described in this chapter?', '["Favoritism can corrupt care, discipline, and leadership recognition at the heart of God''s household","Partiality helps preserve peace in difficult cases","Bias matters only in civil law, not church life","Paul mentions partiality only as a minor side note"]'::jsonb, 'Favoritism can corrupt care, discipline, and leadership recognition at the heart of God''s household', 'Paul''s solemn warning against prejudice and partiality comes amid decisions about elders, discipline, and appointments, showing how central fairness is to church integrity (1 Timothy 5:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is partiality especially destructive in the kinds of decisions described in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 5, 5, 'How does 1 Timothy 5 depict the church as an alternative social order?', '["It reorders relationships around family-like honor, sacrificial care, truthful accountability, and faithful stewardship","It mirrors ordinary society without change","It is concerned only with worship services","It abolishes natural family bonds entirely"]'::jsonb, 'It reorders relationships around family-like honor, sacrificial care, truthful accountability, and faithful stewardship', 'The chapter reshapes intergenerational relationships, family duties, widow support, elder honor, and discipline into a distinct household ethic under God (1 Timothy 5:1-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 5 depict the church as an alternative social order?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 1, 'According to 1 Timothy 6, how should servants regard their own masters?', '["As worthy of all honor","As enemies","As equals in every role","As unimportant"]'::jsonb, 'As worthy of all honor', 'Paul says servants under the yoke should count their own masters worthy of all honor (1 Timothy 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 6, how should servants regard their own masters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 1, 'According to 1 Timothy 6, what is godliness with contentment?', '["Great gain","A small help","A burden","A passing feeling"]'::jsonb, 'Great gain', 'Paul says godliness with contentment is great gain (1 Timothy 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 6, what is godliness with contentment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 1, 'According to 1 Timothy 6, what have we brought into the world?', '["Nothing","Wisdom","Authority","Merit"]'::jsonb, 'Nothing', 'Paul says we brought nothing into the world, and we certainly can carry nothing out (1 Timothy 6:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 6, what have we brought into the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 1, 'According to 1 Timothy 6, what is a root of all kinds of evil?', '["The love of money","The law","Hard work","Food and clothing"]'::jsonb, 'The love of money', 'Paul says the love of money is a root of all kinds of evil (1 Timothy 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 6, what is a root of all kinds of evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 1, 'According to 1 Timothy 6, what should the man of God flee?', '["These things","Prayer and teaching","Contentment and faith","Good works"]'::jsonb, 'These things', 'After warning about greed and harmful desires, Paul says, ''But you, man of God, flee these things'' (1 Timothy 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 6, what should the man of God flee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 1, 'According to 1 Timothy 6, what should Timothy fight?', '["The good fight of faith","His opponents with weapons","Roman injustice only","A legal dispute"]'::jsonb, 'The good fight of faith', 'Paul commands Timothy to fight the good fight of faith (1 Timothy 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 6, what should Timothy fight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 1, 'According to 1 Timothy 6, what should the rich be ready to do?', '["Distribute and share","Withdraw from the church","Hide their goods","Seek higher status"]'::jsonb, 'Distribute and share', 'Paul tells the rich to be generous, ready to distribute, willing to share (1 Timothy 6:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 1 Timothy 6, what should the rich be ready to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 2, 'Why should servants honor their masters according to 1 Timothy 6?', '["So God''s name and the teaching may not be blasphemed","So masters become apostles","So the church gains wealth","So servants avoid all work"]'::jsonb, 'So God''s name and the teaching may not be blasphemed', 'Paul gives this reason for servants honoring their masters (1 Timothy 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why should servants honor their masters according to 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 2, 'What kind of person does Paul describe as understanding nothing in 1 Timothy 6?', '["One who teaches otherwise and does not agree with sound words","One who loves the brethren","One who works quietly","One who is content with necessities"]'::jsonb, 'One who teaches otherwise and does not agree with sound words', 'Paul says such a person is puffed up, knowing nothing, but sick about disputes and arguments over words (1 Timothy 6:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of person does Paul describe as understanding nothing in 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 2, 'With what should believers be content according to 1 Timothy 6?', '["Food and covering","Luxury and status","Political peace only","A large inheritance"]'::jsonb, 'Food and covering', 'Paul says having food and covering, we will be content with that (1 Timothy 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'With what should believers be content according to 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 2, 'What do those who desire to be rich fall into according to 1 Timothy 6?', '["Temptation, a snare, and many foolish and harmful lusts","Peace and security","Honor and wisdom","Greater faithfulness"]'::jsonb, 'Temptation, a snare, and many foolish and harmful lusts', 'Paul says those who desire to be rich fall into temptation and a snare and many foolish and harmful lusts (1 Timothy 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What do those who desire to be rich fall into according to 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 2, 'What virtues should the man of God pursue according to 1 Timothy 6?', '["Righteousness, godliness, faith, love, patience, and gentleness","Wealth, wisdom, power, and honor","Silence, secrecy, fear, and caution","Strength, influence, strategy, and pride"]'::jsonb, 'Righteousness, godliness, faith, love, patience, and gentleness', 'Paul tells Timothy to pursue righteousness, godliness, faith, love, patience, and gentleness (1 Timothy 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What virtues should the man of God pursue according to 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 2, 'Before whom did Jesus testify the good confession according to 1 Timothy 6?', '["Pontius Pilate","Herod Antipas","Caiaphas","Felix"]'::jsonb, 'Pontius Pilate', 'Paul refers to Christ Jesus, who before Pontius Pilate testified the good confession (1 Timothy 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'Before whom did Jesus testify the good confession according to 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 2, 'Where should the rich place their hope according to 1 Timothy 6?', '["In God, who richly provides all things","In uncertain riches","In Roman power","In family inheritance"]'::jsonb, 'In God, who richly provides all things', 'Paul tells the rich not to trust in uncertain riches but in the living God, who gives us richly all things to enjoy (1 Timothy 6:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where should the rich place their hope according to 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 3, 'Why does Paul link contentment with godliness in 1 Timothy 6?', '["True piety is freed from the restless craving that treats religion as a means of gain","Contentment eliminates all ambition for holiness","Godliness is valuable only if it produces wealth","Contentment matters only for the poor"]'::jsonb, 'True piety is freed from the restless craving that treats religion as a means of gain', 'Paul contrasts corrupt teachers who think godliness is a means of gain with the statement that godliness with contentment is great gain (1 Timothy 6:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul link contentment with godliness in 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 3, 'What does 1 Timothy 6 imply about wealth and spiritual danger?', '["The desire for riches can entangle people in ruin even when money itself seems desirable","All rich people are automatically condemned","Possessions are evil by nature","Poverty alone makes people godly"]'::jsonb, 'The desire for riches can entangle people in ruin even when money itself seems desirable', 'Paul focuses on the desire to be rich and the love of money as spiritually dangerous, leading to temptation and ruin (1 Timothy 6:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 1 Timothy 6 imply about wealth and spiritual danger?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 3, 'Why does Paul call Timothy ''man of God'' in 1 Timothy 6?', '["To summon him to a distinct life shaped by holy pursuit rather than greed","To set him above all believers absolutely","To remove him from normal church duties","To identify him as a temple priest"]'::jsonb, 'To summon him to a distinct life shaped by holy pursuit rather than greed', 'The title introduces a contrast: rather than chasing money, Timothy is to flee such things and pursue righteousness and godliness (1 Timothy 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul call Timothy ''man of God'' in 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 3, 'How does the command to the rich show that wealth itself is not the final issue?', '["Paul does not command wealth to vanish but to be subordinated to generosity, humility, and hope in God","He says all rich people must leave the church","He teaches riches guarantee blessing","He forbids enjoying anything material"]'::jsonb, 'Paul does not command wealth to vanish but to be subordinated to generosity, humility, and hope in God', 'Paul instructs the rich not to be haughty or trust in riches, but to do good, be rich in good works, and share generously (1 Timothy 6:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the command to the rich show that wealth itself is not the final issue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 3, 'What is the significance of Jesus'' good confession before Pilate for Timothy''s charge?', '["Timothy''s perseverance is modeled after Christ''s faithful witness under pressure","Paul is changing the subject to Roman history","Pilate is presented as Timothy''s example","The confession replaces the need for obedience"]'::jsonb, 'Timothy''s perseverance is modeled after Christ''s faithful witness under pressure', 'Paul charges Timothy before God and Christ Jesus, who testified the good confession before Pilate, linking Timothy''s faithfulness to Christ''s own witness (1 Timothy 6:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Jesus'' good confession before Pilate for Timothy''s charge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 3, 'Why does Paul tell Timothy to guard what was committed to him?', '["The gospel deposit must be protected from irreverent and falsely named knowledge","Timothy is guarding money for the poor","He is preserving Roman records","The issue is private advice only"]'::jsonb, 'The gospel deposit must be protected from irreverent and falsely named knowledge', 'Paul ends by telling Timothy to guard the deposit and turn away from profane babblings and oppositions of what is falsely called knowledge (1 Timothy 6:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul tell Timothy to guard what was committed to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 3, 'What does ''lay hold on the life which is life indeed'' suggest in 1 Timothy 6?', '["Generous and God-centered living stores up what truly lasts","Eternal life is earned by money","Only future life matters, not present action","True life is found in earthly luxury"]'::jsonb, 'Generous and God-centered living stores up what truly lasts', 'Paul says the rich should store up a good foundation for the future so they may lay hold of the life which is truly life (1 Timothy 6:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''lay hold on the life which is life indeed'' suggest in 1 Timothy 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 4, 'How does 1 Timothy 6 contrast two visions of gain?', '["False teachers seek material profit, but Paul defines true gain as godliness with contentment and eternal life","Both material wealth and godliness are treated as equal ends","Paul says gain is always wrong","Only poverty counts as true spirituality"]'::jsonb, 'False teachers seek material profit, but Paul defines true gain as godliness with contentment and eternal life', 'Paul contrasts those who imagine godliness as a means of gain with his own claim that godliness with contentment is great gain (1 Timothy 6:5-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 6 contrast two visions of gain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 4, 'Why does Paul insert a doxological vision of God in the middle of Timothy''s charge?', '["The gravity of Timothy''s obedience is anchored in the majesty of the God before whom he serves","Paul is filling space with abstract theology","He is shifting away from practical concerns entirely","The doxology has no connection to the charge"]'::jsonb, 'The gravity of Timothy''s obedience is anchored in the majesty of the God before whom he serves', 'Paul''s charge culminates in praise to the blessed and only Potentate, linking Timothy''s faithfulness to the greatness of the God who gives life to all things (1 Timothy 6:13-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul insert a doxological vision of God in the middle of Timothy''s charge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 4, 'How does 1 Timothy 6 integrate personal holiness and social ethics?', '["The man of God must flee greed personally while teaching the rich to use wealth generously and humbly","Personal holiness has nothing to do with possessions","Only the rich need moral instruction","Social ethics replace personal virtue"]'::jsonb, 'The man of God must flee greed personally while teaching the rich to use wealth generously and humbly', 'Paul first warns Timothy against greed and then instructs him to command the rich toward humility, generosity, and hope in God (1 Timothy 6:9-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 6 integrate personal holiness and social ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 4, 'What does chapter 6 suggest about false teaching and material desire?', '["Distorted doctrine often feeds and is fed by disordered desire for gain","Greed is unrelated to teaching error","False teaching is purely intellectual","Paul mentions money only incidentally"]'::jsonb, 'Distorted doctrine often feeds and is fed by disordered desire for gain', 'Paul links corrupt teaching with people imagining godliness as a means of gain and then warns about the desire to be rich and the love of money (1 Timothy 6:3-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does chapter 6 suggest about false teaching and material desire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 4, 'How does 1 Timothy 6 present Christian leadership under eschatological pressure?', '["Timothy is to keep the command unstained until the appearing of Christ, showing leadership lives before a future unveiling","Leadership depends only on present success","The appearing of Christ has no relevance to ministry","Paul expects Timothy to retire from struggle"]'::jsonb, 'Timothy is to keep the command unstained until the appearing of Christ, showing leadership lives before a future unveiling', 'Paul charges Timothy to keep the commandment without spot until the appearing of our Lord Jesus Christ (1 Timothy 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 1 Timothy 6 present Christian leadership under eschatological pressure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 4, 'Why is contentment so central in chapter 6?', '["It frees believers from slavery to possessions and reorients them toward God, faithfulness, and true life","Contentment means indifference to injustice","Contentment replaces generosity","Paul values contentment only because resources are scarce"]'::jsonb, 'It frees believers from slavery to possessions and reorients them toward God, faithfulness, and true life', 'Paul connects contentment with true gain, contrasts it with the ruinous desire to be rich, and points toward eternal life and trust in God (1 Timothy 6:6-12, 17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is contentment so central in chapter 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 4, 'How does the final warning about falsely named knowledge fit the whole letter?', '["It returns to the letter''s opening concern that Timothy guard the church from corrupting alternatives to sound teaching","It introduces a brand-new topic without connection","Paul now favors speculation over doctrine","The warning concerns science in the modern sense"]'::jsonb, 'It returns to the letter''s opening concern that Timothy guard the church from corrupting alternatives to sound teaching', 'The letter began with warnings against different doctrine, myths, and vain talk, and ends by telling Timothy to avoid false knowledge and guard the deposit (1 Timothy 1:3-7; 6:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the final warning about falsely named knowledge fit the whole letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 5, 'How does 1 Timothy 6 expose greed as a theological problem rather than merely a moral weakness?', '["Greed displaces trust in God, distorts doctrine, and redirects hope from eternal life to uncertain riches","Greed is bad only because society dislikes it","Paul treats greed as a minor personality flaw","Money itself is identified as evil substance"]'::jsonb, 'Greed displaces trust in God, distorts doctrine, and redirects hope from eternal life to uncertain riches', 'Paul links greed to false teaching, harmful desires, wandering from the faith, and trusting uncertain riches instead of God (1 Timothy 6:5, 9-10, 17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 6 expose greed as a theological problem rather than merely a moral weakness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 5, 'Why is Paul''s vision for the rich so important for Christian ethics?', '["He neither absolutizes poverty nor sanctifies wealth, but subjects possessions to humility, generosity, and hope in God","He teaches riches automatically prove godliness","He commands all believers to abandon possessions immediately","He says the rich should avoid generosity to stay independent"]'::jsonb, 'He neither absolutizes poverty nor sanctifies wealth, but subjects possessions to humility, generosity, and hope in God', 'Paul''s commands to the rich are not simply renunciatory but redemptive: do not trust riches, do good, be generous, and lay hold of true life (1 Timothy 6:17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s vision for the rich so important for Christian ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 5, 'How does 1 Timothy 6 present the Christian life as warfare without using violent means?', '["The struggle is for faith, obedience, truth, and endurance before God and Christ","Paul calls for physical coercion against error","Warfare here means political revolution","The chapter abandons earlier concern with truth"]'::jsonb, 'The struggle is for faith, obedience, truth, and endurance before God and Christ', 'Timothy is told to fight the good fight of faith, keep the command unstained, and guard the deposit, all within a moral and doctrinal frame (1 Timothy 6:11-14, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 1 Timothy 6 present the Christian life as warfare without using violent means?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 5, 'What does the doxology in 1 Timothy 6 imply about all human power?', '["All earthly status is relativized before the blessed and only Sovereign who alone has immortality","Earthly rulers share divine sovereignty equally","Human power is the main means of guarding the faith","Paul praises God only for poetic effect"]'::jsonb, 'All earthly status is relativized before the blessed and only Sovereign who alone has immortality', 'Paul''s praise of God as the only Potentate, King of kings, and Lord of lords puts every lesser authority and possession in proper perspective (1 Timothy 6:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the doxology in 1 Timothy 6 imply about all human power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 5, 'How does the letter''s final appeal to guard the deposit summarize 1 Timothy as a whole?', '["The whole letter has trained Timothy to preserve sound doctrine through ordered, holy, and faithful church life","The final appeal ignores earlier material","The deposit refers only to money and resources","Paul ends by denying the need for teaching"]'::jsonb, 'The whole letter has trained Timothy to preserve sound doctrine through ordered, holy, and faithful church life', 'From the opening warning against false doctrine to the final command to guard the entrusted deposit, the letter''s burden is consistent: preserve truth in the church''s life and leadership (1 Timothy 1:3; 6:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the letter''s final appeal to guard the deposit summarize 1 Timothy as a whole?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 5, 'Why is contentment presented as radical in a world shaped by gain and status?', '["Because it witnesses that life, security, and honor are finally found in God rather than accumulation","Because contentment means ambition is always sinful","Because it removes the need for generosity","Because it applies only to those with little"]'::jsonb, 'Because it witnesses that life, security, and honor are finally found in God rather than accumulation', 'Paul contrasts contentment with greed, uncertainty of riches, and false notions of gain, directing believers instead toward God and true life (1 Timothy 6:6-10, 17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is contentment presented as radical in a world shaped by gain and status?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 54, 6, 5, 'What deeper unity ties together servants, false teachers, money, Timothy''s charge, and the rich in chapter 6?', '["The lordship of God and Christ orders every social and material sphere under truth, contentment, and faithful witness","These are disconnected topics with no common thread","Paul is interested only in economics","The chapter is mostly miscellaneous advice without theology"]'::jsonb, 'The lordship of God and Christ orders every social and material sphere under truth, contentment, and faithful witness', 'Across relations of service, teaching, wealth, and ministry, Paul repeatedly grounds instruction in God''s honor, Christ''s confession, future appearing, and the entrusted truth (1 Timothy 6:1-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 54
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper unity ties together servants, false teachers, money, Timothy''s charge, and the rich in chapter 6?'
);
