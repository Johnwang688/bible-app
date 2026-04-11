-- ============================================================================
-- LOGOS LIGHT - 2 Timothy (book 55) quiz questions from quiz-questions/2timothy.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 1, 'According to 2 Timothy 1, to whom is the letter addressed?', '["Timothy","Titus","Silas","Philemon"]'::jsonb, 'Timothy', 'Paul addresses the letter to Timothy, his beloved child (2 Timothy 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 1, to whom is the letter addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 1, 'According to 2 Timothy 1, whom does Paul serve with a pure conscience?', '["God","Caesar","The synagogue council","The Ephesian church"]'::jsonb, 'God', 'Paul says he serves God with a pure conscience, as his forefathers did (2 Timothy 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 1, whom does Paul serve with a pure conscience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 1, 'According to 2 Timothy 1, whose faith first lived in Timothy''s family?', '["Lois and Eunice","Mary and Martha","Priscilla and Lydia","Anna and Elizabeth"]'::jsonb, 'Lois and Eunice', 'Paul recalls the sincere faith that first lived in Timothy''s grandmother Lois and his mother Eunice (2 Timothy 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 1, whose faith first lived in Timothy''s family?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 1, 'According to 2 Timothy 1, what should Timothy stir up?', '["The gift of God","His Roman citizenship","Temple worship","The collection for Jerusalem"]'::jsonb, 'The gift of God', 'Paul tells Timothy to stir up the gift of God that is in him through the laying on of Paul''s hands (2 Timothy 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 1, what should Timothy stir up?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 1, 'According to 2 Timothy 1, what spirit has God not given us?', '["A spirit of fear","A spirit of love","A spirit of power","A spirit of self-control"]'::jsonb, 'A spirit of fear', 'Paul says God did not give us a spirit of fear, but of power, love, and self-control (2 Timothy 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 1, what spirit has God not given us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 1, 'According to 2 Timothy 1, who abolished death?', '["Jesus Christ","Moses","Timothy","An angel"]'::jsonb, 'Jesus Christ', 'Paul says Christ Jesus abolished death and brought life and immortality to light through the gospel (2 Timothy 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 1, who abolished death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 1, 'According to 2 Timothy 1, who often refreshed Paul and was not ashamed of his chain?', '["Onesiphorus","Demas","Alexander","Tychicus"]'::jsonb, 'Onesiphorus', 'Paul says Onesiphorus often refreshed him and was not ashamed of his chain (2 Timothy 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 1, who often refreshed Paul and was not ashamed of his chain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 2, 'Why does Paul thank God in 2 Timothy 1?', '["He remembers Timothy constantly in prayer","He has been released from prison","He has arrived in Ephesus","He has recovered his books"]'::jsonb, 'He remembers Timothy constantly in prayer', 'Paul thanks God as he remembers Timothy in his petitions night and day (2 Timothy 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul thank God in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 2, 'What did Timothy''s tears make Paul desire in 2 Timothy 1?', '["To see Timothy again","To send him to Rome","To rebuke him sharply","To write another letter immediately"]'::jsonb, 'To see Timothy again', 'Paul remembers Timothy''s tears and longs to see him so that he may be filled with joy (2 Timothy 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Timothy''s tears make Paul desire in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 2, 'What three qualities does Paul say come from God''s Spirit in 2 Timothy 1?', '["Power, love, and self-control","Wisdom, wealth, and honor","Faith, sight, and knowledge","Joy, peace, and patience"]'::jsonb, 'Power, love, and self-control', 'Paul says God gives a spirit of power, love, and self-control (2 Timothy 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What three qualities does Paul say come from God''s Spirit in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 2, 'What does Paul tell Timothy not to be ashamed of in 2 Timothy 1?', '["The testimony of our Lord and Paul his prisoner","His youth and weakness","His Jewish background","His work in Ephesus"]'::jsonb, 'The testimony of our Lord and Paul his prisoner', 'Paul tells Timothy not to be ashamed of the testimony of the Lord, nor of Paul his prisoner (2 Timothy 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul tell Timothy not to be ashamed of in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 2, 'According to 2 Timothy 1, when was God''s grace given to believers in Christ Jesus?', '["Before times eternal","At the exodus","At Sinai","After the resurrection only"]'::jsonb, 'Before times eternal', 'Paul says God''s grace was given us in Christ Jesus before times eternal (2 Timothy 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Timothy 1, when was God''s grace given to believers in Christ Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 2, 'What was Paul appointed to be according to 2 Timothy 1?', '["A preacher, apostle, and teacher","A priest and governor","A scribe and elder","A judge and prophet"]'::jsonb, 'A preacher, apostle, and teacher', 'Paul says he was appointed a preacher, an apostle, and a teacher of the Gentiles (2 Timothy 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was Paul appointed to be according to 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 2, 'Whom does Paul say turned away from him in Asia in 2 Timothy 1?', '["Phygelus and Hermogenes","Hymenaeus and Philetus","Demas and Crescens","Titus and Luke"]'::jsonb, 'Phygelus and Hermogenes', 'Paul says all who are in Asia turned away from him, among them Phygelus and Hermogenes (2 Timothy 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom does Paul say turned away from him in Asia in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 3, 'Why does Paul connect Timothy''s family faith with Timothy''s ministry calling in 2 Timothy 1?', '["He shows that Timothy''s present ministry stands in continuity with a sincere inherited faith","He is replacing Timothy''s call with family tradition","He means ministers must come from famous families","He is excusing Timothy from personal responsibility"]'::jsonb, 'He shows that Timothy''s present ministry stands in continuity with a sincere inherited faith', 'Paul recalls the faith in Lois and Eunice to encourage Timothy that the same sincere faith dwells in him as well (2 Timothy 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect Timothy''s family faith with Timothy''s ministry calling in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 3, 'What does Paul''s command to stir up the gift imply in 2 Timothy 1?', '["Spiritual gifts require active, courageous use rather than neglect","Gifts vanish unless constantly replaced","Only apostles have gifts","Timothy had not received a real calling"]'::jsonb, 'Spiritual gifts require active, courageous use rather than neglect', 'Paul urges Timothy to fan into flame the gift of God, linking it with courage rather than fear (2 Timothy 1:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s command to stir up the gift imply in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 3, 'How does 2 Timothy 1 connect suffering with the gospel?', '["Suffering is presented as something believers share for the gospel by God''s power","Suffering means the gospel has failed","The gospel removes all earthly hardship","Only Paul, not Timothy, should suffer"]'::jsonb, 'Suffering is presented as something believers share for the gospel by God''s power', 'Paul tells Timothy to suffer hardship with the gospel according to the power of God (2 Timothy 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Timothy 1 connect suffering with the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 3, 'What does Paul''s confidence in 2 Timothy 1:12 reveal about faith?', '["Faith rests on knowing Christ personally and trusting him to guard what is entrusted","Faith is confidence in personal strength","Faith removes all suffering immediately","Faith means never feeling abandoned"]'::jsonb, 'Faith rests on knowing Christ personally and trusting him to guard what is entrusted', 'Paul says, ''I know him whom I have believed,'' and is persuaded Christ can guard what he entrusted to him until that day (2 Timothy 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s confidence in 2 Timothy 1:12 reveal about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 3, 'Why does Paul emphasize that salvation is not according to works in 2 Timothy 1?', '["He grounds courage in God''s eternal grace rather than human merit","He is denying the value of obedience entirely","He is speaking only about Roman law","He means Timothy should stop serving"]'::jsonb, 'He grounds courage in God''s eternal grace rather than human merit', 'Paul ties salvation and calling to God''s own purpose and grace given in Christ before time, not to our works (2 Timothy 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize that salvation is not according to works in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 3, 'What role does Onesiphorus play in the argument of 2 Timothy 1?', '["He serves as a living example of loyal, unashamed support for a suffering apostle","He represents false teaching in Asia","He is a rival teacher to Timothy","He replaces Timothy in ministry"]'::jsonb, 'He serves as a living example of loyal, unashamed support for a suffering apostle', 'Onesiphorus is praised because he refreshed Paul, searched hard for him in Rome, and was not ashamed of his chains (2 Timothy 1:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What role does Onesiphorus play in the argument of 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 3, 'Why does Paul tell Timothy to keep the pattern of sound words in 2 Timothy 1?', '["The gospel must be preserved faithfully, not reinvented under pressure","Timothy was forbidden to teach publicly","Paul wanted only written liturgy","Sound words were needed for Roman defense only"]'::jsonb, 'The gospel must be preserved faithfully, not reinvented under pressure', 'Paul urges Timothy to hold the pattern of sound words and guard the good deposit through the Holy Spirit (2 Timothy 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul tell Timothy to keep the pattern of sound words in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 4, 'How does 2 Timothy 1 tie personal encouragement to doctrinal truth?', '["Paul strengthens Timothy by grounding him in God''s eternal purpose, Christ''s victory, and the guarded gospel","Encouragement comes only from memory of friendship","Doctrine is absent from Paul''s encouragement","Timothy is told to avoid theological reflection"]'::jsonb, 'Paul strengthens Timothy by grounding him in God''s eternal purpose, Christ''s victory, and the guarded gospel', 'Paul encourages Timothy through themes of grace before time, Christ abolishing death, and the responsibility to guard sound teaching (2 Timothy 1:8-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Timothy 1 tie personal encouragement to doctrinal truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 4, 'Why is shame a central issue in 2 Timothy 1?', '["Because gospel ministry in a suffering context tempts people to distance themselves from a chained apostle and a crucified Lord","Because Timothy had committed a public crime","Because Paul is mainly discussing private emotions","Because shame here refers only to youthful insecurity"]'::jsonb, 'Because gospel ministry in a suffering context tempts people to distance themselves from a chained apostle and a crucified Lord', 'Paul tells Timothy not to be ashamed of the Lord''s testimony or of Paul his prisoner, and contrasts deserters with Onesiphorus (2 Timothy 1:8, 15-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is shame a central issue in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 4, 'What does Paul''s reference to eternal grace add to the chapter''s call for courage?', '["Timothy''s ministry is anchored in God''s plan before time, so present hardship cannot nullify it","It means present obedience no longer matters","It limits grace to Paul alone","It turns the chapter into abstract speculation"]'::jsonb, 'Timothy''s ministry is anchored in God''s plan before time, so present hardship cannot nullify it', 'Paul connects courage in suffering with God''s purpose and grace given in Christ Jesus before times eternal (2 Timothy 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s reference to eternal grace add to the chapter''s call for courage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 4, 'How does chapter 1 present Christian ministry as stewardship?', '["Timothy receives a deposit of sound teaching that must be guarded through the Spirit","Ministry is free self-expression without constraint","Only apostles guard the gospel","Stewardship here refers only to money"]'::jsonb, 'Timothy receives a deposit of sound teaching that must be guarded through the Spirit', 'Paul speaks of the pattern of sound words and the good deposit entrusted to Timothy, to be guarded by the Holy Spirit (2 Timothy 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does chapter 1 present Christian ministry as stewardship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 4, 'What contrast shapes the end of 2 Timothy 1?', '["Desertion by many is set against the faithful loyalty of Onesiphorus","Timothy''s weakness is set against Paul''s strength only","Jewish teachers are set against Gentile rulers","Prayer is set against teaching"]'::jsonb, 'Desertion by many is set against the faithful loyalty of Onesiphorus', 'Paul notes that people in Asia turned away from him, then commends Onesiphorus for diligently seeking and refreshing him (2 Timothy 1:15-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What contrast shapes the end of 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 4, 'Why does Paul move from Timothy''s sincere faith to Christ abolishing death in the same chapter?', '["He situates Timothy''s personal calling within the cosmic saving work of Christ","He changes topics abruptly without connection","He is abandoning pastoral concerns for theology","He wants to compare Timothy with Moses"]'::jsonb, 'He situates Timothy''s personal calling within the cosmic saving work of Christ', 'The chapter moves from Timothy''s upbringing and gift to the gospel by which Christ abolished death and brought life to light (2 Timothy 1:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul move from Timothy''s sincere faith to Christ abolishing death in the same chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 4, 'How does 2 Timothy 1 portray courage?', '["Courage is Spirit-enabled fidelity to the gospel in the face of suffering and shame","Courage is boldness without love or restraint","Courage means avoiding hardship","Courage comes mainly from social approval"]'::jsonb, 'Courage is Spirit-enabled fidelity to the gospel in the face of suffering and shame', 'Paul opposes fear with God''s Spirit, calls Timothy to suffer hardship for the gospel, and urges him to guard the good deposit (2 Timothy 1:7-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Timothy 1 portray courage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 5, 'How does 2 Timothy 1 unite pastoral tenderness and apostolic gravity?', '["Paul''s affection for Timothy serves a larger call to guard the gospel amid suffering, shame, and desertion","Tenderness replaces doctrine in the chapter","The chapter is only formal instruction without affection","Paul separates love from ministry responsibility"]'::jsonb, 'Paul''s affection for Timothy serves a larger call to guard the gospel amid suffering, shame, and desertion', 'Paul''s warm remembrance of Timothy frames a weighty charge about courage, sound words, the gospel deposit, and loyalty under pressure (2 Timothy 1:3-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Timothy 1 unite pastoral tenderness and apostolic gravity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 5, 'Why is Paul''s statement ''I know him whom I have believed'' so central to chapter 1?', '["It shows that perseverance flows from personal trust in Christ rather than merely abstract doctrine","It suggests doctrine no longer matters","It means Paul no longer suffers","It reduces faith to memory of past experiences"]'::jsonb, 'It shows that perseverance flows from personal trust in Christ rather than merely abstract doctrine', 'Paul''s confidence in Christ''s guarding power stands at the center of his willingness to suffer and of his call for Timothy''s steadfastness (2 Timothy 1:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s statement ''I know him whom I have believed'' so central to chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 5, 'How does this chapter resist reducing the gospel to moral improvement?', '["It roots salvation in God''s eternal purpose and in Christ''s destruction of death, not in human works","It teaches morality is irrelevant to believers","It portrays grace as reward for faithful families","It focuses only on external behavior"]'::jsonb, 'It roots salvation in God''s eternal purpose and in Christ''s destruction of death, not in human works', 'Paul grounds salvation and calling in God''s purpose and grace before time and in Christ''s appearing, not in works (2 Timothy 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this chapter resist reducing the gospel to moral improvement?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 5, 'What deeper theology of ministry emerges from Paul''s charge to guard the deposit?', '["Ministry is faithful transmission of a received gospel through the Spirit, not invention of a new message","Ministry is mainly personal inspiration","The deposit refers only to Paul''s private hardships","Timothy is told to preserve tradition without understanding"]'::jsonb, 'Ministry is faithful transmission of a received gospel through the Spirit, not invention of a new message', 'Paul''s language of pattern, sound words, and the good deposit makes ministry an entrusted stewardship upheld by the Holy Spirit (2 Timothy 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper theology of ministry emerges from Paul''s charge to guard the deposit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 5, 'How does Onesiphorus deepen the chapter''s message about discipleship?', '["He embodies costly solidarity with a suffering servant of Christ in contrast to ashamed abandonment","He is simply a travel note without theological force","He proves Rome had accepted the gospel officially","He shows that ministry success depends on wealth"]'::jsonb, 'He embodies costly solidarity with a suffering servant of Christ in contrast to ashamed abandonment', 'Paul places Onesiphorus over against those who turned away, making him an example of gospel-shaped loyalty under shameful circumstances (2 Timothy 1:15-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Onesiphorus deepen the chapter''s message about discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 5, 'What theological tension is held together in 2 Timothy 1?', '["God''s eternal grace secures the gospel, yet Timothy must actively suffer, guard, and remain unashamed","Divine sovereignty removes all human responsibility","Human effort secures salvation apart from grace","The chapter avoids any link between grace and obedience"]'::jsonb, 'God''s eternal grace secures the gospel, yet Timothy must actively suffer, guard, and remain unashamed', 'Paul anchors everything in God''s grace and Christ''s victory, yet he still commands Timothy to stir up his gift, suffer hardship, and guard the deposit (2 Timothy 1:6-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological tension is held together in 2 Timothy 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 1, 5, 'Why does chapter 1 make shame and loyalty decisive spiritual categories?', '["Because allegiance to Christ and his gospel becomes visible in whether one stands with suffering truth or retreats from it","Because Paul is chiefly concerned with social etiquette","Because shame is treated as a private feeling with no doctrinal meaning","Because loyalty here refers only to friendship"]'::jsonb, 'Because allegiance to Christ and his gospel becomes visible in whether one stands with suffering truth or retreats from it', 'The chapter''s contrast between being unashamed, suffering with the gospel, desertion, and Onesiphorus''s loyalty makes shame and loyalty spiritually revelatory (2 Timothy 1:8, 12, 15-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does chapter 1 make shame and loyalty decisive spiritual categories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 1, 'According to 2 Timothy 2, in what should Timothy be strengthened?', '["The grace that is in Christ Jesus","His own zeal","Roman protection","The wisdom of the elders"]'::jsonb, 'The grace that is in Christ Jesus', 'Paul tells Timothy to be strengthened in the grace that is in Christ Jesus (2 Timothy 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 2, in what should Timothy be strengthened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 1, 'According to 2 Timothy 2, to whom should Timothy commit Paul''s teaching?', '["Faithful men who will be able to teach others also","The magistrates of Rome","The synagogue rulers","Only the widows in Ephesus"]'::jsonb, 'Faithful men who will be able to teach others also', 'Paul tells Timothy to entrust what he has heard to faithful men able to teach others also (2 Timothy 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 2, to whom should Timothy commit Paul''s teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 1, 'According to 2 Timothy 2, what should a soldier of Christ Jesus avoid?', '["Entangling himself in the affairs of this life","Prayer and fasting","Teaching sound doctrine","All forms of work"]'::jsonb, 'Entangling himself in the affairs of this life', 'Paul says a soldier on service does not entangle himself in the affairs of this life (2 Timothy 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 2, what should a soldier of Christ Jesus avoid?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 1, 'According to 2 Timothy 2, who should be the first to partake of the crops?', '["The hardworking farmer","The Roman tax collector","The city ruler","The youngest laborer"]'::jsonb, 'The hardworking farmer', 'Paul says the hardworking farmer should be first to partake of the crops (2 Timothy 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 2, who should be the first to partake of the crops?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 1, 'According to 2 Timothy 2, from whose descendants was Jesus Christ raised from the dead?', '["David''s","Aaron''s","Abraham''s","Levi''s"]'::jsonb, 'David''s', 'Paul says Jesus Christ, of the seed of David, was raised from the dead according to his gospel (2 Timothy 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 2, from whose descendants was Jesus Christ raised from the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 1, 'According to 2 Timothy 2, what is not bound?', '["The word of God","Paul''s chains","Timothy''s gift","The church in Ephesus"]'::jsonb, 'The word of God', 'Paul says he suffers hardship even to chains, but the word of God is not bound (2 Timothy 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 2, what is not bound?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 1, 'According to 2 Timothy 2, what should Timothy rightly divide?', '["The word of truth","The Roman law","His inheritance","The offerings of the church"]'::jsonb, 'The word of truth', 'Paul tells Timothy to present himself approved to God, rightly dividing the word of truth (2 Timothy 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 2, what should Timothy rightly divide?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 2, 'Why should Timothy endure hardship as a good soldier in 2 Timothy 2?', '["To please the one who enlisted him","To impress Rome","To gain wealth","To avoid all criticism"]'::jsonb, 'To please the one who enlisted him', 'Paul says the soldier avoids entanglement so that he may please the one who enrolled him (2 Timothy 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why should Timothy endure hardship as a good soldier in 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 2, 'What must an athlete do according to 2 Timothy 2?', '["Compete according to the rules","Win by any means","Avoid public contests","Depend on spectators"]'::jsonb, 'Compete according to the rules', 'Paul says an athlete is not crowned unless he competes according to the rules (2 Timothy 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What must an athlete do according to 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 2, 'Why does Paul endure all things in 2 Timothy 2?', '["For the sake of the chosen","To gain Roman favor","To escape judgment","To silence all debate"]'::jsonb, 'For the sake of the chosen', 'Paul says he endures all things for the sake of the chosen, that they may also obtain salvation in Christ Jesus (2 Timothy 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul endure all things in 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 2, 'What happens if we endure, according to the faithful saying in 2 Timothy 2?', '["We will also reign with him","We will escape all suffering now","We will never be tested","We will judge Rome immediately"]'::jsonb, 'We will also reign with him', 'The faithful saying declares that if we endure, we will also reign with him (2 Timothy 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happens if we endure, according to the faithful saying in 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 2, 'What does profane babbling do according to 2 Timothy 2?', '["It advances to more ungodliness","It produces deeper wisdom","It strengthens the church","It brings peace quickly"]'::jsonb, 'It advances to more ungodliness', 'Paul warns Timothy to shun profane babblings because they advance to more ungodliness (2 Timothy 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does profane babbling do according to 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 2, 'What had Hymenaeus and Philetus said had already happened?', '["The resurrection","The judgment","The appearing of Christ","The destruction of Rome"]'::jsonb, 'The resurrection', 'Hymenaeus and Philetus erred concerning the truth by saying that the resurrection had already taken place (2 Timothy 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What had Hymenaeus and Philetus said had already happened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 2, 'From what should the Lord''s servant be gentle and patient according to 2 Timothy 2?', '["Quarreling","Sound doctrine","Public reading","Hard work"]'::jsonb, 'Quarreling', 'Paul says the Lord''s servant must not quarrel, but be gentle toward all, able to teach, patient (2 Timothy 2:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'From what should the Lord''s servant be gentle and patient according to 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 3, 'Why does Paul use the images of soldier, athlete, and farmer in 2 Timothy 2?', '["They portray endurance, discipline, and labor as essential to ministry","They show Timothy should change careers","They prove ministry is a military office","They mainly describe Roman citizenship"]'::jsonb, 'They portray endurance, discipline, and labor as essential to ministry', 'Paul''s examples highlight focus, lawful striving, and patient toil as patterns for faithful service (2 Timothy 2:3-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul use the images of soldier, athlete, and farmer in 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 3, 'What does ''the word of God is not bound'' contribute to the chapter?', '["It shows the gospel''s power outruns the imprisonment of its messengers","It means Paul has escaped prison","It teaches words have no limits of meaning","It means Timothy need not preach"]'::jsonb, 'It shows the gospel''s power outruns the imprisonment of its messengers', 'Though Paul is chained like an evildoer, he insists God''s word cannot be bound, underscoring the gospel''s freedom and power (2 Timothy 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''the word of God is not bound'' contribute to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 3, 'Why does Paul connect Jesus'' resurrection with David in 2 Timothy 2?', '["He anchors the gospel in both messianic promise and resurrection victory","He is changing subjects to genealogy","He means only Jews can be saved","He is contrasting David with Paul"]'::jsonb, 'He anchors the gospel in both messianic promise and resurrection victory', 'Paul''s summary of the gospel names Jesus as risen from the dead and descended from David, joining messianic identity and resurrection (2 Timothy 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect Jesus'' resurrection with David in 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 3, 'What does the call to rightly divide the word of truth imply about ministry?', '["Teachers must handle God''s word carefully and accurately before God","Only scholars may read Scripture","Truth can be reshaped for each audience","Timothy should avoid doctrine and focus on comfort"]'::jsonb, 'Teachers must handle God''s word carefully and accurately before God', 'Paul frames Timothy''s work as approved labor that does not need shame because he correctly handles the word of truth (2 Timothy 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the call to rightly divide the word of truth imply about ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 3, 'How does the chapter connect doctrinal error with moral damage?', '["False talk spreads like gangrene and overturns faith rather than remaining a harmless idea","Error is treated as purely academic","Doctrine affects only teachers, not hearers","Wrong teaching is less serious than quarrels"]'::jsonb, 'False talk spreads like gangrene and overturns faith rather than remaining a harmless idea', 'Paul says profane talk advances ungodliness and that Hymenaeus and Philetus are upsetting the faith of some (2 Timothy 2:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the chapter connect doctrinal error with moral damage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 3, 'Why does Paul describe the Lord''s servant as gentle and corrective instead of quarrelsome?', '["Repentance is something God may grant through patient truth rather than combative pride","Debate is always sinful in every form","Gentleness means truth does not matter","The servant should avoid correcting anyone"]'::jsonb, 'Repentance is something God may grant through patient truth rather than combative pride', 'Paul says the Lord''s servant must correct opponents in gentleness, in case God gives them repentance to know the truth (2 Timothy 2:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul describe the Lord''s servant as gentle and corrective instead of quarrelsome?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 3, 'What is the significance of the great house imagery in 2 Timothy 2?', '["It distinguishes honorable and dishonorable uses, urging believers to pursue cleansing for service","It teaches the church should be socially elite","It divides salvation by wealth status","It refers only to the temple in Jerusalem"]'::jsonb, 'It distinguishes honorable and dishonorable uses, urging believers to pursue cleansing for service', 'Paul says that in a great house there are vessels for honor and dishonor, and one who cleanses himself becomes useful to the Master (2 Timothy 2:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the great house imagery in 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 4, 'How does 2 Timothy 2 present ministry as both transmission and transformation?', '["Timothy must pass on sound teaching to faithful people while also becoming a cleansed vessel fit for the Master''s use","Only doctrine is passed on; character does not matter","Transformation matters but teaching does not","Transmission here refers only to written letters"]'::jsonb, 'Timothy must pass on sound teaching to faithful people while also becoming a cleansed vessel fit for the Master''s use', 'Paul combines entrusting truth to faithful men with cleansing oneself, fleeing passions, and pursuing virtue (2 Timothy 2:2, 20-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Timothy 2 present ministry as both transmission and transformation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 4, 'Why does Paul place resurrection hope near his commands about suffering?', '["Endurance is sustained by the gospel of the risen Christ and the promise of reigning with him","Suffering makes resurrection unnecessary","Paul is leaving practical ministry for abstract theology","He means Timothy will avoid death entirely"]'::jsonb, 'Endurance is sustained by the gospel of the risen Christ and the promise of reigning with him', 'Paul calls Timothy to hardship, then centers him on Jesus risen from the dead and on the faithful saying about dying and enduring with Christ (2 Timothy 2:3, 8, 11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul place resurrection hope near his commands about suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 4, 'What is the function of the faithful saying in the middle of chapter 2?', '["It interprets ministry hardship within union with Christ, endurance, warning, and faithfulness","It serves only as a poetic pause with no argument","It replaces Paul''s commands entirely","It focuses only on future rewards without present obedience"]'::jsonb, 'It interprets ministry hardship within union with Christ, endurance, warning, and faithfulness', 'The saying ties dying, living, enduring, denying, and Christ''s faithfulness into the chapter''s call for steadfast service (2 Timothy 2:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the function of the faithful saying in the middle of chapter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 4, 'How does the chapter balance firmness and gentleness in dealing with error?', '["Timothy must reject corrupt teaching clearly while correcting opponents with patient gentleness","Gentleness means leaving falsehood unchallenged","Firmness requires harshness and rage","Paul treats false doctrine as unimportant"]'::jsonb, 'Timothy must reject corrupt teaching clearly while correcting opponents with patient gentleness', 'Paul warns sharply against gangrenous false teaching, yet tells the Lord''s servant to correct opponents in gentleness (2 Timothy 2:16-18, 24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the chapter balance firmness and gentleness in dealing with error?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 4, 'What does the seal on God''s firm foundation add to the chapter?', '["It combines divine knowledge of his own with a human call to depart from unrighteousness","It means conduct no longer matters if one belongs to God","It guarantees no one can ever fall into error","It concerns only the temple foundation stones"]'::jsonb, 'It combines divine knowledge of his own with a human call to depart from unrighteousness', 'Paul says the Lord knows those who are his and that everyone naming the Lord''s name should depart from unrighteousness (2 Timothy 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the seal on God''s firm foundation add to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 4, 'How do the soldier, athlete, farmer, and vessel images work together in 2 Timothy 2?', '["They present ministry as focused, disciplined, patient, and morally prepared for useful service","They prove Paul is writing about ordinary labor only","They are unrelated illustrations with no common point","They remove the need for doctrinal accuracy"]'::jsonb, 'They present ministry as focused, disciplined, patient, and morally prepared for useful service', 'Across the chapter, Paul''s images highlight endurance, lawful striving, hard work, and cleansing for honorable use in God''s house (2 Timothy 2:3-6, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the soldier, athlete, farmer, and vessel images work together in 2 Timothy 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 4, 'Why does Paul connect youthful passions with the pursuit of righteousness and peace?', '["The battle for ministry faithfulness involves both rejecting destructive desires and positively pursuing holy community","Youthful passions matter only for private life","Pursuit of peace means avoiding correction","Paul wants Timothy to withdraw from all companionship"]'::jsonb, 'The battle for ministry faithfulness involves both rejecting destructive desires and positively pursuing holy community', 'Paul tells Timothy to flee youthful lusts and pursue righteousness, faith, love, and peace with those who call on the Lord from a pure heart (2 Timothy 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul connect youthful passions with the pursuit of righteousness and peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 5, 'How does 2 Timothy 2 frame the preservation of the gospel across generations?', '["The gospel is handed on through faithful teachers shaped by grace, endurance, and accurate handling of truth","Transmission depends mainly on institutional power","Only apostles can preserve the gospel","Preservation happens automatically without effort"]'::jsonb, 'The gospel is handed on through faithful teachers shaped by grace, endurance, and accurate handling of truth', 'Paul joins strengthening in grace, entrusting truth to faithful men, suffering, and rightly dividing the word of truth in one coherent vision (2 Timothy 2:1-3, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Timothy 2 frame the preservation of the gospel across generations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 5, 'Why is the chapter''s mixture of effort language and divine action theologically important?', '["Paul calls for strenuous ministry while still grounding repentance, stability, and salvation in God''s action","Human effort replaces grace in this chapter","God''s action makes discipline pointless","The chapter avoids divine sovereignty altogether"]'::jsonb, 'Paul calls for strenuous ministry while still grounding repentance, stability, and salvation in God''s action', 'Timothy must be strong, endure, flee, and teach, yet God grants understanding, his word is unbound, and God may grant repentance (2 Timothy 2:1, 7, 9, 25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the chapter''s mixture of effort language and divine action theologically important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 5, 'How does 2 Timothy 2 show that false doctrine is never merely theoretical?', '["It corrupts conduct, spreads like disease, and overturns the faith of hearers while requiring pastoral correction","It stays confined to private speculation","Paul sees doctrine as secondary to harmony","Only public leaders are harmed by error"]'::jsonb, 'It corrupts conduct, spreads like disease, and overturns the faith of hearers while requiring pastoral correction', 'Paul describes false teaching as advancing ungodliness, spreading like gangrene, and upsetting some people''s faith (2 Timothy 2:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Timothy 2 show that false doctrine is never merely theoretical?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 5, 'What deeper pastoral theology emerges from Paul''s commands about quarrels and correction?', '["Truth must be defended in a way that seeks restoration, because opponents are captives who need repentance and release","Correction is mainly about winning arguments","Gentleness is incompatible with doctrinal conviction","Paul expects teachers to avoid troubled people entirely"]'::jsonb, 'Truth must be defended in a way that seeks restoration, because opponents are captives who need repentance and release', 'Paul''s aim is not argumentative triumph but that opponents might come to repentance, know the truth, and escape the devil''s snare (2 Timothy 2:24-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper pastoral theology emerges from Paul''s commands about quarrels and correction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 5, 'How does chapter 2 integrate Christology and ministry practice?', '["The risen Davidic Christ grounds endurance, shapes the faithful saying, and frames the entire pattern of ministry","Christ is mentioned only in the greeting and then disappears","Ministry practice is unrelated to the gospel of Christ","Paul treats resurrection as less important than technique"]'::jsonb, 'The risen Davidic Christ grounds endurance, shapes the faithful saying, and frames the entire pattern of ministry', 'Paul centers the chapter on remembering Jesus Christ raised from the dead, then unfolds endurance, dying and living with him, and faithful service in light of that gospel (2 Timothy 2:8-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter 2 integrate Christology and ministry practice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 5, 'Why is cleansing oneself for honorable use a fitting climax to the chapter''s argument?', '["After warning about corrupt teaching and quarrels, Paul shows that holiness and usefulness are inseparable in God''s house","It means salvation depends on ritual purity","It shifts the chapter away from ministry entirely","It proves only a few believers belong to the church"]'::jsonb, 'After warning about corrupt teaching and quarrels, Paul shows that holiness and usefulness are inseparable in God''s house', 'The chapter''s concern for truth, conduct, and correction culminates in the call to be a vessel for honor, sanctified and fit for the Master''s use (2 Timothy 2:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is cleansing oneself for honorable use a fitting climax to the chapter''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 2, 5, 'What overarching vision of ministry holds 2 Timothy 2 together?', '["Faithful ministry is grace-strengthened transmission of truth through suffering, holiness, patience, and hope in Christ","Ministry is mainly administrative efficiency","The chapter treats ministry as personal self-fulfillment","Paul''s only concern is silencing critics"]'::jsonb, 'Faithful ministry is grace-strengthened transmission of truth through suffering, holiness, patience, and hope in Christ', 'From strengthening in grace to entrusting truth, suffering hardship, avoiding error, and gently correcting opponents, the chapter presents a unified pastoral vision centered in Christ (2 Timothy 2:1-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What overarching vision of ministry holds 2 Timothy 2 together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 1, 'According to 2 Timothy 3, in what times will difficult days come?', '["The last days","The days of Moses","The time of David","The exile"]'::jsonb, 'The last days', 'Paul says that in the last days difficult times will come (2 Timothy 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 3, in what times will difficult days come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 1, 'According to 2 Timothy 3, what will people be lovers of first in Paul''s list?', '["Themselves","Wisdom","Scripture","Peace"]'::jsonb, 'Themselves', 'Paul begins the list by saying men will be lovers of self (2 Timothy 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 3, what will people be lovers of first in Paul''s list?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 1, 'According to 2 Timothy 3, what kind of form do some people have while denying its power?', '["A form of godliness","A form of wisdom","A form of prophecy","A form of power"]'::jsonb, 'A form of godliness', 'Paul says some have a form of godliness but deny its power (2 Timothy 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 3, what kind of form do some people have while denying its power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 1, 'According to 2 Timothy 3, whom did Paul say withstood Moses?', '["Jannes and Jambres","Hymenaeus and Philetus","Phygelus and Hermogenes","Annas and Caiaphas"]'::jsonb, 'Jannes and Jambres', 'Paul compares false teachers to Jannes and Jambres, who withstood Moses (2 Timothy 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 3, whom did Paul say withstood Moses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 1, 'According to 2 Timothy 3, who rescued Paul from all his persecutions?', '["The Lord","Timothy","The Roman guards","Barnabas"]'::jsonb, 'The Lord', 'Paul says the Lord delivered him out of all his persecutions (2 Timothy 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 3, who rescued Paul from all his persecutions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 1, 'According to 2 Timothy 3, what will all who desire to live godly in Christ Jesus suffer?', '["Persecution","Immediate honor","Riches","Political power"]'::jsonb, 'Persecution', 'Paul says all who desire to live godly in Christ Jesus will suffer persecution (2 Timothy 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 3, what will all who desire to live godly in Christ Jesus suffer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 1, 'According to 2 Timothy 3, from childhood what had Timothy known?', '["The holy Scriptures","The rhetoric of Rome","The secrets of the philosophers","The songs of the temple choir"]'::jsonb, 'The holy Scriptures', 'Paul says Timothy had known the holy Scriptures from childhood (2 Timothy 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 3, from childhood what had Timothy known?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 2, 'What should Timothy do with people who have a form of godliness but deny its power?', '["Turn away from them","Appoint them as teachers","Ignore them completely forever","Ask Rome to punish them"]'::jsonb, 'Turn away from them', 'Paul says to turn away from such people (2 Timothy 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should Timothy do with people who have a form of godliness but deny its power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 2, 'What kind of women do certain deceivers capture according to 2 Timothy 3?', '["Silly women loaded down with sins","Faithful widows","Women gifted in prophecy","Mothers of the church"]'::jsonb, 'Silly women loaded down with sins', 'Paul says some creep into houses and take captive silly women loaded with sins and led away by various lusts (2 Timothy 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of women do certain deceivers capture according to 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 2, 'What does Paul say these deceived women are always doing?', '["Learning but never able to come to the knowledge of the truth","Praying night and day","Serving the poor faithfully","Teaching the churches boldly"]'::jsonb, 'Learning but never able to come to the knowledge of the truth', 'Paul says they are always learning and never able to come to the knowledge of the truth (2 Timothy 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say these deceived women are always doing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 2, 'What had Timothy closely followed in Paul''s life according to 2 Timothy 3?', '["Teaching, conduct, purpose, faith, love, patience, persecutions, and sufferings","Only Paul''s travel routes","His Roman legal strategy","His financial accounts"]'::jsonb, 'Teaching, conduct, purpose, faith, love, patience, persecutions, and sufferings', 'Paul lists many aspects of his life that Timothy had followed closely, including doctrine and endurance in suffering (2 Timothy 3:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What had Timothy closely followed in Paul''s life according to 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 2, 'What will evil men and impostors do according to 2 Timothy 3?', '["Grow worse and worse, deceiving and being deceived","Repent quickly","Become faithful teachers","Disappear from the churches"]'::jsonb, 'Grow worse and worse, deceiving and being deceived', 'Paul says evil men and impostors will proceed from bad to worse, deceiving and being deceived (2 Timothy 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What will evil men and impostors do according to 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 2, 'What are the Scriptures able to make Timothy wise for?', '["Salvation through faith in Christ Jesus","Roman law and citizenship","Success in public debate","Health and wealth"]'::jsonb, 'Salvation through faith in Christ Jesus', 'Paul says the holy Scriptures are able to make Timothy wise for salvation through faith in Christ Jesus (2 Timothy 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What are the Scriptures able to make Timothy wise for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 2, 'For what four things is all Scripture profitable according to 2 Timothy 3?', '["Teaching, reproof, correction, and instruction in righteousness","Government, trade, farming, and music","Healing, prophecy, fasting, and travel","Knowledge, secrecy, power, and honor"]'::jsonb, 'Teaching, reproof, correction, and instruction in righteousness', 'Paul says all Scripture is inspired by God and profitable for teaching, reproof, correction, and instruction in righteousness (2 Timothy 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'For what four things is all Scripture profitable according to 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 3, 'Why does Paul pair moral corruption with religious appearance in 2 Timothy 3?', '["He shows that outward godliness can mask deep rebellion when its transforming power is denied","He means all religious forms are false","He opposes all discipline and order","He is discussing only pagan society"]'::jsonb, 'He shows that outward godliness can mask deep rebellion when its transforming power is denied', 'Paul describes many sins and then says such people have a form of godliness while denying its power (2 Timothy 3:2-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul pair moral corruption with religious appearance in 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 3, 'What is the function of Paul''s personal example in 2 Timothy 3?', '["It gives Timothy a lived pattern of faithful doctrine joined to patient suffering","It replaces the authority of Scripture","It proves persecution is unique to apostles only","It invites Timothy to imitate Paul''s personality only"]'::jsonb, 'It gives Timothy a lived pattern of faithful doctrine joined to patient suffering', 'Paul contrasts corrupt teachers with the way Timothy has followed his teaching, conduct, faith, love, patience, and sufferings (2 Timothy 3:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the function of Paul''s personal example in 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 3, 'Why does Paul say all who desire to live godly in Christ will suffer persecution?', '["Faithful life in Christ provokes opposition in a world resistant to godliness","Persecution comes only from poor planning","Godliness guarantees social favor","Paul is speaking only about Timothy''s city"]'::jsonb, 'Faithful life in Christ provokes opposition in a world resistant to godliness', 'Paul presents persecution as a normal consequence of godly life in Christ, not as a surprising exception (2 Timothy 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say all who desire to live godly in Christ will suffer persecution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 3, 'How does 2 Timothy 3 connect Scripture to Christian maturity?', '["Scripture equips the servant of God thoroughly for every good work","Scripture is useful only for salvation but not for growth","Maturity comes mainly through suffering without teaching","Only teachers, not ordinary believers, need Scripture"]'::jsonb, 'Scripture equips the servant of God thoroughly for every good work', 'Paul says Scripture is profitable so that the man of God may be complete, thoroughly equipped for every good work (2 Timothy 3:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Timothy 3 connect Scripture to Christian maturity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 3, 'What does the phrase ''inspired by God'' emphasize in 2 Timothy 3?', '["Scripture''s authority and usefulness come from God''s own breath","Only parts of Scripture reflect God","Scripture is mainly human reflection","Inspiration replaces the need to understand context"]'::jsonb, 'Scripture''s authority and usefulness come from God''s own breath', 'By calling all Scripture God-breathed, Paul grounds its profit and authority in God himself (2 Timothy 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the phrase ''inspired by God'' emphasize in 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 3, 'Why does Paul tell Timothy to continue in what he has learned?', '["Because Timothy knows both the trustworthy teachers and the trustworthy Scriptures that formed him","Because Timothy must avoid all new understanding","Because learning ended in childhood","Because Paul fears Timothy cannot think for himself"]'::jsonb, 'Because Timothy knows both the trustworthy teachers and the trustworthy Scriptures that formed him', 'Paul appeals to what Timothy learned, from whom he learned it, and his childhood knowledge of Scripture (2 Timothy 3:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul tell Timothy to continue in what he has learned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 3, 'How do the examples of Jannes and Jambres function in the chapter?', '["They show that resistance to God''s truth can imitate religion while opposing it fundamentally","They prove Moses failed in ministry","They identify the only false teachers Timothy faced","They are included merely as historical trivia"]'::jsonb, 'They show that resistance to God''s truth can imitate religion while opposing it fundamentally', 'Paul compares current opponents to Jannes and Jambres, depicting them as corrupt in mind and opposed to the truth (2 Timothy 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How do the examples of Jannes and Jambres function in the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 4, 'How does 2 Timothy 3 contrast counterfeit religion with genuine faithfulness?', '["Counterfeit religion keeps appearances while resisting truth, whereas genuine faithfulness joins sound teaching, suffering, and Scriptural formation","Counterfeit religion is mainly atheism","Genuine faithfulness avoids all hardship","Paul focuses only on moral behavior and not truth"]'::jsonb, 'Counterfeit religion keeps appearances while resisting truth, whereas genuine faithfulness joins sound teaching, suffering, and Scriptural formation', 'Paul contrasts godliness without power and truth-resistant deceivers with Timothy''s following of Paul''s life and the authority of Scripture (2 Timothy 3:5, 8, 10, 14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Timothy 3 contrast counterfeit religion with genuine faithfulness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 4, 'Why does Paul move from cultural decay to Scripture in the same chapter?', '["The darker the times, the more Timothy must remain anchored in God-breathed Scripture","Scripture is introduced to change the subject","Paul wants Timothy to leave society entirely","The list of sins is unrelated to ministry"]'::jsonb, 'The darker the times, the more Timothy must remain anchored in God-breathed Scripture', 'After describing perilous last-day conditions and worsening deceivers, Paul tells Timothy to continue in Scripture, which equips the man of God for every good work (2 Timothy 3:1-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul move from cultural decay to Scripture in the same chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 4, 'What does chapter 3 imply about the relationship between truth and suffering?', '["Faithful attachment to truth often entails persecution, while resistance to truth breeds deception","Truth guarantees peaceful acceptance","Suffering proves teaching is false","Deception flourishes only where Scripture is absent from childhood"]'::jsonb, 'Faithful attachment to truth often entails persecution, while resistance to truth breeds deception', 'Paul links godly living with persecution and depicts impostors as deceiving and being deceived, while Timothy is called to remain in the truth (2 Timothy 3:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does chapter 3 imply about the relationship between truth and suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 4, 'How does Paul''s testimony from Antioch, Iconium, and Lystra strengthen Timothy?', '["It shows that persecution has marked faithful ministry before and that the Lord remains the deliverer","It proves Paul had an easy ministry after conversion","It suggests Timothy should avoid all public witness","It means suffering belongs only to Paul''s generation"]'::jsonb, 'It shows that persecution has marked faithful ministry before and that the Lord remains the deliverer', 'Paul reminds Timothy of his persecutions and immediately adds that the Lord delivered him out of them all (2 Timothy 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s testimony from Antioch, Iconium, and Lystra strengthen Timothy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 4, 'Why is Timothy''s childhood knowledge of Scripture strategically important in the letter?', '["It means Timothy is not beginning from scratch but from a long-formed Scriptural foundation for present ministry","It excuses him from needing Paul''s instruction","It suggests adulthood makes Scripture less useful","It proves only children can learn Scripture deeply"]'::jsonb, 'It means Timothy is not beginning from scratch but from a long-formed Scriptural foundation for present ministry', 'Paul appeals to Timothy''s long acquaintance with the holy Scriptures as a foundation for wisdom, perseverance, and ministry readiness (2 Timothy 3:14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Timothy''s childhood knowledge of Scripture strategically important in the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 4, 'What does chapter 3 present as the antidote to deceptive last-days religion?', '["Continuing in apostolic example and God-breathed Scripture that forms sound doctrine and righteous living","Greater rhetorical skill than the deceivers","Withdrawal from all public life","Strictly emotional worship experiences"]'::jsonb, 'Continuing in apostolic example and God-breathed Scripture that forms sound doctrine and righteous living', 'Paul points Timothy to what he has learned from Paul and to the Scriptures that make him wise and equip him fully for good works (2 Timothy 3:10, 14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does chapter 3 present as the antidote to deceptive last-days religion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 4, 'How does 2 Timothy 3 present the last days?', '["As a period marked by moral disintegration, deceptive religiosity, and the need for steadfast truth","As a time of automatic spiritual triumph for all","As an era where persecution ends","As a purely political crisis without religious implications"]'::jsonb, 'As a period marked by moral disintegration, deceptive religiosity, and the need for steadfast truth', 'Paul''s description of vice, deceptive teachers, persecution, and the call to continue in Scripture shows a morally and spiritually dangerous age (2 Timothy 3:1-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Timothy 3 present the last days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 5, 'How does 2 Timothy 3 shape a theology of Scripture without reducing Scripture to a slogan?', '["It presents Scripture as God-breathed, saving in relation to Christ, and practical for forming the entire life of the servant of God","It treats Scripture as useful only for doctrinal disputes","It makes Scripture replace all teaching relationships","It values Scripture mainly as cultural heritage"]'::jsonb, 'It presents Scripture as God-breathed, saving in relation to Christ, and practical for forming the entire life of the servant of God', 'Paul connects Scripture to salvation through faith in Christ Jesus and to teaching, correction, training, and complete equipping for good works (2 Timothy 3:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Timothy 3 shape a theology of Scripture without reducing Scripture to a slogan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 5, 'Why is the chapter''s depiction of false teachers especially penetrating?', '["They are not merely immoral outsiders but religious deceivers whose outward form disguises opposition to truth","They are presented only as ignorant unbelievers with no influence","Their main problem is lack of education","Paul treats them as harmless background noise"]'::jsonb, 'They are not merely immoral outsiders but religious deceivers whose outward form disguises opposition to truth', 'Paul describes them as having a form of godliness while denying its power, and as resisting the truth like Jannes and Jambres (2 Timothy 3:5, 8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the chapter''s depiction of false teachers especially penetrating?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 5, 'How does Paul weave biography, prophecy, and Scripture together in this chapter?', '["He reads Timothy''s ministry through the lens of last-days reality, apostolic example, and the enduring authority of Scripture","He abandons prophecy in favor of memoir","He sets Scripture against experience","He limits ministry guidance to personal memories"]'::jsonb, 'He reads Timothy''s ministry through the lens of last-days reality, apostolic example, and the enduring authority of Scripture', 'The chapter moves from difficult times to Paul''s own example and then to Timothy''s lifelong grounding in Scripture, integrating all three strands (2 Timothy 3:1-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul weave biography, prophecy, and Scripture together in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 5, 'What does 2 Timothy 3 imply about Christian maturity in corrupt times?', '["Maturity requires discernment about false appearances, endurance under suffering, and deep Scriptural formation","Maturity is mainly avoiding contact with society","Maturity is measured by rhetorical superiority","Maturity means escaping persecution through compromise"]'::jsonb, 'Maturity requires discernment about false appearances, endurance under suffering, and deep Scriptural formation', 'Timothy must detect counterfeit godliness, learn from Paul''s sufferings, and continue in the Scriptures that equip him thoroughly (2 Timothy 3:5, 10-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 2 Timothy 3 imply about Christian maturity in corrupt times?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 5, 'Why is persecution treated as normal rather than exceptional in this chapter?', '["Paul presents it as the ordinary collision between godly life in Christ and a deceptive, resistant age","He expects faithful believers to be socially celebrated","He thinks persecution happens only to apostles","He means persecution is caused by poor behavior"]'::jsonb, 'Paul presents it as the ordinary collision between godly life in Christ and a deceptive, resistant age', 'By stating that all who desire to live godly in Christ will suffer persecution, Paul normalizes suffering within faithful discipleship (2 Timothy 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is persecution treated as normal rather than exceptional in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 5, 'How does the chapter resist both traditionalism and novelty as ultimate authorities?', '["Timothy is told to continue in what he learned not because it is old, but because it is true, apostolic, and Scriptural","Paul values novelty above inherited teaching","The chapter teaches any tradition is automatically trustworthy","Timothy is told to ignore all prior instruction"]'::jsonb, 'Timothy is told to continue in what he learned not because it is old, but because it is true, apostolic, and Scriptural', 'Paul appeals to the trustworthiness of Timothy''s teachers and to the divine origin and profit of Scripture, not to age alone (2 Timothy 3:14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the chapter resist both traditionalism and novelty as ultimate authorities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 3, 5, 'What overarching pastoral logic structures 2 Timothy 3?', '["Because corruption and deception intensify, Timothy must cling more tightly to embodied apostolic example and God-breathed Scripture","As corruption rises, Timothy should reduce doctrinal seriousness","The chapter argues that ministry depends chiefly on social strategy","Paul concludes that Scripture is insufficient for hard times"]'::jsonb, 'Because corruption and deception intensify, Timothy must cling more tightly to embodied apostolic example and God-breathed Scripture', 'The worsening last-days context leads directly to Paul''s appeal: you, however, followed my life and must continue in the Scriptures you know (2 Timothy 3:10, 14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What overarching pastoral logic structures 2 Timothy 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 1, 'According to 2 Timothy 4, what does Paul tell Timothy to preach?', '["The word","His own opinions","Roman law","The wisdom of Greece"]'::jsonb, 'The word', 'Paul charges Timothy to preach the word (2 Timothy 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 4, what does Paul tell Timothy to preach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 1, 'According to 2 Timothy 4, what will people heap up for themselves because of itching ears?', '["Teachers","Treasures","Prophets of Baal","Roman patrons"]'::jsonb, 'Teachers', 'Paul says people will heap up teachers for themselves because they have itching ears (2 Timothy 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 4, what will people heap up for themselves because of itching ears?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 1, 'According to 2 Timothy 4, what has Paul finished?', '["The race","The temple","His letters","His journey to Spain"]'::jsonb, 'The race', 'Paul says, ''I have finished the race'' (2 Timothy 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 4, what has Paul finished?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 1, 'According to 2 Timothy 4, what has Paul kept?', '["The faith","The law of Rome","The temple vessels","The peace of the city"]'::jsonb, 'The faith', 'Paul says, ''I have kept the faith'' (2 Timothy 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 4, what has Paul kept?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 1, 'According to 2 Timothy 4, who loved this present world and deserted Paul?', '["Demas","Luke","Mark","Onesiphorus"]'::jsonb, 'Demas', 'Paul says Demas deserted him, having loved this present world (2 Timothy 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 4, who loved this present world and deserted Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 1, 'According to 2 Timothy 4, who alone was with Paul?', '["Luke","Titus","Crescens","Tychicus"]'::jsonb, 'Luke', 'Paul says only Luke is with him (2 Timothy 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 4, who alone was with Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 1, 'According to 2 Timothy 4, what had Alexander the coppersmith done?', '["He did Paul much evil","He supplied Paul''s needs","He carried the letter","He defended Paul before Caesar"]'::jsonb, 'He did Paul much evil', 'Paul says Alexander the coppersmith did him much evil (2 Timothy 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Timothy 4, what had Alexander the coppersmith done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 2, 'How should Timothy preach the word according to 2 Timothy 4?', '["Be urgent in season and out of season","Only when invited","Only during festivals","Only in private homes"]'::jsonb, 'Be urgent in season and out of season', 'Paul tells Timothy to be urgent in season and out of season as he preaches the word (2 Timothy 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should Timothy preach the word according to 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 2, 'What will people turn aside to according to 2 Timothy 4?', '["Myths","The Psalms","The prophets","Sound words"]'::jsonb, 'Myths', 'Paul says people will turn away their ears from the truth and turn aside to myths (2 Timothy 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What will people turn aside to according to 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 2, 'What four duties does Paul give Timothy in 2 Timothy 4:5?', '["Be sober, endure suffering, do an evangelist''s work, fulfill your ministry","Fast often, travel widely, debate constantly, appoint elders","Write another letter, visit Rome, guard the prison, collect funds","Rebuke rulers, avoid Gentiles, stay silent, await Paul"]'::jsonb, 'Be sober, endure suffering, do an evangelist''s work, fulfill your ministry', 'Paul tells Timothy to be sober in all things, suffer hardship, do the work of an evangelist, and fulfill his ministry (2 Timothy 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What four duties does Paul give Timothy in 2 Timothy 4:5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 2, 'How does Paul describe his present condition in 2 Timothy 4?', '["Already being offered and the time of departure has come","Fully restored and returning soon","Free to travel wherever he pleases","Hidden safely among friends"]'::jsonb, 'Already being offered and the time of departure has come', 'Paul says he is already being offered and the time of his departure has come (2 Timothy 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe his present condition in 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 2, 'For whom is the crown of righteousness laid up according to 2 Timothy 4?', '["All who have loved Christ''s appearing","Only apostles","Only martyrs","Only elders in Ephesus"]'::jsonb, 'All who have loved Christ''s appearing', 'Paul says the Lord will give the crown not only to him, but also to all who have loved Christ''s appearing (2 Timothy 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'For whom is the crown of righteousness laid up according to 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 2, 'Why did Paul want Timothy to bring Mark?', '["Because he was useful to Paul for service","Because Mark had Roman influence","Because Mark carried Paul''s books","Because Mark lived in Troas"]'::jsonb, 'Because he was useful to Paul for service', 'Paul says to take Mark and bring him, for he is useful to him for ministry (2 Timothy 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Paul want Timothy to bring Mark?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 2, 'What items does Paul ask Timothy to bring from Troas?', '["The cloak, the books, and especially the parchments","His chains, his sandals, and a lamp","Bread, wine, and letters","Money, clothes, and scroll cases"]'::jsonb, 'The cloak, the books, and especially the parchments', 'Paul asks Timothy to bring the cloak left with Carpus at Troas, the books, and especially the parchments (2 Timothy 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What items does Paul ask Timothy to bring from Troas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 3, 'Why does Paul charge Timothy so solemnly at the start of 2 Timothy 4?', '["Timothy''s preaching takes place before God and Christ in view of coming judgment and appearing","Paul wants to emphasize Timothy''s personal reputation only","The charge is mainly about church administration","He is preparing Timothy for a legal speech in Rome"]'::jsonb, 'Timothy''s preaching takes place before God and Christ in view of coming judgment and appearing', 'Paul gives the charge before God and Christ Jesus, who will judge the living and the dead, by his appearing and kingdom (2 Timothy 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul charge Timothy so solemnly at the start of 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 3, 'What does the warning about itching ears teach about false teaching in 2 Timothy 4?', '["False teaching often thrives because hearers want messages that suit their desires","False teaching spreads only through persecution","Teachers alone create error without any audience demand","Itching ears refer only to physical sickness"]'::jsonb, 'False teaching often thrives because hearers want messages that suit their desires', 'Paul says people will not endure sound teaching but will heap up teachers according to their own desires because they have itching ears (2 Timothy 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the warning about itching ears teach about false teaching in 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 3, 'How does Paul''s self-description as being poured out function in 2 Timothy 4?', '["It presents his approaching death as sacrificial completion rather than defeat","It means Paul expects immediate escape","It shows he regrets his ministry","It refers only to physical weakness"]'::jsonb, 'It presents his approaching death as sacrificial completion rather than defeat', 'Paul says he is already being offered, using sacrificial language as he nears death (2 Timothy 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s self-description as being poured out function in 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 3, 'What does the crown of righteousness reveal about Paul''s hope in 2 Timothy 4?', '["His confidence rests in the Lord''s just future reward for faithful endurance","He expects honor from Rome","He believes he has earned salvation by effort","He thinks only he will be vindicated"]'::jsonb, 'His confidence rests in the Lord''s just future reward for faithful endurance', 'Paul expects the righteous Judge to award the crown on that day, and not only to him but to all who love Christ''s appearing (2 Timothy 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the crown of righteousness reveal about Paul''s hope in 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 3, 'Why does Paul mention both Demas and Mark in the same chapter?', '["They illustrate opposite trajectories: desertion through worldliness and restored usefulness in ministry","They are named simply to fill out travel details","Both men had equally abandoned Paul","Both men were being sent to the same city"]'::jsonb, 'They illustrate opposite trajectories: desertion through worldliness and restored usefulness in ministry', 'Demas deserted Paul, loving the present world, while Mark is said to be useful for ministry, creating a strong contrast (2 Timothy 4:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention both Demas and Mark in the same chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 3, 'What does Paul''s first defense reveal in 2 Timothy 4?', '["Human support may fail, yet the Lord remains present and strengthening","Paul was fully supported by all believers","Paul no longer needed prayer","His defense ended the opposition permanently"]'::jsonb, 'Human support may fail, yet the Lord remains present and strengthening', 'Paul says no one took his part at his first defense, but the Lord stood by him and strengthened him (2 Timothy 4:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s first defense reveal in 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 3, 'Why does Paul say the Lord strengthened him at his defense?', '["So the message might be fully proclaimed and all the Gentiles might hear","So he could escape prison immediately","So he could condemn all his friends","So he could recover his possessions"]'::jsonb, 'So the message might be fully proclaimed and all the Gentiles might hear', 'Paul says the Lord strengthened him so that through him the proclamation might be fully made and all the Gentiles might hear (2 Timothy 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say the Lord strengthened him at his defense?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 4, 'How does 2 Timothy 4 connect preaching with eschatology?', '["Timothy''s present preaching is carried out before the coming Judge and within the horizon of Christ''s appearing and kingdom","Preaching matters only for present church order","Eschatology makes preaching unnecessary","Paul limits judgment language to his own trial"]'::jsonb, 'Timothy''s present preaching is carried out before the coming Judge and within the horizon of Christ''s appearing and kingdom', 'Paul''s opening charge grounds preaching in Christ''s future judgment, appearing, and kingdom (2 Timothy 4:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Timothy 4 connect preaching with eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 4, 'What contrast structures the middle of chapter 4?', '["People turn from truth to myths while Timothy is commanded to stay sober, suffer, and fulfill ministry","Paul contrasts Jews and Gentiles without ministry application","The chapter moves from doctrine to travel notes with no continuity","Timothy is told to pursue popularity instead of endurance"]'::jsonb, 'People turn from truth to myths while Timothy is commanded to stay sober, suffer, and fulfill ministry', 'After warning about itching ears and myths, Paul tells Timothy to endure hardship and complete his ministry faithfully (2 Timothy 4:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What contrast structures the middle of chapter 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 4, 'How does Paul''s nearing death intensify his final instructions?', '["His own completed course turns the charge to Timothy into a handoff of faithful ministry","It causes him to retract earlier commands","It means Timothy no longer needs to preach","It shifts the letter away from the gospel entirely"]'::jsonb, 'His own completed course turns the charge to Timothy into a handoff of faithful ministry', 'Paul''s declaration that he has fought the good fight and finished the race gives added force to his charge for Timothy to preach and fulfill his ministry (2 Timothy 4:5-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s nearing death intensify his final instructions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 4, 'What does chapter 4 suggest about the loneliness of ministry?', '["Faithful servants may be deserted by some and opposed by others, yet upheld by the Lord","Paul describes ministry as constant companionship and ease","Loneliness proves ministry failure","The chapter says only Timothy experiences abandonment"]'::jsonb, 'Faithful servants may be deserted by some and opposed by others, yet upheld by the Lord', 'Demas deserts Paul, others depart elsewhere, Alexander opposes him, and at his first defense no one stands by him, yet the Lord strengthens him (2 Timothy 4:10, 14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does chapter 4 suggest about the loneliness of ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 4, 'Why does Paul include ordinary requests like the cloak and parchments alongside lofty themes?', '["The chapter shows that profound apostolic faithfulness is lived out in concrete embodied needs and ongoing work","These details are accidental and meaningless","Paul is abandoning spiritual concerns for materialism","The requests contradict his hope in Christ"]'::jsonb, 'The chapter shows that profound apostolic faithfulness is lived out in concrete embodied needs and ongoing work', 'Paul moves naturally from judgment, preaching, and final hope to practical needs such as the cloak, books, and parchments, showing ministry''s embodied reality (2 Timothy 4:1-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul include ordinary requests like the cloak and parchments alongside lofty themes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 4, 'How does the chapter portray the Lord''s faithfulness at the end of Paul''s life?', '["The Lord stands by Paul, strengthens proclamation, delivers him from evil, and brings him safely to the heavenly kingdom","The Lord''s help is limited to earthly release only","Paul is unsure whether the Lord will remain with him","The Lord helps only through human friends"]'::jsonb, 'The Lord stands by Paul, strengthens proclamation, delivers him from evil, and brings him safely to the heavenly kingdom', 'Paul says the Lord stood by him, strengthened him, delivered him from the lion''s mouth, and will preserve him for the heavenly kingdom (2 Timothy 4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the chapter portray the Lord''s faithfulness at the end of Paul''s life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 4, 'What does Paul''s confidence in the righteous Judge add to the letter''s final tone?', '["It turns a farewell under hardship into a hopeful anticipation of divine vindication","It shows Paul expects vindication from Nero","It means Paul''s ministry is driven by fear only","It removes the need for perseverance"]'::jsonb, 'It turns a farewell under hardship into a hopeful anticipation of divine vindication', 'Paul''s hope for the crown from the righteous Judge frames his final words with confidence rather than despair (2 Timothy 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s confidence in the righteous Judge add to the letter''s final tone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 5, 'How does 2 Timothy 4 bring the whole letter''s themes to a climax?', '["It unites the charge to preach, the reality of defection, Paul''s finished course, and the Lord''s final faithfulness in one closing commission","It abandons the earlier themes for travel logistics","It reduces the letter to personal nostalgia","It ends by denying the danger of false teaching"]'::jsonb, 'It unites the charge to preach, the reality of defection, Paul''s finished course, and the Lord''s final faithfulness in one closing commission', 'The chapter gathers together truth, suffering, endurance, desertion, completed ministry, and confidence in the Lord''s preservation (2 Timothy 4:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Timothy 4 bring the whole letter''s themes to a climax?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 5, 'Why is the command to preach the word placed under the gaze of judgment and kingdom?', '["Because preaching is accountable before Christ and participates in realities larger than Timothy''s immediate circumstances","Because Timothy is being prepared to become a civil ruler","Because Paul thinks sermons replace discipleship","Because judgment language is only rhetorical decoration"]'::jsonb, 'Because preaching is accountable before Christ and participates in realities larger than Timothy''s immediate circumstances', 'Paul''s solemn charge invokes Christ''s future judgment, appearing, and kingdom, giving preaching eschatological seriousness (2 Timothy 4:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the command to preach the word placed under the gaze of judgment and kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 5, 'How does Paul present faithful ministry as both contested and triumphant?', '["It is contested by myths, desertion, and opposition, yet triumphant because the Lord preserves both the message and the messenger","Triumph means ministry faces no opposition","Contest proves the message is false","Victory depends on human loyalty alone"]'::jsonb, 'It is contested by myths, desertion, and opposition, yet triumphant because the Lord preserves both the message and the messenger', 'The chapter includes itching ears, Demas, Alexander, and abandonment, yet the Lord strengthens Paul and will bring him safely to the heavenly kingdom (2 Timothy 4:3-4, 10, 14-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul present faithful ministry as both contested and triumphant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 5, 'What does Paul''s finished race teach about Christian perseverance?', '["Perseverance is a lifelong fidelity to faith and calling that ends in hope before the righteous Judge","Perseverance is measured mainly by visible success","The race ends once hardship begins","Only apostles are expected to finish faithfully"]'::jsonb, 'Perseverance is a lifelong fidelity to faith and calling that ends in hope before the righteous Judge', 'Paul''s ''good fight,'' ''finished race,'' and ''kept the faith'' summarize enduring faithfulness rewarded by the Lord on that day (2 Timothy 4:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul''s finished race teach about Christian perseverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 5, 'How does the chapter keep final judgment from becoming merely threatening?', '["Judgment is linked with the righteous Judge who awards the crown to all who love Christ''s appearing","Judgment is softened by denying accountability","Paul presents judgment only for unbelievers and never for believers","The chapter shifts away from judgment as soon as it is mentioned"]'::jsonb, 'Judgment is linked with the righteous Judge who awards the crown to all who love Christ''s appearing', 'Paul''s language of judgment and kingdom is paired with the hope of the crown of righteousness for faithful lovers of Christ''s appearing (2 Timothy 4:1, 8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the chapter keep final judgment from becoming merely threatening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 5, 'What deeper view of Scripture and proclamation emerges from 2 Timothy 4?', '["Because people wander to myths, the preached word must remain the church''s urgent, patient, corrective center","Scripture is useful, but myths are equally effective for some hearers","Public proclamation matters less than private inspiration","Correction should be removed from preaching to avoid offense"]'::jsonb, 'Because people wander to myths, the preached word must remain the church''s urgent, patient, corrective center', 'Paul''s warning about itching ears leads directly to his command to preach the word with reproof, rebuke, and exhortation in steadfast patience and teaching (2 Timothy 4:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper view of Scripture and proclamation emerges from 2 Timothy 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 55, 4, 5, 'What overarching pastoral vision emerges from the final chapter?', '["A dying apostle hands on a ministry of truth, endurance, sober courage, and hope in the Lord''s appearing and kingdom","Paul''s final concern is mainly comfort and retirement","The chapter encourages Timothy to lower expectations because times are hard","The main vision is personal vindication apart from the church''s mission"]'::jsonb, 'A dying apostle hands on a ministry of truth, endurance, sober courage, and hope in the Lord''s appearing and kingdom', 'Paul''s final charge, personal example, warnings about desertion, and confidence in the Lord together form a closing pastoral commission for Timothy''s future ministry (2 Timothy 4:1-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 55
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What overarching pastoral vision emerges from the final chapter?'
);
