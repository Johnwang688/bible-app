-- ============================================================================
-- LOGOS LIGHT — Philippians (book 50) quiz questions from quiz-questions/philippians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 1, 'According to Philippians 1, who are listed with Paul in the greeting?', '["Timothy","Titus","Silas","Luke"]'::jsonb, 'Timothy', 'Paul and Timothy are named together in the greeting of the letter (Philippians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 1, who are listed with Paul in the greeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 1, 'According to Philippians 1, in what does Paul say the Philippians shared from the first day until now?', '["The furtherance of the gospel","The service of the temple","The customs of Jerusalem","The authority of Rome"]'::jsonb, 'The furtherance of the gospel', 'Paul thanks God for their partnership in furtherance of the gospel from the first day until now (Philippians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 1, in what does Paul say the Philippians shared from the first day until now?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 1, 'According to Philippians 1, who will complete the good work begun in believers?', '["God","Paul","The elders","The saints themselves"]'::jsonb, 'God', 'Paul is confident that he who began a good work in them will complete it until the day of Jesus Christ (Philippians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 1, who will complete the good work begun in believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 1, 'According to Philippians 1, what does Paul say happened to his bonds?', '["They became obvious in Christ throughout the whole praetorian guard","They were removed at once","They caused the churches to fall away","They were hidden from everyone"]'::jsonb, 'They became obvious in Christ throughout the whole praetorian guard', 'Paul says his bonds became revealed in Christ throughout the whole praetorian guard and to all the rest (Philippians 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 1, what does Paul say happened to his bonds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 1, 'According to Philippians 1, what is Christ to Paul in life and in death?', '["To live is Christ, and to die is gain","To live is duty, and to die is rest","To live is the law, and to die is reward","To live is service, and to die is silence"]'::jsonb, 'To live is Christ, and to die is gain', 'Paul says, ''For to me to live is Christ, and to die is gain'' (Philippians 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 1, what is Christ to Paul in life and in death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 1, 'According to Philippians 1, in what manner should believers conduct themselves?', '["Worthily of the gospel of Christ","According to Roman custom","As disciples of Moses only","With fear of every opponent"]'::jsonb, 'Worthily of the gospel of Christ', 'Paul says their conduct should be worthy of the gospel of Christ (Philippians 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 1, in what manner should believers conduct themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 1, 'According to Philippians 1, what has been granted to believers on behalf of Christ?', '["Not only to believe in him, but also to suffer for his sake","To reign over nations immediately","To avoid every trial","To keep the old covenant ordinances"]'::jsonb, 'Not only to believe in him, but also to suffer for his sake', 'Paul says it has been granted to them not only to believe in Christ, but also to suffer on his behalf (Philippians 1:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 1, what has been granted to believers on behalf of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 2, 'How does Paul say he remembers the Philippians in Philippians 1?', '["With joy in every request for them","With grief and uncertainty","With fear of their weakness","With silence before God"]'::jsonb, 'With joy in every request for them', 'Paul says that in every prayer for them all he makes his requests with joy (Philippians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul say he remembers the Philippians in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 2, 'What does Paul pray may abound more and more in Philippians 1?', '["Their love in knowledge and all discernment","Their wealth in earthly goods","Their influence in Rome","Their confidence in ritual obedience"]'::jsonb, 'Their love in knowledge and all discernment', 'Paul prays that their love may abound more and more in knowledge and all discernment (Philippians 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul pray may abound more and more in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 2, 'What does Paul say some were doing out of envy and strife in Philippians 1?', '["Preaching Christ","Abandoning the faith","Serving Caesar","Persecuting the saints in Jerusalem"]'::jsonb, 'Preaching Christ', 'Paul says some indeed preach Christ even out of envy and strife, though others do so from good will (Philippians 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say some were doing out of envy and strife in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 2, 'What does Paul say will happen through the Philippians'' prayers and the supply of the Spirit?', '["This will turn out to his salvation","The churches will be destroyed","His bonds will become meaningless","Christ will no longer be preached"]'::jsonb, 'This will turn out to his salvation', 'Paul says he knows that this will turn out to his salvation through their prayers and the supply of the Spirit of Jesus Christ (Philippians 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say will happen through the Philippians'' prayers and the supply of the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 2, 'What two possibilities does Paul weigh for himself in Philippians 1?', '["Departing to be with Christ or remaining in the flesh","Going to Jerusalem or going to Rome","Returning to Judaism or staying with Christ","Silence or prophecy"]'::jsonb, 'Departing to be with Christ or remaining in the flesh', 'Paul speaks of the desire to depart and be with Christ, yet also of remaining in the flesh for the Philippians'' sake (Philippians 1:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What two possibilities does Paul weigh for himself in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 2, 'How are the Philippians to stand according to Philippians 1:27?', '["Firm in one spirit, with one soul striving for the faith of the gospel","Separately, each guarding his own opinion","Quietly without any public witness","Under fear of their opponents"]'::jsonb, 'Firm in one spirit, with one soul striving for the faith of the gospel', 'Paul wants to hear that they stand firm in one spirit, with one soul striving for the faith of the gospel (Philippians 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How are the Philippians to stand according to Philippians 1:27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 2, 'What does Paul say their lack of terror before opponents is to them?', '["A sign of destruction to the opponents and of salvation to believers","A sign that conflict should always be avoided","A sign that suffering has no purpose","A sign that Paul will be released immediately"]'::jsonb, 'A sign of destruction to the opponents and of salvation to believers', 'Paul says their fearless stance is a sign of destruction for opponents and salvation for believers, and that from God (Philippians 1:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say their lack of terror before opponents is to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 3, 'Why does Paul rejoice even when some preach Christ from impure motives?', '["Because Christ is proclaimed, and that remains his central concern","Because motives do not matter at all to God","Because envy and strife are forms of holiness","Because he no longer cares about the churches"]'::jsonb, 'Because Christ is proclaimed, and that remains his central concern', 'Paul says whether in pretense or in truth, Christ is proclaimed, and in this he rejoices (Philippians 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul rejoice even when some preach Christ from impure motives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 3, 'What does Philippians 1 show about the purpose of Paul''s imprisonment?', '["God used it to advance the gospel and strengthen other believers\u0027 boldness","It stopped the spread of the gospel entirely","It proved Paul\u0027s ministry had failed","It turned the churches away from Christ"]'::jsonb, 'God used it to advance the gospel and strengthen other believers'' boldness', 'Paul says his circumstances turned out for the progress of the gospel and caused many brothers to speak the word more boldly (Philippians 1:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 1 show about the purpose of Paul''s imprisonment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 3, 'Why does Paul say remaining in the flesh is more necessary in Philippians 1?', '["His continued life would serve the Philippians\u0027 progress and joy in the faith","He feared death more than suffering","He was uncertain about being with Christ","He wanted to avoid all hardship"]'::jsonb, 'His continued life would serve the Philippians'' progress and joy in the faith', 'Paul says remaining in the flesh is more needful for them because it would help their progress and joy in the faith (Philippians 1:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say remaining in the flesh is more necessary in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 3, 'What does Philippians 1 imply about Christian suffering?', '["Suffering for Christ can be a granted privilege, not merely an unfortunate burden","Suffering proves that faith is absent","Only apostles are ever called to suffer","Believers should measure spiritual life by the absence of trials"]'::jsonb, 'Suffering for Christ can be a granted privilege, not merely an unfortunate burden', 'Paul says it has been granted to believers not only to believe in Christ but also to suffer for his sake (Philippians 1:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 1 imply about Christian suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 3, 'What is the relationship between love and discernment in Philippians 1?', '["Christian love is meant to grow with moral and spiritual insight, not without understanding","Discernment limits love until it disappears","Love and knowledge are opposed in the Christian life","Paul values love but rejects clear judgment"]'::jsonb, 'Christian love is meant to grow with moral and spiritual insight, not without understanding', 'Paul prays that their love would abound in knowledge and all discernment so they may approve what is excellent (Philippians 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the relationship between love and discernment in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 3, 'What does Paul mean by saying his earnest expectation is that Christ will be magnified in his body?', '["Paul wants his whole life and possible death to display Christ\u0027s worth publicly","Paul seeks honor for his own spiritual discipline","Paul hopes to escape every bodily hardship","Paul thinks Christ needs human greatness to be exalted"]'::jsonb, 'Paul wants his whole life and possible death to display Christ''s worth publicly', 'Paul says Christ will be magnified in his body, whether by life or by death, showing his desire that everything about him point to Christ (Philippians 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by saying his earnest expectation is that Christ will be magnified in his body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 3, 'Why is standing in one spirit essential in Philippians 1?', '["The gospel calls the church into shared courage and common striving rather than isolated discipleship","Unity matters less than individual boldness","Paul wants the church to avoid all public witness","Only leaders need to contend for the faith"]'::jsonb, 'The gospel calls the church into shared courage and common striving rather than isolated discipleship', 'Paul describes the church standing firm in one spirit and striving together with one soul for the faith of the gospel (Philippians 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is standing in one spirit essential in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 4, 'How does Philippians 1 connect joy with hardship rather than with comfort?', '["Paul\u0027s joy rests in Christ and gospel progress, not in favorable circumstances","Joy appears only when suffering has ended","Hardship automatically destroys Christian joy","Paul rejoices because prison is pleasant"]'::jsonb, 'Paul''s joy rests in Christ and gospel progress, not in favorable circumstances', 'Paul rejoices in prayer, in the proclamation of Christ, and in how his imprisonment serves the gospel, showing joy rooted in Christ rather than comfort (Philippians 1:4, 18, 12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 1 connect joy with hardship rather than with comfort?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 4, 'What does Philippians 1 suggest about the relationship between death and fellowship with Christ?', '["Death is gain because it brings a nearer presence with Christ for the believer","Death is neutral because Christ is absent from it","Death is better only because life has no value","Paul doubts whether Christ is with believers after death"]'::jsonb, 'Death is gain because it brings a nearer presence with Christ for the believer', 'Paul says to depart and be with Christ is far better, showing the deep fellowship he expects beyond death (Philippians 1:21, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Philippians 1 suggest about the relationship between death and fellowship with Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 4, 'Why does Paul pray for discernment before speaking of purity and fruit?', '["Right moral fruit requires rightly formed loves and clear spiritual judgment","Purity can grow without any need for understanding","Discernment replaces righteousness in Christ","Fruit matters less than correct slogans"]'::jsonb, 'Right moral fruit requires rightly formed loves and clear spiritual judgment', 'Paul prays for abounding love with knowledge and discernment so the Philippians may approve what is excellent and be filled with the fruit of righteousness (Philippians 1:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul pray for discernment before speaking of purity and fruit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 4, 'How does Philippians 1 portray gospel partnership?', '["It is a shared participation in grace, witness, and endurance centered on Christ","It is mainly financial support without spiritual union","It belongs only to apostles and preachers","It is secondary to individual spirituality"]'::jsonb, 'It is a shared participation in grace, witness, and endurance centered on Christ', 'Paul ties their fellowship in the gospel to shared grace with him in bonds and in the defense and confirmation of the gospel (Philippians 1:5, 7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 1 portray gospel partnership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 4, 'What is the force of Paul''s confidence that God will complete his work in the Philippians?', '["Christian perseverance finally depends on God\u0027s faithful action rather than on human strength alone","Believers have no need to pursue holiness","The day of Christ is irrelevant to Christian hope","Paul is only offering sentimental encouragement"]'::jsonb, 'Christian perseverance finally depends on God''s faithful action rather than on human strength alone', 'Paul grounds his confidence in the God who began the good work and will complete it until the day of Jesus Christ (Philippians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the force of Paul''s confidence that God will complete his work in the Philippians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 4, 'How does Philippians 1 hold together individual salvation and corporate witness?', '["Personal faith in Christ is inseparable from the church\u0027s united striving for the gospel","Salvation is purely private and unrelated to community life","Corporate witness matters more than personal faith","Paul separates church unity from gospel identity"]'::jsonb, 'Personal faith in Christ is inseparable from the church''s united striving for the gospel', 'Paul speaks of belief in Christ and then immediately calls the church to one-minded striving for the faith of the gospel (Philippians 1:27-29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 1 hold together individual salvation and corporate witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 4, 'Why does Paul interpret opposition as a sign in Philippians 1?', '["The church\u0027s steadfast courage reveals God\u0027s saving work in believers and exposes the final end of opposition","Opposition proves believers should compromise the gospel","Every conflict is automatically a sign of failure","Paul wants the Philippians to trust their enemies more than Christ"]'::jsonb, 'The church''s steadfast courage reveals God''s saving work in believers and exposes the final end of opposition', 'Paul says their fearless conduct is a sign of destruction to opponents and salvation to believers, and that from God (Philippians 1:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul interpret opposition as a sign in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 5, 'How does Philippians 1 redefine success in ministry?', '["Success is measured by Christ being honored and the gospel advancing, even through suffering and mixed motives","Success means avoiding imprisonment and criticism","Success is primarily numerical growth without hardship","Success depends on the purity of every preacher\u0027s motives before Christ can work"]'::jsonb, 'Success is measured by Christ being honored and the gospel advancing, even through suffering and mixed motives', 'Paul sees his chains serving gospel progress and rejoices that Christ is proclaimed, showing a Christ-centered measure of ministry (Philippians 1:12-18, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 1 redefine success in ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 5, 'What theological vision of life and death stands behind ''to live is Christ, and to die is gain''?', '["Union with Christ gives meaning to present life and hope to death, so neither circumstance can defeat the believer","Paul believes earthly life is worthless in every respect","Death is gain only because suffering is unbearable","Christ matters only after death, not in present life"]'::jsonb, 'Union with Christ gives meaning to present life and hope to death, so neither circumstance can defeat the believer', 'Paul''s statement reflects a life defined by Christ and a death made gain through being with Christ (Philippians 1:21-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological vision of life and death stands behind ''to live is Christ, and to die is gain''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 5, 'How does Philippians 1 weave together providence, prayer, and the Spirit?', '["God\u0027s providential use of Paul\u0027s circumstances works through the prayers of the church and the Spirit\u0027s supply","Providence makes prayer and the Spirit unnecessary","Prayer replaces God\u0027s providence entirely","The Spirit acts independently of the church\u0027s prayers"]'::jsonb, 'God''s providential use of Paul''s circumstances works through the prayers of the church and the Spirit''s supply', 'Paul describes his imprisonment serving gospel advance and says his present situation will turn out through their prayers and the Spirit of Jesus Christ (Philippians 1:12-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 1 weave together providence, prayer, and the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 5, 'Why is Paul''s prayer for fruit ''through Jesus Christ'' theologically significant in Philippians 1?', '["Even righteous fruit is traced back to Christ as its source and to God\u0027s glory as its goal","Fruit of righteousness arises mainly from natural virtue","Paul believes holiness can be detached from Christ","The goal of righteousness is human self-respect"]'::jsonb, 'Even righteous fruit is traced back to Christ as its source and to God''s glory as its goal', 'Paul prays that they may be filled with the fruit of righteousness that comes through Jesus Christ to the glory and praise of God (Philippians 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s prayer for fruit ''through Jesus Christ'' theologically significant in Philippians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 5, 'How does Philippians 1 present the church as a public sign in a hostile world?', '["The church\u0027s unified, fearless faith becomes a visible testimony to both salvation and judgment","The church should avoid public faithfulness whenever opposition appears","Fear is the best witness to hostile powers","The church\u0027s witness belongs only to private meetings"]'::jsonb, 'The church''s unified, fearless faith becomes a visible testimony to both salvation and judgment', 'Paul treats the Philippians'' steadfastness and lack of fear before opponents as a sign with theological meaning for both sides (Philippians 1:27-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 1 present the church as a public sign in a hostile world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 5, 'What does Philippians 1 imply about Christian joy in relation to eschatology?', '["Joy is sustained by the certainty of Christ\u0027s day and the believer\u0027s future with him","Joy depends only on present success and comfort","Future hope weakens present faithfulness","Paul excludes the day of Christ from practical discipleship"]'::jsonb, 'Joy is sustained by the certainty of Christ''s day and the believer''s future with him', 'Paul frames his prayer and confidence with the day of Christ and with the prospect of being with Christ, showing joy rooted in future hope (Philippians 1:6, 10, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Philippians 1 imply about Christian joy in relation to eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 1, 5, 'How does Philippians 1 present Christian courage as a theological act rather than mere temperament?', '["Courage arises from participation in the gospel and confidence that belief and suffering are gifts from God","Courage is simply a natural personality trait some possess","Fearlessness matters only for apostles under arrest","Christian courage depends mainly on political support"]'::jsonb, 'Courage arises from participation in the gospel and confidence that belief and suffering are gifts from God', 'Paul links steadfastness, shared struggle, and suffering for Christ with God''s gracious gift, framing courage theologically rather than psychologically (Philippians 1:27-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 1 present Christian courage as a theological act rather than mere temperament?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 1, 'According to Philippians 2, what should believers do in humility?', '["Count others better than themselves","Seek their own interests first","Avoid serving the saints","Compete for the highest place"]'::jsonb, 'Count others better than themselves', 'Paul says in humility each should count others better than himself (Philippians 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 2, what should believers do in humility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 1, 'According to Philippians 2, whose mind should be in believers?', '["The mind of Christ Jesus","The mind of Caesar","The mind of Moses","The mind of the philosophers"]'::jsonb, 'The mind of Christ Jesus', 'Paul says, ''Have this in your mind, which was also in Christ Jesus'' (Philippians 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 2, whose mind should be in believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 1, 'According to Philippians 2, to what point did Christ become obedient?', '["To the death of the cross","To the law of Rome","To the temple sacrifices","To the voice of angels"]'::jsonb, 'To the death of the cross', 'Paul says Christ became obedient even to death, yes, the death of the cross (Philippians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 2, to what point did Christ become obedient?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 1, 'According to Philippians 2, what should believers do without murmurings and disputes?', '["All things","Only acts of worship","Only acts of giving","Only difficult tasks"]'::jsonb, 'All things', 'Paul says believers should do all things without murmurings and disputes (Philippians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 2, what should believers do without murmurings and disputes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 1, 'According to Philippians 2, who will Paul send to Philippi soon?', '["Timothy","Luke","Silas","Barnabas"]'::jsonb, 'Timothy', 'Paul says he hopes in the Lord Jesus to send Timothy shortly to them (Philippians 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 2, who will Paul send to Philippi soon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 1, 'According to Philippians 2, who had been sick nearly to death?', '["Epaphroditus","Timothy","Paul","Euodia"]'::jsonb, 'Epaphroditus', 'Paul says Epaphroditus was sick nearly to death, but God had mercy on him (Philippians 2:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 2, who had been sick nearly to death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 1, 'According to Philippians 2, for whose work did Epaphroditus come near to death?', '["The work of Christ","The work of the law","The work of Caesar","The work of the synagogue"]'::jsonb, 'The work of Christ', 'Paul says Epaphroditus came near to death for the work of Christ (Philippians 2:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 2, for whose work did Epaphroditus come near to death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 2, 'What does Paul say will make his joy full in Philippians 2?', '["That they think the same way, having the same love, being of one accord","That they all visit Rome","That they avoid every conflict by silence","That they become famous among the churches"]'::jsonb, 'That they think the same way, having the same love, being of one accord', 'Paul says his joy will be made full when they think the same way and share the same love and purpose (Philippians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say will make his joy full in Philippians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 2, 'What did Christ not consider a prize to be equal with according to Philippians 2?', '["God","Adam","Caesar","The angels"]'::jsonb, 'God', 'Paul says Christ, existing in the form of God, did not consider equality with God a thing to be grasped (Philippians 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Christ not consider a prize to be equal with according to Philippians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 2, 'What did Christ take upon himself according to Philippians 2?', '["The form of a servant","The throne of David","The armor of Rome","The yoke of Caesar"]'::jsonb, 'The form of a servant', 'Paul says Christ emptied himself, taking the form of a servant and being made in the likeness of men (Philippians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Christ take upon himself according to Philippians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 2, 'What does Paul tell believers to work out with fear and trembling?', '["Their own salvation","Their Roman citizenship","Their priestly duty","Their public reputation"]'::jsonb, 'Their own salvation', 'Paul says to work out their own salvation with fear and trembling (Philippians 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul tell believers to work out with fear and trembling?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 2, 'Why can believers work out their salvation according to Philippians 2?', '["Because God works in them both to will and to work for his good pleasure","Because human effort alone secures holiness","Because suffering has ended","Because the law now guarantees obedience"]'::jsonb, 'Because God works in them both to will and to work for his good pleasure', 'Paul immediately grounds the command by saying God is at work in them both to will and to work for his good pleasure (Philippians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why can believers work out their salvation according to Philippians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 2, 'How does Paul describe Timothy''s concern for the Philippians?', '["He will genuinely care for their state","He seeks only his own comfort","He is unsure whether he knows them","He avoids all church concerns"]'::jsonb, 'He will genuinely care for their state', 'Paul says he has no one like-minded who will genuinely care for their state as Timothy will (Philippians 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe Timothy''s concern for the Philippians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 2, 'How should the Philippians receive Epaphroditus according to Philippians 2?', '["With all joy in the Lord and with honor","With suspicion because of his sickness","As a stranger from another church","With silence and caution"]'::jsonb, 'With all joy in the Lord and with honor', 'Paul tells them to receive Epaphroditus in the Lord with all joy and to hold such men in honor (Philippians 2:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should the Philippians receive Epaphroditus according to Philippians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 3, 'Why does Paul place Christ''s self-emptying at the center of his appeal for unity?', '["True Christian unity is shaped by the humble pattern of Christ himself","Doctrinal truth is less important than example","Paul wants believers to deny Christ\u0027s divine status","Humility is optional as long as peace remains outward"]'::jsonb, 'True Christian unity is shaped by the humble pattern of Christ himself', 'Paul moves from exhorting humility and mutual concern directly into the example of Christ''s self-humbling obedience (Philippians 2:1-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul place Christ''s self-emptying at the center of his appeal for unity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 3, 'What does Philippians 2 teach about the relationship between divine action and human obedience?', '["Believers actively obey because God is actively at work within them","God\u0027s work removes the need for effort","Human obedience replaces God\u0027s action","Fear and trembling contradict grace"]'::jsonb, 'Believers actively obey because God is actively at work within them', 'Paul commands believers to work out their salvation and then explains that God works in them to will and to work (Philippians 2:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 2 teach about the relationship between divine action and human obedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 3, 'Why does Paul want the Philippians to be blameless and harmless in Philippians 2?', '["So they may shine as lights in a crooked and perverse generation","So they may avoid all contact with unbelievers","So they may boast in their own righteousness","So they may replace Paul\u0027s ministry"]'::jsonb, 'So they may shine as lights in a crooked and perverse generation', 'Paul calls them to be blameless and harmless, children of God without defect, shining as lights in the world (Philippians 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul want the Philippians to be blameless and harmless in Philippians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 3, 'What does Paul imply by saying every knee will bow and every tongue confess Jesus as Lord?', '["Christ\u0027s humiliation leads to universal acknowledgment of his exalted lordship","Only believers will ever recognize Christ\u0027s authority","The Father and Son are in rivalry for honor","Christ\u0027s lordship is limited to earth alone"]'::jsonb, 'Christ''s humiliation leads to universal acknowledgment of his exalted lordship', 'Because of Christ''s obedience, God highly exalted him and decreed universal homage and confession to his lordship (Philippians 2:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul imply by saying every knee will bow and every tongue confess Jesus as Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 3, 'Why are Timothy and Epaphroditus included in Philippians 2 after the Christ hymn?', '["They provide living examples of self-giving service shaped by the same mind seen in Christ","Paul needs to change to travel details with no connection","They are presented as rivals to Christ\u0027s example","Paul wants to minimize the importance of humility"]'::jsonb, 'They provide living examples of self-giving service shaped by the same mind seen in Christ', 'After presenting Christ''s humility, Paul commends Timothy''s genuine concern and Epaphroditus''s sacrificial service, embodying the same pattern (Philippians 2:19-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are Timothy and Epaphroditus included in Philippians 2 after the Christ hymn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 3, 'What does Philippians 2 suggest about joy and sacrifice?', '["Paul can rejoice even if poured out in service because gospel sacrifice is joined to Christ\u0027s life","Sacrifice cancels joy entirely","Joy belongs only to those free from hardship","Service is valuable only if it preserves comfort"]'::jsonb, 'Paul can rejoice even if poured out in service because gospel sacrifice is joined to Christ''s life', 'Paul says even if he is poured out as a drink offering on the sacrifice and service of their faith, he rejoices (Philippians 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 2 suggest about joy and sacrifice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 3, 'How does Philippians 2 portray greatness?', '["Greatness is found in self-humbling obedience and service under God","Greatness belongs to those who seize status aggressively","Greatness is measured by independence from others","Greatness is mainly public recognition before Rome"]'::jsonb, 'Greatness is found in self-humbling obedience and service under God', 'Christ''s path moves through humility and obedience to exaltation, and Paul calls believers to that same selfless mindset (Philippians 2:3-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Philippians 2 portray greatness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 4, 'How does Philippians 2 connect Christ''s humility with the church''s daily relationships?', '["The self-giving mindset of Christ becomes the pattern for unity, lowliness, and mutual concern among believers","Christ\u0027s humility is too unique to shape church life","The chapter separates doctrine from ethics entirely","Only leaders are called to imitate Christ\u0027s mind"]'::jsonb, 'The self-giving mindset of Christ becomes the pattern for unity, lowliness, and mutual concern among believers', 'Paul moves directly from calling for one mind and humility into the example of Christ, showing the practical shape of Christian fellowship (Philippians 2:2-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 2 connect Christ''s humility with the church''s daily relationships?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 4, 'Why does Paul emphasize that Jesus is exalted ''to the glory of God the Father''?', '["Christ\u0027s lordship does not compete with the Father but reveals the Father\u0027s glory","The Father reluctantly shares glory with the Son","The Son is exalted apart from the Father\u0027s purpose","Jesus is Lord only in a lesser sense than God"]'::jsonb, 'Christ''s lordship does not compete with the Father but reveals the Father''s glory', 'Paul says every tongue will confess Jesus Christ as Lord to the glory of God the Father (Philippians 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul emphasize that Jesus is exalted ''to the glory of God the Father''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 4, 'What is the significance of the Philippians shining as lights while holding forth the word of life?', '["Christian holiness and gospel witness belong together in a dark world","Believers should choose either witness or holiness, but not both","The word of life replaces the need for visible conduct","Light refers only to private inward assurance"]'::jsonb, 'Christian holiness and gospel witness belong together in a dark world', 'Paul connects blameless conduct with shining as lights and holding forth the word of life, showing life and message together (Philippians 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of the Philippians shining as lights while holding forth the word of life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 4, 'How does Philippians 2 present Christian leadership through Timothy and Epaphroditus?', '["Leadership is marked by genuine concern, sacrificial service, and willingness to risk oneself for Christ\u0027s work","Leadership is defined mainly by status and recognition","Leaders are those who avoid hardship most effectively","Paul honors them only because of their travel usefulness"]'::jsonb, 'Leadership is marked by genuine concern, sacrificial service, and willingness to risk oneself for Christ''s work', 'Paul highlights Timothy''s genuine concern and Epaphroditus''s nearness to death for Christ''s work as worthy patterns for honor (Philippians 2:20-22, 29-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 2 present Christian leadership through Timothy and Epaphroditus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 4, 'How does Philippians 2 hold together reverence and assurance in obedience?', '["Believers obey with fear and trembling while resting in the fact that God is at work in them","Fear cancels confidence in God\u0027s grace","Assurance eliminates the need for reverent obedience","Paul teaches effort without any divine help"]'::jsonb, 'Believers obey with fear and trembling while resting in the fact that God is at work in them', 'Paul combines the call to work out salvation with fear and trembling and the assurance that God works within believers (Philippians 2:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 2 hold together reverence and assurance in obedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 4, 'Why is the path from humiliation to exaltation central in Philippians 2?', '["It reveals God\u0027s pattern for Christ and shapes the church\u0027s understanding of faithful discipleship","It means believers should seek suffering as an end in itself","It applies only to Jesus and has no ethical meaning","Exaltation comes before obedience in God\u0027s kingdom"]'::jsonb, 'It reveals God''s pattern for Christ and shapes the church''s understanding of faithful discipleship', 'Paul presents Christ''s self-humbling and God''s exaltation of him as the model and ground for the believers'' own humble life together (Philippians 2:5-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the path from humiliation to exaltation central in Philippians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 4, 'What does Philippians 2 imply about God''s pleasure in believers?', '["God\u0027s good pleasure is actively at work shaping both the willing and the doing of his people","God\u0027s pleasure depends on human effort preceding grace","God takes pleasure only in outward success","Believers cannot know anything of God\u0027s pleasure now"]'::jsonb, 'God''s good pleasure is actively at work shaping both the willing and the doing of his people', 'Paul says God works in believers both to will and to work for his good pleasure (Philippians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Philippians 2 imply about God''s pleasure in believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 5, 'How does Philippians 2 present Christ''s lordship in relation to his humility?', '["Christ\u0027s universal lordship is revealed through the path of self-emptying obedience rather than self-assertion","Christ became Lord only after ceasing to serve others","Humility and lordship are opposed in the chapter","The cross delays rather than reveals Christ\u0027s true status"]'::jsonb, 'Christ''s universal lordship is revealed through the path of self-emptying obedience rather than self-assertion', 'Paul presents Christ''s humility unto death and then his exaltation to the name above every name, joining lordship and self-giving obedience (Philippians 2:6-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 2 present Christ''s lordship in relation to his humility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 5, 'Why is the Christ hymn in Philippians 2 foundational for Christian ethics?', '["The moral life of the church is grounded in the identity, action, and pattern of Christ himself","Ethics can be built without any doctrine about Christ","The hymn exists only for liturgical beauty and not instruction","Paul uses Christ merely as an unreachable contrast"]'::jsonb, 'The moral life of the church is grounded in the identity, action, and pattern of Christ himself', 'Paul introduces the hymn precisely to answer how believers should think and act toward one another in humility and love (Philippians 2:2-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the Christ hymn in Philippians 2 foundational for Christian ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 5, 'How does Philippians 2 guard against both pride and passivity?', '["Believers are called to humble service and active obedience, yet all of it is sustained by God\u0027s working within them","Humility means refusing all action and initiative","God\u0027s work makes human obedience irrelevant","Service is valuable only if it is publicly recognized"]'::jsonb, 'Believers are called to humble service and active obedience, yet all of it is sustained by God''s working within them', 'The chapter combines Christlike humility, working out salvation, and God''s inward work, keeping obedience active yet grace-grounded (Philippians 2:3-5, 12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 2 guard against both pride and passivity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 5, 'What does Philippians 2 suggest about the church''s witness before the world?', '["A humble, obedient, united people become lights in darkness by visibly embodying the life of Christ","Witness depends mainly on political influence","Only public preaching counts as witness","The world is changed by argument alone"]'::jsonb, 'A humble, obedient, united people become lights in darkness by visibly embodying the life of Christ', 'Paul calls them to blameless obedience, shining as lights in the world while holding forth the word of life (Philippians 2:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Philippians 2 suggest about the church''s witness before the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 5, 'Why are Timothy and Epaphroditus theologically important in Philippians 2 rather than merely biographical details?', '["They show that the self-giving pattern of Christ is meant to be embodied in ordinary Christian ministry and friendship","They are included only to preserve historical information","Their examples overshadow Christ\u0027s own example","Paul includes them because doctrine alone is unimportant"]'::jsonb, 'They show that the self-giving pattern of Christ is meant to be embodied in ordinary Christian ministry and friendship', 'After the model of Christ, Paul commends Timothy''s genuine care and Epaphroditus''s sacrificial labor as concrete expressions of that same mindset (Philippians 2:19-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why are Timothy and Epaphroditus theologically important in Philippians 2 rather than merely biographical details?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 5, 'How does Philippians 2 unite worship and confession with mission and community life?', '["The confession that Jesus is Lord shapes humility, service, endurance, and the church\u0027s public life together","Confession is purely future and has no present ethical force","Worship matters, but community life does not","Mission replaces the need for shared humility"]'::jsonb, 'The confession that Jesus is Lord shapes humility, service, endurance, and the church''s public life together', 'Paul moves from the universal confession of Jesus'' lordship back into commands about humble obedience, shining witness, and sacrificial service (Philippians 2:11-16, 17-30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 2 unite worship and confession with mission and community life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 2, 5, 'What larger biblical theme is echoed when God highly exalts the one who humbled himself?', '["God overturns human pride by exalting the obedient servant rather than the self-exalting ruler","God exalts whoever grasps power first","Humility delays honor but never relates to it","Exaltation belongs only to angels in Scripture"]'::jsonb, 'God overturns human pride by exalting the obedient servant rather than the self-exalting ruler', 'Philippians 2 presents the Father exalting the Son precisely because of his self-humbling obedience, reflecting God''s consistent opposition to pride and honor of humility (Philippians 2:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger biblical theme is echoed when God highly exalts the one who humbled himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 1, 'According to Philippians 3, in what should the Philippians rejoice?', '["The Lord","Their own righteousness","Their Roman standing","Their outward circumcision"]'::jsonb, 'The Lord', 'Paul says, ''Finally, my brothers, rejoice in the Lord'' (Philippians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 3, in what should the Philippians rejoice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 1, 'According to Philippians 3, who does Paul warn against three times?', '["Dogs","Romans","Sadducees","False prophets in Asia"]'::jsonb, 'Dogs', 'Paul says, ''Beware of the dogs, beware of the evil workers, beware of the false circumcision'' (Philippians 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 3, who does Paul warn against three times?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 1, 'According to Philippians 3, who are the true circumcision?', '["Those who worship by the Spirit of God and glory in Christ Jesus","Those who rely on the flesh","Those who serve Rome\u0027s emperor","Those who boast in temple ritual"]'::jsonb, 'Those who worship by the Spirit of God and glory in Christ Jesus', 'Paul says believers are the circumcision, who worship by the Spirit of God and glory in Christ Jesus and have no confidence in the flesh (Philippians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 3, who are the true circumcision?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 1, 'According to Philippians 3, what tribe was Paul from?', '["Benjamin","Judah","Levi","Ephraim"]'::jsonb, 'Benjamin', 'Paul says he was of the tribe of Benjamin (Philippians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 3, what tribe was Paul from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 1, 'According to Philippians 3, what did Paul once count as gain?', '["Things of the flesh such as his privileges and status","Only his imprisonments","His suffering for Christ alone","The gospel among the nations"]'::jsonb, 'Things of the flesh such as his privileges and status', 'Paul lists his fleshly credentials and says whatever things were gain to him, he counted as loss for Christ (Philippians 3:4-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 3, what did Paul once count as gain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 1, 'According to Philippians 3, where is the believers'' citizenship?', '["In heaven","In Jerusalem only","In Rome","In the wilderness"]'::jsonb, 'In heaven', 'Paul says our citizenship is in heaven, from where we also wait for a Savior, the Lord Jesus Christ (Philippians 3:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 3, where is the believers'' citizenship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 1, 'According to Philippians 3, what will Christ transform?', '["The body of our humiliation","The law of Moses","The throne of Caesar","The temple sacrifices"]'::jsonb, 'The body of our humiliation', 'Paul says Christ will transform the body of our humiliation to be conformed to the body of his glory (Philippians 3:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 3, what will Christ transform?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 2, 'What was Paul according to the law as a Pharisee?', '["Blameless in outward righteousness","Weak in observance","Unknown among his people","Opposed to the traditions"]'::jsonb, 'Blameless in outward righteousness', 'Paul says as to the righteousness which is in the law, he was found blameless (Philippians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was Paul according to the law as a Pharisee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 2, 'What does Paul say he wants to know in Philippians 3?', '["Christ and the power of his resurrection","The secrets of Rome","The names of all the tribes","The full meaning of every vision"]'::jsonb, 'Christ and the power of his resurrection', 'Paul says he wants to know Christ, the power of his resurrection, and the fellowship of his sufferings (Philippians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say he wants to know in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 2, 'What does Paul say he does with the things behind him?', '["Forgets them and reaches forward","Trusts in them for righteousness","Publicly boasts in them","Returns to them for safety"]'::jsonb, 'Forgets them and reaches forward', 'Paul says forgetting the things which are behind, he stretches forward to the things which are before (Philippians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say he does with the things behind him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 2, 'Toward what does Paul press in Philippians 3?', '["The goal for the prize of the high calling of God in Christ Jesus","The throne of Israel","The praise of men","The traditions of his fathers"]'::jsonb, 'The goal for the prize of the high calling of God in Christ Jesus', 'Paul says he presses on toward the goal for the prize of the high calling of God in Christ Jesus (Philippians 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Toward what does Paul press in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 2, 'How does Paul describe many who walk as enemies of the cross of Christ?', '["Their end is destruction, their god is the belly, and their glory is in their shame","They are weak but harmless teachers","They seek only the good of the saints","They live with minds set on heaven"]'::jsonb, 'Their end is destruction, their god is the belly, and their glory is in their shame', 'Paul weeps over those whose end is destruction, whose god is the belly, whose glory is in their shame, and who mind earthly things (Philippians 3:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe many who walk as enemies of the cross of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 2, 'What kind of righteousness does Paul seek in Philippians 3?', '["The righteousness from God by faith","The righteousness from lawkeeping","The righteousness of the Pharisees","The righteousness of Roman virtue"]'::jsonb, 'The righteousness from God by faith', 'Paul wants to be found in Christ, not having his own righteousness from the law, but that which is through faith in Christ, the righteousness from God by faith (Philippians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of righteousness does Paul seek in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 2, 'What does Paul say one thing he does in Philippians 3?', '["Forgetting what is behind and reaching forward to what is ahead","Trusting in the flesh when necessary","Waiting without pressing onward","Returning to the righteousness of the law"]'::jsonb, 'Forgetting what is behind and reaching forward to what is ahead', 'Paul says one thing he does is forget what lies behind and reach forward to what lies ahead (Philippians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say one thing he does in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 3, 'Why does Paul count his former gains as loss in Philippians 3?', '["Because the surpassing worth of knowing Christ makes fleshly confidence worthless by comparison","Because those things were sinful in every possible sense","Because he forgot his former life completely","Because earthly privileges cannot exist under grace"]'::jsonb, 'Because the surpassing worth of knowing Christ makes fleshly confidence worthless by comparison', 'Paul says he counts all things loss for the excellency of the knowledge of Christ Jesus his Lord (Philippians 3:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul count his former gains as loss in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 3, 'What does Paul mean by wanting to be found in Christ?', '["His standing before God is to rest in Christ\u0027s righteousness received by faith, not his own law-based merit","He wants to disappear from public life","He seeks mystical union without ethical consequences","He rejects bodily resurrection in favor of a spiritual ideal"]'::jsonb, 'His standing before God is to rest in Christ''s righteousness received by faith, not his own law-based merit', 'Paul contrasts his own righteousness from the law with the righteousness from God by faith in Christ (Philippians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by wanting to be found in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 3, 'Why does Paul speak of sharing Christ''s sufferings in Philippians 3?', '["Knowing Christ includes conformity to his pattern of suffering and resurrection hope","Suffering itself earns resurrection life","Paul prefers pain to fellowship with Christ","The resurrection can be known without union with Christ"]'::jsonb, 'Knowing Christ includes conformity to his pattern of suffering and resurrection hope', 'Paul wants to know Christ, the power of his resurrection, and the fellowship of his sufferings, becoming conformed to his death (Philippians 3:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul speak of sharing Christ''s sufferings in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 3, 'What does Philippians 3 teach about spiritual maturity?', '["Maturity does not mean arrival but pressing forward under God\u0027s continuing guidance","The mature have no need for further growth","Maturity consists in confidence in religious pedigree","Paul says only apostles can be mature"]'::jsonb, 'Maturity does not mean arrival but pressing forward under God''s continuing guidance', 'Paul says he has not already obtained the goal but presses on, and then tells the mature to have this same mind, trusting God to reveal what is needed (Philippians 3:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 3 teach about spiritual maturity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 3, 'How does heavenly citizenship shape life in Philippians 3?', '["Believers live with their identity and hope oriented toward Christ\u0027s return rather than earthly-minded living","Citizenship in heaven removes concern for bodily resurrection","Heavenly citizenship means escape from present obedience","Paul contrasts heaven only with Rome, not with all earthly-mindedness"]'::jsonb, 'Believers live with their identity and hope oriented toward Christ''s return rather than earthly-minded living', 'Paul contrasts those who mind earthly things with believers whose citizenship is in heaven and who wait for the Savior (Philippians 3:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does heavenly citizenship shape life in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 3, 'Why does Paul call believers to imitate him and others who walk by the same pattern?', '["Embodied examples help the church discern faithful life over against destructive alternatives","Paul wants personal devotion that excludes Christ","Patterned discipleship is unnecessary in Christian life","Only Paul\u0027s past credentials make him worth imitating"]'::jsonb, 'Embodied examples help the church discern faithful life over against destructive alternatives', 'Paul urges them to imitate him and observe those walking by that pattern, especially because many walk as enemies of the cross (Philippians 3:17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul call believers to imitate him and others who walk by the same pattern?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 3, 'What does Philippians 3 reveal about confidence in the flesh?', '["Even the strongest religious pedigree cannot rival the worth of Christ as a basis for righteousness","Confidence in the flesh is harmless if one also believes in Christ","Paul\u0027s pedigree remained his main boast after conversion","Fleshly confidence applies only to Gentiles"]'::jsonb, 'Even the strongest religious pedigree cannot rival the worth of Christ as a basis for righteousness', 'Paul piles up his credentials precisely to show that even he must abandon them as grounds for confidence before God (Philippians 3:4-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 3 reveal about confidence in the flesh?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 4, 'How does Philippians 3 connect justification and sanctification?', '["Paul receives righteousness by faith and then presses forward in living conformity to Christ","Sanctification replaces the need for righteousness by faith","Justification makes pursuit of holiness unnecessary","Paul separates knowing Christ from moral transformation"]'::jsonb, 'Paul receives righteousness by faith and then presses forward in living conformity to Christ', 'Paul seeks righteousness from God by faith and then speaks of knowing Christ, sharing his sufferings, and pressing on toward the goal (Philippians 3:9-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 3 connect justification and sanctification?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 4, 'Why does Paul combine warning against false confidence with longing for resurrection glory in Philippians 3?', '["Only by losing confidence in the flesh can believers gain the true future found in Christ","Resurrection glory comes through religious status","Paul treats warning and hope as unrelated subjects","Future glory belongs mainly to those with Jewish pedigree"]'::jsonb, 'Only by losing confidence in the flesh can believers gain the true future found in Christ', 'Paul rejects fleshly gain and then describes knowing Christ, attaining resurrection, and waiting for bodily transformation from the Savior (Philippians 3:7-11, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul combine warning against false confidence with longing for resurrection glory in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 4, 'What is the force of Paul''s statement that he has not already been made perfect?', '["Christian maturity is marked by humble pursuit rather than complacent self-satisfaction","Perfection is impossible and therefore not worth pursuing","Paul doubts the truth of the gospel","Only the Philippians are called to grow"]'::jsonb, 'Christian maturity is marked by humble pursuit rather than complacent self-satisfaction', 'Paul says he has not already obtained or been made perfect, but presses on because Christ Jesus laid hold of him (Philippians 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the force of Paul''s statement that he has not already been made perfect?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 4, 'How does Philippians 3 portray the Christian life as both present pursuit and future hope?', '["Believers press on now in Christ while waiting for the Savior who will transform them at his coming","The future removes the need for present striving","Present striving replaces all need for future hope","Paul speaks only of inward transformation, not bodily hope"]'::jsonb, 'Believers press on now in Christ while waiting for the Savior who will transform them at his coming', 'Paul speaks of pressing toward the prize now and then of waiting from heaven for Christ to transform the body of humiliation (Philippians 3:14, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 3 portray the Christian life as both present pursuit and future hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 4, 'What does Philippians 3 imply about the church''s discernment of teachers and examples?', '["The church must distinguish between patterns of life shaped by the cross and patterns ruled by earthly desire","Examples are irrelevant if doctrine sounds correct","All leaders are equally safe to imitate","Cross-shaped living matters less than rhetorical skill"]'::jsonb, 'The church must distinguish between patterns of life shaped by the cross and patterns ruled by earthly desire', 'Paul tells them to watch those who walk by the apostolic pattern and warns of others whose lives show hostility to the cross (Philippians 3:17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Philippians 3 imply about the church''s discernment of teachers and examples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 4, 'How does Philippians 3 relate resurrection to present discipleship?', '["Hope of resurrection shapes present pursuit, suffering, and conformity to Christ","Resurrection is future only and has no effect on present life","Present discipleship earns resurrection as wages","Paul cares only about the soul, not the body"]'::jsonb, 'Hope of resurrection shapes present pursuit, suffering, and conformity to Christ', 'Paul seeks the resurrection while describing present fellowship in Christ''s sufferings and a life of pressing on toward the goal (Philippians 3:10-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 3 relate resurrection to present discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 4, 'Why does Paul contrast earthly-minded enemies of the cross with heavenly citizenship?', '["He wants the church\u0027s desires, loyalties, and future hope to be shaped by Christ rather than by appetite and shame","He means believers should despise creation itself","Paul rejects all concern for earthly obedience","Citizenship in heaven abolishes bodily resurrection"]'::jsonb, 'He wants the church''s desires, loyalties, and future hope to be shaped by Christ rather than by appetite and shame', 'Paul contrasts those whose god is the belly and who mind earthly things with believers who await the Savior from heaven (Philippians 3:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul contrast earthly-minded enemies of the cross with heavenly citizenship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 5, 'How does Philippians 3 redefine covenant identity over against fleshly markers?', '["True covenant identity is found in Spirit-wrought worship, boasting in Christ, and righteousness by faith rather than outward credentials","Covenant identity depends mainly on tribe and circumcision","Paul rejects every form of Jewish identity as evil in itself","Faith in Christ adds to fleshly confidence without replacing it"]'::jsonb, 'True covenant identity is found in Spirit-wrought worship, boasting in Christ, and righteousness by faith rather than outward credentials', 'Paul says believers are the true circumcision and contrasts that with confidence in fleshly credentials, which he counts loss for Christ (Philippians 3:3-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 3 redefine covenant identity over against fleshly markers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 5, 'Why is Paul''s language of gain and loss theologically important in Philippians 3?', '["It shows conversion as a radical revaluation in which Christ becomes the supreme treasure over every former advantage","It means created goods have no value at all","It treats the gospel mainly as a financial metaphor with little spiritual meaning","Paul wants believers to despise all memory of their past"]'::jsonb, 'It shows conversion as a radical revaluation in which Christ becomes the supreme treasure over every former advantage', 'Paul deliberately takes what once counted as gain and recasts it as loss because of the surpassing value of Christ (Philippians 3:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s language of gain and loss theologically important in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 5, 'What does Philippians 3 imply about the shape of Christian hope?', '["Christian hope is bodily, Christ-centered, and bound to the transforming power of the risen Lord","Hope concerns only escape from the body forever","The future is secured through human religious achievement","Paul offers only vague spiritual optimism"]'::jsonb, 'Christian hope is bodily, Christ-centered, and bound to the transforming power of the risen Lord', 'Paul says believers await the Savior from heaven, who will transform their lowly body to be like his glorious body by his powerful working (Philippians 3:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Philippians 3 imply about the shape of Christian hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 5, 'How does Philippians 3 keep the pursuit of holiness from turning back into legalism?', '["The whole pursuit flows from having been laid hold of by Christ and from receiving righteousness by faith","Paul replaces grace with a new law of striving","Holiness is pursued without any relation to Christ\u0027s prior work","Pressing on means returning to confidence in the flesh"]'::jsonb, 'The whole pursuit flows from having been laid hold of by Christ and from receiving righteousness by faith', 'Paul presses on not to earn Christ but because Christ Jesus laid hold of him, and he seeks righteousness from God by faith (Philippians 3:9, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 3 keep the pursuit of holiness from turning back into legalism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 5, 'Why does Paul speak with tears about enemies of the cross in Philippians 3?', '["His warning is pastoral and grieving, not merely polemical, because false ways of life destroy people","Paul enjoys condemning opponents publicly","Tears mean he is uncertain about the gospel","He weeps because heavenly citizenship has no present meaning"]'::jsonb, 'His warning is pastoral and grieving, not merely polemical, because false ways of life destroy people', 'Paul says he has told them often and now says even weeping that many walk as enemies of the cross, showing deep pastoral sorrow (Philippians 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul speak with tears about enemies of the cross in Philippians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 5, 'How does Philippians 3 portray the cross as a dividing line in human life?', '["The cross separates those who glory in Christ and live by resurrection hope from those ruled by earthly appetite and shame","The cross is important only for Paul\u0027s private spirituality","Everyone relates to the cross in the same way regardless of life direction","The cross abolishes the need for discernment about how one walks"]'::jsonb, 'The cross separates those who glory in Christ and live by resurrection hope from those ruled by earthly appetite and shame', 'Paul contrasts those who reject the way of the cross with believers who count all loss for Christ and await transformation from him (Philippians 3:8-11, 18-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 3 portray the cross as a dividing line in human life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 3, 5, 'What deeper point lies behind Paul''s refusal to call himself already perfected?', '["Union with Christ creates confident striving, not self-congratulation, until final resurrection completeness","Paul believes growth in grace is impossible","Perfection belongs only to angels and never to redeemed humanity","The Christian life has no future goal beyond initial conversion"]'::jsonb, 'Union with Christ creates confident striving, not self-congratulation, until final resurrection completeness', 'Paul presses on because Christ has laid hold of him, yet he admits he has not already attained the fullness toward which he moves (Philippians 3:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper point lies behind Paul''s refusal to call himself already perfected?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 1, 'According to Philippians 4, whom does Paul urge to be of the same mind in the Lord?', '["Euodia and Syntyche","Lydia and Chloe","Priscilla and Phoebe","Lois and Eunice"]'::jsonb, 'Euodia and Syntyche', 'Paul urges Euodia and Syntyche to think the same way in the Lord (Philippians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 4, whom does Paul urge to be of the same mind in the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 1, 'According to Philippians 4, in whom should believers always rejoice?', '["The Lord","Themselves","Their leaders","Their circumstances"]'::jsonb, 'The Lord', 'Paul says, ''Rejoice in the Lord always'' (Philippians 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 4, in whom should believers always rejoice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 1, 'According to Philippians 4, what should be known to all men?', '["Your gentleness","Your learning","Your Roman status","Your self-confidence"]'::jsonb, 'Your gentleness', 'Paul says, ''Let your gentleness be known to all men'' (Philippians 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 4, what should be known to all men?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 1, 'According to Philippians 4, what will guard believers'' hearts and thoughts in Christ Jesus?', '["The peace of God","The strength of Rome","Their own discipline alone","The wisdom of philosophers"]'::jsonb, 'The peace of God', 'Paul says the peace of God will guard their hearts and thoughts in Christ Jesus (Philippians 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 4, what will guard believers'' hearts and thoughts in Christ Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 1, 'According to Philippians 4, what has Paul learned in whatever state he is in?', '["To be content","To seek more influence","To avoid all need","To mistrust his friends"]'::jsonb, 'To be content', 'Paul says he has learned in whatever state he is in to be content (Philippians 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 4, what has Paul learned in whatever state he is in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 1, 'According to Philippians 4, through whom can Paul do all things?', '["Through Christ who strengthens him","Through his own willpower","Through Caesar\u0027s favor","Through the help of every church"]'::jsonb, 'Through Christ who strengthens him', 'Paul says, ''I can do all things through Christ, who strengthens me'' (Philippians 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 4, through whom can Paul do all things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 1, 'According to Philippians 4, whose household especially sends greetings?', '["Caesar\u0027s household","The household of Annas","The house of Lydia","The house of Aquila"]'::jsonb, 'Caesar''s household', 'Paul says all the saints greet them, especially those of Caesar''s household (Philippians 4:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Philippians 4, whose household especially sends greetings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 2, 'How does Paul say believers should make their requests known to God?', '["By prayer and supplication with thanksgiving","By anxiety and haste","By silence without asking","By appealing first to Rome"]'::jsonb, 'By prayer and supplication with thanksgiving', 'Paul tells them to present their requests to God by prayer and supplication with thanksgiving (Philippians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul say believers should make their requests known to God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 2, 'What kinds of things does Paul tell believers to think about in Philippians 4?', '["Things that are true, honorable, just, pure, lovely, and of good report","Things that stir envy and rivalry","Things that preserve fear of opponents","Things that magnify earthly status"]'::jsonb, 'Things that are true, honorable, just, pure, lovely, and of good report', 'Paul lists true, honorable, just, pure, lovely, and commendable things as the focus of believers'' thought (Philippians 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kinds of things does Paul tell believers to think about in Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 2, 'What does Paul say the Philippians did well in Philippians 4?', '["They had fellowship with his affliction","They avoided every cost of gospel work","They forgot him in prison","They kept their gifts for themselves"]'::jsonb, 'They had fellowship with his affliction', 'Paul says they did well to have fellowship with his affliction (Philippians 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say the Philippians did well in Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 2, 'What kind of offering does Paul call the Philippians'' gift?', '["A sweet-smelling fragrance, an acceptable sacrifice, well pleasing to God","A legal obligation under the old covenant","A burden that Paul resented receiving","A political tribute to Rome"]'::jsonb, 'A sweet-smelling fragrance, an acceptable sacrifice, well pleasing to God', 'Paul describes their gift with sacrificial language as a fragrant offering pleasing to God (Philippians 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of offering does Paul call the Philippians'' gift?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 2, 'How will God supply the Philippians'' need according to Philippians 4?', '["According to his riches in glory in Christ Jesus","According to Rome\u0027s treasury","According to their own strength","According to the law of exchange"]'::jsonb, 'According to his riches in glory in Christ Jesus', 'Paul says God will supply every need according to his riches in glory in Christ Jesus (Philippians 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How will God supply the Philippians'' need according to Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 2, 'What does Paul say he has learned how to do both in Philippians 4?', '["To be abased and to abound","To conquer and to retreat","To preach and to remain silent","To labor and to stop serving"]'::jsonb, 'To be abased and to abound', 'Paul says he knows how to be abased and also how to abound (Philippians 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say he has learned how to do both in Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 2, 'When did the Philippians alone have fellowship with Paul in giving and receiving?', '["In the beginning of the gospel when he departed from Macedonia","Only after he arrived in Rome","At the council in Jerusalem","When he first met Timothy"]'::jsonb, 'In the beginning of the gospel when he departed from Macedonia', 'Paul says that in the beginning of the gospel, when he departed from Macedonia, no assembly had fellowship with him in giving and receiving but the Philippians only (Philippians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'When did the Philippians alone have fellowship with Paul in giving and receiving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 3, 'What does Philippians 4 teach about anxiety and prayer?', '["Anxiety is answered not by denial but by prayerful dependence and thanksgiving before God","Prayer matters only after anxiety has disappeared","Anxiety is solved mainly by self-mastery","Thanksgiving is optional when asking God for help"]'::jsonb, 'Anxiety is answered not by denial but by prayerful dependence and thanksgiving before God', 'Paul commands them not to be anxious but to bring everything to God in prayer with thanksgiving, promising God''s peace (Philippians 4:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 4 teach about anxiety and prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 3, 'Why does Paul pair right thinking with right practice in Philippians 4?', '["The Christian life involves both disciplined thought and embodied obedience under God\u0027s presence","Thought matters, but practice does not","Practice alone can replace truth","The mind should remain detached from discipleship"]'::jsonb, 'The Christian life involves both disciplined thought and embodied obedience under God''s presence', 'Paul tells believers to think on what is excellent and then to do what they learned and saw in him, promising the God of peace will be with them (Philippians 4:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul pair right thinking with right practice in Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 3, 'What does Paul''s contentment in Philippians 4 reveal about Christian strength?', '["True strength is Christ-given steadiness in abundance and need alike","Contentment means passivity and lack of effort","Strength is measured by material comfort","Paul\u0027s contentment came from having no real needs"]'::jsonb, 'True strength is Christ-given steadiness in abundance and need alike', 'Paul says he has learned contentment in every circumstance and can do all things through Christ who strengthens him (Philippians 4:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s contentment in Philippians 4 reveal about Christian strength?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 3, 'Why does Paul say he seeks not the gift but the fruit that increases to the Philippians'' account?', '["He values the spiritual fruit of their generosity more than personal benefit","He no longer wants their partnership","Financial gifts are unimportant to God","He is ashamed of receiving any help"]'::jsonb, 'He values the spiritual fruit of their generosity more than personal benefit', 'Paul says he seeks not the gift itself, but the fruit that increases to their account, emphasizing its spiritual value (Philippians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say he seeks not the gift but the fruit that increases to the Philippians'' account?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 3, 'What does Philippians 4 imply about the peace of God?', '["God\u0027s peace actively guards the inner life of believers in Christ beyond normal human calculation","Peace means the absence of every external problem","Peace comes only when believers understand every circumstance","Peace belongs only to those without needs"]'::jsonb, 'God''s peace actively guards the inner life of believers in Christ beyond normal human calculation', 'Paul says the peace of God, which surpasses all understanding, will guard hearts and thoughts in Christ Jesus (Philippians 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Philippians 4 imply about the peace of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 3, 'How does Philippians 4 portray Christian generosity?', '["Generosity is fellowship in gospel affliction and a sacrifice pleasing to God","Giving is merely practical bookkeeping","Generosity matters only when the church is wealthy","Paul sees gifts as interruptions to ministry"]'::jsonb, 'Generosity is fellowship in gospel affliction and a sacrifice pleasing to God', 'Paul calls their support fellowship in his affliction and later describes their gift as an acceptable sacrifice well pleasing to God (Philippians 4:14, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Philippians 4 portray Christian generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 3, 'Why is gentleness important in Philippians 4?', '["It reflects a near Lord and a life freed from self-protective anxiety","It is useful only in private prayer","It means never correcting anyone","It applies only to leaders in conflict"]'::jsonb, 'It reflects a near Lord and a life freed from self-protective anxiety', 'Paul links gentleness with the statement ''The Lord is at hand'' and then calls believers away from anxiety to prayerful trust (Philippians 4:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is gentleness important in Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 4, 'How does Philippians 4 connect prayer, peace, and practice?', '["Prayer brings God\u0027s peace to guard believers, and obedient practice brings the presence of the God of peace","Peace comes only from right thinking without prayer","Practice matters, but peace and prayer are separate topics","The chapter treats peace as a merely inward emotion"]'::jsonb, 'Prayer brings God''s peace to guard believers, and obedient practice brings the presence of the God of peace', 'Paul first promises the peace of God through prayer and then says the God of peace will be with those who practice what they learned (Philippians 4:6-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 4 connect prayer, peace, and practice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 4, 'What does Philippians 4 suggest about the relationship between rejoicing and hardship?', '["Rejoicing in the Lord is possible even amid need, conflict, and imprisonment because it is anchored in Christ rather than circumstances","Joy is possible only after problems are solved","Hardship and joy are always mutually exclusive","Paul commands joy without giving any reason for it"]'::jsonb, 'Rejoicing in the Lord is possible even amid need, conflict, and imprisonment because it is anchored in Christ rather than circumstances', 'Paul commands rejoicing while discussing anxiety, need, and his own imprisonment background, showing a joy rooted in the Lord himself (Philippians 4:4, 11-13, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Philippians 4 suggest about the relationship between rejoicing and hardship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 4, 'Why is Paul''s language about learning contentment significant in Philippians 4?', '["Contentment is portrayed as a grace-taught discipline of life in Christ, not a natural temperament","Paul was born content and never faced real need","Contentment comes through indifference to people","The chapter teaches contentment without dependence on Christ"]'::jsonb, 'Contentment is portrayed as a grace-taught discipline of life in Christ, not a natural temperament', 'Paul repeatedly says he has learned contentment and learned the secret of living in many conditions through Christ''s strength (Philippians 4:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Paul''s language about learning contentment significant in Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 4, 'How does Philippians 4 frame material support within the gospel?', '["Material giving is interpreted as gospel partnership, spiritual fruit, and worshipful sacrifice before God","Financial support is treated as morally neutral logistics only","Paul rejects all gifts as distractions from ministry","Only very large gifts have spiritual significance"]'::jsonb, 'Material giving is interpreted as gospel partnership, spiritual fruit, and worshipful sacrifice before God', 'Paul speaks of the Philippians'' support as fellowship, fruit to their account, and a fragrant offering pleasing to God (Philippians 4:14-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 4 frame material support within the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 4, 'How does Philippians 4 portray the nearness of the Lord as practical truth?', '["The Lord\u0027s nearness shapes gentleness, steadies prayer, and frees believers from anxious self-protection","The Lord\u0027s nearness makes prayer unnecessary","It refers only to a distant future event with no present effect","It encourages passivity rather than action"]'::jsonb, 'The Lord''s nearness shapes gentleness, steadies prayer, and frees believers from anxious self-protection', 'Paul places ''The Lord is at hand'' right between the command to let gentleness be known and the call to reject anxiety through prayer (Philippians 4:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 4 portray the nearness of the Lord as practical truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 4, 'What does Philippians 4 imply about the relation between thought life and holiness?', '["Holy living requires disciplined attention to what is true and excellent, not mental passivity","The mind is unimportant if actions look correct","Only mystical experiences matter for holiness","Paul treats thought as morally neutral"]'::jsonb, 'Holy living requires disciplined attention to what is true and excellent, not mental passivity', 'Paul commands believers to think on what is true, honorable, just, pure, lovely, and commendable, linking thought to faithful practice (Philippians 4:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Philippians 4 imply about the relation between thought life and holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 4, 'How does Philippians 4 connect reconciliation and worship in the life of the church?', '["Agreement in the Lord belongs alongside rejoicing, prayer, and shared worship as part of mature church life","Conflict has no effect on the church\u0027s spiritual life","Worship matters more than restored relationships","Paul treats Euodia and Syntyche as unrelated to the chapter\u0027s main themes"]'::jsonb, 'Agreement in the Lord belongs alongside rejoicing, prayer, and shared worship as part of mature church life', 'Paul begins the chapter by urging Euodia and Syntyche to agree in the Lord and then moves into commands about rejoicing, gentleness, prayer, and peace (Philippians 4:2-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philippians 4 connect reconciliation and worship in the life of the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 5, 'How does Philippians 4 present Christian peace as more than emotional calm?', '["Peace is God\u0027s active guarding presence over the believer\u0027s inner life within prayerful communion with Christ","Peace is merely a self-generated state of mind","Peace means the end of all practical responsibilities","Peace comes only after full understanding of every circumstance"]'::jsonb, 'Peace is God''s active guarding presence over the believer''s inner life within prayerful communion with Christ', 'Paul describes the peace of God as guarding hearts and thoughts in Christ Jesus in response to prayer and thanksgiving (Philippians 4:6-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 4 present Christian peace as more than emotional calm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 5, 'Why is Paul''s statement ''I can do all things through Christ who strengthens me'' best read in the context of Philippians 4?', '["It concerns Christ-enabled endurance and faithfulness across every circumstance of need and abundance","It promises unlimited success in any chosen ambition","It refers only to miraculous feats in ministry","It means believers never experience weakness"]'::jsonb, 'It concerns Christ-enabled endurance and faithfulness across every circumstance of need and abundance', 'Paul says this immediately after describing contentment in hunger, fullness, abundance, and need, so the statement concerns Christ''s sustaining strength in all conditions (Philippians 4:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s statement ''I can do all things through Christ who strengthens me'' best read in the context of Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 5, 'How does Philippians 4 tie generosity to worship?', '["The Philippians\u0027 financial gift becomes priestly language of sacrifice because gospel giving is an act offered to God","Giving is valuable only for its financial efficiency","Worship and generosity belong to separate spheres","Paul rejects sacrificial language after Christ\u0027s coming"]'::jsonb, 'The Philippians'' financial gift becomes priestly language of sacrifice because gospel giving is an act offered to God', 'Paul calls their gift a fragrant aroma, an acceptable sacrifice, well pleasing to God, showing generosity as worshipful offering (Philippians 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 4 tie generosity to worship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 5, 'What does Philippians 4 suggest about the connection between God''s provision and the believer''s generosity?', '["The God who receives generous sacrifice from his people is also the God who richly supplies their need in Christ","Giving forces God into debt to believers","Provision is unrelated to life in Christ","God supplies only material abundance, never spiritual need"]'::jsonb, 'The God who receives generous sacrifice from his people is also the God who richly supplies their need in Christ', 'After describing their gift as pleasing to God, Paul assures them that his God will supply every need according to his riches in glory in Christ Jesus (Philippians 4:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Philippians 4 suggest about the connection between God''s provision and the believer''s generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 5, 'How does Philippians 4 gather the letter''s larger theology into its closing chapter?', '["Joy, unity, prayer, peace, Christ-sufficiency, partnership, and grace all reappear as the mature life of the church","The chapter abandons the themes developed earlier in the letter","Only practical advice remains after doctrine ends","The conclusion depends mainly on Caesar\u0027s household for its meaning"]'::jsonb, 'Joy, unity, prayer, peace, Christ-sufficiency, partnership, and grace all reappear as the mature life of the church', 'Philippians 4 revisits joy in the Lord, agreement in the Lord, prayerful peace, Christ''s strength, gospel partnership in giving, and grace in the final blessing (Philippians 4:2-4, 6-7, 13-19, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 4 gather the letter''s larger theology into its closing chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 5, 'Why is the greeting from Caesar''s household significant in Philippians 4?', '["It quietly testifies that Christ\u0027s reign reaches into the very center of imperial power structures","It means the church has become politically dominant in Rome","It proves Paul now serves Caesar rather than Christ","It matters only as a personal travel note"]'::jsonb, 'It quietly testifies that Christ''s reign reaches into the very center of imperial power structures', 'The mention of saints from Caesar''s household fittingly closes a letter where imprisonment has served gospel advance, showing Christ''s work reaching even the imperial sphere (Philippians 1:12-13; 4:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the greeting from Caesar''s household significant in Philippians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 50, 4, 5, 'How does Philippians 4 present Christ-sufficiency without encouraging self-sufficiency?', '["Paul\u0027s contentment is real, but it is explicitly sustained by Christ\u0027s strength rather than by autonomous inner resources","Contentment means believers no longer need God or others","Paul teaches that spiritual maturity eliminates all dependence","The chapter praises Stoic self-mastery over grace"]'::jsonb, 'Paul''s contentment is real, but it is explicitly sustained by Christ''s strength rather than by autonomous inner resources', 'Paul has learned contentment, yet he immediately attributes his ability to endure all circumstances to Christ who strengthens him (Philippians 4:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 50
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Philippians 4 present Christ-sufficiency without encouraging self-sufficiency?'
);

