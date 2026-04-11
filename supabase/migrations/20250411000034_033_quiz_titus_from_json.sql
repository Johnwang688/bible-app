-- ============================================================================
-- LOGOS LIGHT - Titus (book 56) quiz questions from quiz-questions/titus.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 1, 'According to Titus 1, to whom did Paul write this letter?', '["Titus","Timothy","Philemon","Luke"]'::jsonb, 'Titus', 'Paul addresses the letter to Titus, his true child according to a common faith (Titus 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 1, to whom did Paul write this letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 1, 'According to Titus 1, where had Paul left Titus?', '["Crete","Ephesus","Rome","Corinth"]'::jsonb, 'Crete', 'Paul says he left Titus in Crete to set in order the things that were lacking (Titus 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 1, where had Paul left Titus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 1, 'According to Titus 1, what was Titus to appoint in every city?', '["Elders","Kings","Prophets","Deacons only"]'::jsonb, 'Elders', 'Paul tells Titus to appoint elders in every city, as he had commanded him (Titus 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 1, what was Titus to appoint in every city?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 1, 'According to Titus 1, how many wives should an elder be the husband of?', '["One","Two","As many as needed","Paul does not say"]'::jsonb, 'One', 'An elder is to be blameless, the husband of one wife (Titus 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 1, how many wives should an elder be the husband of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 1, 'According to Titus 1, what must an overseer not be?', '["Self-willed","Hospitable","Sober-minded","Loving what is good"]'::jsonb, 'Self-willed', 'Paul says the overseer must not be self-willed, quick-tempered, or given to wine, among other things (Titus 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 1, what must an overseer not be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 1, 'According to Titus 1, what positive quality must an overseer love?', '["What is good","Public praise","Debate","Wealth"]'::jsonb, 'What is good', 'Paul says an overseer must be hospitable and a lover of what is good (Titus 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 1, what positive quality must an overseer love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 1, 'According to Titus 1, which group especially had many unruly and empty talkers?', '["Those of the circumcision","The Romans","The Samaritans","The Greeks"]'::jsonb, 'Those of the circumcision', 'Paul says there are many unruly men, vain talkers and deceivers, especially those of the circumcision (Titus 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 1, which group especially had many unruly and empty talkers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 2, 'Why had Paul left Titus in Crete according to Titus 1?', '["To set in order what was lacking and appoint elders","To collect money for Jerusalem","To start a synagogue school","To prepare for a voyage to Rome"]'::jsonb, 'To set in order what was lacking and appoint elders', 'Paul says Titus was left in Crete to set in order the things that were lacking and appoint elders in every city (Titus 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why had Paul left Titus in Crete according to Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 2, 'What must an overseer hold firmly according to Titus 1?', '["The faithful word as taught","Roman law","His family inheritance","The traditions of Crete"]'::jsonb, 'The faithful word as taught', 'Paul says the overseer must hold firmly to the faithful word as he was taught (Titus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What must an overseer hold firmly according to Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 2, 'What two teaching tasks should an overseer be able to do in Titus 1?', '["Exhort in sound doctrine and convict those who contradict","Debate philosophers and judge the city","Perform miracles and interpret dreams","Travel widely and write letters"]'::jsonb, 'Exhort in sound doctrine and convict those who contradict', 'An overseer must be able both to exhort in sound doctrine and to convict those who contradict (Titus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What two teaching tasks should an overseer be able to do in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 2, 'What were some false teachers doing to whole households in Titus 1?', '["Subverting them","Feeding them","Baptizing them","Sending them to Jerusalem"]'::jsonb, 'Subverting them', 'Paul says these deceptive teachers overthrow whole households, teaching things they should not (Titus 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What were some false teachers doing to whole households in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 2, 'For what dishonest motive were some teaching wrong things in Titus 1?', '["Dishonest gain","Fear of persecution","Love of learning","Desire to travel"]'::jsonb, 'Dishonest gain', 'Paul says they were teaching for dishonest gain things they ought not to teach (Titus 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'For what dishonest motive were some teaching wrong things in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 2, 'What did one of the Cretans call his own people in Titus 1?', '["Always liars, evil beasts, and idle gluttons","Faithful, wise, and peaceable","Strong soldiers and true friends","Zealous students of the law"]'::jsonb, 'Always liars, evil beasts, and idle gluttons', 'Paul quotes a prophet of their own saying, ''Cretans are always liars, evil beasts, and idle gluttons'' (Titus 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did one of the Cretans call his own people in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 2, 'How did Paul tell Titus to rebuke such people?', '["Sharply","Softly only","Not at all","In riddles"]'::jsonb, 'Sharply', 'Paul tells Titus to rebuke them sharply so that they may be sound in the faith (Titus 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Paul tell Titus to rebuke such people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 3, 'Why does Titus 1 place character qualifications before teaching ability for elders?', '["Church leadership requires a life that matches the truth it teaches","Paul thinks doctrine is secondary","Only family reputation matters","Teaching is unnecessary for elders"]'::jsonb, 'Church leadership requires a life that matches the truth it teaches', 'Paul''s qualifications emphasize blameless conduct and household order before adding the need to hold fast the faithful word (Titus 1:6-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Titus 1 place character qualifications before teaching ability for elders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 3, 'What does Titus 1 suggest about false teaching''s danger?', '["It damages real households and faith, not just abstract ideas","It affects only public debates","It matters only for elders","It is harmless if sincere"]'::jsonb, 'It damages real households and faith, not just abstract ideas', 'Paul says false teachers are subverting whole households and must be silenced, showing practical and spiritual harm (Titus 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Titus 1 suggest about false teaching''s danger?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 3, 'Why must an overseer hold firmly to the faithful word in Titus 1?', '["Because leadership includes strengthening the church and confronting contradiction","Because memory of tradition is enough by itself","Because only written liturgy matters","Because elders must avoid all controversy"]'::jsonb, 'Because leadership includes strengthening the church and confronting contradiction', 'Paul says the overseer must hold the faithful word so he can exhort in sound doctrine and convict those who contradict (Titus 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why must an overseer hold firmly to the faithful word in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 3, 'What is the point of rebuking deceivers sharply according to Titus 1?', '["That they may become sound in the faith","That they may be publicly humiliated","That Titus may gain power","That the churches may fear Rome"]'::jsonb, 'That they may become sound in the faith', 'Paul says sharp rebuke is meant so that they may be sound in the faith (Titus 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of rebuking deceivers sharply according to Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 3, 'How does Titus 1 connect purity and perception?', '["Those who are defiled see things through defiled minds and consciences","Purity depends only on food laws","Only outward actions affect purity","Paul says nothing about conscience"]'::jsonb, 'Those who are defiled see things through defiled minds and consciences', 'Paul contrasts the pure, to whom all things are pure, with the defiled and unbelieving, whose minds and consciences are defiled (Titus 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Titus 1 connect purity and perception?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 3, 'Why does Paul mention Jewish myths and commandments of men in Titus 1?', '["He warns against teachings that turn people away from the truth","He is rejecting the Old Testament entirely","He is criticizing all traditions equally","He means myths are harmless stories"]'::jsonb, 'He warns against teachings that turn people away from the truth', 'Paul says they must not give heed to Jewish myths and commandments of people who turn away from the truth (Titus 1:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention Jewish myths and commandments of men in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 3, 'What contradiction does Paul expose in Titus 1:16?', '["Some profess to know God but deny him by their works","Some deny God but obey him well","Some teach sound doctrine but avoid good works","Some are pure in conscience but defiled in body only"]'::jsonb, 'Some profess to know God but deny him by their works', 'Paul says they profess that they know God, but by their works they deny him (Titus 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What contradiction does Paul expose in Titus 1:16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 4, 'How does Titus 1 join church order and doctrinal fidelity?', '["Qualified elders are appointed precisely so the churches can be governed by sound teaching and protected from corrupting error","Church order matters only for public appearance","Doctrine and leadership are separate concerns here","Paul treats false teaching as unavoidable and unanswerable"]'::jsonb, 'Qualified elders are appointed precisely so the churches can be governed by sound teaching and protected from corrupting error', 'Paul links appointing elders with holding fast the faithful word and silencing deceptive teachers who upset households (Titus 1:5, 9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 1 join church order and doctrinal fidelity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 4, 'Why is the household such an important setting in Titus 1?', '["Household faithfulness reveals leadership fitness, and false teaching also spreads through households","Paul is only concerned with domestic customs","The churches met only in palaces","Households matter less than public rhetoric"]'::jsonb, 'Household faithfulness reveals leadership fitness, and false teaching also spreads through households', 'An elder''s family life is part of his qualifications, and false teachers are said to overthrow whole households (Titus 1:6, 11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the household such an important setting in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 4, 'What does Paul''s use of the Cretan proverb accomplish in Titus 1?', '["He uses a local moral diagnosis to justify urgent pastoral correction in Crete","He endorses ethnic mockery as his main method","He replaces Scripture with secular poetry","He excuses the churches from responsibility"]'::jsonb, 'He uses a local moral diagnosis to justify urgent pastoral correction in Crete', 'Paul quotes the saying about Cretans and calls it true in order to support sharp rebuke aimed at sound faith (Titus 1:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s use of the Cretan proverb accomplish in Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 4, 'How does Titus 1 portray false religion?', '["As a mixture of verbal profession, corrupt motives, and works that deny God","As simply lack of ritual knowledge","As a harmless cultural difference","As private doubt with no ethical effect"]'::jsonb, 'As a mixture of verbal profession, corrupt motives, and works that deny God', 'Paul describes deceivers as vain talkers teaching for dishonest gain who profess God but deny him by works (Titus 1:10-11, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 1 portray false religion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 4, 'Why does Paul move from eternal hope in the greeting to practical elder qualifications so quickly?', '["Because gospel truth must take institutional shape in ordered, holy church leadership","Because the greeting is unrelated to the rest of the letter","Because doctrine ends once practical matters begin","Because Crete needed politics more than theology"]'::jsonb, 'Because gospel truth must take institutional shape in ordered, holy church leadership', 'Paul''s greeting speaks of truth, godliness, and eternal life, and he immediately applies those realities to leadership and correction in the churches (Titus 1:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul move from eternal hope in the greeting to practical elder qualifications so quickly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 4, 'What tension is held together in Titus 1''s treatment of opponents?', '["They must be silenced and rebuked firmly, yet with the aim of restoring soundness in faith","Opponents should only be ignored","Restoration means avoiding any confrontation","Firmness and pastoral concern are treated as opposites"]'::jsonb, 'They must be silenced and rebuked firmly, yet with the aim of restoring soundness in faith', 'Paul calls for decisive action against deceivers, but the stated goal is that they may be sound in the faith (Titus 1:11, 13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What tension is held together in Titus 1''s treatment of opponents?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 4, 'How does Titus 1 present the link between conscience and conduct?', '["Defiled consciences produce defiled perception and disobedient behavior that contradict profession","Conscience is irrelevant if doctrine is correct","Behavior matters but conscience does not","Purity is defined only by outward food practices"]'::jsonb, 'Defiled consciences produce defiled perception and disobedient behavior that contradict profession', 'Paul says the defiled have defiled minds and consciences and then describes them as disobedient and unfit for good work (Titus 1:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 1 present the link between conscience and conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 5, 'How does Titus 1 frame pastoral ministry as a battle for truth embodied in community life?', '["The gospel''s truth must be guarded through qualified leaders whose lives and teaching protect households from destructive error","Ministry is mainly personal spirituality apart from church structures","Truth is preserved best without accountable leadership","Community life is secondary to private belief"]'::jsonb, 'The gospel''s truth must be guarded through qualified leaders whose lives and teaching protect households from destructive error', 'Paul joins elder qualifications, sound doctrine, household integrity, and opposition to false teachers into one pastoral task (Titus 1:5-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Titus 1 frame pastoral ministry as a battle for truth embodied in community life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 5, 'Why is the phrase ''truth which is according to godliness'' important for Titus 1?', '["It shows that truth is never merely abstract but is meant to produce a godly way of life in leaders and churches","It means doctrine can be replaced by ethics","It limits truth to moral slogans","It suggests godliness comes apart from the gospel"]'::jsonb, 'It shows that truth is never merely abstract but is meant to produce a godly way of life in leaders and churches', 'Paul opens the letter by tying truth to godliness and then applies that link to elder character, sound teaching, and rebuke of false profession (Titus 1:1, 6-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''truth which is according to godliness'' important for Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 5, 'How does Titus 1 resist both moralism and doctrinal minimalism?', '["It requires holy conduct and firm doctrine together, refusing to separate life from truth","It teaches only moral example matters","It values doctrinal precision but ignores character","It minimizes both truth and holiness for peace"]'::jsonb, 'It requires holy conduct and firm doctrine together, refusing to separate life from truth', 'Paul''s elder qualifications emphasize character, while his teaching qualifications emphasize sound doctrine and refuting contradiction (Titus 1:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Titus 1 resist both moralism and doctrinal minimalism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 5, 'What does Titus 1 imply about the social reach of false teaching?', '["False teaching is socially contagious, capable of reshaping households, morals, and consciences","Its effects remain private and internal","It harms only public teachers, not families","Paul treats it as mostly an intellectual nuisance"]'::jsonb, 'False teaching is socially contagious, capable of reshaping households, morals, and consciences', 'Paul describes deceivers as upsetting households and producing defiled minds, consciences, and works, showing broad communal damage (Titus 1:11, 15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Titus 1 imply about the social reach of false teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 5, 'Why is Paul''s goal in rebuke not merely suppression?', '["Because pastoral correction aims at restoration to sound faith rather than punishment alone","Because false teachers are left free to continue teaching","Because public harmony matters more than truth","Because rebuke is only symbolic"]'::jsonb, 'Because pastoral correction aims at restoration to sound faith rather than punishment alone', 'Paul explicitly says the purpose of sharp rebuke is that they may be sound in the faith (Titus 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s goal in rebuke not merely suppression?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 5, 'How does the chapter''s opening and closing create a theological frame for the whole chapter?', '["It begins with God''s truthful promise of eternal life and ends by exposing people whose works contradict their profession of knowing God","It starts and ends with travel details only","It focuses entirely on Crete''s politics","It contrasts law and grace without reference to church life"]'::jsonb, 'It begins with God''s truthful promise of eternal life and ends by exposing people whose works contradict their profession of knowing God', 'The greeting emphasizes God''s truth and promised life, while the final verses expose false professors whose actions deny God, framing the chapter around authentic versus false religion (Titus 1:1-4, 16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the chapter''s opening and closing create a theological frame for the whole chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 1, 5, 'What overarching pastoral logic governs Titus 1?', '["Healthy churches require leaders who embody and defend the truth because communities are vulnerable to morally corrupting error","Churches mainly need organizational efficiency and public respect","The chapter argues that correction should replace instruction","Paul assumes truth will preserve itself without elders"]'::jsonb, 'Healthy churches require leaders who embody and defend the truth because communities are vulnerable to morally corrupting error', 'Paul''s instructions about appointing elders and silencing deceivers show a unified concern for truth, godliness, and the protection of the churches (Titus 1:5-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What overarching pastoral logic governs Titus 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 1, 'According to Titus 2, what should Titus speak?', '["Things which fit sound doctrine","Only parables","Political advice","His own ideas"]'::jsonb, 'Things which fit sound doctrine', 'Paul tells Titus to speak the things which fit sound doctrine (Titus 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 2, what should Titus speak?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 1, 'According to Titus 2, how should older men be?', '["Temperate, sensible, sober-minded, sound in faith","Quick-tempered and bold","Silent and withdrawn","Wealthy and powerful"]'::jsonb, 'Temperate, sensible, sober-minded, sound in faith', 'Paul says older men should be temperate, sensible, sober-minded, sound in faith, love, and perseverance (Titus 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 2, how should older men be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 1, 'According to Titus 2, what should older women teach?', '["What is good","Military discipline","Roman law","Trade skills only"]'::jsonb, 'What is good', 'Older women are to be teachers of what is good (Titus 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 2, what should older women teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 1, 'According to Titus 2, whom should younger women love?', '["Their husbands and children","Only their neighbors","The elders only","Their employers"]'::jsonb, 'Their husbands and children', 'Paul says older women should train younger women to love their husbands and love their children (Titus 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 2, whom should younger women love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 1, 'According to Titus 2, in what should Titus show himself an example?', '["Good works","Military service","Temple rituals","Civil judgment"]'::jsonb, 'Good works', 'Paul tells Titus to show himself in all things an example of good works (Titus 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 2, in what should Titus show himself an example?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 1, 'According to Titus 2, what kind of speech should Titus have?', '["Sound speech that can''t be condemned","Clever speech for debates","Harsh speech for enemies","Silent speech only"]'::jsonb, 'Sound speech that can''t be condemned', 'Paul says Titus should have sound speech that can''t be condemned (Titus 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 2, what kind of speech should Titus have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 1, 'According to Titus 2, what has appeared bringing salvation to all men?', '["The grace of God","The law of Moses","The temple service","Roman peace"]'::jsonb, 'The grace of God', 'Paul says the grace of God has appeared, bringing salvation to all men (Titus 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 2, what has appeared bringing salvation to all men?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 2, 'Why should younger women be trained in godly conduct according to Titus 2?', '["So that the word of God may not be blasphemed","So they may gain influence in Crete","So Titus can leave Crete sooner","So they can avoid all household work"]'::jsonb, 'So that the word of God may not be blasphemed', 'Paul gives this reason for the younger women''s godly conduct in the home (Titus 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why should younger women be trained in godly conduct according to Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 2, 'How should younger men be encouraged according to Titus 2?', '["To be sober-minded","To avoid all responsibility","To seek wealth quickly","To travel constantly"]'::jsonb, 'To be sober-minded', 'Paul says to exhort the younger men to be sober-minded (Titus 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should younger men be encouraged according to Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 2, 'How should bondservants treat their masters according to Titus 2?', '["Be obedient and well-pleasing in all things","Defy them openly","Steal only when poor","Debate them constantly"]'::jsonb, 'Be obedient and well-pleasing in all things', 'Paul says bondservants should be in subjection to their own masters and be well-pleasing in all things (Titus 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should bondservants treat their masters according to Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 2, 'What should bondservants show instead of stealing in Titus 2?', '["All good fidelity","Public protest","Strict silence","Special wisdom"]'::jsonb, 'All good fidelity', 'Paul says they should not steal, but show all good fidelity (Titus 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should bondservants show instead of stealing in Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 2, 'What does the grace of God teach believers to deny in Titus 2?', '["Ungodliness and worldly lusts","Marriage and food","Work and discipline","Teaching and rebuke"]'::jsonb, 'Ungodliness and worldly lusts', 'Paul says grace teaches us to deny ungodliness and worldly lusts (Titus 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does the grace of God teach believers to deny in Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 2, 'How should believers live in the present age according to Titus 2?', '["Soberly, righteously, and godly","Secretly and fearfully","Only in ritual purity","Without concern for others"]'::jsonb, 'Soberly, righteously, and godly', 'Grace instructs believers to live soberly, righteously, and godly in the present age (Titus 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should believers live in the present age according to Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 2, 'For what are believers looking according to Titus 2?', '["The blessed hope and appearing of the glory of our great God and Savior","The fall of Rome","A new temple in Crete","Immediate earthly prosperity"]'::jsonb, 'The blessed hope and appearing of the glory of our great God and Savior', 'Paul says believers are looking for the blessed hope and the appearing of the glory of our great God and Savior, Jesus Christ (Titus 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'For what are believers looking according to Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 3, 'Why does Titus 2 address different groups in the church separately?', '["Sound doctrine takes visible shape in each station of life and relationship","Paul thinks only some believers need godliness","The church was divided into unrelated classes","Different groups were saved by different gospels"]'::jsonb, 'Sound doctrine takes visible shape in each station of life and relationship', 'Paul applies sound doctrine to older men, older women, younger women, younger men, Titus, and bondservants, showing its practical reach (Titus 2:1-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Titus 2 address different groups in the church separately?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 3, 'How does Titus 2 connect doctrine and witness?', '["Christian conduct either adorns or dishonors the word and teaching of God","Doctrine matters only in teaching time","Witness depends mainly on miracles","Conduct has no effect on outsiders"]'::jsonb, 'Christian conduct either adorns or dishonors the word and teaching of God', 'Paul says conduct should prevent God''s word from being blasphemed and should adorn the doctrine of God our Savior (Titus 2:5, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Titus 2 connect doctrine and witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 3, 'What does Titus 2 suggest about grace?', '["Grace not only saves but also trains believers in a new way of life","Grace removes the need for good works","Grace applies only to future hope","Grace is mainly emotional comfort"]'::jsonb, 'Grace not only saves but also trains believers in a new way of life', 'Paul says the grace of God has appeared bringing salvation and teaching us to deny ungodliness and live godly lives (Titus 2:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Titus 2 suggest about grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 3, 'Why does Paul emphasize Titus''s personal example in chapter 2?', '["Leaders must embody the message they teach so opponents have no legitimate evil thing to say","Titus lacked any teaching role","Example replaces doctrine entirely","Only Titus, not the churches, needed good works"]'::jsonb, 'Leaders must embody the message they teach so opponents have no legitimate evil thing to say', 'Paul tells Titus to show himself an example in good works and sound speech so the opponent may be put to shame (Titus 2:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize Titus''s personal example in chapter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 3, 'How does future hope shape present ethics in Titus 2?', '["Believers live soberly now while waiting for Christ''s appearing and blessed hope","Hope makes present conduct irrelevant","Future glory cancels earthly responsibilities","Paul separates ethics from eschatology"]'::jsonb, 'Believers live soberly now while waiting for Christ''s appearing and blessed hope', 'Paul ties present godly living to waiting for the blessed hope and appearing of Christ''s glory (Titus 2:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does future hope shape present ethics in Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 3, 'Why does Paul say Christ gave himself for us in Titus 2?', '["To redeem us from lawlessness and purify a people zealous for good works","To remove all earthly obligations","To make good works unnecessary","To grant political freedom in Crete"]'::jsonb, 'To redeem us from lawlessness and purify a people zealous for good works', 'Paul says Christ gave himself for us to redeem us from all iniquity and purify for himself a people for his own possession, zealous for good works (Titus 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say Christ gave himself for us in Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 3, 'What is the significance of adorning the doctrine of God our Savior in Titus 2?', '["Christian behavior can make the beauty of the gospel visible in ordinary life","Doctrine needs external decoration to become true","Only servants can honor doctrine","Paul means clothing style proves salvation"]'::jsonb, 'Christian behavior can make the beauty of the gospel visible in ordinary life', 'Paul says faithful conduct by bondservants adorns the doctrine of God our Savior in all things (Titus 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of adorning the doctrine of God our Savior in Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 4, 'How does Titus 2 show that sound doctrine is socially embodied?', '["Paul maps gospel-shaped conduct onto every age, gender, and social role in the church","Doctrine is treated as private belief only","Only leaders are expected to live differently","Social roles replace the gospel in this chapter"]'::jsonb, 'Paul maps gospel-shaped conduct onto every age, gender, and social role in the church', 'The chapter applies sound doctrine to the full spectrum of church life, from older men to bondservants, showing its communal embodiment (Titus 2:1-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 2 show that sound doctrine is socially embodied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 4, 'Why does Paul move from household instruction to the appearing of grace?', '["The practical duties of believers are grounded in the saving and instructing grace of God","He changes topics without connection","Grace is introduced to cancel the earlier commands","Household life is unrelated to redemption"]'::jsonb, 'The practical duties of believers are grounded in the saving and instructing grace of God', 'After giving concrete instructions, Paul grounds them in the appearing of grace that saves and trains believers (Titus 2:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul move from household instruction to the appearing of grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 4, 'What kind of pastoral strategy does Titus 2 model?', '["A strategy where doctrine, example, and role-specific exhortation work together to form a healthy church","A strategy based mainly on punishment","A strategy that ignores differences in life situation","A strategy that avoids public teaching"]'::jsonb, 'A strategy where doctrine, example, and role-specific exhortation work together to form a healthy church', 'Paul combines sound doctrine, Titus''s example, and tailored instruction to different groups into a coherent approach to church formation (Titus 2:1-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of pastoral strategy does Titus 2 model?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 4, 'How does Titus 2 treat the relationship between grace and good works?', '["Grace produces good works by training and purifying a people eager to do them","Good works replace grace as the means of salvation","Grace and good works are unrelated","Good works are mentioned only for social respectability"]'::jsonb, 'Grace produces good works by training and purifying a people eager to do them', 'Grace appears, teaches holy living, and Christ redeems and purifies a people zealous for good works (Titus 2:11-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 2 treat the relationship between grace and good works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 4, 'What does the phrase ''our great God and Savior, Jesus Christ'' contribute to the chapter?', '["It ties the church''s ethical life to a high Christ-centered hope and appearing","It shifts focus away from Christ to the Father only","It reduces the chapter to doctrinal formula alone","It removes the call to present obedience"]'::jsonb, 'It ties the church''s ethical life to a high Christ-centered hope and appearing', 'Paul anchors present godly living in the awaited appearing of the glory of our great God and Savior, Jesus Christ (Titus 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the phrase ''our great God and Savior, Jesus Christ'' contribute to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 4, 'Why does Paul insist that Titus speak, exhort, and rebuke with all authority at the end of Titus 2?', '["Because these gospel-grounded patterns of life are not optional extras but binding church instruction","Because Titus needed political authority in Crete","Because rebuke is more important than grace","Because only Titus may do good works"]'::jsonb, 'Because these gospel-grounded patterns of life are not optional extras but binding church instruction', 'After grounding conduct in grace and redemption, Paul tells Titus to declare these things with full authority (Titus 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul insist that Titus speak, exhort, and rebuke with all authority at the end of Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 4, 'How does the chapter keep Christian ethics from becoming mere moralism?', '["It roots all exhortation in God''s appearing grace, Christ''s self-giving, and the hope of his return","It dismisses ethical instruction entirely","It bases conduct only on social custom","It treats grace as unrelated to obedience"]'::jsonb, 'It roots all exhortation in God''s appearing grace, Christ''s self-giving, and the hope of his return', 'The chapter moves from practical exhortations to the theological grounds of grace, redemption, purification, and future appearing (Titus 2:11-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the chapter keep Christian ethics from becoming mere moralism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 5, 'How does Titus 2 present the church as a community where theology becomes visible?', '["The chapter shows doctrine taking concrete form in everyday relationships, habits, work, speech, and hope","It treats theology as confined to formal teaching time","Only leaders are said to display the gospel","The community''s life is unrelated to Christ''s work"]'::jsonb, 'The chapter shows doctrine taking concrete form in everyday relationships, habits, work, speech, and hope', 'Paul''s instructions across the whole church are then grounded in grace, Christ''s self-giving, and the blessed hope, making theology publicly visible (Titus 2:1-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Titus 2 present the church as a community where theology becomes visible?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 5, 'Why is the language of grace as teacher so important in Titus 2?', '["It shows grace is not only pardon but a formative power shaping believers into a holy people","It means grace is merely educational information","It replaces Christ''s work with self-improvement","It suggests salvation comes by moral training alone"]'::jsonb, 'It shows grace is not only pardon but a formative power shaping believers into a holy people', 'Paul says grace has appeared bringing salvation and instructing believers in denial of ungodliness and in godly living (Titus 2:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the language of grace as teacher so important in Titus 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 5, 'How does Titus 2 hold together present age and coming age?', '["Believers live soberly in the present age while looking for the blessed hope of Christ''s appearing","The coming age makes the present meaningless","Only the present age matters in Christian ethics","Hope is detached from daily conduct"]'::jsonb, 'Believers live soberly in the present age while looking for the blessed hope of Christ''s appearing', 'Paul explicitly joins present holy living with waiting for the blessed hope and glorious appearing of Christ (Titus 2:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Titus 2 hold together present age and coming age?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 5, 'What does Titus 2 imply about redemption''s purpose?', '["Christ redeems not merely to forgive but to create a purified people eager for good works","Redemption concerns only future heaven","Redemption frees believers from all obligation to others","Paul limits redemption to leaders"]'::jsonb, 'Christ redeems not merely to forgive but to create a purified people eager for good works', 'Paul says Christ gave himself to redeem from lawlessness and purify a people for his own possession, zealous for good works (Titus 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Titus 2 imply about redemption''s purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 5, 'How does the chapter resist both social conformity and social revolt?', '["It calls believers to transform their existing relationships through holy conduct that honors God''s word and doctrine","It urges believers to withdraw from all society","It teaches the gospel is only inward and private","It says social life is beyond the reach of grace"]'::jsonb, 'It calls believers to transform their existing relationships through holy conduct that honors God''s word and doctrine', 'Paul addresses ordinary roles such as family life and servitude, calling for conduct that adorns doctrine and protects God''s word from reproach (Titus 2:4-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the chapter resist both social conformity and social revolt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 5, 'Why is Titus''s own example central rather than incidental in this chapter?', '["Because pastoral authority depends on visible integrity that aligns with the message being taught","Because Titus had no verbal teaching role","Because example is more important than truth","Because only leaders need holiness"]'::jsonb, 'Because pastoral authority depends on visible integrity that aligns with the message being taught', 'Paul directly commands Titus to show himself a pattern of good works, integrity, dignity, and sound speech (Titus 2:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Titus''s own example central rather than incidental in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 2, 5, 'What comprehensive pastoral vision holds Titus 2 together?', '["The grace of God creates a disciplined, hopeful, exemplary church whose common life adorns the gospel","The chapter is mainly a list of disconnected social rules","Paul''s focus is only on one age group","The chapter avoids theology in favor of ethics alone"]'::jsonb, 'The grace of God creates a disciplined, hopeful, exemplary church whose common life adorns the gospel', 'The chapter links role-based exhortation, Titus''s example, grace''s training, Christ''s redemption, and the church''s visible witness in one integrated vision (Titus 2:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What comprehensive pastoral vision holds Titus 2 together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 1, 'According to Titus 3, to whom should believers be in subjection?', '["Rulers and authorities","Only the elders","Only their families","No one"]'::jsonb, 'Rulers and authorities', 'Paul tells Titus to remind believers to be in subjection to rulers and authorities and to be obedient (Titus 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 3, to whom should believers be in subjection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 1, 'According to Titus 3, what should believers be ready for?', '["Every good work","Every lawsuit","Every debate","Every fast"]'::jsonb, 'Every good work', 'Paul says believers should be ready for every good work (Titus 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 3, what should believers be ready for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 1, 'According to Titus 3, how should believers speak about no one?', '["Slanderously","Wisely","Publicly","Openly"]'::jsonb, 'Slanderously', 'Paul says they should speak evil of no one (Titus 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 3, how should believers speak about no one?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 1, 'According to Titus 3, through what did God save us?', '["The washing of regeneration and renewing by the Holy Spirit","The works of the law","Temple sacrifices","Roman justice"]'::jsonb, 'The washing of regeneration and renewing by the Holy Spirit', 'Paul says God saved us through the washing of regeneration and renewing by the Holy Spirit (Titus 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 3, through what did God save us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 1, 'According to Titus 3, through whom did God pour out the Holy Spirit richly?', '["Jesus Christ our Savior","Moses","Titus","The prophets"]'::jsonb, 'Jesus Christ our Savior', 'Paul says the Holy Spirit was poured out richly through Jesus Christ our Savior (Titus 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 3, through whom did God pour out the Holy Spirit richly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 1, 'According to Titus 3, what should Titus avoid?', '["Foolish disputes and genealogies","Prayer and teaching","Hospitality and mercy","Correction and exhortation"]'::jsonb, 'Foolish disputes and genealogies', 'Paul says to avoid foolish disputes, genealogies, strife, and conflicts about the law (Titus 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 3, what should Titus avoid?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 1, 'According to Titus 3, after how many warnings should a factious man be rejected?', '["One and a second","Three and a fourth","None","Seven"]'::jsonb, 'One and a second', 'Paul says to avoid a factious man after a first and second warning (Titus 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Titus 3, after how many warnings should a factious man be rejected?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 2, 'How should believers show themselves toward all men according to Titus 3?', '["Gentle, showing all humility","Harsh and suspicious","Distant and silent","Bold and argumentative"]'::jsonb, 'Gentle, showing all humility', 'Paul says believers should be gentle, showing all humility toward all men (Titus 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should believers show themselves toward all men according to Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 2, 'How does Paul describe believers'' former condition in Titus 3?', '["Foolish, disobedient, deceived, enslaved to lusts","Always righteous and wise","Only politically oppressed","Free from all impurity"]'::jsonb, 'Foolish, disobedient, deceived, enslaved to lusts', 'Paul says we also once were foolish, disobedient, deceived, serving various lusts and pleasures (Titus 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe believers'' former condition in Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 2, 'What appeared according to Titus 3:4?', '["The kindness of God our Savior and his love toward mankind","The law''s final demand","The temple''s former glory","A new Roman decree"]'::jsonb, 'The kindness of God our Savior and his love toward mankind', 'Paul says the kindness of God our Savior and his love toward mankind appeared (Titus 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What appeared according to Titus 3:4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 2, 'On what basis did God save us according to Titus 3?', '["According to his mercy, not by works of righteousness we did","Because of our law-keeping","Through family lineage","By public sacrifice"]'::jsonb, 'According to his mercy, not by works of righteousness we did', 'Paul says God saved us not by works done in righteousness, but according to his mercy (Titus 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'On what basis did God save us according to Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 2, 'What do believers become by being justified according to Titus 3?', '["Heirs according to the hope of eternal life","Judges over the nations","Priests in Jerusalem","Free from all labor"]'::jsonb, 'Heirs according to the hope of eternal life', 'Paul says that being justified by God''s grace, we might be made heirs according to the hope of eternal life (Titus 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What do believers become by being justified according to Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 2, 'What does Paul want believers to be careful to maintain in Titus 3?', '["Good works","Public quarrels","Genealogical records","Ceremonial disputes"]'::jsonb, 'Good works', 'Paul says believers should be careful to maintain good works, because these things are good and profitable (Titus 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul want believers to be careful to maintain in Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 2, 'What does Paul say about foolish disputes and law-contentions in Titus 3?', '["They are unprofitable and vain","They are necessary for maturity","They prove zeal for truth","They should fill the church''s schedule"]'::jsonb, 'They are unprofitable and vain', 'Paul says such disputes are unprofitable and vain (Titus 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say about foolish disputes and law-contentions in Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 3, 'Why does Titus 3 begin with civic submission and gentleness?', '["Paul wants gospel-shaped people to display public humility and readiness for good within society","He is making Rome the source of salvation","He thinks government is always right in every action","He is shifting away from Christian ethics"]'::jsonb, 'Paul wants gospel-shaped people to display public humility and readiness for good within society', 'Paul calls believers to submission, obedience, gentleness, and humility toward all people as part of their public witness (Titus 3:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Titus 3 begin with civic submission and gentleness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 3, 'What is the purpose of reminding believers of their former life in Titus 3?', '["It fosters humility and gratitude by showing that salvation came through mercy, not superiority","It means believers remain unchanged","It excuses present sin","It proves only Gentiles needed salvation"]'::jsonb, 'It fosters humility and gratitude by showing that salvation came through mercy, not superiority', 'Paul recalls their former foolishness before describing God''s kindness and mercy in salvation, creating a contrast that humbles and encourages (Titus 3:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the purpose of reminding believers of their former life in Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 3, 'How does Titus 3 connect mercy and renewal?', '["God''s mercy saves in a way that also regenerates and renews by the Holy Spirit","Mercy cancels the need for transformation","Renewal comes only through self-discipline","Paul treats mercy and new life as unrelated"]'::jsonb, 'God''s mercy saves in a way that also regenerates and renews by the Holy Spirit', 'Paul says salvation is according to God''s mercy through the washing of regeneration and renewing by the Holy Spirit (Titus 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Titus 3 connect mercy and renewal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 3, 'Why does Paul move from justification and heirs to good works in Titus 3?', '["Grace-based salvation creates a people who should now devote themselves to what is good and useful","Good works replace grace after conversion","Heirs no longer need practical obedience","The shift is unrelated to what came before"]'::jsonb, 'Grace-based salvation creates a people who should now devote themselves to what is good and useful', 'After explaining mercy, regeneration, justification, and hope, Paul insists believers be careful to maintain good works (Titus 3:5-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul move from justification and heirs to good works in Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 3, 'What does Titus 3 suggest about divisive people?', '["Persistent factiousness is self-condemning and must eventually be rejected after warnings","Division should always be tolerated indefinitely","Factious people are to be made teachers","Warnings are unnecessary if someone is sincere"]'::jsonb, 'Persistent factiousness is self-condemning and must eventually be rejected after warnings', 'Paul says a factious man should be refused after a first and second warning, knowing such a person is perverted and sins, being self-condemned (Titus 3:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Titus 3 suggest about divisive people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 3, 'How does Titus 3 distinguish profitable and unprofitable church activity?', '["Good works and faithful teaching are profitable, while foolish controversies and legal quarrels are vain","Everything discussed in church is equally useful","Only private spirituality is profitable","Public good works are less important than winning debates"]'::jsonb, 'Good works and faithful teaching are profitable, while foolish controversies and legal quarrels are vain', 'Paul calls believers to maintain good works because these things are good and profitable, while foolish disputes and law-contentions are unprofitable and vain (Titus 3:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Titus 3 distinguish profitable and unprofitable church activity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 3, 'Why does Paul mention helping Zenas and Apollos in Titus 3?', '["He shows that good works include practical support for fellow laborers in gospel mission","He is replacing doctrine with travel arrangements","He wants Titus to send them away quickly","He is discussing only private friendship"]'::jsonb, 'He shows that good works include practical support for fellow laborers in gospel mission', 'Paul tells Titus to help Zenas and Apollos diligently so nothing is lacking for them, linking concrete support to the letter''s theme of good works (Titus 3:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention helping Zenas and Apollos in Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 4, 'How does Titus 3 tie Christian public behavior to the gospel?', '["Believers show gentleness and civic humility because they themselves were rescued by mercy, not merit","Public behavior is unrelated to salvation","Mercy applies only to private devotion","Submission is grounded in fear of punishment alone"]'::jsonb, 'Believers show gentleness and civic humility because they themselves were rescued by mercy, not merit', 'Paul moves from commands about public conduct to the reminder that believers too were once foolish before God''s kindness and mercy appeared (Titus 3:1-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 3 tie Christian public behavior to the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 4, 'Why is the contrast between former life and saving mercy so important in Titus 3?', '["It prevents pride and grounds Christian ethics in remembered grace rather than self-righteousness","It suggests believers remain unchanged after conversion","It minimizes the seriousness of sin","It denies the need for obedience after salvation"]'::jsonb, 'It prevents pride and grounds Christian ethics in remembered grace rather than self-righteousness', 'Paul describes the believers'' former bondage and then God''s saving kindness, making mercy the foundation for humility and good works (Titus 3:3-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the contrast between former life and saving mercy so important in Titus 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 4, 'How does Titus 3 portray salvation as Trinitarian in shape?', '["God our Savior acts in kindness and mercy, through the Spirit''s renewing, poured out through Jesus Christ our Savior","Only the Father is active in salvation here","The Spirit is absent from the chapter''s saving work","Jesus is mentioned only as an example"]'::jsonb, 'God our Savior acts in kindness and mercy, through the Spirit''s renewing, poured out through Jesus Christ our Savior', 'The passage speaks of God our Savior''s kindness, the Holy Spirit''s regenerating renewal, and Jesus Christ our Savior as the one through whom the Spirit is poured out (Titus 3:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 3 portray salvation as Trinitarian in shape?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 4, 'What kind of church life does Titus 3 encourage after describing salvation?', '["A church devoted to good works, practical usefulness, and avoidance of sterile controversy","A church focused mainly on endless disputes","A church with no need for discipline","A church detached from public good"]'::jsonb, 'A church devoted to good works, practical usefulness, and avoidance of sterile controversy', 'After the saving summary, Paul says believers should maintain good works and avoid foolish controversies and divisive people (Titus 3:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of church life does Titus 3 encourage after describing salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 4, 'How does the chapter balance mercy and discipline?', '["It proclaims salvation by mercy while also requiring warnings and eventual refusal of the factious person","Mercy cancels all discipline","Discipline replaces mercy as the church''s main message","Paul sees no need for repeated warnings"]'::jsonb, 'It proclaims salvation by mercy while also requiring warnings and eventual refusal of the factious person', 'The chapter contains one of the clearest statements of mercy-based salvation and also instruction to warn and reject the divisive person after repeated admonition (Titus 3:5, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the chapter balance mercy and discipline?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 4, 'Why do Paul''s travel and support instructions fit the chapter''s argument?', '["They concretize the call to good works by showing what useful, fruitful support looks like in practice","They interrupt the letter with irrelevant logistics","They prove doctrine has ended and administration has begun","They focus only on Paul''s personal comfort"]'::jsonb, 'They concretize the call to good works by showing what useful, fruitful support looks like in practice', 'Paul''s instruction to help Zenas and Apollos and to learn to maintain good works shows the chapter''s theology becoming practical action (Titus 3:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why do Paul''s travel and support instructions fit the chapter''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 4, 'How does Titus 3 define truly useful religion?', '["Mercy-shaped lives marked by humility, good works, and fruitful service rather than empty disputes","Strict mastery of genealogies and law debates","Withdrawal from civic life","Public religiosity without practical help"]'::jsonb, 'Mercy-shaped lives marked by humility, good works, and fruitful service rather than empty disputes', 'Paul contrasts merciful salvation and good works with foolish controversies, vain law-contentions, and divisiveness (Titus 3:1-11, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Titus 3 define truly useful religion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 5, 'How does Titus 3 resist both legalism and moral passivity?', '["It denies salvation by works while insisting that those justified by grace must devote themselves to good works","It teaches works save us after grace begins","It dismisses good works as spiritually irrelevant","It replaces mercy with social ethics alone"]'::jsonb, 'It denies salvation by works while insisting that those justified by grace must devote themselves to good works', 'Paul says God saved us not by works of righteousness, yet immediately insists believers be careful to maintain good works (Titus 3:5, 8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Titus 3 resist both legalism and moral passivity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 5, 'Why is Paul''s rehearsal of former sin and present mercy so theologically potent?', '["It destroys spiritual pride and grounds Christian gentleness toward others in remembered rescue","It implies believers should remain in former sins","It shows only some people truly need mercy","It treats past sin as unimportant"]'::jsonb, 'It destroys spiritual pride and grounds Christian gentleness toward others in remembered rescue', 'Paul reminds believers of their own former foolishness just before magnifying God''s kindness and mercy, making humility the fitting result (Titus 3:2-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s rehearsal of former sin and present mercy so theologically potent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 5, 'How does Titus 3 present salvation as both cleansing and inheritance?', '["Salvation renews by the Spirit in the present and justifies believers as heirs of eternal life","Salvation concerns only future inheritance and not present change","Renewal matters, but inheritance does not","Inheritance is gained by genealogy rather than grace"]'::jsonb, 'Salvation renews by the Spirit in the present and justifies believers as heirs of eternal life', 'Paul speaks of regeneration and renewing by the Spirit, then of justification by grace and becoming heirs according to the hope of eternal life (Titus 3:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Titus 3 present salvation as both cleansing and inheritance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 5, 'What deeper ecclesial wisdom underlies the warning against foolish controversies?', '["A healthy church must distinguish between truth that bears fruit and arguments that consume energy without profit","All disagreement is equally unspiritual","Doctrine should be avoided to preserve peace","Paul thinks controversy is always more useful than service"]'::jsonb, 'A healthy church must distinguish between truth that bears fruit and arguments that consume energy without profit', 'Paul contrasts profitable good works and faithful sayings with disputes and law-contentions that are vain and unprofitable (Titus 3:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper ecclesial wisdom underlies the warning against foolish controversies?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 5, 'How does Titus 3 connect doctrine, ethics, and mission?', '["Mercy-based doctrine produces a humble people ready for public good works and practical support of gospel labor","Mission is disconnected from ethics and doctrine","Ethics matter, but supporting gospel workers does not","Doctrine serves only internal debate"]'::jsonb, 'Mercy-based doctrine produces a humble people ready for public good works and practical support of gospel labor', 'The chapter moves from salvation by mercy to public humility, good works, and supporting fellow workers like Zenas and Apollos (Titus 3:1-8, 13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Titus 3 connect doctrine, ethics, and mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 5, 'Why is the chapter''s final emphasis on fruitfulness significant?', '["It shows that grace is meant to yield lives that are practically beneficial rather than barren or argumentative","Fruitfulness here refers only to family size","Paul values usefulness above truth","He means productivity replaces mercy"]'::jsonb, 'It shows that grace is meant to yield lives that are practically beneficial rather than barren or argumentative', 'Paul urges believers to maintain good works for necessary uses so that they will not be unfruitful, tying grace to practical usefulness (Titus 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the chapter''s final emphasis on fruitfulness significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 56, 3, 5, 'What overarching pastoral vision unifies Titus 3?', '["A mercy-saved people should live humbly in public, avoid vain division, and devote themselves to fruitful good works","The chapter is mainly about political strategy in Crete","Paul''s only concern is punishing false teachers","The chapter separates salvation entirely from daily life"]'::jsonb, 'A mercy-saved people should live humbly in public, avoid vain division, and devote themselves to fruitful good works', 'Paul joins civic humility, remembrance of mercy, Spirit-wrought renewal, avoidance of controversies, and devotion to good works in one pastoral pattern (Titus 3:1-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 56
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What overarching pastoral vision unifies Titus 3?'
);
