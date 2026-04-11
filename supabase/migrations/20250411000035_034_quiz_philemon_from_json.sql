-- ============================================================================
-- LOGOS LIGHT - Philemon (book 57) quiz questions from quiz-questions/philemon.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 1, 'According to Philemon 1, who is named with Paul in the opening greeting?', '["Timothy","Titus","Luke","Silas"]'::jsonb, 'Timothy', 'Paul opens the letter as ''Paul, a prisoner of Christ Jesus, and Timothy our brother'' (Philemon 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philemon 1, who is named with Paul in the opening greeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 1, 'According to Philemon 1, how does Paul describe himself?', '["A prisoner of Christ Jesus","An apostle to the Gentiles","A servant of the law","A citizen of Rome"]'::jsonb, 'A prisoner of Christ Jesus', 'Paul identifies himself here as a prisoner of Christ Jesus (Philemon 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philemon 1, how does Paul describe himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 1, 'According to Philemon 1, to whom is the letter mainly addressed?', '["Philemon","Onesimus","Apphia","Archippus"]'::jsonb, 'Philemon', 'The letter is addressed to Philemon, whom Paul calls beloved and a fellow worker (Philemon 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philemon 1, to whom is the letter mainly addressed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 1, 'According to Philemon 1, who is called our fellow soldier?', '["Archippus","Onesimus","Epaphras","Demas"]'::jsonb, 'Archippus', 'Paul greets Archippus and calls him our fellow soldier (Philemon 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philemon 1, who is called our fellow soldier?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 1, 'According to Philemon 1, where was the church meeting?', '["In Philemon''s house","In the synagogue","In Rome","At the temple"]'::jsonb, 'In Philemon''s house', 'Paul addresses the church in Philemon''s house (Philemon 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philemon 1, where was the church meeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 1, 'According to Philemon 1, for whom did Paul give thanks when praying?', '["Philemon","Caesar","The whole city","Only Onesimus"]'::jsonb, 'Philemon', 'Paul says he thanks God, always making mention of Philemon in his prayers (Philemon 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philemon 1, for whom did Paul give thanks when praying?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 1, 'According to Philemon 1, whose hearts had been refreshed by Philemon?', '["The saints","The rulers","The Romans","The travelers only"]'::jsonb, 'The saints', 'Paul says the hearts of the saints have been refreshed through Philemon (Philemon 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philemon 1, whose hearts had been refreshed by Philemon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 2, 'What two qualities of Philemon does Paul say he heard about in Philemon 1?', '["Love and faith","Wisdom and wealth","Power and influence","Learning and courage"]'::jsonb, 'Love and faith', 'Paul says he heard of Philemon''s love and faith toward the Lord Jesus and toward all the saints (Philemon 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What two qualities of Philemon does Paul say he heard about in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 2, 'Why does Paul pray regarding the fellowship of Philemon''s faith?', '["That it may become effective in the knowledge of every good thing in Christ","That Philemon may travel to Rome","That the church may become wealthy","That Archippus may be promoted"]'::jsonb, 'That it may become effective in the knowledge of every good thing in Christ', 'Paul prays that the fellowship of Philemon''s faith may become effective in the knowledge of every good thing in us in Christ Jesus (Philemon 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul pray regarding the fellowship of Philemon''s faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 2, 'What does Paul say he could do, though he chooses not to, in Philemon 1?', '["Command what is appropriate","Leave prison immediately","Judge Onesimus publicly","Send Titus to Crete"]'::jsonb, 'Command what is appropriate', 'Paul says that although he has much boldness in Christ to command what is appropriate, he appeals instead for love''s sake (Philemon 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say he could do, though he chooses not to, in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 2, 'For whom does Paul appeal in Philemon 1?', '["Onesimus","Epaphras","Archippus","Apphia"]'::jsonb, 'Onesimus', 'Paul says, ''I appeal to you for my child, whom I have become the father of in my chains, Onesimus'' (Philemon 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'For whom does Paul appeal in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 2, 'How had Onesimus once been described in relation to Philemon?', '["Unprofitable","Faithful","Honored","Freeborn"]'::jsonb, 'Unprofitable', 'Paul says Onesimus once was unprofitable to Philemon, but now is profitable to both Philemon and Paul (Philemon 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How had Onesimus once been described in relation to Philemon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 2, 'How does Paul describe Onesimus when sending him back?', '["My very heart","My messenger only","My fellow prisoner only","My debtor"]'::jsonb, 'My very heart', 'Paul says he is sending Onesimus back, ''that is, my very heart'' (Philemon 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe Onesimus when sending him back?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 2, 'Why had Paul wanted to keep Onesimus with him?', '["That he might serve Paul on Philemon''s behalf in the chains of the gospel","That Onesimus could guide him to Crete","That Onesimus might write another letter","That Paul could appoint him an elder"]'::jsonb, 'That he might serve Paul on Philemon''s behalf in the chains of the gospel', 'Paul says he wished to keep Onesimus so that he might serve him on Philemon''s behalf in the bonds of the gospel (Philemon 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why had Paul wanted to keep Onesimus with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 3, 'Why does Paul appeal rather than command in Philemon 1?', '["He wants Philemon''s response to arise from love and willingness rather than pressure","He lacks any authority to speak","He is unsure Onesimus changed","He wants to avoid mentioning the gospel"]'::jsonb, 'He wants Philemon''s response to arise from love and willingness rather than pressure', 'Paul says that for love''s sake he rather appeals, and he wants Philemon''s goodness not to be by compulsion but of free will (Philemon 1:9, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul appeal rather than command in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 3, 'What does the change in Onesimus''s description suggest in Philemon 1?', '["The gospel has transformed someone once useless into someone now truly useful","Paul is making a joke without deeper meaning","Philemon had misjudged Onesimus''s work ethic only","Onesimus became profitable through Roman law"]'::jsonb, 'The gospel has transformed someone once useless into someone now truly useful', 'Paul deliberately contrasts Onesimus as formerly unprofitable and now profitable, highlighting gospel change (Philemon 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the change in Onesimus''s description suggest in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 3, 'How does Philemon 1 redefine Onesimus''s relationship to Philemon?', '["No longer merely as a servant, but as a beloved brother","As a stranger who should be avoided","As a public example of shame","As a hired laborer only"]'::jsonb, 'No longer merely as a servant, but as a beloved brother', 'Paul asks Philemon to receive Onesimus no longer as a servant only, but more than a servant, a beloved brother (Philemon 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Philemon 1 redefine Onesimus''s relationship to Philemon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 3, 'Why does Paul mention that Onesimus may have departed for a while?', '["He interprets the separation in light of God''s providence and lasting restoration","He is excusing sin as unimportant","He is claiming prophetic certainty about every detail","He wants Philemon to forget the past entirely"]'::jsonb, 'He interprets the separation in light of God''s providence and lasting restoration', 'Paul says perhaps Onesimus was separated for a while so Philemon might have him back forever, suggesting a providential reading of events (Philemon 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention that Onesimus may have departed for a while?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 3, 'What does Paul mean by asking Philemon to receive Onesimus as he would receive Paul?', '["Philemon should extend to Onesimus the honor and welcome due to gospel fellowship","Onesimus is replacing Paul as an apostle","Philemon should send Onesimus back immediately to prison","Paul wants Onesimus to take his place in the church leadership"]'::jsonb, 'Philemon should extend to Onesimus the honor and welcome due to gospel fellowship', 'Paul says if Philemon counts him a partner, he should receive Onesimus as he would receive Paul (Philemon 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by asking Philemon to receive Onesimus as he would receive Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 3, 'Why does Paul offer to repay any wrong or debt in Philemon 1?', '["He is removing obstacles to reconciliation and bearing the cost personally","He doubts Philemon''s honesty","He wants to purchase Onesimus as property","He is collecting debts for the church"]'::jsonb, 'He is removing obstacles to reconciliation and bearing the cost personally', 'Paul tells Philemon to charge any wrong or debt to his account and says he will repay it (Philemon 1:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul offer to repay any wrong or debt in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 3, 'What does Paul''s confidence in Philemon''s obedience show?', '["Paul expects gospel-shaped love to produce even more generosity than he requests","Paul fears Philemon will refuse outright","Paul is forcing obedience through threat alone","Paul no longer trusts Philemon at all"]'::jsonb, 'Paul expects gospel-shaped love to produce even more generosity than he requests', 'Paul writes with confidence in Philemon''s obedience, knowing he will do even beyond what Paul says (Philemon 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s confidence in Philemon''s obedience show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 4, 'How does Philemon 1 blend personal affection with apostolic authority?', '["Paul has authority to command, yet he uses affection and partnership to seek voluntary gospel obedience","Paul abandons all authority in the letter","Authority appears only in the greeting and nowhere else","Affection replaces any moral claim on Philemon"]'::jsonb, 'Paul has authority to command, yet he uses affection and partnership to seek voluntary gospel obedience', 'Paul notes he could command what is fitting, but instead appeals for love''s sake and for willing goodness (Philemon 1:8-9, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philemon 1 blend personal affection with apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 4, 'What role does partnership play in Paul''s appeal in Philemon 1?', '["Paul uses shared fellowship in Christ as the basis for how Philemon should receive Onesimus","Partnership is mentioned only as a travel arrangement","Paul uses partnership to avoid speaking about sin","Partnership here refers only to financial support"]'::jsonb, 'Paul uses shared fellowship in Christ as the basis for how Philemon should receive Onesimus', 'Paul says if Philemon counts him a partner, he should receive Onesimus as he would receive Paul (Philemon 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What role does partnership play in Paul''s appeal in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 4, 'How does the letter transform a social relationship without directly staging a public revolution?', '["It places master and servant inside brotherhood in Christ, changing the relationship at its deepest level","It ignores social realities completely","It commands immediate political revolt in Crete","It treats Onesimus only as a legal problem"]'::jsonb, 'It places master and servant inside brotherhood in Christ, changing the relationship at its deepest level', 'Paul asks Philemon to receive Onesimus no longer merely as a servant but as a beloved brother, especially in the Lord (Philemon 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the letter transform a social relationship without directly staging a public revolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 4, 'Why is Paul''s self-offering to pay Onesimus''s debt so significant?', '["It mirrors the gospel pattern of costly reconciliation by taking another''s liability upon himself","It proves Paul was financially wealthy","It excuses Onesimus from any moral responsibility","It shows the dispute was only about money"]'::jsonb, 'It mirrors the gospel pattern of costly reconciliation by taking another''s liability upon himself', 'Paul''s offer to repay what Onesimus owes reinforces his effort to reconcile the two and reflects a substitutionary pattern within the appeal (Philemon 1:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Paul''s self-offering to pay Onesimus''s debt so significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 4, 'How does Philemon 1 connect hospitality, prayer, and reconciliation?', '["Paul expects the same grace seen in Philemon''s past refreshment of saints to govern his reception of Onesimus and his welcome of Paul","These themes are unrelated in the letter","Prayer replaces practical action in Paul''s argument","Hospitality is mentioned only for travel convenience"]'::jsonb, 'Paul expects the same grace seen in Philemon''s past refreshment of saints to govern his reception of Onesimus and his welcome of Paul', 'Paul praises Philemon for refreshing the saints, asks him to refresh Paul, and then requests lodging, linking his established character to the present appeal (Philemon 1:7, 20, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philemon 1 connect hospitality, prayer, and reconciliation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 4, 'What does the providential ''perhaps'' of Philemon 1 accomplish rhetorically?', '["It invites Philemon to see God''s possible purpose in painful events without speaking presumptuously","It weakens Paul''s appeal into uncertainty only","It denies that Onesimus did anything wrong","It removes the need for Philemon''s response"]'::jsonb, 'It invites Philemon to see God''s possible purpose in painful events without speaking presumptuously', 'Paul says ''perhaps'' he was separated for a while so that Philemon might have him back forever, suggesting providence with pastoral modesty (Philemon 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the providential ''perhaps'' of Philemon 1 accomplish rhetorically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 4, 'How does the letter use honor and shame dynamics for a redemptive purpose?', '["Paul publicly honors Philemon''s love and then calls him to act consistently with that identity toward Onesimus","Paul shames Philemon harshly before the churches","Honor is irrelevant to the letter''s persuasion","Paul appeals only to Roman law"]'::jsonb, 'Paul publicly honors Philemon''s love and then calls him to act consistently with that identity toward Onesimus', 'Paul begins by praising Philemon''s love, faith, and refreshment of the saints, then builds his appeal on that known character and partnership (Philemon 1:5-7, 17, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the letter use honor and shame dynamics for a redemptive purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 5, 'How does Philemon 1 demonstrate the gospel''s power to reorder human relationships?', '["It reframes a damaged master-servant relationship through brotherhood, reconciliation, and voluntary love in Christ","It keeps the gospel strictly private and inward","It treats social bonds as unchanged by conversion","It focuses only on debt collection"]'::jsonb, 'It reframes a damaged master-servant relationship through brotherhood, reconciliation, and voluntary love in Christ', 'Paul''s whole appeal asks Philemon to receive Onesimus not merely by old social categories but as a beloved brother and partner in the Lord (Philemon 1:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philemon 1 demonstrate the gospel''s power to reorder human relationships?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 5, 'Why is Paul''s choice of appeal over command theologically rich?', '["It shows that gospel obedience reaches its fullest form when love freely embraces what grace requires","It means apostolic authority is unimportant","It proves Paul is uncertain about right and wrong","It suggests commands have no place in Christian life"]'::jsonb, 'It shows that gospel obedience reaches its fullest form when love freely embraces what grace requires', 'Paul wants Philemon''s goodness not to be as of necessity but willingly, revealing a vision of transformed, voluntary obedience (Philemon 1:8-9, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s choice of appeal over command theologically rich?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 5, 'How does Paul''s mediation in Philemon echo broader gospel patterns without explicitly stating them?', '["Paul stands between offender and offended, identifying with both and offering to bear the debt to achieve reconciliation","Paul remains neutral and detached from the conflict","He resolves the matter only through legal procedure","He minimizes wrongdoing so reconciliation costs nothing"]'::jsonb, 'Paul stands between offender and offended, identifying with both and offering to bear the debt to achieve reconciliation', 'Paul calls Onesimus his child and heart, yet appeals to Philemon as partner and offers to repay the debt himself, functioning as a reconciler (Philemon 1:10, 12, 17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s mediation in Philemon echo broader gospel patterns without explicitly stating them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 5, 'What does the letter imply about Christian identity and social status?', '["Union in Christ relativizes old status distinctions by introducing a deeper identity as beloved brotherhood","Social status is the final truth about a person","Only spiritual status matters and embodied relationships do not","Paul denies any social obligations remain after conversion"]'::jsonb, 'Union in Christ relativizes old status distinctions by introducing a deeper identity as beloved brotherhood', 'Paul''s request that Onesimus be received as more than a servant, as a beloved brother in the Lord, makes Christian identity decisive (Philemon 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the letter imply about Christian identity and social status?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 5, 'Why is refreshment a key theme in Philemon 1?', '["The letter moves from Philemon''s past refreshment of the saints to Paul''s hope that Philemon will refresh him by reconciling with Onesimus","Refreshment refers only to food and lodging","It is a minor courtesy with no rhetorical role","Paul uses it to avoid discussing Onesimus directly"]'::jsonb, 'The letter moves from Philemon''s past refreshment of the saints to Paul''s hope that Philemon will refresh him by reconciling with Onesimus', 'Paul praises Philemon because the saints'' hearts were refreshed through him and later says, ''refresh my heart in the Lord,'' tying refreshment to the requested act of grace (Philemon 1:7, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is refreshment a key theme in Philemon 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 5, 'How does Philemon 1 show that theology can be communicated through personal correspondence rather than abstract treatise?', '["A short, situational letter embodies doctrines of grace, fellowship, reconciliation, providence, and transformed identity through lived relationships","The letter contains no real theology because it is personal","Only formal doctrinal essays can express theology","Paul avoids theological implications by staying practical"]'::jsonb, 'A short, situational letter embodies doctrines of grace, fellowship, reconciliation, providence, and transformed identity through lived relationships', 'The letter''s appeal over Onesimus draws together themes of grace, love, partnership, providence, debt-bearing, and brotherhood in Christ (Philemon 1:6, 14-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philemon 1 show that theology can be communicated through personal correspondence rather than abstract treatise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 57, 1, 5, 'What overarching pastoral vision governs Philemon 1?', '["The gospel creates a community where authority, affection, and costly reconciliation work together to restore broken relationships","The main goal is simply to settle a private dispute quietly","Paul is primarily interested in recovering lost property","The letter minimizes the role of the church in personal conflict"]'::jsonb, 'The gospel creates a community where authority, affection, and costly reconciliation work together to restore broken relationships', 'Paul''s appeal to Philemon joins church fellowship, apostolic concern, personal love, and willingness to bear cost so reconciliation can happen in the Lord (Philemon 1:1-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 57
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What overarching pastoral vision governs Philemon 1?'
);
